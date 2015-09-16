package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CzXmjaHead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzXmjaHead extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = 4984515732204060620L;
	private String id;
	private String liuchengid;
	private String bianhao;
	private String biaoti;
	private String jhcd;
	private String ngbmmc;
	private String ngbm;
	private String nigaorenxm;
	private String nigaoren;
	private Date ngrq;
	private String lxdh;
	private String beizhu;
	private String chengson;
	private String lcmc;
	private String cldzt;
	private String hqbm;
	private String hqbmid;
	private String jaxmlx;

	// Constructors

	/** default constructor */
	public CzXmjaHead() {
	}

	/** full constructor */
	public CzXmjaHead(String liuchengid, String bianhao, String biaoti,
			String jhcd, String ngbmmc, String ngbm, String nigaorenxm,
			String nigaoren, Date ngrq, String lxdh, String beizhu,
			String chengson, String lcmc, String cldzt, String hqbm,
			String hqbmid,String jaxmlx) {
		this.liuchengid = liuchengid;
		this.bianhao = bianhao;
		this.biaoti = biaoti;
		this.jhcd = jhcd;
		this.ngbmmc = ngbmmc;
		this.ngbm = ngbm;
		this.nigaorenxm = nigaorenxm;
		this.nigaoren = nigaoren;
		this.ngrq = ngrq;
		this.lxdh = lxdh;
		this.beizhu = beizhu;
		this.chengson = chengson;
		this.lcmc = lcmc;
		this.cldzt = cldzt;
		this.hqbm = hqbm;
		this.hqbmid = hqbmid;
		this.jaxmlx = jaxmlx;
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

	public String getBianhao() {
		return this.bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getBiaoti() {
		return this.biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getJhcd() {
		return this.jhcd;
	}

	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}

	public String getNgbmmc() {
		return this.ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getNgbm() {
		return this.ngbm;
	}

	public void setNgbm(String ngbm) {
		this.ngbm = ngbm;
	}

	public String getNigaorenxm() {
		return this.nigaorenxm;
	}

	public void setNigaorenxm(String nigaorenxm) {
		this.nigaorenxm = nigaorenxm;
	}

	public String getNigaoren() {
		return this.nigaoren;
	}

	public void setNigaoren(String nigaoren) {
		this.nigaoren = nigaoren;
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

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getChengson() {
		return this.chengson;
	}

	public void setChengson(String chengson) {
		this.chengson = chengson;
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

	public String getJaxmlx() {
		return jaxmlx;
	}

	public void setJaxmlx(String jaxmlx) {
		this.jaxmlx = jaxmlx;
	}

}