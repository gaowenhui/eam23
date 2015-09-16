package com.tansun.eam2.zyzc.service;

import java.util.Map;

import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.util.Paginator;

public interface GoodReturnBS {

	/**
	 * 自用资产资产归还查询
	 * 
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	public String queryReturn(QueryPurchaseVo queryPurVo, Paginator paginator);

	/**
	 * 查找一级分类列表
	 */
	public Map<String, String> findYjFl();


}
