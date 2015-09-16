package com.tansun.eam2.jygdzc.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.AeMachineEquipment;
import com.tansun.eam2.common.model.orm.bo.AeRealEstate;
import com.tansun.eam2.common.model.orm.bo.AeVehicle;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcRisk;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
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
import com.tansun.eam2.jygdzc.vo.JyzcSqsdfyXxVo;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.QueryBO;
import com.tansun.eam2.jygdzc.vo.QueryVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

public interface IAssetUCC {

	/**
	 * 保存一个对象
	 * @param caShead
	 */
	public void save(CommonBO commonBO);
	/**
	 * 删除一个对象
	 * @param 
	 */
	public void delete(CommonBO commonBO);
	/**
	 * 更新对象
	 * @param caShead
	 */
	public void update(CommonBO commonBO);
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
	 * 
	 * 根据风险Id查找到风险信息
	 * @param zcId  --资产Id
	 * @return
	 */
	public JyzcRiskLsb getJyzcRiskLsbById(String id);
	/**
	 * 根据表头Id得到 一条JyzcHead的记录
	 * @param headId
	 * @return
	 */
	public JyzcHead getJyzcHeadByHeadId(String headId);
	/**
	 * 根据资产Id 查询挂接在该资产下的卡片信息
	 * @param ziId
	 * @return
	 */
	public List<CardAssetHistory> getCardAssetHistoryByZcId(String zcId);
	/**
	 * 根据资产Id  查询其变动历史
	 * @param ziId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryByzcId(List zcId ,Paginator paginator);
	/**
	 * 根据表单ID 查询到相应的表体信息
	 * @param headId
	 * @return
	 */
	public List<JyzcXxLsb> getJyzcXxLsbsByHeadId(String headId);
	/**
	 * 根据资产ID 找到相应的费用信息
	 * @param zcId
	 * @return
	 */
	public List<JyzcSqsdfyXxVo> getJyzcSqsdfyXxByZcId(String zcId);
	/**
	 * 根据表单ID 查询到符合条件的AssetBodyVO信息项
	 * @param CldId
	 * @return
	 */
	public List<AssetBodyVO> getAssetBodyVOById(String  CldId);
	
	/**
	 * 根据经营资产信息表查询到符合条件的bo对象
	 * @param jyzcXx  查询条件组成的bo对象
	 * @return
	 */
	public List<JyzcXxVO> getJyzcXxVOByCondition(QueryBO queryBO ,Paginator paginator);
	
	/**
	 * 根据id得到JyzcXxLsb的记录
	 * @param id
	 * @return
	 */
	public JyzcXxLsb getJyzcXxLsbById(String id);
	
	/**
	 * 根据id得到JyzcXx的一条记录
	 * @param id
	 * @return
	 */
	public JyzcXx getJyzcXxById(String id);
	
	/**
	 * 
	 * 把信息表里的数据复制到临时表
	 * @return
	 */
	public JyzcXxLsb jyzc2Body(JyzcXx jyzcXx);
    
	/**
	 * 得到变动信息
	 * @param jyzcXx 信息表的数据
	 * @param jyzcXxLsb 临时表里的数据
	 */
	public void getChangeInfo(JyzcXx jyzcXx,JyzcXxLsb jyzcXxLsb);
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
	public List<AssetCardVO> getAssetCardXxVOByzcId(String zcId,Paginator paginator);
	/**
	 *根据资产ID 找出与其相关的处理单信息
	 * @param zcId
	 * @return
	 */
	public List<AssetFlowVO> getAssetFlowVOByzcId(String zcId);
	
	
	public void deleteJYGlbt(String[] ids);
	/**
	 * 
	 * 根据临时表的zcid查找到信息表的数据
	 * @param zcId 临时表的zcid
	 * @return  信息表的数据
	 */
	public JyzcXx getJyzcXxByLsbZcid(String zcId);
	
	/**
	 * 如果是修改日常管理表体信息，那么先删除已添加的申请审定信息明细
	 * @param id 
	 * lantianbo
	 */
	public void deleteJyzcSqsdfyXxByZcId(String id);
	
	/**
	 * 根据处理单id删除临时表数据
	 * @param headId
	 */
	public void deleteLSBByCLDId(String headId);
	
	/**
	 * 根据日常处理单id得到临时表信息list
	 * @param headId
	 * @return
	 */
	public List<AssetBodyVO> getJygdzcRcglVOListById(String headId);
	
	
	
	/**
	 * 根据查询条件展示合同需要的------------HtViewVOZC 资产id也要带出来
	 * -------
	 * @param queryBO
	 * @return
	 */
	public List<HtViewVOZC> getByCondition(String zcId,Paginator paginator);
	/**
	 * 将资产分页面信息存到资产信息中
	 * @param commonBO
	 */
	public void zcXxcopy(JyzcXxLsb jyzcXxLsb,CommonBO commonBO);
	/**
	 * 将资产信息存到资产页面信息中
	 * @param commonBO
	 */
	public void copyZcXx(CommonBO commonBO,CommonBO commonBO1);
	/**
	 * 根据CardAssetHistory 的ID 查出相应数据
	 * @param historyId
	 * @return
	 */
	public CardAssetHistory getcardAssetHistoryById(String historyId);
	/**
	 * 
	 * @return
	 */
	//public List<JyzcHead> getHeadByzcId()；
	
	
	/**
	 * 根据省份查询银行，addby lantianbo
	 * @param sheng
	 */
	public String jbhQuery(String sheng);
	
	/**
	 * 得到发送erp的唯一标识
	 * @return
	 */
	public String getSend2ERPSEQ();
	
	/**
	 * 得到费用名称
	 * @param fyzl
	 * @return
	 */
	public String getCFyzlValue(String fyzl);
	
	public String getZcXxByCondition(QueryVO queryVO,Paginator paginator);
	
	public String getJyzcHeadByZcId(String zcId,Paginator paginator);
	/**
	 * 根据资产ID 查询资产临时表信息
	 * @param zcId
	 * @return
	 */
	public AssetBodyVO getAssetBodyVOByzcId(String zcId);

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
	public List<PTEnd> findMyPTEndList_nopage(String strZcId,String strTitle);
	
	/**
	 * 查询资产下的卡片信息
	 * @param zcids
	 * @return
	 */
	public void saveCardLSB(String[] zcids, String headId);
	
	/**
	 * 根据资产id查找卡片信息
	 * @param zcid
	 * @return
	 */
	public String query4CardLSBIds(String zcid,String headId);
	
	public String queryCardLSB(String headId,String pdzt);
	
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
	 * 判断表体添加资产的类型是否正确
	 * @return
	 */
	public String addAsset(String zcId , String ywlx);
	/**
	 * 根据资产Id 卡片ID 查询CardAssetHistory记录
	 * @param ziId
	 * @return
	 */
	public CardAssetHistory getCardAssetHistoryByZcId(String zcId,String kpId);
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
	
	
	public String queryForSingle(String cldId, String zcIds);
	/**
	 * 按照资产ID 查询出相应数据
	 * @param aaa
	 * @return
	 */
	public List<JyzcXxVO> getJyzcXxVOByCondition(String ids);
	
	/**
	 * 通过headid查找表头表的信息
	 * 
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
	/**
	 * 查看在资产编号是否在用
	 * @param headId
	 * @return
	 */
	public String codeExistyesORno(String headId,String zcbh);
	/**
	 * 查看在风险编号是否在用
	 * @param code
	 * @return
	 */
	public String fxbhExistyesORno(String zclsbId,String code);
	/**
	 * 检查卡片是否挂接资产
	 * @param ids
	 * @return
	 */
	public String checkCard(String ids);
	
	public String test();
	/**
	 * 根据条件查询核查评估信息
	 * @param zcId
	 * @param kpbh
	 * @param hcpgnf
	 * @param zclx
	 * @return
	 */
	public List<JyzcExmineVO> getjyzcExmineVOByCondition(String zcId,String kpbh,String  hcpgnf ,String zclx);

	public AeRealEstate findAeRealEstateById(String hcpgId);
	public AeVehicle findAeVehicleById(String hcpgId);
	public AeMachineEquipment findAeMachineEquipmentById(String hcpgId);
}
