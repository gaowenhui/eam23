package com.tansun.eam2.wtdk.vo;

import java.math.BigDecimal;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 贷款本金明细查询VO
 * 
 * @author 陈煜霄
 * @date 2010-12-08
 */
public class LoansBjVO extends CommonBO {

	private String khmc;
	private String kmbh;
	private String kmmc;
	private String bchkrq;
	private BigDecimal bchkje;
	private BigDecimal hkhbjye;
	private String wtdwmc;

	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public String getKmbh() {
		return kmbh;
	}

	public void setKmbh(String kmbh) {
		this.kmbh = kmbh;
	}

	public String getKmmc() {
		return kmmc;
	}

	public void setKmmc(String kmmc) {
		this.kmmc = kmmc;
	}

	public String getBchkrq() {
		return bchkrq;
	}

	public void setBchkrq(String bchkrq) {
		this.bchkrq = bchkrq;
	}

	public BigDecimal getBchkje() {
		return bchkje;
	}

	public void setBchkje(BigDecimal bchkje) {
		this.bchkje = bchkje;
	}

	public BigDecimal getHkhbjye() {
		return hkhbjye;
	}

	public void setHkhbjye(BigDecimal hkhbjye) {
		this.hkhbjye = hkhbjye;
	}

	public String getWtdwmc() {
		return wtdwmc;
	}

	public void setWtdwmc(String wtdwmc) {
		this.wtdwmc = wtdwmc;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString() {
	    final String TAB = ",";
		String retValue = "";
	    retValue = "LoansBjVO ( "
	        + super.toString() + TAB
	        + "khmc = " + this.khmc + TAB
	        + "kmbh = " + this.kmbh + TAB
	        + "kmmc = " + this.kmmc + TAB
	        + "bchkrq = " + this.bchkrq + TAB
	        + "bchkje = " + this.bchkje + TAB
	        + "hkhbjye = " + this.hkhbjye + TAB
	        + "wtdwmc = " + this.wtdwmc
	        + " )";
	    return retValue;
	}
	
	

}
