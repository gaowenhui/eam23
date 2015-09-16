package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IAssetDealBodyUCC;
import com.tansun.eam2.zccz.vo.DisposeAssetVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class AssetDealBodyAction extends CommonAction {
	
	//处置资产类别
	private String assetType;
	private Paginator paginator;
	//处理单id
	private String cldId;
	
	//初始处理单id
	private String cscldid;
	
	@Autowired
	private IAssetDealBodyUCC assetDealBodyUCCImpl;
	
	public IAssetDealBodyUCC getAssetDealBodyUCCImpl() {
		return assetDealBodyUCCImpl;
	}

	public void setAssetDealBodyUCCImpl(IAssetDealBodyUCC assetDealBodyUCCImpl) {
		this.assetDealBodyUCCImpl = assetDealBodyUCCImpl;
	}

	/**
	 * 保存表体
	 * @return
	 */
	public String saveBody(){
		return null;
	}
	
	/**
	 * 增加表体记录
	 * @return
	 */
	public String addBody(){
		//经营性固定资产
		if(StringUtils.indexOfAny(assetType, new String[]{
				ZcczCommon.MANAGE_FIXED_ASSEET,
				ZcczCommon.DEALING_ASSET,
				ZcczCommon.ENTRUST_ASSET
		}) != -1){
//		if(ZcczCommon.MANAGE_FIXED_ASSEET.equals(assetType)){
			//选择的资产Ids
			String selectedAssetIds = request.getParameter("assetIds");
			if(selectedAssetIds.startsWith(",")){
				selectedAssetIds = selectedAssetIds.substring(1);
			}
			cldId = request.getParameter("cldId");
			String[] selectedAssetIdArray = selectedAssetIds.split(",");
			//对id进行检查
			String[] assetIds = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(cldId, assetType, selectedAssetIdArray);
			//根据资产ids保存选择的资产信息到处置资产信息表CZ_ZC_XX
			if(assetIds != null && assetIds.length > 0){
				this.assetDealBodyUCCImpl.saveJyzcByIds(assetIds,cldId,assetType);
			}
		}
		/*
		String ST_INFO_TUDI = "7";			  //7：(实体资产)土地
		String ST_INFO_FANGWU = "8";		  //8：(实体资产)房屋
		String ST_INFO_JIXIESHEBE = "9";	  //9：(实体资产)机械设备
		String ST_INFO_JIAOTONGYUNSHU = "10"; //10：交通运输
		String ST_INFO_DUIWAITOUZI = "11";    //11：对外投资
		String ST_INFO_QITAZICHAN = "12";	  //12：其他资产
		*/
		//实体内资产
		else if(ZcczCommon.ENTITY_ASSET.equals(assetType)){
			String entityCldId = (String)session.get("entityCldId");
			String stid = (String)this.request.getParameter("stid");
			//处置资产列表
			String landIds = this.request.getParameter("landIds");
			if(landIds != null && landIds.trim().length() > 0){
				if(landIds.startsWith(",")){
					landIds = landIds.substring(1);
				}
				String[] landId = landIds.split(",");
				String[] addLandId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(entityCldId, ZcczCommon.ENTITY_ASSET, landId);
				if(addLandId != null && addLandId.length > 0)
					this.assetDealBodyUCCImpl.saveEntityByIds(addLandId, entityCldId, StglCommon.ST_INFO_TUDI, stid);
			}
			
			String houseIds = this.request.getParameter("houseIds");
			if(houseIds != null && houseIds.trim().length() > 0){
				if(houseIds.startsWith(",")){
					houseIds = houseIds.substring(1);
				}
				String[] houseId = houseIds.split(",");
				String[] addHouseId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(entityCldId, ZcczCommon.ENTITY_ASSET, houseId);
				if(addHouseId != null && addHouseId.length > 0)
					this.assetDealBodyUCCImpl.saveEntityByIds(addHouseId, entityCldId, StglCommon.ST_INFO_FANGWU, stid);
			}
			String machineIds = this.request.getParameter("machineIds");
			if(machineIds != null && machineIds.trim().length() > 0){
				if(machineIds.startsWith(",")){
					machineIds = machineIds.substring(1);
				}				
				String[] machineId = machineIds.split(",");
				String[] addMachineId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(entityCldId, ZcczCommon.ENTITY_ASSET, machineId);
				if(addMachineId != null && addMachineId.length > 0)
					this.assetDealBodyUCCImpl.saveEntityByIds(addMachineId, entityCldId, StglCommon.ST_INFO_JIXIESHEBE, stid);
			}
			String trafficIds = this.request.getParameter("trafficIds");
			if(trafficIds != null && trafficIds.trim().length() > 0){
				if(trafficIds.startsWith(",")){
					trafficIds = trafficIds.substring(1);
				}	
				String[] trafficId = trafficIds.split(",");
				String[] addTrafficId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(entityCldId, ZcczCommon.ENTITY_ASSET, trafficId);
				if(addTrafficId != null && addTrafficId.length > 0)
					this.assetDealBodyUCCImpl.saveEntityByIds(addTrafficId, entityCldId, StglCommon.ST_INFO_JIAOTONGYUNSHU, stid);
			}
			String otherAssetIds = this.request.getParameter("otherAssetIds");
			if(otherAssetIds != null && otherAssetIds.trim().length() > 0){
				if(otherAssetIds.startsWith(",")){
					otherAssetIds = otherAssetIds.substring(1);
				}			
				String[] otherAssetId = otherAssetIds.split(",");
				String[] addOtherAssetId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(entityCldId, ZcczCommon.ENTITY_ASSET, otherAssetId);
				if(addOtherAssetId != null && addOtherAssetId.length > 0)
					this.assetDealBodyUCCImpl.saveEntityByIds(addOtherAssetId, entityCldId, StglCommon.ST_INFO_QITAZICHAN, stid);
			}
		}
		//委托贷款抵债物
		else if(ZcczCommon.LOAN_PLEDGE.equals(assetType)){
			String loanPledgeCldId = (String)this.request.getParameter("cldId");
			String loansNo = (String)this.request.getParameter("loansNo");
			//处置资产列表
			String landIds = this.request.getParameter("landIds");
			if(landIds != null && landIds.trim().length() > 0){
				if(landIds.startsWith(",")){
					landIds = landIds.substring(1);
				}
				String[] landId = landIds.split(",");
				String[] addLandId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(loanPledgeCldId, ZcczCommon.LOAN_PLEDGE, landId);
				if(addLandId != null && addLandId.length > 0)
					this.assetDealBodyUCCImpl.saveLoanByIds(landId, loanPledgeCldId, StglCommon.ST_INFO_TUDI, loansNo);
			}
			String houseIds = this.request.getParameter("houseIds");
			if(houseIds != null && houseIds.trim().length() > 0){
				if(houseIds.startsWith(",")){
					houseIds = houseIds.substring(1);
				}
				String[] houseId = houseIds.split(",");
				String[] addHouseId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(loanPledgeCldId, ZcczCommon.LOAN_PLEDGE, houseId);
				if(addHouseId != null && addHouseId.length > 0)
					this.assetDealBodyUCCImpl.saveLoanByIds(addHouseId, loanPledgeCldId, StglCommon.ST_INFO_FANGWU, loansNo);
			}
			String machineIds = this.request.getParameter("machineIds");
			if(machineIds != null && machineIds.trim().length() > 0){
				if(machineIds.startsWith(",")){
					machineIds = machineIds.substring(1);
				}
				String[] machineId = machineIds.split(",");
				String[] addMachineId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(loanPledgeCldId, ZcczCommon.LOAN_PLEDGE, machineId);
				if(addMachineId != null && addMachineId.length > 0)
					this.assetDealBodyUCCImpl.saveLoanByIds(addMachineId, loanPledgeCldId, StglCommon.ST_INFO_JIXIESHEBE, loansNo);
			}
			String trafficIds = this.request.getParameter("trafficIds");
			if(trafficIds != null && trafficIds.trim().length() > 0){
				if(trafficIds.startsWith(",")){
					trafficIds = trafficIds.substring(1);
				}
				String[] trafficId = trafficIds.split(",");
				String[] addTrafficId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(loanPledgeCldId,ZcczCommon.LOAN_PLEDGE, trafficId);
				if(addTrafficId != null && addTrafficId.length > 0)
					this.assetDealBodyUCCImpl.saveLoanByIds(addTrafficId, loanPledgeCldId, StglCommon.ST_INFO_JIAOTONGYUNSHU, loansNo);
			}
			String otherAssetIds = this.request.getParameter("otherAssetIds");
			if(otherAssetIds != null && otherAssetIds.trim().length() > 0){
				if(otherAssetIds.startsWith(",")){
					otherAssetIds = otherAssetIds.substring(1);
				}
				String[] otherAssetId = otherAssetIds.split(",");
				String[] addOtherAssetId = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(loanPledgeCldId, ZcczCommon.LOAN_PLEDGE, otherAssetId);
				if(addOtherAssetId != null && addOtherAssetId.length > 0)
					this.assetDealBodyUCCImpl.saveLoanByIds(addOtherAssetId, loanPledgeCldId, StglCommon.ST_INFO_QITAZICHAN, loansNo);
			}
		}
		// 自用资产
		else if(ZcczCommon.ZYZC_ASSET.equals(assetType)){
			//选择的资产Ids
			String selectedAssetIds = request.getParameter("zcIds");
			if(selectedAssetIds.startsWith(",")){
				selectedAssetIds = selectedAssetIds.substring(1);
			}
			cldId = request.getParameter("cldId");
			String[] zcIds = selectedAssetIds.split(",");
			//对id进行检查
			String[] zyzcIdsForAdd = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(cldId, assetType, zcIds);
			//根据自用资产ids保存选择的自用资产信息到处置资产信息表CZ_ZC_XX
			if(zyzcIdsForAdd != null && zyzcIdsForAdd.length > 0){
				this.assetDealBodyUCCImpl.saveZyzcByIds(zyzcIdsForAdd, cldId);
			}
		}
		//债券
		else if(StringUtils.equals(ZcczCommon.STOCK,assetType)){
			String selectedAssetIds = request.getParameter("assetIds");
			if(selectedAssetIds.startsWith(",")){
				selectedAssetIds = selectedAssetIds.substring(1);
			}
			cldId = request.getParameter("cldId");
			String[] selectedAssetIdArray = selectedAssetIds.split(",");
			//对id进行检查
			String[] assetIds = this.assetDealBodyUCCImpl.checkAssetIdsForAdd(cldId, assetType, selectedAssetIdArray);
			//根据资产ids保存选择的资产信息到处置资产信息表CZ_ZC_XX
			if(assetIds != null && assetIds.length > 0){
				this.assetDealBodyUCCImpl.saveZqByIds(assetIds, cldId,assetType);
			}
		}
		response.setCharacterEncoding("UTF-8");
		String returnStr = "success";
		try {
			response.getWriter().print(returnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除表体记录
	 * @return
	 */
	public String deleteBody(){
		String isModifyState = request.getParameter("isModifyState");
		String delBodyIds = request.getParameter("delBodyIds");
		if(delBodyIds.startsWith(",")){
			delBodyIds = delBodyIds.substring(1);
		}
		String[] bodyIds = delBodyIds.split(",");
		this.assetDealBodyUCCImpl.deleteBody(bodyIds);
		//删除资产的同时修改资产状态
		if(isModifyState != null && isModifyState.equals("true")){
			this.assetDealBodyUCCImpl.modifyBodyStateDel(cldId);
		}
		return null;
	}
	
	
	/**
	 * 查看表体记录入口(只读)
	 */
	public String vidwBody(){
		//根据处理单id和处置资产类别，查询处置资产信息
		List<CzZcXx> disposeAssetList2 = this.assetDealBodyUCCImpl.viewBody(cscldid, assetType);
		List<CzZcXx> disposeAssetList = null;
		if(paginator!=null){
			disposeAssetList = this.assetDealBodyUCCImpl.viewBodyFY(cscldid, assetType,new ArrayList(),paginator);
		}else{
			disposeAssetList = this.assetDealBodyUCCImpl.viewBody(cscldid, assetType);
		}
		List<DisposeAssetVO> resultList = new ArrayList<DisposeAssetVO>();
		Double zmyzTotal = 0d;
		Double zmjzTotal = 0d;
		Double pgjzTotal = 0d;
		//返回json串
		String totalStr = "";
		if(StringUtils.indexOfAny(assetType, new String[]{
				ZcczCommon.MANAGE_FIXED_ASSEET,
				ZcczCommon.DEALING_ASSET,
				ZcczCommon.ENTRUST_ASSET
		}) != -1){
			//进行单位元、万元之间的转换
			for(int i = 0;i < disposeAssetList.size();i++){
				DisposeAssetVO disposeAssetVO = new DisposeAssetVO();
				CzZcXx temp = disposeAssetList.get(i);
				try {
					BeanUtils.copyProperties(disposeAssetVO, temp);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				if(temp.getAzmyz() != null){
//					disposeAssetVO.setZmyz(temp.getAzmyz()/10000);
					disposeAssetVO.setZmyz(temp.getAzmyz());
					zmyzTotal += disposeAssetVO.getZmyz();
				}
				if(temp.getAzmjz() != null){
//					disposeAssetVO.setZmjz(temp.getAzmjz()/10000);
					disposeAssetVO.setZmjz(temp.getAzmjz());
					zmjzTotal += disposeAssetVO.getZmjz();
				}
				if(temp.getApgjz() != null){
//					disposeAssetVO.setPgjz(temp.getApgjz()/10000);
					disposeAssetVO.setPgjz(temp.getApgjz());
					pgjzTotal += disposeAssetVO.getPgjz();
				}
				if(StringUtils.equals("1", temp.getCZcqs())){
					disposeAssetVO.setZcqs("自有");
				}else if(StringUtils.equals("2", temp.getCZcqs())){
					disposeAssetVO.setZcqs("受托");
				}
				disposeAssetVO.setSfczwb("1".equals(disposeAssetVO.getSfczwb())?"是":"否");
				resultList.add(disposeAssetVO);
			}
			totalStr = ",\"userdata\":{\"zmyz\":\"" + zmyzTotal + 
										"\",\"zmjz\":\"" + zmjzTotal + 
										"\",\"apgjz\":\"" + pgjzTotal + 
										"\",\"azcmc\":\"合计:\"}";
		}
		
		//实体内资产
		else if(ZcczCommon.ENTITY_ASSET.equals(assetType)){
			Double estimateValue = 0d;
			for (int i = 0;i < disposeAssetList.size();i++){
				DisposeAssetVO disposeAssetVO = new DisposeAssetVO();
				CzZcXx temp = disposeAssetList.get(i);
				try {
					BeanUtils.copyProperties(disposeAssetVO, temp);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				if(temp.getBpgz() != null){
					disposeAssetVO.setEntityPgjz(temp.getBpgz()/10000);
					disposeAssetVO.setEntityPgjz(temp.getBpgz());
					estimateValue += disposeAssetVO.getEntityPgjz();
				}
				disposeAssetVO.setEntityAssetType(this.assetDealBodyUCCImpl.convertEntityType(temp.getBstzclx()));
				disposeAssetVO.setSfczwb("1".equals(disposeAssetVO.getSfczwb())?"是":"否");
				resultList.add(disposeAssetVO);
			}
			totalStr = ",\"userdata\":{\"entityPgjz\":\"" + estimateValue + 
										"\",\"bstmc\":\"合计:\"}";
		}
		//委贷抵债物
		else if(ZcczCommon.LOAN_PLEDGE.equals(assetType)){
			Double estimateValue2 = 0d;
			for (int i = 0;i < disposeAssetList.size();i++){
				DisposeAssetVO disposeAssetVO = new DisposeAssetVO();
				CzZcXx temp = disposeAssetList.get(i);
				try {
					BeanUtils.copyProperties(disposeAssetVO, temp);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				if(temp.getCpgz() != null){
//					disposeAssetVO.setLoanPledgePgjz(temp.getCpgz()/10000);
					disposeAssetVO.setLoanPledgePgjz(temp.getCpgz());
					estimateValue2 += disposeAssetVO.getLoanPledgePgjz();
				}
				disposeAssetVO.setEntityAssetType(this.assetDealBodyUCCImpl.convertEntityType(temp.getCzclx()));
				disposeAssetVO.setSfczwb("1".equals(disposeAssetVO.getSfczwb())?"是":"否");
				resultList.add(disposeAssetVO);
			}
			totalStr = ",\"userdata\":{\"loanPledgePgjz\":\"" + estimateValue2 + 
										"\",\"czcbh\":\"合计:\"}";			
		}

		// 自用资产
		else if(ZcczCommon.ZYZC_ASSET.equals(assetType)){
			//进行单位元、万元之间的转换
			Double totalCcyz = 0d;
			for(int i = 0;i < disposeAssetList.size();i++){
				DisposeAssetVO disposeAssetVO = new DisposeAssetVO();
				CzZcXx temp = disposeAssetList.get(i);
				try {
					BeanUtils.copyProperties(disposeAssetVO, temp);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				if(temp.getZyccyz() != null){
//					disposeAssetVO.setZyccyzWy(temp.getZyccyz()/10000);
					disposeAssetVO.setZyccyzWy(temp.getZyccyz());
					totalCcyz += disposeAssetVO.getZyccyzWy();
				}
				disposeAssetVO.setSfczwb("1".equals(disposeAssetVO.getSfczwb())?"是":"否");
				resultList.add(disposeAssetVO);
			}
			totalStr = ",\"userdata\":{\"zyccyzWy\":\"" + totalCcyz + 
										"\",\"zyzcbh\":\"合计:\"}";	
		}else if(StringUtils.equals(ZcczCommon.STOCK, assetType)){
			//进行单位元、万元之间的转换
			for(int i = 0;i < disposeAssetList.size();i++){
				DisposeAssetVO disposeAssetVO = new DisposeAssetVO();
				CzZcXx temp = disposeAssetList.get(i);
				try {
					BeanUtils.copyProperties(disposeAssetVO, temp);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				disposeAssetVO.setSfczwb("1".equals(disposeAssetVO.getSfczwb())?"是":"否");
				resultList.add(disposeAssetVO);
			}
		}
		String returnStr = "";
	    if(paginator!=null){
	    	int count = 0 ;
	 	    int sum = disposeAssetList2.size();//总数据
	 	    int pageSize = this.getPaginator().getPageSize();//当前页显示数据数
	 	    if(pageSize!=0){
	 	    	if(sum % pageSize !=0 ){
	 	    		count = sum / pageSize +1;
	 	    	}else{
	 	    		count = sum / pageSize;
	 	    	}
	 	    }
	 	    
	 	   returnStr =  BodyListToJSON.getJSON(resultList, count, this.getPaginator().getCurrentPage(), disposeAssetList2.size());
	    }else{
	       returnStr =  BodyListToJSON.getJSON(resultList, 100, 1, 100000);
	  	   
	    }
		StringBuffer returnStrBuff = new StringBuffer(returnStr);
		returnStrBuff.insert(returnStrBuff.length()-1, totalStr);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(returnStrBuff.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String updateBodyCzfs(){
		String id = request.getParameter("id");
		String CCzfs = request.getParameter("CCzfs");
		assetDealBodyUCCImpl.updateBodyCzfs(id, CCzfs);
		return null;
	}

	public String getCldId() {
		return cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public String getAssetType() {
		return assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public String getCscldid() {
		return cscldid;
	}

	public void setCscldid(String cscldid) {
		this.cscldid = cscldid;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
}
