package com.tansun.eam2.wtdk.service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
public interface IFuncQueryBS {
	/**
	 * 基金查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(FuncQueryVO queryVO, Paginator paginator);

	/**
	 * 根据基金系统账号查找基金信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public FuncQueryVO findFuncInfoByFuncNo(String funcNo);

	/**
	 * 通过账号查找交易明细
	 * 
	 * @return
	 */
	public String findSaacByFuncNo(String funcNo);

	/**
	 * 查找基金关联的贷款信息
	 * 
	 * @param funcNo
	 * @return
	 */
	public String findLnByFuncNo(String funcNo);

	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids);

}
