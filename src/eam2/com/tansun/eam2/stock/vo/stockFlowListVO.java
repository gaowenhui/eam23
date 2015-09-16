package com.tansun.eam2.stock.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class stockFlowListVO extends CommonBO {

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	private String sheadId;
	private String bdzt;
	private String ngbmmc;
	private String ngrmc;
	private String ngrq;
	private String zqmc;
	private String stock_id;
	public String getSheadId() {
		return sheadId;
	}
	public void setSheadId(String sheadId) {
		this.sheadId = sheadId;
	}
	public String getBdzt() {
		return bdzt;
	}
	public void setBdzt(String bdzt) {
		this.bdzt = bdzt;
	}
	public String getNgbmmc() {
		return ngbmmc;
	}
	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}
	public String getNgrmc() {
		return ngrmc;
	}
	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}
	public String getNgrq() {
		return ngrq;
	}
	public void setNgrq(String ngrq) {
		this.ngrq = ngrq;
	}
	public String getZqmc() {
		return zqmc;
	}
	public void setZqmc(String zqmc) {
		this.zqmc = zqmc;
	}
	public String getStock_id() {
		return stock_id;
	}
	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}
}
