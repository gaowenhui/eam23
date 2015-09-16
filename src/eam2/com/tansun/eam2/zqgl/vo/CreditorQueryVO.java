package com.tansun.eam2.zqgl.vo;

import java.io.Serializable;
import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;



public class CreditorQueryVO extends CommonBO implements Serializable{

	@Override
	public String getMid() {
		return null;
	}
	//债务人编号
	private String zwrid;
	//币种
	private String bz;
	//是否核销
	private String fshx;
	//债务人名称
	private String zwrmc;
	//购入债权余额 大于等于
	private String zqyedy;
	//购入债权余额 小于
	private String zqyexy;
	//购入债权余额 大于等于
	private Double zqyedy1;
	//购入债权余额 小于
	private Double zqyexy2;
	
	//合同终止日期
	private String htdqBegin;
	
	private Date beginDate;
	//合同终止日期
	private String htdqEnd;
	//担保合同金额 
	private String dbhtjedy;
	//担保合同金额 
	private String dbhtjexy;
	//省份
	private String sf;
	//债权种类
	private String zqzl;
	//对价转让
	private String djzrfydy;
	//对价转让
	private String djzrfyxy;

	private String sign;
	
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getFshx() {
		return fshx;
	}
	public void setFshx(String fshx) {
		this.fshx = fshx;
	}
	public String getZwrmc() {
		return zwrmc;
	}
	public void setZwrmc(String zwrmc) {
		this.zwrmc = zwrmc;
	}
	public String getZqyedy() {
		return zqyedy;
	}
	public void setZqyedy(String zqyedy) {
		this.zqyedy = zqyedy;
	}
	public String getZqyexy() {
		return zqyexy;
	}
	public void setZqyexy(String zqyexy) {
		this.zqyexy = zqyexy;
	}
	public String getHtdqBegin() {
		return htdqBegin;
	}
	public void setHtdqBegin(String htdqBegin) {
		this.htdqBegin = htdqBegin;
	}
	public String getHtdqEnd() {
		return htdqEnd;
	}
	public void setHtdqEnd(String htdqEnd) {
		this.htdqEnd = htdqEnd;
	}
	public String getDbhtjedy() {
		return dbhtjedy;
	}
	public void setDbhtjedy(String dbhtjedy) {
		this.dbhtjedy = dbhtjedy;
	}
	public String getDbhtjexy() {
		return dbhtjexy;
	}
	public void setDbhtjexy(String dbhtjexy) {
		this.dbhtjexy = dbhtjexy;
	}
	public String getSf() {
		return sf;
	}
	public void setSf(String sf) {
		this.sf = sf;
	}
	public String getZqzl() {
		return zqzl;
	}
	public void setZqzl(String zqzl) {
		this.zqzl = zqzl;
	}
	public String getDjzrfydy() {
		return djzrfydy;
	}
	public void setDjzrfydy(String djzrfydy) {
		this.djzrfydy = djzrfydy;
	}
	public String getDjzrfyxy() {
		return djzrfyxy;
	}
	public void setDjzrfyxy(String djzrfyxy) {
		this.djzrfyxy = djzrfyxy;
	}
	public String getZwrid() {
		return zwrid;
	}
	public void setZwrid(String zwrid) {
		this.zwrid = zwrid;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Double getZqyedy1() {
		return zqyedy1;
	}
	public void setZqyedy1(Double zqyedy1) {
		this.zqyedy1 = zqyedy1;
	}
	public Double getZqyexy2() {
		return zqyexy2;
	}
	public void setZqyexy2(Double zqyexy2) {
		this.zqyexy2 = zqyexy2;
	}
 
}
