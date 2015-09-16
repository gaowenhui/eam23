package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CzXmjaBody entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzXmjaBody extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = 8493626020065569014L;
	private String id;
	private String cldId;
	private String xmId;
	private Double sjczsr;
	private Double sjczfy;
	private String sfqsxy;
	private Date xyqssj;
	private String kpsfjs;
	private String fysfjq;
	private String sfyylwt;
	private String beizhu;
	private Date sqrq;
	private String spzt;
	private String sfqbja;
	
	// Constructors

	/** default constructor */
	public CzXmjaBody() {
	}

	/** full constructor */
	public CzXmjaBody(String cldId, String xmId, Double sjczsr, Double sjczfy,
			String sfqsxy, Date xyqssj, String kpsfjs, String fysfjq,
			String sfyylwt, String beizhu, Date sqrq, String spzt,String sfqbja) {
		this.cldId = cldId;
		this.xmId = xmId;
		this.sjczsr = sjczsr;
		this.sjczfy = sjczfy;
		this.sfqsxy = sfqsxy;
		this.xyqssj = xyqssj;
		this.kpsfjs = kpsfjs;
		this.fysfjq = fysfjq;
		this.sfyylwt = sfyylwt;
		this.beizhu = beizhu;
		this.sqrq = sqrq;
		this.spzt = spzt;
		this.sfqbja = sfqbja;
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

	public String getXmId() {
		return this.xmId;
	}

	public void setXmId(String xmId) {
		this.xmId = xmId;
	}

	public Double getSjczsr() {
		return this.sjczsr;
	}

	public void setSjczsr(Double sjczsr) {
		this.sjczsr = sjczsr;
	}

	public Double getSjczfy() {
		return this.sjczfy;
	}

	public void setSjczfy(Double sjczfy) {
		this.sjczfy = sjczfy;
	}

	public String getSfqsxy() {
		return this.sfqsxy;
	}

	public void setSfqsxy(String sfqsxy) {
		this.sfqsxy = sfqsxy;
	}

	public Date getXyqssj() {
		return this.xyqssj;
	}

	public void setXyqssj(Date xyqssj) {
		this.xyqssj = xyqssj;
	}

	public String getKpsfjs() {
		return this.kpsfjs;
	}

	public void setKpsfjs(String kpsfjs) {
		this.kpsfjs = kpsfjs;
	}

	public String getFysfjq() {
		return this.fysfjq;
	}

	public void setFysfjq(String fysfjq) {
		this.fysfjq = fysfjq;
	}

	public String getSfyylwt() {
		return this.sfyylwt;
	}

	public void setSfyylwt(String sfyylwt) {
		this.sfyylwt = sfyylwt;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Date getSqrq() {
		return this.sqrq;
	}

	public void setSqrq(Date sqrq) {
		this.sqrq = sqrq;
	}

	public String getSpzt() {
		return this.spzt;
	}

	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getSfqbja() {
		return sfqbja;
	}

	public void setSfqbja(String sfqbja) {
		this.sfqbja = sfqbja;
	}

}