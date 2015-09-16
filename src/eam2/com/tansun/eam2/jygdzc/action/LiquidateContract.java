package com.tansun.eam2.jygdzc.action;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.rdp4j.common.util.DateUtils;

/**
 * 对合同进行清算的功能类定义,这个类被LiquidateHeaderAction类所调用 这个类是一个功能性的类,放在那个包里面无所谓
 * 不过需要调用UCC层所定义的功能,所以出于层次定义的需要,放在Action包中.
 * 
 * @author 刘峻松
 * 
 */
@Service
public class LiquidateContract {

	@Autowired
	public IContractUCC contractUCCImpl;

	/**
	 * 合同清算功能总入口,这个方法是Action调用的总入口之一,这个方法用来清算清算单据上的 一个合同
	 * 
	 * @param headId
	 *            清算单ID
	 * @param bodyId
	 *            清算单BodyId
	 * @param contractId
	 *            要清算的合同编号
	 * @param qsjsrq
	 *            清算结束日期
	 */
	public String liquidateSingle(String headId, String bodyId,
			String contractId, Date qsjsrq, boolean flag) {
		// Step0:输入参数的判断校验
		if (headId == null)
			return "";
		//if (bodyId == null)           // modify by lantianbo 2010-12-25
		//	return "";
		if (contractId == null)
			return "";
		if (qsjsrq == null)
			return "";
		JjzcHtZlwg ht = contractUCCImpl.getJjzcHtZlwgByHtbh(contractId);
		// step1:首先进行必要的逻辑判断
		// 当前清算单上能够清算的合同的基本条件是:
		// 一个合同同时不能被两个清算记录共享.
		// 如果出现一个合同在两张清算单同时清算的情况,会造成数据混乱
		// 如果出现一个合同在一张清算单上多次清算的情况,那么如果删除前面的清算记录,
		// 后面对应的清算记录将无法处理.
		// 为避免这方面的逻辑混乱和冲突,此处假定一个合同只能处于一次清算之中.
		// 在此次清算被审批通过,或者被删除,终止之前,此合同被锁住,其余清算不可进入.
		//if (!checkContractLock(bodyId, ht, flag)) {			// modify by lantianbo 2010-12-25		
		//	return ""; // 合同清算加锁失败,返回
		//}

		// step2:得到合同的开始计算日期D1,参阅对应的设计文档
		Date htksrq = null, csqsrq = null, scqsrq = null; // 三个日期,合同开始日期,合同初始化清算结束日期,上次清算结束日期
		// 从合同表上得到对应的三个日期
		htksrq = ht.getHtqsrq();
		scqsrq = ht.getScqsrq();
		Date D1 = getD1(htksrq, csqsrq, scqsrq);
		if (D1 == null) {
			return ""; // 计算合同开始计算日期失败,返回
		}
//		System.out.println("D1:"+D1);
		
		// Step3:根据合同开始计算日期,考虑合同免租期,计算合同清算计算开始日期D2
		Date mzksrq = null;
		Date mzjsrq = null;
		// 从合同表上得到合同的免租期设置
		mzksrq = ht.getMzqsrq();
		mzjsrq = ht.getMzdqrq();
		Date D2 = getD2(D1, mzjsrq);

		Date D3 = qsjsrq;

		// 判断是否是反向计算过程.
		boolean fxjsFlag = false;
		if (D3.before(D1)) {// 是反向计算过程,调换数据
			fxjsFlag = true;
			Date dtemp = D1;
			D1 = D3;
			D3 = dtemp;
			D3 = DateUtils.dateDayAdd(D3, -1);
		}

		// Step4:执行分段租金的时间切分算法,根据分段租金的设定条件
		// 将整个从D2-D3的时间段,切分成为多段.各个时间段均包括开始和结束日期
		// 确保每个时间段的租金价格是一致的.
		List fdList = new ArrayList();
		// 从后台数据库检索分段租金数据列表,存放在一个Map组成的List中.
		// 其中存放的数据分别为fdbegin,开始分段时间fdend 结束分段时间 fdmoney分段的月租金
		fdList = contractUCCImpl.getJjzcHtJdzjByHtId(ht.getId());

		List fdretList = getCutDateList(D1, D3, fdList,mzksrq,mzjsrq); // 进行分段的时间段切分

		// Step5:针对已经计算好的时间分段,逐段计算其实际租金
		// 输入:fdretList中的Map,其中包含了开始日期和结束日期
		// 输出:在Map中插入新数据"monthRent",代表计算出的月租金,
		// "days",代表计算出的天数
		// "rentMoney",代表结算出的实际租金
		double fixMonthRent = ht.getYzj();
		// 从合同表中取的固定月租金.
		computeFDRent(fdretList, fdList, fixMonthRent);

		// Step5: 将结果写入后台数据库表中
		// 记录租金计算明细
		// 记录合同清算的记录,更新清算开始日期D1,清算结束日期,清算金额.
		// 计算清算金额之时,需要考虑是否是反向计算的问题,如果是清算金额
		double totalRent = 0;
		int i = 0;
		for (i = 0; i < fdretList.size(); i++) {
			Map m1 = (Map) fdretList.get(i);
//			System.out.println("compute result: " + (Date) m1.get("beginDate")
//					+ "-" + (Date) m1.get("endDate"));
//			System.out.println(" monthrent: " + (Double) m1.get("monthRent")
//					+ " Days= " + (Integer)m1.get("days")
//					+ " money: " + (Double) m1.get("rentMoney"));

			totalRent = totalRent
					+ Double.valueOf(String.valueOf(m1.get("rentMoney")==null?"0.0":m1.get("rentMoney")));
		}

		if (fxjsFlag) {// 如果是反向计算,将计算得到的数据计为负数.
			totalRent = totalRent * (-1);
		}
		//JyzcHtqsBody body = contractUCCImpl.getJyzcHtqsBodyById(bodyId); // modify by lantianbo 2010-12-25	
		//body.setQsjzrq(qsjsrq);
		//body.setYszj(totalRent);
		//if (flag) {
		//	contractUCCImpl.update(body);
		//}
		return String.valueOf(totalRent);
	}

	// -------------------------------------------------------------------------------//
	// -----------------下面是调用的子程序-------------------------------------.ll----------//
	// -------------------------------------------------------------------------------//

	/**
	 * 检查当前合同表记录的清算加锁字段条件 step1:利用当前的bodyId,在合同表上进行清算加锁处理 加锁条件:
	 * 合同对应的清算BodyId为空,空字符串,或者为当前bodyId 这种情况下,合同表加锁成功,返回true
	 * 如果对应的合同已经被其他记录所锁住,则返回失败,终止对于这个合同的清算过程 合同的清算记录锁在如下条件下释放:
	 * 清算结果表审批通过,则释放所有对应body中合同的清算锁,并更新合同表中的上次清算结束日期字段
	 * 清算结果表审批不通过,则释放对应所有body中合同的清算锁,不更新其他字段
	 * 清算结果表被删除(草稿状态下),则释放所有对应所有body中合同的清算锁.
	 * 
	 * @param bodyId
	 * @param contractId
	 * @return
	 */
	private boolean checkContractLock(String bodyId, JjzcHtZlwg ht, boolean flag) {
		// step0:判断输入参数的合法性
		if (bodyId == null || bodyId.length() < 1) {
			return false;
		}
		if (ht.getHtbh() == null || ht.getHtbh().length() < 1) {
			return false;
		}

		// step1: 从合同表中检索合同记录
		// 检索后台数据库,设置下面的contract_bodyIdLock字段值

		String contract_bodyIdLock = ht.getBodyidlock(); // 从合同表中为此记录得到对应值,合同表中要增加字段
		// step2:判断其中的合同清算锁字段
		if (contract_bodyIdLock == null) {
			contract_bodyIdLock = ""; // 去掉NULL值的判断
		} else {
			contract_bodyIdLock = contract_bodyIdLock.trim();// 去空格
		}

		if (contract_bodyIdLock.equals("")
				|| contract_bodyIdLock.equals(bodyId)) {
			ht.setBodyidlock(bodyId);
			if (flag) {
				this.contractUCCImpl.update(ht);
			}

			return true;
		} else {
			log("LiquidateContract.checkContractLock调用返回失败,合同已加缩"
					+ ht.getHtbh());
			return false;
		}
	}

	private void log(String s) {
		// 程序调试状态下,输出到控制台,生产环境注释掉
	}

	/**
	 * 将合同的开始日期,初始化清算结束日期,上次清算结束日期三个数据进行比较,得到
	 * 
	 * @return
	 */
	public Date getD1(Date htksrq, Date csqsrq, Date scqsrq) {
		// step0:判断输入参数的合法性,如果不合法,直接停止执行,返回null
		if (htksrq == null) {
			log("合同开始日期为空值,停止执行");
			return null;
		}

		// step1:比较三个数据,得到本次清算开始日期
		Date retDate = htksrq;
		if (csqsrq != null) {
			if (csqsrq.after(retDate)) {
				retDate = csqsrq;
			}
		}

		if (scqsrq != null) {
			if (scqsrq.after(retDate)) {
				retDate = scqsrq;
			}
		}

		// 判断日期是否需要加1天,作为开始日期
		// 如果不是合同开始日期,则加1天
		if (retDate.after(htksrq)) {
			retDate = DateUtils.dateDayAdd(retDate, 1);
		}
		return retDate;
	}

	/**
	 * 根据合同开始日期,合同计算开始日期,合同免租结束日期,重新计算清算开始日期
	 * 
	 * @param d1
	 * @param mzjsrq
	 * @return
	 */
	public Date getD2(Date d1, Date mzjsrq) {
		// Step1:判断输入数据的有效性
		if (d1 == null) {
			return null;
		}

		// Step2:根据清算开始日期和免租结束日期进行判断

		if (mzjsrq == null) {
			return d1;
		}

		if (d1.after(mzjsrq)) {
			return d1;
		} else {
			return DateUtils.dateDayAdd(mzjsrq, 1); // 免租期后第一天为清算开始日期
		}
	}

	/**
	 * 根据输入的分段租金设定条件,将D2,D3,切分为多个时间段,并返回之.List中存放的对应是一个Map
	 * Map的值分别为beginDate,endDate,首尾相连.
	 * 
	 * @param d2
	 *            开始日期
	 * @param d3
	 *            结束日期
	 * @param fdzjList
	 *            分段日期的列表,其中存储Map,其中变量为fdbegin,fdend
	 * @return
	 */
	private List getCutDateList(Date d2, Date d3, List<Map> fdzjList,Date mzksrq,Date mzjsrq) {
		// Step1:判断输入数据的合法性
		if (d2 == null || d3 == null || d2.after(d3)) {
			log("getDateList输入参数错误!");
			return null;
		}

		Map m1 = new HashMap();
		m1.put("beginDate", d2);
		m1.put("endDate", d3);
		List retList = new ArrayList();

		// Step2:开始切分,对fdzjList进行循环读取判断
		retList.add(m1); // 加入第一个元素
		Date last_begin = null; // 数组中最后一条记录的开始时间
		Date last_end = null; // 数组中最后一条记录的结束时间
		int i = 0;
		for (i = 0; i < fdzjList.size(); i++) {
			Map mend = (Map) retList.get(retList.size() - 1); // mend代表返回列表的最后一条
			last_begin = (Date) mend.get("beginDate");
			last_end = (Date) mend.get("endDate");

			Map fdmap = (Map) fdzjList.get(i);
			Date fdbegin = (Date) fdmap.get("fdbegin");
			Date fdend = (Date) fdmap.get("fdend");

			// 根据分段开始日期,分段结束日期,分别对最后一条记录进行切分
			// Step2.1 根据分段开始日期进行切分
			if ((fdbegin.after(last_begin))
					&& (fdbegin.before(last_end) || fdbegin.equals(last_end))) {
				mend.put("endDate", DateUtils.dateDayAdd(fdbegin, -1)); // 更新最后一条的结束时间为分段开始时间-1

				Map newend1 = new HashMap();
				last_begin = fdbegin;
				newend1.put("beginDate", last_begin);
				newend1.put("endDate", last_end);
				retList.add(newend1); // 加入到retList中去.
			}

			mend = (Map) retList.get(retList.size() - 1); // mend代表返回列表的最后一条
			last_begin = (Date) mend.get("beginDate");
			last_end = (Date) mend.get("endDate");

			// Step2.2 根据分段结束日期进行切分
			if ((fdend.after(last_begin) || fdend.equals(last_begin))
					&& (fdend.before(last_end))) {
				mend.put("endDate", fdend); // 更新最后一条的结束时间为分段结束日期

				Map newend2 = new HashMap();
				last_begin = DateUtils.dateDayAdd(fdend, 1); // 新的开始日期为分段结束日期加1
				newend2.put("beginDate", last_begin);
				newend2.put("endDate", last_end); // 结束日期不变
				retList.add(newend2);
			}
		}
		return this.mzrq(retList, mzksrq, mzjsrq);
	}

	//将分段的日期去掉免租期
	private List mzrq(List retList,Date mzksrq,Date mzjsrq) {
		List list = new ArrayList();
		if(retList!=null&&retList.size()>0){
			for (int j = 0; j < retList.size(); j++) {
				Map map1 = (Map) retList.get(j);
				Date beginDate = checkDate((Date)map1.get("beginDate"));
				Date endDate = checkDate(new   Timestamp(((Date)map1.get("endDate")).getTime()));
				mzksrq = checkDate(mzksrq);
				mzjsrq = checkDate(mzjsrq);
				if(mzksrq==null||mzjsrq==null){
					list = retList;
					break;
				}
				if(mzksrq.before(beginDate)&&mzjsrq.before(beginDate)){//当免租开始日期和免租结束日期都在分段日期之前
					list.add(map1);
				}else if((mzksrq.before(beginDate)||mzksrq.equals(beginDate))&&(mzjsrq.after(beginDate)||mzjsrq.equals(beginDate))){//分段开始日期在免租开始日期和免租结束日期之内
					Map map2 = new HashMap();
					if((mzjsrq.before(endDate)||mzjsrq.equals(endDate))){
						map2.put("beginDate", DateUtils.dateDayAdd(mzjsrq, 1));
						map2.put("endDate", endDate);
						list.add(map2);
					}
				}else if((mzksrq.after(beginDate)||mzksrq.equals(beginDate))
						&&(((mzksrq.before(endDate)||mzksrq.equals(endDate))&&(mzjsrq.after(endDate)||mzjsrq.equals(endDate))))){//分段开始日期在免租开始日期之前，分段结束日期在免租开始日期和免租结束日期之内
					Map map3 = new HashMap();
					if(mzjsrq.before(endDate)||mzjsrq.equals(endDate)){
						map3.put("beginDate", beginDate);
						map3.put("endDate", DateUtils.dateDayAdd(mzksrq, -1));
						list.add(map3);
					}else
					if(mzksrq.equals(endDate)||mzksrq.before(endDate)){
						map3.put("beginDate", beginDate);
						map3.put("endDate", DateUtils.dateDayAdd(mzksrq, -1));
						list.add(map3);
					}	
				}else if((mzksrq.after(beginDate)||mzksrq.equals(beginDate))&&(mzjsrq.before(endDate)||mzjsrq.equals(endDate))){//当免租开始日期在分段开始日期后，并且分段结束日期在免租结束日期后
					Map map4 = new HashMap();
					if(mzjsrq.before(endDate)||mzjsrq.equals(endDate)){
						map4.put("beginDate", beginDate);
						map4.put("endDate", DateUtils.dateDayAdd(mzksrq, -1));
						list.add(map4);
					}
					Map map5 = new HashMap();
					if(mzjsrq.before(endDate)||mzjsrq.equals(endDate)){
						map5.put("beginDate", DateUtils.dateDayAdd(mzjsrq, 1));
						map5.put("endDate", endDate);
						list.add(map5);
					}
				}else {
					list.add(map1);
				}
			}
		}
		return list;
	}

	/**
	 * 按照时间分段,计算每一分段的实际租金,这个租金的单价,可能来自分段租金表,也可能来自合同表
	 * 在计算时,根据时间分段的开始时间在分段租金表中进行检索,如果找到,取分段租金, 如果找不到,取合同表的月租金
	 * 
	 * @param inList
	 * @param fdList
	 * @param monthRent
	 */
	private void computeFDRent(List inList, List fdList, double fixmonthRent) {

		int i = 0;
		for (i = 0; i < inList.size(); i++) {
			// Step1: 计算用的月租金
			Map computeMap = (Map) inList.get(i);
			Date beginDate = (Date) computeMap.get("beginDate"); // 切分完毕的开始日期
			Date endDate = (Date) computeMap.get("endDate"); // 切分完毕的结束日期

			if (beginDate.after(endDate)) { // 时间发生错误,不处理
				continue;
			}

			// 循环判断beginDate是否在fdList之中
			double monthRent = fixmonthRent; // 初始化为固定月租金
			int j = 0;
			for (j = 0; j < fdList.size(); j++) {
				Map fdMap = (Map) fdList.get(j);
				Date fdbegin = (Date) fdMap.get("fdbegin");
				Date fdend = (Date) fdMap.get("fdend");

				// 如果开始时间在分段时间范围内,则取分段的租金
				if ((checkDate(beginDate).after(checkDate(fdbegin)) || checkDate(beginDate).equals(checkDate(fdbegin)))
						&& (checkDate(beginDate).before(checkDate(fdend)))) {
					monthRent = (Double.valueOf( String.valueOf((BigDecimal)fdMap.get("fdmoney"))));

					j = fdList.size(); // 从此处跳出循环
				}
			}

			// Step2:开始进行开始日期,结束日期,月租金,对应的实际租金的计算

			int days = 0;
			double rentMoney = 0;
			Date tempDate = beginDate;
			Date nextMonthDate = DateUtils.dateMonthAdd(tempDate, 1); // 下月日期
			// 先按照一月一月来计算租金,直到tempDate和endDate之间不满一个月
			while ((nextMonthDate.before(DateUtils.dateDayAdd(endDate, 1)))
					|| (nextMonthDate.equals(DateUtils.dateDayAdd(endDate, 1)))) {
				// 满足一个月的租金条件,计算相差的日期数
				days = days + minusDate(nextMonthDate, tempDate); // 增加一月的天数
				rentMoney = rentMoney + monthRent; // 一个月增加一个月的租金

				// 开始日期指向下一月的日子继续下去
				tempDate = nextMonthDate;
				nextMonthDate = DateUtils.dateMonthAdd(tempDate, 1); // 下月日期
			}
			
			//tempDate.setHours(1);
			GregorianCalendar gc = new GregorianCalendar();
	        gc.setTime(tempDate);
	        gc.set(GregorianCalendar.HOUR_OF_DAY, 1);
	        tempDate = gc.getTime();
			while (tempDate.before(DateUtils.dateDayAdd(endDate, 1))) {
				days = days + 1; // 加一天
				rentMoney = rentMoney + monthRent / 30; // 增加一天的租金
				tempDate = DateUtils.dateDayAdd(tempDate, 1);
//				System.out.println("tempDate:" + tempDate);
			}

			// 将结果写回到Map之中.
			computeMap.put("monthRent", monthRent);
			computeMap.put("days", days);
			computeMap.put("rentMoney", rentMoney);
			inList.set(i, computeMap);// add by lantianbo 将map更新到list里
		}// 分段时间计算的循环结束
	}

	// 算法:计算D1-D2的数值,仅计算日期的值
	private int minusDate(Date d1, Date d2) {
		Date dbegin = DateUtils.getTodayStart(d2);
		Date dend = DateUtils.getTodayStart(d1);

		boolean flag = true;

		if (dbegin.after(dend)) {
			flag = false;
			Date dtemp = dbegin;
			dbegin = dend;
			dend = dbegin;
		}

		int i = 0;
		while (dbegin.before(dend)) {
			i = i + 1;
			dbegin = DateUtils.dateDayAdd(dbegin, 1);
		}
		if (!flag) {// 反向计算
			i = (-1) * i;
		}
		return i;
	}
	
	private Date checkDate(Date date){
//		date.setHours(0);
//		date.setMinutes(0);
//		date.setSeconds(0);
		if(date !=null){
			return DateUtils.getTodayStart(date);
		}else {
			return date;
		}
		
		
	}
}
