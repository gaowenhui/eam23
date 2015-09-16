package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CrtSixReportId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtSixReportId extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private Date dataDate;
	private String glOpunCod;
	private String glLgNo;

	// Constructors

	/** default constructor */
	public CrtSixReportId() {
	}

	/** full constructor */
	public CrtSixReportId(Date dataDate, String glOpunCod, String glLgNo) {
		this.dataDate = dataDate;
		this.glOpunCod = glOpunCod;
		this.glLgNo = glLgNo;
	}

	// Property accessors

	public Date getDataDate() {
		return this.dataDate;
	}

	public void setDataDate(Date dataDate) {
		this.dataDate = dataDate;
	}

	public String getGlOpunCod() {
		return this.glOpunCod;
	}

	public void setGlOpunCod(String glOpunCod) {
		this.glOpunCod = glOpunCod;
	}

	public String getGlLgNo() {
		return this.glLgNo;
	}

	public void setGlLgNo(String glLgNo) {
		this.glLgNo = glLgNo;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CrtSixReportId))
			return false;
		CrtSixReportId castOther = (CrtSixReportId) other;

		return ((this.getDataDate() == castOther.getDataDate()) || (this
				.getDataDate() != null
				&& castOther.getDataDate() != null && this.getDataDate()
				.equals(castOther.getDataDate())))
				&& ((this.getGlOpunCod() == castOther.getGlOpunCod()) || (this
						.getGlOpunCod() != null
						&& castOther.getGlOpunCod() != null && this
						.getGlOpunCod().equals(castOther.getGlOpunCod())))
				&& ((this.getGlLgNo() == castOther.getGlLgNo()) || (this
						.getGlLgNo() != null
						&& castOther.getGlLgNo() != null && this.getGlLgNo()
						.equals(castOther.getGlLgNo())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getDataDate() == null ? 0 : this.getDataDate().hashCode());
		result = 37 * result
				+ (getGlOpunCod() == null ? 0 : this.getGlOpunCod().hashCode());
		result = 37 * result
				+ (getGlLgNo() == null ? 0 : this.getGlLgNo().hashCode());
		return result;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}