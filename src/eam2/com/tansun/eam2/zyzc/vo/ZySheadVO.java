package com.tansun.eam2.zyzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class ZySheadVO extends CommonBO {

	private static final long serialVersionUID = -3294458060088631708L;

	private String title;
	private String zzngrq;
	private String zwngrq;
	private String ngrmc;
	private String ngbmmc;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNgrmc() {
		return ngrmc;
	}
	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}
	public String getNgbmmc() {
		return ngbmmc;
	}
	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}
	@Override
	public String getMid() {
		return null;
	}
	public String getZzngrq() {
		return zzngrq;
	}
	public void setZzngrq(String zzngrq) {
		this.zzngrq = zzngrq;
	}
	public String getZwngrq() {
		return zwngrq;
	}
	public void setZwngrq(String zwngrq) {
		this.zwngrq = zwngrq;
	}

}
