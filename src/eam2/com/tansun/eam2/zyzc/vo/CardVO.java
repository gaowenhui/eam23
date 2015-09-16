package com.tansun.eam2.zyzc.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class CardVO extends CommonBO {
	
	private static final long serialVersionUID = 4317836372304552392L;
	private String zcId;
	private String zcmc	;	  
	private String zcbh	;		
	private String gg;				
	private String cardmc;		
	private String cardtype;	
	private String glbm;			
	private String sybm;			

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getCardmc() {
		return cardmc;
	}

	public void setCardmc(String cardmc) {
		this.cardmc = cardmc;
	}

	public String getCardtype() {
		return cardtype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getSybm() {
		return sybm;
	}

	public void setSybm(String sybm) {
		this.sybm = sybm;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

}
