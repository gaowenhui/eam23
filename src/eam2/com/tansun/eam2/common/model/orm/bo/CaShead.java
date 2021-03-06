package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * CaShead generated by MyEclipse Persistence Tools
 */

public class CaShead extends CommonBO implements java.io.Serializable {

	// Fields

	private Long id;
	private String strId;
	private String biaoti;
	private String bianhao;
	private String jhcd;
	private Long ngr;
	private String lxdh;
	private Date ngrq;
	private Long ngbm;
	private String ngbmmc;
	private String zjfs;
	private String zykpxz;
	private String kpblsm;
	private String erpcljg;
	private String bz;
	private String bdlx;
	private String ngrmc;
	private String wfconfigCode;
	private String senderp;
	private String erpnotice;
	private String isrejected;

	// Constructors

	/** default constructor */
	public CaShead() {
	}

	/** full constructor */
	public CaShead(String biaoti, String bianhao, String jhcd, Long ngr,
			String lxdh, Date ngrq, Long ngbm, String ngbmmc, String zjfs,
			String zykpxz, String kpblsm, String erpcljg, String bz,
			String bdlx, String ngrmc, String wfconfigCode, String senderp,
			String erpnotice, String isrejected) {
		this.biaoti = biaoti;
		this.bianhao = bianhao;
		this.jhcd = jhcd;
		this.ngr = ngr;
		this.lxdh = lxdh;
		this.ngrq = ngrq;
		this.ngbm = ngbm;
		this.ngbmmc = ngbmmc;
		this.zjfs = zjfs;
		this.zykpxz = zykpxz;
		this.kpblsm = kpblsm;
		this.erpcljg = erpcljg;
		this.bz = bz;
		this.bdlx = bdlx;
		this.ngrmc = ngrmc;
		this.wfconfigCode = wfconfigCode;
		this.senderp = senderp;
		this.erpnotice = erpnotice;
		this.isrejected = isrejected;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStrId() {
		return this.id.toString();
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

	public Long getNgr() {
		return this.ngr;
	}

	public void setNgr(Long ngr) {
		this.ngr = ngr;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public Long getNgbm() {
		return this.ngbm;
	}

	public void setNgbm(Long ngbm) {
		this.ngbm = ngbm;
	}

	public String getNgbmmc() {
		return this.ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getZjfs() {
		return this.zjfs;
	}

	public void setZjfs(String zjfs) {
		this.zjfs = zjfs;
	}

	public String getZykpxz() {
		return this.zykpxz;
	}

	public void setZykpxz(String zykpxz) {
		this.zykpxz = zykpxz;
	}

	public String getKpblsm() {
		return this.kpblsm;
	}

	public void setKpblsm(String kpblsm) {
		this.kpblsm = kpblsm;
	}

	public String getErpcljg() {
		return this.erpcljg;
	}

	public void setErpcljg(String erpcljg) {
		this.erpcljg = erpcljg;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getBdlx() {
		return this.bdlx;
	}

	public void setBdlx(String bdlx) {
		this.bdlx = bdlx;
	}

	public String getNgrmc() {
		return this.ngrmc;
	}

	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}

	public String getWfconfigCode() {
		return this.wfconfigCode;
	}

	public void setWfconfigCode(String wfconfigCode) {
		this.wfconfigCode = wfconfigCode;
	}

	public String getSenderp() {
		return this.senderp;
	}

	public void setSenderp(String senderp) {
		this.senderp = senderp;
	}

	public String getErpnotice() {
		return this.erpnotice;
	}

	public void setErpnotice(String erpnotice) {
		this.erpnotice = erpnotice;
	}

	public String getIsrejected() {
		return this.isrejected;
	}

	public void setIsrejected(String isrejected) {
		this.isrejected = isrejected;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}