package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.service.IFuncCustQueryBS;
import com.tansun.eam2.wtdk.ucc.IFuncCustQueryUCC;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 基金客户查询
 * 
 * @author 陈煜霄
 * @date 2010-12-27
 */
@Service
public class FuncCustQueryUCCImpl implements IFuncCustQueryUCC {

	@Autowired
	private IFuncCustQueryBS funcCustQueryBSImpl;

	/**
	 * 查询基金客户
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(CustomersQueryVO queryVO, Paginator paginator) {
		return funcCustQueryBSImpl.query(queryVO, paginator);
	}

	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public CrtDccCicifci1 findCiCustByCustNo(String ciCustNo) {
		return funcCustQueryBSImpl.findCiCustByCustNo(ciCustNo);
	}

	/**
	 * 通过客户编号查找基金信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findFundByCustNo(String ciCustNo) {
		return funcCustQueryBSImpl.findFundByCustNo(ciCustNo);
	}

	/**
	 * 勾选导出excel
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids) {
		return funcCustQueryBSImpl.query4excel(ids);
	}

}
