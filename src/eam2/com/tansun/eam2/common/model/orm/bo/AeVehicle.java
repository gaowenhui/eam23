package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * AeVehicle entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AeVehicle  extends com.tansun.rdp4j.common.web.vo.CommonBO  implements java.io.Serializable {

	// Fields

	private String id;
	private Date lrsj;
	private String zcId;
	private String kpbh;
	private Long shuliang;
	private String sfzc;
	private String sfxz;
	private String sftt;
	private String sfdbf;
	private String jhzy;
	private String qtdsfzy;
	private String wczy;
	private String xssyz;
	private String xssyzdz;
	private String wczyqksm;
	private String sfpy;
	private String pyyy;
	private String sfpk;
	private String pkyy;
	private String sftybs;
	private String tybsyy;
	private String sfycz;
	private String zyrfddz;
	private String sfyzlht;
	private String zlhtxh;
	private Date zlhtqsrq;
	private Long zlq;
	private Double yzjjg;
	private String czsj;
	private Double yuanzhi;
	private Double jinge;
	private String czht;
	private String htbh;
	private Double czsr;
	private Double czfy;
	private Double czsy;
	private String czhsfjsrz;
	private String wrzyy;
	private String sfjf;
	private String sfdy;
	private String sfss;
	private String qijian;
	private String jine;
	private String gzrq;
	private String qyrq;
	private String yxslc;
	private Double zmyz;
	private Double zmjz;
	private Double jzzb;
	private Double zmje;
	private String zcgljy;
	private String beizhu;

	// Constructors

	/** default constructor */
	public AeVehicle() {
	}

	/** full constructor */
	public AeVehicle(Date lrsj, String zcId, String kpbh, Long shuliang,
			String sfzc, String sfxz, String sftt, String sfdbf, String jhzy,
			String qtdsfzy, String wczy, String xssyz, String xssyzdz,
			String wczyqksm, String sfpy, String pyyy, String sfpk,
			String pkyy, String sftybs, String tybsyy, String sfycz,
			String zyrfddz, String sfyzlht, String zlhtxh, Date zlhtqsrq,
			Long zlq, Double yzjjg, String czsj, Double yuanzhi, Double jinge,
			String czht, String htbh, Double czsr, Double czfy, Double czsy,
			String czhsfjsrz, String wrzyy, String sfjf, String sfdy,
			String sfss, String qijian, String jine, String gzrq, String qyrq,
			String yxslc, Double zmyz, Double zmjz, Double jzzb, Double zmje,
			String zcgljy, String beizhu) {
		this.lrsj = lrsj;
		this.zcId = zcId;
		this.kpbh = kpbh;
		this.shuliang = shuliang;
		this.sfzc = sfzc;
		this.sfxz = sfxz;
		this.sftt = sftt;
		this.sfdbf = sfdbf;
		this.jhzy = jhzy;
		this.qtdsfzy = qtdsfzy;
		this.wczy = wczy;
		this.xssyz = xssyz;
		this.xssyzdz = xssyzdz;
		this.wczyqksm = wczyqksm;
		this.sfpy = sfpy;
		this.pyyy = pyyy;
		this.sfpk = sfpk;
		this.pkyy = pkyy;
		this.sftybs = sftybs;
		this.tybsyy = tybsyy;
		this.sfycz = sfycz;
		this.zyrfddz = zyrfddz;
		this.sfyzlht = sfyzlht;
		this.zlhtxh = zlhtxh;
		this.zlhtqsrq = zlhtqsrq;
		this.zlq = zlq;
		this.yzjjg = yzjjg;
		this.czsj = czsj;
		this.yuanzhi = yuanzhi;
		this.jinge = jinge;
		this.czht = czht;
		this.htbh = htbh;
		this.czsr = czsr;
		this.czfy = czfy;
		this.czsy = czsy;
		this.czhsfjsrz = czhsfjsrz;
		this.wrzyy = wrzyy;
		this.sfjf = sfjf;
		this.sfdy = sfdy;
		this.sfss = sfss;
		this.qijian = qijian;
		this.jine = jine;
		this.gzrq = gzrq;
		this.qyrq = qyrq;
		this.yxslc = yxslc;
		this.zmyz = zmyz;
		this.zmjz = zmjz;
		this.jzzb = jzzb;
		this.zmje = zmje;
		this.zcgljy = zcgljy;
		this.beizhu = beizhu;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getLrsj() {
		return this.lrsj;
	}

	public void setLrsj(Date lrsj) {
		this.lrsj = lrsj;
	}

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getKpbh() {
		return this.kpbh;
	}

	public void setKpbh(String kpbh) {
		this.kpbh = kpbh;
	}

	public Long getShuliang() {
		return this.shuliang;
	}

	public void setShuliang(Long shuliang) {
		this.shuliang = shuliang;
	}

	public String getSfzc() {
		return this.sfzc;
	}

	public void setSfzc(String sfzc) {
		this.sfzc = sfzc;
	}

	public String getSfxz() {
		return this.sfxz;
	}

	public void setSfxz(String sfxz) {
		this.sfxz = sfxz;
	}

	public String getSftt() {
		return this.sftt;
	}

	public void setSftt(String sftt) {
		this.sftt = sftt;
	}

	public String getSfdbf() {
		return this.sfdbf;
	}

	public void setSfdbf(String sfdbf) {
		this.sfdbf = sfdbf;
	}

	public String getJhzy() {
		return this.jhzy;
	}

	public void setJhzy(String jhzy) {
		this.jhzy = jhzy;
	}

	public String getQtdsfzy() {
		return this.qtdsfzy;
	}

	public void setQtdsfzy(String qtdsfzy) {
		this.qtdsfzy = qtdsfzy;
	}

	public String getWczy() {
		return this.wczy;
	}

	public void setWczy(String wczy) {
		this.wczy = wczy;
	}

	public String getXssyz() {
		return this.xssyz;
	}

	public void setXssyz(String xssyz) {
		this.xssyz = xssyz;
	}

	public String getXssyzdz() {
		return this.xssyzdz;
	}

	public void setXssyzdz(String xssyzdz) {
		this.xssyzdz = xssyzdz;
	}

	public String getWczyqksm() {
		return this.wczyqksm;
	}

	public void setWczyqksm(String wczyqksm) {
		this.wczyqksm = wczyqksm;
	}

	public String getSfpy() {
		return this.sfpy;
	}

	public void setSfpy(String sfpy) {
		this.sfpy = sfpy;
	}

	public String getPyyy() {
		return this.pyyy;
	}

	public void setPyyy(String pyyy) {
		this.pyyy = pyyy;
	}

	public String getSfpk() {
		return this.sfpk;
	}

	public void setSfpk(String sfpk) {
		this.sfpk = sfpk;
	}

	public String getPkyy() {
		return this.pkyy;
	}

	public void setPkyy(String pkyy) {
		this.pkyy = pkyy;
	}

	public String getSftybs() {
		return this.sftybs;
	}

	public void setSftybs(String sftybs) {
		this.sftybs = sftybs;
	}

	public String getTybsyy() {
		return this.tybsyy;
	}

	public void setTybsyy(String tybsyy) {
		this.tybsyy = tybsyy;
	}

	public String getSfycz() {
		return this.sfycz;
	}

	public void setSfycz(String sfycz) {
		this.sfycz = sfycz;
	}

	public String getZyrfddz() {
		return this.zyrfddz;
	}

	public void setZyrfddz(String zyrfddz) {
		this.zyrfddz = zyrfddz;
	}

	public String getSfyzlht() {
		return this.sfyzlht;
	}

	public void setSfyzlht(String sfyzlht) {
		this.sfyzlht = sfyzlht;
	}

	public String getZlhtxh() {
		return this.zlhtxh;
	}

	public void setZlhtxh(String zlhtxh) {
		this.zlhtxh = zlhtxh;
	}

	public Date getZlhtqsrq() {
		return this.zlhtqsrq;
	}

	public void setZlhtqsrq(Date zlhtqsrq) {
		this.zlhtqsrq = zlhtqsrq;
	}

	public Long getZlq() {
		return this.zlq;
	}

	public void setZlq(Long zlq) {
		this.zlq = zlq;
	}

	public Double getYzjjg() {
		return this.yzjjg;
	}

	public void setYzjjg(Double yzjjg) {
		this.yzjjg = yzjjg;
	}

	public String getCzsj() {
		return this.czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public Double getYuanzhi() {
		return this.yuanzhi;
	}

	public void setYuanzhi(Double yuanzhi) {
		this.yuanzhi = yuanzhi;
	}

	public Double getJinge() {
		return this.jinge;
	}

	public void setJinge(Double jinge) {
		this.jinge = jinge;
	}

	public String getCzht() {
		return this.czht;
	}

	public void setCzht(String czht) {
		this.czht = czht;
	}

	public String getHtbh() {
		return this.htbh;
	}

	public void setHtbh(String htbh) {
		this.htbh = htbh;
	}

	public Double getCzsr() {
		return this.czsr;
	}

	public void setCzsr(Double czsr) {
		this.czsr = czsr;
	}

	public Double getCzfy() {
		return this.czfy;
	}

	public void setCzfy(Double czfy) {
		this.czfy = czfy;
	}

	public Double getCzsy() {
		return this.czsy;
	}

	public void setCzsy(Double czsy) {
		this.czsy = czsy;
	}

	public String getCzhsfjsrz() {
		return this.czhsfjsrz;
	}

	public void setCzhsfjsrz(String czhsfjsrz) {
		this.czhsfjsrz = czhsfjsrz;
	}

	public String getWrzyy() {
		return this.wrzyy;
	}

	public void setWrzyy(String wrzyy) {
		this.wrzyy = wrzyy;
	}

	public String getSfjf() {
		return this.sfjf;
	}

	public void setSfjf(String sfjf) {
		this.sfjf = sfjf;
	}

	public String getSfdy() {
		return this.sfdy;
	}

	public void setSfdy(String sfdy) {
		this.sfdy = sfdy;
	}

	public String getSfss() {
		return this.sfss;
	}

	public void setSfss(String sfss) {
		this.sfss = sfss;
	}

	public String getQijian() {
		return this.qijian;
	}

	public void setQijian(String qijian) {
		this.qijian = qijian;
	}

	public String getJine() {
		return this.jine;
	}

	public void setJine(String jine) {
		this.jine = jine;
	}

	public String getGzrq() {
		return this.gzrq;
	}

	public void setGzrq(String gzrq) {
		this.gzrq = gzrq;
	}

	public String getQyrq() {
		return this.qyrq;
	}

	public void setQyrq(String qyrq) {
		this.qyrq = qyrq;
	}

	public String getYxslc() {
		return this.yxslc;
	}

	public void setYxslc(String yxslc) {
		this.yxslc = yxslc;
	}

	public Double getZmyz() {
		return this.zmyz;
	}

	public void setZmyz(Double zmyz) {
		this.zmyz = zmyz;
	}

	public Double getZmjz() {
		return this.zmjz;
	}

	public void setZmjz(Double zmjz) {
		this.zmjz = zmjz;
	}

	public Double getJzzb() {
		return this.jzzb;
	}

	public void setJzzb(Double jzzb) {
		this.jzzb = jzzb;
	}

	public Double getZmje() {
		return this.zmje;
	}

	public void setZmje(Double zmje) {
		this.zmje = zmje;
	}

	public String getZcgljy() {
		return this.zcgljy;
	}

	public void setZcgljy(String zcgljy) {
		this.zcgljy = zcgljy;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}