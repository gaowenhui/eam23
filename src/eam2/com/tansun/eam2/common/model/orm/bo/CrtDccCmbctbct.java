package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccCmbctbct entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccCmbctbct extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String cmOpunCod;
	private Long cmbctLl;
	private String cmbctDbTimestamp;
	private String cmSavingDptCod;
	private String cmOpunFlnmChn;
	private String cmOpunInil1Chn;
	private String cmOpunInil2Chn;
	private String cmOpunAddrChn;
	private String cmOpunFlnmEng;
	private String cmOpunInilEng;
	private String cmOpunAddrEng;
	private String cmOpunTelNo;
	private String cmBkCod;
	private String cmInstnTyp;
	private String cmOpunSts;
	private String cmClnBillMasr;
	private String cmCorsPnbk;
	private String cmClnBillMicr;
	private String cmOfcCtbrh;
	private String cmBctReservedField1;
	private String cmFxBusnOpnDt;
	private String cmNbusnOpnDt;
	private String cmOpunLtstTxDt;
	private String cmSgniTm;
	private String cmSgnoTm;
	private String cmOprnStsChgTm;
	private String cmOpnSts;
	private String cmPdayClnShift;
	private String cmOpun;
	private String cmIbCrntOptSts;
	private String cmActgAcclRmrk;
	private String cmActgAcclTm;
	private String cmAcclTlrCod;
	private String cmAcclPicCod;
	private String cmCnclAcclTlrNo;
	private String cmCnclAcclPicNo;
	private String cmCnclAcclTm;
	private String cmSwiftCod;
	private String cmCminstCod;
	private String cmTaxNo;
	private String cmPrdsAwbDt;
	private String cmCuntTxStrtTm;
	private String cmAreaInil;
	private String cmEntBkCod;
	private String cmEntAccDef;
	private String cmSettClass;
	private String cmOfcCardBrh;
	private String cmFrontMacCode;
	private String cmLocClnFlg;
	private String cmFxBusnHqbk;
	private String cmRptManageBrh;
	private String cmAreaCode;
	private String cmClnMode;
	private String cmRmbCashBrh;
	private String cmFxCashBrh;
	private String cmFinaceAdmBrh;
	private String cmPayCrossAreaCode;
	private String cmBctReservedField;
	private String cmBnkMonFlag;
	private String cmCrManaGrad;
	private String cmSgniRmrk;
	private String cmCtrBnkIdCod;
	private String cmAccDtMod;
	private String filler;
	private String etlLoadDate;

	// Constructors

	/** default constructor */
	public CrtDccCmbctbct() {
	}

	/** minimal constructor */
	public CrtDccCmbctbct(String cmOpunCod) {
		this.cmOpunCod = cmOpunCod;
	}

	/** full constructor */
	public CrtDccCmbctbct(String cmOpunCod, Long cmbctLl,
			String cmbctDbTimestamp, String cmSavingDptCod,
			String cmOpunFlnmChn, String cmOpunInil1Chn, String cmOpunInil2Chn,
			String cmOpunAddrChn, String cmOpunFlnmEng, String cmOpunInilEng,
			String cmOpunAddrEng, String cmOpunTelNo, String cmBkCod,
			String cmInstnTyp, String cmOpunSts, String cmClnBillMasr,
			String cmCorsPnbk, String cmClnBillMicr, String cmOfcCtbrh,
			String cmBctReservedField1, String cmFxBusnOpnDt,
			String cmNbusnOpnDt, String cmOpunLtstTxDt, String cmSgniTm,
			String cmSgnoTm, String cmOprnStsChgTm, String cmOpnSts,
			String cmPdayClnShift, String cmOpun, String cmIbCrntOptSts,
			String cmActgAcclRmrk, String cmActgAcclTm, String cmAcclTlrCod,
			String cmAcclPicCod, String cmCnclAcclTlrNo,
			String cmCnclAcclPicNo, String cmCnclAcclTm, String cmSwiftCod,
			String cmCminstCod, String cmTaxNo, String cmPrdsAwbDt,
			String cmCuntTxStrtTm, String cmAreaInil, String cmEntBkCod,
			String cmEntAccDef, String cmSettClass, String cmOfcCardBrh,
			String cmFrontMacCode, String cmLocClnFlg, String cmFxBusnHqbk,
			String cmRptManageBrh, String cmAreaCode, String cmClnMode,
			String cmRmbCashBrh, String cmFxCashBrh, String cmFinaceAdmBrh,
			String cmPayCrossAreaCode, String cmBctReservedField,
			String cmBnkMonFlag, String cmCrManaGrad, String cmSgniRmrk,
			String cmCtrBnkIdCod, String cmAccDtMod, String filler,
			String etlLoadDate) {
		this.cmOpunCod = cmOpunCod;
		this.cmbctLl = cmbctLl;
		this.cmbctDbTimestamp = cmbctDbTimestamp;
		this.cmSavingDptCod = cmSavingDptCod;
		this.cmOpunFlnmChn = cmOpunFlnmChn;
		this.cmOpunInil1Chn = cmOpunInil1Chn;
		this.cmOpunInil2Chn = cmOpunInil2Chn;
		this.cmOpunAddrChn = cmOpunAddrChn;
		this.cmOpunFlnmEng = cmOpunFlnmEng;
		this.cmOpunInilEng = cmOpunInilEng;
		this.cmOpunAddrEng = cmOpunAddrEng;
		this.cmOpunTelNo = cmOpunTelNo;
		this.cmBkCod = cmBkCod;
		this.cmInstnTyp = cmInstnTyp;
		this.cmOpunSts = cmOpunSts;
		this.cmClnBillMasr = cmClnBillMasr;
		this.cmCorsPnbk = cmCorsPnbk;
		this.cmClnBillMicr = cmClnBillMicr;
		this.cmOfcCtbrh = cmOfcCtbrh;
		this.cmBctReservedField1 = cmBctReservedField1;
		this.cmFxBusnOpnDt = cmFxBusnOpnDt;
		this.cmNbusnOpnDt = cmNbusnOpnDt;
		this.cmOpunLtstTxDt = cmOpunLtstTxDt;
		this.cmSgniTm = cmSgniTm;
		this.cmSgnoTm = cmSgnoTm;
		this.cmOprnStsChgTm = cmOprnStsChgTm;
		this.cmOpnSts = cmOpnSts;
		this.cmPdayClnShift = cmPdayClnShift;
		this.cmOpun = cmOpun;
		this.cmIbCrntOptSts = cmIbCrntOptSts;
		this.cmActgAcclRmrk = cmActgAcclRmrk;
		this.cmActgAcclTm = cmActgAcclTm;
		this.cmAcclTlrCod = cmAcclTlrCod;
		this.cmAcclPicCod = cmAcclPicCod;
		this.cmCnclAcclTlrNo = cmCnclAcclTlrNo;
		this.cmCnclAcclPicNo = cmCnclAcclPicNo;
		this.cmCnclAcclTm = cmCnclAcclTm;
		this.cmSwiftCod = cmSwiftCod;
		this.cmCminstCod = cmCminstCod;
		this.cmTaxNo = cmTaxNo;
		this.cmPrdsAwbDt = cmPrdsAwbDt;
		this.cmCuntTxStrtTm = cmCuntTxStrtTm;
		this.cmAreaInil = cmAreaInil;
		this.cmEntBkCod = cmEntBkCod;
		this.cmEntAccDef = cmEntAccDef;
		this.cmSettClass = cmSettClass;
		this.cmOfcCardBrh = cmOfcCardBrh;
		this.cmFrontMacCode = cmFrontMacCode;
		this.cmLocClnFlg = cmLocClnFlg;
		this.cmFxBusnHqbk = cmFxBusnHqbk;
		this.cmRptManageBrh = cmRptManageBrh;
		this.cmAreaCode = cmAreaCode;
		this.cmClnMode = cmClnMode;
		this.cmRmbCashBrh = cmRmbCashBrh;
		this.cmFxCashBrh = cmFxCashBrh;
		this.cmFinaceAdmBrh = cmFinaceAdmBrh;
		this.cmPayCrossAreaCode = cmPayCrossAreaCode;
		this.cmBctReservedField = cmBctReservedField;
		this.cmBnkMonFlag = cmBnkMonFlag;
		this.cmCrManaGrad = cmCrManaGrad;
		this.cmSgniRmrk = cmSgniRmrk;
		this.cmCtrBnkIdCod = cmCtrBnkIdCod;
		this.cmAccDtMod = cmAccDtMod;
		this.filler = filler;
		this.etlLoadDate = etlLoadDate;
	}

	// Property accessors

	public String getCmOpunCod() {
		return this.cmOpunCod;
	}

	public void setCmOpunCod(String cmOpunCod) {
		this.cmOpunCod = cmOpunCod;
	}

	public Long getCmbctLl() {
		return this.cmbctLl;
	}

	public void setCmbctLl(Long cmbctLl) {
		this.cmbctLl = cmbctLl;
	}

	public String getCmbctDbTimestamp() {
		return this.cmbctDbTimestamp;
	}

	public void setCmbctDbTimestamp(String cmbctDbTimestamp) {
		this.cmbctDbTimestamp = cmbctDbTimestamp;
	}

	public String getCmSavingDptCod() {
		return this.cmSavingDptCod;
	}

	public void setCmSavingDptCod(String cmSavingDptCod) {
		this.cmSavingDptCod = cmSavingDptCod;
	}

	public String getCmOpunFlnmChn() {
		return this.cmOpunFlnmChn;
	}

	public void setCmOpunFlnmChn(String cmOpunFlnmChn) {
		this.cmOpunFlnmChn = cmOpunFlnmChn;
	}

	public String getCmOpunInil1Chn() {
		return this.cmOpunInil1Chn;
	}

	public void setCmOpunInil1Chn(String cmOpunInil1Chn) {
		this.cmOpunInil1Chn = cmOpunInil1Chn;
	}

	public String getCmOpunInil2Chn() {
		return this.cmOpunInil2Chn;
	}

	public void setCmOpunInil2Chn(String cmOpunInil2Chn) {
		this.cmOpunInil2Chn = cmOpunInil2Chn;
	}

	public String getCmOpunAddrChn() {
		return this.cmOpunAddrChn;
	}

	public void setCmOpunAddrChn(String cmOpunAddrChn) {
		this.cmOpunAddrChn = cmOpunAddrChn;
	}

	public String getCmOpunFlnmEng() {
		return this.cmOpunFlnmEng;
	}

	public void setCmOpunFlnmEng(String cmOpunFlnmEng) {
		this.cmOpunFlnmEng = cmOpunFlnmEng;
	}

	public String getCmOpunInilEng() {
		return this.cmOpunInilEng;
	}

	public void setCmOpunInilEng(String cmOpunInilEng) {
		this.cmOpunInilEng = cmOpunInilEng;
	}

	public String getCmOpunAddrEng() {
		return this.cmOpunAddrEng;
	}

	public void setCmOpunAddrEng(String cmOpunAddrEng) {
		this.cmOpunAddrEng = cmOpunAddrEng;
	}

	public String getCmOpunTelNo() {
		return this.cmOpunTelNo;
	}

	public void setCmOpunTelNo(String cmOpunTelNo) {
		this.cmOpunTelNo = cmOpunTelNo;
	}

	public String getCmBkCod() {
		return this.cmBkCod;
	}

	public void setCmBkCod(String cmBkCod) {
		this.cmBkCod = cmBkCod;
	}

	public String getCmInstnTyp() {
		return this.cmInstnTyp;
	}

	public void setCmInstnTyp(String cmInstnTyp) {
		this.cmInstnTyp = cmInstnTyp;
	}

	public String getCmOpunSts() {
		return this.cmOpunSts;
	}

	public void setCmOpunSts(String cmOpunSts) {
		this.cmOpunSts = cmOpunSts;
	}

	public String getCmClnBillMasr() {
		return this.cmClnBillMasr;
	}

	public void setCmClnBillMasr(String cmClnBillMasr) {
		this.cmClnBillMasr = cmClnBillMasr;
	}

	public String getCmCorsPnbk() {
		return this.cmCorsPnbk;
	}

	public void setCmCorsPnbk(String cmCorsPnbk) {
		this.cmCorsPnbk = cmCorsPnbk;
	}

	public String getCmClnBillMicr() {
		return this.cmClnBillMicr;
	}

	public void setCmClnBillMicr(String cmClnBillMicr) {
		this.cmClnBillMicr = cmClnBillMicr;
	}

	public String getCmOfcCtbrh() {
		return this.cmOfcCtbrh;
	}

	public void setCmOfcCtbrh(String cmOfcCtbrh) {
		this.cmOfcCtbrh = cmOfcCtbrh;
	}

	public String getCmBctReservedField1() {
		return this.cmBctReservedField1;
	}

	public void setCmBctReservedField1(String cmBctReservedField1) {
		this.cmBctReservedField1 = cmBctReservedField1;
	}

	public String getCmFxBusnOpnDt() {
		return this.cmFxBusnOpnDt;
	}

	public void setCmFxBusnOpnDt(String cmFxBusnOpnDt) {
		this.cmFxBusnOpnDt = cmFxBusnOpnDt;
	}

	public String getCmNbusnOpnDt() {
		return this.cmNbusnOpnDt;
	}

	public void setCmNbusnOpnDt(String cmNbusnOpnDt) {
		this.cmNbusnOpnDt = cmNbusnOpnDt;
	}

	public String getCmOpunLtstTxDt() {
		return this.cmOpunLtstTxDt;
	}

	public void setCmOpunLtstTxDt(String cmOpunLtstTxDt) {
		this.cmOpunLtstTxDt = cmOpunLtstTxDt;
	}

	public String getCmSgniTm() {
		return this.cmSgniTm;
	}

	public void setCmSgniTm(String cmSgniTm) {
		this.cmSgniTm = cmSgniTm;
	}

	public String getCmSgnoTm() {
		return this.cmSgnoTm;
	}

	public void setCmSgnoTm(String cmSgnoTm) {
		this.cmSgnoTm = cmSgnoTm;
	}

	public String getCmOprnStsChgTm() {
		return this.cmOprnStsChgTm;
	}

	public void setCmOprnStsChgTm(String cmOprnStsChgTm) {
		this.cmOprnStsChgTm = cmOprnStsChgTm;
	}

	public String getCmOpnSts() {
		return this.cmOpnSts;
	}

	public void setCmOpnSts(String cmOpnSts) {
		this.cmOpnSts = cmOpnSts;
	}

	public String getCmPdayClnShift() {
		return this.cmPdayClnShift;
	}

	public void setCmPdayClnShift(String cmPdayClnShift) {
		this.cmPdayClnShift = cmPdayClnShift;
	}

	public String getCmOpun() {
		return this.cmOpun;
	}

	public void setCmOpun(String cmOpun) {
		this.cmOpun = cmOpun;
	}

	public String getCmIbCrntOptSts() {
		return this.cmIbCrntOptSts;
	}

	public void setCmIbCrntOptSts(String cmIbCrntOptSts) {
		this.cmIbCrntOptSts = cmIbCrntOptSts;
	}

	public String getCmActgAcclRmrk() {
		return this.cmActgAcclRmrk;
	}

	public void setCmActgAcclRmrk(String cmActgAcclRmrk) {
		this.cmActgAcclRmrk = cmActgAcclRmrk;
	}

	public String getCmActgAcclTm() {
		return this.cmActgAcclTm;
	}

	public void setCmActgAcclTm(String cmActgAcclTm) {
		this.cmActgAcclTm = cmActgAcclTm;
	}

	public String getCmAcclTlrCod() {
		return this.cmAcclTlrCod;
	}

	public void setCmAcclTlrCod(String cmAcclTlrCod) {
		this.cmAcclTlrCod = cmAcclTlrCod;
	}

	public String getCmAcclPicCod() {
		return this.cmAcclPicCod;
	}

	public void setCmAcclPicCod(String cmAcclPicCod) {
		this.cmAcclPicCod = cmAcclPicCod;
	}

	public String getCmCnclAcclTlrNo() {
		return this.cmCnclAcclTlrNo;
	}

	public void setCmCnclAcclTlrNo(String cmCnclAcclTlrNo) {
		this.cmCnclAcclTlrNo = cmCnclAcclTlrNo;
	}

	public String getCmCnclAcclPicNo() {
		return this.cmCnclAcclPicNo;
	}

	public void setCmCnclAcclPicNo(String cmCnclAcclPicNo) {
		this.cmCnclAcclPicNo = cmCnclAcclPicNo;
	}

	public String getCmCnclAcclTm() {
		return this.cmCnclAcclTm;
	}

	public void setCmCnclAcclTm(String cmCnclAcclTm) {
		this.cmCnclAcclTm = cmCnclAcclTm;
	}

	public String getCmSwiftCod() {
		return this.cmSwiftCod;
	}

	public void setCmSwiftCod(String cmSwiftCod) {
		this.cmSwiftCod = cmSwiftCod;
	}

	public String getCmCminstCod() {
		return this.cmCminstCod;
	}

	public void setCmCminstCod(String cmCminstCod) {
		this.cmCminstCod = cmCminstCod;
	}

	public String getCmTaxNo() {
		return this.cmTaxNo;
	}

	public void setCmTaxNo(String cmTaxNo) {
		this.cmTaxNo = cmTaxNo;
	}

	public String getCmPrdsAwbDt() {
		return this.cmPrdsAwbDt;
	}

	public void setCmPrdsAwbDt(String cmPrdsAwbDt) {
		this.cmPrdsAwbDt = cmPrdsAwbDt;
	}

	public String getCmCuntTxStrtTm() {
		return this.cmCuntTxStrtTm;
	}

	public void setCmCuntTxStrtTm(String cmCuntTxStrtTm) {
		this.cmCuntTxStrtTm = cmCuntTxStrtTm;
	}

	public String getCmAreaInil() {
		return this.cmAreaInil;
	}

	public void setCmAreaInil(String cmAreaInil) {
		this.cmAreaInil = cmAreaInil;
	}

	public String getCmEntBkCod() {
		return this.cmEntBkCod;
	}

	public void setCmEntBkCod(String cmEntBkCod) {
		this.cmEntBkCod = cmEntBkCod;
	}

	public String getCmEntAccDef() {
		return this.cmEntAccDef;
	}

	public void setCmEntAccDef(String cmEntAccDef) {
		this.cmEntAccDef = cmEntAccDef;
	}

	public String getCmSettClass() {
		return this.cmSettClass;
	}

	public void setCmSettClass(String cmSettClass) {
		this.cmSettClass = cmSettClass;
	}

	public String getCmOfcCardBrh() {
		return this.cmOfcCardBrh;
	}

	public void setCmOfcCardBrh(String cmOfcCardBrh) {
		this.cmOfcCardBrh = cmOfcCardBrh;
	}

	public String getCmFrontMacCode() {
		return this.cmFrontMacCode;
	}

	public void setCmFrontMacCode(String cmFrontMacCode) {
		this.cmFrontMacCode = cmFrontMacCode;
	}

	public String getCmLocClnFlg() {
		return this.cmLocClnFlg;
	}

	public void setCmLocClnFlg(String cmLocClnFlg) {
		this.cmLocClnFlg = cmLocClnFlg;
	}

	public String getCmFxBusnHqbk() {
		return this.cmFxBusnHqbk;
	}

	public void setCmFxBusnHqbk(String cmFxBusnHqbk) {
		this.cmFxBusnHqbk = cmFxBusnHqbk;
	}

	public String getCmRptManageBrh() {
		return this.cmRptManageBrh;
	}

	public void setCmRptManageBrh(String cmRptManageBrh) {
		this.cmRptManageBrh = cmRptManageBrh;
	}

	public String getCmAreaCode() {
		return this.cmAreaCode;
	}

	public void setCmAreaCode(String cmAreaCode) {
		this.cmAreaCode = cmAreaCode;
	}

	public String getCmClnMode() {
		return this.cmClnMode;
	}

	public void setCmClnMode(String cmClnMode) {
		this.cmClnMode = cmClnMode;
	}

	public String getCmRmbCashBrh() {
		return this.cmRmbCashBrh;
	}

	public void setCmRmbCashBrh(String cmRmbCashBrh) {
		this.cmRmbCashBrh = cmRmbCashBrh;
	}

	public String getCmFxCashBrh() {
		return this.cmFxCashBrh;
	}

	public void setCmFxCashBrh(String cmFxCashBrh) {
		this.cmFxCashBrh = cmFxCashBrh;
	}

	public String getCmFinaceAdmBrh() {
		return this.cmFinaceAdmBrh;
	}

	public void setCmFinaceAdmBrh(String cmFinaceAdmBrh) {
		this.cmFinaceAdmBrh = cmFinaceAdmBrh;
	}

	public String getCmPayCrossAreaCode() {
		return this.cmPayCrossAreaCode;
	}

	public void setCmPayCrossAreaCode(String cmPayCrossAreaCode) {
		this.cmPayCrossAreaCode = cmPayCrossAreaCode;
	}

	public String getCmBctReservedField() {
		return this.cmBctReservedField;
	}

	public void setCmBctReservedField(String cmBctReservedField) {
		this.cmBctReservedField = cmBctReservedField;
	}

	public String getCmBnkMonFlag() {
		return this.cmBnkMonFlag;
	}

	public void setCmBnkMonFlag(String cmBnkMonFlag) {
		this.cmBnkMonFlag = cmBnkMonFlag;
	}

	public String getCmCrManaGrad() {
		return this.cmCrManaGrad;
	}

	public void setCmCrManaGrad(String cmCrManaGrad) {
		this.cmCrManaGrad = cmCrManaGrad;
	}

	public String getCmSgniRmrk() {
		return this.cmSgniRmrk;
	}

	public void setCmSgniRmrk(String cmSgniRmrk) {
		this.cmSgniRmrk = cmSgniRmrk;
	}

	public String getCmCtrBnkIdCod() {
		return this.cmCtrBnkIdCod;
	}

	public void setCmCtrBnkIdCod(String cmCtrBnkIdCod) {
		this.cmCtrBnkIdCod = cmCtrBnkIdCod;
	}

	public String getCmAccDtMod() {
		return this.cmAccDtMod;
	}

	public void setCmAccDtMod(String cmAccDtMod) {
		this.cmAccDtMod = cmAccDtMod;
	}

	public String getFiller() {
		return this.filler;
	}

	public void setFiller(String filler) {
		this.filler = filler;
	}

	public String getEtlLoadDate() {
		return this.etlLoadDate;
	}

	public void setEtlLoadDate(String etlLoadDate) {
		this.etlLoadDate = etlLoadDate;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}