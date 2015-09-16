package com.tansun.eam2.jygdzc.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcRisk;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.AssetCardVO;
import com.tansun.eam2.jygdzc.vo.AssetFlowVO;
import com.tansun.eam2.jygdzc.vo.AssetInfoVO;
import com.tansun.eam2.jygdzc.vo.HtViewVOZC;
import com.tansun.eam2.jygdzc.vo.JyzcExmineVO;
import com.tansun.eam2.jygdzc.vo.JyzcRiskVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.QueryBO;
import com.tansun.eam2.jygdzc.vo.QueryVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

public interface IAssetBS extends ICommonBS{
	
	/**
	 * 根据资产临时表Id查找到对应的风险信息
	 * @param zcId  --资产Id
	 * @return
	 */
	public List<JyzcRiskLsb> getJyzcRiskLsbByZcId(String zcId ,Paginator paginator);
	public List<JyzcRiskVO> getJyzcRiskLsbByZcIdForView(String zcId,Paginator paginator);
	/**
	 * 根据资产Id查找到对应的风险信息
	 * @param zcId  --资产Id
	 * @return
	 */
	
	public List<JyzcRisk> getJyzcRiskByZcId(String zczsbId, Paginator paginator);
	public List<JyzcRiskVO> getJyzcRiskByZcIdForView(String zczsbId ,Paginator paginator);
	/**
	 * 根据资产Id 查询挂接在该资产下的卡片挂接历史信息
	 * @param ziId
	 * @return
	 */
	public List<CardAssetHistory> getCardAssetHistoryByZcId(String zcId);
	/**
	 * 根据资产Id 卡片ID 查询CardAssetHistory记录
	 * @param ziId
	 * @return
	 */
	public CardAssetHistory getCardAssetHistoryByZcId(String zcId,String kpId);
	/**
	 * 根据资产Id 查询挂接在该资产下挂接的卡片信息（当前挂接状态为挂接中）
	 * @param ziId
	 * @return
	 */
	public List<Cardinfo> getCardInfoByZcId(String ziId);
	
	/**
	 * 根据资产id获得主卡片信息
	 * @param ziId 资产id
	 * @return 主卡片信息
	 * Added by liubeibei.2010-12-1
	 */
	public Cardinfo getMainCardByZcId(String ziId);
	
	/**
	 * 根据表单ID 查询到相应的表体信息
	 * @param headId
	 * @return
	 */
	public List<JyzcXxLsb> getJyzcXxLsbsByHeadId(String headId);
	
	public List<HtViewVOZC> getByCondition(String zcId,Paginator paginator);

	/**
	 * 根据资产ID 找到相应的费用信息
	 * @param zcId
	 * @return
	 */
	public List<JyzcSqsdfyXx> getJyzcSqsdfyXxByZcId(String zcId);

	/**
	 * 根据资产的id修改资产状态为指定的状态
	 * @param zcId 资产id
	 * @param state 要修改的资产状态
	 * Added by liubeibei.2010-12-1.
	 */
	public void updateAssetStateById(String zcId,String state);
	
	/**
	 * 根据表单ID 查询到符合条件的AssetBodyVO信息项
	 * @param CldId
	 * @return
	 */
	public List<AssetBodyVO> getAssetBodyVOById(String CldId);
	
	/**
	 * 根据经营资产信息表查询到符合条件的bo对象
	 * @param jyzcXx  查询条件组成的bo对象
	 * @return
	 */
	public List<JyzcXxVO> getJyzcXxVOByCondition(QueryBO jyXx ,Paginator paginator);
	
	/**
	 * 
	 * 把信息表里的数据复制到临时表
	 * @return
	 */
	public JyzcXxLsb jyzc2Body(JyzcXx jyzcXx);
	/**
	 * 根据资产Id  查询其变动历史
	 * @param ziId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryByzcId(List<String> zcId,Paginator paginator);
	/**
	 * 根据资产ID取得其与卡片的相关信息
	 * @param zcId
	 * @return
	 */
	public List<AssetCardVO> getAssetCardVOByzcId(String zcId ,Paginator paginator);
	/**
	 * 根据资产ID取得其关联的卡片信息（通过审批）
	 * @param zcId
	 * @return
	 */
	public List<AssetCardVO> getAssetCardXxVOByzcId(String zcId ,Paginator paginator);
	/**
	 *根据资产ID 找出与其相关的处理单信息
	 * @param zcId
	 * @return
	 */
	public List<AssetFlowVO> getAssetFlowVOByzcId(String zcId);
	
	public void deleteJYGlbt(String[] ids );
	
	public JyzcXx getJyzcXxByLsbZcid(String zcId);

	/**
	 * 如果是修改日常管理表体信息，那么先删除已添加的申请审定信息明细
	 * @param id 
	 * lantianbo
	 */
	public void deleteJyzcSqsdfyXxByZcId(String id);

	/**
	 * 根据处理单id删除临时表数据 addby lantianbo
	 * @param headId
	 */
	public void deleteLSBByCLDId(String headId);

	/**
	 * 根据查询条件展示合同需要的------------HtViewVOZC 资产id也要带出来
	 * -------//文档
	 * @param queryBO
	 * @return
	 */
	public List<AssetBodyVO> getJygdzcRcglVOListById(String headId);
	
	/**
	 * 将资产页面信息存到资产信息中
	 * @param commonBO
	 */
	public void zcXxcopy(JyzcXxLsb jyzcXxLsb,CommonBO commonBO);
	/**
	 * 将资产信息存到资产页面信息中
	 * @param commonBO
	 */
	public void copyZcXx(CommonBO commonBO,CommonBO commonB1);

	public String getSend2ERPSEQ();

	public String getCFyzlValue(String fyzl);

	public String jbhQuery(String sheng);
	public String getZcXxByCondition(QueryVO queryVO,Paginator paginator);
	/**
	 * 根据资产ID 查询出AssetBodyVO信息
	 * @param zcId
	 * @return
	 */
	public AssetBodyVO getAssetBodyVOByzcId(String zcId);

	public String getZcXxByCondition(String zcId ,Paginator paginator);
	/**
	 * 根据资产ID 查询资产信息
	 * @param zcId
	 * @return
	 */
	public AssetInfoVO getAssetInfoVOByzcId(String zcId);

	/**
	 * 查找一级分行和地区
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String nodeValue);
	/**
	 * 设置默认卡片
	 * @param zcId
	 */
	public void setMainCardByYbYz(String zcId);
	/**
	 * 查看该资产是否设置主卡片
	 * @param zcId
	 * @return 1 是 0 否 3 未挂接卡片
	 */
	public String cksfyzkp(String zcId);
	/**
	 * 根据coteKey 取出coteName
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteNameByCoteKey(String coteType, String codeKey);
	/**
	 * 通过codeKey查找codetag
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteTagBycodeKey(String coteType, String codeKey);
	/**
	 * 根据处理单ID 生成台账
	 * @return
	 */
	public String createBookBycldId(String cldId);
	/**
	 * 根据资产临时表ID 查找对应的信息表数据
	 * @return
	 */
	public JyzcXx getJyzcXxByzclsbId(String zclsbId);
	/**
	 * 记录资产变动信息
	 * @param jyzcXxLsb1
	 * @param jyzcXxLsb2
	 */
	public void compareXxVsLsb(JyzcXx jyzcXx, JyzcXxLsb jyzcXxLsb);
	/**
	 * 根据资产Id 处理单ID 找出变动信息
	 * @param zcId
	 * @param pkId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryByzcId(String zcId ,String pkId,Paginator paginator);
	/**
	 * 
	 * 把信息表里的数据复制到临时表
	 * @return
	 */
	public void copyAtoB(CommonBO dest ,CommonBO orig) ;
	/**
	 * 根据风险编号 查找相应信息
	 * @param RiskId
	 * @return
	 */
	public JyzcRisk getJyzcRiskByRiskId(String fxbh);
	/**
	 * 对比产生风险变动 存到变动表里
	 * @param jyzcRisk
	 * @param jyzcRiskLsb
	 */
	public void compareXxVsLsb(JyzcRisk jyzcRisk, JyzcRiskLsb jyzcRiskLsb);
	/**
	 * 根据风险表Id查找到对应的风险信息(对于字典表数据不做转换 用来生成台账表时查询用)
	 * 
	 * @param zcId
	 *            --资产Id
	 * @return
	 */
	public List<JyzcRisk> getJyzcRiskByzczsbId(String zczsbId);
	/**
	 * 根据资产正式表ID 找到对应的临时表ID
	 * @param zsbId
	 * @return
	 */
	public List getLsbIdByzsbId(String zsbId);
	//根据zcid资产id得到资产挂接卡片的原币原值
	public String getYbyz(String id);			//add by lantianbo 2010-12-28
	//根据zcid资产id得到资产主卡片的编号
	public String getZkpbh(String id);			//add by lantianbo 2010-12-28
	//根据zcid资产id得到资产主卡片的名称
	public String getZkpmc(String id);			//add by lantianbo 2010-12-28
	public List<PTEnd> findMyPTEndList_nopage(String strZcId,String strTitle);
	
	/**
	 * 查询资产下的卡片信息
	 * 
	 * @param zcids
	 * @return
	 */
	public void saveCardLSB(String[] zcids, String headId);
	
	/**
	 * 查找卡片临时表中的内容
	 * @param headId
	 * @return
	 */
	public String queryCardLSB(String headId ,String pdzt);
	
	/**
	 * 根据资产id查找卡片信息
	 * 
	 * @param zcid
	 * @return
	 */
	public String query4CardLSBIds(String zcid, String headId);
	
	/**
	 * 取消盘点卡片
	 * @param kpids
	 */
	public void deleteCardLSB(String[] kpids);
	/**
	 * 添加盘点卡片
	 * @param kpids
	 */
	public void addCardLSB(String[] kpids);
	/**
	 * 删除盘点表体和卡片临时表信息
	 * @param zcIds
	 * @param headId
	 */
	public void deleteBodyAndCardLSB(String[] zcIds,String headId);
	
	/**
	 * 盘点办结
	 * @return
	 */
	public String doOver(String headId);
	
	/**
	 * 通过表单id查找办理依据
	 * @param headId
	 * @return
	 */
	public String findBLYJ(String headId);
	/**
	 * 资产添加卡片
	 * @param zcId
	 * @param cardId
	 * @return
	 */
	public String setcard(String zcId, String cardId);
	/**
	 * 资产处置项目信息查询 add by lantianbo 2011-1-8
	 * @return
	 */
	public String findCzXxList(String zcId);
	/**
	 * 根据卡片编号 卡片名称 查询不在盘点中的卡片信息
	 * @param headId
	 * @param cardcode
	 * @param cardname
	 * @return
	 */
	public String queryCardLSB(String headId ,String cardcode,String cardname);
	/**
	 * 从正式表里查出的数据到临时表里 但是不能重复添加  and by lihuan
	 * @param id
	 * @return
	 */
	public String queryForSingle(String cldId, String zcIds);
	/**
	 * 按照资产ID 查询出相应数据
	 * @param aaa
	 * @return
	 */
	public List<JyzcXxVO> getJyzcXxVOByCondition(String ids);
	
	/**
	 * 通过headid查找表头表的信息
	 * @param headId
	 * @return
	 */
	public JyzcHead findHeadByHeadId(String headId);
	
	/**
	 * 根据headid查找办理依据
	 * @param headId
	 * @return
	 */
	public CommonAccording getBLYJByHeadId(String headId,String yjId);

	public List<Cardinfo> getCardInfoByZczsbId(String zczsbId);
	
	public Cardinfo getMainCardByZczsbId(String zizsbId);
	
	/**
	 * 取得经营资产list
	 * @param ids	: JyzcXx.id
	 * @return	List<JyzcXx>
	 */
	public List<JyzcXx> getJygdzcListByIds(String[] ids);
	/**
	 * 检测字符串是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public String checkString(Object obj);
	/**
	 * 检查卡片是否挂接资产
	 * @param ids
	 * @return
	 */
	public List <CardAssetHistory> checkCard(String ids);
	/**
	 * 根据资产Id 风险编号 查询数据
	 * @param zclsbId
	 * @param fxbh
	 * @return
	 */
	public JyzcRiskLsb getJyzcRiskLsbByfxbhAndzcId(String zclsbId,String fxbh) ;
	/**
	 * 根据条件查询核查评估信息
	 * @param zcId
	 * @param kpbh
	 * @param hcpgnf
	 * @return
	 */
	public List<JyzcExmineVO> getjyzcExmineVOByCondition(String zcId,String kpbh,String  hcpgnf ,String zclx);
	
}
