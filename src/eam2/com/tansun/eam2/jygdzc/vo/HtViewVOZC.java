package com.tansun.eam2.jygdzc.vo;

import com.tansun.eam2.common.model.orm.bo.JyzcXx;

/**
 * 合同需要展示数据项
 * @author lihuan
 *
 */
public class HtViewVOZC extends JyzcXx {
	//主卡片编码
	private String  zkpbh;
	//主卡片名称
	private String zkpmc;
	//原币原值
	private String ybyz;
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
	public String getYbyz() {
		return ybyz;
	}
	public void setYbyz(String ybyz) {
		this.ybyz = ybyz;
	}
	
	
	

}
