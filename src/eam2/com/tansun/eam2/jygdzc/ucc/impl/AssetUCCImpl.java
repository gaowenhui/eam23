package com.tansun.eam2.jygdzc.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.AeMachineEquipment;
import com.tansun.eam2.common.model.orm.bo.AeRealEstate;
import com.tansun.eam2.common.model.orm.bo.AeVehicle;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcRisk;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
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
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
@Service
public class AssetUCCImpl implements IAssetUCC{
	@Autowired
	public IAssetBS assetBSImpl;
	@Autowired
	private PublicDao publicDao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	public void save(CommonBO commonBO) {
		
		assetBSImpl.save(commonBO);
	}

	public void update(CommonBO commonBO) {
	
		assetBSImpl.update(commonBO);
	}
	public void delete(CommonBO commonBO) {
		
		assetBSImpl.delete(commonBO);
	}

	public List<AssetBodyVO> getAssetBodyVOById(String CldId) {
		
		return assetBSImpl.getAssetBodyVOById(CldId);
	}

	public List<CardAssetHistory> getCardAssetHistoryByZcId(String zcId) {
		
		return assetBSImpl.getCardAssetHistoryByZcId(zcId);
	}

	public List<JyzcRiskLsb> getJyzcRiskLsbByZcId(String zcId, Paginator paginator) {
		
		return assetBSImpl.getJyzcRiskLsbByZcId(zcId,paginator);
	}

	public List<JyzcSqsdfyXxVo> getJyzcSqsdfyXxByZcId(String zcId) {
		List<JyzcSqsdfyXx> list = assetBSImpl.getJyzcSqsdfyXxByZcId(zcId);
		List<JyzcSqsdfyXxVo> list1 = new ArrayList();
		NumberFormat format11 = NumberFormat.getInstance();
		format11.setMaximumFractionDigits(2);
		if(list!=null&&list.size()>0){
			for(JyzcSqsdfyXx jyzcSqsdfyXx : list){
				JyzcSqsdfyXxVo jyzcSqsdfyXxVo = new JyzcSqsdfyXxVo();
				try {
					BeanUtils.copyProperties(jyzcSqsdfyXxVo, jyzcSqsdfyXx);
				} catch (IllegalAccessException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (InvocationTargetException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					if(jyzcSqsdfyXx.getSqje()!=null){
						jyzcSqsdfyXxVo.setSqje(format11.format(jyzcSqsdfyXx.getSqje()).replaceAll(",", ""));
					}
					if(jyzcSqsdfyXx.getSdje()!=null){
						jyzcSqsdfyXxVo.setSdje(format11.format(jyzcSqsdfyXx.getSdje()).replaceAll(",", ""));
					}
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				list1.add(jyzcSqsdfyXxVo);
			}
		}
		return list1;
	}


	public List<JyzcXxLsb> getJyzcXxLsbsByHeadId(String headId) {
		
		return assetBSImpl.getJyzcXxLsbsByHeadId(headId);
	}

	public List<JyzcXxVO> getJyzcXxVOByCondition(QueryBO queryBO ,Paginator paginator) {
		return assetBSImpl.getJyzcXxVOByCondition(queryBO, paginator) ;
	}

	public JyzcXxLsb jyzc2Body(JyzcXx jyzcXx) {
		
		return assetBSImpl.jyzc2Body(jyzcXx);
	}

	public JyzcHead getJyzcHeadByHeadId(String headId) {
		
		return (JyzcHead) assetBSImpl.findById(JyzcHead.class, headId);
	}

	public JyzcXx getJyzcXxById(String id) {
		
		return (JyzcXx) assetBSImpl.findById(JyzcXx.class, id);
	}

	public JyzcXxLsb getJyzcXxLsbById(String id) {
		
		return (JyzcXxLsb) assetBSImpl.findById(JyzcXxLsb.class, id);
	}

	public void getChangeInfo(JyzcXx jyzcXx, JyzcXxLsb jyzcXxLsb) {
		
		
	}
	public void deleteJYGlbt(String[] btIds) {
		assetBSImpl.deleteJYGlbt(btIds);
		
	}
	public JyzcRiskLsb getJyzcRiskLsbById(String id) {
		
		return (JyzcRiskLsb) assetBSImpl.findById(JyzcRiskLsb.class, id);
	}

	public List<Recordhistory> getRecordhistoryByzcId(List  zcId,Paginator paginator) {
		
		return assetBSImpl.getRecordhistoryByzcId(zcId,paginator);
	}

	public List<AssetCardVO> getAssetCardVOByzcId(String zcId,Paginator paginator) {
		
		return assetBSImpl.getAssetCardVOByzcId(zcId,paginator);
	}	
	public List<AssetCardVO> getAssetCardXxVOByzcId(String zcId,Paginator paginator){
		return assetBSImpl.getAssetCardXxVOByzcId(zcId,paginator);
	}

	public List<AssetFlowVO> getAssetFlowVOByzcId(String zcId) {
		
		return assetBSImpl.getAssetFlowVOByzcId(zcId);
	}

	public JyzcXx getJyzcXxByLsbZcid(String zcId) {
		
		return assetBSImpl.getJyzcXxByLsbZcid(zcId);
	}

	public void deleteJyzcSqsdfyXxByZcId(String id) {
		
		assetBSImpl.deleteJyzcSqsdfyXxByZcId(id);
	}

	public void deleteLSBByCLDId(String headId) {
		
		assetBSImpl.deleteLSBByCLDId(headId);
	}

	public List<AssetBodyVO> getJygdzcRcglVOListById(String headId) {
		
		return assetBSImpl.getJygdzcRcglVOListById(headId);
	}

	public List<HtViewVOZC> getByCondition(String zcId,Paginator paginator) {
		return assetBSImpl.getByCondition(zcId,paginator);
	}

	public void zcXxcopy(JyzcXxLsb jyzcXxLsb, CommonBO commonBO) {
		
		assetBSImpl.zcXxcopy(jyzcXxLsb, commonBO);
	}

	public void copyZcXx(CommonBO commonBO, CommonBO commonB1) {
		
		assetBSImpl.copyZcXx(commonBO, commonB1);
	}

	public CardAssetHistory getcardAssetHistoryById(String historyId) {
		
		return (CardAssetHistory) assetBSImpl.findById(CardAssetHistory.class, historyId);
	}
	
	public String getSend2ERPSEQ(){
		return assetBSImpl.getSend2ERPSEQ();
	}
	
	public String getCFyzlValue(String fyzl){
		return assetBSImpl.getCFyzlValue(fyzl);
	}
	
	public String jbhQuery(String sheng){
		return assetBSImpl.jbhQuery(sheng);
	}
	
	public String getZcXxByCondition(QueryVO queryVO,Paginator paginator){
		return assetBSImpl.getZcXxByCondition(queryVO, paginator);
	}

	public String getJyzcHeadByZcId(String zcId ,Paginator paginator) {
		return assetBSImpl.getZcXxByCondition(zcId , paginator);
	}

	public AssetBodyVO getAssetBodyVOByzcId(String zcId) {
		
		return assetBSImpl.getAssetBodyVOByzcId(zcId);
	}


	public AssetInfoVO getAssetInfoVOByzcId(String zcId) {
		
		return assetBSImpl.getAssetInfoVOByzcId(zcId);
	}

	public List<JyzcRisk> getJyzcRiskByZcId(String zczsbId, Paginator paginator) {

		return assetBSImpl.getJyzcRiskByZcId(zczsbId, paginator);
	}


	public String findCateNameByParentId(String nodeValue) {
		return assetBSImpl.findCateNameByParentId(nodeValue);
	}

	public String cksfyzkp(String zcId) {
	
		return assetBSImpl.cksfyzkp(zcId);
	}

	public void setMainCardByYbYz(String zcId) {
	
		assetBSImpl.setMainCardByYbYz(zcId);
	}

	public String findCoteNameByCoteKey(String coteType, String codeKey) {
		return assetBSImpl.findCoteNameByCoteKey(coteType, codeKey);
	}

	public String createBookBycldId(String cldId) {
		
		return assetBSImpl.createBookBycldId(cldId);
	}

	public JyzcXx getJyzcXxByzclsbId(String zclsbId) {
		
		return assetBSImpl.getJyzcXxByzclsbId(zclsbId);
	}

	public String findCoteTagBycodeKey(String coteType, String codeKey) {
		
		return assetBSImpl.findCoteTagBycodeKey(coteType, codeKey);
	}

	public void compareXxVsLsb(JyzcXx jyzcXx, JyzcXxLsb jyzcXxLsb) {
	
		assetBSImpl.compareXxVsLsb(jyzcXx, jyzcXxLsb);
	}

	public List<Recordhistory> getRecordhistoryByzcId(String zcId ,String pkId,Paginator paginator) {
		
		return assetBSImpl.getRecordhistoryByzcId(zcId, pkId, paginator);
	}

	public void copyAtoB(CommonBO dest, CommonBO orig) {
		
		assetBSImpl.copyAtoB(dest, orig);
	}

	public JyzcRisk getJyzcRiskByRiskId(String fxbh) {
	
		return assetBSImpl.getJyzcRiskByRiskId(fxbh);
	}

	public void compareXxVsLsb(JyzcRisk jyzcRisk, JyzcRiskLsb jyzcRiskLsb) {
		
		assetBSImpl.compareXxVsLsb(jyzcRisk, jyzcRiskLsb);
	}

	public List<JyzcRisk> getJyzcRiskByzczsbId(String zczsbId) {
		
		return assetBSImpl.getJyzcRiskByzczsbId(zczsbId);
	}

	public List getLsbIdByzsbId(String zsbId) {
		
		return assetBSImpl.getLsbIdByzsbId(zsbId);
	}

	public List<PTEnd> findMyPTEndList_nopage(String strZcId,String strTitle) {
		return assetBSImpl.findMyPTEndList_nopage(strZcId,strTitle);
	}

	/**
	 * 查询资产下的卡片信息
	 * 
	 * @param zcids
	 * @return
	 */
	public void saveCardLSB(String[] zcids, String headId) {
		assetBSImpl.saveCardLSB(zcids,headId);
	}
	
	/**
	 * 根据资产id查找卡片信息
	 * 
	 * @param zcid
	 * @return
	 */
	public String query4CardLSBIds(String zcid, String headId) {
		return assetBSImpl.query4CardLSBIds(zcid, headId);
	}
	
	/**
	 * 查找卡片临时表中的内容
	 * 
	 * @param headId
	 * @return
	 */
	public String queryCardLSB(String headId ,String pdzt) {
		return assetBSImpl.queryCardLSB(headId ,pdzt);
	}
	
	/**
	 * 删除卡片临时表中的内容
	 * @param kpids
	 */
	public void deleteCardLSB(String[] kpids){
		assetBSImpl.deleteCardLSB(kpids);
	}
	
	/**
	 * 删除盘点表体和卡片临时表信息
	 * @param zcIds
	 * @param headId
	 */
	public void deleteBodyAndCardLSB(String[] zcIds,String headId){
		assetBSImpl.deleteBodyAndCardLSB(zcIds, headId);
	}
	
	/**
	 * 盘点办结
	 * @return
	 */
	public String doOver(String headId){
		return assetBSImpl.doOver(headId);
	}
	
	/**
	 * 通过表单id查找办理依据
	 * @param headId
	 * @return
	 */
	public String findBLYJ(String headId){
		return assetBSImpl.findBLYJ(headId);
	}

	public String addAsset(String zcId , String ywlx) {
		String resulte="添加成功";
		if (zcId.startsWith(",")) {
			zcId = zcId.substring(1);
		}
		String[] zcIds = zcId.split(",");
		for(int i=0;i<zcIds.length;i++){
			JyzcXx jyzcXx = (JyzcXx) assetBSImpl.findById(JyzcXx.class, zcIds[i]);
			String zczt = jyzcXx.getCZczc();
			Cardinfo cd = assetBSImpl.getMainCardByZczsbId(zcId);
			String state = cd.getState();
			if("change".equals(ywlx)||"check".equals(ywlx)||"scrap".equals(ywlx)||"tenancy".equals(ywlx)){
				if(!"02".equals(zczt)&&!"05".equals(zczt)){
					resulte = "只能选择资产状态为待处置、正常经营的资产";
				}
			}
			if("manage".equals(ywlx)){
				if(!"02".equals(zczt)&&!"03".equals(zczt)&&!"04".equals(zczt)&&!"05".equals(zczt)){
					resulte = "只能选择资产状态应该为正常经营、待处置、处置审批中、处置执行中的资产";
				}else{
					if("03".equals(state)){
						resulte="主卡片已退役,请重新选择!";
					}
				}
			}
		}
		return resulte;
	}

	public CardAssetHistory getCardAssetHistoryByZcId(String zcId, String kpId) {
		return assetBSImpl.getCardAssetHistoryByZcId(zcId, kpId);
	}
	/**
	 * 资产处置项目信息查询 add by lantianbo 2011-1-8
	 * @return
	 */
	public String findCzXxList(String zcId){
		return this.assetBSImpl.findCzXxList(zcId);
	}

	public void addCardLSB(String[] kpids) {
		assetBSImpl.addCardLSB(kpids);
	}

	public String queryCardLSB(String headId, String cardcode, String cardname) {
		return assetBSImpl.queryCardLSB(headId, cardcode, cardname);
	}

	public String queryForSingle(String cldId, String zcIds) {
		return assetBSImpl.queryForSingle(cldId, zcIds);
	}

	public List<JyzcXxVO> getJyzcXxVOByCondition(String ids) {
		
		return assetBSImpl.getJyzcXxVOByCondition(ids);
	}
	
	/**
	 * 通过headid查找表头表的信息
	 * 
	 * @param headId
	 * @return
	 */
	public JyzcHead findHeadByHeadId(String headId) {
		return assetBSImpl.findHeadByHeadId(headId);
	}
	
	/**
	 * 根据headid查找办理依据
	 * @param headId
	 * @return
	 */
	public CommonAccording getBLYJByHeadId(String headId,String yjId){
		return assetBSImpl.getBLYJByHeadId(headId,yjId);
	}

	public String codeExistyesORno(String headId, String zcbh) {
		String exist ="no";
		List<JyzcXxLsb> list  = assetBSImpl.getJyzcXxLsbsByHeadId(headId);
		if(list!=null&&list.size()>0){
			for(int i = 0 ; i<list.size();i++){
				JyzcXxLsb  jyzcXxLsb = list.get(i);
				if(zcbh.equals(jyzcXxLsb.getZcbh())){
					exist ="yes";
				}
			}
		}
		return exist;
	}

	public List<JyzcRiskVO> getJyzcRiskByZcIdForView(String zczsbId,
			Paginator paginator) {
		
		return assetBSImpl.getJyzcRiskByZcIdForView(zczsbId, paginator);
	}

	public List<JyzcRiskVO> getJyzcRiskLsbByZcIdForView(String zcId,
			Paginator paginator) {
		
		return assetBSImpl.getJyzcRiskLsbByZcIdForView(zcId, paginator);
	}

	public String checkCard(String ids) {
		StringBuffer result = new StringBuffer();
		String result1 = "成功";
		if(ids!=null&&!"".equals(ids)){
			String id[] = ids.split(",");
			for(int i=0;i<id.length;i++){
				 List <CardAssetHistory> list =assetBSImpl.checkCard(id[i]);
				 if(list!=null&&list.size()>0){
					 for(int j=0 ; j<list.size();j++){
						 CardAssetHistory cardAssetHistory = list.get(j);
						 String cardId = cardAssetHistory.getKpId();
						 Cardinfo cardInfo = (Cardinfo) cardCommonUCCImpl.findCardinfoByCardId(cardId);
						 String kpbh = "";
						 if(cardInfo!=null&&cardInfo.getCardcode()!=null){
							 kpbh  = cardInfo.getCardcode();
							 result.append(kpbh);
							 result.append(",");
						 }
					 }
				 }
			}
		}
		if(result.toString().length()>0){
			result.replace(result.toString().length()-1, result.toString().length(), "");
			
			return result.toString();
		}else{
			return result1;
		}
	}

	public String fxbhExistyesORno(String zclsbId,String code) {
		String result = "no";
		JyzcRiskLsb jyzcRiskLsb = assetBSImpl.getJyzcRiskLsbByfxbhAndzcId(zclsbId, code);
		if(jyzcRiskLsb!=null){
			result ="yes";
		}
		return result;
	}
public String test(){
		//资产增加 		/eam2/jygdzcWorkflow/jygdzcWorkflow_endView.do tbtb_jyzc_add
		//业务维修 		/eam2/jygdzcWorkflow/jygdzcWorkflow_endView.do tbtb_jyzc_manager_wh
		//确权业务 		/eam2/jygdzcWorkflow/jygdzcWorkflow_endView.do tbtb_jyzc_manager_qq
		//其它事项审批     /eam2/jygdzcWorkflow/jygdzcWorkflow_endView.do tbtb_jyzc_manager_qt
		//固产报废         /eam2/jygdzcWorkflow/jygdzcWorkflow_endView.do tbtb_jyzc_scrapt
		//更新改造         /eam2/jygdzcWorkflow/jygdzcWorkflow_endView.do tbtb_jyzc_manager_gxgz
		//合同新增		/eam2/htqsWorkflow/htqsWorkflow_endView.do  tbtb_jyzc_contract_xz
		//合同变动		/eam2/htqsWorkflow/htqsWorkflow_endView.do  tbtb_jyzc_contract_xg
		//合同终止        /eam2/htqsWorkflow/htqsWorkflow_endView.do   tbtb_jyzc_contract_zz
		String sql = "from PTEnd t where t.headType ='合同终止'";
		List list = publicDao.find(sql);
		if(list!=null&&list.size()>0){
			
			for(int i=0;i<list.size();i++){
				PTEnd end = (PTEnd)list.get(i);
				end.setUrl("/eam2/htqsWorkflow/htqsWorkflow_endView.do");
				end.setProcInstId("tbtb_jyzc_contract_zz"+i);
				publicDao.update(end);
				
				String headId = end.getHeadId();
				if(headId!=null){
					String sql1 = "select t.id, t.DRAFT_USERID,t.send_userid from P_T_Did t where t.head_Id=?";
					List list1 = publicDao.queryForList(sql1,new Object[]{headId});
					if(list1!=null&&list1.size()>0){
						for(int j=0;j<list1.size();j++){
							//did.setProcInstId(end.getProcInstId());
							Map map = (Map)list1.get(j);
							String sendUserId = String.valueOf(map.get("send_userid"));
							String draftUserId = String.valueOf(map.get("draft_userid"));
							String id = String.valueOf(map.get("id"));
							String sql4 = "from PTUserBO t where t.username = ?";
							//PTUserBO user1 = (PTUserBO)publicDao.findSingleResult(sql4,new Object[]{sendUserId});
							PTUserBO user2 = (PTUserBO)publicDao.findSingleResult(sql4,new Object[]{draftUserId});
//							if(user1!=null){
//								sendUserId = String.valueOf(user1.getTid());
//							}
							if(user2!=null){
								draftUserId=String.valueOf(user2.getTid());
							}
							String sql5 = "update P_T_Did t set t.DRAFT_USERID = '"+draftUserId
							+"' , t.send_userid = '' ,t.statu = '0', t.PROC_INST_ID= '"+end.getProcInstId()+"' where t.id = '"+id+"'" ;
							System.out.println(id + "-------"+sql5);
							publicDao.getJdbcTemplate().execute(sql5);
						}
					}
				}
			}
		}
		return "";
	}

public List<JyzcExmineVO> getjyzcExmineVOByCondition(String zcId, String kpbh,
		String hcpgnf ,String zclx) {
	return assetBSImpl.getjyzcExmineVOByCondition(zcId, kpbh, hcpgnf, zclx);
}

public AeMachineEquipment findAeMachineEquipmentById(String hcpgId) {
	return (AeMachineEquipment) assetBSImpl.findById(AeMachineEquipment.class, hcpgId);
}

public AeRealEstate findAeRealEstateById(String hcpgId) {
	return (AeRealEstate) assetBSImpl.findById(AeRealEstate.class, hcpgId);
}

public AeVehicle findAeVehicleById(String hcpgId) {
	return (AeVehicle) assetBSImpl.findById(AeVehicle.class, hcpgId);
}
}
