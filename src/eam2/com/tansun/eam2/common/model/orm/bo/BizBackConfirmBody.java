package com.tansun.eam2.common.model.orm.bo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * BizBackConfirmBody entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class BizBackConfirmBody extends CommonBO implements
		java.io.Serializable {

	// Fields

	private String id;
	private String headid;
	private String bz0;
	private String czXmid;
	private String czXmbh;
	private String czXmmc;
	private String czSfwb;
	private Double czCzsr;
	private Double czYkczfy;
	private Double czFycpje;
	private Double czCpqr;
	private String czSfjs;
	private String czBz;
	private String zqId;
	private String zqMc;
	private Double zqHszjxz;
	private Double zqDyyz;
	private String zqHxsr;
	private String zqHxfy;
	private String zqHswb;
	private Double zaLxhsje;
	private String zqLxqj;
	private String zqBz;
	private String qtHsxz;
	private String qtBz;
	private String gqId;
	private String gqStbh;
	private String gqStmc;
	private String gqSf;
	private String gqHkxz;
	private Double gqHsxjje;
	private String gqQlzt;
	private String gqBz;
	private String qsPc;
	private Double ysyfzje;
	private Double tzzje;
	private Double thysyfzje;
	private Double sszje;
	private Double sstzzje;
	private Double thsszje;
	private String qrdlx;
	private String sfybc;

	// Constructors

	/** default constructor */
	public BizBackConfirmBody() {
	}

	/** minimal constructor */
	public BizBackConfirmBody(String id) {
		this.id = id;
	}

	/** full constructor */
	public BizBackConfirmBody(String id, String headid, String bz0,
			String czXmid, String czXmbh, String czXmmc, String czSfwb,
			Double czCzsr, Double czYkczfy, Double czFycpje, Double czCpqr,
			String czSfjs, String czBz, String zqId, String zqMc,
			Double zqHszjxz, Double zqDyyz, String zqHxsr, String zqHxfy,
			String zqHswb, Double zaLxhsje, String zqLxqj, String zqBz,
			String qtHsxz, String qtBz, String gqId, String gqStbh,
			String gqStmc, String gqSf, String gqHkxz, Double gqHsxjje,
			String gqQlzt, String gqBz, String qsPc, Double ysyfzje,
			Double tzzje, Double thysyfzje, Double sszje, Double sstzzje,
			Double thsszje, String qrdlx, String sfybc) {
		this.id = id;
		this.headid = headid;
		this.bz0 = bz0;
		this.czXmid = czXmid;
		this.czXmbh = czXmbh;
		this.czXmmc = czXmmc;
		this.czSfwb = czSfwb;
		this.czCzsr = czCzsr;
		this.czYkczfy = czYkczfy;
		this.czFycpje = czFycpje;
		this.czCpqr = czCpqr;
		this.czSfjs = czSfjs;
		this.czBz = czBz;
		this.zqId = zqId;
		this.zqMc = zqMc;
		this.zqHszjxz = zqHszjxz;
		this.zqDyyz = zqDyyz;
		this.zqHxsr = zqHxsr;
		this.zqHxfy = zqHxfy;
		this.zqHswb = zqHswb;
		this.zaLxhsje = zaLxhsje;
		this.zqLxqj = zqLxqj;
		this.zqBz = zqBz;
		this.qtHsxz = qtHsxz;
		this.qtBz = qtBz;
		this.gqId = gqId;
		this.gqStbh = gqStbh;
		this.gqStmc = gqStmc;
		this.gqSf = gqSf;
		this.gqHkxz = gqHkxz;
		this.gqHsxjje = gqHsxjje;
		this.gqQlzt = gqQlzt;
		this.gqBz = gqBz;
		this.qsPc = qsPc;
		this.ysyfzje = ysyfzje;
		this.tzzje = tzzje;
		this.thysyfzje = thysyfzje;
		this.sszje = sszje;
		this.sstzzje = sstzzje;
		this.thsszje = thsszje;
		this.qrdlx = qrdlx;
		this.sfybc = sfybc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeadid() {
		return this.headid;
	}

	public void setHeadid(String headid) {
		this.headid = headid;
	}

	public String getBz0() {
		return this.bz0;
	}

	public void setBz0(String bz0) {
		this.bz0 = bz0;
	}

	public String getCzXmid() {
		return this.czXmid;
	}

	public void setCzXmid(String czXmid) {
		this.czXmid = czXmid;
	}

	public String getCzXmbh() {
		return this.czXmbh;
	}

	public void setCzXmbh(String czXmbh) {
		this.czXmbh = czXmbh;
	}

	public String getCzXmmc() {
		return this.czXmmc;
	}

	public void setCzXmmc(String czXmmc) {
		this.czXmmc = czXmmc;
	}

	public String getCzSfwb() {
		return this.czSfwb;
	}

	public void setCzSfwb(String czSfwb) {
		this.czSfwb = czSfwb;
	}

	public Double getCzCzsr() {
		return this.czCzsr;
	}

	public void setCzCzsr(Double czCzsr) {
		this.czCzsr = czCzsr;
	}

	public Double getCzYkczfy() {
		return this.czYkczfy;
	}

	public void setCzYkczfy(Double czYkczfy) {
		this.czYkczfy = czYkczfy;
	}

	public Double getCzFycpje() {
		return this.czFycpje;
	}

	public void setCzFycpje(Double czFycpje) {
		this.czFycpje = czFycpje;
	}

	public Double getCzCpqr() {
		return this.czCpqr;
	}

	public void setCzCpqr(Double czCpqr) {
		this.czCpqr = czCpqr;
	}

	public String getCzSfjs() {
		return this.czSfjs;
	}

	public void setCzSfjs(String czSfjs) {
		this.czSfjs = czSfjs;
	}

	public String getCzBz() {
		return this.czBz;
	}

	public void setCzBz(String czBz) {
		this.czBz = czBz;
	}

	public String getZqId() {
		return this.zqId;
	}

	public void setZqId(String zqId) {
		this.zqId = zqId;
	}

	public String getZqMc() {
		return this.zqMc;
	}

	public void setZqMc(String zqMc) {
		this.zqMc = zqMc;
	}

	public Double getZqHszjxz() {
		return this.zqHszjxz;
	}

	public void setZqHszjxz(Double zqHszjxz) {
		this.zqHszjxz = zqHszjxz;
	}

	public Double getZqDyyz() {
		return this.zqDyyz;
	}

	public void setZqDyyz(Double zqDyyz) {
		this.zqDyyz = zqDyyz;
	}

	public String getZqHxsr() {
		return this.zqHxsr;
	}

	public void setZqHxsr(String zqHxsr) {
		this.zqHxsr = zqHxsr;
	}

	public String getZqHxfy() {
		return this.zqHxfy;
	}

	public void setZqHxfy(String zqHxfy) {
		this.zqHxfy = zqHxfy;
	}

	public String getZqHswb() {
		return this.zqHswb;
	}

	public void setZqHswb(String zqHswb) {
		this.zqHswb = zqHswb;
	}

	public Double getZaLxhsje() {
		return this.zaLxhsje;
	}

	public void setZaLxhsje(Double zaLxhsje) {
		this.zaLxhsje = zaLxhsje;
	}

	public String getZqLxqj() {
		return this.zqLxqj;
	}

	public void setZqLxqj(String zqLxqj) {
		this.zqLxqj = zqLxqj;
	}

	public String getZqBz() {
		return this.zqBz;
	}

	public void setZqBz(String zqBz) {
		this.zqBz = zqBz;
	}

	public String getQtHsxz() {
		return this.qtHsxz;
	}

	public void setQtHsxz(String qtHsxz) {
		this.qtHsxz = qtHsxz;
	}

	public String getQtBz() {
		return this.qtBz;
	}

	public void setQtBz(String qtBz) {
		this.qtBz = qtBz;
	}

	public String getGqId() {
		return this.gqId;
	}

	public void setGqId(String gqId) {
		this.gqId = gqId;
	}

	public String getGqStbh() {
		return this.gqStbh;
	}

	public void setGqStbh(String gqStbh) {
		this.gqStbh = gqStbh;
	}

	public String getGqStmc() {
		return this.gqStmc;
	}

	public void setGqStmc(String gqStmc) {
		this.gqStmc = gqStmc;
	}

	public String getGqSf() {
		return this.gqSf;
	}

	public void setGqSf(String gqSf) {
		this.gqSf = gqSf;
	}

	public String getGqHkxz() {
		return this.gqHkxz;
	}

	public void setGqHkxz(String gqHkxz) {
		this.gqHkxz = gqHkxz;
	}

	public Double getGqHsxjje() {
		return this.gqHsxjje;
	}

	public void setGqHsxjje(Double gqHsxjje) {
		this.gqHsxjje = gqHsxjje;
	}

	public String getGqQlzt() {
		return this.gqQlzt;
	}

	public void setGqQlzt(String gqQlzt) {
		this.gqQlzt = gqQlzt;
	}

	public String getGqBz() {
		return this.gqBz;
	}

	public void setGqBz(String gqBz) {
		this.gqBz = gqBz;
	}

	public String getQsPc() {
		return this.qsPc;
	}

	public void setQsPc(String qsPc) {
		this.qsPc = qsPc;
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

	public String getQrdlx() {
		return qrdlx;
	}

	public void setQrdlx(String qrdlx) {
		this.qrdlx = qrdlx;
	}

	public String getSfybc() {
		return sfybc;
	}

	public void setSfybc(String sfybc) {
		this.sfybc = sfybc;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}