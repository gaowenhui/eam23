package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * JjzcHtqsHead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class JjzcHtqsHead extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = 3834966886261442998L;
	private String id;
	private String lcId;
	private String biaoti;
	private String chengsong;
	private String bianhao;
	private String jhcd;
	private String ngr;
	private String ngrmc;
	private String lxdh;
	private Date ngrq;
	private String ngbm;
	private String ngbmmc;
	private String beizhu;
	private String ywlx;
	private String lcmc;
	private String sfbb;
	private String sheettype;
	private String qspc;
	private String qslx;
	private Double ysyfzje;
	private Double tzzje;
	private Double thysyfzje;
	private Double sszje;
	private Double sstzzje;
	private Double thsszje;
	private String zhuangtai;

	// Constructors

	/** default constructor */
	public JjzcHtqsHead() {
	}

	/** full constructor */
	public JjzcHtqsHead(String id, String lcId, String biaoti,
			String chengsong, String bianhao, String jhcd, String ngr,
			String ngrmc, String lxdh, Date ngrq, String ngbm, String ngbmmc,
			String beizhu, String ywlx, String lcmc, String sfbb,
			String sheettype, String qspc, String qslx, Double ysyfzje,
			Double tzzje, Double thysyfzje, Double sszje, Double sstzzje,
			Double thsszje, String zhuangtai) {
		super();
		this.id = id;
		this.lcId = lcId;
		this.biaoti = biaoti;
		this.chengsong = chengsong;
		this.bianhao = bianhao;
		this.jhcd = jhcd;
		this.ngr = ngr;
		this.ngrmc = ngrmc;
		this.lxdh = lxdh;
		this.ngrq = ngrq;
		this.ngbm = ngbm;
		this.ngbmmc = ngbmmc;
		this.beizhu = beizhu;
		this.ywlx = ywlx;
		this.lcmc = lcmc;
		this.sfbb = sfbb;
		this.sheettype = sheettype;
		this.qspc = qspc;
		this.qslx = qslx;
		this.ysyfzje = ysyfzje;
		this.tzzje = tzzje;
		this.thysyfzje = thysyfzje;
		this.sszje = sszje;
		this.sstzzje = sstzzje;
		this.thsszje = thsszje;
		this.zhuangtai = zhuangtai;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLcId() {
		return this.lcId;
	}

	public void setLcId(String lcId) {
		this.lcId = lcId;
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

	public String getNgr() {
		return this.ngr;
	}

	public void setNgr(String ngr) {
		this.ngr = ngr;
	}

	public String getNgrmc() {
		return this.ngrmc;
	}

	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
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

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getYwlx() {
		return this.ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}

	public String getLcmc() {
		return this.lcmc;
	}

	public void setLcmc(String lcmc) {
		this.lcmc = lcmc;
	}

	public String getSfbb() {
		return this.sfbb;
	}

	public void setSfbb(String sfbb) {
		this.sfbb = sfbb;
	}

	public String getSheettype() {
		return this.sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public String getQspc() {
		return this.qspc;
	}

	public void setQspc(String qspc) {
		this.qspc = qspc;
	}

	public String getQslx() {
		return this.qslx;
	}

	public void setQslx(String qslx) {
		this.qslx = qslx;
	}

	public Double getYsyfzje() {
		return this.ysyfzje;
	}

	public void setYsyfzje(Double ysyfzje) {
		this.ysyfzje = ysyfzje;
	}

	public Double getTzzje() {
		return this.tzzje;
	}

	public void setTzzje(Double tzzje) {
		this.tzzje = tzzje;
	}

	public Double getThysyfzje() {
		return this.thysyfzje;
	}

	public void setThysyfzje(Double thysyfzje) {
		this.thysyfzje = thysyfzje;
	}

	public Double getSszje() {
		return this.sszje;
	}

	public void setSszje(Double sszje) {
		this.sszje = sszje;
	}

	public Double getSstzzje() {
		return this.sstzzje;
	}

	public void setSstzzje(Double sstzzje) {
		this.sstzzje = sstzzje;
	}

	public Double getThsszje() {
		return this.thsszje;
	}

	public void setThsszje(Double thsszje) {
		this.thsszje = thsszje;
	}

	public String getZhuangtai() {
		return this.zhuangtai;
	}

	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getChengsong() {
		return chengsong;
	}

	public void setChengsong(String chengsong) {
		this.chengsong = chengsong;
	}

	
}