package com.tansun.eam2.zccz.ucc.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IItemShBS;
import com.tansun.eam2.zccz.ucc.IItemShUCC;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.rdp4j.common.web.vo.CommonBO;

@Service
public class ItemShUCCImpl implements IItemShUCC{

	@Autowired
	private IItemShBS itemShBSImpl;
	
	public CzXmxxLsbVO findCzXmxxById(String id) {
		CzXmxxLsb czXmxxLsb = (CzXmxxLsb)this.itemShBSImpl.findById(CzXmxxLsb.class, id); 
		if(czXmxxLsb==null){
			czXmxxLsb = new CzXmxxLsb();
		}
		CzXmxxLsbVO czXmxxLsbVO = new CzXmxxLsbVO();
		czXmxxLsbVO.copyProperties(czXmxxLsb);
		return czXmxxLsbVO;
	}
	public void updateCzXmxxLsbById(String id){
		itemShBSImpl.updateCzXmxxLsbById(id);
	}
	public List<CzZcXx> findCzzcByCldId(String cldId) {
		return this.itemShBSImpl.findCzzcByCldId(cldId);
	}

	public void saveCzXmxxLsb(CzXmxxLsbVO czXmxxLsbVO) {  
		//保存项目的上会信息的同时需要先保存每个处置项目的审批委员
		itemShBSImpl.deleteYjByItemId(czXmxxLsbVO.getId());
		String[] spwyIds = null;
		String[] spwys = null;
		String spwyId = czXmxxLsbVO.getSpwyId();
		if(StringUtils.isNotEmpty(spwyId)){
			if(spwyId.startsWith(",")){
				spwyId = spwyId.substring(1);
			}
			spwyIds = spwyId.split(",");
		}
		if(czXmxxLsbVO.getSpwys() != null){
			spwys = czXmxxLsbVO.getSpwys().split(",");
		}
		if(spwyIds != null){
			for(int i = 0;i < spwyIds.length;i++){
				CzXmSpwYj czXmSpwYj = new CzXmSpwYj();
				czXmSpwYj.setXmId(czXmxxLsbVO.getId());
				czXmSpwYj.setSpwy(spwyIds[i]);
				czXmSpwYj.setSpwyxm(spwys[i]);
				czXmSpwYj.setSftjspyj(ZcczCommon.DEALTODO_TJYJ_FOU);
				czXmSpwYj.setTongyi(0l);
				czXmSpwYj.setButongyi(0l);
				czXmSpwYj.setSfwzcr(ZcczCommon.DEALTODO_SPWY);
				this.itemShBSImpl.save(czXmSpwYj);
			}
		}
		CzXmxxLsb czXmxxLsb = (CzXmxxLsb)this.itemShBSImpl.findById(CzXmxxLsb.class, czXmxxLsbVO.getId());
		//汇报人 汇报人编号
		czXmxxLsb.setHbr(czXmxxLsbVO.getHbr());
		czXmxxLsb.setHbrxm(czXmxxLsbVO.getHbrxm());
		//监察室列席人
		czXmxxLsb.setJcslxr(czXmxxLsbVO.getJcslxr());
		czXmxxLsb.setJcslxrxm(czXmxxLsbVO.getJcslxrxm());
		//意见汇总人
		czXmxxLsb.setYjhzr(czXmxxLsbVO.getYjhzr());
		czXmxxLsb.setYjhzrxm(czXmxxLsbVO.getYjhzrxm());
		czXmxxLsb.setYjhzrbmid(czXmxxLsbVO.getYjhzrbmid());
		czXmxxLsb.setYjhzrbmmc(czXmxxLsbVO.getYjhzrbmmc());
		
		this.itemShBSImpl.saveOrUpdate(czXmxxLsb);
	}

	public IItemShBS getItemShBSImpl() {
		return itemShBSImpl;
	}

	public void setItemShBSImpl(IItemShBS itemShBSImpl) {
		this.itemShBSImpl = itemShBSImpl;
	}

	public CzCztzfaXx findFaxxById(String id) {
		return (CzCztzfaXx)this.itemShBSImpl.findById(CzCztzfaXx.class, id);
	}

	public List<CzXmSpwYj> findYjByItemId(String id) {
		return this.itemShBSImpl.findYjByItemId(id);
	}

	public void saveSummarySugg(CzXmxxLsb czXmxxLsb) {
		this.itemShBSImpl.saveOrUpdate(czXmxxLsb);
	}

	public CzXmxxLsb findCzXmxxLsbById(String id) {
		return (CzXmxxLsb)this.itemShBSImpl.findById(CzXmxxLsb.class, id);
	}

	public String findItemIdByCldId(String cldId) {
		return this.itemShBSImpl.findItemIdByCldId(cldId);
	}

	public CommonBO getHeadByIdAndFeilei(String cldId, String feilei) {
		return itemShBSImpl.getHeadByIdAndFeilei(cldId, feilei);
	}

	public void updateScheadId(CzXmxxLsb czXmxxLsb) {
		if(StringUtils.equals("3", czXmxxLsb.getFenlei()) || StringUtils.equals("4", czXmxxLsb.getFenlei())){
			CzStcztz head = (CzStcztz)itemShBSImpl.findById(CzStcztz.class, czXmxxLsb.getCldId());
			if(head != null){
				head.setScfaxxid(head.getId());
				itemShBSImpl.update(head);
			}
		}else{
			CzCztzfaXx head = (CzCztzfaXx)itemShBSImpl.findById(CzCztzfaXx.class, czXmxxLsb.getCldId());
			if(head != null){
				head.setScczfaxxid(head.getId());
				itemShBSImpl.update(head);
			}
		}
	}

	public CzHyxx findHyxxById(String id) {
		CzHyxx hyxx = (CzHyxx)this.itemShBSImpl.findById(CzHyxx.class, id);
		return hyxx;
	}
	public int getTzwyCount() {
		return itemShBSImpl.getTzwyCount();
	}
}
