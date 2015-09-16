package com.tansun.eam2.stock.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockSdzmzXx;
import com.tansun.eam2.stock.service.IStockInvestBS;
import com.tansun.eam2.stock.ucc.IStockInvestService;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
@Service
public class stockInvestServiceImpl implements IStockInvestService {
	@Autowired
	IStockInvestBS stockBS;
	
	public IStockInvestBS getStockBS() {
		return stockBS;
	}

	public void setStockBS(IStockInvestBS stockBS) {
		this.stockBS = stockBS;
	}

	/**
	 * 2009.6债券投资清单查询
	 * @param stockVO
	 * @return
	 */
	public List listStock(Paginator paginator,StockQueryVO stockVO){
		 List list = stockBS.listStock(paginator,stockVO);
		 return list;
	}
	
	
	/**
	 * 通过id查询债券投资详细信息
	 * @param id
	 * @return
	 */
	public StockList viewDetail(String id){
		return (StockList)stockBS.viewDetail(id);
	}
	
	
	
	/**
	 * 查看stock
	 * @param id
	 * @return
	 */
	public List<StockSdzmzXx> listStockAss(String id){
		return stockBS.listStockAss(id);
	}
	
	
	/**
	 * 查看stock明细
	 * @param id
	 * @return
	 */
	public List<StockInfo> listStockDetailAss(String id){
		
		return (List<StockInfo>)stockBS.listStockDetailAss(id);
	}
}
