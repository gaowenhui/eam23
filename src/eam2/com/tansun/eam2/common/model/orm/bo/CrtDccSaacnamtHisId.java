package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CrtDccSaacnamtHisId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccSaacnamtHisId extends
		com.tansun.rdp4j.common.web.vo.CommonBO implements java.io.Serializable {

	// Fields

	private String saAcctNo;
	private String saCurrCod;
	private String saCurrIden;
	private Date dataDate;

	// Constructors

	/** default constructor */
	public CrtDccSaacnamtHisId() {
	}

	/** full constructor */
	public CrtDccSaacnamtHisId(String saAcctNo, String saCurrCod,
			String saCurrIden, Date dataDate) {
		this.saAcctNo = saAcctNo;
		this.saCurrCod = saCurrCod;
		this.saCurrIden = saCurrIden;
		this.dataDate = dataDate;
	}

	// Property accessors

	public String getSaAcctNo() {
		return this.saAcctNo;
	}

	public void setSaAcctNo(String saAcctNo) {
		this.saAcctNo = saAcctNo;
	}

	public String getSaCurrCod() {
		return this.saCurrCod;
	}

	public void setSaCurrCod(String saCurrCod) {
		this.saCurrCod = saCurrCod;
	}

	public String getSaCurrIden() {
		return this.saCurrIden;
	}

	public void setSaCurrIden(String saCurrIden) {
		this.saCurrIden = saCurrIden;
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
		if (!(other instanceof CrtDccSaacnamtHisId))
			return false;
		CrtDccSaacnamtHisId castOther = (CrtDccSaacnamtHisId) other;

		return ((this.getSaAcctNo() == castOther.getSaAcctNo()) || (this
				.getSaAcctNo() != null
				&& castOther.getSaAcctNo() != null && this.getSaAcctNo()
				.equals(castOther.getSaAcctNo())))
				&& ((this.getSaCurrCod() == castOther.getSaCurrCod()) || (this
						.getSaCurrCod() != null
						&& castOther.getSaCurrCod() != null && this
						.getSaCurrCod().equals(castOther.getSaCurrCod())))
				&& ((this.getSaCurrIden() == castOther.getSaCurrIden()) || (this
						.getSaCurrIden() != null
						&& castOther.getSaCurrIden() != null && this
						.getSaCurrIden().equals(castOther.getSaCurrIden())))
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
				+ (getSaCurrCod() == null ? 0 : this.getSaCurrCod().hashCode());
		result = 37
				* result
				+ (getSaCurrIden() == null ? 0 : this.getSaCurrIden()
						.hashCode());
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