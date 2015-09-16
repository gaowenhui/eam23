package com.tansun.eam2.stock.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockSdzmzXx;
import com.tansun.eam2.stock.service.IStockInvestBS;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.Paginator;
@Service
public class StockInvestBSImpl implements IStockInvestBS {
	@Autowired
	PublicDao publicDao;
	
	
	public PublicDao getPublicDao() {
		return publicDao;
	}


	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}


	/**
	 * 2009.6债券投资清单查询
	 */
	@SuppressWarnings("unchecked")
	public List listStock(Paginator paginator,StockQueryVO stockVO) {
		List<String> params = new ArrayList<String>();
		String sql = "select a.fhmc, "+
						   " a.id," +
						   " a.xmmc," +
						   " a.xmmcqr," +
//						   " to_char(a.ngrq,'YYYY-MM-DD') as ngrq," +
						   " t.shidian," +
						   " t.beizhu," +
						   " t.jzzb," +
						   " t.zmz" +
					 " from stock_list a," +
						  " STOCK_SDZMZ_XX t " +
					 " where a.id = t.xm_id "+
				       " and substr(to_char(t.shidian,'yyyy-mm-dd'),1,4) = '2006'";
		if(StringUtils.isNotEmpty(stockVO.getBranch())){
			sql = sql + " and a.fhmc like ? " ;
			params.add("%" + stockVO.getBranch() + "%");
		}
		if(StringUtils.isNotEmpty(stockVO.getItemName())){
			sql = sql + " and a.xmmc like ? ";
			params.add("%" + stockVO.getItemName() + "%");
		}
//		if(StringUtils.isNotEmpty(stockVO.getShidian())){
//			sql = sql + " and to_char(o.shidian,'YYYY-mm-DD') = ?" ;
//			params.add(stockVO.getShidian());
//		}
		sql = sql + " order by a.id";
		return (List)publicDao.queryForList(sql, params, paginator).getResults();
//		return (List)publicDao.queryForList(preparSQL, params).queryByHQLWithPaginator(sql, params, paginator);
	
	}
	
	/**
	 * 通过id查询债券投资详细信息
	 * @param id
	 * @return
	 */
	public StockList viewDetail(String id){
		List params = new ArrayList();
		params.add(id);
		return (StockList)publicDao.findSingleResult("from StockList o where o.id=?", params);
	}
	
	
	/**
	 * 查看stock
	 * @param id
	 * @return
	 */
	public List<StockSdzmzXx> listStockAss(String id){
		
		return (List<StockSdzmzXx>)publicDao.find("from StockSdzmzXx t where t.xmId='"+ id +"'");
	}
	
	
	/**
	 * 查看stock明细
	 * @param id
	 * @return
	 */
	public List<StockInfo> listStockDetailAss(String id){
		
		return (List<StockInfo>)publicDao.find("from StockInfo t where t.xmId='"+ id +"'");
	}
	
//	
//	/**
//	 * 更新
//	 * @param sl1009
//	 */
//	public void saveStockList200906(StockList200906 sl1009){
//		publicDao.update(sl1009);
//	}
//	
//	
//	/**
//	 * 新建
//	 * @param sl1009
//	 */
//	public void newStockList200906(StockList200906 sl1009){
//		publicDao.save(sl1009);
//	}
//	
//	/**
//	 * 根据id查找StockList200906信息
//	 * @param id
//	 * @return
//	 */
//	public StockList200906 viewStockList200906(String id){
//		String[] params = new String[1];
//		params[0] = id;
//		return (StockList200906)publicDao.findSingleResult("from StockList200906 where id=?", params);
//	}
}
