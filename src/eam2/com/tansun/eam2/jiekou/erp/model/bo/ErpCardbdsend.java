package com.tansun.eam2.jiekou.erp.model.bo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * ErpCardbdsend generated by MyEclipse Persistence Tools
 */

public class ErpCardbdsend extends CommonBO implements java.io.Serializable {

	// Fields

	private Long id;
	private String assetCode;
	private String cardCode;
	private String eamcode;
	private String erpcode;
	private String erppk;
	private String sfbh;
	private String sptg;

	// Constructors

	/** default constructor */
	public ErpCardbdsend() {
	}

	/** full constructor */
	public ErpCardbdsend(String assetCode, String cardCode, String eamcode,
			String erpcode, String erppk, String sfbh, String sptg) {
		this.assetCode = assetCode;
		this.cardCode = cardCode;
		this.eamcode = eamcode;
		this.erpcode = erpcode;
		this.erppk = erppk;
		this.sfbh = sfbh;
		this.sptg = sptg;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAssetCode() {
		return this.assetCode;
	}

	public void setAssetCode(String assetCode) {
		this.assetCode = assetCode;
	}

	public String getCardCode() {
		return this.cardCode;
	}

	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}

	public String getEamcode() {
		return this.eamcode;
	}

	public void setEamcode(String eamcode) {
		this.eamcode = eamcode;
	}

	public String getErpcode() {
		return this.erpcode;
	}

	public void setErpcode(String erpcode) {
		this.erpcode = erpcode;
	}

	public String getErppk() {
		return this.erppk;
	}

	public void setErppk(String erppk) {
		this.erppk = erppk;
	}

	public String getSfbh() {
		return this.sfbh;
	}

	public void setSfbh(String sfbh) {
		this.sfbh = sfbh;
	}

	public String getSptg() {
		return this.sptg;
	}

	public void setSptg(String sptg) {
		this.sptg = sptg;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}