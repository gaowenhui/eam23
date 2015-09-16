package com.tansun.eam2.wtdk.vo;

import java.math.BigDecimal;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 基金查询条件VO
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
public class FuncQueryVO extends CommonBO {

	private String saOpacInstnNo; // 机构编号
	private String saOpacInstnName; // 开户机构名称
	private String saCustName; // 客户名称
	private String firstBranch; // 一级分行
	private String saCurrCod; // 币种
	private String saAcctNo; // 系统基金号（账号）
	private String saCustNo; // 客户编号
	private String subCod; // 科目号
	private String subName; // 科目名
	private String saAclgName; // 科目名称
	private BigDecimal saAvlBal; // 可用余额
	private BigDecimal saAcctBal; // 账户余额
	private String saCacctDt;// 销户日期
	private String saCustAcctNo; // 客户账号

	public String getSaOpacInstnNo() {
		return saOpacInstnNo;
	}

	public void setSaOpacInstnNo(String saOpacInstnNo) {
		this.saOpacInstnNo = saOpacInstnNo;
	}

	public String getSaCustName() {
		return saCustName;
	}

	public void setSaCustName(String saCustName) {
		this.saCustName = saCustName;
	}

	public String getFirstBranch() {
		return firstBranch;
	}

	public void setFirstBranch(String firstBranch) {
		this.firstBranch = firstBranch;
	}

	public String getSaCurrCod() {
		return saCurrCod;
	}

	public void setSaCurrCod(String saCurrCod) {
		this.saCurrCod = saCurrCod;
	}

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

	public String getSubCod() {
		return subCod;
	}

	public void setSubCod(String subCod) {
		this.subCod = subCod;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public BigDecimal getSaAvlBal() {
		return saAvlBal;
	}

	public void setSaAvlBal(BigDecimal saAvlBal) {
		this.saAvlBal = saAvlBal;
	}

	public BigDecimal getSaAcctBal() {
		return saAcctBal;
	}

	public void setSaAcctBal(BigDecimal saAcctBal) {
		this.saAcctBal = saAcctBal;
	}

	public String getSaCacctDt() {
		return saCacctDt;
	}

	public void setSaCacctDt(String saCacctDt) {
		this.saCacctDt = saCacctDt;
	}

	public String getSaOpacInstnName() {
		return saOpacInstnName;
	}

	public void setSaOpacInstnName(String saOpacInstnName) {
		this.saOpacInstnName = saOpacInstnName;
	}

	public String getSaAclgName() {
		return saAclgName;
	}

	public void setSaAclgName(String saAclgName) {
		this.saAclgName = saAclgName;
	}

	public String getSaCustAcctNo() {
		return saCustAcctNo;
	}

	public void setSaCustAcctNo(String saCustAcctNo) {
		this.saCustAcctNo = saCustAcctNo;
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

		retValue = "FuncQueryVO ( " + super.toString() + TAB
				+ "saOpacInstnNo = " + this.saOpacInstnNo + TAB
				+ "saOpacInstnName = " + this.saOpacInstnName + TAB
				+ "saCustName = " + this.saCustName + TAB + "firstBranch = "
				+ this.firstBranch + TAB + "saCurrCod = " + this.saCurrCod
				+ TAB + "saAcctNo = " + this.saAcctNo + TAB + "saCustNo = "
				+ this.saCustNo + TAB + "subCod = " + this.subCod + TAB
				+ "subName = " + this.subName + TAB + "saAclgName = "
				+ this.saAclgName + TAB + "saAvlBal = " + this.saAvlBal + TAB
				+ "saAcctBal = " + this.saAcctBal + TAB + "saCacctDt = "
				+ this.saCacctDt + TAB + "saCustAcctNo = " + this.saCustAcctNo
				+ TAB + " )";

		return retValue;
	}

}
