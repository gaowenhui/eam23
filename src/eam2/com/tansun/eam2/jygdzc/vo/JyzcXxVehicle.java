package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JyzcXxVehicle extends CommonBO{
	//车辆牌号
	private String clph;
	//车辆行驶证所有人
	private String clxszsyr;
	//车辆名称及型号规格
	private String clmcjggxh;
	//购置日期
	private String gzrq;
	//启用日期
	private String qyrq;
	//已行驶里程
	private Double yxslc;
	public String getClph() {
		return clph;
	}
	public void setClph(String clph) {
		this.clph = clph;
	}
	public String getClxszsyr() {
		return clxszsyr;
	}
	public void setClxszsyr(String clxszsyr) {
		this.clxszsyr = clxszsyr;
	}
	public String getClmcjggxh() {
		return clmcjggxh;
	}
	public void setClmcjggxh(String clmcjggxh) {
		this.clmcjggxh = clmcjggxh;
	}
	public String getGzrq() {
		return gzrq;
	}
	public void setGzrq(String gzrq) {
		this.gzrq = gzrq;
	}
	public String getQyrq() {
		return qyrq;
	}
	public void setQyrq(String qyrq) {
		this.qyrq = qyrq;
	}
	public Double getYxslc() {
		return yxslc;
	}
	public void setYxslc(Double yxslc) {
		this.yxslc = yxslc;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
