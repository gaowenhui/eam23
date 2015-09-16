package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CrtDccLnlnslnsHId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccLnlnslnsHId extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String lnLnAcctNo;
	private Date startDate;

	// Constructors

	/** default constructor */
	public CrtDccLnlnslnsHId() {
	}

	/** full constructor */
	public CrtDccLnlnslnsHId(String lnLnAcctNo, Date startDate) {
		this.lnLnAcctNo = lnLnAcctNo;
		this.startDate = startDate;
	}

	// Property accessors

	public String getLnLnAcctNo() {
		return this.lnLnAcctNo;
	}

	public void setLnLnAcctNo(String lnLnAcctNo) {
		this.lnLnAcctNo = lnLnAcctNo;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CrtDccLnlnslnsHId))
			return false;
		CrtDccLnlnslnsHId castOther = (CrtDccLnlnslnsHId) other;

		return ((this.getLnLnAcctNo() == castOther.getLnLnAcctNo()) || (this
				.getLnLnAcctNo() != null
				&& castOther.getLnLnAcctNo() != null && this.getLnLnAcctNo()
				.equals(castOther.getLnLnAcctNo())))
				&& ((this.getStartDate() == castOther.getStartDate()) || (this
						.getStartDate() != null
						&& castOther.getStartDate() != null && this
						.getStartDate().equals(castOther.getStartDate())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getLnLnAcctNo() == null ? 0 : this.getLnLnAcctNo()
						.hashCode());
		result = 37 * result
				+ (getStartDate() == null ? 0 : this.getStartDate().hashCode());
		return result;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}