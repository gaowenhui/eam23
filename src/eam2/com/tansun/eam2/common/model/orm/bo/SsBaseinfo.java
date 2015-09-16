package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import org.springframework.stereotype.Service;

/**
 * SsBaseinfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class SsBaseinfo extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String id; 
	//案件编号
	private String ajbh;
	//省份ID,来自CODE表
	private String sfid;
	private String sfbm;
	private String sfmc;
	//涉案资产类别ID,来自CODE表
	private String sazclbid;
	private String sazclbbm;
	private String sazclbmc;
	
	
	private String sazcid;
	private String sazcmc;
	private Date larq;
	private Date qssj;
	private String sslxid;
	private String sslxbm;
	private String sslxmc;
	private String yg;
	private String bg;
	private String dsr;
	private String ay;
	private Double bde;
	private Double zxhk;
	private String ssqq;
	private String bhglh;
	private String jaztid;
	private String jaztbm;
	private String jaztmc;
	private String jtsfwdsr;
	private String jbr;
	private String aqjs;
	private String lrrid;
	private String lrr;
	private Date lrsj;
	private String ssztid;
	private String ssztbm;
	private String ssztmc;
	private String bz;
	private String dlr;
	private String ajlbid;
	private String ajlbmc;
	private String ajlbbm;
	private Date sarq;
	//地级市编号
	private String djsbm;
	//地级市名称
	private String djsmc;
	private String zczsbId;
	
	// Constructors

	/** default constructor */
	public SsBaseinfo() {
	}

	/** full constructor */
	public SsBaseinfo(String ajbh, String sfid, String sfbm, String sfmc,
			String sazclbid, String sazclbbm, String sazclbmc, String sazcid,
			String sazcmc, Date larq, Date qssj, String sslxid, String sslxbm,
			String sslxmc, String yg, String bg, String dsr, String ay,
			Double bde, Double zxhk, String ssqq, String bhglh, String jaztid,
			String jaztbm, String jaztmc, String jtsfwdsr, String jbr,
			String aqjs, String lrrid, String lrr, Date lrsj, String ssztid,
			String ssztbm, String ssztmc, String bz ,String wtr,String ajlbid ,String ajlbbm,
			String ajlbmc,Date saqr,String djsbm,String djsmc , String zczsbId) {
		this.ajbh = ajbh;
		this.sfid = sfid;
		this.sfbm = sfbm;
		this.sfmc = sfmc;
		this.sazclbid = sazclbid;
		this.sazclbbm = sazclbbm;
		this.sazclbmc = sazclbmc;
		this.sazcid = sazcid;
		this.sazcmc = sazcmc;
		this.larq = larq;
		this.qssj = qssj;
		this.sslxid = sslxid;
		this.sslxbm = sslxbm;
		this.sslxmc = sslxmc;
		this.yg = yg;
		this.bg = bg;
		this.dsr = dsr;
		this.ay = ay;
		this.bde = bde;
		this.zxhk = zxhk;
		this.ssqq = ssqq;
		this.bhglh = bhglh;
		this.jaztid = jaztid;
		this.jaztbm = jaztbm;
		this.jaztmc = jaztmc;
		this.jtsfwdsr = jtsfwdsr;
		this.jbr = jbr;
		this.aqjs = aqjs;
		this.lrrid = lrrid;
		this.lrr = lrr;
		this.lrsj = lrsj;
		this.ssztid = ssztid;
		this.ssztbm = ssztbm;
		this.ssztmc = ssztmc;
		this.bz = bz;
		this.dlr=dlr;
		this.ajlbid=ajlbid;
		this.ajlbmc=ajlbmc;
		this.ajlbbm=ajlbbm;
		this.sarq=sarq;
		this.djsbm = djsbm;
		this.djsmc = djsmc;
		this.zczsbId = zczsbId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAjbh() {
		return this.ajbh;
	}

	public void setAjbh(String ajbh) {
		this.ajbh = ajbh;
	}

	public String getSfid() {
		return this.sfid;
	}

	public void setSfid(String sfid) {
		this.sfid = sfid;
	}

	public String getSfbm() {
		return this.sfbm;
	}

	public void setSfbm(String sfbm) {
		this.sfbm = sfbm;
	}

	public String getSfmc() {
		return this.sfmc;
	}

	public void setSfmc(String sfmc) {
		this.sfmc = sfmc;
	}

	public String getSazclbid() {
		return this.sazclbid;
	}

	public void setSazclbid(String sazclbid) {
		this.sazclbid = sazclbid;
	}

	public String getSazclbbm() {
		return this.sazclbbm;
	}

	public void setSazclbbm(String sazclbbm) {
		this.sazclbbm = sazclbbm;
	}

	public String getSazclbmc() {
		return this.sazclbmc;
	}

	public void setSazclbmc(String sazclbmc) {
		this.sazclbmc = sazclbmc;
	}

	public String getSazcid() {
		return this.sazcid;
	}

	public void setSazcid(String sazcid) {
		this.sazcid = sazcid;
	}

	public String getSazcmc() {
		return this.sazcmc;
	}

	public void setSazcmc(String sazcmc) {
		this.sazcmc = sazcmc;
	}

	public Date getLarq() {
		return this.larq;
	}

	public void setLarq(Date larq) {
		this.larq = larq;
	}

	public Date getQssj() {
		return this.qssj;
	}

	public void setQssj(Date qssj) {
		this.qssj = qssj;
	}

	public String getSslxid() {
		return this.sslxid;
	}

	public void setSslxid(String sslxid) {
		this.sslxid = sslxid;
	}

	public String getSslxbm() {
		return this.sslxbm;
	}

	public void setSslxbm(String sslxbm) {
		this.sslxbm = sslxbm;
	}

	public String getSslxmc() {
		return this.sslxmc;
	}

	public void setSslxmc(String sslxmc) {
		this.sslxmc = sslxmc;
	}

	public String getYg() {
		return this.yg;
	}

	public void setYg(String yg) {
		this.yg = yg;
	}

	public String getBg() {
		return this.bg;
	}

	public void setBg(String bg) {
		this.bg = bg;
	}

	public String getDsr() {
		return this.dsr;
	}

	public void setDsr(String dsr) {
		this.dsr = dsr;
	}

	public String getAy() {
		return this.ay;
	}

	public void setAy(String ay) {
		this.ay = ay;
	}

	public Double getBde() {
		return this.bde;
	}

	public void setBde(Double bde) {
		this.bde = bde;
	}

	public Double getZxhk() {
		return this.zxhk;
	}

	public void setZxhk(Double zxhk) {
		this.zxhk = zxhk;
	}

	public String getSsqq() {
		return this.ssqq;
	}

	public void setSsqq(String ssqq) {
		this.ssqq = ssqq;
	}

	public String getBhglh() {
		return this.bhglh;
	}

	public void setBhglh(String bhglh) {
		this.bhglh = bhglh;
	}

	public String getJaztid() {
		return this.jaztid;
	}

	public void setJaztid(String jaztid) {
		this.jaztid = jaztid;
	}

	public String getJaztbm() {
		return this.jaztbm;
	}

	public void setJaztbm(String jaztbm) {
		this.jaztbm = jaztbm;
	}

	public String getJaztmc() {
		return this.jaztmc;
	}

	public void setJaztmc(String jaztmc) {
		this.jaztmc = jaztmc;
	}

	public String getJtsfwdsr() {
		return this.jtsfwdsr;
	}

	public void setJtsfwdsr(String jtsfwdsr) {
		this.jtsfwdsr = jtsfwdsr;
	}

	public String getJbr() {
		return this.jbr;
	}

	public void setJbr(String jbr) {
		this.jbr = jbr;
	}

	public String getAqjs() {
		return this.aqjs;
	}

	public void setAqjs(String aqjs) {
		this.aqjs = aqjs;
	}

	public String getLrrid() {
		return this.lrrid;
	}

	public void setLrrid(String lrrid) {
		this.lrrid = lrrid;
	}

	public String getLrr() {
		return this.lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public Date getLrsj() {
		return this.lrsj;
	}

	public void setLrsj(Date lrsj) {
		this.lrsj = lrsj;
	}

	public String getSsztid() {
		return this.ssztid;
	}

	public void setSsztid(String ssztid) {
		this.ssztid = ssztid;
	}

	public String getSsztbm() {
		return this.ssztbm;
	}

	public void setSsztbm(String ssztbm) {
		this.ssztbm = ssztbm;
	}

	public String getSsztmc() {
		return this.ssztmc;
	}

	public void setSsztmc(String ssztmc) {
		this.ssztmc = ssztmc;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}



	public String getDlr() {
		return dlr;
	}

	public void setDlr(String dlr) {
		this.dlr = dlr;
	}

	public String getAjlbid() {
		return ajlbid;
	}

	public void setAjlbid(String ajlbid) {
		this.ajlbid = ajlbid;
	}

	public String getAjlbmc() {
		return ajlbmc;
	}

	public void setAjlbmc(String ajlbmc) {
		this.ajlbmc = ajlbmc;
	}

	public String getAjlbbm() {
		return ajlbbm;
	}

	public void setAjlbbm(String ajlbbm) {
		this.ajlbbm = ajlbbm;
	}

	public Date getSarq() {
		return sarq;
	}

	public void setSarq(Date sarq) {
		this.sarq = sarq;
	}

	public String getDjsbm() {
		return djsbm;
	}

	public void setDjsbm(String djsbm) {
		this.djsbm = djsbm;
	}

	public String getDjsmc() {
		return djsmc;
	}

	public void setDjsmc(String djsmc) {
		this.djsmc = djsmc;
	}

	public String getZczsbId() {
		return zczsbId;
	}

	public void setZczsbId(String zczsbId) {
		this.zczsbId = zczsbId;
	}

}