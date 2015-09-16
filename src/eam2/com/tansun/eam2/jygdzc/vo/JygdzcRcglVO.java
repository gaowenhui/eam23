package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 固定资产，日常管理，查询临时信息表，列表
 * @author lantb
 *
 */
public class JygdzcRcglVO extends CommonBO{

	private String lsbid;	//资产临时表id	
	private String zcbh;	//资产编号
	private String zcmc;	//资产名称
	private String cfdd;	//存放地点
	private String yz;		//原值
	private String sqje;	//申请金额
	private String sdje;	//审定金额
	private String zkpbh;	//主卡片编号
	private String zkpmc;	//主卡片名称
	private String ysynx;	//已使用年限
	private String sksynx;	//尚可使用年限
	
	public String getZcbh() {
		return zcbh;
	}
	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}
	public String getZcmc() {
		return zcmc;
	}
	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}
	public String getCfdd() {
		return cfdd;
	}
	public void setCfdd(String cfdd) {
		this.cfdd = cfdd;
	}
	public String getYz() {
		return yz;
	}
	public void setYz(String yz) {
		this.yz = yz;
	}
	public String getSqje() {
		return sqje;
	}
	public void setSqje(String sqje) {
		this.sqje = sqje;
	}
	public String getSdje() {
		return sdje;
	}
	public void setSdje(String sdje) {
		this.sdje = sdje;
	}
	public String getZkpbh() {
		return zkpbh;
	}
	public void setZkpbh(String zkpbh) {
		this.zkpbh = zkpbh;
	}
	public String getZkpmc() {
		return zkpmc;
	}
	public void setZkpmc(String zkpmc) {
		this.zkpmc = zkpmc;
	}
	public String getYsynx() {
		return ysynx;
	}
	public void setYsynx(String ysynx) {
		this.ysynx = ysynx;
	}
	public String getSksynx() {
		return sksynx;
	}
	public void setSksynx(String sksynx) {
		this.sksynx = sksynx;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getLsbid() {
		return lsbid;
	}
	public void setLsbid(String lsbid) {
		this.lsbid = lsbid;
	}
	
	
}
