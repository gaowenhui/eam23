package com.tansun.eam2.cjtz.ucc;

import java.lang.reflect.InvocationTargetException;


public interface ICjtzBodyUcc {

	/**
	 * 添加自用资产到body表中
	 * @param zcIds : 自用资产的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 */
	public void addOtherZyzc(String zcIds, String cldId);
	
	/**
	 * 添加经营性固定资产\待处置资产 到body表中
	 * @param zcIds : 经营固定资产\待处置资产的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 */
	public void addOtherJygdzc(String zcIds, String cldId, String fenlei);
	
	/**
	 * 添加债券 到body表中
	 * @param zqIds : 债券的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 */
	public void addOtherZQuan(String zqIds, String cldId);
	
	/**
	 * 添加实体 到body表中
	 * @param stIds : 实体的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addOtherSti(String stIds, String cldId) throws IllegalAccessException, InvocationTargetException;
	
	/**
	 * 添加委贷抵债物 到body表中
	 * @param loanId	:	委贷Id
	 * @param landList	:	土地资产Id
	 * @param houseList	:	房屋资产Id
	 * @param machineList	:	机器资产Id
	 * @param trafficList	:	交通工具资产Id
	 * @param otherassetList	:	其它资产Id
	 * @param cldId		:	处理单Id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addOtherWddzw(String loanId, String landList, String houseList, String machineList,
			String trafficList,String otherassetList, String cldId) throws IllegalAccessException, InvocationTargetException;
	
	/**
	 * 添加实体内资产 到body表中
	 * @param stid	:	实体Id
	 * @param landList	:	土地资产Id
	 * @param houseList	:	房屋资产Id
	 * @param machineList	:	机器资产Id
	 * @param trafficList	:	交通工具资产Id
	 * @param otherassetList	:	其它资产Id
	 * @param cldId		:	处理单Id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addOtherStlzc(String stid, String landList, String houseList, String machineList,
			String trafficList,String otherassetList, String cldId) throws IllegalAccessException, InvocationTargetException;
	
	public String getOtherBodyJson(String cldId);
	
	public String getStlxByStid(String stid);
}
