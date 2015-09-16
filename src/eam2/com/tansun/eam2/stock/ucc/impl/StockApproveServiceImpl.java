package com.tansun.eam2.stock.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockSbody;
import com.tansun.eam2.common.model.orm.bo.StockShead;
import com.tansun.eam2.stock.service.IStockApproveBS;
import com.tansun.eam2.stock.ucc.IStockApproveService;
@Service
public class StockApproveServiceImpl implements IStockApproveService {
	@Autowired
	private IStockApproveBS stBS;

	/**
	 * 通过id查找StockShead表是否为新增
	 * @param id
	 * @return
	 */
	public StockShead viewStockShead(String id){
		return stBS.viewStockShead(id);
	}
	
	
	/**
	 *保存 
	 * @param ss
	 */
	public void saveHead(StockShead head){
			stBS.saveHead(head);
	}
	
	
	/**
	 * 新增
	 * @param head
	 */
	public void newHead(StockShead head){
		stBS.newHead(head);
	}

	
	
	/**
	 * 保存所选债券信息
	 * @param StockIds
	 * @param sheadId
	 */
	public void saveStockList(String[] StockIds,String sheadId){
		stBS.saveStockList(StockIds, sheadId);
	}

	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<StockSbody> viewStockList(String id){
		return stBS.viewStockList(id);
	}
	
	
	
	/**
	 * 删除表体
	 */
	public void deleteStockSbody(String[] Id){
		stBS.deleteStockSbody(Id);
	}
	
	
	public IStockApproveBS getStBS() {
		return stBS;
	}


	public void setStBS(IStockApproveBS stBS) {
		this.stBS = stBS;
	}
	
	
	//债券审批作废时释放编号
	public void releaseStockSheadBianhao(String stockId){
		stBS.releaseStockSheadBianhao(stockId);
	}


	public StockInfo getStockSbodyById(String stockId,String id) {
		return stBS.getStockSbodyById(stockId,id);
	}
}
