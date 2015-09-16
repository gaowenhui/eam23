package com.tansun.eam2.wtdk.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class RelateVO extends CommonBO {

	private String xulie;
	private String loansId;
	private String funcId;
	private String funcCustId;
	private String funcSP;
	private String funcQK;
	private String loansCustNo;

	public String getXulie() {
		return xulie;
	}

	public void setXulie(String xulie) {
		this.xulie = xulie;
	}

	public String getLoansId() {
		return loansId;
	}

	public void setLoansId(String loansId) {
		this.loansId = loansId;
	}

	public String getFuncId() {
		return funcId;
	}

	public void setFuncId(String funcId) {
		this.funcId = funcId;
	}

	public String getFuncCustId() {
		return funcCustId;
	}

	public void setFuncCustId(String funcCustId) {
		this.funcCustId = funcCustId;
	}

	public String getFuncSP() {
		return funcSP;
	}

	public void setFuncSP(String funcSP) {
		this.funcSP = funcSP;
	}

	public String getFuncQK() {
		return funcQK;
	}

	public void setFuncQK(String funcQK) {
		this.funcQK = funcQK;
	}

	public String getLoansCustNo() {
		return loansCustNo;
	}

	public void setLoansCustNo(String loansCustNo) {
		this.loansCustNo = loansCustNo;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
