package com.tansun.eam2.zccz.vo;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;

public class CzXmxxLsbVO extends CzXmxxLsb {

	private static final long serialVersionUID = 1465548633981533519L;
	private String spwy;		//审批委员
	private String xmfsr;      //处置项目发送人

	private Date   spsj; 		//审批时间
	private String CSpfs; 		//审批方式
	private String hycs; 		//会议次数
	private String spzcr; 		//审批主持人
	private String spzcrId;		//审批主持人id
	private String spwyId;		//审批委员id
	private String sftjspyj;	//是否提交审批意见
	private String spwys;		//审批委员们，以逗号间隔
	private String wtjyjwys;	//未提交意见的委员们，以逗号间隔
	private String wtjyjwyIds;	//未提交意见的委员们，以逗号间隔
	
	private Long agreeCount;     //同意票数
	private Long disagreeCount;  //不同意票数
	
	public Long getAgreeCount() {
		return agreeCount;
	}

	public void setAgreeCount(Long agreeCount) {
		this.agreeCount = agreeCount;
	}

	public Long getDisagreeCount() {
		return disagreeCount;
	}

	public void setDisagreeCount(Long disagreeCount) {
		this.disagreeCount = disagreeCount;
	}

	public String getSpzcrId() {
		return spzcrId;
	}

	public void setSpzcrId(String spzcrId) {
		this.spzcrId = spzcrId;
	}

	public String getSpwyId() {
		return spwyId;
	}

	public void setSpwyId(String spwyId) {
		this.spwyId = spwyId;
	}

	public Date getSpsj() {
		return spsj;
	}

	public void setSpsj(Date spsj) {
		this.spsj = spsj;
	}

	public String getCSpfs() {
		return CSpfs;
	}

	public void setCSpfs(String spfs) {
		CSpfs = spfs;
	}

	public String getHycs() {
		return hycs;
	}

	public void setHycs(String hycs) {
		this.hycs = hycs;
	}

	public String getSpzcr() {
		return spzcr;
	}

	public void setSpzcr(String spzcr) {
		this.spzcr = spzcr;
	}

	public String getSpwy() {
		return spwy;
	}

	public void setSpwy(String spwy) {
		this.spwy = spwy;
	}
	
	public void copyProperties(CzXmxxLsb orig){
		try {
			BeanUtils.copyProperties(this, orig);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	public String getSftjspyj() {
		return sftjspyj;
	}

	public void setSftjspyj(String sftjspyj) {
		this.sftjspyj = sftjspyj;
	}

	public String getSpwys() {
		return spwys;
	}

	public void setSpwys(String spwys) {
		this.spwys = spwys;
	}

	public String getWtjyjwys() {
		return wtjyjwys;
	}

	public void setWtjyjwys(String wtjyjwys) {
		this.wtjyjwys = wtjyjwys;
	}

	public String getWtjyjwyIds() {
		return wtjyjwyIds;
	}

	public void setWtjyjwyIds(String wtjyjwyIds) {
		this.wtjyjwyIds = wtjyjwyIds;
	}

	public String getXmfsr() {
		return xmfsr;
	}

	public void setXmfsr(String xmfsr) {
		this.xmfsr = xmfsr;
	}
}
