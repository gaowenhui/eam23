package com.tansun.eam2.common.model.orm.bo;

/**
 * StockList200906 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockList extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String id;
	//分行编码
	private String fhbm;
	//分行名称
	private String fhmc;
	//项目名称
	private String xmmc;
	//2009年6月30日账面值
	private Double y2009m6d30zmz;
	//2006年12月31日账面值原值
	private Double y2006m12d31zmzyz;
	//2006年12月31日账面值减值准备
	private Double y2006m12d31zmzjzzb;
	//项目名称确认
	private String xmmcqr;
	//备注
	private String bz;

	// Constructors

	/** default constructor */
	public StockList() {
	}

	/** full constructor */
	public StockList(String fhbm, String fhmc, String xmmc,
			Double y2009m6d30zmz, Double y2006m12d31zmzyz,
			Double y2006m12d31zmzjzzb, String xmmcqr, String bz) {
		this.fhbm = fhbm;
		this.fhmc = fhmc;
		this.xmmc = xmmc;
		this.y2009m6d30zmz = y2009m6d30zmz;
		this.y2006m12d31zmzyz = y2006m12d31zmzyz;
		this.y2006m12d31zmzjzzb = y2006m12d31zmzjzzb;
		this.xmmcqr = xmmcqr;
		this.bz = bz;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFhbm() {
		return this.fhbm;
	}

	public void setFhbm(String fhbm) {
		this.fhbm = fhbm;
	}

	public String getFhmc() {
		return this.fhmc;
	}

	public void setFhmc(String fhmc) {
		this.fhmc = fhmc;
	}

	public String getXmmc() {
		return this.xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public Double getY2009m6d30zmz() {
		return this.y2009m6d30zmz;
	}

	public void setY2009m6d30zmz(Double y2009m6d30zmz) {
		this.y2009m6d30zmz = y2009m6d30zmz;
	}

	public Double getY2006m12d31zmzyz() {
		return this.y2006m12d31zmzyz;
	}

	public void setY2006m12d31zmzyz(Double y2006m12d31zmzyz) {
		this.y2006m12d31zmzyz = y2006m12d31zmzyz;
	}

	public Double getY2006m12d31zmzjzzb() {
		return this.y2006m12d31zmzjzzb;
	}

	public void setY2006m12d31zmzjzzb(Double y2006m12d31zmzjzzb) {
		this.y2006m12d31zmzjzzb = y2006m12d31zmzjzzb;
	}

	public String getXmmcqr() {
		return this.xmmcqr;
	}

	public void setXmmcqr(String xmmcqr) {
		this.xmmcqr = xmmcqr;
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

}