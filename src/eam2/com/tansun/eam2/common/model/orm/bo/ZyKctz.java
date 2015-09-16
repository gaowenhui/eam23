package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * ZyKctz entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ZyKctz extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	// Fields

	private String kctzId;
	private String zcId;
	private Date rq;
	private Double rksl;
	private Double cksl;
	private Double kcsl;
	private String lybmbm;
	private String lybmmc;
	private String jybmbm;
	private String jybmmc;
	private String lyrbh;
	private String lyrmc;
	private Date lyrq;
	private Date jydqrq;
	private String bdyy;
	private String djlx;
	private String djh;
	private Long sfzxjl;
	private Date ghsj;
	private String ghbh;
	private String tzzt;
	private String bz;
	private String sfxj;
	private Double wxfy;
	private Double jyts;
	private String ghrbmbm;
	private String ghrbmmc;
	private String ghrxm;
	private String ghrbm;

	// Constructors

	/** default constructor */
	public ZyKctz() {
	}

	/** full constructor */
	public ZyKctz(String zcId, Date rq, Double rksl, Double cksl, Double kcsl,
			String lybmbm, String lybmmc, String jybmbm, String jybmmc,
			String lyrbh, String lyrmc, Date lyrq, Date jydqrq, String bdyy,
			String djlx, String djh, Long sfzxjl, Date ghsj, String ghbh,
			String tzzt, String bz, String sfxj, Double wxfy, Double jyts,
			String ghrbmbm, String ghrbmmc, String ghrxm, String ghrbm) {
		this.zcId = zcId;
		this.rq = rq;
		this.rksl = rksl;
		this.cksl = cksl;
		this.kcsl = kcsl;
		this.lybmbm = lybmbm;
		this.lybmmc = lybmmc;
		this.jybmbm = jybmbm;
		this.jybmmc = jybmmc;
		this.lyrbh = lyrbh;
		this.lyrmc = lyrmc;
		this.lyrq = lyrq;
		this.jydqrq = jydqrq;
		this.bdyy = bdyy;
		this.djlx = djlx;
		this.djh = djh;
		this.sfzxjl = sfzxjl;
		this.ghsj = ghsj;
		this.ghbh = ghbh;
		this.tzzt = tzzt;
		this.bz = bz;
		this.sfxj = sfxj;
		this.wxfy = wxfy;
		this.jyts = jyts;
		this.ghrbmbm = ghrbmbm;
		this.ghrbmmc = ghrbmmc;
		this.ghrxm = ghrxm;
		this.ghrbm = ghrbm;
	}

	// Property accessors

	public String getKctzId() {
		return this.kctzId;
	}

	public void setKctzId(String kctzId) {
		this.kctzId = kctzId;
	}

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public Date getRq() {
		return this.rq;
	}

	public void setRq(Date rq) {
		this.rq = rq;
	}

	public Double getRksl() {
		return this.rksl;
	}

	public void setRksl(Double rksl) {
		this.rksl = rksl;
	}

	public Double getCksl() {
		return this.cksl;
	}

	public void setCksl(Double cksl) {
		this.cksl = cksl;
	}

	public Double getKcsl() {
		return this.kcsl;
	}

	public void setKcsl(Double kcsl) {
		this.kcsl = kcsl;
	}

	public String getLybmbm() {
		return this.lybmbm;
	}

	public void setLybmbm(String lybmbm) {
		this.lybmbm = lybmbm;
	}

	public String getLybmmc() {
		return this.lybmmc;
	}

	public void setLybmmc(String lybmmc) {
		this.lybmmc = lybmmc;
	}

	public String getJybmbm() {
		return this.jybmbm;
	}

	public void setJybmbm(String jybmbm) {
		this.jybmbm = jybmbm;
	}

	public String getJybmmc() {
		return this.jybmmc;
	}

	public void setJybmmc(String jybmmc) {
		this.jybmmc = jybmmc;
	}

	public String getLyrbh() {
		return this.lyrbh;
	}

	public void setLyrbh(String lyrbh) {
		this.lyrbh = lyrbh;
	}

	public String getLyrmc() {
		return this.lyrmc;
	}

	public void setLyrmc(String lyrmc) {
		this.lyrmc = lyrmc;
	}

	public Date getLyrq() {
		return this.lyrq;
	}

	public void setLyrq(Date lyrq) {
		this.lyrq = lyrq;
	}

	public Date getJydqrq() {
		return this.jydqrq;
	}

	public void setJydqrq(Date jydqrq) {
		this.jydqrq = jydqrq;
	}

	public String getBdyy() {
		return this.bdyy;
	}

	public void setBdyy(String bdyy) {
		this.bdyy = bdyy;
	}

	public String getDjlx() {
		return this.djlx;
	}

	public void setDjlx(String djlx) {
		this.djlx = djlx;
	}

	public String getDjh() {
		return this.djh;
	}

	public void setDjh(String djh) {
		this.djh = djh;
	}

	public Long getSfzxjl() {
		return this.sfzxjl;
	}

	public void setSfzxjl(Long sfzxjl) {
		this.sfzxjl = sfzxjl;
	}

	public Date getGhsj() {
		return this.ghsj;
	}

	public void setGhsj(Date ghsj) {
		this.ghsj = ghsj;
	}

	public String getGhbh() {
		return this.ghbh;
	}

	public void setGhbh(String ghbh) {
		this.ghbh = ghbh;
	}

	public String getTzzt() {
		return this.tzzt;
	}

	public void setTzzt(String tzzt) {
		this.tzzt = tzzt;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getSfxj() {
		return this.sfxj;
	}

	public void setSfxj(String sfxj) {
		this.sfxj = sfxj;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public Double getWxfy() {
		return wxfy;
	}

	public void setWxfy(Double wxfy) {
		this.wxfy = wxfy;
	}

	public String getGhrbmbm() {
		return ghrbmbm;
	}

	public void setGhrbmbm(String ghrbmbm) {
		this.ghrbmbm = ghrbmbm;
	}

	public String getGhrbmmc() {
		return ghrbmmc;
	}

	public void setGhrbmmc(String ghrbmmc) {
		this.ghrbmmc = ghrbmmc;
	}

	public String getGhrxm() {
		return ghrxm;
	}

	public void setGhrxm(String ghrxm) {
		this.ghrxm = ghrxm;
	}

	public String getGhrbm() {
		return ghrbm;
	}

	public void setGhrbm(String ghrbm) {
		this.ghrbm = ghrbm;
	}

	public Double getJyts() {
		return jyts;
	}

	public void setJyts(Double jyts) {
		this.jyts = jyts;
	}


}