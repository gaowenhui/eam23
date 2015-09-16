package com.tansun.eam2.zccz.service;

import java.util.*;
import com.tansun.rdp4j.common.web.vo.CommonBO;
/**
 * 万能表数据访问的BS定义
 * @author Administrator
 *
 */
public interface IWNBBS {
	public void save(CommonBO commonBO);
	public void update(CommonBO commonBO);
	public void delete(CommonBO commonBO);
	/**
	 * 根据虚拟表名称,得到所有数据列定义的列表
	 * @param zd_code
	 * @return ColBO组成的List对象
	 */
	public List getColList(String zd_code);
	
	/**
	 * 根据项目ID,资产ID,虚拟表编号，得到对应的万能表实际数据
	 * @param xm_id
	 * @param zc_id
	 * @param zd_code
	 * @return WNBBO组成的List对象
	 */
	public List getWNBList(String xm_id,String zc_id,String zd_code);
	
	/**
	 * 根据WNB_ID，检索对应的WNB　BO对象
	 * @param wnb_id 万能表的ID
	 * @return 万能表的BO对象，如果没有找到，返回null
	 */
	public CommonBO retrieveWNBBO(String wnb_id);
	
	/**
	 * 保存一个万能表BO对象到后台数据库去
	 * @param wnbbo
	 */
	public void saveWNBBO(CommonBO wnbbo);
	
}
