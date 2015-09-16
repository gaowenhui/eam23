package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 
 * 合同保险查询
 * 
 * @author lihuan
 * 
 */
public class JjzcHtBxQueryVO  extends CommonBO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4257243883096949156L;
	// 合同编码
	private String htbm;
	// 合同状态
	private String htzt;
	// 合同类型
	private String htlx;
	// 合同新增拟稿部门
	private String htxzngbm;
	// 资产编码
	private String zcbm;
	// 资产名称
	public String zcmc;
	// 合同起始日期
	private Date beginTime1;
	private Date beginTime2;
	// 合同结束日期
	private Date endTime1;
	private Date endTime2;
	// 交易对象
	private String jydx;
	
	//一级委托代理机构
	private String cyjwtjg;
	//二级委托代理机构
	private String cerwtjg;

	
	public String getCyjwtjg() {
		return cyjwtjg;
	}

	public void setCyjwtjg(String cyjwtjg) {
		this.cyjwtjg = cyjwtjg;
	}

	public String getCerwtjg() {
		return cerwtjg;
	}

	public void setCerwtjg(String cerwtjg) {
		this.cerwtjg = cerwtjg;
	}

	public String getHtbm() {
		return htbm;
	}

	public void setHtbm(String htbm) {
		this.htbm = htbm;
	}

	public String getHtzt() {
		return htzt;
	}

	public void setHtzt(String htzt) {
		this.htzt = htzt;
	}

	public String getHtlx() {
		return htlx;
	}

	public void setHtlx(String htlx) {
		this.htlx = htlx;
	}

	public String getHtxzngbm() {
		return htxzngbm;
	}

	public void setHtxzngbm(String htxzngbm) {
		this.htxzngbm = htxzngbm;
	}

	public String getJydx() {
		return jydx;
	}

	public void setJydx(String jydx) {
		this.jydx = jydx;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getZcbm() {
		return zcbm;
	}

	public void setZcbm(String zcbm) {
		this.zcbm = zcbm;
	}

	public Date getBeginTime1() {
		return beginTime1;
	}

	public void setBeginTime1(Date beginTime1) {
		this.beginTime1 = beginTime1;
	}

	public Date getBeginTime2() {
		return beginTime2;
	}

	public void setBeginTime2(Date beginTime2) {
		this.beginTime2 = beginTime2;
	}

	public Date getEndTime1() {
		return endTime1;
	}

	public void setEndTime1(Date endTime1) {
		this.endTime1 = endTime1;
	}

	public Date getEndTime2() {
		return endTime2;
	}

	public void setEndTime2(Date endTime2) {
		this.endTime2 = endTime2;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
