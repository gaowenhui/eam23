package com.tansun.eam2.common.model.orm.bo;

/**
 * WtdkEndInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class WtdkEndInfo extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String id;
	private String headId;
	private String fundAccount;
	private String khbh;
	private String khmc;
	private Double kyye;
	private Double zhye;
	private Double dkzhye;

	// private String spjg;
	// private String bz;

	// Constructors

	/** default constructor */
	public WtdkEndInfo() {
	}

	/** full constructor */
	public WtdkEndInfo(String headId, String fundAccount, String khbh,
			String khmc, Double kyye, Double zhye, Double dkzhye) {
		this.headId = headId;
		this.fundAccount = fundAccount;
		this.khbh = khbh;
		this.khmc = khmc;
		this.kyye = kyye;
		this.zhye = zhye;
		// this.spjg = spjg;
		// this.bz = bz;
		this.dkzhye = dkzhye;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeadId() {
		return this.headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getFundAccount() {
		return this.fundAccount;
	}

	public void setFundAccount(String fundAccount) {
		this.fundAccount = fundAccount;
	}

	public String getKhbh() {
		return this.khbh;
	}

	public void setKhbh(String khbh) {
		this.khbh = khbh;
	}

	public String getKhmc() {
		return this.khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public Double getKyye() {
		return kyye;
	}

	public void setKyye(Double kyye) {
		this.kyye = kyye;
	}

	public Double getZhye() {
		return zhye;
	}

	public void setZhye(Double zhye) {
		this.zhye = zhye;
	}

	public Double getDkzhye() {
		return dkzhye;
	}

	public void setDkzhye(Double dkzhye) {
		this.dkzhye = dkzhye;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}