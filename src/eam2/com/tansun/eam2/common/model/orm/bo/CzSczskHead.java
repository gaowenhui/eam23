package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CzSczskHead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzSczskHead extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String id;
	private String liuchengid;
	private String biaoti;
	private String bianhao;
	private String jhcd;
	private String nigaoren;
	private String nigaorenxm;
	private String ngbm;
	private String ngbmmc;
	private String lxdh;
	private String blbm;
	private String blbmbh;
	private Date ngrq;
	private String sprid;
	private String sprmc;
	private Date sprq;
	private String bdzt;
	private String sheettype;

	// Constructors

	/** default constructor */
	public CzSczskHead() {
	}

	/** full constructor */
	public CzSczskHead(String liuchengid, String biaoti, String bianhao,
			String jhcd, String nigaoren, String nigaorenxm, String ngbm,
			String ngbmmc, String lxdh, String blbm, String blbmbh, Date ngrq,
			String sprid, String sprmc, Date sprq, String bdzt, String sheettype) {
		this.liuchengid = liuchengid;
		this.biaoti = biaoti;
		this.bianhao = bianhao;
		this.jhcd = jhcd;
		this.nigaoren = nigaoren;
		this.nigaorenxm = nigaorenxm;
		this.ngbm = ngbm;
		this.ngbmmc = ngbmmc;
		this.lxdh = lxdh;
		this.blbm = blbm;
		this.blbmbh = blbmbh;
		this.ngrq = ngrq;
		this.sprid = sprid;
		this.sprmc = sprmc;
		this.sprq = sprq;
		this.bdzt = bdzt;
		this.sheettype = sheettype;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLiuchengid() {
		return this.liuchengid;
	}

	public void setLiuchengid(String liuchengid) {
		this.liuchengid = liuchengid;
	}

	public String getBiaoti() {
		return this.biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getBianhao() {
		return this.bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getJhcd() {
		return this.jhcd;
	}

	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}

	public String getNigaoren() {
		return this.nigaoren;
	}

	public void setNigaoren(String nigaoren) {
		this.nigaoren = nigaoren;
	}

	public String getNigaorenxm() {
		return this.nigaorenxm;
	}

	public void setNigaorenxm(String nigaorenxm) {
		this.nigaorenxm = nigaorenxm;
	}

	public String getNgbm() {
		return this.ngbm;
	}

	public void setNgbm(String ngbm) {
		this.ngbm = ngbm;
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

	public String getBlbm() {
		return this.blbm;
	}

	public void setBlbm(String blbm) {
		this.blbm = blbm;
	}

	public String getBlbmbh() {
		return this.blbmbh;
	}

	public void setBlbmbh(String blbmbh) {
		this.blbmbh = blbmbh;
	}

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public String getSprid() {
		return this.sprid;
	}

	public void setSprid(String sprid) {
		this.sprid = sprid;
	}

	public String getSprmc() {
		return this.sprmc;
	}

	public void setSprmc(String sprmc) {
		this.sprmc = sprmc;
	}

	public Date getSprq() {
		return this.sprq;
	}

	public void setSprq(Date sprq) {
		this.sprq = sprq;
	}

	public String getBdzt() {
		return this.bdzt;
	}

	public void setBdzt(String bdzt) {
		this.bdzt = bdzt;
	}

	public String getSheettype() {
		return this.sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}