package com.tansun.eam2.jfreeChart.chartUcc;

import java.util.HashMap;
import java.util.List;


public interface ChartUCC {
	
	/**
	 * 资产结构信息查询金额 
	 * @param id
	 * @return
	 */
	public HashMap queryCount();
	
	/**
	 * 委托贷款饼图数据查询
	 * @param id
	 * @return
	 */
	public HashMap queryWdData();
	
	/**
	 * 查询委托贷款数据
	 * @param id
	 * @return
	 */
	public HashMap queryWtdkData(String addr);
	
	
	/**
	 *  查询实体人员安置
	 * @param id
	 * @return
	 */
	public HashMap queryDealPsersonData(String addr);
	
	
	/**
	 * 查询出租率 
	 * @param id
	 * @return
	 */
	public double queryData2(HashMap map);
	
	/**
	 * 按年统计合同租金收入
	 * @param id
	 * @return
	 */
	public double queryHtzjDataByYear(HashMap map);
	
	
	/**
	 * 统计月出租率
	 * @param id
	 * @return
	 */
	public double queryDataByMonth(HashMap map);
	
	/**
	 * 统计某年各月的合同租金收入
	 * @param id
	 * @return
	 */
	public double queryHtzjsrDataByYearMonth(HashMap map);
	
	
	/**
	 * 统计近期出租率
	 * @param id
	 * @return
	 */
	public double queryDataByNearMonths(HashMap map);
	
	/**
	 * 统计近期资产日常费用（申请费用）
	 * @param id
	 * @return
	 */
	public double queryDataByRcfy(List list);
	
	/**
	 * 统计近期资产日常费用（报销费用）
	 * @param id
	 * @return
	 */
	public double queryDataByRcfyBxfy(List list);
	
	
	/**
	 * 统计近期合同租金收入
	 * @param id
	 * @return
	 */
	public double queryLastDataByHtzj(HashMap map);
	
	
	/**
	 * 统计近期实体日常管理费用
	 * @param id
	 * @return
	 */
	public double queryStrcfyByNearMonths(HashMap map);
	
	
	
	
	
	/**
	 * 资产处置查询金额 
	 * @param id
	 * @return
	 */
	public HashMap queryDealData();
	
	
	
	
	/**
	 * 诉讼原币原值统计
	 * @param id
	 * @return
	 */
	public double queryYbyzData(HashMap map);
	
	
	/**
	 * 查询数据list（公共）
	 * @param id
	 * @return
	 */
	public List queryDataList(HashMap map);
	
	
	/**
	 *  地图上统计资产日常费用
	 * @param id
	 * @return
	 */
	public HashMap queryRcfyData(HashMap map);
	
	
	/**
	 *  地图上统计实体日常费用
	 * @param id
	 * @return
	 */
	public HashMap queryStrcfyData(HashMap map);
	
	/**
	 *  地图上统计资产处置
	 * @param id
	 * @return
	 */
	public HashMap queryZcczData(HashMap map);
	
	/**
	 *  地图上统计实体整体处置
	 * @param id
	 * @return
	 */
	public HashMap queryStztczData(HashMap map);
	
	
	/**
	 *  地图上统计实体人员安置
	 * @param id
	 * @return
	 */
	public HashMap queryStryazta(HashMap map);
	
	
	/**
	 *  地图上统计诉讼案件
	 * @param id
	 * @return
	 */
	public HashMap querySsajData(HashMap map);
	
	/**
	 *  地图上统计债权金额
	 * @param id
	 * @return
	 */
	public HashMap queryZqData(HashMap map);
	
	
	/**
	 *  地图上统计担险委托贷款余额
	 * @param id
	 * @return
	 */
	public HashMap queryDxwddkData(HashMap map);
	
	
	
	/**
	 *  地图上统计债券金额
	 * @param id
	 * @return
	 */
	public HashMap queryZq2Data(HashMap map);
	
	
	/**
	 *  经营类资产统计
	 * @param id
	 * @return
	 */
	public HashMap queryJylzcData(HashMap map);
	
	
	/**
	 *  地图上统计合同租金收入
	 * @param id
	 * @return
	 */
	public HashMap queryHtzj(HashMap map);
	
	/**
	 * 查询省的名称
	 * @param id
	 * @return
	 */
	public String  queryCityName(String code);
	
	
	/**
	 * 按时间统计委托贷款余额
	 * @param id
	 * @return
	 */
	public double queryWtdkDataByTime(List list);
	
	
	
}
