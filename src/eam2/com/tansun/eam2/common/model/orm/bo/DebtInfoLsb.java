package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * DebtInfoLsb entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class DebtInfoLsb extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = 5265548612604169720L;
	private String id;
	private String cldId;
	private String zqxxId;
	private String zqrmc;
	private String zqrid;
	private String zwrbh;
	private String zwrmc;
	private String zwrid;
	private String glstlx;
	private Double grzye;
	private Double bj;
	private Double lx;
	private Double hj;
	private String bzid;
	private String bzbm;
	private String bzmc;
	private Double htje;
	private String htbh;
	private Date htqsrq;
	private Date htzzrq;
	private String dblxid;
	private String dblxbm;
	private String dblxmc;
	private String dbhtbh;
	private Double dbhtje;
	private String dbwzlbid;
	private String dbwzlbbh;
	private String dbwzlbmc;
	private String bzrmc;
	private String sfss;
	private Double ssfy;
	private String sfysxflws;
	private String zhtsfss;
	private String dbhtsfss;
	private String fshx;
	private String djzr;
	private String beizhu;
	private String czzt;
	private String shengfen;
	private String zqzl;
	private Double djzrje;
	private String dbfs;
	private Double zqje;
	private String sssx;
	private String bzrdsm;
	private String zwrqkjs;
	private String fzjs;
	private Long zqqx;
	private String htmc;
	private String dyzycc;
	private String sfbc;
	private String CZcqs;
	private String wtrmc;
	private Double zrje;
	private String cldzt;

	// Constructors

	/** default constructor */
	public DebtInfoLsb() {
	}

	/** full constructor */
	public DebtInfoLsb(String cldId, String zqxxId, String zqrmc, String zqrid,
			String zwrbh, String zwrmc, String zwrid, String glstlx,
			Double grzye, Double bj, Double lx, Double hj, String bzid,
			String bzbm, String bzmc, Double htje, String htbh, Date htqsrq,
			Date htzzrq, String dblxid, String dblxbm, String dblxmc,
			String dbhtbh, Double dbhtje, String dbwzlbid, String dbwzlbbh,
			String dbwzlbmc, String bzrmc, String sfss, Double ssfy,
			String sfysxflws, String zhtsfss, String dbhtsfss, String fshx,
			String djzr, String beizhu, String czzt, String shengfen,
			String zqzl, Double djzrje, String dbfs, Double zqje, String sssx,
			String bzrdsm, String zwrqkjs, String fzjs, Long zqqx, String htmc,
			String dyzycc, String sfbc, String CZcqs, String wtrmc,
			Double zrje, String cldzt) {
		this.cldId = cldId;
		this.zqxxId = zqxxId;
		this.zqrmc = zqrmc;
		this.zqrid = zqrid;
		this.zwrbh = zwrbh;
		this.zwrmc = zwrmc;
		this.zwrid = zwrid;
		this.glstlx = glstlx;
		this.grzye = grzye;
		this.bj = bj;
		this.lx = lx;
		this.hj = hj;
		this.bzid = bzid;
		this.bzbm = bzbm;
		this.bzmc = bzmc;
		this.htje = htje;
		this.htbh = htbh;
		this.htqsrq = htqsrq;
		this.htzzrq = htzzrq;
		this.dblxid = dblxid;
		this.dblxbm = dblxbm;
		this.dblxmc = dblxmc;
		this.dbhtbh = dbhtbh;
		this.dbhtje = dbhtje;
		this.dbwzlbid = dbwzlbid;
		this.dbwzlbbh = dbwzlbbh;
		this.dbwzlbmc = dbwzlbmc;
		this.bzrmc = bzrmc;
		this.sfss = sfss;
		this.ssfy = ssfy;
		this.sfysxflws = sfysxflws;
		this.zhtsfss = zhtsfss;
		this.dbhtsfss = dbhtsfss;
		this.fshx = fshx;
		this.djzr = djzr;
		this.beizhu = beizhu;
		this.czzt = czzt;
		this.shengfen = shengfen;
		this.zqzl = zqzl;
		this.djzrje = djzrje;
		this.dbfs = dbfs;
		this.zqje = zqje;
		this.sssx = sssx;
		this.bzrdsm = bzrdsm;
		this.zwrqkjs = zwrqkjs;
		this.fzjs = fzjs;
		this.zqqx = zqqx;
		this.htmc = htmc;
		this.dyzycc = dyzycc;
		this.sfbc = sfbc;
		this.CZcqs = CZcqs;
		this.wtrmc = wtrmc;
		this.zrje = zrje;
		this.cldzt = cldzt;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCldId() {
		return this.cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public String getZqxxId() {
		return this.zqxxId;
	}

	public void setZqxxId(String zqxxId) {
		this.zqxxId = zqxxId;
	}

	public String getZqrmc() {
		return this.zqrmc;
	}

	public void setZqrmc(String zqrmc) {
		this.zqrmc = zqrmc;
	}

	public String getZqrid() {
		return this.zqrid;
	}

	public void setZqrid(String zqrid) {
		this.zqrid = zqrid;
	}

	public String getZwrbh() {
		return this.zwrbh;
	}

	public void setZwrbh(String zwrbh) {
		this.zwrbh = zwrbh;
	}

	public String getZwrmc() {
		return this.zwrmc;
	}

	public void setZwrmc(String zwrmc) {
		this.zwrmc = zwrmc;
	}

	public String getZwrid() {
		return this.zwrid;
	}

	public void setZwrid(String zwrid) {
		this.zwrid = zwrid;
	}

	public String getGlstlx() {
		return this.glstlx;
	}

	public void setGlstlx(String glstlx) {
		this.glstlx = glstlx;
	}

	public Double getGrzye() {
		return this.grzye;
	}

	public void setGrzye(Double grzye) {
		this.grzye = grzye;
	}

	public Double getBj() {
		return this.bj;
	}

	public void setBj(Double bj) {
		this.bj = bj;
	}

	public Double getLx() {
		return this.lx;
	}

	public void setLx(Double lx) {
		this.lx = lx;
	}

	public Double getHj() {
		return this.hj;
	}

	public void setHj(Double hj) {
		this.hj = hj;
	}

	public String getBzid() {
		return this.bzid;
	}

	public void setBzid(String bzid) {
		this.bzid = bzid;
	}

	public String getBzbm() {
		return this.bzbm;
	}

	public void setBzbm(String bzbm) {
		this.bzbm = bzbm;
	}

	public String getBzmc() {
		return this.bzmc;
	}

	public void setBzmc(String bzmc) {
		this.bzmc = bzmc;
	}

	public Double getHtje() {
		return this.htje;
	}

	public void setHtje(Double htje) {
		this.htje = htje;
	}

	public String getHtbh() {
		return this.htbh;
	}

	public void setHtbh(String htbh) {
		this.htbh = htbh;
	}

	public Date getHtqsrq() {
		return this.htqsrq;
	}

	public void setHtqsrq(Date htqsrq) {
		this.htqsrq = htqsrq;
	}

	public Date getHtzzrq() {
		return this.htzzrq;
	}

	public void setHtzzrq(Date htzzrq) {
		this.htzzrq = htzzrq;
	}

	public String getDblxid() {
		return this.dblxid;
	}

	public void setDblxid(String dblxid) {
		this.dblxid = dblxid;
	}

	public String getDblxbm() {
		return this.dblxbm;
	}

	public void setDblxbm(String dblxbm) {
		this.dblxbm = dblxbm;
	}

	public String getDblxmc() {
		return this.dblxmc;
	}

	public void setDblxmc(String dblxmc) {
		this.dblxmc = dblxmc;
	}

	public String getDbhtbh() {
		return this.dbhtbh;
	}

	public void setDbhtbh(String dbhtbh) {
		this.dbhtbh = dbhtbh;
	}

	public Double getDbhtje() {
		return this.dbhtje;
	}

	public void setDbhtje(Double dbhtje) {
		this.dbhtje = dbhtje;
	}

	public String getDbwzlbid() {
		return this.dbwzlbid;
	}

	public void setDbwzlbid(String dbwzlbid) {
		this.dbwzlbid = dbwzlbid;
	}

	public String getDbwzlbbh() {
		return this.dbwzlbbh;
	}

	public void setDbwzlbbh(String dbwzlbbh) {
		this.dbwzlbbh = dbwzlbbh;
	}

	public String getDbwzlbmc() {
		return this.dbwzlbmc;
	}

	public void setDbwzlbmc(String dbwzlbmc) {
		this.dbwzlbmc = dbwzlbmc;
	}

	public String getBzrmc() {
		return this.bzrmc;
	}

	public void setBzrmc(String bzrmc) {
		this.bzrmc = bzrmc;
	}

	public String getSfss() {
		return this.sfss;
	}

	public void setSfss(String sfss) {
		this.sfss = sfss;
	}

	public Double getSsfy() {
		return this.ssfy;
	}

	public void setSsfy(Double ssfy) {
		this.ssfy = ssfy;
	}

	public String getSfysxflws() {
		return this.sfysxflws;
	}

	public void setSfysxflws(String sfysxflws) {
		this.sfysxflws = sfysxflws;
	}

	public String getZhtsfss() {
		return this.zhtsfss;
	}

	public void setZhtsfss(String zhtsfss) {
		this.zhtsfss = zhtsfss;
	}

	public String getDbhtsfss() {
		return this.dbhtsfss;
	}

	public void setDbhtsfss(String dbhtsfss) {
		this.dbhtsfss = dbhtsfss;
	}

	public String getFshx() {
		return this.fshx;
	}

	public void setFshx(String fshx) {
		this.fshx = fshx;
	}

	public String getDjzr() {
		return this.djzr;
	}

	public void setDjzr(String djzr) {
		this.djzr = djzr;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getCzzt() {
		return this.czzt;
	}

	public void setCzzt(String czzt) {
		this.czzt = czzt;
	}

	public String getShengfen() {
		return this.shengfen;
	}

	public void setShengfen(String shengfen) {
		this.shengfen = shengfen;
	}

	public String getZqzl() {
		return this.zqzl;
	}

	public void setZqzl(String zqzl) {
		this.zqzl = zqzl;
	}

	public Double getDjzrje() {
		return this.djzrje;
	}

	public void setDjzrje(Double djzrje) {
		this.djzrje = djzrje;
	}

	public String getDbfs() {
		return this.dbfs;
	}

	public void setDbfs(String dbfs) {
		this.dbfs = dbfs;
	}

	public Double getZqje() {
		return this.zqje;
	}

	public void setZqje(Double zqje) {
		this.zqje = zqje;
	}

	public String getSssx() {
		return this.sssx;
	}

	public void setSssx(String sssx) {
		this.sssx = sssx;
	}

	public String getBzrdsm() {
		return this.bzrdsm;
	}

	public void setBzrdsm(String bzrdsm) {
		this.bzrdsm = bzrdsm;
	}

	public String getZwrqkjs() {
		return this.zwrqkjs;
	}

	public void setZwrqkjs(String zwrqkjs) {
		this.zwrqkjs = zwrqkjs;
	}

	public String getFzjs() {
		return this.fzjs;
	}

	public void setFzjs(String fzjs) {
		this.fzjs = fzjs;
	}

	public Long getZqqx() {
		return this.zqqx;
	}

	public void setZqqx(Long zqqx) {
		this.zqqx = zqqx;
	}

	public String getHtmc() {
		return this.htmc;
	}

	public void setHtmc(String htmc) {
		this.htmc = htmc;
	}

	public String getDyzycc() {
		return this.dyzycc;
	}

	public void setDyzycc(String dyzycc) {
		this.dyzycc = dyzycc;
	}

	public String getSfbc() {
		return this.sfbc;
	}

	public void setSfbc(String sfbc) {
		this.sfbc = sfbc;
	}

	public String getCZcqs() {
		return this.CZcqs;
	}

	public void setCZcqs(String CZcqs) {
		this.CZcqs = CZcqs;
	}

	public String getWtrmc() {
		return this.wtrmc;
	}

	public void setWtrmc(String wtrmc) {
		this.wtrmc = wtrmc;
	}

	public Double getZrje() {
		return this.zrje;
	}

	public void setZrje(Double zrje) {
		this.zrje = zrje;
	}

	public String getCldzt() {
		return this.cldzt;
	}

	public void setCldzt(String cldzt) {
		this.cldzt = cldzt;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}