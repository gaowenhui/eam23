package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class QueryVO extends CommonBO{

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
	private String kpbh;
	//卡片名称
	private String kpmc;
	//卡片类型
	private String kplx;
	//租赁状态
	private String zlzt;
	//二级地区
	private String ejdq;
	// 以及委托管理机构
	private String yjwtgljg;
	//二级委托管理机构
	private String ejwtgljg;
	
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
	public String getKpbh() {
		return kpbh;
	}
	public void setKpbh(String kpbh) {
		this.kpbh = kpbh;
	}
	public String getKpmc() {
		return kpmc;
	}
	public void setKpmc(String kpmc) {
		this.kpmc = kpmc;
	}
	public String getKplx() {
		return kplx;
	}
	public void setKplx(String kplx) {
		this.kplx = kplx;
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
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
