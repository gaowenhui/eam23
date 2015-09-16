package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccGlglgglgId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccGlglgglgId extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String glOpunCod;
	private String glFinbusn;
	private String glCurrCodAuthor;
	private String glLgNo;
	private String glglgDbTimestamp;
	private Double glDrPrvsDayBal;
	private Double glCrPrvsDayBal;
	private Double glDrAmt;
	private Double glCrAmt;
	private Double glDrBal;
	private Double glCrBal;
	private Long glDrPrvsDayQty;
	private Long glCrPrvsDayQty;
	private Long glCrntDayDrQty;
	private Long glCrntDayCrQty;
	private Long glDrTodayNumber;
	private Long glCrTodayNumber;
	private Long glCrntDayDrDocCnt;
	private Long glCrntDayCrDocCnt;
	private Long glInterAcctSqNo;
	private String filler;

	// Constructors

	/** default constructor */
	public CrtDccGlglgglgId() {
	}

	/** minimal constructor */
	public CrtDccGlglgglgId(String glOpunCod, String glglgDbTimestamp,
			Double glDrPrvsDayBal, Double glCrPrvsDayBal, Double glDrAmt,
			Double glCrAmt, Double glDrBal, Double glCrBal,
			Long glDrPrvsDayQty, Long glCrPrvsDayQty, Long glCrntDayDrQty,
			Long glCrntDayCrQty, Long glDrTodayNumber, Long glCrTodayNumber,
			Long glCrntDayDrDocCnt, Long glCrntDayCrDocCnt,
			Long glInterAcctSqNo, String filler) {
		this.glOpunCod = glOpunCod;
		this.glglgDbTimestamp = glglgDbTimestamp;
		this.glDrPrvsDayBal = glDrPrvsDayBal;
		this.glCrPrvsDayBal = glCrPrvsDayBal;
		this.glDrAmt = glDrAmt;
		this.glCrAmt = glCrAmt;
		this.glDrBal = glDrBal;
		this.glCrBal = glCrBal;
		this.glDrPrvsDayQty = glDrPrvsDayQty;
		this.glCrPrvsDayQty = glCrPrvsDayQty;
		this.glCrntDayDrQty = glCrntDayDrQty;
		this.glCrntDayCrQty = glCrntDayCrQty;
		this.glDrTodayNumber = glDrTodayNumber;
		this.glCrTodayNumber = glCrTodayNumber;
		this.glCrntDayDrDocCnt = glCrntDayDrDocCnt;
		this.glCrntDayCrDocCnt = glCrntDayCrDocCnt;
		this.glInterAcctSqNo = glInterAcctSqNo;
		this.filler = filler;
	}

	/** full constructor */
	public CrtDccGlglgglgId(String glOpunCod, String glFinbusn,
			String glCurrCodAuthor, String glLgNo, String glglgDbTimestamp,
			Double glDrPrvsDayBal, Double glCrPrvsDayBal, Double glDrAmt,
			Double glCrAmt, Double glDrBal, Double glCrBal,
			Long glDrPrvsDayQty, Long glCrPrvsDayQty, Long glCrntDayDrQty,
			Long glCrntDayCrQty, Long glDrTodayNumber, Long glCrTodayNumber,
			Long glCrntDayDrDocCnt, Long glCrntDayCrDocCnt,
			Long glInterAcctSqNo, String filler) {
		this.glOpunCod = glOpunCod;
		this.glFinbusn = glFinbusn;
		this.glCurrCodAuthor = glCurrCodAuthor;
		this.glLgNo = glLgNo;
		this.glglgDbTimestamp = glglgDbTimestamp;
		this.glDrPrvsDayBal = glDrPrvsDayBal;
		this.glCrPrvsDayBal = glCrPrvsDayBal;
		this.glDrAmt = glDrAmt;
		this.glCrAmt = glCrAmt;
		this.glDrBal = glDrBal;
		this.glCrBal = glCrBal;
		this.glDrPrvsDayQty = glDrPrvsDayQty;
		this.glCrPrvsDayQty = glCrPrvsDayQty;
		this.glCrntDayDrQty = glCrntDayDrQty;
		this.glCrntDayCrQty = glCrntDayCrQty;
		this.glDrTodayNumber = glDrTodayNumber;
		this.glCrTodayNumber = glCrTodayNumber;
		this.glCrntDayDrDocCnt = glCrntDayDrDocCnt;
		this.glCrntDayCrDocCnt = glCrntDayCrDocCnt;
		this.glInterAcctSqNo = glInterAcctSqNo;
		this.filler = filler;
	}

	// Property accessors

	public String getGlOpunCod() {
		return this.glOpunCod;
	}

	public void setGlOpunCod(String glOpunCod) {
		this.glOpunCod = glOpunCod;
	}

	public String getGlFinbusn() {
		return this.glFinbusn;
	}

	public void setGlFinbusn(String glFinbusn) {
		this.glFinbusn = glFinbusn;
	}

	public String getGlCurrCodAuthor() {
		return this.glCurrCodAuthor;
	}

	public void setGlCurrCodAuthor(String glCurrCodAuthor) {
		this.glCurrCodAuthor = glCurrCodAuthor;
	}

	public String getGlLgNo() {
		return this.glLgNo;
	}

	public void setGlLgNo(String glLgNo) {
		this.glLgNo = glLgNo;
	}

	public String getGlglgDbTimestamp() {
		return this.glglgDbTimestamp;
	}

	public void setGlglgDbTimestamp(String glglgDbTimestamp) {
		this.glglgDbTimestamp = glglgDbTimestamp;
	}

	public Double getGlDrPrvsDayBal() {
		return this.glDrPrvsDayBal;
	}

	public void setGlDrPrvsDayBal(Double glDrPrvsDayBal) {
		this.glDrPrvsDayBal = glDrPrvsDayBal;
	}

	public Double getGlCrPrvsDayBal() {
		return this.glCrPrvsDayBal;
	}

	public void setGlCrPrvsDayBal(Double glCrPrvsDayBal) {
		this.glCrPrvsDayBal = glCrPrvsDayBal;
	}

	public Double getGlDrAmt() {
		return this.glDrAmt;
	}

	public void setGlDrAmt(Double glDrAmt) {
		this.glDrAmt = glDrAmt;
	}

	public Double getGlCrAmt() {
		return this.glCrAmt;
	}

	public void setGlCrAmt(Double glCrAmt) {
		this.glCrAmt = glCrAmt;
	}

	public Double getGlDrBal() {
		return this.glDrBal;
	}

	public void setGlDrBal(Double glDrBal) {
		this.glDrBal = glDrBal;
	}

	public Double getGlCrBal() {
		return this.glCrBal;
	}

	public void setGlCrBal(Double glCrBal) {
		this.glCrBal = glCrBal;
	}

	public Long getGlDrPrvsDayQty() {
		return this.glDrPrvsDayQty;
	}

	public void setGlDrPrvsDayQty(Long glDrPrvsDayQty) {
		this.glDrPrvsDayQty = glDrPrvsDayQty;
	}

	public Long getGlCrPrvsDayQty() {
		return this.glCrPrvsDayQty;
	}

	public void setGlCrPrvsDayQty(Long glCrPrvsDayQty) {
		this.glCrPrvsDayQty = glCrPrvsDayQty;
	}

	public Long getGlCrntDayDrQty() {
		return this.glCrntDayDrQty;
	}

	public void setGlCrntDayDrQty(Long glCrntDayDrQty) {
		this.glCrntDayDrQty = glCrntDayDrQty;
	}

	public Long getGlCrntDayCrQty() {
		return this.glCrntDayCrQty;
	}

	public void setGlCrntDayCrQty(Long glCrntDayCrQty) {
		this.glCrntDayCrQty = glCrntDayCrQty;
	}

	public Long getGlDrTodayNumber() {
		return this.glDrTodayNumber;
	}

	public void setGlDrTodayNumber(Long glDrTodayNumber) {
		this.glDrTodayNumber = glDrTodayNumber;
	}

	public Long getGlCrTodayNumber() {
		return this.glCrTodayNumber;
	}

	public void setGlCrTodayNumber(Long glCrTodayNumber) {
		this.glCrTodayNumber = glCrTodayNumber;
	}

	public Long getGlCrntDayDrDocCnt() {
		return this.glCrntDayDrDocCnt;
	}

	public void setGlCrntDayDrDocCnt(Long glCrntDayDrDocCnt) {
		this.glCrntDayDrDocCnt = glCrntDayDrDocCnt;
	}

	public Long getGlCrntDayCrDocCnt() {
		return this.glCrntDayCrDocCnt;
	}

	public void setGlCrntDayCrDocCnt(Long glCrntDayCrDocCnt) {
		this.glCrntDayCrDocCnt = glCrntDayCrDocCnt;
	}

	public Long getGlInterAcctSqNo() {
		return this.glInterAcctSqNo;
	}

	public void setGlInterAcctSqNo(Long glInterAcctSqNo) {
		this.glInterAcctSqNo = glInterAcctSqNo;
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
		if (!(other instanceof CrtDccGlglgglgId))
			return false;
		CrtDccGlglgglgId castOther = (CrtDccGlglgglgId) other;

		return ((this.getGlOpunCod() == castOther.getGlOpunCod()) || (this
				.getGlOpunCod() != null
				&& castOther.getGlOpunCod() != null && this.getGlOpunCod()
				.equals(castOther.getGlOpunCod())))
				&& ((this.getGlFinbusn() == castOther.getGlFinbusn()) || (this
						.getGlFinbusn() != null
						&& castOther.getGlFinbusn() != null && this
						.getGlFinbusn().equals(castOther.getGlFinbusn())))
				&& ((this.getGlCurrCodAuthor() == castOther
						.getGlCurrCodAuthor()) || (this.getGlCurrCodAuthor() != null
						&& castOther.getGlCurrCodAuthor() != null && this
						.getGlCurrCodAuthor().equals(
								castOther.getGlCurrCodAuthor())))
				&& ((this.getGlLgNo() == castOther.getGlLgNo()) || (this
						.getGlLgNo() != null
						&& castOther.getGlLgNo() != null && this.getGlLgNo()
						.equals(castOther.getGlLgNo())))
				&& ((this.getGlglgDbTimestamp() == castOther
						.getGlglgDbTimestamp()) || (this.getGlglgDbTimestamp() != null
						&& castOther.getGlglgDbTimestamp() != null && this
						.getGlglgDbTimestamp().equals(
								castOther.getGlglgDbTimestamp())))
				&& ((this.getGlDrPrvsDayBal() == castOther.getGlDrPrvsDayBal()) || (this
						.getGlDrPrvsDayBal() != null
						&& castOther.getGlDrPrvsDayBal() != null && this
						.getGlDrPrvsDayBal().equals(
								castOther.getGlDrPrvsDayBal())))
				&& ((this.getGlCrPrvsDayBal() == castOther.getGlCrPrvsDayBal()) || (this
						.getGlCrPrvsDayBal() != null
						&& castOther.getGlCrPrvsDayBal() != null && this
						.getGlCrPrvsDayBal().equals(
								castOther.getGlCrPrvsDayBal())))
				&& ((this.getGlDrAmt() == castOther.getGlDrAmt()) || (this
						.getGlDrAmt() != null
						&& castOther.getGlDrAmt() != null && this.getGlDrAmt()
						.equals(castOther.getGlDrAmt())))
				&& ((this.getGlCrAmt() == castOther.getGlCrAmt()) || (this
						.getGlCrAmt() != null
						&& castOther.getGlCrAmt() != null && this.getGlCrAmt()
						.equals(castOther.getGlCrAmt())))
				&& ((this.getGlDrBal() == castOther.getGlDrBal()) || (this
						.getGlDrBal() != null
						&& castOther.getGlDrBal() != null && this.getGlDrBal()
						.equals(castOther.getGlDrBal())))
				&& ((this.getGlCrBal() == castOther.getGlCrBal()) || (this
						.getGlCrBal() != null
						&& castOther.getGlCrBal() != null && this.getGlCrBal()
						.equals(castOther.getGlCrBal())))
				&& ((this.getGlDrPrvsDayQty() == castOther.getGlDrPrvsDayQty()) || (this
						.getGlDrPrvsDayQty() != null
						&& castOther.getGlDrPrvsDayQty() != null && this
						.getGlDrPrvsDayQty().equals(
								castOther.getGlDrPrvsDayQty())))
				&& ((this.getGlCrPrvsDayQty() == castOther.getGlCrPrvsDayQty()) || (this
						.getGlCrPrvsDayQty() != null
						&& castOther.getGlCrPrvsDayQty() != null && this
						.getGlCrPrvsDayQty().equals(
								castOther.getGlCrPrvsDayQty())))
				&& ((this.getGlCrntDayDrQty() == castOther.getGlCrntDayDrQty()) || (this
						.getGlCrntDayDrQty() != null
						&& castOther.getGlCrntDayDrQty() != null && this
						.getGlCrntDayDrQty().equals(
								castOther.getGlCrntDayDrQty())))
				&& ((this.getGlCrntDayCrQty() == castOther.getGlCrntDayCrQty()) || (this
						.getGlCrntDayCrQty() != null
						&& castOther.getGlCrntDayCrQty() != null && this
						.getGlCrntDayCrQty().equals(
								castOther.getGlCrntDayCrQty())))
				&& ((this.getGlDrTodayNumber() == castOther
						.getGlDrTodayNumber()) || (this.getGlDrTodayNumber() != null
						&& castOther.getGlDrTodayNumber() != null && this
						.getGlDrTodayNumber().equals(
								castOther.getGlDrTodayNumber())))
				&& ((this.getGlCrTodayNumber() == castOther
						.getGlCrTodayNumber()) || (this.getGlCrTodayNumber() != null
						&& castOther.getGlCrTodayNumber() != null && this
						.getGlCrTodayNumber().equals(
								castOther.getGlCrTodayNumber())))
				&& ((this.getGlCrntDayDrDocCnt() == castOther
						.getGlCrntDayDrDocCnt()) || (this
						.getGlCrntDayDrDocCnt() != null
						&& castOther.getGlCrntDayDrDocCnt() != null && this
						.getGlCrntDayDrDocCnt().equals(
								castOther.getGlCrntDayDrDocCnt())))
				&& ((this.getGlCrntDayCrDocCnt() == castOther
						.getGlCrntDayCrDocCnt()) || (this
						.getGlCrntDayCrDocCnt() != null
						&& castOther.getGlCrntDayCrDocCnt() != null && this
						.getGlCrntDayCrDocCnt().equals(
								castOther.getGlCrntDayCrDocCnt())))
				&& ((this.getGlInterAcctSqNo() == castOther
						.getGlInterAcctSqNo()) || (this.getGlInterAcctSqNo() != null
						&& castOther.getGlInterAcctSqNo() != null && this
						.getGlInterAcctSqNo().equals(
								castOther.getGlInterAcctSqNo())))
				&& ((this.getFiller() == castOther.getFiller()) || (this
						.getFiller() != null
						&& castOther.getFiller() != null && this.getFiller()
						.equals(castOther.getFiller())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getGlOpunCod() == null ? 0 : this.getGlOpunCod().hashCode());
		result = 37 * result
				+ (getGlFinbusn() == null ? 0 : this.getGlFinbusn().hashCode());
		result = 37
				* result
				+ (getGlCurrCodAuthor() == null ? 0 : this.getGlCurrCodAuthor()
						.hashCode());
		result = 37 * result
				+ (getGlLgNo() == null ? 0 : this.getGlLgNo().hashCode());
		result = 37
				* result
				+ (getGlglgDbTimestamp() == null ? 0 : this
						.getGlglgDbTimestamp().hashCode());
		result = 37
				* result
				+ (getGlDrPrvsDayBal() == null ? 0 : this.getGlDrPrvsDayBal()
						.hashCode());
		result = 37
				* result
				+ (getGlCrPrvsDayBal() == null ? 0 : this.getGlCrPrvsDayBal()
						.hashCode());
		result = 37 * result
				+ (getGlDrAmt() == null ? 0 : this.getGlDrAmt().hashCode());
		result = 37 * result
				+ (getGlCrAmt() == null ? 0 : this.getGlCrAmt().hashCode());
		result = 37 * result
				+ (getGlDrBal() == null ? 0 : this.getGlDrBal().hashCode());
		result = 37 * result
				+ (getGlCrBal() == null ? 0 : this.getGlCrBal().hashCode());
		result = 37
				* result
				+ (getGlDrPrvsDayQty() == null ? 0 : this.getGlDrPrvsDayQty()
						.hashCode());
		result = 37
				* result
				+ (getGlCrPrvsDayQty() == null ? 0 : this.getGlCrPrvsDayQty()
						.hashCode());
		result = 37
				* result
				+ (getGlCrntDayDrQty() == null ? 0 : this.getGlCrntDayDrQty()
						.hashCode());
		result = 37
				* result
				+ (getGlCrntDayCrQty() == null ? 0 : this.getGlCrntDayCrQty()
						.hashCode());
		result = 37
				* result
				+ (getGlDrTodayNumber() == null ? 0 : this.getGlDrTodayNumber()
						.hashCode());
		result = 37
				* result
				+ (getGlCrTodayNumber() == null ? 0 : this.getGlCrTodayNumber()
						.hashCode());
		result = 37
				* result
				+ (getGlCrntDayDrDocCnt() == null ? 0 : this
						.getGlCrntDayDrDocCnt().hashCode());
		result = 37
				* result
				+ (getGlCrntDayCrDocCnt() == null ? 0 : this
						.getGlCrntDayCrDocCnt().hashCode());
		result = 37
				* result
				+ (getGlInterAcctSqNo() == null ? 0 : this.getGlInterAcctSqNo()
						.hashCode());
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