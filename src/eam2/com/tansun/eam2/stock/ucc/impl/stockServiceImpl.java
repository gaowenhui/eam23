package com.tansun.eam2.stock.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockShead;
import com.tansun.eam2.common.model.orm.bo.StockWorklog;
import com.tansun.eam2.stock.service.IStockBS;
import com.tansun.eam2.stock.ucc.IStockService;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class stockServiceImpl implements IStockService {

	PublicDao publicDao;
	@Autowired
	IStockBS stockBS;
	
	public IStockBS getStockBS() {
		return stockBS;
	}


	public void setStockBS(IStockBS stockBS) {
		this.stockBS = stockBS;
	}


	/**
	 * 债券日常维护清单查询
	 */
	public List listStockRework(StockQueryVO stockVO) {
		List list = stockBS.listStockRework(stockVO);
		return list;
	}

	/**
	 * 债券事项审批查询  债券信息列表
	 */
	@SuppressWarnings("unchecked")
	public String stockReworkList(StockQueryVO stockVO,String id,Paginator paginator){
		return stockBS.stockReworkList(stockVO,id ,paginator);
	}
	

	/**
	 * 新增/保存记录
	 * @param stwork
	 */
	public void saveEntity(StockWorklog stwork){
//		stwork = stockBS.viewStock(stwork.getLogid());
		if(stwork.getLogid() == null){
			stockBS.newEntity(stwork);
		}else{
			stwork.setSfbc("1");
			stockBS.saveStock(stwork);
		}
	}
	
	/**
	 * 通过债券id查询 该id下所有工作记录
	 * @param id
	 * @return
	 */
	public String workLogList(String id,Paginator paginator){
		String list = stockBS.workLogList(id,paginator);
		return list;
	}
	
	
	/**
	 * 通过债券id和催办人id查询 工作记录的详细信息
	 * @param stockId
	 * @param dunPersonId
	 * @return
	 */
	public StockWorklog workLogDetail(String stockId , String dunPersonId ){
		
		return (StockWorklog)stockBS.workLogDetail(stockId, dunPersonId);
	}
	
	
	/**
	 * 新增/保存记录
	 * @param sb
	 */
	public void saveStockBook(StockBookvalue sb,String yearData){
		StockBookvalue sv = stockBS.viewbookValue(sb.getNf(), sb.getStockid());
		StockBookvalue sold = stockBS.viewbookValue(sb.getNf(), sb.getStockid());
		if(sv == null){
			stockBS.saveSSchangeInfo(null, sb, "新增",yearData);
			stockBS.newBookValue(sb);
			
		}else{
			if("2".equals(yearData)){
				stockBS.saveSSchangeInfo(sold, sb, "修改",yearData);
				sv.setTzjczb2(sb.getTzjczb2());
				sv.setYslx2(sb.getYslx2());
				sv.setYslxhzzb2(sb.getYslxhzzb2());
				sv.setYslxje2(sb.getYslxje2());
				sv.setZqmz2(sb.getZqmz2());
				sv.setZqtzje2(sb.getZqtzje2());
				sv.setTzsynm(sb.getTzsynm());
			}else{
				stockBS.saveSSchangeInfo(sold, sb, "修改",yearData);
				sv.setTzjczb(sb.getTzjczb());
				sv.setYslx(sb.getYslx());
				sv.setYslxhzzb(sb.getYslxhzzb());
				sv.setYslxje(sb.getYslxje());
				sv.setZqmz(sb.getZqmz());
				sv.setZqtzje(sb.getZqtzje());
				sv.setTzsync(sb.getTzsync());
			}
			
			stockBS.saveBookValue(sv);
		}
	}
	
	/**
	 * 按年份查找工作记录
	 * @param cbrq
	 * @return
	 */
	public StockBookvalue viewbookValue(String nf ,String stockId){
		return (StockBookvalue)stockBS.viewbookValue(nf, stockId);
	}
	
	
	/**
	 * 按stockId查找工作记录
	 * @param cbrq
	 * @return
	 */
	public StockBookvalue lookBookValue(String stockId){
		return (StockBookvalue)stockBS.lookBookValue(stockId);
	}
	
	/**
	 * 按照stockID查找工作记录列表
	 * @param stockId
	 * @return
	 */
	public List<StockBookvalue> bookValueList(String stockId){
		return stockBS.bookValueList(stockId);
	}
	
	
	/**
	 * 通过id查找债券信息;
	 * @param id
	 * @return
	 */
	public StockInfo viewStockInfo(String id){
		return stockBS.viewStockInfo(id);
	}

	/**
	 * 通过id查找债券信息;
	 * @param id
	 * @return
	 */
	public StockInfo viewStockInfo1(String id){
		return stockBS.viewStockInfo1(id);
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
	 * 根据工作记录id查找工作记录
	 * @param id
	 * @return
	 */
	public StockWorklog viewStock(String id){
		
		return stockBS.viewStock(id);
	}
	
	
	/**
	 * 查看流程信息
	 * @param StockId
	 * @return
	 */
	public List listStockFlow(String StockId){
		
		return stockBS.listStockFlow(StockId);
	}
	
	
	/**
	 * 查看流程信息detail
	 * @param shead_id
	 * @return
	 */
	public StockShead viewStockSheadDetail(String shead_id){
		return stockBS.viewStockSheadDetail(shead_id);
	}
	
	
	//--------------------日志更新--------------------
	public void saveSSchangeInfo(StockBookvalue stockBookvalue_old,
			StockBookvalue stockBookvalue_new,String opType,String yearData) {
		 stockBS.saveSSchangeInfo(stockBookvalue_old, stockBookvalue_new, opType, yearData);
	}


	public List<StockBookvalue> bookValueList1(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}
