package com.tansun.eam2.common.model.orm.bo;

/**
 * JyzcPdkpXx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class JyzcPdkpXx extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -455705915282514401L;
	private String id;
	private String cldId;
	private String zcId;
	private String zcLsbId;
	private String kpId;
	private String cardcode;
	private String zcname;
	private String glbm;
	private String usepartment;
	private String firstbranch;
	private Double ybyz;
	private String spzt;
	private String pdzt;

	// Constructors

	/** default constructor */
	public JyzcPdkpXx() {
	}

	/** full constructor */
	public JyzcPdkpXx(String cldId, String zcId, String zcLsbId, String kpId,
			String cardcode, String zcname, String glbm, String usepartment,
			String firstbranch, String spzt) {
		this.cldId = cldId;
		this.zcId = zcId;
		this.zcLsbId = zcLsbId;
		this.kpId = kpId;
		this.cardcode = cardcode;
		this.zcname = zcname;
		this.glbm = glbm;
		this.usepartment = usepartment;
		this.firstbranch = firstbranch;
		this.spzt = spzt;
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

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getZcLsbId() {
		return this.zcLsbId;
	}

	public void setZcLsbId(String zcLsbId) {
		this.zcLsbId = zcLsbId;
	}

	public String getKpId() {
		return this.kpId;
	}

	public void setKpId(String kpId) {
		this.kpId = kpId;
	}

	public String getCardcode() {
		return this.cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getZcname() {
		return this.zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getGlbm() {
		return this.glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getUsepartment() {
		return this.usepartment;
	}

	public void setUsepartment(String usepartment) {
		this.usepartment = usepartment;
	}

	public String getFirstbranch() {
		return this.firstbranch;
	}

	public void setFirstbranch(String firstbranch) {
		this.firstbranch = firstbranch;
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

	public Double getYbyz() {
		return ybyz;
	}

	public void setYbyz(Double ybyz) {
		this.ybyz = ybyz;
	}

	public String getPdzt() {
		return pdzt;
	}

	public void setPdzt(String pdzt) {
		this.pdzt = pdzt;
	}

}