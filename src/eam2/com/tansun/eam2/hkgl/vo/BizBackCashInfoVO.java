package com.tansun.eam2.hkgl.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class BizBackCashInfoVO extends CommonBO {

	// 到账时间 从 到
	Date dzsjbegin;
	Date dzsjend;

	// 入账时间 从 到
	Date rzsjbegin;
	Date rzsjend;

	String hkxz;
	// 金额 从 到
	Double jebegin;
	Double jeend;
	// 进账单号
	String jzdh;

	@Override
	public String getMid() {
		return null;
	}


	public String getHkxz() {
		return hkxz;
	}

	public void setHkxz(String hkxz) {
		this.hkxz = hkxz;
	}

	public Double getJebegin() {
		return jebegin;
	}

	public void setJebegin(Double jebegin) {
		this.jebegin = jebegin;
	}

	public Double getJeend() {
		return jeend;
	}

	public void setJeend(Double jeend) {
		this.jeend = jeend;
	}

	public String getJzdh() {
		return jzdh;
	}

	public void setJzdh(String jzdh) {
		this.jzdh = jzdh;
	}


	public Date getDzsjbegin() {
		return dzsjbegin;
	}


	public void setDzsjbegin(Date dzsjbegin) {
		this.dzsjbegin = dzsjbegin;
	}


	public Date getDzsjend() {
		return dzsjend;
	}


	public void setDzsjend(Date dzsjend) {
		this.dzsjend = dzsjend;
	}


	public Date getRzsjbegin() {
		return rzsjbegin;
	}


	public void setRzsjbegin(Date rzsjbegin) {
		this.rzsjbegin = rzsjbegin;
	}


	public Date getRzsjend() {
		return rzsjend;
	}


	public void setRzsjend(Date rzsjend) {
		this.rzsjend = rzsjend;
	}
}
