package com.tansun.eam2.stock.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockSdzmzXx;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

public interface IStockInvestBS {

	
	/**
	 * 2009.6债券投资清单查询
	 * @param stockVO
	 * @return
	 */
	public List listStock(Paginator paginator,StockQueryVO stockVO);
	
	
	/**
	 * 通过id查询债券投资详细信息
	 * @param id
	 * @return
	 */
	public StockList viewDetail(String id);
	
	
	/**
	 * 查看stock
	 * @param id
	 * @return
	 */
	public List<StockSdzmzXx> listStockAss(String id);
	
	
	/**
	 * 查看stock明细
	 * @param id
	 * @return
	 */
	public List<StockInfo> listStockDetailAss(String id);
}
