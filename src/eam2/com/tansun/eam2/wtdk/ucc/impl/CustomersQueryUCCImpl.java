package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.service.ICustomersQueryBS;
import com.tansun.eam2.wtdk.ucc.ICustomersQueryUCC;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-02 客户查询
 */

@Service
public class CustomersQueryUCCImpl implements ICustomersQueryUCC {

	@Autowired
	private ICustomersQueryBS customersBS;

	/**
	 * 客户基本信息查询
	 */
	public String query(CustomersQueryVO queryVO, Paginator paginator) {
		return customersBS.query(queryVO, paginator);
	}

	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public CrtDccCicifci1 findCiCustByCustNo(String ciCustNo) {
		return customersBS.findCiCustByCustNo(ciCustNo);
	}

	/**
	 * 通过客户编号查找基金信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findFundByCustNo(String ciCustNo) {
		return customersBS.findFundByCustNo(ciCustNo);
	}

	/**
	 * 通过客户编号查找贷款信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findLnByCustNo(String ciCustNo) {
		return customersBS.findLnByCustNo(ciCustNo);
	}
}
