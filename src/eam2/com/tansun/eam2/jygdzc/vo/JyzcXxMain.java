package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JyzcXxMain extends CommonBO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8002247176359584124L;
	//ID
	private String id; 
	//处理单ID
	private String cldId;
	public JyzcXxMain() {
		super();
	}
	//资产种类编码
	private String CZczlbm;
	//资产类型
	private String CZclx;
	//资产地区
	private String CZcdq;
	//资产编号
	private String zcbh;
	//资产名称
	private String zcmc;
	//经营分类
	private String CJyfl;
	//详细地址
	private String xxdz;
	//用途
	private String CYt;
	//经办单位
	private String jbdw;
	//增加方式
	private String CZjfs;
	//资产权属
	private String CZcqs;
	//委托人名称
	private String wtrmc;
	//权属情况
	private String qsqk;
	//周围环境
	private String zwhj;
	//资产状态
	private String CZczc;
	//开始使用日期
	private Date kssyrq;
	//二级地区
	private String ejdq;
	//一级委托机构
	private String CYjwtjg;
	
	private String yjwtgljgvalue;
	//二级委托机构
	private String CErwtjg;
	
	private String ejwtgljgvalue;
	//录入日期
	private Date lrrq;
	//录入人
	private String lrr;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCldId() {
		return cldId;
	}
	public void setCldId(String cldId) {
		this.cldId = cldId;
	}
	public String getCZczlbm() {
		return CZczlbm;
	}
	public void setCZczlbm(String zczlbm) {
		CZczlbm = zczlbm;
	}
	public String getCZclx() {
		return CZclx;
	}
	public void setCZclx(String zclx) {
		CZclx = zclx;
	}
	public String getCZcdq() {
		return CZcdq;
	}
	public void setCZcdq(String zcdq) {
		CZcdq = zcdq;
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
	public String getCJyfl() {
		return CJyfl;
	}
	public void setCJyfl(String jyfl) {
		CJyfl = jyfl;
	}
	public String getXxdz() {
		return xxdz;
	}
	public void setXxdz(String xxdz) {
		this.xxdz = xxdz;
	}
	public String getCYt() {
		return CYt;
	}
	public void setCYt(String yt) {
		CYt = yt;
	}
	public String getJbdw() {
		return jbdw;
	}
	public void setJbdw(String jbdw) {
		this.jbdw = jbdw;
	}
	public String getCZjfs() {
		return CZjfs;
	}
	public void setCZjfs(String zjfs) {
		CZjfs = zjfs;
	}
	public String getQsqk() {
		return qsqk;
	}
	public void setQsqk(String qsqk) {
		this.qsqk = qsqk;
	}
	public String getZwhj() {
		return zwhj;
	}
	public void setZwhj(String zwhj) {
		this.zwhj = zwhj;
	}
	public String getCZczc() {
		return CZczc;
	}
	public void setCZczc(String zczc) {
		CZczc = zczc;
	}
	public Date getKssyrq() {
		return kssyrq;
	}
	public void setKssyrq(Date kssyrq) {
		this.kssyrq = kssyrq;
	}
	public String getEjdq() {
		return ejdq;
	}
	public void setEjdq(String ejdq) {
		this.ejdq = ejdq;
	}
	public String getCYjwtjg() {
		return CYjwtjg;
	}
	public void setCYjwtjg(String yjwtjg) {
		CYjwtjg = yjwtjg;
	}
	public String getCErwtjg() {
		return CErwtjg;
	}
	public void setCErwtjg(String erwtjg) {
		CErwtjg = erwtjg;
	}
	public Date getLrrq() {
		return lrrq;
	}
	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}
	public String getLrr() {
		return lrr;
	}
	public void setLrr(String lrr) {
		this.lrr = lrr;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getYjwtgljgvalue() {
		return yjwtgljgvalue;
	}
	public void setYjwtgljgvalue(String yjwtgljgvalue) {
		this.yjwtgljgvalue = yjwtgljgvalue;
	}
	public String getEjwtgljgvalue() {
		return ejwtgljgvalue;
	}
	public void setEjwtgljgvalue(String ejwtgljgvalue) {
		this.ejwtgljgvalue = ejwtgljgvalue;
	}
	public String getCZcqs() {
		return CZcqs;
	}
	public void setCZcqs(String zcqs) {
		CZcqs = zcqs;
	}
	public String getWtrmc() {
		return wtrmc;
	}
	public void setWtrmc(String wtrmc) {
		this.wtrmc = wtrmc;
	}

}
