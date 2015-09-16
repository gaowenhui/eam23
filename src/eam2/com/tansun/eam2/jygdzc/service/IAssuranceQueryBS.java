package com.tansun.eam2.jygdzc.service;

import java.util.List;

import com.tansun.eam2.jygdzc.vo.AssuranceQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 投保申请查询
 * 
 * @author 陈煜霄
 * @date 2010-12-15assuranceQueryUCCImpl
 */
public interface IAssuranceQueryBS {

	/**
	 * 投保申请查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryAssurance(AssuranceQueryVO queryVO, Paginator paginator);
	public List<AssuranceQueryVO> queryAssurance(String ids);
}
