package com.tansun.eam2.wtdk.vo;

import java.math.BigDecimal;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 贷款查询VO
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
public class LoansQueryVO extends CommonBO {
	private String lnLnAcctNo;// 系统贷款账号
	private BigDecimal lnTotlLnAmtHypoAmt;// 贷款总额

	private String lnCAcctNo;// 客户贷款账号
	private BigDecimal lnLnBal; // 贷款余额

	private String lnCustNo;// 客户编号
	private BigDecimal lnAccumRecvSvc;// 累计收手续费

	private String lnCustName;// 客户名称****
	private BigDecimal lnCrntYrRevAccum;// 本年累计收回

	private String branchName;// 机构名称****
	private BigDecimal lnCrntYrColledInt;// 本年已收贷款利息

	private String lnLnTyp;// 贷款种类
	private BigDecimal lnAccumColi;// 累计收息

	private BigDecimal lnCrntYrLnAccum;// 本年累计发放
	private BigDecimal ln_pprd_rfn_amt;// 本期还款金额

	private String lnAcctSts;// 账户状态
	private BigDecimal lnOvdlnIntrbl;// 催收应收利息

	private String saSysAcctNo;// 存款账号****
	private String rymc;// 省行管理人****
	private String lxfs;// 管理人电话

	private String lnDueDt;// 清算日期
	private String firstBranch;// 一级机构***

	private BigDecimal lnArfnSchdInt; // 利息
	private String riskState;// 担险状态***

	private String kmmc; // 科目名称
	private String kmbh; // 科目编号

	private String dAcctNo;// 委托方客户编号
	private String branchNo; // 机构编号
	private String lnCurrCod;// 币种
	private String lnCurrName;// 币别名称
	private String beforeAmt;// 贷款金额从
	private String endAmt;// 贷款金额到

	public String getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(String branchNo) {
		this.branchNo = branchNo;
	}

	public String getFirstBranch() {
		return firstBranch;
	}

	public void setFirstBranch(String firstBranch) {
		this.firstBranch = firstBranch;
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

	public String getLnCurrName() {
		return lnCurrName;
	}

	public void setLnCurrName(String lnCurrName) {
		this.lnCurrName = lnCurrName;
	}

	public String getLnLnAcctNo() {
		return lnLnAcctNo;
	}

	public void setLnLnAcctNo(String lnLnAcctNo) {
		this.lnLnAcctNo = lnLnAcctNo;
	}

	public String getLnCustName() {
		return lnCustName;
	}

	public void setLnCustName(String lnCustName) {
		this.lnCustName = lnCustName;
	}

	public String getBeforeAmt() {
		return beforeAmt;
	}

	public void setBeforeAmt(String beforeAmt) {
		this.beforeAmt = beforeAmt;
	}

	public String getEndAmt() {
		return endAmt;
	}

	public void setEndAmt(String endAmt) {
		this.endAmt = endAmt;
	}

	public BigDecimal getLnTotlLnAmtHypoAmt() {
		return lnTotlLnAmtHypoAmt;
	}

	public void setLnTotlLnAmtHypoAmt(BigDecimal lnTotlLnAmtHypoAmt) {
		this.lnTotlLnAmtHypoAmt = lnTotlLnAmtHypoAmt;
	}

	public BigDecimal getLnLnBal() {
		return lnLnBal;
	}

	public void setLnLnBal(BigDecimal lnLnBal) {
		this.lnLnBal = lnLnBal;
	}

	public BigDecimal getLnAccumRecvSvc() {
		return lnAccumRecvSvc;
	}

	public void setLnAccumRecvSvc(BigDecimal lnAccumRecvSvc) {
		this.lnAccumRecvSvc = lnAccumRecvSvc;
	}

	public BigDecimal getLnCrntYrRevAccum() {
		return lnCrntYrRevAccum;
	}

	public void setLnCrntYrRevAccum(BigDecimal lnCrntYrRevAccum) {
		this.lnCrntYrRevAccum = lnCrntYrRevAccum;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public BigDecimal getLnCrntYrColledInt() {
		return lnCrntYrColledInt;
	}

	public void setLnCrntYrColledInt(BigDecimal lnCrntYrColledInt) {
		this.lnCrntYrColledInt = lnCrntYrColledInt;
	}

	public String getLnLnTyp() {
		return lnLnTyp;
	}

	public void setLnLnTyp(String lnLnTyp) {
		this.lnLnTyp = lnLnTyp;
	}

	public BigDecimal getLnAccumColi() {
		return lnAccumColi;
	}

	public void setLnAccumColi(BigDecimal lnAccumColi) {
		this.lnAccumColi = lnAccumColi;
	}

	public BigDecimal getLnCrntYrLnAccum() {
		return lnCrntYrLnAccum;
	}

	public void setLnCrntYrLnAccum(BigDecimal lnCrntYrLnAccum) {
		this.lnCrntYrLnAccum = lnCrntYrLnAccum;
	}

	public BigDecimal getLn_pprd_rfn_amt() {
		return ln_pprd_rfn_amt;
	}

	public void setLn_pprd_rfn_amt(BigDecimal ln_pprd_rfn_amt) {
		this.ln_pprd_rfn_amt = ln_pprd_rfn_amt;
	}

	public String getLnAcctSts() {
		return lnAcctSts;
	}

	public void setLnAcctSts(String lnAcctSts) {
		this.lnAcctSts = lnAcctSts;
	}

	public BigDecimal getLnOvdlnIntrbl() {
		return lnOvdlnIntrbl;
	}

	public void setLnOvdlnIntrbl(BigDecimal lnOvdlnIntrbl) {
		this.lnOvdlnIntrbl = lnOvdlnIntrbl;
	}

	public String getLnDueDt() {
		return lnDueDt;
	}

	public void setLnDueDt(String lnDueDt) {
		this.lnDueDt = lnDueDt;
	}

	public BigDecimal getLnArfnSchdInt() {
		return lnArfnSchdInt;
	}

	public void setLnArfnSchdInt(BigDecimal lnArfnSchdInt) {
		this.lnArfnSchdInt = lnArfnSchdInt;
	}

	public String getSaSysAcctNo() {
		return saSysAcctNo;
	}

	public void setSaSysAcctNo(String saSysAcctNo) {
		this.saSysAcctNo = saSysAcctNo;
	}

	public String getRymc() {
		return rymc;
	}

	public void setRymc(String rymc) {
		this.rymc = rymc;
	}

	public String getRiskState() {
		return riskState;
	}

	public void setRiskState(String riskState) {
		this.riskState = riskState;
	}

	public String getLxfs() {
		return lxfs;
	}

	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}

	public String getDAcctNo() {
		return dAcctNo;
	}

	public void setDAcctNo(String acctNo) {
		dAcctNo = acctNo;
	}

	public String getKmmc() {
		return kmmc;
	}

	public void setKmmc(String kmmc) {
		this.kmmc = kmmc;
	}

	public String getKmbh() {
		return kmbh;
	}

	public void setKmbh(String kmbh) {
		this.kmbh = kmbh;
	}

	public String getLnCAcctNo() {
		return lnCAcctNo;
	}

	public void setLnCAcctNo(String lnCAcctNo) {
		this.lnCAcctNo = lnCAcctNo;
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
	    retValue = "LoansQueryVO ( "
	        + super.toString() + TAB
	        + "lnLnAcctNo = " + this.lnLnAcctNo + TAB
	        + "lnTotlLnAmtHypoAmt = " + this.lnTotlLnAmtHypoAmt + TAB
	        + "lnCAcctNo = " + this.lnCAcctNo + TAB
	        + "lnLnBal = " + this.lnLnBal + TAB
	        + "lnCustNo = " + this.lnCustNo + TAB
	        + "lnAccumRecvSvc = " + this.lnAccumRecvSvc + TAB
	        + "lnCustName = " + this.lnCustName + TAB
	        + "lnCrntYrRevAccum = " + this.lnCrntYrRevAccum + TAB
	        + "branchName = " + this.branchName + TAB
	        + "lnCrntYrColledInt = " + this.lnCrntYrColledInt + TAB
	        + "lnLnTyp = " + this.lnLnTyp + TAB
	        + "lnAccumColi = " + this.lnAccumColi + TAB
	        + "lnCrntYrLnAccum = " + this.lnCrntYrLnAccum + TAB
	        + "ln_pprd_rfn_amt = " + this.ln_pprd_rfn_amt + TAB
	        + "lnAcctSts = " + this.lnAcctSts + TAB
	        + "lnOvdlnIntrbl = " + this.lnOvdlnIntrbl + TAB
	        + "saSysAcctNo = " + this.saSysAcctNo + TAB
	        + "rymc = " + this.rymc + TAB
	        + "lxfs = " + this.lxfs + TAB
	        + "lnDueDt = " + this.lnDueDt + TAB
	        + "firstBranch = " + this.firstBranch + TAB
	        + "lnArfnSchdInt = " + this.lnArfnSchdInt + TAB
	        + "riskState = " + this.riskState + TAB
	        + "kmmc = " + this.kmmc + TAB
	        + "kmbh = " + this.kmbh + TAB
	        + "dAcctNo = " + this.dAcctNo + TAB
	        + "branchNo = " + this.branchNo + TAB
	        + "lnCurrCod = " + this.lnCurrCod + TAB
	        + "lnCurrName = " + this.lnCurrName + TAB
	        + "beforeAmt = " + this.beforeAmt + TAB
	        + "endAmt = " + this.endAmt
	        + " )";
	    return retValue;
	}
	
	

}
