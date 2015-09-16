package com.tansun.eam.quequan.model;

import java.util.Date;

/**
 * ETLcYj entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ETLcYjBO  extends com.tansun.rdp4j.common.web.vo.CommonBO implements
java.io.Serializable {

	// Fields

	private Long tid;
	private Date yjtjsj; 
	private String yjtjr;
	private String yjmc;
	private String yjnr;
	private Long cldbh;
	private Long deptId;
	private String yjlx;
	private String hj;
	private Long flcbh;
	private String zzyj;
	private String mkmc;

	// Constructors

	/** default constructor */
	public ETLcYjBO() {
	}

	/** minimal constructor */
	public ETLcYjBO(Long tid, Long deptId, Long flcbh) {
		this.tid = tid;
		this.deptId = deptId;
		this.flcbh = flcbh;
	}

	/** full constructor */
	public ETLcYjBO(Long tid, Date yjtjsj, String yjtjr, String yjmc,
			String yjnr, Long cldbh, Long deptId, String yjlx, String hj,
			Long flcbh, String zzyj, String mkmc) {
		this.tid = tid;
		this.yjtjsj = yjtjsj;
		this.yjtjr = yjtjr;
		this.yjmc = yjmc;
		this.yjnr = yjnr;
		this.cldbh = cldbh;
		this.deptId = deptId;
		this.yjlx = yjlx;
		this.hj = hj;
		this.flcbh = flcbh;
		this.zzyj = zzyj;
		this.mkmc = mkmc;
	}

	// Property accessors

	public Long getTid() {
		return this.tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}

	public Date getYjtjsj() {
		return this.yjtjsj;
	}

	public void setYjtjsj(Date yjtjsj) {
		this.yjtjsj = yjtjsj;
	}

	public String getYjtjr() {
		return this.yjtjr;
	}

	public void setYjtjr(String yjtjr) {
		this.yjtjr = yjtjr;
	}

	public String getYjmc() {
		return this.yjmc;
	}

	public void setYjmc(String yjmc) {
		this.yjmc = yjmc;
	}

	public String getYjnr() {
		return this.yjnr;
	}

	public void setYjnr(String yjnr) {
		this.yjnr = yjnr;
	}

	public Long getCldbh() {
		return this.cldbh;
	}

	public void setCldbh(Long cldbh) {
		this.cldbh = cldbh;
	}

	public Long getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public String getYjlx() {
		return this.yjlx;
	}

	public void setYjlx(String yjlx) {
		this.yjlx = yjlx;
	}

	public String getHj() {
		return this.hj;
	}

	public void setHj(String hj) {
		this.hj = hj;
	}

	public Long getFlcbh() {
		return this.flcbh;
	}

	public void setFlcbh(Long flcbh) {
		this.flcbh = flcbh;
	}

	public String getZzyj() {
		return this.zzyj;
	}

	public void setZzyj(String zzyj) {
		this.zzyj = zzyj;
	}

	public String getMkmc() {
		return this.mkmc;
	}

	public void setMkmc(String mkmc) {
		this.mkmc = mkmc;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}