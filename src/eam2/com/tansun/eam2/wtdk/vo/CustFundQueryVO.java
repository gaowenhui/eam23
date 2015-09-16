package com.tansun.eam2.wtdk.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 客户信息详细信息里面的贷款与基金信息VO
 * 
 * @author 陈煜霄
 * @date 2010-12-02
 */
public class CustFundQueryVO extends CommonBO {

	private String saAcctNo; // 基金系统账号
	private String saCustNo; // 客户编号
	private String saCustName; // 客户名称
	private String saCurrCode; // 币种
	private String saAvlBal; // 账户余额

	private String lnLnAcctNo; // 贷款系统账号
	private String lnCustNo; // 客户编号
	private String lnCurrCod; // 币种
	private String lnTotlLnAmtHypoAmt;// 贷款总额
	private String lnLnBal; // 贷款余额

	public String getSaAcctNo() {
		return saAcctNo;
	}

	public void setSaAcctNo(String saAcctNo) {
		this.saAcctNo = saAcctNo;
	}

	public String getSaCustNo() {
		return saCustNo;
	}

	public void setSaCustNo(String saCustNo) {
		this.saCustNo = saCustNo;
	}

	public String getSaCustName() {
		return saCustName;
	}

	public void setSaCustName(String saCustName) {
		this.saCustName = saCustName;
	}

	public String getSaCurrCode() {
		return saCurrCode;
	}

	public void setSaCurrCode(String saCurrCode) {
		this.saCurrCode = saCurrCode;
	}

	public String getSaAvlBal() {
		return saAvlBal;
	}

	public void setSaAvlBal(String saAvlBal) {
		this.saAvlBal = saAvlBal;
	}

	public String getLnLnAcctNo() {
		return lnLnAcctNo;
	}

	public void setLnLnAcctNo(String lnLnAcctNo) {
		this.lnLnAcctNo = lnLnAcctNo;
	}

	public String getLnCustNo() {
		return lnCustNo;
	}

	public void setLnCustNo(String lnCustNo) {
		this.lnCustNo = lnCustNo;
	}

	public String getLnCurrCod() {
		return lnCurrCod;
	}

	public void setLnCurrCod(String lnCurrCod) {
		this.lnCurrCod = lnCurrCod;
	}

	public String getLnTotlLnAmtHypoAmt() {
		return lnTotlLnAmtHypoAmt;
	}

	public void setLnTotlLnAmtHypoAmt(String lnTotlLnAmtHypoAmt) {
		this.lnTotlLnAmtHypoAmt = lnTotlLnAmtHypoAmt;
	}

	public String getLnLnBal() {
		return lnLnBal;
	}

	public void setLnLnBal(String lnLnBal) {
		this.lnLnBal = lnLnBal;
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
	    retValue = "CustFundQueryVO ( "
	        + super.toString() + TAB
	        + "saAcctNo = " + this.saAcctNo + TAB
	        + "saCustNo = " + this.saCustNo + TAB
	        + "saCustName = " + this.saCustName + TAB
	        + "saCurrCode = " + this.saCurrCode + TAB
	        + "saAvlBal = " + this.saAvlBal + TAB
	        + "lnLnAcctNo = " + this.lnLnAcctNo + TAB
	        + "lnCustNo = " + this.lnCustNo + TAB
	        + "lnCurrCod = " + this.lnCurrCod + TAB
	        + "lnTotlLnAmtHypoAmt = " + this.lnTotlLnAmtHypoAmt + TAB
	        + "lnLnBal = " + this.lnLnBal
	        + " )";
	    return retValue;
	}
	
}
