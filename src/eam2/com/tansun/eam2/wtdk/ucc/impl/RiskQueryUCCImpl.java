package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.wtdk.service.IRiskQueryBS;
import com.tansun.eam2.wtdk.ucc.IRiskQueryUCC;
import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.eam2.wtdk.vo.RiskQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
@Service
public class RiskQueryUCCImpl implements IRiskQueryUCC {

	@Autowired
	private IRiskQueryBS riskQueryBSImpl;

	/**
	 * 查询风险信息
	 * 
	 * @param riskVO
	 * @param paginator
	 * @return
	 */
	public String query(RiskQueryVO queryVO, Paginator paginator) {
		return riskQueryBSImpl.query(queryVO, paginator);
	}

	/**
	 * 根据贷款账号删除风险信息
	 * 
	 * @param lnIds
	 */
	public void delete(String[] lnIds) {
		riskQueryBSImpl.delete(lnIds);
	}

}
