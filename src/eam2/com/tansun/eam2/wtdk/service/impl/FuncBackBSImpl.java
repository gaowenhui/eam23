package com.tansun.eam2.wtdk.service.impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.IFuncBackBS;
import com.tansun.eam2.wtdk.vo.FuncBackVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 基金退回
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
@Service
public class FuncBackBSImpl extends WtdkCommon implements IFuncBackBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 保存基金退回表头
	 * 
	 * @param head
	 */
	public void saveHead(WtdkGlHead head) {
		publicDao.save(head);
	}

	/**
	 * 修改基金退回表头
	 * 
	 * @param head
	 */
	public void updateHead(WtdkGlHead head) {
		publicDao.update(head);
	}
	
	/**
	 * 根据headId查找head信息
	 * 
	 * @param headId
	 * @return
	 */
	public WtdkGlHead findHeadByHeadId(String headId){
		String hql = "from WtdkGlHead o where o.sheadId=?";
		List<String> list = new ArrayList<String>();
		list.add(headId);
		return (WtdkGlHead) publicDao.findSingleResult(hql, list);
	}

	/**
	 * 根据表头id查找表体信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId) {
		String hql = "from WtdkFuncBackInfo o where o.sheadId = '" + headId
				+ "' order by o.id asc ";
		List list = publicDao.find(hql, new ArrayList());
		String json = BodyListToJSON.getJSON(list, 1, 1, 10000);
		return json;
	}
	
	/**
	 * 根据bodyId查找body信息
	 * 
	 * @param bodyId
	 * @return
	 */
	public WtdkFuncBackInfo findBodyByBodyId(String bodyId){
		String hql = "from WtdkFuncBackInfo o where o.id = ?";
		String[] str = new String[1];
		str[0] = bodyId;
		WtdkFuncBackInfo body = new WtdkFuncBackInfo();
		body = (WtdkFuncBackInfo)publicDao.findSingleResult(hql, str);
		return body;
	}

	/**
	 * 根据bodyid删除表体信息
	 * 
	 * @param ids
	 */
	public void deleteBodyByBodyId(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			String id = ids[i];
			String sql = "delete from wtdk_func_back_info w where w.id = '"
					+ id + "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

	/**
	 * 保存表体
	 * 
	 * @param lnId
	 */
	public void saveBody(WtdkFuncBackInfo body) {
		publicDao.save(body);
	}
	
	/**
	 * 修改表体
	 * 
	 * @param body
	 */
	public void updateBody(WtdkFuncBackInfo body) {
		publicDao.update(body);
	}
	
	/**
	 * 查询贷款回款信息
	 * 
	 * @param backVO
	 * @param paginator
	 * @return
	 */
	public String query(FuncBackVO backVO, Paginator paginator){
//		String sql = "select z.ln_ln_acct_no, z.ln_cust_no, z.ln_busn_typ,z.ln_yhead_ln_bal," +
//				"k.LN_ENTR_DT,k.LN_TX_AMT,z.ln_crnt_yr_rev_accum,k.LN_ATX_BAL,c.ci_chn_name" +
//				" from crt_dcc_LNLNSLNS z , crt_dcc_CICIFCI1 c , crt_dcc_flnjjr1 k where " +
//				"z.ln_ln_acct_no = k.ln_ln_acct_no and z.ln_cust_no = c.ci_cust_no ";
		String sql = "select z.ln_ln_acct_no,z.ln_cust_no,z.ln_busn_typ,z.ln_yhead_ln_bal,k.LN_ENTR_DT," +
				"k.LN_TX_AMT,z.ln_crnt_yr_rev_accum,k.LN_ATX_BAL,c.ci_chn_name,w.sa_sys_acct_no," +
				"s.sa_cust_name,m.sa_acct_bal from crt_dcc_LNLNSLNS z, crt_dcc_CICIFCI1 c, crt_dcc_flnjjr1 k," +
				"WD_LN_MORE_INFOR w,crt_dcc_SAACNACN s,crt_dcc_SAACNAMT m where z.ln_ln_acct_no = k.ln_ln_acct_no and" +
				" z.ln_cust_no = c.ci_cust_no and z.ln_ln_acct_no = w.ln_acct_no and w.sa_sys_acct_no" +
				" = s.sa_acct_no and m.sa_acct_no = s.sa_acct_no";
		String conditionHql = this.prepareHql(backVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(backVO);
		PageableList pageableList = this.publicDao.queryForList(sql, list,paginator);
		List queryList = pageableList.getResults();
		List<FuncBackVO> resultList = new ArrayList<FuncBackVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			FuncBackVO back = new FuncBackVO();
			back.setHkdw(findCustNameByCustNo(checkString(map.get("ln_cust_no"))).trim()); // 回款单位
			back.setDkzh(checkString(map.get("ln_ln_acct_no")).trim()); // 贷款账号
			back.setHskm(findKMMC(checkString(map.get("ln_busn_typ"))).trim());// 核算科目
			back.setNcye(new BigDecimal(checkString(map.get("ln_yhead_ln_bal")))); // 年初余额
			back.setBjhkrq(checkString(map.get("LN_ENTR_DT")).trim()); // 本次回款日期
			back.setBchkje(new BigDecimal(checkString(map.get("LN_TX_AMT")))); // 本次回款金额
			back.setBnljhkje(new BigDecimal(checkString(map.get("ln_crnt_yr_rev_accum"))));// 本年累计回款金额
			back.setBnljhkje(new BigDecimal(checkString(map.get("LN_ATX_BAL"))));// 还款后本金余额
			back.setDywtdw(findWTDW(findWTJJ(checkString(map.get("ln_ln_acct_no")))).trim());// 对应委托单位
			back.setJjzh(checkString(map.get("sa_sys_acct_no")));
			back.setJjkh(checkString(map.get("sa_cust_name")));
			back.setJjzhye(checkDouble(map.get("sa_acct_bal")));
			resultList.add(back);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}
	
	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private String prepareHql(FuncBackVO backVO) {
		String hql = "";
		// 交易时间 开始
		if (backVO.getStartDate() != null
				&& backVO.getStartDate().trim().length() > 0) {
			hql += " and k.LN_ENTR_DT >= ? ";
		}
		// 交易时间 截止
		if (backVO.getEndDate() != null
				&& backVO.getEndDate().trim().length() > 0) {
			hql += " and k.LN_ENTR_DT <= ? ";
		}
		// 贷款账号
		if (backVO.getDkzh() != null && backVO.getDkzh().trim().length() > 0) {
			hql += " and z.ln_ln_acct_no like ? ";
		}
		// 还款单位
		if (backVO.getHkdw() != null && backVO.getHkdw().trim().length() > 0) {
			hql += " and c.ci_chn_name like ? ";
		}
		// 基金账号
		if (backVO.getJjzh() != null && backVO.getJjzh().trim().length() > 0) {
			hql += " and w.sa_sys_acct_no like ? ";
		}
		// 还款基金客户
		if (backVO.getJjkh() != null && backVO.getJjkh().trim().length() > 0) {
			hql += " and s.sa_cust_name like ? ";
		}
		hql += " order by z.ln_ln_acct_no asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(FuncBackVO backVO) {
		List<Object> list = new ArrayList<Object>();
		// 交易时间开始
		if (backVO.getStartDate() != null
				&& backVO.getStartDate().trim().length() > 0) {
			list.add("" + backVO.getStartDate() + "");
		}
		// 交易时间截止
		if (backVO.getEndDate() != null
				&& backVO.getEndDate().trim().length() > 0) {
			list.add("" + backVO.getEndDate() + "");
		}
		// 贷款账号
		if (backVO.getDkzh() != null && backVO.getDkzh().trim().length() > 0) {
			list.add("%" + backVO.getDkzh() + "%");
		}
		// 还款单位
		if (backVO.getHkdw() != null && backVO.getHkdw().trim().length() > 0) {
			list.add("%" + backVO.getHkdw() + "%");
		}
		// 基金账号
		if (backVO.getJjzh() != null && backVO.getJjzh().trim().length() > 0) {
			list.add("%" + backVO.getJjzh() + "%");
		}
		// 还款基金客户
		if (backVO.getJjkh() != null && backVO.getJjkh().trim().length() > 0) {
			list.add("%" + backVO.getJjkh() + "%");
		}
		return list;
	}
	
	/**
	 * 将贷款回款信息转化为body
	 * 
	 * @return
	 */
	public WtdkFuncBackInfo lnToBody(String headId,String lnNo,String hkrq){
		WtdkFuncBackInfo back = new WtdkFuncBackInfo();
		String sql = "select z.ln_ln_acct_no, z.ln_cust_no, z.ln_busn_typ,z.ln_yhead_ln_bal," +
		"k.LN_ENTR_DT,k.LN_TX_AMT,z.ln_crnt_yr_rev_accum,k.LN_ATX_BAL from crt_dcc_LNLNSLNS z ," +
		" crt_dcc_flnjjr1 k where z.ln_ln_acct_no = k.ln_ln_acct_no and z.ln_ln_acct_no = '"+lnNo+"' " +
		"and k.LN_ENTR_DT = '"+hkrq+"'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			back.setHkdw(findCustNameByCustNo(checkString(map.get("ln_cust_no"))).trim()); // 回款单位
			back.setDkzh(checkString(map.get("ln_ln_acct_no")).trim()); // 贷款账号
			back.setHskm(findKMMC(checkString(map.get("ln_busn_typ"))).trim());// 核算科目
			back.setNcye(new BigDecimal(checkString((map.get("ln_yhead_ln_bal"))).trim())); // 年初余额
			SimpleDateFormat fo = new SimpleDateFormat("yyyymmdd");
			Date date;
			try {
				date = fo.parse(checkString(map.get("LN_ENTR_DT")));
				back.setBjhkrq(date); // 本次回款日期
			} catch (ParseException e) {
				e.printStackTrace();
			}
			back.setBchkje(new BigDecimal(checkString(map.get("LN_TX_AMT")))); // 本次回款金额
			back.setBnljhkje(new BigDecimal(checkString(map.get("ln_crnt_yr_rev_accum"))));// 本年累计回款金额
			back.setBnljhkje(new BigDecimal(checkString(map.get("LN_ATX_BAL"))));// 还款后本金余额
			back.setDywtdw(findWTDW(findWTJJ(checkString(map.get("ln_ln_acct_no")))).trim());// 对应委托单位
			back.setSheadId(headId);
		}
		return back;
	}
	
	/**
	 * 批量保存表体
	 * @param headId
	 * @param lnNo
	 * @param hkrq
	 */
	public void batchLnToBody(String headId, String lnNo, String hkrq){
		String []rqs = hkrq.split(",");
		String []nos = lnNo.split(",");
		for(int i=0;i<rqs.length;i++){
			WtdkFuncBackInfo back = new WtdkFuncBackInfo();
//			String sql = "select z.ln_ln_acct_no, z.ln_cust_no, z.ln_busn_typ,z.ln_yhead_ln_bal," +
//			"k.LN_ENTR_DT,k.LN_TX_AMT,z.ln_crnt_yr_rev_accum,k.LN_ATX_BAL from crt_dcc_LNLNSLNS z ," +
//			" crt_dcc_flnjjr1 k where z.ln_ln_acct_no = k.ln_ln_acct_no and z.ln_ln_acct_no = '"+nos[i]+"' " +
//			"and k.LN_ENTR_DT = '"+rqs[i]+"'";
			String sql = "select z.ln_ln_acct_no,z.ln_cust_no,z.ln_busn_typ,z.ln_yhead_ln_bal," +
					"k.LN_ENTR_DT,k.LN_TX_AMT,z.ln_crnt_yr_rev_accum,m.sa_acct_bal,k.LN_ATX_BAL,w.sa_sys_acct_no," +
					"s.sa_cust_name from crt_dcc_SAACNAMT m,crt_dcc_LNLNSLNS z, crt_dcc_flnjjr1 k,WD_LN_MORE_INFOR w," +
					"crt_dcc_SAACNACN s where z.ln_ln_acct_no = k.ln_ln_acct_no and m.sa_acct_no = s.sa_acct_no" +
					" and z.ln_ln_acct_no = w.ln_acct_no and w.sa_sys_acct_no = s.sa_acct_no and" +
					" z.ln_ln_acct_no = '"+nos[i]+"' and k.LN_ENTR_DT = '"+rqs[i]+"' ";
			List list = publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map map = (Map) list.get(0);
				back.setHkdw(findCustNameByCustNo(checkString(map.get("ln_cust_no"))).trim()); // 回款单位
				back.setDkzh(checkString(map.get("ln_ln_acct_no")).trim()); // 贷款账号
				back.setHskm(findKMMC(checkString(map.get("ln_busn_typ"))).trim());// 核算科目
				back.setNcye(new BigDecimal(checkString((map.get("ln_yhead_ln_bal"))).trim())); // 年初余额
				SimpleDateFormat fo = new SimpleDateFormat("yyyymmdd");
				Date date;
				try {
					date = fo.parse(checkString(map.get("LN_ENTR_DT")));
					back.setBjhkrq(date); // 本次回款日期
				} catch (ParseException e) {
					e.printStackTrace();
				}
				back.setBchkje(new BigDecimal(checkString(map.get("LN_TX_AMT")))); // 本次回款金额
				back.setBnljhkje(new BigDecimal(checkString(map.get("ln_crnt_yr_rev_accum"))));// 本年累计回款金额
				back.setBnljhkje(new BigDecimal(checkString(map.get("LN_ATX_BAL"))));// 还款后本金余额
				back.setDywtdw(findWTDW(findWTJJ(checkString(map.get("ln_ln_acct_no")))).trim());// 对应委托单位
				back.setSheadId(headId);
				back.setJjkhmc(checkString(map.get("sa_cust_name")));
				back.setXtjjzh(checkString(map.get("sa_sys_acct_no")));
				back.setJjzhye(checkDouble(map.get("sa_acct_bal")));
			}
			publicDao.save(back);
		}
	}
	
	/**
	 * 批量修改表体
	 * @param bodyIds
	 * @param nhfje
	 * @param spje
	 * @param spjg
	 * @param bz
	 */
	public void batchUpdateBody(String bodyIds, String nhfje, String spje,
			String spjg, String bz) {
		String[] ids = bodyIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			WtdkFuncBackInfo info = this.findBodyByBodyId(ids[i]);
			info.setNhfje(new BigDecimal(nhfje));
			info.setSpje(new BigDecimal(spje));
			info.setSpjg(spjg);
			info.setBz(bz);
			publicDao.update(info);
		}
	}
	
}
