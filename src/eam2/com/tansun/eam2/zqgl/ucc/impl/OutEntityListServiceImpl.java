package com.tansun.eam2.zqgl.ucc.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.zqgl.service.IOutEntityListBS;
import com.tansun.eam2.zqgl.ucc.IOutEntityListService;
import com.tansun.eam2.zqgl.vo.OutEntityVO;
import com.tansun.rdp4j.common.util.Paginator;
@Service
public class OutEntityListServiceImpl implements IOutEntityListService {
	@Autowired
	private IOutEntityListBS outBS;
	
	/**
	 * 外部实体维护列表
	 */
	public List<StJbxx> outEntityList(Paginator paginator,OutEntityVO oeVO,String stType) {
		return outBS.outEntityList(paginator,oeVO,stType);
	}

	/**
	 * 插入一条实体信息
	 * @param st
	 */
	public void newEntity(StJbxx st){
		outBS.newEntity(st);
	}
	
	/**
	 * 保存一条实体信息
	 * @param st
	 */
	public void saveEntity(StJbxx st){
		outBS.saveEntity(st);
	}
	
	/**
	 * 根据id查找实体基本信息
	 * @param id
	 * @return
	 */
	public StJbxx getStJbxxInfo(String id){
		return outBS.getStJbxxInfo(id);
	}
	
	/**
	 * 删除外部实体
	 * @param id
	 */
	public void deleteStJbxx(String[] id){
		outBS.deleteStJbxx(id);
	}

	public IOutEntityListBS getOutBS() {
		return outBS;
	}

	public void setOutBS(IOutEntityListBS outBS) {
		this.outBS = outBS;
	}
	
	public void saveSSchangePro(StJbxx stJbxx_old, StJbxx stJbxx_new,String opType){
		outBS.saveSSchangePro(stJbxx_old, stJbxx_new, opType);
	}
}
