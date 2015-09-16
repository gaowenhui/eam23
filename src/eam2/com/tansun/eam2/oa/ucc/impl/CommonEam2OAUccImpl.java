package com.tansun.eam2.oa.ucc.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.oa.service.CommonEam2OABS;
import com.tansun.eam2.oa.ucc.CommonEam2OAUcc;

/**
 * eam和oa 的关系表管理
 * @author mzq
 *
 */
@Service
public class CommonEam2OAUccImpl implements CommonEam2OAUcc{

	@Autowired
	private CommonEam2OABS commonEam2OABS;
	
	/**
	 * 保存eam2oa
	 * 
	 * @param eamoa
	 */
	public void saveEAM2OA(CommonEam2Oa eamoa){
		commonEam2OABS.saveEAM2OA(eamoa);
	}
	
	/**
	 * 根据流程ID查询信息
	 * @param lcid
	 */
	public CommonEam2Oa queryEAM2OAByLcid(String lcid){
		return commonEam2OABS.queryEAM2OAByLcid(lcid);
	}

	/**
	 * 根据表单ID查询信息
	 * @param headID
	 */
	public CommonEam2Oa queryEAM2OAByHeadID(String headID){
		return commonEam2OABS.queryEAM2OAByHeadID(headID);
	}
	
	/**
	 * 办结一个流程
	 * @param headID
	 */
	public void finishCommonEam2OABS(String lcid){
		CommonEam2Oa commonEam2Oa = commonEam2OABS.queryEAM2OAByLcid(lcid);
		commonEam2Oa.setUpdateDate(new Date());
		commonEam2Oa.setStatus("1");
		commonEam2OABS.saveEAM2OA(commonEam2Oa);
	}
}
