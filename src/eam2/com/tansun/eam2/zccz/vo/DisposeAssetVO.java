package com.tansun.eam2.zccz.vo;

import com.tansun.eam2.common.model.orm.bo.CzZcXx;

public class DisposeAssetVO extends CzZcXx{
	
	private static final long serialVersionUID = 8939693673390957222L;
	//经营性固定资产
	private Double zmyz = 0d;
	private Double zmjz = 0d;
	private Double pgjz = 0d;
	
	//资产权属
	private String zcqs;

	//实体内资产
	private Double entityPgjz = 0d;
	
	private String entityAssetType;
	
	//委贷抵债物
	private Double loanPledgePgjz = 0d;
	
	private String loanPledgeType;
	
	//自用资产 财产原值
	private Double zyccyzWy = 0d;

	public Double getZmyz() {
		return zmyz;
	}

	public void setZmyz(Double zmyz) {
		this.zmyz = zmyz;
	}

	public Double getZmjz() {
		return zmjz;
	}

	public void setZmjz(Double zmjz) {
		this.zmjz = zmjz;
	}

	public Double getPgjz() {
		return pgjz;
	}

	public void setPgjz(Double pgjz) {
		this.pgjz = pgjz;
	}

	public Double getEntityPgjz() {
		return entityPgjz;
	}

	public void setEntityPgjz(Double entityPgjz) {
		this.entityPgjz = entityPgjz;
	}

	public String getEntityAssetType() {
		return entityAssetType;
	}

	public void setEntityAssetType(String entityAssetType) {
		this.entityAssetType = entityAssetType;
	}

	public Double getLoanPledgePgjz() {
		return loanPledgePgjz;
	}

	public void setLoanPledgePgjz(Double loanPledgePgjz) {
		this.loanPledgePgjz = loanPledgePgjz;
	}

	public String getLoanPledgeType() {
		return loanPledgeType;
	}

	public void setLoanPledgeType(String loanPledgeType) {
		this.loanPledgeType = loanPledgeType;
	}

	public Double getZyccyzWy() {
		return zyccyzWy;
	}

	public void setZyccyzWy(Double zyccyzWy) {
		this.zyccyzWy = zyccyzWy;
	}

	public String getZcqs() {
		return zcqs;
	}

	public void setZcqs(String zcqs) {
		this.zcqs = zcqs;
	}
}
