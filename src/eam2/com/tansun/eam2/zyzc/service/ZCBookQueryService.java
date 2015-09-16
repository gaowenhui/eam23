package com.tansun.eam2.zyzc.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.zyzc.vo.QueryBody4View;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 穆占强
 * @date 2010-11-20
 * 
 */
public interface ZCBookQueryService {

	/**
	 * 通过在map中提供的查询条件查询资产台账信息 时间格式：String-（MM/DD/YYYY）
	 * 具体参数：分类，物品名称，规格，采购日期（起始日期，截止日期），单价范围（最大值，最小值）
	 * 
	 * @param list
	 * @return
	 */
	public List<QueryBody4View> queryKCTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator);
	
	/**
	 * 到资产表查询资产信息，到台账表中查询领用借用信息,都是低值品
	 * @return
	 */
	public List<QueryBody4View> queryDZPTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator);
	
	/**
	 * 到资产表查询资产信息，到台账表中查询领用借用信息,都是固定资产
	 * @return
	 */
	public List<QueryBody4View> querySWTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator);
	
	/**
	 * 到资产表查询资产信息，到台账表中查询领用借用信息,都是易耗品
	 * @return
	 */
	public List<QueryBody4View> queryYHPTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator);	
	
	/**
	 * 根据资产ID获得最新的台账
	 * @return
	 */
	public ZyKctz findZyKctz(String zcId);
	
	/**
	 *保存台账信息
	 * @param zyKctz
	 */
	public void saveBook(ZyKctz zyKctz);
}
