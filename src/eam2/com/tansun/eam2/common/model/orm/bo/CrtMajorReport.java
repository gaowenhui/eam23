package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtMajorReport entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtMajorReport extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtMajorReportId id;
	private Double secCurBal;
	private Double secYestdBal;
	private Double secLastMonthBal;
	private Double secFirstYearBal;
	private Double secLastYearBal;

	// Constructors

	/** default constructor */
	public CrtMajorReport() {
	}

	/** minimal constructor */
	public CrtMajorReport(CrtMajorReportId id) {
		this.id = id;
	}

	/** full constructor */
	public CrtMajorReport(CrtMajorReportId id, Double secCurBal,
			Double secYestdBal, Double secLastMonthBal, Double secFirstYearBal,
			Double secLastYearBal) {
		this.id = id;
		this.secCurBal = secCurBal;
		this.secYestdBal = secYestdBal;
		this.secLastMonthBal = secLastMonthBal;
		this.secFirstYearBal = secFirstYearBal;
		this.secLastYearBal = secLastYearBal;
	}

	// Property accessors

	public CrtMajorReportId getId() {
		return this.id;
	}

	public void setId(CrtMajorReportId id) {
		this.id = id;
	}

	public Double getSecCurBal() {
		return this.secCurBal;
	}

	public void setSecCurBal(Double secCurBal) {
		this.secCurBal = secCurBal;
	}

	public Double getSecYestdBal() {
		return this.secYestdBal;
	}

	public void setSecYestdBal(Double secYestdBal) {
		this.secYestdBal = secYestdBal;
	}

	public Double getSecLastMonthBal() {
		return this.secLastMonthBal;
	}

	public void setSecLastMonthBal(Double secLastMonthBal) {
		this.secLastMonthBal = secLastMonthBal;
	}

	public Double getSecFirstYearBal() {
		return this.secFirstYearBal;
	}

	public void setSecFirstYearBal(Double secFirstYearBal) {
		this.secFirstYearBal = secFirstYearBal;
	}

	public Double getSecLastYearBal() {
		return this.secLastYearBal;
	}

	public void setSecLastYearBal(Double secLastYearBal) {
		this.secLastYearBal = secLastYearBal;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}