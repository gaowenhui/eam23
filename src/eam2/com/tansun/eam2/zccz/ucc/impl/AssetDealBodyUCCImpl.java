package com.tansun.eam2.zccz.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.zccz.service.IAssetDealBodyBS;
import com.tansun.eam2.zccz.ucc.IAssetDealBodyUCC;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class AssetDealBodyUCCImpl implements IAssetDealBodyUCC{

	@Autowired
	private IAssetDealBodyBS assetDealBodyBSImpl;
	
	public void saveJyzcByIds(String[] ids,String cldId, String assetType) {
		this.assetDealBodyBSImpl.saveJyzcByIds(ids, cldId, assetType);
	}

	/**
	 * 根据自用资产ids保存选择的自用资产信息到处置资产信息表CZ_ZC_XX
	 * @param ids
	 */
	public void saveZyzcByIds(String[] ids,String cldId){
		this.assetDealBodyBSImpl.saveZyzcByIds(ids, cldId);
	}

	public List<CzZcXx> viewBody(String cldId,String zclb) {
		return this.assetDealBodyBSImpl.viewBody(cldId, zclb);
	}
	public List<CzZcXx> viewBodyFY(String cldId,String zclb,List list,Paginator paginator){
		return this.assetDealBodyBSImpl.viewBodyFY(cldId, zclb,list,paginator);
	}

	public IAssetDealBodyBS getAssetDealBodyBSImpl() {
		return assetDealBodyBSImpl;
	}

	public void setAssetDealBodyBSImpl(IAssetDealBodyBS assetDealBodyBSImpl) {
		this.assetDealBodyBSImpl = assetDealBodyBSImpl;
	}

	public void deleteBody(String[] ids) {
		this.assetDealBodyBSImpl.deleteBody(ids);
	}

	public boolean saveEntityByIds(String[] ids, String cldId, String zclb,String stid) {
		return this.assetDealBodyBSImpl.saveEntityByIds(ids, cldId, zclb,stid);
	}


	public String convertEntityType(String zclb) {
		/*
		String ST_INFO_JINE = "6";	  		  //6：(实体资产)金额
		String ST_INFO_TUDI = "7";			  //7：(实体资产)土地
		String ST_INFO_FANGWU = "8";		  //8：(实体资产)房屋
		String ST_INFO_JIXIESHEBE = "9";	  //9：(实体资产)机械设备
		String ST_INFO_JIAOTONGYUNSHU = "10"; //10：交通运输
		String ST_INFO_DUIWAITOUZI = "11";    //11：对外投资
		String ST_INFO_QITAZICHAN = "12";	  //12：其他资产
		*/
		if(StglCommon.ST_INFO_JINE.equals(zclb)){
			return "现金";
		}else if(StglCommon.ST_INFO_TUDI.equals(zclb)){
			return "土地";
		}else if(StglCommon.ST_INFO_FANGWU.equals(zclb)){
			return "房屋";
		}else if(StglCommon.ST_INFO_JIXIESHEBE.equals(zclb)){
			return "房屋";
		}else if(StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(zclb)){
			return "交通运输工具";
		}else if(StglCommon.ST_INFO_DUIWAITOUZI.equals(zclb)){
			return "对外投资";
		}else if(StglCommon.ST_INFO_QITAZICHAN.equals(zclb)){
			return "其他资产";
		}else{
			return null;
		}
	}


	public boolean saveLoanByIds(String[] ids, String cldId, String zclb,String loanNo) {
		return this.assetDealBodyBSImpl.saveLoanByIds(ids, cldId, zclb, loanNo);
	}


	public void modifyBodyStateDel(String cldId) {
		this.assetDealBodyBSImpl.modifyBodyStateDel(cldId);
	}

	public List<CzZcXx> checkAddAssetIdsForTip(String cldId,String zclb, String[] ids) {
		// TODO Auto-generated method stub
		return null;
	}


	public String[] checkAssetIdsForAdd(String cldId, String zclb,String[] ids) {
		return this.assetDealBodyBSImpl.checkAssetIdsForAdd(cldId, zclb, ids);
	}

	public void saveZqByIds(String[] ids, String cldId, String assetType) {
		this.assetDealBodyBSImpl.saveZqByIds(ids, cldId, assetType);
	}

	public void updateBodyCzfs(String id, String czfs) {
		assetDealBodyBSImpl.updateBodyCzfs(id,czfs);
	}
}
