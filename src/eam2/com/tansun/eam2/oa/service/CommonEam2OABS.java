package com.tansun.eam2.oa.service;

import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;

/**
 * eam和oa 的关系表管理
 * @author mzq
 *
 */
public interface CommonEam2OABS {
	
	/**
	 * 保存eam2oa
	 * 
	 * @param eamoa
	 */
	public void saveEAM2OA(CommonEam2Oa eamoa);

	/**
	 * 根据流程ID查询信息
	 * @param lcid
	 */
	public CommonEam2Oa queryEAM2OAByLcid(String lcid);

	/**
	 * 根据表单ID查询信息
	 * @param headID
	 */
	public CommonEam2Oa queryEAM2OAByHeadID(String headID);
}
