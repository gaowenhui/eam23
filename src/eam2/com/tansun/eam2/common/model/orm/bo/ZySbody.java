package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * ZySbody entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ZySbody extends com.tansun.rdp4j.common.web.vo.CommonBO implements Cloneable, java.io.Serializable {

	// Fields
	public ZySbody clone(ZySbody body){
		try {
			return (ZySbody)body.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return null;
		}
	}
	private String sbodyId;
	private String sheadId;
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
	private Double dj;
	private Double je;
	private String gys;
	private Date cbrq;
	private String bxjg;
	private Long jyts;
	private Long wrksl;
	private String bz1;
	private String bxfws;
	private Date xxbrq;
	private String bz2;
	private String fybh;
	private Double sqfy;
	private Double spje;
	private Double ybxje;
	private String bz3;
	private Date cgrq;
	private String cgdbodyid;
	private String grsqdbodyid;
	private String sqrid;
	private String sqrmc;
	private String pdpc;
	private String zczt;
	private Date jylyrq;
	private Date jydqrq;
	private Double wxfy;
	private String lph;
	private Date lpsx;
	private String lpqx;
	private String lpdlm;
	private String syzt;
	private String xlh;
	private String fdjbh;
	private String cpuxh;
	private String memory;
	private String disk;
	private String nzdisk;
	private String xtxsq;
	private String sszg;
	private String sqbmmc;
	private String sqbmid;
	private String txmbh;
	private String jylyrq4Char; //add by lantianbo
	private String jydqrq4Char;
	//数量汇总
	private Double totalSl;
	//金额汇总
	private Double totalJe;

	// Constructors

	public Double getTotalSl() {
		return totalSl;
	}

	public void setTotalSl(Double totalSl) {
		this.totalSl = totalSl;
	}

	public Double getTotalJe() {
		return totalJe;
	}

	public void setTotalJe(Double totalJe) {
		this.totalJe = totalJe;
	}

	public String getJylyrq4Char() {
		return jylyrq4Char;
	}

	public void setJylyrq4Char(String jylyrq4Char) {
		this.jylyrq4Char = jylyrq4Char;
	}

	public String getJydqrq4Char() {
		return jydqrq4Char;
	}

	public void setJydqrq4Char(String jydqrq4Char) {
		this.jydqrq4Char = jydqrq4Char;
	}

	/** default constructor */
	public ZySbody() {
	}

	/** minimal constructor */
	public ZySbody(String sbodyId) {
		this.sbodyId = sbodyId;
	}

	/** full constructor */
	public ZySbody(String sbodyId, String sheadId, String yjflbm, String ejflbm, String sjflbm, String yjflmc, String ejflmc, String sjflmc,
			String zcId, String zcbh, String zcmc, String gg, Double sl, String jldw, Double dj, Double je, String gys, Date cbrq, String bxjg,
			Long jyts, Long wrksl, String bz1, String bxfws, Date xxbrq, String bz2, String fybh, Double sqfy, Double spje, Double ybxje, String bz3,
			Date cgrq, String cgdbodyid, String grsqdbodyid, String sqrid, String sqrmc, String pdpc, String zczt, Date jylyrq, Date jydqrq,
			Double wxfy, String lph, Date lpsx, String lpqx, String lpdlm, String syzt, String xlh, String fdjbh, String cpuxh, String memory,
			String disk, String nzdisk, String xtxsq, String sszg,String sqbmmc,String sqbmid) {
		this.sbodyId = sbodyId;
		this.sheadId = sheadId;
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
		this.dj = dj;
		this.je = je;
		this.gys = gys;
		this.cbrq = cbrq;
		this.bxjg = bxjg;
		this.jyts = jyts;
		this.wrksl = wrksl;
		this.bz1 = bz1;
		this.bxfws = bxfws;
		this.xxbrq = xxbrq;
		this.bz2 = bz2;
		this.fybh = fybh;
		this.sqfy = sqfy;
		this.spje = spje;
		this.ybxje = ybxje;
		this.bz3 = bz3;
		this.cgrq = cgrq;
		this.cgdbodyid = cgdbodyid;
		this.grsqdbodyid = grsqdbodyid;
		this.sqrid = sqrid;
		this.sqrmc = sqrmc;
		this.pdpc = pdpc;
		this.zczt = zczt;
		this.jylyrq = jylyrq;
		this.jydqrq = jydqrq;
		this.wxfy = wxfy;
		this.lph = lph;
		this.lpsx = lpsx;
		this.lpqx = lpqx;
		this.lpdlm = lpdlm;
		this.syzt = syzt;
		this.xlh = xlh;
		this.fdjbh = fdjbh;
		this.cpuxh = cpuxh;
		this.memory = memory;
		this.disk = disk;
		this.nzdisk = nzdisk;
		this.xtxsq = xtxsq;
		this.sszg = sszg;
		this.sqbmmc = sqbmmc;
		this.sqbmid = sqbmid;
	}

	// Property accessors

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

	public Double getDj() {
		return this.dj;
	}

	public void setDj(Double dj) {
		this.dj = dj;
	}

	public Double getJe() {
		return this.je;
	}

	public void setJe(Double je) {
		this.je = je;
	}

	public String getGys() {
		return this.gys;
	}

	public void setGys(String gys) {
		this.gys = gys;
	}

	public Date getCbrq() {
		return this.cbrq;
	}

	public void setCbrq(Date cbrq) {
		this.cbrq = cbrq;
	}

	public String getBxjg() {
		return this.bxjg;
	}

	public void setBxjg(String bxjg) {
		this.bxjg = bxjg;
	}

	public Long getJyts() {
		return this.jyts;
	}

	public void setJyts(Long jyts) {
		this.jyts = jyts;
	}

	public Long getWrksl() {
		return this.wrksl;
	}

	public void setWrksl(Long wrksl) {
		this.wrksl = wrksl;
	}

	public String getBz1() {
		return this.bz1;
	}

	public void setBz1(String bz1) {
		this.bz1 = bz1;
	}

	public String getBxfws() {
		return this.bxfws;
	}

	public void setBxfws(String bxfws) {
		this.bxfws = bxfws;
	}

	public Date getXxbrq() {
		return this.xxbrq;
	}

	public void setXxbrq(Date xxbrq) {
		this.xxbrq = xxbrq;
	}

	public String getBz2() {
		return this.bz2;
	}

	public void setBz2(String bz2) {
		this.bz2 = bz2;
	}

	public String getFybh() {
		return this.fybh;
	}

	public void setFybh(String fybh) {
		this.fybh = fybh;
	}

	public Double getSqfy() {
		return this.sqfy;
	}

	public void setSqfy(Double sqfy) {
		this.sqfy = sqfy;
	}

	public Double getSpje() {
		return this.spje;
	}

	public void setSpje(Double spje) {
		this.spje = spje;
	}

	public Double getYbxje() {
		return this.ybxje;
	}

	public void setYbxje(Double ybxje) {
		this.ybxje = ybxje;
	}

	public String getBz3() {
		return this.bz3;
	}

	public void setBz3(String bz3) {
		this.bz3 = bz3;
	}

	public Date getCgrq() {
		return this.cgrq;
	}

	public void setCgrq(Date cgrq) {
		this.cgrq = cgrq;
	}

	public String getCgdbodyid() {
		return this.cgdbodyid;
	}

	public void setCgdbodyid(String cgdbodyid) {
		this.cgdbodyid = cgdbodyid;
	}

	public String getGrsqdbodyid() {
		return this.grsqdbodyid;
	}

	public void setGrsqdbodyid(String grsqdbodyid) {
		this.grsqdbodyid = grsqdbodyid;
	}

	public String getSqrid() {
		return this.sqrid;
	}

	public void setSqrid(String sqrid) {
		this.sqrid = sqrid;
	}

	public String getSqrmc() {
		return this.sqrmc;
	}

	public void setSqrmc(String sqrmc) {
		this.sqrmc = sqrmc;
	}

	public String getPdpc() {
		return this.pdpc;
	}

	public void setPdpc(String pdpc) {
		this.pdpc = pdpc;
	}

	public String getZczt() {
		return this.zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public Date getJylyrq() {
		return this.jylyrq;
	}

	public void setJylyrq(Date jylyrq) {
		this.jylyrq = jylyrq;
	}

	public Date getJydqrq() {
		return this.jydqrq;
	}

	public void setJydqrq(Date jydqrq) {
		this.jydqrq = jydqrq;
	}

	public Double getWxfy() {
		return this.wxfy;
	}

	public void setWxfy(Double wxfy) {
		this.wxfy = wxfy;
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

	public String getSyzt() {
		return this.syzt;
	}

	public void setSyzt(String syzt) {
		this.syzt = syzt;
	}

	public String getXlh() {
		return this.xlh;
	}

	public void setXlh(String xlh) {
		this.xlh = xlh;
	}

	public String getFdjbh() {
		return this.fdjbh;
	}

	public void setFdjbh(String fdjbh) {
		this.fdjbh = fdjbh;
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

	public String getSszg() {
		return this.sszg;
	}

	public void setSszg(String sszg) {
		this.sszg = sszg;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getSqbmmc() {
		return sqbmmc;
	}

	public void setSqbmmc(String sqbmmc) {
		this.sqbmmc = sqbmmc;
	}

	public String getSqbmid() {
		return sqbmid;
	}

	public void setSqbmid(String sqbmid) {
		this.sqbmid = sqbmid;
	}

	public String getTxmbh() {
		return txmbh;
	}

	public void setTxmbh(String txmbh) {
		this.txmbh = txmbh;
	}

}