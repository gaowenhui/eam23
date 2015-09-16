package com.tansun.eam2.zyzc.ucc;

import java.util.List;
import java.util.TreeMap;

import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.vo.CardVO;
import com.tansun.eam2.zyzc.vo.PurchaseGoodsQueryVO;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.TokenVO;
import com.tansun.eam2.zyzc.vo.ViewVO;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
public interface ZCManageBodyUCC {
	
	/**
	 * 保存对象到相应的数据表中
	 * @param commonBO
	 */
	public void saveCommonBO(CommonBO commonBO);
	
	/**
	 * 保存数据，后台插入或更新
	 * @return
	 */
	public void saveBody(ZySbody zySbody);
	
	/**
	 * 更新body
	 */
	public void updateBody(ZySbody zySbody);
	
	/**
	 * 从后台检索数据，刷新界面显示
	 * @return
	 */
	public ZySbody modifyBody(String sbodyId);
	
	/**
	 * 从后台检索数据，刷新界面显示。
	 * @return
	 */
	public ZySbody viewBody(String bid);
	
	/**
	 * 到资产表和台账表中根据ZCId查询出数据，保存到ZySbody中然后显示在Jqgrid中
	 * @param zcID 资产id列表
	 * @return
	 */
	public void saveZcToBody(String[] ZCIds ,String [] headId);

	/**
	 * 保存选中的资产信息和表头信息至表体
	 * @return
	 */
	public void saveZcToBody(String[] zcID, String sheadID);

	/**
	 * 保存选中的资产信息和表头信息至表体（更换用）
	 * @return
	 */
	public void saveZcToBody(String[] zcID, String sheadID, String syzt);
	
	public void saveZcToBody(String[] ZCIds ,String [] headId, String syzt);
	
	public void saveZcToBody(String[] zcids ,String [] headId,String syzt,String beforeBodyId);
	
	/**
	 * 保存选中的资产信息和表头信息至表体（借用领用用）
	 * @return
	 */
	public void saveZcToBody(String[] zcID, String sheadID, String [] ngrInfo,int sl);
	
	public void saveDicInfoToBody(String dic3_id, String sheadId, String [] ngrInfo);
	
	public void updateStockGoodsBody(String ids [],String sheadId);

	/**
	 * 根据表头信息查找表体信息
	 * @param sheadID
	 */
	public List<ZySbody> readBodyByHeadID(String sheadID);
	
	/**
	 * 根据表头信息查找领用表体信息
	 * @param sheadID
	 */
	public List<ZySbody> readBodiesByHeadID(String sheadID);
	/**
	 * 在资产表和台账表中根据资产Id查询出数据然后存到ViewVO对象中,供查看使用
	 */
	public ViewVO createViewVOZcId(String zcId);
	
	/**
	 * 在资产表和台账表中根据查询条件和分页器查询出物品的所有维修记录，包括一个物品的多次维修
	 * @param qpv QueryPurchaseVo 查询条件VO
	 * @param paginator 分页器
	 * @return
	 */
	public List<ViewVO> createViewVOByQueryconditionAndPager(QueryPurchaseVo qpv, Paginator paginator);
	
	/**
	 * 根据表头信息查找表体信息,
	 * @param sheadId
	 * @param paginator 分页器
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public PageableList readBodyByHeadIDAndPager(String sheadId,Paginator paginator);
	
	public PageableList readWithoutZcIdBodyByHeadIDAndPager(String sheadId,Paginator paginator);

	/**
	 * 根据表头信息查找表体信息(更换用),
	 * @param sheadId
	 * @param paginator 分页器
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public PageableList readBodyByHeadIDAndPager(String sheadId,Paginator paginator, String syzt);
	
	/**
	 * 查询采购物品
	 * @return
	 */
	public  List<ZySbody> queryBodyByVo(QueryPurchaseVo queryPurVo, String sheettype);

	/**
	 * 从采购表中查出相应的记录放入入库表中
	 * @param sbodyIds
	 * @param sheadId
	 * @param sheettype
	 */
	public void saveBodyToBody(String[] sbodyIds, String sheadId);
	
	public ZyZc obtainZyZcByZcId(String zcId);
	
	public List<ZyZc> obtainZyZCListByZCIds(String [] zcIds);
	
	public void deleteBody(String[] bodyIds);
	
	/**
	 * 根据表头Id和zcId查找表体中是否存在该记录，防止在一个表单中存在两个相同的资产
	 * @param sheadID ZyShead表中的主键，ZySbody的外键
	 * @return ZySbody 得到的ZySbody集合
	 */
	public ZySbody obtainZySbodyByHeadIdAndZcId(String sheadId,String zcId);
	
	/**
	 * 根据bodyIds中的非空Id值到body表中查找记录
	 * @param bodyIds
	 * @return
	 */
	public List<ZySbody> obtainBodyListByBodyIds(String [] bodyIds);
	
	public List<ZySbody> obtainBodyListByBodyIds(String [] bodyIds,String syzt);
	
	/**
	 * 根据bodyList中的ZySbody对象调用逐个调用getKctzByZcIdAndSheadId方法得到ZyKctz对象List
	 * @param bodyList
	 * @return
	 */
	public List<ZyKctz> obtainKctzListByBodyList(List<ZySbody> bodyList);
	
	/**
	 * 根据sheadId和资产Id到body和head表中查询出一条记录，然后存到一个ZyKctz对象中并返回
	 * @param sheadId
	 * @param zcId
	 * @return
	 */
	public ZyKctz obtainKctzByZcIdAndSheadId(String sheadId,String zcId);
	
	/**
	 *存储库存台账List到库存台账中 
	 */
	public void saveKctzListToKctz(List<ZyKctz> kctzList);
	
	/**
	 * 根据headId在body表中查找本表单下的所有bodyId
	 * @param headId
	 * @return
	 */
	public String[] obtainBodyIdBySheadId(String headId);
	
	public String[] obtainBodyIdBySheadIdWithoutCGDBodyId(String headId);
	
	public ZySbody findBody(String sbodyId);
	
	public ZyZc copyProperties(ZySbody body,ZyZc zyzc);
	
	/**
	 * 在body表中查找在一个headId下的所有记录中含有未入库物品list
	 * @param pgqv PurchaseGoodsQueryVO
	 * @param headId
	 * @return
	 */
	public List<ZySbody> obatainBodyListByVoAndHeadId(QueryPurchaseVo queryPurVo,String headId);
	
	/**
	 * 保存资产表中的一些字段的值到body表中
	 * @param zcIds
	 * @param sheadId
	 */
	public void saveZcFieldToBody(String[] zcIds, String sheadId);
	
	/**
	 * 在body表中查找该headId下的所有记录是否有未入库物品，有：true，没有：false
	 * @return
	 */
	public boolean isheadRK(String headId);
	
	/**
	 * 根据tokenQueryCondit中的查询条件到资产表和台账表中查询数据
	 * 组成TokenVO后返回
	 */
	public List<TokenVO> obatainTokenInfo(String [] tokenQueryCondit);
	
	/**
	 * 在body表中查询所有未入库物品的headId，组成以逗号分割的字符串返回
	 * @return
	 */
	public String obtainHeadIdStrWithWRKGoods();
	
	/**
	 * 根据选择的采购单Id到body表中查询出未入库的物品，复制一份到body表中，同时复制的记录的
	 * shead_Id字段设置为stockId
	 * @param stockId
	 * @param headIdArray
	 */
	public void copyBodyListToBody(String stockId, String [] headIdArray, String cgBodyId);
	
	/**
	 * 根据资产Id和caSheadId到LcCardtemp表中查询出id（主键）
	 * @param zcId
	 * @param caSheadId
	 * @return
	 */
	public String obtainIdWithZcIdAndHeadId(String zcId, String caSheadId);
	
	/**
	 * 根据headId到盘点信息表中查找该Id下的所有记录
	 * @param headId
	 * @return
	 */
	public String obtainPdxxListWithHeadId(String headId,Paginator paginator);
	
	/**
	 * 根据一级分类名称，二级分类名称，三级分类名称到资产表中查询出zcId
	 * @param yjflbm
	 * @param ejflbm
	 * @param sjflbm
	 * @return
	 */
	public String obtainZyZcByFLBM(String yjflbm,String ejflbm,String sjflbm);
	
	/**
	 * 根据SboydId到Zy_Sbody表中查找（领用，借用）所有被拷贝的记录数量
	 * @param bodyId
	 * @return
	 */
	public Integer obtainCopyRecordNum(String bodyId);
		
	/**
	 * 根据传输过来的个人申请单Id到body表中找到该数据复制一份保存到body表中，并设置复制后的资产的headId
	 * 为部门领用申请单的Id
	 * @param bodyIds 
	 * @param headId
	 */
	public void copyPersonalBodyToDeptBody(String bodyIds,String headId);
	
	/**
	 * 通过headid查找body信息
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId);
	
	public ZyZc copyPropertiesForStock(ZySbody body,ZyZc zyzc);
	
	public List<ZySbody> query4StockBodyListAndPager(Paginator paginator,String SheetHeadId,String existBodyId);
	
	public void saveZcInfoFromDicTableToBody(String dic3_id,String headId);
	
	public void saveZcInfoFromDicTableToPdxx(String dic3_id,String headId,String pdpc);
	
	public List<ZySbody> splitZc4ConAndBor(String bodyId,String sl,String jydqrq,String jyts);
	
	public void gernerZcIdByZcbh(String bodyId,String zcbh);
	
	public TreeMap<String,String> getZcbhInStock(String [] flbm,String zcbhExitThisPage);
	
	public String generalKpbh(String yjflbm,String ejflbm);
	
	public boolean isZCSfxj(String zcId);
	
	public void changeZySheadBdzt(String sheadId);
	
	public String getBodyIdAndSL(ZySbody body);
	
	public List<ZyZc> ObtainDZYhpZcList(String yjflbm,String ejflbm,String sjflbm);
	
	public void sfzxjl(String zcId);
	
	/**
	 * 借用领用开启采购
	 * @param headId
	 */
	public void newPurchaseBody(String headId,String str);
	
	/**
	 * 借用领用开启采购,到body表中查询数据，在开启的采购单中得到的数据跟领用借用单是一样的
	 * @param headId
	 * @param bodyId 领用借用单在body表中的headId
	 */
	public void newPurchaseBodyGetMoreInfo(String headId,String borOrConHeadId,String str);
	
	/**
	 * 物品变更开启采购
	 * @param headId
	 * @param bodyIds
	 */
	public void newPurchaseBody4exchange(String headId,String bodyIds);
	
	public List<ZcPgXx> getPgxxByZcId(String zyzcId);

	public void updatBZ3(String sbodyId);
	
}
