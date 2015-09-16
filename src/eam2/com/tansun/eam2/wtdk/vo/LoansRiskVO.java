package com.tansun.eam2.wtdk.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 担险信息VO
 * 
 * @author 陈煜霄 2010-12-06
 */
public class LoansRiskVO extends CommonBO {
	private String riskDate;
	private String lnAcctNo;
	private String CCustId;
	private String CAcctNo;
	private String magDpt;
	private String CCustName;
	private String assetType;
	private String DAcctNo;
	private String saSysAcctNo;
	private String savCustAcctNo;
	private String fundAccountsTaster;
	private String riskReason;
	private String fundType;
	private Double lostRate;
	private Double lostJe;
	private String verifiedDate;
	private String verRiskLeve;
	private Double verLostRate;
	private Double verLostJe;
	private String verPerson;
	private String verLevel;
	private String memoInfo;
	private String lnCAcctNo;
	private String xulie;

	public String getRiskDate() {
		return riskDate;
	}

	public void setRiskDate(String riskDate) {
		this.riskDate = riskDate;
	}

	public String getLnAcctNo() {
		return lnAcctNo;
	}

	public void setLnAcctNo(String lnAcctNo) {
		this.lnAcctNo = lnAcctNo;
	}

	public String getCCustId() {
		return CCustId;
	}

	public void setCCustId(String custId) {
		CCustId = custId;
	}

	public String getCAcctNo() {
		return CAcctNo;
	}

	public void setCAcctNo(String acctNo) {
		CAcctNo = acctNo;
	}

	public String getMagDpt() {
		return magDpt;
	}

	public void setMagDpt(String magDpt) {
		this.magDpt = magDpt;
	}

	public String getCCustName() {
		return CCustName;
	}

	public void setCCustName(String custName) {
		CCustName = custName;
	}

	public String getAssetType() {
		return assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public String getDAcctNo() {
		return DAcctNo;
	}

	public void setDAcctNo(String acctNo) {
		DAcctNo = acctNo;
	}

	public String getSaSysAcctNo() {
		return saSysAcctNo;
	}

	public void setSaSysAcctNo(String saSysAcctNo) {
		this.saSysAcctNo = saSysAcctNo;
	}

	public String getSavCustAcctNo() {
		return savCustAcctNo;
	}

	public void setSavCustAcctNo(String savCustAcctNo) {
		this.savCustAcctNo = savCustAcctNo;
	}

	public String getFundAccountsTaster() {
		return fundAccountsTaster;
	}

	public void setFundAccountsTaster(String fundAccountsTaster) {
		this.fundAccountsTaster = fundAccountsTaster;
	}

	public String getRiskReason() {
		return riskReason;
	}

	public void setRiskReason(String riskReason) {
		this.riskReason = riskReason;
	}

	public String getFundType() {
		return fundType;
	}

	public void setFundType(String fundType) {
		this.fundType = fundType;
	}

	public Double getLostRate() {
		return lostRate;
	}

	public void setLostRate(Double lostRate) {
		this.lostRate = lostRate;
	}

	public Double getLostJe() {
		return lostJe;
	}

	public void setLostJe(Double lostJe) {
		this.lostJe = lostJe;
	}

	public String getVerifiedDate() {
		return verifiedDate;
	}

	public void setVerifiedDate(String verifiedDate) {
		this.verifiedDate = verifiedDate;
	}

	public String getVerRiskLeve() {
		return verRiskLeve;
	}

	public void setVerRiskLeve(String verRiskLeve) {
		this.verRiskLeve = verRiskLeve;
	}

	public Double getVerLostRate() {
		return verLostRate;
	}

	public void setVerLostRate(Double verLostRate) {
		this.verLostRate = verLostRate;
	}

	public Double getVerLostJe() {
		return verLostJe;
	}

	public void setVerLostJe(Double verLostJe) {
		this.verLostJe = verLostJe;
	}

	public String getVerPerson() {
		return verPerson;
	}

	public void setVerPerson(String verPerson) {
		this.verPerson = verPerson;
	}

	public String getVerLevel() {
		return verLevel;
	}

	public void setVerLevel(String verLevel) {
		this.verLevel = verLevel;
	}

	public String getMemoInfo() {
		return memoInfo;
	}

	public void setMemoInfo(String memoInfo) {
		this.memoInfo = memoInfo;
	}

	public String getLnCAcctNo() {
		return lnCAcctNo;
	}

	public void setLnCAcctNo(String lnCAcctNo) {
		this.lnCAcctNo = lnCAcctNo;
	}

	public String getXulie() {
		return xulie;
	}

	public void setXulie(String xulie) {
		this.xulie = xulie;
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
		retValue = "LoansRiskVO ( " + super.toString() + TAB + "riskDate = "
				+ this.riskDate + TAB + "lnAcctNo = " + this.lnAcctNo + TAB
				+ "CCustId = " + this.CCustId + TAB + "CAcctNo = "
				+ this.CAcctNo + TAB + "magDpt = " + this.magDpt + TAB
				+ "CCustName = " + this.CCustName + TAB + "assetType = "
				+ this.assetType + TAB + "DAcctNo = " + this.DAcctNo + TAB
				+ "saSysAcctNo = " + this.saSysAcctNo + TAB
				+ "savCustAcctNo = " + this.savCustAcctNo + TAB
				+ "fundAccountsTaster = " + this.fundAccountsTaster + TAB
				+ "riskReason = " + this.riskReason + TAB + "fundType = "
				+ this.fundType + TAB + "lostRate = " + this.lostRate + TAB
				+ "lostJe = " + this.lostJe + TAB + "verifiedDate = "
				+ this.verifiedDate + TAB + "verRiskLeve = " + this.verRiskLeve
				+ TAB + "verLostRate = " + this.verLostRate + TAB
				+ "verLostJe = " + this.verLostJe + TAB + "verPerson = "
				+ this.verPerson + TAB + "verLevel = " + this.verLevel + TAB
				+ "memoInfo = " + this.memoInfo + TAB + "lnCAcctNo = "
				+ this.lnCAcctNo + TAB + "xulie = " + this.xulie + TAB + " )";
		return retValue;
	}

}
