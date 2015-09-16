package com.tansun.eam2.common.model.orm.bo;

/**
 * WdLnMoreInforId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class WdLnMoreInforId implements java.io.Serializable {

	// Fields

	private String lnAcctNo;
	private String xulie;

	// Constructors

	/** default constructor */
	public WdLnMoreInforId() {
	}

	/** full constructor */
	public WdLnMoreInforId(String lnAcctNo, String xulie) {
		this.lnAcctNo = lnAcctNo;
		this.xulie = xulie;
	}

	// Property accessors

	public String getLnAcctNo() {
		return this.lnAcctNo;
	}

	public void setLnAcctNo(String lnAcctNo) {
		this.lnAcctNo = lnAcctNo;
	}

	public String getXulie() {
		return this.xulie;
	}

	public void setXulie(String xulie) {
		this.xulie = xulie;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof WdLnMoreInforId))
			return false;
		WdLnMoreInforId castOther = (WdLnMoreInforId) other;

		return ((this.getLnAcctNo() == castOther.getLnAcctNo()) || (this
				.getLnAcctNo() != null
				&& castOther.getLnAcctNo() != null && this.getLnAcctNo()
				.equals(castOther.getLnAcctNo())))
				&& ((this.getXulie() == castOther.getXulie()) || (this
						.getXulie() != null
						&& castOther.getXulie() != null && this.getXulie()
						.equals(castOther.getXulie())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getLnAcctNo() == null ? 0 : this.getLnAcctNo().hashCode());
		result = 37 * result
				+ (getXulie() == null ? 0 : this.getXulie().hashCode());
		return result;
	}

}