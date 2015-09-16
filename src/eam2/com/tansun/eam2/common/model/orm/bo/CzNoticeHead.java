package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CzNoticeHead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzNoticeHead extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -328050101346572042L;
	private String id;
	private String liuchengid;
	private String biaoti;
	private String chengson;
	private String bianhao;
	private String jhcd;
	private String nigaoren;
	private String nigaorenxm;
	private String ngbm;
	private String ngbmmc;
	private Date ngrq;
	private String lxdh;
	private Date fbrq;
	private String ggyxq;
	private String yyyxq;
	private String gglxr;
	private String gglxdh;
	private String gglxyj;
	private String jbdh;
	private String jbyj;
	private String jydxzg;
	private String jytj;
	private String zclybm;
	private String beizhu;
	private String lcmc;
	private String cldzt;
	private String hqbm;
	private String hqbmid;
	private String sfhcgg;

	// Constructors

	/** default constructor */
	public CzNoticeHead() {
	}

	/** full constructor */
	public CzNoticeHead(String liuchengid, String biaoti, String chengson,
			String bianhao, String jhcd, String nigaoren, String nigaorenxm,
			String ngbm, String ngbmmc, Date ngrq, String lxdh, Date fbrq,
			String ggyxq, String yyyxq, String gglxr, String gglxdh,
			String gglxyj, String jbdh, String jbyj, String jydxzg,
			String jytj, String zclybm, String beizhu, String lcmc,
			String cldzt, String hqbm, String hqbmid, String sfhcgg) {
		this.liuchengid = liuchengid;
		this.biaoti = biaoti;
		this.chengson = chengson;
		this.bianhao = bianhao;
		this.jhcd = jhcd;
		this.nigaoren = nigaoren;
		this.nigaorenxm = nigaorenxm;
		this.ngbm = ngbm;
		this.ngbmmc = ngbmmc;
		this.ngrq = ngrq;
		this.lxdh = lxdh;
		this.fbrq = fbrq;
		this.ggyxq = ggyxq;
		this.yyyxq = yyyxq;
		this.gglxr = gglxr;
		this.gglxdh = gglxdh;
		this.gglxyj = gglxyj;
		this.jbdh = jbdh;
		this.jbyj = jbyj;
		this.jydxzg = jydxzg;
		this.jytj = jytj;
		this.zclybm = zclybm;
		this.beizhu = beizhu;
		this.lcmc = lcmc;
		this.cldzt = cldzt;
		this.sfhcgg = sfhcgg;
		this.hqbm = hqbm;
		this.hqbmid = hqbmid;
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

	public String getChengson() {
		return this.chengson;
	}

	public void setChengson(String chengson) {
		this.chengson = chengson;
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

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public Date getFbrq() {
		return this.fbrq;
	}

	public void setFbrq(Date fbrq) {
		this.fbrq = fbrq;
	}

	public String getGgyxq() {
		return this.ggyxq;
	}

	public void setGgyxq(String ggyxq) {
		this.ggyxq = ggyxq;
	}

	public String getYyyxq() {
		return this.yyyxq;
	}

	public void setYyyxq(String yyyxq) {
		this.yyyxq = yyyxq;
	}

	public String getGglxr() {
		return this.gglxr;
	}

	public void setGglxr(String gglxr) {
		this.gglxr = gglxr;
	}

	public String getGglxdh() {
		return this.gglxdh;
	}

	public void setGglxdh(String gglxdh) {
		this.gglxdh = gglxdh;
	}

	public String getGglxyj() {
		return this.gglxyj;
	}

	public void setGglxyj(String gglxyj) {
		this.gglxyj = gglxyj;
	}

	public String getJbdh() {
		return this.jbdh;
	}

	public void setJbdh(String jbdh) {
		this.jbdh = jbdh;
	}

	public String getJbyj() {
		return this.jbyj;
	}

	public void setJbyj(String jbyj) {
		this.jbyj = jbyj;
	}

	public String getJydxzg() {
		return this.jydxzg;
	}

	public void setJydxzg(String jydxzg) {
		this.jydxzg = jydxzg;
	}

	public String getJytj() {
		return this.jytj;
	}

	public void setJytj(String jytj) {
		this.jytj = jytj;
	}

	public String getZclybm() {
		return this.zclybm;
	}

	public void setZclybm(String zclybm) {
		this.zclybm = zclybm;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getLcmc() {
		return this.lcmc;
	}

	public void setLcmc(String lcmc) {
		this.lcmc = lcmc;
	}

	public String getCldzt() {
		return this.cldzt;
	}

	public void setCldzt(String cldzt) {
		this.cldzt = cldzt;
	}

	public String getHqbm() {
		return hqbm;
	}

	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}

	public String getHqbmid() {
		return hqbmid;
	}

	public void setHqbmid(String hqbmid) {
		this.hqbmid = hqbmid;
	}

	public String getSfhcgg() {
		return sfhcgg;
	}

	public void setSfhcgg(String sfhcgg) {
		this.sfhcgg = sfhcgg;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}