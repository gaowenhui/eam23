package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JyzcExmineVO extends CommonBO {
	
	private String id;
	// 卡片编号
	private String zclx;
	// 卡片编号
	private String kpbh;
	// 卡片名称
	private String kpmc;
	// 核查评估年份
	private String hcpgnf;
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getKpbh() {
		return kpbh;
	}
	public void setKpbh(String kpbh) {
		this.kpbh = kpbh;
	}
	public String getKpmc() {
		return kpmc;
	}
	public void setKpmc(String kpmc) {
		this.kpmc = kpmc;
	}
	public String getHcpgnf() {
		return hcpgnf;
	}
	public void setHcpgnf(String hcpgnf) {
		this.hcpgnf = hcpgnf;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZclx() {
		return zclx;
	}
	public void setZclx(String zclx) {
		this.zclx = zclx;
	}

}
