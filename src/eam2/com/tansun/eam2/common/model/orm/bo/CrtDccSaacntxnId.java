package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccSaacntxnId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccSaacntxnId extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String saAcctNo;
	private Long saDdpAcctNoDetN;

	// Constructors

	/** default constructor */
	public CrtDccSaacntxnId() {
	}

	/** full constructor */
	public CrtDccSaacntxnId(String saAcctNo, Long saDdpAcctNoDetN) {
		this.saAcctNo = saAcctNo;
		this.saDdpAcctNoDetN = saDdpAcctNoDetN;
	}

	// Property accessors

	public String getSaAcctNo() {
		return this.saAcctNo;
	}

	public void setSaAcctNo(String saAcctNo) {
		this.saAcctNo = saAcctNo;
	}

	public Long getSaDdpAcctNoDetN() {
		return this.saDdpAcctNoDetN;
	}

	public void setSaDdpAcctNoDetN(Long saDdpAcctNoDetN) {
		this.saDdpAcctNoDetN = saDdpAcctNoDetN;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CrtDccSaacntxnId))
			return false;
		CrtDccSaacntxnId castOther = (CrtDccSaacntxnId) other;

		return ((this.getSaAcctNo() == castOther.getSaAcctNo()) || (this
				.getSaAcctNo() != null
				&& castOther.getSaAcctNo() != null && this.getSaAcctNo()
				.equals(castOther.getSaAcctNo())))
				&& ((this.getSaDdpAcctNoDetN() == castOther
						.getSaDdpAcctNoDetN()) || (this.getSaDdpAcctNoDetN() != null
						&& castOther.getSaDdpAcctNoDetN() != null && this
						.getSaDdpAcctNoDetN().equals(
								castOther.getSaDdpAcctNoDetN())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getSaAcctNo() == null ? 0 : this.getSaAcctNo().hashCode());
		result = 37
				* result
				+ (getSaDdpAcctNoDetN() == null ? 0 : this.getSaDdpAcctNoDetN()
						.hashCode());
		return result;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}