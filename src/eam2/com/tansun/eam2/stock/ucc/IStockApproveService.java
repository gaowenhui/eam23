package com.tansun.eam2.stock.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockSbody;
import com.tansun.eam2.common.model.orm.bo.StockShead;

public interface IStockApproveService {

	public StockInfo getStockSbodyById(String id,String stockId);
	/**
	 *新增或保存 
	 * @param ss
	 */
	public void saveHead(StockShead ss);
	
	/**
	 * 新增
	 * @param head
	 */
	public void newHead(StockShead head);
	
	/**
	 * 通过id查找StockShead表是否为新增
	 * @param id
	 * @return
	 */
	public StockShead viewStockShead(String id);
	
	/**
	 * 保存所选债券信息
	 * @param StockIds
	 * @param sheadId
	 */
	public void saveStockList(String[] StockIds,String sheadId);
	
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<StockSbody> viewStockList(String id);
	
	/**
	 * 删除表体
	 */
	public void deleteStockSbody(String[] Id);
	
	//债券审批作废时释放编号
	public void releaseStockSheadBianhao(String stockId);
}
