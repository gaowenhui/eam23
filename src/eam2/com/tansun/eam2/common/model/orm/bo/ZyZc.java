package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * ZyZc entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ZyZc extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	private static final long serialVersionUID = 7633382530034999073L;
	private String zcId;
	private String yjflbm;
	private String ejflbm;
	private String sjflbm;
	private String yjflmc;
	private String ejflmc;
	private String sjflmc;
	private String zcbh;
	private String zcmc;
	private String kpbh;
	private String txmbh;
	private String xlh;
	private Double sl;
	private String jldw;
	private String gg;
	private String zczt;
	private String wzbh;
	private String yjkcsl;
	private String ztwz;
	private Double czyz;
	private String bgdd;
	private String syzk;
	private Date kssyrq;
	private String fdjbh;
	private String ylrr;
	private Double dzyhdj;
	private Double dzyhjg;
	private Date cbrq;
	private String cpuxh;
	private String memory;
	private String disk;
	private String nzdisk;
	private String xtxsq;
	private Date zjxgsj;
	private String sszg;
	private String bz;
	private Date zjpdrq;
	private Date rkrq;
	private Date zjpkrq;
	private String bxfws;
	private String gys;
	private String lph;
	private Date lpsx;
	private String lpqx;
	private String lpdlm;
	private String sfsckp;
	private Date cgrq;

	// Constructors

	/** default constructor */
	public ZyZc() {
	}

	/** full constructor */
	public ZyZc(String yjflbm, String ejflbm, String sjflbm, String yjflmc,
			String ejflmc, String sjflmc, String zcbh, String zcmc,
			String kpbh, String txmbh, String xlh, Double sl, String jldw,
			String gg, String zczt, String wzbh, String yjkcsl, String ztwz,
			Double czyz, String bgdd, String syzk, Date kssyrq, String fdjbh,
			String ylrr, Double dzyhdj, Double dzyhjg, Date cbrq, String cpuxh,
			String memory, String disk, String nzdisk, String xtxsq,
			Date zjxgsj, String sszg, String bz, Date zjpdrq, Date rkrq,
			Date zjpkrq, String bxfws, String gys, String lph, Date lpsx,
			String lpqx, String lpdlm, Date cgrq) {
		this.yjflbm = yjflbm;
		this.ejflbm = ejflbm;
		this.sjflbm = sjflbm;
		this.yjflmc = yjflmc;
		this.ejflmc = ejflmc;
		this.sjflmc = sjflmc;
		this.zcbh = zcbh;
		this.zcmc = zcmc;
		this.kpbh = kpbh;
		this.txmbh = txmbh;
		this.xlh = xlh;
		this.sl = sl;
		this.jldw = jldw;
		this.gg = gg;
		this.zczt = zczt;
		this.wzbh = wzbh;
		this.yjkcsl = yjkcsl;
		this.ztwz = ztwz;
		this.czyz = czyz;
		this.bgdd = bgdd;
		this.syzk = syzk;
		this.kssyrq = kssyrq;
		this.fdjbh = fdjbh;
		this.ylrr = ylrr;
		this.dzyhdj = dzyhdj;
		this.dzyhjg = dzyhjg;
		this.cbrq = cbrq;
		this.cpuxh = cpuxh;
		this.memory = memory;
		this.disk = disk;
		this.nzdisk = nzdisk;
		this.xtxsq = xtxsq;
		this.zjxgsj = zjxgsj;
		this.sszg = sszg;
		this.bz = bz;
		this.zjpdrq = zjpdrq;
		this.rkrq = rkrq;
		this.zjpkrq = zjpkrq;
		this.bxfws = bxfws;
		this.gys = gys;
		this.lph = lph;
		this.lpsx = lpsx;
		this.lpqx = lpqx;
		this.lpdlm = lpdlm;
		this.cgrq = cgrq;
	}

	// Property accessors

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
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

	public String getKpbh() {
		return this.kpbh;
	}

	public void setKpbh(String kpbh) {
		this.kpbh = kpbh;
	}

	public String getTxmbh() {
		return this.txmbh;
	}

	public void setTxmbh(String txmbh) {
		this.txmbh = txmbh;
	}

	public String getXlh() {
		return this.xlh;
	}

	public void setXlh(String xlh) {
		this.xlh = xlh;
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

	public String getGg() {
		return this.gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getZczt() {
		return this.zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public String getWzbh() {
		return this.wzbh;
	}

	public void setWzbh(String wzbh) {
		this.wzbh = wzbh;
	}

	public String getYjkcsl() {
		return this.yjkcsl;
	}

	public void setYjkcsl(String yjkcsl) {
		this.yjkcsl = yjkcsl;
	}

	public String getZtwz() {
		return this.ztwz;
	}

	public void setZtwz(String ztwz) {
		this.ztwz = ztwz;
	}

	public Double getCzyz() {
		return this.czyz;
	}

	public void setCzyz(Double czyz) {
		this.czyz = czyz;
	}

	public String getBgdd() {
		return this.bgdd;
	}

	public void setBgdd(String bgdd) {
		this.bgdd = bgdd;
	}

	public String getSyzk() {
		return this.syzk;
	}

	public void setSyzk(String syzk) {
		this.syzk = syzk;
	}

	public Date getKssyrq() {
		return this.kssyrq;
	}

	public void setKssyrq(Date kssyrq) {
		this.kssyrq = kssyrq;
	}

	public String getFdjbh() {
		return this.fdjbh;
	}

	public void setFdjbh(String fdjbh) {
		this.fdjbh = fdjbh;
	}

	public String getYlrr() {
		return this.ylrr;
	}

	public void setYlrr(String ylrr) {
		this.ylrr = ylrr;
	}

	public Double getDzyhdj() {
		return this.dzyhdj;
	}

	public void setDzyhdj(Double dzyhdj) {
		this.dzyhdj = dzyhdj;
	}

	public Double getDzyhjg() {
		return this.dzyhjg;
	}

	public void setDzyhjg(Double dzyhjg) {
		this.dzyhjg = dzyhjg;
	}

	public Date getCbrq() {
		return this.cbrq;
	}

	public void setCbrq(Date cbrq) {
		this.cbrq = cbrq;
	}

	public String getCpuxh() {
		return this.cpuxh;
	}

	public void setCpuxh(String cpuxh) {
		this.cpuxh = cpuxh;
	}

	public String getMemory() {
		return this.memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getDisk() {
		return this.disk;
	}

	public void setDisk(String disk) {
		this.disk = disk;
	}

	public String getNzdisk() {
		return this.nzdisk;
	}

	public void setNzdisk(String nzdisk) {
		this.nzdisk = nzdisk;
	}

	public String getXtxsq() {
		return this.xtxsq;
	}

	public void setXtxsq(String xtxsq) {
		this.xtxsq = xtxsq;
	}

	public Date getZjxgsj() {
		return this.zjxgsj;
	}

	public void setZjxgsj(Date zjxgsj) {
		this.zjxgsj = zjxgsj;
	}

	public String getSszg() {
		return this.sszg;
	}

	public void setSszg(String sszg) {
		this.sszg = sszg;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public Date getZjpdrq() {
		return this.zjpdrq;
	}

	public void setZjpdrq(Date zjpdrq) {
		this.zjpdrq = zjpdrq;
	}

	public Date getRkrq() {
		return this.rkrq;
	}

	public void setRkrq(Date rkrq) {
		this.rkrq = rkrq;
	}

	public Date getZjpkrq() {
		return this.zjpkrq;
	}

	public void setZjpkrq(Date zjpkrq) {
		this.zjpkrq = zjpkrq;
	}

	public String getBxfws() {
		return this.bxfws;
	}

	public void setBxfws(String bxfws) {
		this.bxfws = bxfws;
	}

	public String getGys() {
		return this.gys;
	}

	public void setGys(String gys) {
		this.gys = gys;
	}

	public String getLph() {
		return this.lph;
	}

	public void setLph(String lph) {
		this.lph = lph;
	}

	public Date getLpsx() {
		return this.lpsx;
	}

	public void setLpsx(Date lpsx) {
		this.lpsx = lpsx;
	}

	public String getLpqx() {
		return this.lpqx;
	}

	public void setLpqx(String lpqx) {
		this.lpqx = lpqx;
	}

	public String getLpdlm() {
		return this.lpdlm;
	}

	public void setLpdlm(String lpdlm) {
		this.lpdlm = lpdlm;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getSfsckp() {
		return sfsckp;
	}

	public void setSfsckp(String sfsckp) {
		this.sfsckp = sfsckp;
	}

	public Date getCgrq() {
		return cgrq;
	}

	public void setCgrq(Date cgrq) {
		this.cgrq = cgrq;
	}

}