package com.tansun.eam2.zccz.action;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IAssetDealBodyUCC;
import com.tansun.eam2.zccz.ucc.impl.AssetDealBodyUCCImpl;
import com.tansun.eam2.zccz.vo.CzExcelVo;
import com.tansun.eam2.zccz.vo.DisposeAssetVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public class AssetExcelAction extends CommonAction implements IExport{
	private Paginator paginator;
	private CzExcelVo czExcelVo ;
	@Autowired
	private IAssetDealBodyUCC assetDealBodyUCCImpl;
	/**
	 * 导出excel
	 */
	public String exportexcel() throws Exception {
		if (czExcelVo == null) {
			czExcelVo = new CzExcelVo();
		}
		if(assetDealBodyUCCImpl==null){
			assetDealBodyUCCImpl=(IAssetDealBodyUCC)SpringContextHelper.getBean(AssetDealBodyUCCImpl.class);
		}
 		
 		List<CzZcXx> disposeAssetList2 = this.assetDealBodyUCCImpl.viewBody(czExcelVo.getCscldid(), czExcelVo.getAssetType());
		List<CzZcXx> disposeAssetList = null;
		if(paginator!=null){
			disposeAssetList = this.assetDealBodyUCCImpl.viewBodyFY(czExcelVo.getCscldid(), czExcelVo.getAssetType(),new ArrayList(),paginator);
		}else{
			disposeAssetList = this.assetDealBodyUCCImpl.viewBody(czExcelVo.getCscldid(), czExcelVo.getAssetType());
		}
		List<DisposeAssetVO> resultList = new ArrayList<DisposeAssetVO>();
		Double zmyzTotal = 0d;
		Double zmjzTotal = 0d;
		Double pgjzTotal = 0d;
		//返回json串
		String totalStr = "";
		if(StringUtils.indexOfAny(czExcelVo.getAssetType(), new String[]{
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
		else if(ZcczCommon.ENTITY_ASSET.equals(czExcelVo.getAssetType())){
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
		else if(ZcczCommon.LOAN_PLEDGE.equals(czExcelVo.getAssetType())){
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
		else if(ZcczCommon.ZYZC_ASSET.equals(czExcelVo.getAssetType())){
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
		}else if(StringUtils.equals(ZcczCommon.STOCK, czExcelVo.getAssetType())){
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
		return returnStrBuff.toString();
	}
	public void setExcelVO(CommonBO excelVO) {
		this.czExcelVo = (CzExcelVo)excelVO;
	}
	public Paginator getPaginator() {
		return paginator;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
}
