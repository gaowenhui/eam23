package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CrtDccSaacnacnHisId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccSaacnacnHisId extends
		com.tansun.rdp4j.common.web.vo.CommonBO implements java.io.Serializable {

	// Fields

	private String saAcctNo;
	private Date dataDate;

	// Constructors

	/** default constructor */
	public CrtDccSaacnacnHisId() {
	}

	/** full constructor */
	public CrtDccSaacnacnHisId(String saAcctNo, Date dataDate) {
		this.saAcctNo = saAcctNo;
		this.dataDate = dataDate;
	}

	// Property accessors

	public String getSaAcctNo() {
		return this.saAcctNo;
	}

	public void setSaAcctNo(String saAcctNo) {
		this.saAcctNo = saAcctNo;
	}

	public Date getDataDate() {
		return this.dataDate;
	}

	public void setDataDate(Date dataDate) {
		this.dataDate = dataDate;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CrtDccSaacnacnHisId))
			return false;
		CrtDccSaacnacnHisId castOther = (CrtDccSaacnacnHisId) other;

		return ((this.getSaAcctNo() == castOther.getSaAcctNo()) || (this
				.getSaAcctNo() != null
				&& castOther.getSaAcctNo() != null && this.getSaAcctNo()
				.equals(castOther.getSaAcctNo())))
				&& ((this.getDataDate() == castOther.getDataDate()) || (this
						.getDataDate() != null
						&& castOther.getDataDate() != null && this
						.getDataDate().equals(castOther.getDataDate())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getSaAcctNo() == null ? 0 : this.getSaAcctNo().hashCode());
		result = 37 * result
				+ (getDataDate() == null ? 0 : this.getDataDate().hashCode());
		return result;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}