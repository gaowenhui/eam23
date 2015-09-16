package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.service.IFuncQueryBS;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
@Service
public class FuncQueryUCCImpl implements IFuncQueryUCC {

	@Autowired
	private IFuncQueryBS funcQueryBSImpl;

	/**
	 * 基金查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(FuncQueryVO queryVO, Paginator paginator) {
		return funcQueryBSImpl.query(queryVO, paginator);
	}

	/**
	 * 根据基金系统账号查找基金信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public FuncQueryVO findFuncInfoByFuncNo(String funcNo) {
		return funcQueryBSImpl.findFuncInfoByFuncNo(funcNo);
	}

	/**
	 * 通过账号查找交易明细
	 * 
	 * @return
	 */
	public String findSaacByFuncNo(String funcNo) {
		return funcQueryBSImpl.findSaacByFuncNo(funcNo);
	}

	/**
	 * 查找基金关联的贷款信息
	 * 
	 * @param funcNo
	 * @return
	 */
	public String findLnByFuncNo(String funcNo) {
		return funcQueryBSImpl.findLnByFuncNo(funcNo);
	}

	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids) {
		return funcQueryBSImpl.query4excel(ids);
	}

}
