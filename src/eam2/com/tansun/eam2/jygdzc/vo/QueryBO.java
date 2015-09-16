package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class QueryBO  extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 361377564511273127L;
	// 资产编码
	private String zcbh;
	// 资产名称
	private String zcmc;
	// 资产类型
	private String zclx;
	// 资产状态
	private String zczt;
	// 地区
	private String dq;
	// 经营分类
	private String jyfl;
	//卡片编号
	private String cardcode;
	//卡片名称
	private String zcname;
	//卡片类型
	private Long parentid;
	// 管理部门
	private String glbm;
	// 使用部门
	private String sybm;
	// 当前租赁状态
	private String zlzt;
	// 二级地区
	private String ejdq;
	// 一级委托管理机构
	private String yjwtgljg;
	// 二级委托管理机构
	private String ejwtgljg;
//	==============这两是zccz用的参数,别人不要用================
	//权属
	private String quanshu;
	//分类
	private String fenlei;
//================这两是zccz用的参数,别人不要用=================	
	public String getQuanshu() {
		return quanshu;
	}
	public void setQuanshu(String quanshu) {
		this.quanshu = quanshu;
	}
	public String getFenlei() {
		return fenlei;
	}
	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
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
	public String getZclx() {
		return zclx;
	}
	public void setZclx(String zclx) {
		this.zclx = zclx;
	}
	public String getZczt() {
		return zczt;
	}
	public void setZczt(String zczt) {
		this.zczt = zczt;
	}
	public String getDq() {
		return dq;
	}
	public void setDq(String dq) {
		this.dq = dq;
	}
	public String getJyfl() {
		return jyfl;
	}
	public void setJyfl(String jyfl) {
		this.jyfl = jyfl;
	}
	public String getGlbm() {
		return glbm;
	}
	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}
	public String getSybm() {
		return sybm;
	}
	public void setSybm(String sybm) {
		this.sybm = sybm;
	}
	public String getZlzt() {
		return zlzt;
	}
	public void setZlzt(String zlzt) {
		this.zlzt = zlzt;
	}
	public String getEjdq() {
		return ejdq;
	}
	public void setEjdq(String ejdq) {
		this.ejdq = ejdq;
	}
	public String getYjwtgljg() {
		return yjwtgljg;
	}
	public void setYjwtgljg(String yjwtgljg) {
		this.yjwtgljg = yjwtgljg;
	}
	public String getEjwtgljg() {
		return ejwtgljg;
	}
	public void setEjwtgljg(String ejwtgljg) {
		this.ejwtgljg = ejwtgljg;
	}
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
	public Long getParentid() {
		return parentid;
	}
	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
