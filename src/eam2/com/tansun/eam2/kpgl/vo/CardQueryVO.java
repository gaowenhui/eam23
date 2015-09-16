package com.tansun.eam2.kpgl.vo;

public class CardQueryVO implements java.io.Serializable{
	private static final long serialVersionUID = -2026664318110574826L;
	private String cardcode;        // 卡片编号
	private String zcname;          // 卡片名称
	private String kplx;			// 卡片类型
	private String ifjc;			// 是否继承
	private String glbm;			// 管理部门
	private String usepartment;		// 使用部门
	
	private String rzkm;			// 入帐科目
	private String state;			// 卡片状态
	private String firstbranch;		// 一级分行
	private String zcbh;			// 资产编号
	private String zcmc;			// 资产名称
	private String startLRTime;		// 从 录入时间
	
	private String endLRTime;		// 到 录入时间
	private String startQYTime;		// 从 启用时间
	private String endQYTime;		// 到 启用时间
	private String yxtlry;			// 录入人
	private String saveadsress;		// 存放地点
	private String sfzy;			// 是否自用

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getZcname() {
		return zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getKplx() {
		return kplx;
	}

	public void setKplx(String kplx) {
		this.kplx = kplx;
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

	public String getRzkm() {
		return rzkm;
	}

	public void setRzkm(String rzkm) {
		this.rzkm = rzkm;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getFirstbranch() {
		return firstbranch;
	}

	public void setFirstbranch(String firstbranch) {
		this.firstbranch = firstbranch;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getStartLRTime() {
		return startLRTime;
	}

	public void setStartLRTime(String startLRTime) {
		this.startLRTime = startLRTime;
	}

	public String getEndLRTime() {
		return endLRTime;
	}

	public void setEndLRTime(String endLRTime) {
		this.endLRTime = endLRTime;
	}

	public String getStartQYTime() {
		return startQYTime;
	}

	public void setStartQYTime(String startQYTime) {
		this.startQYTime = startQYTime;
	}

	public String getEndQYTime() {
		return endQYTime;
	}

	public void setEndQYTime(String endQYTime) {
		this.endQYTime = endQYTime;
	}

	public String getYxtlry() {
		return yxtlry;
	}

	public void setYxtlry(String yxtlry) {
		this.yxtlry = yxtlry;
	}

	public String getSaveadsress() {
		return saveadsress;
	}

	public void setSaveadsress(String saveadsress) {
		this.saveadsress = saveadsress;
	}

	public String getSfzy() {
		return sfzy;
	}

	public void setSfzy(String sfzy) {
		this.sfzy = sfzy;
	}

	public String getIfjc() {
		return ifjc;
	}

	public void setIfjc(String ifjc) {
		this.ifjc = ifjc;
	}
	
}
