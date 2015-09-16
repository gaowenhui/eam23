package com.tansun.eam2.zqgl.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.zqgl.vo.OutEntityVO;
import com.tansun.rdp4j.common.util.Paginator;

public interface IOutEntityListService {

	
	/**
	 * 外部实体维护列表
	 */
	public List<StJbxx> outEntityList(Paginator paginator,OutEntityVO oeVO,String stType);

	/**
	 * 插入一条实体信息
	 * @param st
	 */
	public void newEntity(StJbxx st);
	
	/**
	 * 保存一条实体信息
	 * @param st
	 */
	public void saveEntity(StJbxx st);
	
	/**
	 * 根据id查找实体基本信息
	 * @param id
	 * @return
	 */
	public StJbxx getStJbxxInfo(String id);
	
	/**
	 * 删除外部实体
	 * @param id
	 */
	public void deleteStJbxx(String[] id);
	
	
	public void saveSSchangePro(StJbxx stJbxx_old, StJbxx stJbxx_new,String opType);
}
