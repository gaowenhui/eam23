package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzHgshXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.workflow.common.model.PTMessage;

@Repository
public class CzStcztzWfBSImpl extends CommonBSImpl implements CzStcztzWfBS {
	
	private Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private PublicDao publicDao;
	private IAssetDealWfBS assBS;
	private ICodeGenerator codeGenerator;

	@Autowired
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}

	@Autowired
	public void setAssBS(IAssetDealWfBS assBS) {
		this.assBS = assBS;
	}

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	// ============项目受理环节，点击提交－》合规审查办理需要触发的操作======================
	/**
	 * 根据处理单id，在实体整体处置人员安置及实体承继投资信息表CZ_STCZTZ中把合规审查次数HGSCCS加1后进行保存
	 * 
	 * @param cldId
	 */

	public void addCheckCount(String cldId) {
		String strsql = "Update CZ_STCZTZ " + " Set HGSCCS = HGSCCS + 1 "
				+ " Where Id=?";
		List args = new ArrayList();
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}

	// ============合规审查环节，提交最终意见流转到会议组织环节需要触发的操作======================
	/**
	 * 在处置投资项目信息临时表CZ_XMXX_LSB中插入一条新的记录 拷贝CZ_STCZTZ表中的信息到CZ_XMXX_LSB表中新插入的那条记录里面
	 * 
	 * @param cldId
	 *            处理单id copy属性有：编号、处置项目名称、汇报人（拟稿人）、汇报人姓名（拟稿人姓名）、状态（null）、
	 *            分类（ZcczCommon中定义有经营性固产处置）、受理序号、申报日期、处理单Id
	 */
	public void copyPropertieToXmxxLsb(String cldId) {
		CzStcztz bo = (CzStcztz) this.findById(CzStcztz.class, cldId); // 检索原始数据
		if (bo != null) {
			CzXmxxLsb bo2 = new CzXmxxLsb(); // 新对象
			bo2.setBianhao(bo.getBianhao()); // 编号
			bo2.setCzxmmc(bo.getCzxmmc()); // 项目名称
			bo2.setHbr(bo.getNgr()); // 拟稿人
			bo2.setHbrxm(bo.getNgrxm()); // 拟稿人名称
			//bo2.setZhuangtai(ZcczCommon.DEALTODO_XMZT_WSH); // 状态:未上会
			if (bo.getLcmc() != null && bo.getLcmc().equals("实体整体处置")) {
				bo2.setFenlei(ZcczCommon.ITEM_FOR_ENTITY); // 整体处置
			}else if (bo.getLcmc() != null && bo.getLcmc().equals("实体人员安置")) {
				bo2.setFenlei(ZcczCommon.ITEM_FOR_ENTITY_PERSON); // 人员安置
			}else {
				bo2.setFenlei(ZcczCommon.ITEM_FOR_INVESTMENT); // 承继投资
			}
			bo2.setSlxh(bo.getSlxh());// 受理序号
			bo2.setSbrq(bo.getSbrq());// 申报日期
			bo2.setCldId(bo.getId());
			bo2.setCzsx("6个月");
			this.save(bo2); // 插入一条新的记录
		}
	}

	/**
	 * 点击提交时，根据处理单id修改处理单状态为处置审批中 ZcczCommon中有常量
	 * @param cldId
	 *            处理单id 资产处置投资方案信息表CZ_STCZTZ
	 */
	public void modifyStztczStateSpz(String cldId) {
		String strsql = "Update CZ_STCZTZ " + " Set CLDZT = ? " + " Where Id=?";
		List args = new ArrayList();
		args.add(ZcczCommon.FORM_IS_APPROVING); // 正在审批中
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);

	}

	/**
	 * 更新一个项目中安置的人员的状态为安置审批中 0：未安置1：安置审批中2：安置执行中 3:已安置
	 */
	public void uadatePersonStatuInCld(String cldId) {
		String strsql = "Update ST_FSXX Set FAZZT= ? "
				+ " Where ID in (Select ST_FSXX_ID from CZ_AZRY_XX "
				+ " Where CZ_AZRY_XX.CLD_ID=?)";
		List args = new ArrayList();
		args.add(StglCommon.ST_RENYUANANZHI_SHENPIZHONG);// 1：安置审批中
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}
	
	/**
	 * 更新一个项目中安置的人员的状态为已安置 0：未安置1：安置审批中2：安置执行中 3:已安置
	 */
	public void uadatePersonStatuToYazInCld(String cldId) {
		String strsql = "Update ST_FSXX Set FAZZT= ? "
			+ " Where ID in (Select ST_FSXX_ID from CZ_AZRY_XX "
			+ " Where CZ_AZRY_XX.CLD_ID=?)";
		List args = new ArrayList();
		args.add(StglCommon.ST_RENYUANANZHI_YIANZHI);// 3:已安置
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}

	/**
	 * 根据处理单id，修改ST_JBXX表中的实体状态为处置审批中中
	 * 
	 * @param cldId
	 */
	public void uadateStJbxxStatuInCld(String cldId) {
		String strsql = "Update ST_JBXX Set C_STZT=? " + " Where Id in (select stid from CZ_STCZTZ where id = ?)";
		List args = new ArrayList();
		args.add("2"); // 2代表实体处置审批中
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}

	// ============拟稿环节，作废流程需要触发的操作=====================
	/**
	 * 流程作废，需要修改安置人员信息为未安置 0：未安置1：安置审批中2：安置执行中 3:已安置 修改CZ_STCZTZ状态为流程作废4
	 * 
	 * @param cldId
	 */
	public void updateStatuForDropStayaz(String cldId) {
		String strsql = "Update CZ_STCZTZ " + " Set CLDZT = ? " + " Where Id=?";
		List args = new ArrayList();
		args.add(ZcczCommon.FORM_BE_ABANDONED); // 4代表作废
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);

		// 更新相应的人员状态
		strsql = "Update ST_FSXX Set FAZZT= ? "
				+ " Where ID in (Select ST_FSXX_ID from CZ_AZRY_XX "
				+ " Where CZ_AZRY_XX.CLD_ID=?)" + " And FAZZT=?";
		args = new ArrayList();
		args.add(StglCommon.ST_RENYUANANZHI_WEIANZHI);// 0:未安置
		args.add(cldId);
		args.add(StglCommon.ST_RENYUANANZHI_SHENPIZHONG);// 审批中的人员才可回收
		this.publicDao.updateBySql(strsql, args);
	}
	
	// ============拟稿环节，作废流程需要触发的操作=====================
	/**
	 * 流程作废，修改CZ_STCZTZ状态为流程作废4
	 * @param cldId
	 */
	public void updateStatuForDropCjtz(String cldId) {
		String strsql = "Update CZ_STCZTZ " + " Set CLDZT = ? " + " Where Id=?";
		List args = new ArrayList();
		args.add(ZcczCommon.FORM_BE_ABANDONED); // 4代表作废
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}

	// ============拟稿环节，作废流程需要触发的操作=====================
	/**
	 * 流程作废，需要修改处置实体信息为未处置 1：未处置2：处置审批中3：处置执行中 4:已处置 修改CZ_STCZTZ状态为流程作废4
	 * @param cldId
	 */
	public void updateStatuForDropStztcz(String cldId) {
		if(StringUtils.isEmpty(cldId))
			throw new RuntimeException("处理单id为空,无法更新!");
//		String strsql = "Update CZ_STCZTZ Set CLDZT=? " + " Where Id=?";
//		String strsql2 = "Update ST_JBXX Set C_STZT=? " + " Where Id = (select stid from CZ_STCZTZ where id = ?)";
//		List args = new ArrayList();
//		args.add("4"); // 4代表流程作废
//		args.add(cldId);
//		this.publicDao.updateBySql(strsql, args);//跟新处理单状态
//		
//		args.clear();
//		args.add("1");
//		args.add(cldId);
//		this.publicDao.updateBySql(strsql2);//跟新实体状态
		CzStcztz head = publicDao.findById(CzStcztz.class, cldId);
		if(head != null){
			head.setCldzt(ZcczCommon.FORM_BE_ABANDONED);
			this.publicDao.update(head);
			if(StringUtils.isNotEmpty(head.getStid())){
				StJbxx st = publicDao.findById(StJbxx.class, head.getStid());
				st.setCStzt(StglCommon.ST_CZZT_WEICHUZHI);
				publicDao.update(st);
			}
		}
	}

	/**
	 * 根据处理单id，修改处理单状态为审批结束，修改安置人员信息CZ_AZRY_XX表中状态为已审批 如果项目审批通过，修改相应的ST_FSXX表中FAZFY状态安置执行中
	 * 如果项目未通过，修改人员状态为未安置 输入: 项目临时表CZ_XMXX_LSB, 审批结论SPJL 输出: 实体项目表CZ_STCZTZ,
	 * 人员安置表CZ_AZRY_XX, 实体附属信息表ST_FSXX
	 * 
	 * @param cldId
	 */
	public void modifyStayazStateYsp(String cldId) {
		String strsql = "";
		List args = new ArrayList();
		// Step1:读取临时表数据,得到审批结论
		String hsql = "from CzXmxxLsb where cldId=?";
		args.add(cldId);
		CzXmxxLsb lsb = (CzXmxxLsb) this.publicDao.findSingleResult(hsql, args);

		if (lsb == null) {
			System.out
					.println("modifyStayazStateYsp ...Call Argument Error.cldId="
							+ cldId);
			return;
		}
		if (!("1".equals(lsb.getSpjl()) || "0".equals(lsb.getSpjl()))) {
			if(log.isDebugEnabled()){
				log.debug("modifyStayazStateYsp ...SPJL DataError="
						+ lsb.getSpjl());
			}
			return;
		}

		// Step2:修改实体项目表CZ_STCZTZ
		strsql = "Update CZ_STCZTZ " + " Set CLDZT = ? " + " Where Id=?";
		args = new ArrayList();
		args.add(ZcczCommon.FORM_HAVE_APPROVED); // 2通过
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);

		// Step3:修改人员安置表CZ_AZRY_XX
		strsql = "Update CZ_AZRY_XX Set CLDZT=? " + " Where CLD_ID=?";
		args = new ArrayList();
		if (lsb.getSpjl().equals("0")) { // 不同意
			args.add("0"); // 3代表审批不通过
		} else {
			args.add("2"); // 2代表审批未通过
		}
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);

		// Step4:修改实体附属信息表
		// 更新相应的人员状态
		strsql = "Update ST_FSXX Set FAZZT= ? "
				+ " Where ID in (Select ST_FSXX_ID from CZ_AZRY_XX "
				+ " Where CZ_AZRY_XX.CLD_ID=?)" + " And FAZZT=?";
		args = new ArrayList();
		if (lsb.getSpjl().equals("0")) { // 不同意
			args.add(StglCommon.ST_RENYUANANZHI_WEIANZHI);// 0：未安置
		} else {
			args.add(StglCommon.ST_RENYUANANZHI_ZIXINGZHONG);// 2安置执行中
		}
		args.add(cldId);
		args.add(StglCommon.ST_RENYUANANZHI_SHENPIZHONG);// 审批中的人员才可修改状态
		this.publicDao.updateBySql(strsql, args);
	}
	
	/**
	 * 如果项目审批通过，修改相应的ST_JBXX表中状态C_STZT为处置执行中 如果项目未通过，修改实体状态为未处置 输入:CzXmxxLsb
	 * 输出ST_JBXX
	 * 
	 * @param cldId
	 */
	public void modifyStztczStateYsp(String cldId) {
		// Step1:读取审批结论
		String strsql = "";
		List args = new ArrayList();
		// Step1:读取临时表数据,得到审批结论
		String hsql = "from CzXmxxLsb where cldId=?";
		args.add(cldId);
		CzXmxxLsb lsb = (CzXmxxLsb) this.publicDao.findSingleResult(hsql, args);

		if (lsb == null) {
			System.out
					.println("modifyStayazStateYsp ...Call Argument Error.cldId="
							+ cldId);
			return;
		}
		if (!("1".equals(lsb.getSpjl()) || "0".equals(lsb.getSpjl()))) {
			if(log.isDebugEnabled()){
				log.debug("modifyStayazStateYsp ...SPJL DataError="
						+ lsb.getSpjl());
			}
			return;
		}

		// step3:读取对应的实体ID
		CzStcztz bo = (CzStcztz) this.publicDao.findById(CzStcztz.class, cldId);
		if (bo == null) {
			System.out
					.println("modifyStayazStateYsp ...DataError:cldId not found :"
							+ cldId);
			return;
		}
		bo.setCldzt(ZcczCommon.FORM_HAVE_APPROVED); // 2审批结束
		publicDao.update(bo);
		// Step2:更新实体表
		strsql = "Update ST_JBXX Set C_STZT=? " + " Where Id=?";
		args = new ArrayList();
		if (lsb.getSpjl().equals("0")) {// 审批不通过
			args.add("1"); // 1代表未处置
		} else {
			args.add("3");// 3代表处置执行中
		}
		args.add(bo.getStid()); // 设置实体编号

		this.publicDao.updateBySql(strsql, args);
	}

	/**
	 * 点击提交时，根据处理单id修改处理单状态为处置审批中,将流程Id保存到CZ_STCZTZ对象中 0：未处置1：处置审批中2：处置执行中 3:已处置
	 * 
	 * @param cldId
	 * 处理单id 资产处置投资方案信息表CZ_STCZTZ
	 */
	public void modifyStztczStateSpz(String processInstanceId, String cldId) {
		// Step1:读取审批结论
		String strsql = "Update CZ_STCZTZ Set CLDZT=?,LC_ID=?" + " Where ID=? ";
		List args = new ArrayList();
		args.add("1");// 处置审批中
		args.add(processInstanceId);// 流程ID
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}

	/**
	 * 返回但前处理单所在会议的流程Id
	 * 根据处理单id(CZ_STCZTZ.id)到表CZ_XMXX_LSB中查询会议id（HY_ID），再到表CZ_HYXX查询流程Id（LC_ID）
	 * 
	 * @param cldId
	 * @return 会议流程Id
	 */
	public String getHyLcId(String cldId) {
		// Step1:检索会议Id
		String strsql = "";
		List args = new ArrayList();
		// Step1:读取临时表数据,得到审批结论
		String hsql = "from CzXmxxLsb where CldId=?";
		args.add(cldId);
		CzXmxxLsb lsb = (CzXmxxLsb) this.publicDao.findSingleResult(hsql, args);

		if (lsb == null) {
			if(log.isDebugEnabled()){
				log.debug("_____ getHyLcId Error.cldId not found:" + cldId);
			}
			return null;
		}

		// Step2:检索会议信息
		CzHyxx bo = (CzHyxx) this.findById(CzHyxx.class, lsb.getHyId());
		if (bo != null) {
			return bo.getLcId();
		} else {
			if(log.isDebugEnabled()){
				log.debug("DataError: cannot find HYXX:" + lsb.getHyId());
			}
		}
		return null;
	}


	
	/**
	 * 会议组织结束后将CZ_XMXX_LSB表中的状态改为，未上会
	 * 通过cldId到表CZ_XMXX_LSB中找到相应的记录,将字段ZHUANGTAI改为未上会
	 * "状态  0：未上会1：上会中2：上会完毕"
	 * @param cldId
	 */
	public void updateXmxxToWsh(String cldId) {
		if(StringUtils.isNotEmpty(cldId)){
			String sql = "update CZ_XMXX_LSB set ZHUANGTAI=? where CLD_ID=?";
			List args = new ArrayList();
			args.add(ZcczCommon.DEALTODO_XMZT_WSH);// 未上会
			args.add(cldId);
			this.publicDao.updateBySql(sql, args);
		}else{
			if(log.isDebugEnabled()){
				log.debug("updateXmxxToWsh-----DateError: cldId is null or \"\"");
			}
		}
	}

	//跟新办理时间
	public void updateBlDate(String cldId) {
//		CzStcztz head = publicDao.findById(CzStcztz.class, cldId);
//		head.setFblsj(new Date());
//		publicDao.update(head);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date fblsj = new Date();
		try {
			fblsj = df.parse(df.format(fblsj));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		publicDao.updateBySql("update cz_stcztz set fblsj=? where id=?", new Object[]{fblsj,cldId});
	}

	/**
	 * 合规审查结束后给所有审批委员发消息（打开就是处理单页面）
	 * 先到表P_T_USER_L_ROLE中找出所有ROLE_ID＝142L的记录的USER_ID字段集合
	 * 对于每一个USER_ID在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					USER_ID
	 * MESSAGE					"项目上会材料"
	 * URL						"zccz/personDealHead_toModify.do?head.id=" + CldId
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"3"
	 * @param cldId ：CZ_STCZTZ.id
	 */
	public void stayazMessageToAllSpwy(String cldId, Long currentUserId) {
		//Step1:检索所有用户类型为142的审查委员
		String strsql="select tid from p_t_user where tid in "
			+"(select user_id from P_T_USER_L_ROLE where role_id=?)";
		List params = new ArrayList();
		params.add("142");
		
		List userlist = this.publicDao.queryForList(strsql, params);
		
		//Step2:给审查委员发相应的消息过去
		int i=0;
		for(i=0;i<userlist.size();i++){
			Map userMap = (Map)userlist.get(i);
			String userid = String.valueOf(userMap.get("TID")); //得到用户编号
			PTMessage mess = new PTMessage();
			mess.setCreateDate(new Date());
			mess.setSendUserId(currentUserId);
			mess.setUserId(Long.parseLong(userid));
			mess.setMessage("项目上会材料");
			mess.setUrl("zccz/personDealHead_toModify.do");
			mess.setParam("head.id=" + cldId);
			mess.setIsRead("0");
			mess.setType("3");
			this.publicDao.save(mess); //插入一个新的消息记录过去
		}
	}

	/**
	 * 合规审查结束后给所有审批委员发消息（打开就是处理单页面）
	 * 先到表P_T_USER_L_ROLE中找出所有ROLE_ID＝142L的记录的USER_ID字段集合
	 * 对于每一个USER_ID在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					USER_ID
	 * MESSAGE					"项目上会材料"
	 * URL						"zccz/entityDealHead_viewDraft.do?head.id=" + CldId
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"3"
	 * @param cldId ：CZ_STCZTZ.id
	 */
	public void stztczMessageToAllSpwy(String cldId, Long currentUserId) {
		//Step1:检索所有用户类型为142的审查委员
		String strsql="select tid from p_t_user where tid in "
			+"(select user_id from P_T_USER_L_ROLE where role_id=?)";
		List params = new ArrayList();
		params.add("142");
		
		List userlist = this.publicDao.queryForList(strsql, params);
		
		//Step2:给审查委员发相应的消息过去
		int i=0;
		for(i=0;i<userlist.size();i++){
			Map userMap = (Map)userlist.get(i);
			String userid = String.valueOf(userMap.get("TID")); //得到用户编号
			PTMessage mess = new PTMessage();
			mess.setCreateDate(new java.util.Date());
			mess.setSendUserId(currentUserId);
			mess.setUserId(Long.parseLong(userid));
			mess.setMessage("项目上会材料");
			mess.setUrl("zccz/entityDealHead_viewDraft.do");
			mess.setParam("head.id=" + cldId);
			mess.setIsRead("0");
			mess.setType("3");
			this.publicDao.save(mess); //插入一个新的消息记录过去
		}
	}

	//根据处理单id结束处理单
	public void endLc(String cldId) {
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		if(czStcztz == null){
			CzCztzfaXx czCztzfaXx = publicDao.findById(CzCztzfaXx.class, cldId);
			if(czCztzfaXx != null){
				assBS.modifyBodyStateYsp(cldId);
			}else{
				if(log.isDebugEnabled()){
					log.debug("_______________________没有找到对应的处理单————————————————");
				}
			}
		}else{
			if(StringUtils.equals(czStcztz.shitiPDK, czStcztz.getLcmc())){
				modifyStztczStateYsp(cldId);
			}else if(StringUtils.equals(czStcztz.renyuanPDK, czStcztz.getLcmc())){
				modifyStayazStateYsp(cldId);
			}else{
				if(log.isDebugEnabled()){
					log.debug("________________________流程名称出现错误————————————————————");
				}
			}
		}
	}

	public boolean isAllXmIsOverByCldId(String cldId) {
		//找到处理单
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		CzXmxxLsb xm = null;
		if(czStcztz == null){//如果不是实体整体处置或实体人员安置
			//取得资产处置处理单
			CzCztzfaXx czCztzfaXx = publicDao.findById(CzCztzfaXx.class, cldId);
			if(czCztzfaXx != null){
				//找到相应的项目临时表
				xm = (CzXmxxLsb)publicDao.findSingleResult("from CzXmxxLsb o where o.cldId = ?", new String[]{czCztzfaXx.getId()});
			}else{
				if(log.isDebugEnabled()){
					log.debug("_______________________没有找到对应的处理单————————————————");
				}
			}
		}else{
			//找到相应的项目临时表
			xm = (CzXmxxLsb)publicDao.findSingleResult("from CzXmxxLsb o where o.cldId = ?", new String[]{czStcztz.getId()});
		}
		//根据会议Id取得会议下所有的项目
		List<CzXmxxLsb> xmList = (List<CzXmxxLsb>)publicDao.find("from CzXmxxLsb o where o.hyId= '" + xm.getHyId() + "'");
		for(CzXmxxLsb lsb : xmList){//遍历项目
			//取得项目对应的实体整体处置或人员安置处理单对象
			CzStcztz czStcztz_lsb = publicDao.findById(CzStcztz.class, lsb.getCldId());
			if(czStcztz_lsb == null){//如果不是实体整体处置或实体人员安置
				//取得项目对应的资产处置处理单
				CzCztzfaXx czCztzfaXx_lsb = publicDao.findById(CzCztzfaXx.class, lsb.getCldId());
				if(!StringUtils.equals("2", czCztzfaXx_lsb.getCldzt()) && !StringUtils.equals(cldId, czCztzfaXx_lsb.getId())){
					return false;//处理单状态是否不为结束
				}
			}else{
				if(!StringUtils.equals("2", czStcztz_lsb.getCldzt()) && !StringUtils.equals(cldId, czStcztz_lsb.getId())){
					return false;//处理单状态是否不为结束
				}
			}
		}
		//如果所有的处理单状态都为结束（"2"）
		return true;
	}
	
	//============合规审查环节如果退回处理单，发到项目受理环节需要触发的操作======================	
	/**
	 * 1、oldHead查出来
	 * 2、新建newHead
	 * 3、将oldHead拷贝到newHead中
	 * 4、将newHead的id设置为null
	 * 5、将newHead的处理单状态设置为状态为被退回ZcczCommon.FORM_BE_RETURN 3
	 * 6、newHeadId = save(newHead)
	 * 7、设置oldHead的上次合规审查id为newHead.id
	 * 8、设置oldHead的发办理时间为null
	 * 9、update(oldHead)
	 * 设置旧处理单的，进行数据更新
	 * @param cldId 处理单id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public String returnCzStcztzBackToXmsl(String cldId) throws IllegalAccessException, InvocationTargetException {
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		CzStcztz newCzStcztz = new CzStcztz();
		BeanUtils.copyProperties(newCzStcztz, czStcztz);
		newCzStcztz.setId(null);
		newCzStcztz.setCldzt(ZcczCommon.FORM_BE_RETURN);
		String newCzStcztzId = (String)publicDao.save(newCzStcztz);
		czStcztz.setScfaxxid(newCzStcztzId);
		czStcztz.setFblsj(null);
		publicDao.update(czStcztz);
		return newCzStcztzId;
	}
	
	public void setCzStcztzStatuAsWtj(String cldId){
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		czStcztz.setCldzt(ZcczCommon.FORM_HAVE_NOT_APPROVED);
		publicDao.update(czStcztz);
	}
	
	//拷贝人员、和费用信息到历史处理单上去
	public void cloneBodyToHistory(String cldId, String historyCldId) throws IllegalAccessException, InvocationTargetException{
		List<CzAzryXx> ayList = (List<CzAzryXx>)publicDao.find("from CzAzryXx a where a.cldId=?", new String[]{cldId});
		for(CzAzryXx ayxx : ayList){
			CzAzryXx newAy = new CzAzryXx();
			BeanUtils.copyProperties(newAy, ayxx);
			newAy.setId(null);
			newAy.setCldId(historyCldId);
			newAy.setCldzt(ZcczCommon.FORM_BE_RETURN);
			publicDao.save(newAy);
		}
		List<CzFysrMx> fyList = (List<CzFysrMx>)publicDao.find("from CzFysrMx fy where fy.cldId=?", new String[]{cldId});
		for(CzFysrMx fy : fyList){
			CzFysrMx newFy = new CzFysrMx();
			BeanUtils.copyProperties(newFy, fy);
			newFy.setId(null);
			newFy.setCldId(historyCldId);
			newFy.setFyzt(ZcczCommon.FORM_BE_RETURN);
			publicDao.save(newFy);
		}
	}
	
	//转移合规性审查意见
	public void cloneHgxscToHistory(String cldId, String historyCldId) throws IllegalAccessException, InvocationTargetException{
		List<CzHgshXx> hgscList = (List<CzHgshXx>)publicDao.find("from CzHgshXx h where h.cldId=?", new String[]{cldId});
		for(CzHgshXx hgsc : hgscList){
			hgsc.setCldId(historyCldId);
			publicDao.update(hgsc);
		}
	}

	//拷贝临时表里面的数据到项目信息表了面去做跟踪	
	public void cloneXmLsbToXm(String cldId) throws IllegalAccessException, InvocationTargetException {
		CzXmxxLsb lsb = (CzXmxxLsb)publicDao.findSingleResult("from CzXmxxLsb o where o.id=?", new String[]{cldId});
		if(StringUtils.isNotEmpty(lsb.getSpjl())){
			if(StringUtils.equals("1", lsb.getSpjl())){
				CzXmXx xmxx = new CzXmXx();
				BeanUtils.copyProperties(xmxx, lsb);
				xmxx.setZhuangtai(ZcczCommon.PROJECT_TYPE_WZX);
				xmxx.setId(null);
				xmxx.setXmlsb(lsb.getId());
				publicDao.save(xmxx);
			}
		}
	}
	
	//实体人员安置作废时释放编号
	public void releaseStayazBianhao(String cldId){
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		if(StringUtils.isEmpty(czStcztz.getBianhao()))
			return;
		codeGenerator.disableCurrentCode("stryaz", czStcztz.getBianhao(), czStcztz.getNgbm());
		List<CzStcztz> czStcztzList = (List<CzStcztz>)publicDao.find("from CzStcztz o where o.bianhao=?", new String[]{czStcztz.getBianhao()});
		for(CzStcztz cz : czStcztzList){
			cz.setBianhao(cz.getBianhao() + "(作废)");
		}
	}
	
	//成绩投资作废时释放编号
	public void releaseCjtzBianhao(String cldId){
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		if(StringUtils.isEmpty(czStcztz.getBianhao()))
			return;
		codeGenerator.disableCurrentCode("cjtz", czStcztz.getBianhao(), czStcztz.getNgbm());
		List<CzStcztz> czStcztzList = (List<CzStcztz>)publicDao.find("from CzStcztz o where o.bianhao=?", new String[]{czStcztz.getBianhao()});
		for(CzStcztz cz : czStcztzList){
			cz.setBianhao(cz.getBianhao() + "(作废)");
		}
	}

	//实体整体处置作废时释放编号
	public void releaseStztczBianhao(String cldId) {
		CzStcztz czStcztz = publicDao.findById(CzStcztz.class, cldId);
		if(StringUtils.isEmpty(czStcztz.getBianhao()))
			return;
		codeGenerator.disableCurrentCode("stztcz", czStcztz.getBianhao(), czStcztz.getNgbm());
		List<CzStcztz> czStcztzList = (List<CzStcztz>)publicDao.find("from CzStcztz o where o.bianhao=?", new String[]{czStcztz.getBianhao()});
		for(CzStcztz cz : czStcztzList){
			cz.setBianhao(cz.getBianhao() + "(作废)");
		}
	}

	//更新处理单下债权的状态
	public void updateDebtAndLsbStatu(String cldId, String statu) {
		publicDao.updateBySql("update DEBT_INFO o1, DEBT_INFO_LSB o2 set o1.CZZT=?, o2.CZZT=? where o1.ID=o2.ZQXX_ID and o2.CLD_ID=?", new String[]{statu,statu,cldId});
	}

	//跟新处理单下的债权临时表的处理单状态
	public void updateDebtLsbCldZt(String cldId, String statu){
		publicDao.updateBySql("update DEBT_INFO_LSB set CLDZT=? where CLD_ID=?", new String[]{statu,cldId});
	}
	
	//根据处理单id清除合规审查意见
	public void deleteHgscByCldId(String cldId){
		List<CzHgshXx> hgscList = (List<CzHgshXx>)publicDao.find("from CzHgshXx h where h.cldId=?", new String[]{cldId});
		for(CzHgshXx hgsc : hgscList){
			publicDao.delete(hgsc);
		}
	}
}
