package com.tansun.eam2.jfreeChart.chartUcc.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartService.ChartService;
import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

@Service
public class ChartUCCImpl implements ChartUCC {
	
	private ChartService chartService;

	public ChartService getChartService() {
		return chartService;
	}
	@Autowired
	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

	
	/**
	 * 查询金额 
	 * @param 
	 * @return
	 */
	public HashMap queryCount(){
		return chartService.queryCount();
	}
	
	/**
	 * 委托贷款饼图数据查询
	 * @param 
	 * @return
	 */
	public HashMap queryWdData(){
		return chartService.queryWdData();
	}
	
	
	/**
	 * 查询委托贷款数据
	 * @param 
	 * @return
	 */
	public HashMap queryWtdkData(String addr){
		return chartService.queryWtdkData(addr);
	}
	
	/**
	 * 查询实体人员安置
	 * @param 
	 * @return
	 */
	public HashMap queryDealPsersonData(String addr){
		return chartService.queryDealPsersonData(addr);
	}
	
	
	/**
	 * 查询出租率 
	 * @param 
	 * @return
	 */
	public double queryData2(HashMap map){
		return chartService.queryData2(map);
	}
	
	/**
	 *  按年统计合同租金收入
	 * @param 
	 * @return
	 */
	public double queryHtzjDataByYear(HashMap map){
		return chartService.queryHtzjDataByYear(map);
	}
	
	/**
	 * 查询出租率 (按月统计)
	 * @param 
	 * @return
	 */
	public double queryDataByMonth(HashMap map){
		return chartService.queryDataByMonth(map);
	}
	
	/**
	 * 统计某年各月的合同租金收入
	 * @param 
	 * @return
	 */
	public double queryHtzjsrDataByYearMonth(HashMap map){
		return chartService.queryHtzjsrDataByYearMonth(map);
	}
	
	
	/**
	 * 查询近期出租率 (按月统计)
	 * @param 
	 * @return
	 */
	public double queryDataByNearMonths(HashMap map){
		return chartService.queryDataByNearMonths(map);
	}
	
	/**
	 * 统计近期日常费用
	 * @param 
	 * @return
	 */
	public double queryDataByRcfy(List list){
		return chartService.queryDataByRcfy(list);
	}
	
	/**
	 * 统计近期资产日常费用（报销费用）
	 * @param 
	 * @return
	 */
	public double queryDataByRcfyBxfy(List list){
		return chartService.queryDataByRcfyBxfy(list);
	}
	
	
	
	/**
	 *  统计近期合同租金收入
	 * @param 
	 * @return
	 */
	public double queryLastDataByHtzj(HashMap map){
		return chartService.queryLastDataByHtzj(map);
	}
	

	
	/**
	 * 统计近期实体日常管理费用
	 * @param 
	 * @return
	 */
	public double queryStrcfyByNearMonths(HashMap map){
		return chartService.queryStrcfyByNearMonths(map);
	}
	
	/**
	 * 查询资产处置金额 
	 * @param 
	 * @return
	 */
	public HashMap queryDealData(){
		return chartService.queryDealData();
	}
   
	
	
	/**
	 * 诉讼原币原值统计
	 * @param 
	 * @return
	 */
	public double queryYbyzData(HashMap map){
		return chartService.queryYbyzData(map);
	}

	
	/**
	 * 查询数据list
	 * @param 
	 * @return
	 */
	public List queryDataList(HashMap map){
		return chartService.queryDataList(map);
	}
	
	/**
	 * 地图上统计资产日常费用
	 * @param 
	 * @return
	 */
	public HashMap queryRcfyData(HashMap map){
		return chartService.queryRcfyData(map);
	}
	
	/**
	 *  地图上统计实体日常费用
	 * @param 
	 * @return
	 */
	public HashMap queryStrcfyData(HashMap map){
		return chartService.queryStrcfyData(map);
	}
	
	
	/**
	 *  地图上统计资产处置
	 * @param 
	 * @return
	 */
	public HashMap queryZcczData(HashMap map){
		return chartService.queryZcczData(map);
	}
	
	
	/**
	 *  地图上统计实体整体处置
	 * @param 
	 * @return
	 */
	public HashMap queryStztczData(HashMap map){
		return chartService.queryStztczData(map);
	}
	
	
	/**
	 *  地图上统计实体人员安置
	 * @param 
	 * @return
	 */
	public HashMap queryStryazta(HashMap map){
		return chartService.queryStryazta(map);
	}
	
	
	/**
	 * 地图上统计诉讼案件
	 * @param 
	 * @return
	 */
	public HashMap querySsajData(HashMap map){
		return chartService.querySsajData(map);
	}
	
	/**
	 *  地图上统计债权金额
	 * @param 
	 * @return
	 */
	public HashMap queryZqData(HashMap map){
		return chartService.queryZqData(map);
	}
	
	/**
	 * 地图上统计担险委托贷款余额
	 * @param 
	 * @return
	 */
	public HashMap queryDxwddkData(HashMap map){
		return chartService.queryDxwddkData(map);
	}
	
	
	/**
	 * 地图上统计债券金额
	 * @param 
	 * @return
	 */
	public HashMap queryZq2Data(HashMap map){
		return chartService.queryZq2Data(map);
	}
	
	
	/**
	 * 经营类资产统计
	 * @param 
	 * @return
	 */
	public HashMap queryJylzcData(HashMap map){
		return chartService.queryJylzcData(map);
	}
	
	
	/**
	 * 地图上统计合同租金收入
	 * @param 
	 * @return
	 */
	public HashMap queryHtzj(HashMap map){
		return chartService.queryHtzj(map);
	}
	
	
	/**
	 * 查询省的名称
	 * @param 
	 * @return
	 */
	public String queryCityName(String codeId){
		return chartService.queryCityName(codeId);
	}
	

	/**
	 * 按时间、省统计委托贷款余额
	 * @param 
	 * @return
	 */
	public double queryWtdkDataByTime(List list){
		return chartService.queryWtdkDataByTime(list);
	}
	

}
