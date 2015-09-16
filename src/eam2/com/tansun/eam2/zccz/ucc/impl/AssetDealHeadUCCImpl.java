package com.tansun.eam2.zccz.ucc.impl;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.service.IAssetDealHeadBS;
import com.tansun.eam2.zccz.ucc.IAssetDealHeadUCC;
import com.tansun.eam2.zccz.vo.CztzfaXxVO;

@Service
public class AssetDealHeadUCCImpl implements IAssetDealHeadUCC{

	@Autowired
	public IAssetDealHeadBS assetDealHeadBSImpl;
	
	private ICodeService codeService;
	@Autowired
	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}	
	
	public void newHead(CzCztzfaXx disposeHead) {
		assetDealHeadBSImpl.save(disposeHead);
	}

	
	public CzCztzfaXx newHeadVO(CztzfaXxVO disposeHead) {
		CzCztzfaXx temp = new CzCztzfaXx();
		temp.copyVO(disposeHead);
		assetDealHeadBSImpl.save(temp);
//		assetDealHeadBSImpl.test();
//		assetDealHeadBSImpl.zcczDataProcess();
//		assetDealHeadBSImpl.processData();
//		assetDealHeadBSImpl.processData2();
		return temp;
	}

	/**
	 * 保存或更新方法
	 */
	public void saveOrUpdateHead(CzCztzfaXx disposeHead){
		disposeHead.setZclb(disposeHead.getZclb().replace(" ", ""));
		assetDealHeadBSImpl.saveOrUpdate(disposeHead);
	}

	/**
	 * 保存或更新方法
	 */
	public void saveOrUpdateHeadVO(CztzfaXxVO disposeHead){
		disposeHead.setZclb(disposeHead.getZclb().replace(" ", ""));
		CzCztzfaXx temp = new CzCztzfaXx();
		temp.copyVO(disposeHead);
		DecimalFormat df = new DecimalFormat("###,###,###,###,##0.0000");
		DecimalFormat df2 = new DecimalFormat("###,###,###,###,##0.00");
		if(disposeHead.getYjssjewy() != null){
			Number yjssjeStr = null;
			try {
				yjssjeStr = df.parse(disposeHead.getYjssjewy());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//Double yjssje = yjssjeStr.doubleValue() * 10000;
			Double yjssje = yjssjeStr.doubleValue();
			temp.setYjssje(yjssje);        //预计损失金额
		}
		if(disposeHead.getYjczhsjewy() != null){
			Number yjcshsjeStr = null;
			try {
				yjcshsjeStr = df.parse(disposeHead.getYjczhsjewy());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//Double yjcshsje = yjcshsjeStr.doubleValue() * 10000;
			Double yjcshsje = yjcshsjeStr.doubleValue();
			temp.setYjczhsje(yjcshsje);
		}
		if(disposeHead.getYjczfyStr() != null){
			Number yjczfyStr = null;
			try {
				yjczfyStr = df2.parse(disposeHead.getYjczfyStr());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Double yjczfy = yjczfyStr.doubleValue();
			temp.setYjczfy(yjczfy);
		}
		assetDealHeadBSImpl.saveOrUpdate(temp);
	}
	
	public CzCztzfaXx findHeadByDateAndPerson(Date date, String ngr,
			String state) {
		return assetDealHeadBSImpl.findHeadByDateAndPerson(date,ngr,state);
	}

	public Double fillDisposeExpense(String cldId) {
		return this.assetDealHeadBSImpl.fillDisposeExpense(cldId);
	}

	public CzCztzfaXx findHeadById(String cldId) {
		return (CzCztzfaXx)this.assetDealHeadBSImpl.findById(CzCztzfaXx.class, cldId);
	}

	public CzStcztz findHeadById1(String cldId) {
		return (CzStcztz)this.assetDealHeadBSImpl.findById(CzStcztz.class, cldId);
	}
	
	public CzXmxxLsb findXmLsbById(String id){
		return (CzXmxxLsb)this.assetDealHeadBSImpl.findById(CzXmxxLsb.class, id);
	}
	
	public CztzfaXxVO findHeadVOById(String cldId) {
		CzCztzfaXx temp = (CzCztzfaXx)this.assetDealHeadBSImpl.findById(CzCztzfaXx.class, cldId);
		if(temp != null){
			CztzfaXxVO vo = new CztzfaXxVO();
			vo.copyBO(temp);
			DecimalFormat df = new DecimalFormat("###,###,###,###,##0.0000");
			DecimalFormat df2 = new DecimalFormat("###,###,###,###,##0.00");
			df.setGroupingSize(3);
			if(temp.getYjczhsje() != null){
//				vo.setYjczhsjewy(df.format(temp.getYjczhsje()/10000));
				vo.setYjczhsjewy(df.format(temp.getYjczhsje()));
			}
			if(temp.getYjssje() != null){
//				vo.setYjssjewy(df.format(temp.getYjssje()/10000));
				vo.setYjssjewy(df.format(temp.getYjssje()));
			}
			if(temp.getYjczfy() != null){
				vo.setYjczfyStr(df2.format(temp.getYjczfy()));
			}
			return vo;
		}else{
			return null;
		}
	}
	/**
	 * 根据处理单id查询出该处理单的历次办理情况
	 * @param cldId 处理单id
	 */
	public List<CzCztzfaXx> findHistoryBlInfo(String cldId){
		return assetDealHeadBSImpl.findHistoryBlInfo(cldId);
	}
	
	/**
	 * 查找当前流程在项目受理中的部门和人员,返回到页面，在合规审查提交会议组织时用
	 * @param taskId
	 * @return
	 */
	public String findXmslDept(String taskId, String taskp){
		return this.assetDealHeadBSImpl.findXmslDept(taskId, taskp);
	}

	public String getCzfsJson() {
		List<Code> codeList = codeService.findAllByCodeType("ASSET_DISPOSE_METHOD");
		StringBuffer sb = new StringBuffer();
		for(Code code : codeList){
			if(!StringUtils.equals("全部", code.getCodeValue()))
				sb.append(code.getCodeKey()).append(":").append(code.getCodeValue()).append(";");
		}
		sb.deleteCharAt(sb.lastIndexOf(";"));
		return sb.toString();
	}

	public void saveBianHao(CztzfaXxVO disposeHead) {
		CzCztzfaXx head = this.findHeadById(disposeHead.getId());
		head.setBianhao(disposeHead.getBianhao());
		this.saveOrUpdateHead(head);
	}

	public void saveSlxh(CztzfaXxVO disposeHead) {
		CzCztzfaXx head = this.findHeadById(disposeHead.getId());
		head.setSlxh(disposeHead.getSlxh());
		head.setSbrq(disposeHead.getSbrq());
		this.saveOrUpdateHead(head);
	}
}
