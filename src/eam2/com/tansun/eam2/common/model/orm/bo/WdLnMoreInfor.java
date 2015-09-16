package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * WdLnMoreInfor entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class WdLnMoreInfor extends CommonBO implements java.io.Serializable {

	// Fields

//	private String lnAcctNo;
	private WdLnMoreInfor id;
	private Date riskDate;
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
	private String lostRate;
	private Double lostJe;
	private Date verifiedDate;
	private String verRiskLeve;
	private Double verLostRate;
	private Double verLostJe;
	private String verPerson;
	private String verLevel;
	private String memoInfo;
//	private String xulie;

	// Constructors

	/** default constructor */
	public WdLnMoreInfor() {
	}

	/** minimal constructor */
//	public WdLnMoreInfor(String lnAcctNo) {
//		this.lnAcctNo = lnAcctNo;
//	}

	/** full constructor */
	public WdLnMoreInfor(String lnAcctNo, Date riskDate, String CCustId,
			String CAcctNo, String magDpt, String CCustName, String assetType,
			String DAcctNo, String saSysAcctNo, String savCustAcctNo,
			String fundAccountsTaster, String riskReason, String fundType,
			String lostRate, Double lostJe, Date verifiedDate,
			String verRiskLeve, Double verLostRate, Double verLostJe,
			String verPerson, String verLevel, String memoInfo, String xulie) {
//		this.lnAcctNo = lnAcctNo;
		this.riskDate = riskDate;
		this.CCustId = CCustId;
		this.CAcctNo = CAcctNo;
		this.magDpt = magDpt;
		this.CCustName = CCustName;
		this.assetType = assetType;
		this.DAcctNo = DAcctNo;
		this.saSysAcctNo = saSysAcctNo;
		this.savCustAcctNo = savCustAcctNo;
		this.fundAccountsTaster = fundAccountsTaster;
		this.riskReason = riskReason;
		this.fundType = fundType;
		this.lostRate = lostRate;
		this.lostJe = lostJe;
		this.verifiedDate = verifiedDate;
		this.verRiskLeve = verRiskLeve;
		this.verLostRate = verLostRate;
		this.verLostJe = verLostJe;
		this.verPerson = verPerson;
		this.verLevel = verLevel;
		this.memoInfo = memoInfo;
//		this.xulie = xulie;
	}

	// Property accessors

//	public String getLnAcctNo() {
//		return this.lnAcctNo;
//	}
//
//	public void setLnAcctNo(String lnAcctNo) {
//		this.lnAcctNo = lnAcctNo;
//	}

	public Date getRiskDate() {
		return this.riskDate;
	}

	public void setRiskDate(Date riskDate) {
		this.riskDate = riskDate;
	}

	public String getCCustId() {
		return this.CCustId;
	}

	public void setCCustId(String CCustId) {
		this.CCustId = CCustId;
	}

	public String getCAcctNo() {
		return this.CAcctNo;
	}

	public void setCAcctNo(String CAcctNo) {
		this.CAcctNo = CAcctNo;
	}

	public String getMagDpt() {
		return this.magDpt;
	}

	public void setMagDpt(String magDpt) {
		this.magDpt = magDpt;
	}

	public String getCCustName() {
		return this.CCustName;
	}

	public void setCCustName(String CCustName) {
		this.CCustName = CCustName;
	}

	public String getAssetType() {
		return this.assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public String getDAcctNo() {
		return this.DAcctNo;
	}

	public void setDAcctNo(String DAcctNo) {
		this.DAcctNo = DAcctNo;
	}

	public String getSaSysAcctNo() {
		return this.saSysAcctNo;
	}

	public void setSaSysAcctNo(String saSysAcctNo) {
		this.saSysAcctNo = saSysAcctNo;
	}

	public String getSavCustAcctNo() {
		return this.savCustAcctNo;
	}

	public void setSavCustAcctNo(String savCustAcctNo) {
		this.savCustAcctNo = savCustAcctNo;
	}

	public String getFundAccountsTaster() {
		return this.fundAccountsTaster;
	}

	public void setFundAccountsTaster(String fundAccountsTaster) {
		this.fundAccountsTaster = fundAccountsTaster;
	}

	public String getRiskReason() {
		return this.riskReason;
	}

	public void setRiskReason(String riskReason) {
		this.riskReason = riskReason;
	}

	public String getFundType() {
		return this.fundType;
	}

	public void setFundType(String fundType) {
		this.fundType = fundType;
	}

	public String getLostRate() {
		return this.lostRate;
	}

	public void setLostRate(String lostRate) {
		this.lostRate = lostRate;
	}

	public Double getLostJe() {
		return this.lostJe;
	}

	public void setLostJe(Double lostJe) {
		this.lostJe = lostJe;
	}

	public Date getVerifiedDate() {
		return this.verifiedDate;
	}

	public void setVerifiedDate(Date verifiedDate) {
		this.verifiedDate = verifiedDate;
	}

	public String getVerRiskLeve() {
		return this.verRiskLeve;
	}

	public void setVerRiskLeve(String verRiskLeve) {
		this.verRiskLeve = verRiskLeve;
	}

	public Double getVerLostRate() {
		return this.verLostRate;
	}

	public void setVerLostRate(Double verLostRate) {
		this.verLostRate = verLostRate;
	}

	public Double getVerLostJe() {
		return this.verLostJe;
	}

	public void setVerLostJe(Double verLostJe) {
		this.verLostJe = verLostJe;
	}

	public String getVerPerson() {
		return this.verPerson;
	}

	public void setVerPerson(String verPerson) {
		this.verPerson = verPerson;
	}

	public String getVerLevel() {
		return this.verLevel;
	}

	public void setVerLevel(String verLevel) {
		this.verLevel = verLevel;
	}

	public String getMemoInfo() {
		return this.memoInfo;
	}

	public void setMemoInfo(String memoInfo) {
		this.memoInfo = memoInfo;
	}

//	public String getXulie() {
//		return xulie;
//	}
//
//	public void setXulie(String xulie) {
//		this.xulie = xulie;
//	}
	
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public WdLnMoreInfor getId() {
		return id;
	}

	public void setId(WdLnMoreInfor id) {
		this.id = id;
	}

}