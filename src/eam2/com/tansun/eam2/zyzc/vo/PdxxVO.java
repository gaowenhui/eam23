package com.tansun.eam2.zyzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class PdxxVO extends CommonBO {
	private static final long serialVersionUID = -7359586092074367718L;
	private Date zzpdrq;
	private Date zwpdrq;
	private String pdpc;
	private String type;
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public Date getZzpdrq() {
		return zzpdrq;
	}
	public void setZzpdrq(Date zzpdrq) {
		this.zzpdrq = zzpdrq;
	}
	public Date getZwpdrq() {
		return zwpdrq;
	}
	public void setZwpdrq(Date zwpdrq) {
		this.zwpdrq = zwpdrq;
	}
	public String getPdpc() {
		return pdpc;
	}
	public void setPdpc(String pdpc) {
		this.pdpc = pdpc;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
