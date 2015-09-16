package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JyzcRiskVO extends CommonBO {
	private String id;
	private String CFxlx;
	private String fxbh;
	private String fxms;
	private String fxzt;
	private String fxkz;
	private String zcId;
	private String cldId;
	private Date lrrq;
	private String lrr;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCFxlx() {
		return CFxlx;
	}
	public void setCFxlx(String fxlx) {
		CFxlx = fxlx;
	}
	public String getFxbh() {
		return fxbh;
	}
	public void setFxbh(String fxbh) {
		this.fxbh = fxbh;
	}
	public String getFxms() {
		return fxms;
	}
	public void setFxms(String fxms) {
		this.fxms = fxms;
	}
	public String getFxzt() {
		return fxzt;
	}
	public  void setFxzt(String fxzt) {
		this.fxzt = fxzt;
	}
	public String getFxkz() {
		return fxkz;
	}
	public void setFxkz(String fxkz) {
		this.fxkz = fxkz;
	}
	public String getZcId() {
		return zcId;
	}
	public void setZcId(String zcId) {
		this.zcId = zcId;
	}
	public String getCldId() {
		return cldId;
	}
	public void setCldId(String cldId) {
		this.cldId = cldId;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public Date getLrrq() {
		return lrrq;
	}
	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}
	public String getLrr() {
		return lrr;
	}
	public void setLrr(String lrr) {
		this.lrr = lrr;
	}
}
