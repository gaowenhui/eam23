package com.tansun.eam2.wtdk.service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-02 客户查询
 */
public interface ICustomersQueryBS {

	/**
	 * 客户基本信息查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(CustomersQueryVO queryVO, Paginator paginator);

	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public CrtDccCicifci1 findCiCustByCustNo(String ciCustNo);

	/**
	 * 通过客户编号查找基金信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findFundByCustNo(String ciCustNo);

	/**
	 * 通过客户编号查找贷款信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findLnByCustNo(String ciCustNo);

}
