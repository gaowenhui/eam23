package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * BizBackConfirmHead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class BizBackConfirmHead extends CommonBO implements java.io.Serializable {

	// Fields

	private String id;
	private String cashid;
	private String qrbmbh;
	private String qrbmmc;
	private String qrrbh;
	private String qrrmc;
	private String bmfzrbh;
	private String bmfzrmc;
	private String isbmhk;
	private String qrdbh;
	private String qrdlx;
	private Date qrrq;
	private String bz0;
	private String sfzzhk;

	// Constructors

	/** default constructor */
	public BizBackConfirmHead() {
	}

	/** minimal constructor */
	public BizBackConfirmHead(String id) {
		this.id = id;
	}

	/** full constructor */
	public BizBackConfirmHead(String id, String cashid, String qrbmbh,
			String qrbmmc, String qrrbh, String qrrmc, String bmfzrbh,
			String bmfzrmc, String isbmhk, String qrdbh, String qrdlx,
			Date qrrq, String bz0, String sfzzhk) {
		this.id = id;
		this.cashid = cashid;
		this.qrbmbh = qrbmbh;
		this.qrbmmc = qrbmmc;
		this.qrrbh = qrrbh;
		this.qrrmc = qrrmc;
		this.bmfzrbh = bmfzrbh;
		this.bmfzrmc = bmfzrmc;
		this.isbmhk = isbmhk;
		this.qrdbh = qrdbh;
		this.qrdlx = qrdlx;
		this.qrrq = qrrq;
		this.bz0 = bz0;
		this.sfzzhk = sfzzhk;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCashid() {
		return this.cashid;
	}

	public void setCashid(String cashid) {
		this.cashid = cashid;
	}

	public String getQrbmbh() {
		return this.qrbmbh;
	}

	public void setQrbmbh(String qrbmbh) {
		this.qrbmbh = qrbmbh;
	}

	public String getQrbmmc() {
		return this.qrbmmc;
	}

	public void setQrbmmc(String qrbmmc) {
		this.qrbmmc = qrbmmc;
	}

	public String getQrrbh() {
		return this.qrrbh;
	}

	public void setQrrbh(String qrrbh) {
		this.qrrbh = qrrbh;
	}

	public String getQrrmc() {
		return this.qrrmc;
	}

	public void setQrrmc(String qrrmc) {
		this.qrrmc = qrrmc;
	}

	public String getBmfzrbh() {
		return this.bmfzrbh;
	}

	public void setBmfzrbh(String bmfzrbh) {
		this.bmfzrbh = bmfzrbh;
	}

	public String getBmfzrmc() {
		return this.bmfzrmc;
	}

	public void setBmfzrmc(String bmfzrmc) {
		this.bmfzrmc = bmfzrmc;
	}

	public String getIsbmhk() {
		return this.isbmhk;
	}

	public void setIsbmhk(String isbmhk) {
		this.isbmhk = isbmhk;
	}

	public String getQrdbh() {
		return this.qrdbh;
	}

	public void setQrdbh(String qrdbh) {
		this.qrdbh = qrdbh;
	}

	public String getQrdlx() {
		return this.qrdlx;
	}

	public void setQrdlx(String qrdlx) {
		this.qrdlx = qrdlx;
	}

	public Date getQrrq() {
		return this.qrrq;
	}

	public void setQrrq(Date qrrq) {
		this.qrrq = qrrq;
	}

	public String getBz0() {
		return this.bz0;
	}

	public void setBz0(String bz0) {
		this.bz0 = bz0;
	}

	public String getSfzzhk() {
		return this.sfzzhk;
	}

	public void setSfzzhk(String sfzzhk) {
		this.sfzzhk = sfzzhk;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}