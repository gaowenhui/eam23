package com.tansun.eam2.jygdzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class AssuranceQueryVO extends CommonBO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1645534179780846539L;

	private String id;

	private String biaoti;
	private String bianhao;
	private String clph;

	private String zcbh;
	private String zcmc;
	private String czcdq;

	private String cardcode;
	private String zcname;
	private String firstbranch;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getClph() {
		return clph;
	}

	public void setClph(String clph) {
		this.clph = clph;
	}

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

	public String getCzcdq() {
		return czcdq;
	}

	public void setCzcdq(String czcdq) {
		this.czcdq = czcdq;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getZcname() {
		return zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getFirstbranch() {
		return firstbranch;
	}

	public void setFirstbranch(String firstbranch) {
		this.firstbranch = firstbranch;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
