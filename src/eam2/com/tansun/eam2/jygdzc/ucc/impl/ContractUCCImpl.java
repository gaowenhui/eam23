package com.tansun.eam2.jygdzc.ucc.impl;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtBxzcgx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzj;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzjLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwgLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqxBody;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.service.IContractBS;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.vo.AssetInfoVO;
import com.tansun.eam2.jygdzc.vo.ClearQueryVO;
import com.tansun.eam2.jygdzc.vo.HtCreateVO;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxHtView;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzcHtJdzjVO;
import com.tansun.eam2.jygdzc.vo.JyzcHtqxBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO2;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
@Service
public class ContractUCCImpl implements IContractUCC{
    @Autowired
	public IContractBS contractBSImpl;
    @Autowired
	public IAssetBS assetBSImpl;
	public void createJjzcHtBx(HtCreateVO htCreateVO) {
		//contractBSImpl.
	}

	public void deleteJjzcHtZlwgLsb(String[] wgIds) {
	}

	public String getJjzcHtBxHtViewByCondition(
			JjzcHtBxQueryVO queryBO, Paginator paginator) {
		return contractBSImpl.getJjzcHtBxHtViewByCondition(queryBO, paginator);
	}
	public List<JyzcHtqxBodyVO> getBodyByCldId(String cldId) {
		return contractBSImpl.getBodyByCldId(cldId);
	}

	public List<JyzcHtqxBody> getByCldId(String cldId) {
		return contractBSImpl.getByCldId(cldId);
	}

	public JjzcHtBx getChangeInfo(JjzcHtZlwgLsb JjzcHtZlwglsb,
			JjzcHtZlwg jjzcHtZlwg) {
		return null;
	}

	public JjzcHtZlwgLsb getJjzcHtZlwgLsbById(String id) {
		return contractBSImpl.getJjzcHtZlwgLsbById(id);
	}

	public List<JjzcHtBx> getJjzcHtBxsByWgId(String wgId) {
		return contractBSImpl.getJjzcHtBxsByWgId(wgId);
	}

	public String getJjzcHtViewByCondition(ClearQueryVO queryvo,Paginator paginator) {
		return contractBSImpl.getJjzcHtViewByCondition(queryvo, paginator);
	}

	public List<JyzcXx> getJyzcQsByWgId(String wgId) {
		return null;
	}

	public List<JyzcXx> getJyzcXxByWgId(String wgId) {
		return null;
	}

	public JjzcHtZlwgLsb jjzcHtBx2Body(JjzcHtZlwg jjzcHtBx) {
		return contractBSImpl.jjzcHtBx2Body(jjzcHtBx);
	}

	public void saveJjzcHtBBxC(JjzcHtBx jjzcHtBx) {
		//把日期转为十分秒的形式
		if(jjzcHtBx.getHtdqrq()!=null){
			jjzcHtBx.setHtqsrq(DateUtils.getTodayStart(jjzcHtBx.getHtqsrq()));
		}
		if(jjzcHtBx.getHtdqrq()!=null){
			jjzcHtBx.setHtdqrq(DateUtils.getTodayEnd(jjzcHtBx.getHtdqrq()));
		}
		contractBSImpl.saveJjzcHtBBxC(jjzcHtBx);
	}

	public void saveJjzcHtBBxFc(JjzcHtBxzcgx jjzcHtBxzcgx) {
		contractBSImpl.saveJjzcHtBBxFc(jjzcHtBxzcgx);		
	}

	public void saveJjzcHtZlwg(JjzcHtZlwg jjzcHtZlwg) {
		//把日期转为十分秒的形式
		if(jjzcHtZlwg.getHtdqrq()!=null){
			jjzcHtZlwg.setHtqsrq(DateUtils.getTodayStart(jjzcHtZlwg.getHtqsrq()));
		}
		if(jjzcHtZlwg.getHtdqrq()!=null){
			jjzcHtZlwg.setHtdqrq(DateUtils.getTodayEnd(jjzcHtZlwg.getHtdqrq()));
		}
		System.out.println(jjzcHtZlwg.getHtdqrq()); 
		
		contractBSImpl.saveJjzcHtZlwg(jjzcHtZlwg);
	}
	public void saveJjzcHtqsHead(JjzcHtqsHead jjzcHtqsHead) {
		contractBSImpl.saveJjzcHtqsHead(jjzcHtqsHead);
	}

	public void updateJjzcHtqsHead(JjzcHtqsHead jjzcHtqsHead) {
//		JjzcHtqsHead head=this.getJjzcHtqsHeadById(jjzcHtqsHead.getId());
//		
//		head.setId(head.getId());
//		head.setBeizhu(head.getBeizhu());
//		head.setBianhao(head.getBianhao());
//		head.setBiaoti(head.getBianhao());
//		head.setJhcd(head.getJhcd());
//		head.setLcmc(head.getLcmc());
//		head.setNgbm(head.getNgbm());
//		head.setLcId(head.getLcId());
//		head.setLxdh(head.getLxdh());
//		head.setNgbmmc(head.getNgbmmc());
//		head.setNgr(head.getNgr());
//		head.setNgrq(head.getNgrq());
//		head.setQspc(head.getQspc());
//		head.setSfbb(head.getSfbb());
//		head.setSheettype(head.getSheettype());
		
		contractBSImpl.updateJjzcHtqsHead(jjzcHtqsHead);
	}

	public JjzcHtqsHead updateJjzcHtqsHead(String id) {
		
		return null;
	}

	public JjzcHtqsHead getJjzcHtqsHeadById(String id) {
		return contractBSImpl.getJjzcHtqsHeadById(id);
	}

	public JjzcHtZlwgLsb getById(String id) {
		
		return null;
	}

	public void saveJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb) {
		
		//if(jjzcHtZlwgLsb.getHtdqrq()!=null){
		//	jjzcHtZlwgLsb.setHtqsrq(DateUtils.getTodayStart(jjzcHtZlwgLsb.getHtqsrq()));
		//}
		//if(jjzcHtZlwgLsb.getHtdqrq()!=null){
		//	jjzcHtZlwgLsb.setHtdqrq(DateUtils.getTodayEnd(jjzcHtZlwgLsb.getHtdqrq()));
		//}
		contractBSImpl.saveJjzcHtZlwgLsb(jjzcHtZlwgLsb);
		
	}

	public void saveJyzchtJdzj(List<JjzcHtJdzjLsb> list) {
		contractBSImpl.saveJyzchtJdzj(list);
		
	}

	public void updateJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb) {
		contractBSImpl.updateJjzcHtZlwgLsb(jjzcHtZlwgLsb);
		
	}

	public List<JyzlBodyVO2> getJyzlBodyVO2ByCldId(String headId) {
		return contractBSImpl.getJyzlBodyVO2ByCldId(headId);
	}

	public List<JyzlBodyVO> getJyzlBodyVOByCldId(String headId) {
		return contractBSImpl.getJyzlBodyVOByCldId(headId);
	}

	public CommonBO getCommonBO(String htId) {
		
		return null;
	}

	public JjzcHtZlwg getJjzcHtZlwgById(String id) {
		
		return contractBSImpl.getJjzcHtZlwgById(id);
	}


	public void setValue(String id, String headId) {
		JjzcHtZlwg jjzcHtZlwg=this.getJjzcHtZlwgById(id);
		//
		JjzcHtZlwgLsb jj=new JjzcHtZlwgLsb();
		 jj= this.jjzcHtBx2Body(jjzcHtZlwg);
		 //处理单
		jj.setCldId(headId);
		this.saveJjzcHtZlwgLsb(jj);
		
	}

	public void deleteJjzcHtZlwgLsb(String id) {
		contractBSImpl.deleteJjzcHtZlwgLsb(id);		
	}

 //得到一条记录并且做修改
	public void getSingleAndUpdate(String id){
		JjzcHtZlwgLsb jjzcHtZlwgLsb=this.getJjzcHtZlwgLsbById(id);
		this.updateJjzcHtZlwgLsb(jjzcHtZlwgLsb);
	}
	public List <JjzcHtZlwg> getJjzcHtZlwgByzcIdandzcLx(String zcId ,String zcLx){
		
		return contractBSImpl.getJjzcHtZlwgByzcIdandzcLx(zcId, zcLx);
	}

	public List<JjzcHtBx> getJjzcHtBxByzcId(String zcId) {
		
		return contractBSImpl.getJjzcHtBxByzcId(zcId);
	}
	//add by lantianbo 查询委管合同
	public String getJjzcHtBxHtViewByCondition(String sheettype, JjzcHtBxQueryVO queryVO, Paginator paginator){
		return contractBSImpl.getJjzcHtBxHtViewByCondition(sheettype, queryVO, paginator);
	}
	
	/**
	 * 展现选择的合同列表
	 * @return
	 */
	public List queryChooseHtListByIds(String[] htIds,String headId){
		return contractBSImpl.queryChooseHtListByIds(htIds,headId);
	}

	/**
	 * 展现选择的合同列表,清算查询里的录入实收页面
	 * @return
	 */
	public List queryChooseHtListByIds1(String[] htIds,String headId){
		return contractBSImpl.queryChooseHtListByIds1(htIds,headId);
	}
	
	public JjzcHtZlwg getJjzcHtZlwgByHtbh(String contractId) {
		return contractBSImpl.getJjzcHtZlwgByHtbh(contractId);
	}

	public List getJjzcHtJdzjByHtId(String id) {
		return contractBSImpl.getJjzcHtJdzjByHtId(id);
	}
	
	public JyzcHtqsBody getJyzcHtqsBodyById(String id){
		return contractBSImpl.getJyzcHtqsBodyById(id);
	}
	
	public void update(CommonBO bo){
		contractBSImpl.update(bo);
	}
	public String getSszj(String headId, String htbh, String bodyId,
			String qsjzrq){
		return this.contractBSImpl.getSszj( headId,  htbh,  bodyId, qsjzrq);
	}
	public void saveSszj(String[] qsjzrqs, String[] yszjs, String[] sszjs,
			String[] bodyIds){
		
		contractBSImpl.saveSszj(qsjzrqs,yszjs,sszjs,bodyIds);
	}
	public void deleteBody(String ids){
		contractBSImpl.deleteBody(ids);
	}
	public ClearQueryVO getClearQueryVOById(String id){
		return contractBSImpl.getClearQueryVOById(id);
	}

	// 根据合同编号查找变动历史信息
	public List<Recordhistory> getBianDongByHtId(String htId) {
		return contractBSImpl.getBianDongByHtId(htId);
	}

	// 根据合同编号查找清算信息
	public List<JjzcHtqsHead> getQingSuanByHtId(String htId) {
		return contractBSImpl.getQingSuanByHtId(htId);
	}

	public List<JjzcHtZlwgLsb> getByHeadId(String cldId) {
		return contractBSImpl.getByHeadId(cldId);
	}


	public void deleteJjzcHtBx(String ids) {
		contractBSImpl.deleteJjzcHtBx(ids);
		
	}
	public JjzcHtBx getByJjzcHtBxsId(String id){
		return contractBSImpl.getByJjzcHtBxsId(id);
	}

	
	/**
	 * 根据bodyId保存清算截至日期，应收资金，到body表中
	 * @param qsjzrqs  清算截至日期
	 * @param yszjs 应收资金
	 * @param bodyIds 
	 */
	public void updateInfoToBody(String headId ,String[] qsjzrqs, String[] yszjs,String[] qstzje,
			String[] xghyszj,String[] tzyy,String[] htbh,String[] qsksrq,String[]bodyIds,String[]mzq){
		contractBSImpl.updateInfoToBody(headId,qsjzrqs,yszjs,qstzje,xghyszj,tzyy,htbh, qsksrq,bodyIds,mzq);
	}

	public void compareHtVsBody(JjzcHtZlwgLsb body, JjzcHtZlwg htzl) {
		contractBSImpl.compareHtVsBody(body, htzl);		
	}
	
	/**
	 * 验证处理单下，是否已添加过清算合同
	 * @param headId
	 * @param htIds
	 * @return
	 */
	public String validateHt(String headId, String htIds){
		return contractBSImpl.validateHt(headId,htIds);
		
	}
	/**
	 * 查询清算body列表
	 * @param headid
	 * @return
	 */
	public List<JyzcHtqsBody> getBodyListByHeadId(String headid){
		return contractBSImpl.getBodyListByHeadId(headid);
	}

	public String getHtlxName(String strKey) {
		return contractBSImpl.getHtlxName(strKey);
	}
	
	/**
	 * 根据id查询保险合同信息
	 * @param Id
	 * @return
	 */
	public JjzcHtBx getJjzcHtBxById(String id) {
		return contractBSImpl.getJjzcHtBxById(id);
	}
	
	/**
	 * 根据合同类型，合同id 查出合同关联的资产
	 * @return
	 */
	public String getZc4Ht(String htId, String htlx){
		return contractBSImpl.getZc4Ht(htId, htlx);
	}
	/**
	 * 根据合同id，选择的资产id 删除资产与合同之间的关系
	 */
	public void deleteZc4Ht(String htId, String zcIds,String htlx){
		this.contractBSImpl.deleteZc4Ht(htId, zcIds, htlx);
	}
	
	/**
	 * 根据合同id，选择的资产id 合同类型 关联资产与合同之间的关系
	 * @param htId
	 * @param zcIds
	 * @param htlx
	 */
	public void queryZcList(String htId, String zcIds, String htlx){
		contractBSImpl.getZcList(htId, zcIds, htlx);
	}
	
	/**
	 * 删除一条或多条合同临时表信息
	 * @param htIds
	 */
	public void deleteBodys(String[] htIds){
		contractBSImpl.deleteBodys(htIds);
	}
	/**
	 * 根据合同id，分段租金数据保存分段租金数据
	 * @param id
	 * @param ksrqs
	 * @param jsrqs
	 * @param yzjs
	 */
	public void updateJdzjByHtId(String id, String[] ksrqs, String[] jsrqs,
			String[] yzjs){
		this.contractBSImpl.updateJdzjByHtId(id, ksrqs, jsrqs, yzjs);
	}
	/**
	 * 根据合同id查询分段租金列表
	 * @param htId
	 * @return
	 */
	public List getJdzjList(String htId){
		List list = new ArrayList();
		List JdzjList = this.contractBSImpl.getJdzjList(htId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		NumberFormat format = NumberFormat.getInstance();
		format.setMaximumFractionDigits(2);
		if(JdzjList!=null&&JdzjList.size()>0){
			for(int i=0;i<JdzjList.size();i++){
				JyzcHtJdzjVO jyzcHtJdzjVO = new JyzcHtJdzjVO();
				JjzcHtJdzjLsb jjzcHtJdzjLsb =(JjzcHtJdzjLsb) JdzjList.get(i);
				jyzcHtJdzjVO.setId(jjzcHtJdzjLsb.getId()==null?"":jjzcHtJdzjLsb.getId());
				if(jjzcHtJdzjLsb.getKsrq()!=null){
					jyzcHtJdzjVO.setKsrq(sdf.format(jjzcHtJdzjLsb.getKsrq()));
				}
				if(jjzcHtJdzjLsb.getJsrq()!=null){
					jyzcHtJdzjVO.setJsrq(sdf.format(jjzcHtJdzjLsb.getJsrq()));
				}
				jyzcHtJdzjVO.setHtId(jjzcHtJdzjLsb.getHtId()==null?"":jjzcHtJdzjLsb.getHtId());
				jyzcHtJdzjVO.setBiandong(format.format(jjzcHtJdzjLsb.getBiandong()==null?new Double(0):jjzcHtJdzjLsb.getBiandong()).replace(",", ""));
				jyzcHtJdzjVO.setYzj(format.format(jjzcHtJdzjLsb.getYzj()==null?new Double(0):jjzcHtJdzjLsb.getYzj()).replace(",", ""));
				list.add(jyzcHtJdzjVO);
			}
		}
		return list;
	}
	
	/**
	 * 终止合同
	 * @param htId
	 * @param jjzcHtZlwgLsb
	 */
	public void zhongzhiContract(String htId, JjzcHtZlwgLsb jjzcHtZlwgLsb){
		this.contractBSImpl.zhongzhiContract( htId,  jjzcHtZlwgLsb);
	}
	
	/**
	 * //对合同的变动信息进行记录
	 * @param jjzcHtZlwgLsb
	 */
	public void saveRecordhistory(JjzcHtZlwgLsb jjzcHtZlwgLsb){
		this.contractBSImpl.saveRecordhistory(jjzcHtZlwgLsb);
	}
	/**
	 * 流程办结并生成台账
	 * @param headId
	 * @return
	 */
	public String banjie(String headId){
		return this.contractBSImpl.banjie(headId);
	}

	public List<Recordhistory> getRecordhistoryByhtId(String htId, String pkId) {

		return contractBSImpl.getRecordhistoryByhtId(htId, pkId);
	}

	public List<Recordhistory> getRecordhistoryByhtbh(String htbh) {
	
		return contractBSImpl.getRecordhistoryByhtbh(htbh);
	}

	public List<JyzcHtqsBody> getJyzcHtqsBodyByhtbh(String htbh) {
		
		return contractBSImpl.getJyzcHtqsBodyByhtbh(htbh);
	}

	public List getZc4HtInfo(String htId, String htlx) {
		List<AssetInfoVO> assetInfoVOList = new ArrayList();
		List zcIdList =  contractBSImpl.getZc4HtInfo(htId, htlx);
		if(zcIdList!=null&&zcIdList.size()>0){
			for(int i=0; i<zcIdList.size();i++){
				
				AssetInfoVO assetInfoVO = assetBSImpl.getAssetInfoVOByzcId(zcIdList.get(i).toString());
				if(assetInfoVO.getCZcdq()!=null&&""!=assetInfoVO.getCZcdq()){
					assetInfoVO.setCZcdq(assetBSImpl.checkString(assetBSImpl.findCoteNameByCoteKey("PROVIENCE",assetBSImpl.checkString(String.valueOf(assetInfoVO.getCZcdq())))));//地区
				}
				if(assetInfoVO.getCZclx()!=null&&""!=assetInfoVO.getCZclx()){
					assetInfoVO.setCZclx(assetBSImpl.checkString(assetBSImpl.findCoteNameByCoteKey("ASSET_TYPE",assetBSImpl.checkString(String.valueOf(assetInfoVO.getCZclx())))));
				}
				assetInfoVOList.add(assetInfoVO);
			}
		}
		return assetInfoVOList;
	}
	
	/**
	 * 页面点击确定后，保存信息，
	 * @return
	 */
	public void updateInfoToBody1(String headId, String[] sszjs,
			String[] bcbdjes, String[] scbdjes, String[] bdyys, String[] bodyIds){
		contractBSImpl.updateInfoToBody1(headId, sszjs, bcbdjes, scbdjes, bdyys, bodyIds);
	}

	public List<JjzcHtZlwg> getJjzcHtZlwgByzcIdandzcLxforAsset(String zcId,
			String zcLx) {

		return contractBSImpl.getJjzcHtZlwgByzcIdandzcLxforAsset(zcId, zcLx);
	}
  // 查询流程信息
	public List<PTEnd> findMyPTEndList_nopage(String strZcId, String strTitle) {
		return contractBSImpl.findMyPTEndList_nopage(strZcId, strTitle);
	}


	public List<JjzcHtBxHtView> getJjzcHtBxHtViewByCondition(JjzcHtBxQueryVO queryVo,String ids) {
		return contractBSImpl.getJjzcHtBxHtViewByCondition(queryVo,ids);
	}

	public List<ClearQueryVO> getJjzcHtViewByCondition(String ids) {
		return contractBSImpl.getJjzcHtViewByCondition(ids);
	}


	public void tenancyTOcontract(String zlHeadId, String htHeadID) {
		contractBSImpl.tenancyTOcontract(zlHeadId, htHeadID);
	}

	public List getzsbJdzjList(String htId) {
		List list = new ArrayList();
		List JdzjList = contractBSImpl.getzsbJdzjList(htId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		NumberFormat format = NumberFormat.getInstance();
		format.setMaximumFractionDigits(2);
		if(JdzjList!=null&&JdzjList.size()>0){
			for(int i=0;i<JdzjList.size();i++){
				JyzcHtJdzjVO jyzcHtJdzjVO = new JyzcHtJdzjVO();
				JjzcHtJdzj jjzcHtJdzj =(JjzcHtJdzj) JdzjList.get(i);
				jyzcHtJdzjVO.setId(jjzcHtJdzj.getId()==null?"":jjzcHtJdzj.getId());
				if(jjzcHtJdzj.getKsrq()!=null){
					jyzcHtJdzjVO.setKsrq(sdf.format(jjzcHtJdzj.getKsrq()));
				}
				if(jjzcHtJdzj.getJsrq()!=null){
					jyzcHtJdzjVO.setJsrq(sdf.format(jjzcHtJdzj.getJsrq()));
				}
				jyzcHtJdzjVO.setHtId(jjzcHtJdzj.getHtId()==null?"":jjzcHtJdzj.getHtId());
				jyzcHtJdzjVO.setBiandong(format.format(jjzcHtJdzj.getBiandong()==null?new Double(0):jjzcHtJdzj.getBiandong()).replace(",", ""));
				jyzcHtJdzjVO.setYzj(format.format(jjzcHtJdzj.getYzj()==null?new Double(0):jjzcHtJdzj.getYzj()).replace(",", ""));
				list.add(jyzcHtJdzjVO);
			}
		}
		return list;
	}

	public String codeExistyesORno(String htlx,String headId, String htbh) {
		String result = "no";
		if("zlht".equals(htlx)||"wght".equals(htlx)){
			List list = contractBSImpl.getJjzcHtZlwgLsbByfxbhAndzcId(htbh,headId);
			if(list!=null&&list.size()>0){
				result = "yes";
			}
		}else{
			List list = contractBSImpl.getJJjzcHtBxByfxbhAndzcId(htbh,headId);
			if(list!=null&&list.size()>0){
				result = "yes";
			}
		}
		return result;
	}

}
