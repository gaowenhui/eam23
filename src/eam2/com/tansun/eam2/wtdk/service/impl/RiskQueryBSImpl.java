package com.tansun.eam2.wtdk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.IRiskQueryBS;
import com.tansun.eam2.wtdk.vo.RiskQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
@Service
public class RiskQueryBSImpl extends WtdkCommon implements IRiskQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 查询风险信息
	 * 
	 * @param riskVO
	 * @param paginator
	 * @return
	 */
	public String query(RiskQueryVO queryVO, Paginator paginator) {
		// 拼接查询语句
		String sql = " select o.*,l.ln_ln_bal from WD_LN_MORE_INFOR o,crt_dcc_LNLNSLNS l "
				+ "where o.ln_acct_no = l.ln_ln_acct_no and o.VER_RISK_LEVE is not null and"
				+ " o.XULIE = '0' ";
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<RiskQueryVO> resultList = new ArrayList<RiskQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			RiskQueryVO risk = new RiskQueryVO();
			risk.setLnAcctNo(checkString(map.get("LN_ACCT_NO")).trim());// 贷款账号
			risk.setCCustId(checkString(map.get("C_CUST_ID")).trim());// 客户编号
			risk.setCCustName(checkString(map.get("C_CUST_NAME")).trim());// 客户名称
			risk.setLostJe(checkDouble(map.get("LOST_JE")));// 预计损失金额
			risk.setVerLostJe(checkDouble(map.get("VER_LOST_JE")));// 审核预计损失金额
			risk.setMagDpt(checkString(map.get("MAG_DPT")).trim());// 资产管理部门
			risk.setDAcctNo(findCustNameByCustNo(checkString(
					map.get("D_ACCT_NO")).trim()));// 委托方客户编号
			risk.setLoansYE(checkDouble(map.get("ln_ln_bal"))); //贷款本金余额
			risk.setRiskLevel(checkString(map.get("VER_RISK_LEVE"))); // 风险分类等级
			resultList.add(risk);
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
	private String prepareHql(RiskQueryVO queryVO) {
		String hql = "";
		// 客户名称
		if (queryVO.getCCustName() != null
				&& queryVO.getCCustName().trim().length() > 0) {
			hql += " and o.C_CUST_NAME like ? ";
		}
		// 客户编号
		if (queryVO.getCCustId() != null
				&& queryVO.getCCustId().trim().length() > 0) {
			hql += " and o.C_CUST_ID like ? ";
		}
		// 贷款账号
		if (queryVO.getLnAcctNo() != null
				&& queryVO.getLnAcctNo().trim().length() > 0) {
			hql += " and o.LN_ACCT_NO like ? ";
		}
		// 开始
		if (queryVO.getStartRiskDate() != null
				&& queryVO.getStartRiskDate().trim().length() > 0) {
			hql += " and o.RISK_DATE >=  to_date('"+queryVO.getStartRiskDate()+"','yyyy-mm-dd') ";
		}
		// 结束
		if (queryVO.getEndRiskDate() != null
				&& queryVO.getEndRiskDate().trim().length() > 0) {
			hql += " and o.RISK_DATE <= to_date('"+queryVO.getEndRiskDate()+"','yyyy-mm-dd') ";
		}
		// 审核风险等级
		if(queryVO.getVerRiskLeve() != null
				&& queryVO.getVerRiskLeve().trim().length() > 0) {
			hql += " and o.VER_RISK_LEVE = ? ";
		}
		hql += " order by o.LN_ACCT_NO asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(RiskQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 客户名称
		if (queryVO.getCCustName() != null
				&& queryVO.getCCustName().trim().length() > 0) {
			list.add("%" + queryVO.getCCustName() + "%");
		}
		// 客户编号
		if (queryVO.getCCustId() != null
				&& queryVO.getCCustId().trim().length() > 0) {
			list.add("%" + queryVO.getCCustId() + "%");
		}
		// 贷款账号
		if (queryVO.getLnAcctNo() != null
				&& queryVO.getLnAcctNo().trim().length() > 0) {
			list.add("%" + queryVO.getLnAcctNo() + "%");
		}
		// 审核风险等级
		if(queryVO.getVerRiskLeve() != null
				&& queryVO.getVerRiskLeve().trim().length() > 0) {
			list.add(queryVO.getVerRiskLeve());
		}
		return list;
	}
	
	/**
	 * 根据贷款账号删除风险信息
	 * 
	 * @param lnIds
	 */
	public void delete(String[] lnIds) {
		for (int i = 0; i < lnIds.length; i++) {
			String lnNo = lnIds[i];
			String sql = "delete from WD_LN_MORE_INFOR w where w.LN_ACCT_NO = "
					+ lnNo;
			publicDao.getJdbcTemplate().execute(sql);
		}
	}
	
}
