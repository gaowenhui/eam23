package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * BizBackCashInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class BizBackCashInfo extends CommonBO implements java.io.Serializable {

	// Fields

	private String id;
	private String biaoti;
	private String blbm;
	private String bianhao;
	private String jhcd;
	private String ngrbh;
	private String ngrmc;
	private Date ngrq;
	private String ngbmbh;
	private String ngbmmc;
	private String lxdh;
	private String hkdbh;
	private String hkr;
	private Date dzrq;
	private String jzdh;
	private Double dzje;
	private String zjly;
	private String beizhu;
	private String hkdzt;
	private String bz1;
	private String qrbmbh;
	private String qrbmmc;
	private String ywlx;
	private String hkqrdh;
	private Date hqywqrsj;
	private String bz2;
	private String blbmbh;
	private String lcmc;

	// Constructors

	/** default constructor */
	public BizBackCashInfo() {
	}

	/** minimal constructor */
	public BizBackCashInfo(String id) {
		this.id = id;
	}

	/** full constructor */
	public BizBackCashInfo(String id, String biaoti, String blbm,
			String bianhao, String jhcd, String ngrbh, String ngrmc, Date ngrq,
			String ngbmbh, String ngbmmc, String lxdh, String hkdbh,
			String hkr, Date dzrq, String jzdh, Double dzje, String zjly,
			String beizhu, String hkdzt, String bz1, String qrbmbh,
			String qrbmmc, String ywlx, String hkqrdh, Date hqywqrsj,
			String bz2, String blbmbh, String lcmc) {
		this.id = id;
		this.biaoti = biaoti;
		this.blbm = blbm;
		this.bianhao = bianhao;
		this.jhcd = jhcd;
		this.ngrbh = ngrbh;
		this.ngrmc = ngrmc;
		this.ngrq = ngrq;
		this.ngbmbh = ngbmbh;
		this.ngbmmc = ngbmmc;
		this.lxdh = lxdh;
		this.hkdbh = hkdbh;
		this.hkr = hkr;
		this.dzrq = dzrq;
		this.jzdh = jzdh;
		this.dzje = dzje;
		this.zjly = zjly;
		this.beizhu = beizhu;
		this.hkdzt = hkdzt;
		this.bz1 = bz1;
		this.qrbmbh = qrbmbh;
		this.qrbmmc = qrbmmc;
		this.ywlx = ywlx;
		this.hkqrdh = hkqrdh;
		this.hqywqrsj = hqywqrsj;
		this.bz2 = bz2;
		this.blbmbh = blbmbh;
		this.lcmc = lcmc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBiaoti() {
		return this.biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getBlbm() {
		return this.blbm;
	}

	public void setBlbm(String blbm) {
		this.blbm = blbm;
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

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
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

	public String getHkdbh() {
		return this.hkdbh;
	}

	public void setHkdbh(String hkdbh) {
		this.hkdbh = hkdbh;
	}

	public String getHkr() {
		return this.hkr;
	}

	public void setHkr(String hkr) {
		this.hkr = hkr;
	}

	public Date getDzrq() {
		return this.dzrq;
	}

	public void setDzrq(Date dzrq) {
		this.dzrq = dzrq;
	}

	public String getJzdh() {
		return this.jzdh;
	}

	public void setJzdh(String jzdh) {
		this.jzdh = jzdh;
	}

	public Double getDzje() {
		return this.dzje;
	}

	public void setDzje(Double dzje) {
		this.dzje = dzje;
	}

	public String getZjly() {
		return this.zjly;
	}

	public void setZjly(String zjly) {
		this.zjly = zjly;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getHkdzt() {
		return this.hkdzt;
	}

	public void setHkdzt(String hkdzt) {
		this.hkdzt = hkdzt;
	}

	public String getBz1() {
		return this.bz1;
	}

	public void setBz1(String bz1) {
		this.bz1 = bz1;
	}

	public String getQrbmbh() {
		return this.qrbmbh;
	}

	public void setQrbmbh(String qrbmbh) {
		this.qrbmbh = qrbmbh;
	}

	public String getQrbmmc() {
		return this.qrbmmc;
	}

	public void setQrbmmc(String qrbmmc) {
		this.qrbmmc = qrbmmc;
	}

	public String getYwlx() {
		return this.ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}

	public String getHkqrdh() {
		return this.hkqrdh;
	}

	public void setHkqrdh(String hkqrdh) {
		this.hkqrdh = hkqrdh;
	}

	public Date getHqywqrsj() {
		return this.hqywqrsj;
	}

	public void setHqywqrsj(Date hqywqrsj) {
		this.hqywqrsj = hqywqrsj;
	}

	public String getBz2() {
		return this.bz2;
	}

	public void setBz2(String bz2) {
		this.bz2 = bz2;
	}

	public String getBlbmbh() {
		return this.blbmbh;
	}

	public void setBlbmbh(String blbmbh) {
		this.blbmbh = blbmbh;
	}

	public String getLcmc() {
		return lcmc;
	}

	public void setLcmc(String lcmc) {
		this.lcmc = lcmc;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}