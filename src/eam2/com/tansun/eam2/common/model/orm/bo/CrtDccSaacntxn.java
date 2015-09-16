package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccSaacntxn entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccSaacntxn extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccSaacntxnId id;
	private Long satxnLl;
	private String satxnDbTimestamp;
	private String saCurrCod;
	private String saOprNo;
	private String saCurrIden;
	private String saEcFlg;
	private Long saEcDetNo;
	private Double saCrAmt;
	private Double saDdpAcctBal;
	private Double saTxAmt;
	private String saTxCrdNo;
	private String saTxTyp;
	private String saTxLogNo;
	private Double saDrAmt;
	private String saDocNo;
	private String saDocTyp;
	private String saValDt;
	private Double saSvc;
	private String saAuthNo;
	private String saCustDocagStno;
	private String saOpunCod;
	private String saDscrpCod;
	private String saRmrk;
	private String saTxTm;
	private String saTxDt;
	private String saSysDt;
	private Double saDdpPdt;
	private String saAppTxCode;
	private String saEtxFlg;
	private String saOtxFlg;
	private String filler;
	private String saRmrk1;
	private String saOpCustName;

	// Constructors

	/** default constructor */
	public CrtDccSaacntxn() {
	}

	/** minimal constructor */
	public CrtDccSaacntxn(CrtDccSaacntxnId id) {
		this.id = id;
	}

	/** full constructor */
	public CrtDccSaacntxn(CrtDccSaacntxnId id, Long satxnLl,
			String satxnDbTimestamp, String saCurrCod, String saOprNo,
			String saCurrIden, String saEcFlg, Long saEcDetNo, Double saCrAmt,
			Double saDdpAcctBal, Double saTxAmt, String saTxCrdNo,
			String saTxTyp, String saTxLogNo, Double saDrAmt, String saDocNo,
			String saDocTyp, String saValDt, Double saSvc, String saAuthNo,
			String saCustDocagStno, String saOpunCod, String saDscrpCod,
			String saRmrk, String saTxTm, String saTxDt, String saSysDt,
			Double saDdpPdt, String saAppTxCode, String saEtxFlg,
			String saOtxFlg, String filler, String saRmrk1, String saOpCustName) {
		this.id = id;
		this.satxnLl = satxnLl;
		this.satxnDbTimestamp = satxnDbTimestamp;
		this.saCurrCod = saCurrCod;
		this.saOprNo = saOprNo;
		this.saCurrIden = saCurrIden;
		this.saEcFlg = saEcFlg;
		this.saEcDetNo = saEcDetNo;
		this.saCrAmt = saCrAmt;
		this.saDdpAcctBal = saDdpAcctBal;
		this.saTxAmt = saTxAmt;
		this.saTxCrdNo = saTxCrdNo;
		this.saTxTyp = saTxTyp;
		this.saTxLogNo = saTxLogNo;
		this.saDrAmt = saDrAmt;
		this.saDocNo = saDocNo;
		this.saDocTyp = saDocTyp;
		this.saValDt = saValDt;
		this.saSvc = saSvc;
		this.saAuthNo = saAuthNo;
		this.saCustDocagStno = saCustDocagStno;
		this.saOpunCod = saOpunCod;
		this.saDscrpCod = saDscrpCod;
		this.saRmrk = saRmrk;
		this.saTxTm = saTxTm;
		this.saTxDt = saTxDt;
		this.saSysDt = saSysDt;
		this.saDdpPdt = saDdpPdt;
		this.saAppTxCode = saAppTxCode;
		this.saEtxFlg = saEtxFlg;
		this.saOtxFlg = saOtxFlg;
		this.filler = filler;
		this.saRmrk1 = saRmrk1;
		this.saOpCustName = saOpCustName;
	}

	// Property accessors

	public CrtDccSaacntxnId getId() {
		return this.id;
	}

	public void setId(CrtDccSaacntxnId id) {
		this.id = id;
	}

	public Long getSatxnLl() {
		return this.satxnLl;
	}

	public void setSatxnLl(Long satxnLl) {
		this.satxnLl = satxnLl;
	}

	public String getSatxnDbTimestamp() {
		return this.satxnDbTimestamp;
	}

	public void setSatxnDbTimestamp(String satxnDbTimestamp) {
		this.satxnDbTimestamp = satxnDbTimestamp;
	}

	public String getSaCurrCod() {
		return this.saCurrCod;
	}

	public void setSaCurrCod(String saCurrCod) {
		this.saCurrCod = saCurrCod;
	}

	public String getSaOprNo() {
		return this.saOprNo;
	}

	public void setSaOprNo(String saOprNo) {
		this.saOprNo = saOprNo;
	}

	public String getSaCurrIden() {
		return this.saCurrIden;
	}

	public void setSaCurrIden(String saCurrIden) {
		this.saCurrIden = saCurrIden;
	}

	public String getSaEcFlg() {
		return this.saEcFlg;
	}

	public void setSaEcFlg(String saEcFlg) {
		this.saEcFlg = saEcFlg;
	}

	public Long getSaEcDetNo() {
		return this.saEcDetNo;
	}

	public void setSaEcDetNo(Long saEcDetNo) {
		this.saEcDetNo = saEcDetNo;
	}

	public Double getSaCrAmt() {
		return this.saCrAmt;
	}

	public void setSaCrAmt(Double saCrAmt) {
		this.saCrAmt = saCrAmt;
	}

	public Double getSaDdpAcctBal() {
		return this.saDdpAcctBal;
	}

	public void setSaDdpAcctBal(Double saDdpAcctBal) {
		this.saDdpAcctBal = saDdpAcctBal;
	}

	public Double getSaTxAmt() {
		return this.saTxAmt;
	}

	public void setSaTxAmt(Double saTxAmt) {
		this.saTxAmt = saTxAmt;
	}

	public String getSaTxCrdNo() {
		return this.saTxCrdNo;
	}

	public void setSaTxCrdNo(String saTxCrdNo) {
		this.saTxCrdNo = saTxCrdNo;
	}

	public String getSaTxTyp() {
		return this.saTxTyp;
	}

	public void setSaTxTyp(String saTxTyp) {
		this.saTxTyp = saTxTyp;
	}

	public String getSaTxLogNo() {
		return this.saTxLogNo;
	}

	public void setSaTxLogNo(String saTxLogNo) {
		this.saTxLogNo = saTxLogNo;
	}

	public Double getSaDrAmt() {
		return this.saDrAmt;
	}

	public void setSaDrAmt(Double saDrAmt) {
		this.saDrAmt = saDrAmt;
	}

	public String getSaDocNo() {
		return this.saDocNo;
	}

	public void setSaDocNo(String saDocNo) {
		this.saDocNo = saDocNo;
	}

	public String getSaDocTyp() {
		return this.saDocTyp;
	}

	public void setSaDocTyp(String saDocTyp) {
		this.saDocTyp = saDocTyp;
	}

	public String getSaValDt() {
		return this.saValDt;
	}

	public void setSaValDt(String saValDt) {
		this.saValDt = saValDt;
	}

	public Double getSaSvc() {
		return this.saSvc;
	}

	public void setSaSvc(Double saSvc) {
		this.saSvc = saSvc;
	}

	public String getSaAuthNo() {
		return this.saAuthNo;
	}

	public void setSaAuthNo(String saAuthNo) {
		this.saAuthNo = saAuthNo;
	}

	public String getSaCustDocagStno() {
		return this.saCustDocagStno;
	}

	public void setSaCustDocagStno(String saCustDocagStno) {
		this.saCustDocagStno = saCustDocagStno;
	}

	public String getSaOpunCod() {
		return this.saOpunCod;
	}

	public void setSaOpunCod(String saOpunCod) {
		this.saOpunCod = saOpunCod;
	}

	public String getSaDscrpCod() {
		return this.saDscrpCod;
	}

	public void setSaDscrpCod(String saDscrpCod) {
		this.saDscrpCod = saDscrpCod;
	}

	public String getSaRmrk() {
		return this.saRmrk;
	}

	public void setSaRmrk(String saRmrk) {
		this.saRmrk = saRmrk;
	}

	public String getSaTxTm() {
		return this.saTxTm;
	}

	public void setSaTxTm(String saTxTm) {
		this.saTxTm = saTxTm;
	}

	public String getSaTxDt() {
		return this.saTxDt;
	}

	public void setSaTxDt(String saTxDt) {
		this.saTxDt = saTxDt;
	}

	public String getSaSysDt() {
		return this.saSysDt;
	}

	public void setSaSysDt(String saSysDt) {
		this.saSysDt = saSysDt;
	}

	public Double getSaDdpPdt() {
		return this.saDdpPdt;
	}

	public void setSaDdpPdt(Double saDdpPdt) {
		this.saDdpPdt = saDdpPdt;
	}

	public String getSaAppTxCode() {
		return this.saAppTxCode;
	}

	public void setSaAppTxCode(String saAppTxCode) {
		this.saAppTxCode = saAppTxCode;
	}

	public String getSaEtxFlg() {
		return this.saEtxFlg;
	}

	public void setSaEtxFlg(String saEtxFlg) {
		this.saEtxFlg = saEtxFlg;
	}

	public String getSaOtxFlg() {
		return this.saOtxFlg;
	}

	public void setSaOtxFlg(String saOtxFlg) {
		this.saOtxFlg = saOtxFlg;
	}

	public String getFiller() {
		return this.filler;
	}

	public void setFiller(String filler) {
		this.filler = filler;
	}

	public String getSaRmrk1() {
		return this.saRmrk1;
	}

	public void setSaRmrk1(String saRmrk1) {
		this.saRmrk1 = saRmrk1;
	}

	public String getSaOpCustName() {
		return this.saOpCustName;
	}

	public void setSaOpCustName(String saOpCustName) {
		this.saOpCustName = saOpCustName;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}