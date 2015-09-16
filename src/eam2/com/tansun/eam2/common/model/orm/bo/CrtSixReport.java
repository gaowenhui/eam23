package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtSixReport entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtSixReport extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtSixReportId id;
	private String balanceDir;
	private Double lastBorrBal;
	private Double lastLoanBal;
	private Double peroidBorrBal;
	private Double periodLoanBal;
	private Double firstBorrBal;
	private Double firstLoanBal;
	private Double preBorrBal;
	private Double preLoanBal;
	private Double endBorrBal;
	private Double endLoanBal;
	private Double curCumBorrAmt;
	private Double curCumLoanAmt;
	private Double yearBorrCumAmt;
	private Double yearLoanCumAmt;

	// Constructors

	/** default constructor */
	public CrtSixReport() {
	}

	/** minimal constructor */
	public CrtSixReport(CrtSixReportId id) {
		this.id = id;
	}

	/** full constructor */
	public CrtSixReport(CrtSixReportId id, String balanceDir,
			Double lastBorrBal, Double lastLoanBal, Double peroidBorrBal,
			Double periodLoanBal, Double firstBorrBal, Double firstLoanBal,
			Double preBorrBal, Double preLoanBal, Double endBorrBal,
			Double endLoanBal, Double curCumBorrAmt, Double curCumLoanAmt,
			Double yearBorrCumAmt, Double yearLoanCumAmt) {
		this.id = id;
		this.balanceDir = balanceDir;
		this.lastBorrBal = lastBorrBal;
		this.lastLoanBal = lastLoanBal;
		this.peroidBorrBal = peroidBorrBal;
		this.periodLoanBal = periodLoanBal;
		this.firstBorrBal = firstBorrBal;
		this.firstLoanBal = firstLoanBal;
		this.preBorrBal = preBorrBal;
		this.preLoanBal = preLoanBal;
		this.endBorrBal = endBorrBal;
		this.endLoanBal = endLoanBal;
		this.curCumBorrAmt = curCumBorrAmt;
		this.curCumLoanAmt = curCumLoanAmt;
		this.yearBorrCumAmt = yearBorrCumAmt;
		this.yearLoanCumAmt = yearLoanCumAmt;
	}

	// Property accessors

	public CrtSixReportId getId() {
		return this.id;
	}

	public void setId(CrtSixReportId id) {
		this.id = id;
	}

	public String getBalanceDir() {
		return this.balanceDir;
	}

	public void setBalanceDir(String balanceDir) {
		this.balanceDir = balanceDir;
	}

	public Double getLastBorrBal() {
		return this.lastBorrBal;
	}

	public void setLastBorrBal(Double lastBorrBal) {
		this.lastBorrBal = lastBorrBal;
	}

	public Double getLastLoanBal() {
		return this.lastLoanBal;
	}

	public void setLastLoanBal(Double lastLoanBal) {
		this.lastLoanBal = lastLoanBal;
	}

	public Double getPeroidBorrBal() {
		return this.peroidBorrBal;
	}

	public void setPeroidBorrBal(Double peroidBorrBal) {
		this.peroidBorrBal = peroidBorrBal;
	}

	public Double getPeriodLoanBal() {
		return this.periodLoanBal;
	}

	public void setPeriodLoanBal(Double periodLoanBal) {
		this.periodLoanBal = periodLoanBal;
	}

	public Double getFirstBorrBal() {
		return this.firstBorrBal;
	}

	public void setFirstBorrBal(Double firstBorrBal) {
		this.firstBorrBal = firstBorrBal;
	}

	public Double getFirstLoanBal() {
		return this.firstLoanBal;
	}

	public void setFirstLoanBal(Double firstLoanBal) {
		this.firstLoanBal = firstLoanBal;
	}

	public Double getPreBorrBal() {
		return this.preBorrBal;
	}

	public void setPreBorrBal(Double preBorrBal) {
		this.preBorrBal = preBorrBal;
	}

	public Double getPreLoanBal() {
		return this.preLoanBal;
	}

	public void setPreLoanBal(Double preLoanBal) {
		this.preLoanBal = preLoanBal;
	}

	public Double getEndBorrBal() {
		return this.endBorrBal;
	}

	public void setEndBorrBal(Double endBorrBal) {
		this.endBorrBal = endBorrBal;
	}

	public Double getEndLoanBal() {
		return this.endLoanBal;
	}

	public void setEndLoanBal(Double endLoanBal) {
		this.endLoanBal = endLoanBal;
	}

	public Double getCurCumBorrAmt() {
		return this.curCumBorrAmt;
	}

	public void setCurCumBorrAmt(Double curCumBorrAmt) {
		this.curCumBorrAmt = curCumBorrAmt;
	}

	public Double getCurCumLoanAmt() {
		return this.curCumLoanAmt;
	}

	public void setCurCumLoanAmt(Double curCumLoanAmt) {
		this.curCumLoanAmt = curCumLoanAmt;
	}

	public Double getYearBorrCumAmt() {
		return this.yearBorrCumAmt;
	}

	public void setYearBorrCumAmt(Double yearBorrCumAmt) {
		this.yearBorrCumAmt = yearBorrCumAmt;
	}

	public Double getYearLoanCumAmt() {
		return this.yearLoanCumAmt;
	}

	public void setYearLoanCumAmt(Double yearLoanCumAmt) {
		this.yearLoanCumAmt = yearLoanCumAmt;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}