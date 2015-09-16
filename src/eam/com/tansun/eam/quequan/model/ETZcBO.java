package com.tansun.eam.quequan.model;

import java.util.Date;

/**
 * ETZc entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ETZcBO implements java.io.Serializable {

	// Fields

	private Long tid;
	private Long zcbh;
	private Long zclx;
	private Long zcjyfl;
	private String zcmc;
	private Long zclb;
	private Long zcdq;
	private Long cfdd;
	private Long zjfs;
	private String yt;
	private String jbdw;
	private String zcxxdz;
	private Long zczc;
	private String glbm;
	private String sybm;
	private Date kssyrq;
	private String lrrq;
	private String lrr;

	// Constructors

	/** default constructor */
	public ETZcBO() {
	}

	/** minimal constructor */
	public ETZcBO(Long tid, Long zcbh) {
		this.tid = tid;
		this.zcbh = zcbh;
	}

	/** full constructor */
	public ETZcBO(Long tid, Long zcbh, Long zclx, Long zcjyfl, String zcmc,
			Long zclb, Long zcdq, Long cfdd, Long zjfs, String yt, String jbdw,
			String zcxxdz, Long zczc, String glbm, String sybm, Date kssyrq,
			String lrrq, String lrr) {
		this.tid = tid;
		this.zcbh = zcbh;
		this.zclx = zclx;
		this.zcjyfl = zcjyfl;
		this.zcmc = zcmc;
		this.zclb = zclb;
		this.zcdq = zcdq;
		this.cfdd = cfdd;
		this.zjfs = zjfs;
		this.yt = yt;
		this.jbdw = jbdw;
		this.zcxxdz = zcxxdz;
		this.zczc = zczc;
		this.glbm = glbm;
		this.sybm = sybm;
		this.kssyrq = kssyrq;
		this.lrrq = lrrq;
		this.lrr = lrr;
	}

	// Property accessors

	public Long getTid() {
		return this.tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}

	public Long getZcbh() {
		return this.zcbh;
	}

	public void setZcbh(Long zcbh) {
		this.zcbh = zcbh;
	}

	public Long getZclx() {
		return this.zclx;
	}

	public void setZclx(Long zclx) {
		this.zclx = zclx;
	}

	public Long getZcjyfl() {
		return this.zcjyfl;
	}

	public void setZcjyfl(Long zcjyfl) {
		this.zcjyfl = zcjyfl;
	}

	public String getZcmc() {
		return this.zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public Long getZclb() {
		return this.zclb;
	}

	public void setZclb(Long zclb) {
		this.zclb = zclb;
	}

	public Long getZcdq() {
		return this.zcdq;
	}

	public void setZcdq(Long zcdq) {
		this.zcdq = zcdq;
	}

	public Long getCfdd() {
		return this.cfdd;
	}

	public void setCfdd(Long cfdd) {
		this.cfdd = cfdd;
	}

	public Long getZjfs() {
		return this.zjfs;
	}

	public void setZjfs(Long zjfs) {
		this.zjfs = zjfs;
	}

	public String getYt() {
		return this.yt;
	}

	public void setYt(String yt) {
		this.yt = yt;
	}

	public String getJbdw() {
		return this.jbdw;
	}

	public void setJbdw(String jbdw) {
		this.jbdw = jbdw;
	}

	public String getZcxxdz() {
		return this.zcxxdz;
	}

	public void setZcxxdz(String zcxxdz) {
		this.zcxxdz = zcxxdz;
	}

	public Long getZczc() {
		return this.zczc;
	}

	public void setZczc(Long zczc) {
		this.zczc = zczc;
	}

	public String getGlbm() {
		return this.glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getSybm() {
		return this.sybm;
	}

	public void setSybm(String sybm) {
		this.sybm = sybm;
	}

	public Date getKssyrq() {
		return this.kssyrq;
	}

	public void setKssyrq(Date kssyrq) {
		this.kssyrq = kssyrq;
	}

	public String getLrrq() {
		return this.lrrq;
	}

	public void setLrrq(String lrrq) {
		this.lrrq = lrrq;
	}

	public String getLrr() {
		return this.lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

}