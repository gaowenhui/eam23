package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * WtdkGlHead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class WtdkGlHead extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -6463742777886613010L;
	private String sheadId;
	private String sheetId;
	private String title;
	private String sheetType;
	private String jhcd;
	private Date ngrq;
	private String cs;
	private String ngrbh;
	private String ngrmc;
	private String ngbmbh;
	private String ngbmmc;
	private String lxdh;
	private String blsm;
	private String fjbt;
	private String ywlx;
	private String bdzt;
	private String hqbm;
	private String hqbmid;

	// Constructors

	/** default constructor */
	public WtdkGlHead() {
	}

	/** full constructor */
	public WtdkGlHead(String sheetId, String title, String sheetType,
			String jhcd, Date ngrq, String cs, String ngrbh, String ngrmc,
			String ngbmbh, String ngbmmc, String lxdh, String blsm,
			String fjbt, String ywlx, String bdzt, String hqbm, String hqbmid) {
		this.sheetId = sheetId;
		this.title = title;
		this.sheetType = sheetType;
		this.jhcd = jhcd;
		this.ngrq = ngrq;
		this.cs = cs;
		this.ngrbh = ngrbh;
		this.ngrmc = ngrmc;
		this.ngbmbh = ngbmbh;
		this.ngbmmc = ngbmmc;
		this.lxdh = lxdh;
		this.blsm = blsm;
		this.fjbt = fjbt;
		this.ywlx = ywlx;
		this.bdzt = bdzt;
		this.hqbm = hqbm;
		this.hqbmid = hqbmid;
	}

	// Property accessors

	public String getSheadId() {
		return this.sheadId;
	}

	public void setSheadId(String sheadId) {
		this.sheadId = sheadId;
	}

	public String getSheetId() {
		return this.sheetId;
	}

	public void setSheetId(String sheetId) {
		this.sheetId = sheetId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSheetType() {
		return this.sheetType;
	}

	public void setSheetType(String sheetType) {
		this.sheetType = sheetType;
	}

	public String getJhcd() {
		return this.jhcd;
	}

	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public String getCs() {
		return this.cs;
	}

	public void setCs(String cs) {
		this.cs = cs;
	}

	public String getNgrbh() {
		return this.ngrbh;
	}

	public void setNgrbh(String ngrbh) {
		this.ngrbh = ngrbh;
	}

	public String getNgrmc() {
		return this.ngrmc;
	}

	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}

	public String getNgbmbh() {
		return this.ngbmbh;
	}

	public void setNgbmbh(String ngbmbh) {
		this.ngbmbh = ngbmbh;
	}

	public String getNgbmmc() {
		return this.ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getBlsm() {
		return this.blsm;
	}

	public void setBlsm(String blsm) {
		this.blsm = blsm;
	}

	public String getFjbt() {
		return this.fjbt;
	}

	public void setFjbt(String fjbt) {
		this.fjbt = fjbt;
	}

	public String getYwlx() {
		return this.ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}

	public String getBdzt() {
		return this.bdzt;
	}

	public void setBdzt(String bdzt) {
		this.bdzt = bdzt;
	}

	public String getHqbm() {
		return this.hqbm;
	}

	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}

	public String getHqbmid() {
		return this.hqbmid;
	}

	public void setHqbmid(String hqbmid) {
		this.hqbmid = hqbmid;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}