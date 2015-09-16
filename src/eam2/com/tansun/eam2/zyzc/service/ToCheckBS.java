package com.tansun.eam2.zyzc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.rdp4j.common.util.Paginator;

public interface ToCheckBS {
	/**
	 * 在资产表和台账表中根据资产ID查询出数据然后存到ZyPdxx对象中，为保存到盘点信息表做准备
	 */
	public ZyPdxx createZyPdxxByZcId(String zcId);
	
	/**
	 * 弹出页面中根据传过来的ZyPdxx(bo)中存储的查询条件查询出资产表和台账表中的数据
	 * 存到List<ZyPdxx>并返回
	 */
	public List<ZyZc> subPageQueryWithCondition(ZyPdxx zyPdxx,Paginator paginator);
	
	//盘点
	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx,String pclx,Paginator paginator);

	//盘库非易耗品
	public List<ZyZc> subPageQueryWithCondition(ZyPdxx zyPdxx,String pclx,String isConsuming,Paginator paginator);
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,Paginator paginator);
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,String pclx,Paginator paginator);
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,String pclx,String isConsuming,Paginator paginator);
	
	/**
	 * 根据Pdxx中的查询条件到台账表中查询数据，供批次查询使用
	 */
	public String queryWithCondition(PdxxVO pdxxVo);
	
	/**
	 * 根据资产ID在pdxx表中查询单条ZyPdxx记录
	 */
	//public ZyPdxx findZyPdxxWithzcId(String zcId);
	
	/**
	 * 根据表UUID在pdxx表中查询单条ZyPdxx记录
	 */
	public ZyPdxx findZyPdxxWithID(String id);
	
	/**
	 * 查询出盘点信息表中所有的数据
	 */
	public List<ZyPdxx> queryAllPdxx();
	
	public List<ZyPdxx> queryPdxxWithPclx(String pclx);
	
	/**
	 * 查询出已经办结了个盘点信息 
	 */
	public List<ZyPdxx> queryPdxxEnd();
	
	/**
	 * 到盘点信息表中查询出所有盘点批次为空的记录
	 * @return
	 */
	public List<ZyPdxx> queryPdxxWithoutPdpc(Paginator paginator);
	
	public List<ZyPdxx> queryAllPdxxWithoutPdpc();
	
	/**
	 * 到盘点信息表中查询出所有盘点批次为空的记录（没有分页器）
	 * @return
	 */
	public List<ZyPdxx> queryPdxxWithoutPdpc();

	/**
	 * 保存ZyPdxx对象到盘点信息表中
	 */
	public void saveZyPdxx(ZyPdxx zyPdxx);
	
	/**
	 * 更新盘点信息表
	 */
	public void update(ZyPdxx zyPdxx);
	
	/**
	 * 根据表体zcId删除相应的记录
	 */
	public void deleteBody(String[] delIds);
	
	/**
	 * 根据盘点批次在pdxx表中查询单条ZyPdxx记录
	 */
	public List<ZyPdxx> findZyPdxxWithPdpc(String pdpc);
	
	public List<ZyPdxx> findZyPdxxWithPdpcAndPager(String pdpc,Paginator paginator);
	
	/**
	 * 根据页面的盘点信息ID得到盘点详细信息
	 * @return
	 */
	public ZyPdxx modifyBody(String zyPdID);
	
	/**
	 * 根据headId到pdxx表中查找pdpc
	 * @param headId
	 * @return
	 */
	public String getPdpcWithHeadId(String headId);
	
	/**
	 * 根据Pdxx中的查询条件(盘点批次，盘点日期)到台账表中查询数据，供批次查询使用
	 */
	public String query4PanYingPanKui(PdxxVO pdxxVo,Paginator paginator);
	
	public String getMaxPdpc(String pclx);
	
	public void deleteRedundancyDataFromPdxx(String headId,String pc);
	
}
