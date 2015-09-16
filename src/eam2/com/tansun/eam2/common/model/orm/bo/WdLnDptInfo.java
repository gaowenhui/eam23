package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * WdLnDptInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class WdLnDptInfo extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String id;
	private String dkjgbm;
	private String dkjgmc;
	private String rymc;
	private String lxfs;
	private String lxnr;
	private Date lrrq;
	private String lrr;
	private String bz;

	// Constructors

	/** default constructor */
	public WdLnDptInfo() {
	}

	/** full constructor */
	public WdLnDptInfo(String dkjgbm, String dkjgmc, String rymc, String lxfs,
			String lxnr, Date lrrq, String lrr, String bz) {
		this.dkjgbm = dkjgbm;
		this.dkjgmc = dkjgmc;
		this.rymc = rymc;
		this.lxfs = lxfs;
		this.lxnr = lxnr;
		this.lrrq = lrrq;
		this.lrr = lrr;
		this.bz = bz;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDkjgbm() {
		return this.dkjgbm;
	}

	public void setDkjgbm(String dkjgbm) {
		this.dkjgbm = dkjgbm;
	}

	public String getDkjgmc() {
		return this.dkjgmc;
	}

	public void setDkjgmc(String dkjgmc) {
		this.dkjgmc = dkjgmc;
	}

	public String getRymc() {
		return this.rymc;
	}

	public void setRymc(String rymc) {
		this.rymc = rymc;
	}

	public String getLxfs() {
		return this.lxfs;
	}

	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}

	public String getLxnr() {
		return this.lxnr;
	}

	public void setLxnr(String lxnr) {
		this.lxnr = lxnr;
	}

	public Date getLrrq() {
		return this.lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}

	public String getLrr() {
		return this.lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}