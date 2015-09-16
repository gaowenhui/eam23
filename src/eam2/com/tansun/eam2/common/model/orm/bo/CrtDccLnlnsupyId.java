package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccLnlnsupyId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccLnlnsupyId extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String lnLnAcctNo;
	private String lnIntTyp;
	private String lnupyDbTimestamp;
	private Long lnIntcCutdt;
	private Double lnCacIntcPr;
	private Long lnIntcDays;
	private Double lnIntr;
	private Double lnIntrbl;
	private Double lnArfnInt;
	private Long lnEntrDt;
	private Long lnLstTxDt;
	private String filler;

	// Constructors

	/** default constructor */
	public CrtDccLnlnsupyId() {
	}

	/** full constructor */
	public CrtDccLnlnsupyId(String lnLnAcctNo, String lnIntTyp,
			String lnupyDbTimestamp, Long lnIntcCutdt, Double lnCacIntcPr,
			Long lnIntcDays, Double lnIntr, Double lnIntrbl, Double lnArfnInt,
			Long lnEntrDt, Long lnLstTxDt, String filler) {
		this.lnLnAcctNo = lnLnAcctNo;
		this.lnIntTyp = lnIntTyp;
		this.lnupyDbTimestamp = lnupyDbTimestamp;
		this.lnIntcCutdt = lnIntcCutdt;
		this.lnCacIntcPr = lnCacIntcPr;
		this.lnIntcDays = lnIntcDays;
		this.lnIntr = lnIntr;
		this.lnIntrbl = lnIntrbl;
		this.lnArfnInt = lnArfnInt;
		this.lnEntrDt = lnEntrDt;
		this.lnLstTxDt = lnLstTxDt;
		this.filler = filler;
	}

	// Property accessors

	public String getLnLnAcctNo() {
		return this.lnLnAcctNo;
	}

	public void setLnLnAcctNo(String lnLnAcctNo) {
		this.lnLnAcctNo = lnLnAcctNo;
	}

	public String getLnIntTyp() {
		return this.lnIntTyp;
	}

	public void setLnIntTyp(String lnIntTyp) {
		this.lnIntTyp = lnIntTyp;
	}

	public String getLnupyDbTimestamp() {
		return this.lnupyDbTimestamp;
	}

	public void setLnupyDbTimestamp(String lnupyDbTimestamp) {
		this.lnupyDbTimestamp = lnupyDbTimestamp;
	}

	public Long getLnIntcCutdt() {
		return this.lnIntcCutdt;
	}

	public void setLnIntcCutdt(Long lnIntcCutdt) {
		this.lnIntcCutdt = lnIntcCutdt;
	}

	public Double getLnCacIntcPr() {
		return this.lnCacIntcPr;
	}

	public void setLnCacIntcPr(Double lnCacIntcPr) {
		this.lnCacIntcPr = lnCacIntcPr;
	}

	public Long getLnIntcDays() {
		return this.lnIntcDays;
	}

	public void setLnIntcDays(Long lnIntcDays) {
		this.lnIntcDays = lnIntcDays;
	}

	public Double getLnIntr() {
		return this.lnIntr;
	}

	public void setLnIntr(Double lnIntr) {
		this.lnIntr = lnIntr;
	}

	public Double getLnIntrbl() {
		return this.lnIntrbl;
	}

	public void setLnIntrbl(Double lnIntrbl) {
		this.lnIntrbl = lnIntrbl;
	}

	public Double getLnArfnInt() {
		return this.lnArfnInt;
	}

	public void setLnArfnInt(Double lnArfnInt) {
		this.lnArfnInt = lnArfnInt;
	}

	public Long getLnEntrDt() {
		return this.lnEntrDt;
	}

	public void setLnEntrDt(Long lnEntrDt) {
		this.lnEntrDt = lnEntrDt;
	}

	public Long getLnLstTxDt() {
		return this.lnLstTxDt;
	}

	public void setLnLstTxDt(Long lnLstTxDt) {
		this.lnLstTxDt = lnLstTxDt;
	}

	public String getFiller() {
		return this.filler;
	}

	public void setFiller(String filler) {
		this.filler = filler;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CrtDccLnlnsupyId))
			return false;
		CrtDccLnlnsupyId castOther = (CrtDccLnlnsupyId) other;

		return ((this.getLnLnAcctNo() == castOther.getLnLnAcctNo()) || (this
				.getLnLnAcctNo() != null
				&& castOther.getLnLnAcctNo() != null && this.getLnLnAcctNo()
				.equals(castOther.getLnLnAcctNo())))
				&& ((this.getLnIntTyp() == castOther.getLnIntTyp()) || (this
						.getLnIntTyp() != null
						&& castOther.getLnIntTyp() != null && this
						.getLnIntTyp().equals(castOther.getLnIntTyp())))
				&& ((this.getLnupyDbTimestamp() == castOther
						.getLnupyDbTimestamp()) || (this.getLnupyDbTimestamp() != null
						&& castOther.getLnupyDbTimestamp() != null && this
						.getLnupyDbTimestamp().equals(
								castOther.getLnupyDbTimestamp())))
				&& ((this.getLnIntcCutdt() == castOther.getLnIntcCutdt()) || (this
						.getLnIntcCutdt() != null
						&& castOther.getLnIntcCutdt() != null && this
						.getLnIntcCutdt().equals(castOther.getLnIntcCutdt())))
				&& ((this.getLnCacIntcPr() == castOther.getLnCacIntcPr()) || (this
						.getLnCacIntcPr() != null
						&& castOther.getLnCacIntcPr() != null && this
						.getLnCacIntcPr().equals(castOther.getLnCacIntcPr())))
				&& ((this.getLnIntcDays() == castOther.getLnIntcDays()) || (this
						.getLnIntcDays() != null
						&& castOther.getLnIntcDays() != null && this
						.getLnIntcDays().equals(castOther.getLnIntcDays())))
				&& ((this.getLnIntr() == castOther.getLnIntr()) || (this
						.getLnIntr() != null
						&& castOther.getLnIntr() != null && this.getLnIntr()
						.equals(castOther.getLnIntr())))
				&& ((this.getLnIntrbl() == castOther.getLnIntrbl()) || (this
						.getLnIntrbl() != null
						&& castOther.getLnIntrbl() != null && this
						.getLnIntrbl().equals(castOther.getLnIntrbl())))
				&& ((this.getLnArfnInt() == castOther.getLnArfnInt()) || (this
						.getLnArfnInt() != null
						&& castOther.getLnArfnInt() != null && this
						.getLnArfnInt().equals(castOther.getLnArfnInt())))
				&& ((this.getLnEntrDt() == castOther.getLnEntrDt()) || (this
						.getLnEntrDt() != null
						&& castOther.getLnEntrDt() != null && this
						.getLnEntrDt().equals(castOther.getLnEntrDt())))
				&& ((this.getLnLstTxDt() == castOther.getLnLstTxDt()) || (this
						.getLnLstTxDt() != null
						&& castOther.getLnLstTxDt() != null && this
						.getLnLstTxDt().equals(castOther.getLnLstTxDt())))
				&& ((this.getFiller() == castOther.getFiller()) || (this
						.getFiller() != null
						&& castOther.getFiller() != null && this.getFiller()
						.equals(castOther.getFiller())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getLnLnAcctNo() == null ? 0 : this.getLnLnAcctNo()
						.hashCode());
		result = 37 * result
				+ (getLnIntTyp() == null ? 0 : this.getLnIntTyp().hashCode());
		result = 37
				* result
				+ (getLnupyDbTimestamp() == null ? 0 : this
						.getLnupyDbTimestamp().hashCode());
		result = 37
				* result
				+ (getLnIntcCutdt() == null ? 0 : this.getLnIntcCutdt()
						.hashCode());
		result = 37
				* result
				+ (getLnCacIntcPr() == null ? 0 : this.getLnCacIntcPr()
						.hashCode());
		result = 37
				* result
				+ (getLnIntcDays() == null ? 0 : this.getLnIntcDays()
						.hashCode());
		result = 37 * result
				+ (getLnIntr() == null ? 0 : this.getLnIntr().hashCode());
		result = 37 * result
				+ (getLnIntrbl() == null ? 0 : this.getLnIntrbl().hashCode());
		result = 37 * result
				+ (getLnArfnInt() == null ? 0 : this.getLnArfnInt().hashCode());
		result = 37 * result
				+ (getLnEntrDt() == null ? 0 : this.getLnEntrDt().hashCode());
		result = 37 * result
				+ (getLnLstTxDt() == null ? 0 : this.getLnLstTxDt().hashCode());
		result = 37 * result
				+ (getFiller() == null ? 0 : this.getFiller().hashCode());
		return result;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}