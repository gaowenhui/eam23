package com.tansun.eam2.wtdk.vo;

import java.math.BigDecimal;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 交易明细查询VO
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
public class FuncSaacVO extends CommonBO {

	private String saAcctNo; // 账号
	private BigDecimal saTxAmt; // 交易金额
	private BigDecimal saDdpAcctBal; // 账户余额
	private BigDecimal saSvc; // 手续费
	private String saOpunCod; // 交易机构
	private String saOpunName; // 机构名称
	private String saTxTm; // 交易时间
	private String saTxDt; // 交易日期

	public String getSaAcctNo() {
		return saAcctNo;
	}

	public void setSaAcctNo(String saAcctNo) {
		this.saAcctNo = saAcctNo;
	}

	public BigDecimal getSaTxAmt() {
		return saTxAmt;
	}

	public void setSaTxAmt(BigDecimal saTxAmt) {
		this.saTxAmt = saTxAmt;
	}

	public BigDecimal getSaDdpAcctBal() {
		return saDdpAcctBal;
	}

	public void setSaDdpAcctBal(BigDecimal saDdpAcctBal) {
		this.saDdpAcctBal = saDdpAcctBal;
	}

	public BigDecimal getSaSvc() {
		return saSvc;
	}

	public void setSaSvc(BigDecimal saSvc) {
		this.saSvc = saSvc;
	}

	public String getSaOpunCod() {
		return saOpunCod;
	}

	public void setSaOpunCod(String saOpunCod) {
		this.saOpunCod = saOpunCod;
	}

	public String getSaOpunName() {
		return saOpunName;
	}

	public void setSaOpunName(String saOpunName) {
		this.saOpunName = saOpunName;
	}

	public String getSaTxTm() {
		return saTxTm;
	}

	public void setSaTxTm(String saTxTm) {
		this.saTxTm = saTxTm;
	}

	public String getSaTxDt() {
		return saTxDt;
	}

	public void setSaTxDt(String saTxDt) {
		this.saTxDt = saTxDt;
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
	    retValue = "FuncSaacVO ( "
	        + super.toString() + TAB
	        + "saAcctNo = " + this.saAcctNo + TAB
	        + "saTxAmt = " + this.saTxAmt + TAB
	        + "saDdpAcctBal = " + this.saDdpAcctBal + TAB
	        + "saSvc = " + this.saSvc + TAB
	        + "saOpunCod = " + this.saOpunCod + TAB
	        + "saOpunName = " + this.saOpunName + TAB
	        + "saTxTm = " + this.saTxTm + TAB
	        + "saTxDt = " + this.saTxDt
	        + " )";
	    return retValue;
	}
	
	

}
