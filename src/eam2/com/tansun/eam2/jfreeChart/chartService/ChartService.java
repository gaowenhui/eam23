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
public interface ChartService {
	
	/**
	 * 查询金额 
	 * @param 
	 * @return
	 */
	public HashMap queryCount();
	
	/**
	 * 委托贷款饼图数据查询
	 * @param 
	 * @return
	 */
	public HashMap queryWdData();
	
	
	/**
	 *查询委托贷款数据
	 * @param 
	 * @return
	 */
	public HashMap queryWtdkData(String addr);
	
	
	/**
	 *  查询实体人员安置
	 * @param 
	 * @return
	 */
	public HashMap queryDealPsersonData(String addr);
	
	
	/**
	 * 查询出租率 
	 * @param 
	 * @return
	 */
	public double queryData2(HashMap map);
	
	
	/**
	 * 按年统计合同租金收入
	 * @param 
	 * @return
	 */
	public double queryHtzjDataByYear(HashMap map);
	
	
	/**
	 * 查询出租率 
	 * @param 
	 * @return
	 */
	public double queryDataByMonth(HashMap map);
	
	/**
	 * 统计某年各月的合同租金收入
	 * @param 
	 * @return
	 */
	public double queryHtzjsrDataByYearMonth(HashMap map);
	
	
	/**
	 * 查询近期出租率 
	 * @param 
	 * @return
	 */
	public double queryDataByNearMonths(HashMap map);
	
	/**
	 * 查询近期日常费用
	 * @param 
	 * @return
	 */
	public double queryDataByRcfy(List list);
	
	/**
	 * 统计近期资产日常费用（报销费用）
	 * @param 
	 * @return
	 */
	public double queryDataByRcfyBxfy(List list);
	
	
	/**
	 * 统计近期合同租金收入
	 * @param 
	 * @return
	 */
	public double queryLastDataByHtzj(HashMap map);
	
	
	/**
	 * 统计近期实体日常管理费用
	 * @param 
	 * @return
	 */
	public double queryStrcfyByNearMonths(HashMap map);
	
	
	/**
	 *  查询资产处置金额 
	 * @param 
	 * @return
	 */
	public HashMap queryDealData();
	

	
	/**
	 * 诉讼原币原值统计
	 * @param 
	 * @return
	 */
	public double queryYbyzData(HashMap map);
	
	
	/**
	 *  查询数据List
	 * @param 
	 * @return
	 */
	public List queryDataList(HashMap map);
	
	
	/**
	 *  地图上统计资产日常费用
	 * @param 
	 * @return
	 */
	public HashMap queryRcfyData(HashMap map);
	
	/**
	 *  地图上统计实体日常费用
	 * @param 
	 * @return
	 */
	public HashMap queryStrcfyData(HashMap map);
	
	
	/**
	 *  地图上统计资产处置
	 * @param 
	 * @return
	 */
	public HashMap queryZcczData(HashMap map);
	
	
	/**
	 *  地图上统计实体整体处置
	 * @param 
	 * @return
	 */
	public HashMap queryStztczData(HashMap map);
	
	
	/**
	 * 地图上统计实体人员安置
	 * @param 
	 * @return
	 */
	public HashMap queryStryazta(HashMap map);
	
	
	/**
	 *  地图上统计诉讼案件
	 * @param 
	 * @return
	 */
	public HashMap querySsajData(HashMap map);
	
	
	/**
	 *  地图上统计债权金额
	 * @param 
	 * @return
	 */
	public HashMap queryZqData(HashMap map);
	
	/**
	 *   地图上统计担险委托贷款余额
	 * @param 
	 * @return
	 */
	public HashMap queryDxwddkData(HashMap map);
	
	

	/**
	 *   地图上统计债券金额
	 * @param 
	 * @return
	 */
	public HashMap queryZq2Data(HashMap map);
	
	
	
	/**
	 *  经营类资产统计
	 * @param 
	 * @return
	 */
	public HashMap queryJylzcData(HashMap map);
	
	
	
	/**
	 *  地图上统计合同租金收入
	 * @param 
	 * @return
	 */
	public HashMap queryHtzj(HashMap map);
	

	/**
	 * 查询省的名称
	 * @param 
	 * @return
	 */
	public String  queryCityName(String codeId);
	
	
	/**
	 * 按时间、省统计委托贷款余额
	 * @param 
	 * @return
	 */
	public double queryWtdkDataByTime(List list);
	
}
