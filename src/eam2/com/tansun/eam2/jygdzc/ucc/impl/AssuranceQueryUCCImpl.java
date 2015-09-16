package com.tansun.eam2.jygdzc.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jygdzc.service.IAssuranceQueryBS;
import com.tansun.eam2.jygdzc.ucc.IAssuranceQueryUCC;
import com.tansun.eam2.jygdzc.vo.AssuranceQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 投保申请查询
 * 
 * @author 陈煜霄
 * @date 2010-12-15
 */
@Service
public class AssuranceQueryUCCImpl implements IAssuranceQueryUCC {

	@Autowired
	private IAssuranceQueryBS assuranceQueryBSImpl;

	/**
	 * 投保申请查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryAssurance(AssuranceQueryVO queryVO, Paginator paginator) {
		return assuranceQueryBSImpl.queryAssurance(queryVO, paginator);
	}

	public List<AssuranceQueryVO> queryAssurance(String ids) {
		return assuranceQueryBSImpl.queryAssurance(ids);
	}

}
