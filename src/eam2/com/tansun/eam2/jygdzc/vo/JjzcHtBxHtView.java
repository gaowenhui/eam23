package com.tansun.eam2.jygdzc.vo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JjzcHtBxHtView extends CommonBO {
	
	private String id;

	 //合同编码
	private String htbm;
	//合同状态
	private String htzt;
	//合同类型
	private String htlx;
	//合同新增拟稿部门
	private String htxzngbm;
	//资产编码
	private String zcbm;
	//资产名称
	public String zcmc;
	//合同起始日期
	private Date beginTime;
	//合同结束日期
	private Date endTime;
	// 交易对象
	private String jydx;
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
	public String getJydx() {
		return jydx;
	}
	public void setJydx(String jydx) {
		this.jydx = jydx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getHtxzngbm() {
		return htxzngbm;
	}
	public void setHtxzngbm(String htxzngbm) {
		this.htxzngbm = htxzngbm;
	}
	
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 根据编号获得合同状态
	 * 
	 * @param strKey
	 * @return
	 */
	public String getHtztStr() {
		Map<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("1", "执行中");
		hashMap.put("2", "待执行");
		hashMap.put("3", "执行完毕");
		return (String) hashMap.get(this.htzt);
	}
	
	/**
	 * 根据编号获得合同类型
	 * 
	 * @param strKey
	 * @return
	 */
	public String getHtlxStr() {
		Map<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("1", "委管合同");
		hashMap.put("2", "租赁合同");
		hashMap.put("3", "车险合同");
		hashMap.put("4", "非车险合同");
		return (String) hashMap.get(this.htlx);
	}
}
