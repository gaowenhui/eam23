package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccFlnjjr1Id entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccFlnjjr1Id extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String lnLnAcctNo;
	private String lnAccdTyp;
	private String lnAccdData;
	private String lnEntrDt;
	private String lnTxTm;
	private String lnAcctSqNo;

	// Constructors

	/** default constructor */
	public CrtDccFlnjjr1Id() {
	}

	/** full constructor */
	public CrtDccFlnjjr1Id(String lnLnAcctNo, String lnAccdTyp,
			String lnAccdData, String lnEntrDt, String lnTxTm, String lnAcctSqNo) {
		this.lnLnAcctNo = lnLnAcctNo;
		this.lnAccdTyp = lnAccdTyp;
		this.lnAccdData = lnAccdData;
		this.lnEntrDt = lnEntrDt;
		this.lnTxTm = lnTxTm;
		this.lnAcctSqNo = lnAcctSqNo;
	}

	// Property accessors

	public String getLnLnAcctNo() {
		return this.lnLnAcctNo;
	}

	public void setLnLnAcctNo(String lnLnAcctNo) {
		this.lnLnAcctNo = lnLnAcctNo;
	}

	public String getLnAccdTyp() {
		return this.lnAccdTyp;
	}

	public void setLnAccdTyp(String lnAccdTyp) {
		this.lnAccdTyp = lnAccdTyp;
	}

	public String getLnAccdData() {
		return this.lnAccdData;
	}

	public void setLnAccdData(String lnAccdData) {
		this.lnAccdData = lnAccdData;
	}

	public String getLnEntrDt() {
		return this.lnEntrDt;
	}

	public void setLnEntrDt(String lnEntrDt) {
		this.lnEntrDt = lnEntrDt;
	}

	public String getLnTxTm() {
		return this.lnTxTm;
	}

	public void setLnTxTm(String lnTxTm) {
		this.lnTxTm = lnTxTm;
	}

	public String getLnAcctSqNo() {
		return this.lnAcctSqNo;
	}

	public void setLnAcctSqNo(String lnAcctSqNo) {
		this.lnAcctSqNo = lnAcctSqNo;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CrtDccFlnjjr1Id))
			return false;
		CrtDccFlnjjr1Id castOther = (CrtDccFlnjjr1Id) other;

		return ((this.getLnLnAcctNo() == castOther.getLnLnAcctNo()) || (this
				.getLnLnAcctNo() != null
				&& castOther.getLnLnAcctNo() != null && this.getLnLnAcctNo()
				.equals(castOther.getLnLnAcctNo())))
				&& ((this.getLnAccdTyp() == castOther.getLnAccdTyp()) || (this
						.getLnAccdTyp() != null
						&& castOther.getLnAccdTyp() != null && this
						.getLnAccdTyp().equals(castOther.getLnAccdTyp())))
				&& ((this.getLnAccdData() == castOther.getLnAccdData()) || (this
						.getLnAccdData() != null
						&& castOther.getLnAccdData() != null && this
						.getLnAccdData().equals(castOther.getLnAccdData())))
				&& ((this.getLnEntrDt() == castOther.getLnEntrDt()) || (this
						.getLnEntrDt() != null
						&& castOther.getLnEntrDt() != null && this
						.getLnEntrDt().equals(castOther.getLnEntrDt())))
				&& ((this.getLnTxTm() == castOther.getLnTxTm()) || (this
						.getLnTxTm() != null
						&& castOther.getLnTxTm() != null && this.getLnTxTm()
						.equals(castOther.getLnTxTm())))
				&& ((this.getLnAcctSqNo() == castOther.getLnAcctSqNo()) || (this
						.getLnAcctSqNo() != null
						&& castOther.getLnAcctSqNo() != null && this
						.getLnAcctSqNo().equals(castOther.getLnAcctSqNo())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getLnLnAcctNo() == null ? 0 : this.getLnLnAcctNo()
						.hashCode());
		result = 37 * result
				+ (getLnAccdTyp() == null ? 0 : this.getLnAccdTyp().hashCode());
		result = 37
				* result
				+ (getLnAccdData() == null ? 0 : this.getLnAccdData()
						.hashCode());
		result = 37 * result
				+ (getLnEntrDt() == null ? 0 : this.getLnEntrDt().hashCode());
		result = 37 * result
				+ (getLnTxTm() == null ? 0 : this.getLnTxTm().hashCode());
		result = 37
				* result
				+ (getLnAcctSqNo() == null ? 0 : this.getLnAcctSqNo()
						.hashCode());
		return result;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}