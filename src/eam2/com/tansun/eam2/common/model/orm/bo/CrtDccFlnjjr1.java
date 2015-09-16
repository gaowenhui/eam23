package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccFlnjjr1 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccFlnjjr1 extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccFlnjjr1Id id;
	private String lnjrnDbTimestamp;
	private String lnTxNo;
	private String lnAccdSubClsfn;
	private String lnAlfdDtRepayDt;
	private String lnTxTyp;
	private String lnDrCrCod;
	private Double lnTxAmt;
	private Double lnAtxBal;
	private String lnTxCurrCod;
	private Double lnFxr;
	private String lnTnrno;
	private String lnTxOprNo;
	private String lnAprvPicNo;
	private String lnLnDuedt;
	private String lnDlayLnRfnRsn;
	private String lnReconNoLn;
	private String lnExtnCtrtNo;
	private Double lnPprdRfnAmt;
	private Double lnPprdAmotzAvalIntr;
	private Double lnTxAmtPr;
	private Double lnTxAmtInt;
	private Double lnTxAmtAdvpmt;
	private String lnNoteNo;
	private String lnAdvpmtTyp;
	private Double lnPrFree;
	private String lnDscrp;
	private String lnDocNo;
	private String lnDocTyp;
	private String lnTxLogNo;
	private String lnRmrk;
	private String lnApclFlg;
	private String filler;

	// Constructors

	/** default constructor */
	public CrtDccFlnjjr1() {
	}

	/** minimal constructor */
	public CrtDccFlnjjr1(CrtDccFlnjjr1Id id) {
		this.id = id;
	}

	/** full constructor */
	public CrtDccFlnjjr1(CrtDccFlnjjr1Id id, String lnjrnDbTimestamp,
			String lnTxNo, String lnAccdSubClsfn, String lnAlfdDtRepayDt,
			String lnTxTyp, String lnDrCrCod, Double lnTxAmt, Double lnAtxBal,
			String lnTxCurrCod, Double lnFxr, String lnTnrno, String lnTxOprNo,
			String lnAprvPicNo, String lnLnDuedt, String lnDlayLnRfnRsn,
			String lnReconNoLn, String lnExtnCtrtNo, Double lnPprdRfnAmt,
			Double lnPprdAmotzAvalIntr, Double lnTxAmtPr, Double lnTxAmtInt,
			Double lnTxAmtAdvpmt, String lnNoteNo, String lnAdvpmtTyp,
			Double lnPrFree, String lnDscrp, String lnDocNo, String lnDocTyp,
			String lnTxLogNo, String lnRmrk, String lnApclFlg, String filler) {
		this.id = id;
		this.lnjrnDbTimestamp = lnjrnDbTimestamp;
		this.lnTxNo = lnTxNo;
		this.lnAccdSubClsfn = lnAccdSubClsfn;
		this.lnAlfdDtRepayDt = lnAlfdDtRepayDt;
		this.lnTxTyp = lnTxTyp;
		this.lnDrCrCod = lnDrCrCod;
		this.lnTxAmt = lnTxAmt;
		this.lnAtxBal = lnAtxBal;
		this.lnTxCurrCod = lnTxCurrCod;
		this.lnFxr = lnFxr;
		this.lnTnrno = lnTnrno;
		this.lnTxOprNo = lnTxOprNo;
		this.lnAprvPicNo = lnAprvPicNo;
		this.lnLnDuedt = lnLnDuedt;
		this.lnDlayLnRfnRsn = lnDlayLnRfnRsn;
		this.lnReconNoLn = lnReconNoLn;
		this.lnExtnCtrtNo = lnExtnCtrtNo;
		this.lnPprdRfnAmt = lnPprdRfnAmt;
		this.lnPprdAmotzAvalIntr = lnPprdAmotzAvalIntr;
		this.lnTxAmtPr = lnTxAmtPr;
		this.lnTxAmtInt = lnTxAmtInt;
		this.lnTxAmtAdvpmt = lnTxAmtAdvpmt;
		this.lnNoteNo = lnNoteNo;
		this.lnAdvpmtTyp = lnAdvpmtTyp;
		this.lnPrFree = lnPrFree;
		this.lnDscrp = lnDscrp;
		this.lnDocNo = lnDocNo;
		this.lnDocTyp = lnDocTyp;
		this.lnTxLogNo = lnTxLogNo;
		this.lnRmrk = lnRmrk;
		this.lnApclFlg = lnApclFlg;
		this.filler = filler;
	}

	// Property accessors

	public CrtDccFlnjjr1Id getId() {
		return this.id;
	}

	public void setId(CrtDccFlnjjr1Id id) {
		this.id = id;
	}

	public String getLnjrnDbTimestamp() {
		return this.lnjrnDbTimestamp;
	}

	public void setLnjrnDbTimestamp(String lnjrnDbTimestamp) {
		this.lnjrnDbTimestamp = lnjrnDbTimestamp;
	}

	public String getLnTxNo() {
		return this.lnTxNo;
	}

	public void setLnTxNo(String lnTxNo) {
		this.lnTxNo = lnTxNo;
	}

	public String getLnAccdSubClsfn() {
		return this.lnAccdSubClsfn;
	}

	public void setLnAccdSubClsfn(String lnAccdSubClsfn) {
		this.lnAccdSubClsfn = lnAccdSubClsfn;
	}

	public String getLnAlfdDtRepayDt() {
		return this.lnAlfdDtRepayDt;
	}

	public void setLnAlfdDtRepayDt(String lnAlfdDtRepayDt) {
		this.lnAlfdDtRepayDt = lnAlfdDtRepayDt;
	}

	public String getLnTxTyp() {
		return this.lnTxTyp;
	}

	public void setLnTxTyp(String lnTxTyp) {
		this.lnTxTyp = lnTxTyp;
	}

	public String getLnDrCrCod() {
		return this.lnDrCrCod;
	}

	public void setLnDrCrCod(String lnDrCrCod) {
		this.lnDrCrCod = lnDrCrCod;
	}

	public Double getLnTxAmt() {
		return this.lnTxAmt;
	}

	public void setLnTxAmt(Double lnTxAmt) {
		this.lnTxAmt = lnTxAmt;
	}

	public Double getLnAtxBal() {
		return this.lnAtxBal;
	}

	public void setLnAtxBal(Double lnAtxBal) {
		this.lnAtxBal = lnAtxBal;
	}

	public String getLnTxCurrCod() {
		return this.lnTxCurrCod;
	}

	public void setLnTxCurrCod(String lnTxCurrCod) {
		this.lnTxCurrCod = lnTxCurrCod;
	}

	public Double getLnFxr() {
		return this.lnFxr;
	}

	public void setLnFxr(Double lnFxr) {
		this.lnFxr = lnFxr;
	}

	public String getLnTnrno() {
		return this.lnTnrno;
	}

	public void setLnTnrno(String lnTnrno) {
		this.lnTnrno = lnTnrno;
	}

	public String getLnTxOprNo() {
		return this.lnTxOprNo;
	}

	public void setLnTxOprNo(String lnTxOprNo) {
		this.lnTxOprNo = lnTxOprNo;
	}

	public String getLnAprvPicNo() {
		return this.lnAprvPicNo;
	}

	public void setLnAprvPicNo(String lnAprvPicNo) {
		this.lnAprvPicNo = lnAprvPicNo;
	}

	public String getLnLnDuedt() {
		return this.lnLnDuedt;
	}

	public void setLnLnDuedt(String lnLnDuedt) {
		this.lnLnDuedt = lnLnDuedt;
	}

	public String getLnDlayLnRfnRsn() {
		return this.lnDlayLnRfnRsn;
	}

	public void setLnDlayLnRfnRsn(String lnDlayLnRfnRsn) {
		this.lnDlayLnRfnRsn = lnDlayLnRfnRsn;
	}

	public String getLnReconNoLn() {
		return this.lnReconNoLn;
	}

	public void setLnReconNoLn(String lnReconNoLn) {
		this.lnReconNoLn = lnReconNoLn;
	}

	public String getLnExtnCtrtNo() {
		return this.lnExtnCtrtNo;
	}

	public void setLnExtnCtrtNo(String lnExtnCtrtNo) {
		this.lnExtnCtrtNo = lnExtnCtrtNo;
	}

	public Double getLnPprdRfnAmt() {
		return this.lnPprdRfnAmt;
	}

	public void setLnPprdRfnAmt(Double lnPprdRfnAmt) {
		this.lnPprdRfnAmt = lnPprdRfnAmt;
	}

	public Double getLnPprdAmotzAvalIntr() {
		return this.lnPprdAmotzAvalIntr;
	}

	public void setLnPprdAmotzAvalIntr(Double lnPprdAmotzAvalIntr) {
		this.lnPprdAmotzAvalIntr = lnPprdAmotzAvalIntr;
	}

	public Double getLnTxAmtPr() {
		return this.lnTxAmtPr;
	}

	public void setLnTxAmtPr(Double lnTxAmtPr) {
		this.lnTxAmtPr = lnTxAmtPr;
	}

	public Double getLnTxAmtInt() {
		return this.lnTxAmtInt;
	}

	public void setLnTxAmtInt(Double lnTxAmtInt) {
		this.lnTxAmtInt = lnTxAmtInt;
	}

	public Double getLnTxAmtAdvpmt() {
		return this.lnTxAmtAdvpmt;
	}

	public void setLnTxAmtAdvpmt(Double lnTxAmtAdvpmt) {
		this.lnTxAmtAdvpmt = lnTxAmtAdvpmt;
	}

	public String getLnNoteNo() {
		return this.lnNoteNo;
	}

	public void setLnNoteNo(String lnNoteNo) {
		this.lnNoteNo = lnNoteNo;
	}

	public String getLnAdvpmtTyp() {
		return this.lnAdvpmtTyp;
	}

	public void setLnAdvpmtTyp(String lnAdvpmtTyp) {
		this.lnAdvpmtTyp = lnAdvpmtTyp;
	}

	public Double getLnPrFree() {
		return this.lnPrFree;
	}

	public void setLnPrFree(Double lnPrFree) {
		this.lnPrFree = lnPrFree;
	}

	public String getLnDscrp() {
		return this.lnDscrp;
	}

	public void setLnDscrp(String lnDscrp) {
		this.lnDscrp = lnDscrp;
	}

	public String getLnDocNo() {
		return this.lnDocNo;
	}

	public void setLnDocNo(String lnDocNo) {
		this.lnDocNo = lnDocNo;
	}

	public String getLnDocTyp() {
		return this.lnDocTyp;
	}

	public void setLnDocTyp(String lnDocTyp) {
		this.lnDocTyp = lnDocTyp;
	}

	public String getLnTxLogNo() {
		return this.lnTxLogNo;
	}

	public void setLnTxLogNo(String lnTxLogNo) {
		this.lnTxLogNo = lnTxLogNo;
	}

	public String getLnRmrk() {
		return this.lnRmrk;
	}

	public void setLnRmrk(String lnRmrk) {
		this.lnRmrk = lnRmrk;
	}

	public String getLnApclFlg() {
		return this.lnApclFlg;
	}

	public void setLnApclFlg(String lnApclFlg) {
		this.lnApclFlg = lnApclFlg;
	}

	public String getFiller() {
		return this.filler;
	}

	public void setFiller(String filler) {
		this.filler = filler;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}