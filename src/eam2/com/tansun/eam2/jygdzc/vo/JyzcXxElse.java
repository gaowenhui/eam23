package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JyzcXxElse extends CommonBO{
	//设备名称
	private String sbmc;
	//规格型号
	private String ggxh;
	//生产厂家
	private String sccj;
	//设备计量单位
	private String CJldw;
	//设备数量
	private Long sbsl;
	public String getSbmc() {
		return sbmc;
	}
	public void setSbmc(String sbmc) {
		this.sbmc = sbmc;
	}
	public String getGgxh() {
		return ggxh;
	}
	public void setGgxh(String ggxh) {
		this.ggxh = ggxh;
	}
	public String getSccj() {
		return sccj;
	}
	public void setSccj(String sccj) {
		this.sccj = sccj;
	}
	public String getCJldw() {
		return CJldw;
	}
	public void setCJldw(String jldw) {
		CJldw = jldw;
	}
	public Long getSbsl() {
		return sbsl;
	}
	public void setSbsl(Long sbsl) {
		this.sbsl = sbsl;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
