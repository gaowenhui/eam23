package com.tansun.eam2.oa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.oa.service.CommonEam2OABS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * eam和oa 的关系表管理
 * @author mzq
 *
 */
@Service
public class CommonEam2OABSImpl implements CommonEam2OABS{
	
	@Autowired
	public PublicDao publicDao;
	
	/**
	 * 保存eam2oa
	 * @param eamoa
	 */
	public void saveEAM2OA(CommonEam2Oa eamoa){
		if(eamoa.getId() == null || eamoa.getId().equals("")){
			publicDao.save(eamoa);
		}else{
			publicDao.update(eamoa);
		}
	}

	/**
	 * 根据流程ID查询信息
	 * @param lcid
	 */
	public CommonEam2Oa queryEAM2OAByLcid(String lcid){
		Object[] str = new Object[] { lcid };
		return (CommonEam2Oa) publicDao.findSingleResult("from CommonEam2Oa t where t.lcid = ?", str);
	}

	/**
	 * 根据表单ID查询信息
	 * @param headID
	 */
	public CommonEam2Oa queryEAM2OAByHeadID(String headID){
		Object[] str = new Object[] { headID };
		return (CommonEam2Oa) publicDao.findSingleResult("from CommonEam2Oa t where t.headid = ?", str);
	}
}
