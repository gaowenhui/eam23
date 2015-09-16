/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.jfreeChart.chartService;

import java.util.HashMap;
import java.util.List;


/**
 *
 * @author chengxiang.zhou
 */
public interface MapTjService {
	
	/**
	 *  查询数据list（全资产统计）
	 * @param 
	 * @return
	 */
	public List queryDataQzcList();
	
	
	/**
	 *  查询数据list（经营类资产统计）
	 * @param 
	 * @return
	 */
	public List queryDataJylzcList();
	
	
	
	/**
	 *  查询数据list（委托贷款统计）
	 * @param 
	 * @return
	 */
	public List queryDataWtdkList();
	
	/**
	 *  查询数据list（担险委托贷款统计）
	 * @param 
	 * @return
	 */
	public List queryDataDxwtdkList();
	
	/**
	 *  查询数据list（资产日常费用）
	 * @param 
	 * @return
	 */
	public List queryDataZcrcfyList();
	
	/**
	 *  查询数据list（合同租金收入）
	 * @param 
	 * @return
	 */
	public List queryDataHtzjsrList();
	
	/**
	 *  查询数据list（实体日常管理费用）
	 * @param 
	 * @return
	 */
	public List queryDataStrcglfyList();
	
	/**
	 *  查询数据list（债权）
	 * @param 
	 * @return
	 */
	public List queryDataZqList();
	
	/**
	 *  查询数据list（债券）
	 * @param 
	 * @return
	 */
	public List queryDataZq2List();
	
	/**
	 *  查询数据list（资产处置）
	 * @param 
	 * @return
	 */
	public List queryDataZcczList();
	
	/**
	 *  查询数据list（实体整体处置））
	 * @param 
	 * @return
	 */
	public List queryDataStztczList();
	
	
	/**
	 *  查询数据list（实体人员安置）
	 * @param 
	 * @return
	 */
	public List queryDataStryazList();
	
	/**
	 *  查询数据list（诉讼信息统计）
	 * @param 
	 * @return
	 */
	public List queryDataSusongList();
	
	
}
