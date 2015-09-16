package com.tansun.eam2.wtdk.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class FuncBackVO extends CommonBO {

	private String startDate;// 从...
	private String endDate;// 到...

	private String hkdw; // 回款单位
	private String dkzh; // 贷款账号
	private String hskm;// 核算科目
	private BigDecimal ncye; // 年初余额
	private String bjhkrq; // 本次回款日期
	private BigDecimal bchkje; // 本次回款金额
	private BigDecimal bnljhkje;// 本年累计回款金额
	private BigDecimal hkhbjye;// 还款后本金余额
	private String dywtdw;// 对应委托单位
	private String jjzh;
	private String jjkh;
	private Double jjzhye;
	private Double dkzhye;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getHkdw() {
		return hkdw;
	}

	public void setHkdw(String hkdw) {
		this.hkdw = hkdw;
	}

	public String getDkzh() {
		return dkzh;
	}

	public void setDkzh(String dkzh) {
		this.dkzh = dkzh;
	}

	public String getHskm() {
		return hskm;
	}

	public void setHskm(String hskm) {
		this.hskm = hskm;
	}

	public BigDecimal getNcye() {
		return ncye;
	}

	public void setNcye(BigDecimal ncye) {
		this.ncye = ncye;
	}

	public String getBjhkrq() {
		return bjhkrq;
	}

	public void setBjhkrq(String bjhkrq) {
		this.bjhkrq = bjhkrq;
	}

	public BigDecimal getBchkje() {
		return bchkje;
	}

	public void setBchkje(BigDecimal bchkje) {
		this.bchkje = bchkje;
	}

	public BigDecimal getBnljhkje() {
		return bnljhkje;
	}

	public void setBnljhkje(BigDecimal bnljhkje) {
		this.bnljhkje = bnljhkje;
	}

	public BigDecimal getHkhbjye() {
		return hkhbjye;
	}

	public void setHkhbjye(BigDecimal hkhbjye) {
		this.hkhbjye = hkhbjye;
	}

	public String getDywtdw() {
		return dywtdw;
	}

	public void setDywtdw(String dywtdw) {
		this.dywtdw = dywtdw;
	}

	public String getJjzh() {
		return jjzh;
	}

	public void setJjzh(String jjzh) {
		this.jjzh = jjzh;
	}

	public String getJjkh() {
		return jjkh;
	}

	public void setJjkh(String jjkh) {
		this.jjkh = jjkh;
	}

	public Double getJjzhye() {
		return jjzhye;
	}

	public void setJjzhye(Double jjzhye) {
		this.jjzhye = jjzhye;
	}

	public Double getDkzhye() {
		return dkzhye;
	}

	public void setDkzhye(Double dkzhye) {
		this.dkzhye = dkzhye;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Constructs a <code>String</code> with all attributes in name = value
	 * format.
	 * 
	 * @return a <code>String</code> representation of this object.
	 */
	public String toString() {
		final String TAB = "    ";

		String retValue = "";

		retValue = "FuncBackVO ( " + super.toString() + TAB + "startDate = "
				+ this.startDate + TAB + "endDate = " + this.endDate + TAB
				+ "hkdw = " + this.hkdw + TAB + "dkzh = " + this.dkzh + TAB
				+ "hskm = " + this.hskm + TAB + "ncye = " + this.ncye + TAB
				+ "bjhkrq = " + this.bjhkrq + TAB + "bchkje = " + this.bchkje
				+ TAB + "bnljhkje = " + this.bnljhkje + TAB + "hkhbjye = "
				+ this.hkhbjye + TAB + "dywtdw = " + this.dywtdw + TAB
				+ "jjzh = " + this.jjzh + TAB + "jjkh = " + this.jjkh + TAB
				+ "jjzhye = " + this.jjzhye + TAB + " )";

		return retValue;
	}

}
