package com.tansun.eam2.kpgl.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class BodyListVO extends CommonBO {

	private String id; // bodyId
	private String zcname; // 卡片名称
	private String cardcode; // 卡片编号
	private String parentid; // 卡片类型
	private String glbm; // 管理部门
	private String usepartment; // 使用部门
	private String addtype; // 增加方式
	private String zjtype; // 折旧方式
	private String changeway; // 变动方式
	private String dealmethod; // 减少方式
	private String changereason; // 变动原因（减少原因）
	private String saveadsress; // 存放地点
	private String zcmc; // 资产名称
	private String zcbh; // 资产编号
	private String oldcardid; // 旧卡片编号
	private String sfzy; // 是否自用

	private Double ybyz; // 原币原值
	private Double ljzj; // 累计折旧
	private Double bcjt; // 本次计提
	private Double beforejt; // 本次计提前准备
	private Double afterjt; // 本次计提后准备

	private Double beforeyz; // 变动前原值
	private Double afteryz; // 变动后原值
	private Double changeyz; // 原值变动
	private String beforeValue;
	private String afterValue;
	private String zcId;
	
	
	private Double szbl; // 所占比例
	private String beforebh; // 调配前资产编号
	private String beforemc; // 调配前资产名称
	private String afterbh; // 调配后资产编号
	private String aftermc; // 调配后资产名称

	private String wpbh;//物品编号
	private String fl;//分类
	private String wpmc;//物品名称
	private String ppggxh;//品牌/规格型号
	
	private String bdrq; //变动时间
	private String lrr;//录入人
	
	public String getLrr() {
		return lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public String getBdrq() {
		return bdrq;
	}

	public void setBdrq(String bdrq) {
		this.bdrq = bdrq;
	}

	public String getWpbh() {
		return wpbh;
	}

	public void setWpbh(String wpbh) {
		this.wpbh = wpbh;
	}

	public String getFl() {
		return fl;
	}

	public void setFl(String fl) {
		this.fl = fl;
	}

	public String getWpmc() {
		return wpmc;
	}

	public void setWpmc(String wpmc) {
		this.wpmc = wpmc;
	}

	public String getPpggxh() {
		return ppggxh;
	}

	public void setPpggxh(String ppggxh) {
		this.ppggxh = ppggxh;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getZcname() {
		return zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getUsepartment() {
		return usepartment;
	}

	public void setUsepartment(String usepartment) {
		this.usepartment = usepartment;
	}

	public String getAddtype() {
		return addtype;
	}

	public void setAddtype(String addtype) {
		this.addtype = addtype;
	}

	public String getZjtype() {
		return zjtype;
	}

	public void setZjtype(String zjtype) {
		this.zjtype = zjtype;
	}

	public String getChangeway() {
		return changeway;
	}

	public void setChangeway(String changeway) {
		this.changeway = changeway;
	}

	public String getDealmethod() {
		return dealmethod;
	}

	public void setDealmethod(String dealmethod) {
		this.dealmethod = dealmethod;
	}

	public String getChangereason() {
		return changereason;
	}

	public void setChangereason(String changereason) {
		this.changereason = changereason;
	}

	public String getSaveadsress() {
		return saveadsress;
	}

	public void setSaveadsress(String saveadsress) {
		this.saveadsress = saveadsress;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getOldcardid() {
		return oldcardid;
	}

	public void setOldcardid(String oldcardid) {
		this.oldcardid = oldcardid;
	}

	public Double getYbyz() {
		return ybyz;
	}

	public void setYbyz(Double ybyz) {
		this.ybyz = ybyz;
	}

	public Double getLjzj() {
		return ljzj;
	}

	public void setLjzj(Double ljzj) {
		this.ljzj = ljzj;
	}

	public Double getBcjt() {
		return bcjt;
	}

	public void setBcjt(Double bcjt) {
		this.bcjt = bcjt;
	}

	public Double getBeforejt() {
		return beforejt;
	}

	public void setBeforejt(Double beforejt) {
		this.beforejt = beforejt;
	}

	public Double getAfterjt() {
		return afterjt;
	}

	public void setAfterjt(Double afterjt) {
		this.afterjt = afterjt;
	}

	public Double getBeforeyz() {
		return beforeyz;
	}

	public void setBeforeyz(Double beforeyz) {
		this.beforeyz = beforeyz;
	}

	public Double getAfteryz() {
		return afteryz;
	}

	public void setAfteryz(Double afteryz) {
		this.afteryz = afteryz;
	}

	public Double getChangeyz() {
		return changeyz;
	}

	public void setChangeyz(Double changeyz) {
		this.changeyz = changeyz;
	}

	public Double getSzbl() {
		return szbl;
	}

	public void setSzbl(Double szbl) {
		this.szbl = szbl;
	}

	public String getBeforebh() {
		return beforebh;
	}

	public void setBeforebh(String beforebh) {
		this.beforebh = beforebh;
	}

	public String getBeforemc() {
		return beforemc;
	}

	public void setBeforemc(String beforemc) {
		this.beforemc = beforemc;
	}

	public String getAfterbh() {
		return afterbh;
	}

	public void setAfterbh(String afterbh) {
		this.afterbh = afterbh;
	}

	public String getAftermc() {
		return aftermc;
	}

	public void setAftermc(String aftermc) {
		this.aftermc = aftermc;
	}
	
	public String getSfzy() {
		return sfzy;
	}

	public void setSfzy(String sfzy) {
		this.sfzy = sfzy;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getBeforeValue() {
		return beforeValue;
	}

	public void setBeforeValue(String beforeValue) {
		this.beforeValue = beforeValue;
	}

	public String getAfterValue() {
		return afterValue;
	}

	public void setAfterValue(String afterValue) {
		this.afterValue = afterValue;
	}

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

}
