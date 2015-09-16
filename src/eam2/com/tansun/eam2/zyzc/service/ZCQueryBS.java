package com.tansun.eam2.zyzc.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.vo.ExchangeVO;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.ViewVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
public interface ZCQueryBS {
	
	public List<ZySbody> query4PurchaseAndPager(QueryPurchaseVo queryPurVo,Paginator paginator,String sheettype);

	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * @return
	 */
	public List<ZyZc> queryZcByVo(QueryPurchaseVo queryPurVo);
	
	/**
	 * 根据资产Id到资产表中查找该资产信息
	 * @param zcId
	 * @return
	 */
	public ZyZc getZyzcByZcId(String zcId);
	
	/**
	 * 更新资产
	 * @param zyzc
	 */
	public void updateZyZc(ZyZc zyzc);
	
	/**
	 * 保存资产到资产表中
	 * @param zyzc
	 */
	public void saveZyZc(ZyZc zyzc);
	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * @return
	 */
	public List<ZyZc> queryZcByVoWithPager(QueryPurchaseVo queryPurVo, Paginator paginator,String sheettype);
	
	public List<ViewVO> query4ReborrowAdd(QueryPurchaseVo queryPurVo,Paginator paginator, String sheettype);
	
	public List<ZyZc> queryZcByVoWithPager4BorAndCon(QueryPurchaseVo queryPurVo,
			Paginator paginator,String sheettype);
	
	/**
	 * 这个方法提供给报废查询使用
	 * @param queryPurVo
	 * @param sheetType
	 * @param paginator
	 * @return
	 */
	public List<ViewVO> discardQuery(QueryPurchaseVo queryPurVo,Paginator paginator);
	
	/**
	 * 这个方法提供给报废查询的勾选excel导出
	 * @param queryPurVo
	 * @param sheetType
	 * @param paginator
	 * @return
	 */
	public List<ViewVO> discardQueryExcel(String ids);
	
	/**
	 * 领借用查询
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	public List<ViewVO> borrowOrConsumQuery(QueryPurchaseVo queryPurVo,String sheetType,Paginator paginator);
	
	/**
	 * 入库物品查询
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc>  query4Stock(QueryPurchaseVo queryPurVo,Paginator paginator);
	
	/**
	 * 根据资产id查找为最新的库存台账信息
	 * @param zcId
	 * @return
	 */
	public ZyKctz findTZById(String zcId);
	
	/**
	 * 更改台账为旧台账
	 * @param tzId
	 */
	public void updateTZ(String tzId);
	
	/**
	 * 保存台账信息
	 * @param tz
	 */
	public void saveTZ(ZyKctz tz);
	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * @return
	 */
	public List<ZyZc> query4xubao(QueryPurchaseVo queryPurVo, Paginator paginator,String sheettype);
	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * 本方法只用于查询在库的物品
	 * @return
	 */
	public List<ZyZc> queryZcInStockWithPager(QueryPurchaseVo queryPurVo, Paginator paginator,String sheettype);
	
	public List<ZySbody> query4ConAndBor(QueryPurchaseVo queryPurVo,Paginator paginator,String sheettype);
	
	public String queryExchangeZyzc(ExchangeVO exvo,Paginator paginator);
	
	public List<ZyZc> obtainZcListBySjflbm(String sjflbm);
	
	public ZyZc getZyzcByZcbh(String zcbh);
	
}
