package com.tansun.eam2.jfreeChart.chartUcc;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;


public interface MapTjUCC {
	
	
	/**
	 * 查询各省返回颜色（全资产统计）
	 * @param id
	 * @return
	 */
	public String queryDataQzcList();
	
	/**
	 * 查询各省返回颜色（经营类资产统计）
	 * @param id
	 * @return
	 */
	public String queryDataJylzcList();
	
	
	
	/**
	 * 查询各省返回颜色（委托贷款余额）
	 * @param id
	 * @return
	 */
	public String  queryDataWtdkList();
	
	
	/**
	 * 查询各省返回颜色（担险委托贷款余额）
	 * @param id
	 * @return
	 */
	public String  queryDataDxwtdkList();
	
	/**
	 * 查询各省返回颜色（资产日常费用）
	 * @param id
	 * @return
	 */
	public String  queryDataZcrcfyList();
	
	
	/**
	 * 查询各省返回颜色（合同租金收入）
	 * @param id
	 * @return
	 */
	public String  queryDataHtzjsrList();
	
	
	/**
	 * 查询各省返回颜色（实体日常管理费用）
	 * @param id
	 * @return
	 */
	public String  queryDataStrcglfyList();
	
	
	/**
	 * 查询各省返回颜色（债权）
	 * @param id
	 * @return
	 */
	public String  queryDataZqList();
	
	
	/**
	 * 查询各省返回颜色（债券）
	 * @param id
	 * @return
	 */
	public String  queryDataZq2List();
	
	/**
	 * 查询各省返回颜色（资产处置）
	 * @param id
	 * @return
	 */
	public String  queryDataZcczList();
	
	/**
	 * 查询各省返回颜色（实体整体处置）
	 * @param id
	 * @return
	 */
	public String  queryDataStztczList();
	
	
	/**
	 * 查询各省返回颜色（实体人员安置）
	 * @param id
	 * @return
	 */
	public String  queryDataStryazList();
	
	/**
	 * 查询各省返回颜色（诉讼信息统计）
	 * @param id
	 * @return
	 */
	public String  queryDataSusongList();
	
	
	/**
	 * 解析xml设置的值在页面中显示出范围
	 * @param id
	 * @return
	 * @throws FileNotFoundException 
	 */
	public HashMap  getXmlValues(String url) throws IOException;
	
	
	
}
