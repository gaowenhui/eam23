package com.tansun.eam2.wtdk.service;

import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.eam2.wtdk.vo.RiskQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
public interface IRiskQueryBS {
	
	/**
	 * 查询风险信息
	 * @param riskVO
	 * @param paginator
	 * @return
	 */
	public String query(RiskQueryVO queryVO,Paginator paginator);
	
	/**
	 * 根据贷款账号删除风险信息
	 * @param lnIds
	 */
	public void delete(String[] lnIds);
	
}
