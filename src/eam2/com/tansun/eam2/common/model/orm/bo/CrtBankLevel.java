package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtBankLevel entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtBankLevel extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String org4Id;
	private String org0Id;
	private String org0Name;
	private String org1Id;
	private String org1Name;
	private String org2Id;
	private String org2Name;
	private String org3Id;
	private String org3Name;
	private String org4Name;

	// Constructors

	/** default constructor */
	public CrtBankLevel() {
	}

	/** minimal constructor */
	public CrtBankLevel(String org4Id) {
		this.org4Id = org4Id;
	}

	/** full constructor */
	public CrtBankLevel(String org4Id, String org0Id, String org0Name,
			String org1Id, String org1Name, String org2Id, String org2Name,
			String org3Id, String org3Name, String org4Name) {
		this.org4Id = org4Id;
		this.org0Id = org0Id;
		this.org0Name = org0Name;
		this.org1Id = org1Id;
		this.org1Name = org1Name;
		this.org2Id = org2Id;
		this.org2Name = org2Name;
		this.org3Id = org3Id;
		this.org3Name = org3Name;
		this.org4Name = org4Name;
	}

	// Property accessors

	public String getOrg4Id() {
		return this.org4Id;
	}

	public void setOrg4Id(String org4Id) {
		this.org4Id = org4Id;
	}

	public String getOrg0Id() {
		return this.org0Id;
	}

	public void setOrg0Id(String org0Id) {
		this.org0Id = org0Id;
	}

	public String getOrg0Name() {
		return this.org0Name;
	}

	public void setOrg0Name(String org0Name) {
		this.org0Name = org0Name;
	}

	public String getOrg1Id() {
		return this.org1Id;
	}

	public void setOrg1Id(String org1Id) {
		this.org1Id = org1Id;
	}

	public String getOrg1Name() {
		return this.org1Name;
	}

	public void setOrg1Name(String org1Name) {
		this.org1Name = org1Name;
	}

	public String getOrg2Id() {
		return this.org2Id;
	}

	public void setOrg2Id(String org2Id) {
		this.org2Id = org2Id;
	}

	public String getOrg2Name() {
		return this.org2Name;
	}

	public void setOrg2Name(String org2Name) {
		this.org2Name = org2Name;
	}

	public String getOrg3Id() {
		return this.org3Id;
	}

	public void setOrg3Id(String org3Id) {
		this.org3Id = org3Id;
	}

	public String getOrg3Name() {
		return this.org3Name;
	}

	public void setOrg3Name(String org3Name) {
		this.org3Name = org3Name;
	}

	public String getOrg4Name() {
		return this.org4Name;
	}

	public void setOrg4Name(String org4Name) {
		this.org4Name = org4Name;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}