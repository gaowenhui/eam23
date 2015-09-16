package com.tansun.eam2.wtdk.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 风险查询vo
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
public class RiskQueryVO extends CommonBO {

	private String CCustId; // 客户编号
	private String CCustName;// 客户名称
	private String lnAcctNo;// 贷款账号
	private String verRiskLeve;// 审核风险等级
	private String startRiskDate;// 开始时间
	private String endRiskDate;// 结束时间

	private String DAcctNo;// 委托方客户编号
	private Double lostJe;// 预计损失金额
	private Double verLostJe;// 审核预计损失金额
	private String magDpt;// 资产管理部门
	private String riskLevel; // 风险分类等级
	private Double loansYE; // 贷款本金余额

	public String getCCustId() {
		return CCustId;
	}

	public void setCCustId(String custId) {
		CCustId = custId;
	}

	public String getCCustName() {
		return CCustName;
	}

	public void setCCustName(String custName) {
		CCustName = custName;
	}

	public String getLnAcctNo() {
		return lnAcctNo;
	}

	public void setLnAcctNo(String lnAcctNo) {
		this.lnAcctNo = lnAcctNo;
	}

	public String getVerRiskLeve() {
		return verRiskLeve;
	}

	public void setVerRiskLeve(String verRiskLeve) {
		this.verRiskLeve = verRiskLeve;
	}

	public String getStartRiskDate() {
		return startRiskDate;
	}

	public void setStartRiskDate(String startRiskDate) {
		this.startRiskDate = startRiskDate;
	}

	public String getEndRiskDate() {
		return endRiskDate;
	}

	public void setEndRiskDate(String endRiskDate) {
		this.endRiskDate = endRiskDate;
	}

	public String getDAcctNo() {
		return DAcctNo;
	}

	public void setDAcctNo(String acctNo) {
		DAcctNo = acctNo;
	}

	public Double getLostJe() {
		return lostJe;
	}

	public void setLostJe(Double lostJe) {
		this.lostJe = lostJe;
	}

	public Double getVerLostJe() {
		return verLostJe;
	}

	public void setVerLostJe(Double verLostJe) {
		this.verLostJe = verLostJe;
	}

	public String getMagDpt() {
		return magDpt;
	}

	public void setMagDpt(String magDpt) {
		this.magDpt = magDpt;
	}

	public String getRiskLevel() {
		return riskLevel;
	}

	public void setRiskLevel(String riskLevel) {
		this.riskLevel = riskLevel;
	}

	public Double getLoansYE() {
		return loansYE;
	}

	public void setLoansYE(Double loansYE) {
		this.loansYE = loansYE;
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

		retValue = "RiskQueryVO ( " + super.toString() + TAB + "CCustId = "
				+ this.CCustId + TAB + "CCustName = " + this.CCustName + TAB
				+ "lnAcctNo = " + this.lnAcctNo + TAB + "verRiskLeve = "
				+ this.verRiskLeve + TAB + "startRiskDate = "
				+ this.startRiskDate + TAB + "endRiskDate = "
				+ this.endRiskDate + TAB + "DAcctNo = " + this.DAcctNo + TAB
				+ "lostJe = " + this.lostJe + TAB + "verLostJe = "
				+ this.verLostJe + TAB + "magDpt = " + this.magDpt + TAB
				+ "riskLevel = " + this.riskLevel + TAB + "loansYE = "
				+ this.loansYE + TAB + " )";

		return retValue;
	}

}
