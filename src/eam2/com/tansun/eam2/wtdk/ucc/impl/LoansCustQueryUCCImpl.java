package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.service.ILoansCustQueryBS;
import com.tansun.eam2.wtdk.ucc.ILoansCustQueryUCC;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 贷款客户查询
 * 
 * @author 陈煜霄
 * @date 2010-12-27
 */
@Service
public class LoansCustQueryUCCImpl implements ILoansCustQueryUCC {

	@Autowired
	private ILoansCustQueryBS loansCustQueryBSImpl;

	/**
	 * 查询基金客户
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(CustomersQueryVO queryVO, Paginator paginator) {
		return loansCustQueryBSImpl.query(queryVO, paginator);
	}

	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public CrtDccCicifci1 findCiCustByCustNo(String ciCustNo) {
		return loansCustQueryBSImpl.findCiCustByCustNo(ciCustNo);
	}

	/**
	 * 通过客户编号查找贷款信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findLnByCustNo(String ciCustNo) {
		return loansCustQueryBSImpl.findLnByCustNo(ciCustNo);
	}

	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids) {
		return loansCustQueryBSImpl.query4excel(ids);
	}

}
