package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

public class JyzcHtqxBodyVO {
  //清算批次
	private String qspc;
//合同类型
	private String htlx;
	//交易对象
	private String jydx;
	//清算日期 起始日期
	private Date beginTime;
	 //合同编码
	private Date endTime;
	//拟稿部门
	private String ngbm;
	//资产编码
	private String zcbm;
   //资产名称
   private String zcmc;

public String getQspc() {
	return qspc;
}
public void setQspc(String qspc) {
	this.qspc = qspc;
}
public String getHtlx() {
	return htlx;
}
public void setHtlx(String htlx) {
	this.htlx = htlx;
}
public String getJydx() {
	return jydx;
}
public void setJydx(String jydx) {
	this.jydx = jydx;
}
public Date getBeginTime() {
	return beginTime;
}
public void setBeginTime(Date beginTime) {
	this.beginTime = beginTime;
}
public Date getEndTime() {
	return endTime;
}
public void setEndTime(Date endTime) {
	this.endTime = endTime;
}
public String getNgbm() {
	return ngbm;
}
public void setNgbm(String ngbm) {
	this.ngbm = ngbm;
}
public String getZcbm() {
	return zcbm;
}
public void setZcbm(String zcbm) {
	this.zcbm = zcbm;
}
public String getZcmc() {
	return zcmc;
}
public void setZcmc(String zcmc) {
	this.zcmc = zcmc;
}
   
   
   
}
