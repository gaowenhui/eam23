package com.tansun.eam2.stock.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class StockListVO extends CommonBO {

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private String dqr;
	private String zqmc;
	private String jhfhmc;
	private String zqzlmc;
	private String zqmz;
	private String id;
	private String stockid;
	
	private String xmId;
	
	private String fhmc;
	
	private String xmmc;
	
	private Date shidian;
	
	private String beizhu;
	
	private String jzzb;
	
	private String zmz;
	
	private String xmmcqr;
	
	public String getXmId() {
		return xmId;
	}
	public void setXmId(String xmId) {
		this.xmId = xmId;
	}
	public String getFhmc() {
		return fhmc;
	}
	public void setFhmc(String fhmc) {
		this.fhmc = fhmc;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public Date getShidian() {
		return shidian;
	}
	public void setShidian(Date shidian) {
		this.shidian = shidian;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getJzzb() {
		return jzzb;
	}
	public void setJzzb(String jzzb) {
		this.jzzb = jzzb;
	}
	public String getZmz() {
		return zmz;
	}
	public void setZmz(String zmz) {
		this.zmz = zmz;
	}
	public String getStockid() {
		return stockid;
	}
	public void setStockid(String stockid) {
		this.stockid = stockid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDqr() {
		return dqr;
	}
	public void setDqr(String dqr) {
		this.dqr = dqr;
	}
	public String getZqmz() {
		return zqmz;
	}
	public void setZqmz(String zqmz) {
		this.zqmz = zqmz;
	}
	public String getZqmc() {
		return zqmc;
	}
	public void setZqmc(String zqmc) {
		this.zqmc = zqmc;
	}
	public String getJhfhmc() {
		return jhfhmc;
	}
	public void setJhfhmc(String jhfhmc) {
		this.jhfhmc = jhfhmc;
	}
	public String getZqzlmc() {
		return zqzlmc;
	}
	public void setZqzlmc(String zqzlmc) {
		this.zqzlmc = zqzlmc;
	}
	public String getXmmcqr() {
		return xmmcqr;
	}
	public void setXmmcqr(String xmmcqr) {
		this.xmmcqr = xmmcqr;
	}


}