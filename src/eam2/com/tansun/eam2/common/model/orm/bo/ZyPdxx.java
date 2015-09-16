package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * ZyPdxx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ZyPdxx extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	// Fields

	private String id;
	private String sbodyId;
	private String sheadId;
	private Date pdrq;
	private String pdpc;
	private String yjflbm;
	private String ejflbm;
	private String sjflbm;
	private String yjflmc;
	private String ejflmc;
	private String sjflmc;
	private String zcId;
	private String zcbh;
	private String zcmc;
	private String gg;
	private Double sl;
	private String jldw;
	private String cfdd;
	private String sybmbh;
	private String sybmbmc;
	private String syrbh;
	private String syrmc;
	private String pdjg;
	private Double pdsl;
	private String bz;
	private String PdjgValue;
	// Constructors

	/** default constructor */
	public ZyPdxx() {
	}

	/** full constructor */
	public ZyPdxx(String sbodyId, String sheadId, Date pdrq, String pdpc,
			String yjflbm, String ejflbm, String sjflbm, String yjflmc,
			String ejflmc, String sjflmc, String zcId, String zcbh,
			String zcmc, String gg, Double sl, String jldw, String cfdd,
			String sybmbh, String sybmbmc, String syrbh, String syrmc,
			String pdjg, Double pdsl, String bz) {
		this.sbodyId = sbodyId;
		this.sheadId = sheadId;
		this.pdrq = pdrq;
		this.pdpc = pdpc;
		this.yjflbm = yjflbm;
		this.ejflbm = ejflbm;
		this.sjflbm = sjflbm;
		this.yjflmc = yjflmc;
		this.ejflmc = ejflmc;
		this.sjflmc = sjflmc;
		this.zcId = zcId;
		this.zcbh = zcbh;
		this.zcmc = zcmc;
		this.gg = gg;
		this.sl = sl;
		this.jldw = jldw;
		this.cfdd = cfdd;
		this.sybmbh = sybmbh;
		this.sybmbmc = sybmbmc;
		this.syrbh = syrbh;
		this.syrmc = syrmc;
		this.pdjg = pdjg;
		this.pdsl = pdsl;
		this.bz = bz;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSbodyId() {
		return this.sbodyId;
	}

	public void setSbodyId(String sbodyId) {
		this.sbodyId = sbodyId;
	}

	public String getSheadId() {
		return this.sheadId;
	}

	public void setSheadId(String sheadId) {
		this.sheadId = sheadId;
	}

	public Date getPdrq() {
		return this.pdrq;
	}

	public void setPdrq(Date pdrq) {
		this.pdrq = pdrq;
	}

	public String getPdpc() {
		return this.pdpc;
	}

	public void setPdpc(String pdpc) {
		this.pdpc = pdpc;
	}

	public String getYjflbm() {
		return this.yjflbm;
	}

	public void setYjflbm(String yjflbm) {
		this.yjflbm = yjflbm;
	}

	public String getEjflbm() {
		return this.ejflbm;
	}

	public void setEjflbm(String ejflbm) {
		this.ejflbm = ejflbm;
	}

	public String getSjflbm() {
		return this.sjflbm;
	}

	public void setSjflbm(String sjflbm) {
		this.sjflbm = sjflbm;
	}

	public String getYjflmc() {
		return this.yjflmc;
	}

	public void setYjflmc(String yjflmc) {
		this.yjflmc = yjflmc;
	}

	public String getEjflmc() {
		return this.ejflmc;
	}

	public void setEjflmc(String ejflmc) {
		this.ejflmc = ejflmc;
	}

	public String getSjflmc() {
		return this.sjflmc;
	}

	public void setSjflmc(String sjflmc) {
		this.sjflmc = sjflmc;
	}

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getZcbh() {
		return this.zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZcmc() {
		return this.zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getGg() {
		return this.gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public Double getSl() {
		return this.sl;
	}

	public void setSl(Double sl) {
		this.sl = sl;
	}

	public String getJldw() {
		return this.jldw;
	}

	public void setJldw(String jldw) {
		this.jldw = jldw;
	}

	public String getCfdd() {
		return this.cfdd;
	}

	public void setCfdd(String cfdd) {
		this.cfdd = cfdd;
	}

	public String getSybmbh() {
		return this.sybmbh;
	}

	public void setSybmbh(String sybmbh) {
		this.sybmbh = sybmbh;
	}

	public String getSybmbmc() {
		return this.sybmbmc;
	}

	public void setSybmbmc(String sybmbmc) {
		this.sybmbmc = sybmbmc;
	}

	public String getSyrbh() {
		return this.syrbh;
	}

	public void setSyrbh(String syrbh) {
		this.syrbh = syrbh;
	}

	public String getSyrmc() {
		return this.syrmc;
	}

	public void setSyrmc(String syrmc) {
		this.syrmc = syrmc;
	}

	public String getPdjg() {
		return this.pdjg;
	}

	public void setPdjg(String pdjg) {
		this.pdjg = pdjg;
	}

	public Double getPdsl() {
		return this.pdsl;
	}

	public void setPdsl(Double pdsl) {
		this.pdsl = pdsl;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getPdjgValue() {
		return coverPdjgFromPdxx(this.getPdjg());
	}
	
	private String coverPdjgFromPdxx(String pdjg){
		if("0".equals(pdjg)){
			return "盘点中";
		}else if("1".equals(pdjg)){
			return "盘库中";
		}else if("2".equals(pdjg)){
			return "盘平";
		}else if("3".equals(pdjg)){
			return "盘盈";
		}else if("4".equals(pdjg)){
			return "盘亏";
		}
		return null;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}