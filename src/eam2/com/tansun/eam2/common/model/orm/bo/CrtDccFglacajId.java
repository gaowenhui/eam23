package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccFglacajId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccFglacajId extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String glAcctNo;
	private String glacaDbTimestamp;
	private String glBusnTyp;
	private String glAcctName;
	private Double glAcctFaceBal;
	private Double glAfcBal;
	private String glBalDireFlg;
	private Double glCrntDayDrAmt;
	private Double glCrntDayCrAmt;
	private Long glCrntDayDrQty;
	private Long glCrntDayCrQty;
	private Double glMnaccumDrAmt;
	private Double glMnaccumCrAmt;
	private Long glMnaccumDrItem;
	private Long glMnaccumCrItem;
	private Double glMnaccumDrBal;
	private Double glMnaccumCrBal;
	private Double glSsnDrTotlAmt;
	private Double glSsnCrTotlAmt;
	private Long glSsnDrTotlNumbe;
	private Long glSsnCrTotlNumbe;
	private Double glSsnDrTotlBal;
	private Double glSsnCrTotlBal;
	private Double glYrAccumDrAmt;
	private Double glYrAccumCrAmt;
	private Long glYrAccumDrQty;
	private Long glYrAccumCrQty;
	private Double glYrAccumDrBal;
	private Double glYrAccumCrBal;
	private String glDrIntrCod;
	private String glCrIntrCod;
	private Double glDrFltIntr;
	private Double glCrFltIntr;
	private Double glTprdAccBal;
	private String glCrntPrdCd;
	private Double glAcctLargstBal;
	private Double glOverDrawLagstAmt;
	private String glOverDrawStartDt;
	private String glLastAccIntDt;
	private String glLastTsfAccbalDt;
	private String glLastAccDt;
	private String glLstAmndDt;
	private String glOpacDt;
	private String glCloseDt;
	private String glFrzSts;
	private String glAcctSts;
	private String glIntcFlg;
	private String glIntcCycle;
	private String glPayIntAcctNo;
	private String glColaIntAcctNo;
	private String glReconDuedt;
	private String glResponCent;
	private String glResponer;
	private String glAcctLmt;
	private String glAcctPageFmt;
	private String glAcctMode;
	private String glOpunInst;
	private String glCustNo;
	private String glOpunCod;
	private String glAcctTyp;
	private String glLgNo;
	private String glAmndrNo;
	private String glSecondBillType;
	private Double glSecondLastBal;
	private Double glSecondBal;
	private Long glCurrPageNo;
	private Long glAccumNonPrtItem;
	private String glLstPrtRcdDt;
	private Long glMaxPrntTxnNo;
	private String glOpenMode;
	private String glIntrRcrdFlg;
	private String glProdFlg;
	private String glInfoCod;
	private String glOppoAcctNo;
	private String glAutoInvstIntrCod;
	private Double glAutoInvstFltIntr;
	private Double glAutoInvstAccum;
	private String glCostCntr;
	private String glDueDt;
	private String glDlayFlg;
	private String glOverDrawAccum;
	private String glExtnSts;
	private String glDtBgstSeqNo;
	private Double glLastBal;
	private Double glSecondBillDrAm;
	private Double glSecondBillCrAm;
	private Double glAcctMaxBal;
	private String glOpacInstn;
	private String filler;

	// Constructors

	/** default constructor */
	public CrtDccFglacajId() {
	}

	/** full constructor */
	public CrtDccFglacajId(String glAcctNo, String glacaDbTimestamp,
			String glBusnTyp, String glAcctName, Double glAcctFaceBal,
			Double glAfcBal, String glBalDireFlg, Double glCrntDayDrAmt,
			Double glCrntDayCrAmt, Long glCrntDayDrQty, Long glCrntDayCrQty,
			Double glMnaccumDrAmt, Double glMnaccumCrAmt, Long glMnaccumDrItem,
			Long glMnaccumCrItem, Double glMnaccumDrBal, Double glMnaccumCrBal,
			Double glSsnDrTotlAmt, Double glSsnCrTotlAmt,
			Long glSsnDrTotlNumbe, Long glSsnCrTotlNumbe,
			Double glSsnDrTotlBal, Double glSsnCrTotlBal,
			Double glYrAccumDrAmt, Double glYrAccumCrAmt, Long glYrAccumDrQty,
			Long glYrAccumCrQty, Double glYrAccumDrBal, Double glYrAccumCrBal,
			String glDrIntrCod, String glCrIntrCod, Double glDrFltIntr,
			Double glCrFltIntr, Double glTprdAccBal, String glCrntPrdCd,
			Double glAcctLargstBal, Double glOverDrawLagstAmt,
			String glOverDrawStartDt, String glLastAccIntDt,
			String glLastTsfAccbalDt, String glLastAccDt, String glLstAmndDt,
			String glOpacDt, String glCloseDt, String glFrzSts,
			String glAcctSts, String glIntcFlg, String glIntcCycle,
			String glPayIntAcctNo, String glColaIntAcctNo, String glReconDuedt,
			String glResponCent, String glResponer, String glAcctLmt,
			String glAcctPageFmt, String glAcctMode, String glOpunInst,
			String glCustNo, String glOpunCod, String glAcctTyp, String glLgNo,
			String glAmndrNo, String glSecondBillType, Double glSecondLastBal,
			Double glSecondBal, Long glCurrPageNo, Long glAccumNonPrtItem,
			String glLstPrtRcdDt, Long glMaxPrntTxnNo, String glOpenMode,
			String glIntrRcrdFlg, String glProdFlg, String glInfoCod,
			String glOppoAcctNo, String glAutoInvstIntrCod,
			Double glAutoInvstFltIntr, Double glAutoInvstAccum,
			String glCostCntr, String glDueDt, String glDlayFlg,
			String glOverDrawAccum, String glExtnSts, String glDtBgstSeqNo,
			Double glLastBal, Double glSecondBillDrAm, Double glSecondBillCrAm,
			Double glAcctMaxBal, String glOpacInstn, String filler) {
		this.glAcctNo = glAcctNo;
		this.glacaDbTimestamp = glacaDbTimestamp;
		this.glBusnTyp = glBusnTyp;
		this.glAcctName = glAcctName;
		this.glAcctFaceBal = glAcctFaceBal;
		this.glAfcBal = glAfcBal;
		this.glBalDireFlg = glBalDireFlg;
		this.glCrntDayDrAmt = glCrntDayDrAmt;
		this.glCrntDayCrAmt = glCrntDayCrAmt;
		this.glCrntDayDrQty = glCrntDayDrQty;
		this.glCrntDayCrQty = glCrntDayCrQty;
		this.glMnaccumDrAmt = glMnaccumDrAmt;
		this.glMnaccumCrAmt = glMnaccumCrAmt;
		this.glMnaccumDrItem = glMnaccumDrItem;
		this.glMnaccumCrItem = glMnaccumCrItem;
		this.glMnaccumDrBal = glMnaccumDrBal;
		this.glMnaccumCrBal = glMnaccumCrBal;
		this.glSsnDrTotlAmt = glSsnDrTotlAmt;
		this.glSsnCrTotlAmt = glSsnCrTotlAmt;
		this.glSsnDrTotlNumbe = glSsnDrTotlNumbe;
		this.glSsnCrTotlNumbe = glSsnCrTotlNumbe;
		this.glSsnDrTotlBal = glSsnDrTotlBal;
		this.glSsnCrTotlBal = glSsnCrTotlBal;
		this.glYrAccumDrAmt = glYrAccumDrAmt;
		this.glYrAccumCrAmt = glYrAccumCrAmt;
		this.glYrAccumDrQty = glYrAccumDrQty;
		this.glYrAccumCrQty = glYrAccumCrQty;
		this.glYrAccumDrBal = glYrAccumDrBal;
		this.glYrAccumCrBal = glYrAccumCrBal;
		this.glDrIntrCod = glDrIntrCod;
		this.glCrIntrCod = glCrIntrCod;
		this.glDrFltIntr = glDrFltIntr;
		this.glCrFltIntr = glCrFltIntr;
		this.glTprdAccBal = glTprdAccBal;
		this.glCrntPrdCd = glCrntPrdCd;
		this.glAcctLargstBal = glAcctLargstBal;
		this.glOverDrawLagstAmt = glOverDrawLagstAmt;
		this.glOverDrawStartDt = glOverDrawStartDt;
		this.glLastAccIntDt = glLastAccIntDt;
		this.glLastTsfAccbalDt = glLastTsfAccbalDt;
		this.glLastAccDt = glLastAccDt;
		this.glLstAmndDt = glLstAmndDt;
		this.glOpacDt = glOpacDt;
		this.glCloseDt = glCloseDt;
		this.glFrzSts = glFrzSts;
		this.glAcctSts = glAcctSts;
		this.glIntcFlg = glIntcFlg;
		this.glIntcCycle = glIntcCycle;
		this.glPayIntAcctNo = glPayIntAcctNo;
		this.glColaIntAcctNo = glColaIntAcctNo;
		this.glReconDuedt = glReconDuedt;
		this.glResponCent = glResponCent;
		this.glResponer = glResponer;
		this.glAcctLmt = glAcctLmt;
		this.glAcctPageFmt = glAcctPageFmt;
		this.glAcctMode = glAcctMode;
		this.glOpunInst = glOpunInst;
		this.glCustNo = glCustNo;
		this.glOpunCod = glOpunCod;
		this.glAcctTyp = glAcctTyp;
		this.glLgNo = glLgNo;
		this.glAmndrNo = glAmndrNo;
		this.glSecondBillType = glSecondBillType;
		this.glSecondLastBal = glSecondLastBal;
		this.glSecondBal = glSecondBal;
		this.glCurrPageNo = glCurrPageNo;
		this.glAccumNonPrtItem = glAccumNonPrtItem;
		this.glLstPrtRcdDt = glLstPrtRcdDt;
		this.glMaxPrntTxnNo = glMaxPrntTxnNo;
		this.glOpenMode = glOpenMode;
		this.glIntrRcrdFlg = glIntrRcrdFlg;
		this.glProdFlg = glProdFlg;
		this.glInfoCod = glInfoCod;
		this.glOppoAcctNo = glOppoAcctNo;
		this.glAutoInvstIntrCod = glAutoInvstIntrCod;
		this.glAutoInvstFltIntr = glAutoInvstFltIntr;
		this.glAutoInvstAccum = glAutoInvstAccum;
		this.glCostCntr = glCostCntr;
		this.glDueDt = glDueDt;
		this.glDlayFlg = glDlayFlg;
		this.glOverDrawAccum = glOverDrawAccum;
		this.glExtnSts = glExtnSts;
		this.glDtBgstSeqNo = glDtBgstSeqNo;
		this.glLastBal = glLastBal;
		this.glSecondBillDrAm = glSecondBillDrAm;
		this.glSecondBillCrAm = glSecondBillCrAm;
		this.glAcctMaxBal = glAcctMaxBal;
		this.glOpacInstn = glOpacInstn;
		this.filler = filler;
	}

	// Property accessors

	public String getGlAcctNo() {
		return this.glAcctNo;
	}

	public void setGlAcctNo(String glAcctNo) {
		this.glAcctNo = glAcctNo;
	}

	public String getGlacaDbTimestamp() {
		return this.glacaDbTimestamp;
	}

	public void setGlacaDbTimestamp(String glacaDbTimestamp) {
		this.glacaDbTimestamp = glacaDbTimestamp;
	}

	public String getGlBusnTyp() {
		return this.glBusnTyp;
	}

	public void setGlBusnTyp(String glBusnTyp) {
		this.glBusnTyp = glBusnTyp;
	}

	public String getGlAcctName() {
		return this.glAcctName;
	}

	public void setGlAcctName(String glAcctName) {
		this.glAcctName = glAcctName;
	}

	public Double getGlAcctFaceBal() {
		return this.glAcctFaceBal;
	}

	public void setGlAcctFaceBal(Double glAcctFaceBal) {
		this.glAcctFaceBal = glAcctFaceBal;
	}

	public Double getGlAfcBal() {
		return this.glAfcBal;
	}

	public void setGlAfcBal(Double glAfcBal) {
		this.glAfcBal = glAfcBal;
	}

	public String getGlBalDireFlg() {
		return this.glBalDireFlg;
	}

	public void setGlBalDireFlg(String glBalDireFlg) {
		this.glBalDireFlg = glBalDireFlg;
	}

	public Double getGlCrntDayDrAmt() {
		return this.glCrntDayDrAmt;
	}

	public void setGlCrntDayDrAmt(Double glCrntDayDrAmt) {
		this.glCrntDayDrAmt = glCrntDayDrAmt;
	}

	public Double getGlCrntDayCrAmt() {
		return this.glCrntDayCrAmt;
	}

	public void setGlCrntDayCrAmt(Double glCrntDayCrAmt) {
		this.glCrntDayCrAmt = glCrntDayCrAmt;
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

	public Double getGlMnaccumDrAmt() {
		return this.glMnaccumDrAmt;
	}

	public void setGlMnaccumDrAmt(Double glMnaccumDrAmt) {
		this.glMnaccumDrAmt = glMnaccumDrAmt;
	}

	public Double getGlMnaccumCrAmt() {
		return this.glMnaccumCrAmt;
	}

	public void setGlMnaccumCrAmt(Double glMnaccumCrAmt) {
		this.glMnaccumCrAmt = glMnaccumCrAmt;
	}

	public Long getGlMnaccumDrItem() {
		return this.glMnaccumDrItem;
	}

	public void setGlMnaccumDrItem(Long glMnaccumDrItem) {
		this.glMnaccumDrItem = glMnaccumDrItem;
	}

	public Long getGlMnaccumCrItem() {
		return this.glMnaccumCrItem;
	}

	public void setGlMnaccumCrItem(Long glMnaccumCrItem) {
		this.glMnaccumCrItem = glMnaccumCrItem;
	}

	public Double getGlMnaccumDrBal() {
		return this.glMnaccumDrBal;
	}

	public void setGlMnaccumDrBal(Double glMnaccumDrBal) {
		this.glMnaccumDrBal = glMnaccumDrBal;
	}

	public Double getGlMnaccumCrBal() {
		return this.glMnaccumCrBal;
	}

	public void setGlMnaccumCrBal(Double glMnaccumCrBal) {
		this.glMnaccumCrBal = glMnaccumCrBal;
	}

	public Double getGlSsnDrTotlAmt() {
		return this.glSsnDrTotlAmt;
	}

	public void setGlSsnDrTotlAmt(Double glSsnDrTotlAmt) {
		this.glSsnDrTotlAmt = glSsnDrTotlAmt;
	}

	public Double getGlSsnCrTotlAmt() {
		return this.glSsnCrTotlAmt;
	}

	public void setGlSsnCrTotlAmt(Double glSsnCrTotlAmt) {
		this.glSsnCrTotlAmt = glSsnCrTotlAmt;
	}

	public Long getGlSsnDrTotlNumbe() {
		return this.glSsnDrTotlNumbe;
	}

	public void setGlSsnDrTotlNumbe(Long glSsnDrTotlNumbe) {
		this.glSsnDrTotlNumbe = glSsnDrTotlNumbe;
	}

	public Long getGlSsnCrTotlNumbe() {
		return this.glSsnCrTotlNumbe;
	}

	public void setGlSsnCrTotlNumbe(Long glSsnCrTotlNumbe) {
		this.glSsnCrTotlNumbe = glSsnCrTotlNumbe;
	}

	public Double getGlSsnDrTotlBal() {
		return this.glSsnDrTotlBal;
	}

	public void setGlSsnDrTotlBal(Double glSsnDrTotlBal) {
		this.glSsnDrTotlBal = glSsnDrTotlBal;
	}

	public Double getGlSsnCrTotlBal() {
		return this.glSsnCrTotlBal;
	}

	public void setGlSsnCrTotlBal(Double glSsnCrTotlBal) {
		this.glSsnCrTotlBal = glSsnCrTotlBal;
	}

	public Double getGlYrAccumDrAmt() {
		return this.glYrAccumDrAmt;
	}

	public void setGlYrAccumDrAmt(Double glYrAccumDrAmt) {
		this.glYrAccumDrAmt = glYrAccumDrAmt;
	}

	public Double getGlYrAccumCrAmt() {
		return this.glYrAccumCrAmt;
	}

	public void setGlYrAccumCrAmt(Double glYrAccumCrAmt) {
		this.glYrAccumCrAmt = glYrAccumCrAmt;
	}

	public Long getGlYrAccumDrQty() {
		return this.glYrAccumDrQty;
	}

	public void setGlYrAccumDrQty(Long glYrAccumDrQty) {
		this.glYrAccumDrQty = glYrAccumDrQty;
	}

	public Long getGlYrAccumCrQty() {
		return this.glYrAccumCrQty;
	}

	public void setGlYrAccumCrQty(Long glYrAccumCrQty) {
		this.glYrAccumCrQty = glYrAccumCrQty;
	}

	public Double getGlYrAccumDrBal() {
		return this.glYrAccumDrBal;
	}

	public void setGlYrAccumDrBal(Double glYrAccumDrBal) {
		this.glYrAccumDrBal = glYrAccumDrBal;
	}

	public Double getGlYrAccumCrBal() {
		return this.glYrAccumCrBal;
	}

	public void setGlYrAccumCrBal(Double glYrAccumCrBal) {
		this.glYrAccumCrBal = glYrAccumCrBal;
	}

	public String getGlDrIntrCod() {
		return this.glDrIntrCod;
	}

	public void setGlDrIntrCod(String glDrIntrCod) {
		this.glDrIntrCod = glDrIntrCod;
	}

	public String getGlCrIntrCod() {
		return this.glCrIntrCod;
	}

	public void setGlCrIntrCod(String glCrIntrCod) {
		this.glCrIntrCod = glCrIntrCod;
	}

	public Double getGlDrFltIntr() {
		return this.glDrFltIntr;
	}

	public void setGlDrFltIntr(Double glDrFltIntr) {
		this.glDrFltIntr = glDrFltIntr;
	}

	public Double getGlCrFltIntr() {
		return this.glCrFltIntr;
	}

	public void setGlCrFltIntr(Double glCrFltIntr) {
		this.glCrFltIntr = glCrFltIntr;
	}

	public Double getGlTprdAccBal() {
		return this.glTprdAccBal;
	}

	public void setGlTprdAccBal(Double glTprdAccBal) {
		this.glTprdAccBal = glTprdAccBal;
	}

	public String getGlCrntPrdCd() {
		return this.glCrntPrdCd;
	}

	public void setGlCrntPrdCd(String glCrntPrdCd) {
		this.glCrntPrdCd = glCrntPrdCd;
	}

	public Double getGlAcctLargstBal() {
		return this.glAcctLargstBal;
	}

	public void setGlAcctLargstBal(Double glAcctLargstBal) {
		this.glAcctLargstBal = glAcctLargstBal;
	}

	public Double getGlOverDrawLagstAmt() {
		return this.glOverDrawLagstAmt;
	}

	public void setGlOverDrawLagstAmt(Double glOverDrawLagstAmt) {
		this.glOverDrawLagstAmt = glOverDrawLagstAmt;
	}

	public String getGlOverDrawStartDt() {
		return this.glOverDrawStartDt;
	}

	public void setGlOverDrawStartDt(String glOverDrawStartDt) {
		this.glOverDrawStartDt = glOverDrawStartDt;
	}

	public String getGlLastAccIntDt() {
		return this.glLastAccIntDt;
	}

	public void setGlLastAccIntDt(String glLastAccIntDt) {
		this.glLastAccIntDt = glLastAccIntDt;
	}

	public String getGlLastTsfAccbalDt() {
		return this.glLastTsfAccbalDt;
	}

	public void setGlLastTsfAccbalDt(String glLastTsfAccbalDt) {
		this.glLastTsfAccbalDt = glLastTsfAccbalDt;
	}

	public String getGlLastAccDt() {
		return this.glLastAccDt;
	}

	public void setGlLastAccDt(String glLastAccDt) {
		this.glLastAccDt = glLastAccDt;
	}

	public String getGlLstAmndDt() {
		return this.glLstAmndDt;
	}

	public void setGlLstAmndDt(String glLstAmndDt) {
		this.glLstAmndDt = glLstAmndDt;
	}

	public String getGlOpacDt() {
		return this.glOpacDt;
	}

	public void setGlOpacDt(String glOpacDt) {
		this.glOpacDt = glOpacDt;
	}

	public String getGlCloseDt() {
		return this.glCloseDt;
	}

	public void setGlCloseDt(String glCloseDt) {
		this.glCloseDt = glCloseDt;
	}

	public String getGlFrzSts() {
		return this.glFrzSts;
	}

	public void setGlFrzSts(String glFrzSts) {
		this.glFrzSts = glFrzSts;
	}

	public String getGlAcctSts() {
		return this.glAcctSts;
	}

	public void setGlAcctSts(String glAcctSts) {
		this.glAcctSts = glAcctSts;
	}

	public String getGlIntcFlg() {
		return this.glIntcFlg;
	}

	public void setGlIntcFlg(String glIntcFlg) {
		this.glIntcFlg = glIntcFlg;
	}

	public String getGlIntcCycle() {
		return this.glIntcCycle;
	}

	public void setGlIntcCycle(String glIntcCycle) {
		this.glIntcCycle = glIntcCycle;
	}

	public String getGlPayIntAcctNo() {
		return this.glPayIntAcctNo;
	}

	public void setGlPayIntAcctNo(String glPayIntAcctNo) {
		this.glPayIntAcctNo = glPayIntAcctNo;
	}

	public String getGlColaIntAcctNo() {
		return this.glColaIntAcctNo;
	}

	public void setGlColaIntAcctNo(String glColaIntAcctNo) {
		this.glColaIntAcctNo = glColaIntAcctNo;
	}

	public String getGlReconDuedt() {
		return this.glReconDuedt;
	}

	public void setGlReconDuedt(String glReconDuedt) {
		this.glReconDuedt = glReconDuedt;
	}

	public String getGlResponCent() {
		return this.glResponCent;
	}

	public void setGlResponCent(String glResponCent) {
		this.glResponCent = glResponCent;
	}

	public String getGlResponer() {
		return this.glResponer;
	}

	public void setGlResponer(String glResponer) {
		this.glResponer = glResponer;
	}

	public String getGlAcctLmt() {
		return this.glAcctLmt;
	}

	public void setGlAcctLmt(String glAcctLmt) {
		this.glAcctLmt = glAcctLmt;
	}

	public String getGlAcctPageFmt() {
		return this.glAcctPageFmt;
	}

	public void setGlAcctPageFmt(String glAcctPageFmt) {
		this.glAcctPageFmt = glAcctPageFmt;
	}

	public String getGlAcctMode() {
		return this.glAcctMode;
	}

	public void setGlAcctMode(String glAcctMode) {
		this.glAcctMode = glAcctMode;
	}

	public String getGlOpunInst() {
		return this.glOpunInst;
	}

	public void setGlOpunInst(String glOpunInst) {
		this.glOpunInst = glOpunInst;
	}

	public String getGlCustNo() {
		return this.glCustNo;
	}

	public void setGlCustNo(String glCustNo) {
		this.glCustNo = glCustNo;
	}

	public String getGlOpunCod() {
		return this.glOpunCod;
	}

	public void setGlOpunCod(String glOpunCod) {
		this.glOpunCod = glOpunCod;
	}

	public String getGlAcctTyp() {
		return this.glAcctTyp;
	}

	public void setGlAcctTyp(String glAcctTyp) {
		this.glAcctTyp = glAcctTyp;
	}

	public String getGlLgNo() {
		return this.glLgNo;
	}

	public void setGlLgNo(String glLgNo) {
		this.glLgNo = glLgNo;
	}

	public String getGlAmndrNo() {
		return this.glAmndrNo;
	}

	public void setGlAmndrNo(String glAmndrNo) {
		this.glAmndrNo = glAmndrNo;
	}

	public String getGlSecondBillType() {
		return this.glSecondBillType;
	}

	public void setGlSecondBillType(String glSecondBillType) {
		this.glSecondBillType = glSecondBillType;
	}

	public Double getGlSecondLastBal() {
		return this.glSecondLastBal;
	}

	public void setGlSecondLastBal(Double glSecondLastBal) {
		this.glSecondLastBal = glSecondLastBal;
	}

	public Double getGlSecondBal() {
		return this.glSecondBal;
	}

	public void setGlSecondBal(Double glSecondBal) {
		this.glSecondBal = glSecondBal;
	}

	public Long getGlCurrPageNo() {
		return this.glCurrPageNo;
	}

	public void setGlCurrPageNo(Long glCurrPageNo) {
		this.glCurrPageNo = glCurrPageNo;
	}

	public Long getGlAccumNonPrtItem() {
		return this.glAccumNonPrtItem;
	}

	public void setGlAccumNonPrtItem(Long glAccumNonPrtItem) {
		this.glAccumNonPrtItem = glAccumNonPrtItem;
	}

	public String getGlLstPrtRcdDt() {
		return this.glLstPrtRcdDt;
	}

	public void setGlLstPrtRcdDt(String glLstPrtRcdDt) {
		this.glLstPrtRcdDt = glLstPrtRcdDt;
	}

	public Long getGlMaxPrntTxnNo() {
		return this.glMaxPrntTxnNo;
	}

	public void setGlMaxPrntTxnNo(Long glMaxPrntTxnNo) {
		this.glMaxPrntTxnNo = glMaxPrntTxnNo;
	}

	public String getGlOpenMode() {
		return this.glOpenMode;
	}

	public void setGlOpenMode(String glOpenMode) {
		this.glOpenMode = glOpenMode;
	}

	public String getGlIntrRcrdFlg() {
		return this.glIntrRcrdFlg;
	}

	public void setGlIntrRcrdFlg(String glIntrRcrdFlg) {
		this.glIntrRcrdFlg = glIntrRcrdFlg;
	}

	public String getGlProdFlg() {
		return this.glProdFlg;
	}

	public void setGlProdFlg(String glProdFlg) {
		this.glProdFlg = glProdFlg;
	}

	public String getGlInfoCod() {
		return this.glInfoCod;
	}

	public void setGlInfoCod(String glInfoCod) {
		this.glInfoCod = glInfoCod;
	}

	public String getGlOppoAcctNo() {
		return this.glOppoAcctNo;
	}

	public void setGlOppoAcctNo(String glOppoAcctNo) {
		this.glOppoAcctNo = glOppoAcctNo;
	}

	public String getGlAutoInvstIntrCod() {
		return this.glAutoInvstIntrCod;
	}

	public void setGlAutoInvstIntrCod(String glAutoInvstIntrCod) {
		this.glAutoInvstIntrCod = glAutoInvstIntrCod;
	}

	public Double getGlAutoInvstFltIntr() {
		return this.glAutoInvstFltIntr;
	}

	public void setGlAutoInvstFltIntr(Double glAutoInvstFltIntr) {
		this.glAutoInvstFltIntr = glAutoInvstFltIntr;
	}

	public Double getGlAutoInvstAccum() {
		return this.glAutoInvstAccum;
	}

	public void setGlAutoInvstAccum(Double glAutoInvstAccum) {
		this.glAutoInvstAccum = glAutoInvstAccum;
	}

	public String getGlCostCntr() {
		return this.glCostCntr;
	}

	public void setGlCostCntr(String glCostCntr) {
		this.glCostCntr = glCostCntr;
	}

	public String getGlDueDt() {
		return this.glDueDt;
	}

	public void setGlDueDt(String glDueDt) {
		this.glDueDt = glDueDt;
	}

	public String getGlDlayFlg() {
		return this.glDlayFlg;
	}

	public void setGlDlayFlg(String glDlayFlg) {
		this.glDlayFlg = glDlayFlg;
	}

	public String getGlOverDrawAccum() {
		return this.glOverDrawAccum;
	}

	public void setGlOverDrawAccum(String glOverDrawAccum) {
		this.glOverDrawAccum = glOverDrawAccum;
	}

	public String getGlExtnSts() {
		return this.glExtnSts;
	}

	public void setGlExtnSts(String glExtnSts) {
		this.glExtnSts = glExtnSts;
	}

	public String getGlDtBgstSeqNo() {
		return this.glDtBgstSeqNo;
	}

	public void setGlDtBgstSeqNo(String glDtBgstSeqNo) {
		this.glDtBgstSeqNo = glDtBgstSeqNo;
	}

	public Double getGlLastBal() {
		return this.glLastBal;
	}

	public void setGlLastBal(Double glLastBal) {
		this.glLastBal = glLastBal;
	}

	public Double getGlSecondBillDrAm() {
		return this.glSecondBillDrAm;
	}

	public void setGlSecondBillDrAm(Double glSecondBillDrAm) {
		this.glSecondBillDrAm = glSecondBillDrAm;
	}

	public Double getGlSecondBillCrAm() {
		return this.glSecondBillCrAm;
	}

	public void setGlSecondBillCrAm(Double glSecondBillCrAm) {
		this.glSecondBillCrAm = glSecondBillCrAm;
	}

	public Double getGlAcctMaxBal() {
		return this.glAcctMaxBal;
	}

	public void setGlAcctMaxBal(Double glAcctMaxBal) {
		this.glAcctMaxBal = glAcctMaxBal;
	}

	public String getGlOpacInstn() {
		return this.glOpacInstn;
	}

	public void setGlOpacInstn(String glOpacInstn) {
		this.glOpacInstn = glOpacInstn;
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
		if (!(other instanceof CrtDccFglacajId))
			return false;
		CrtDccFglacajId castOther = (CrtDccFglacajId) other;

		return ((this.getGlAcctNo() == castOther.getGlAcctNo()) || (this
				.getGlAcctNo() != null
				&& castOther.getGlAcctNo() != null && this.getGlAcctNo()
				.equals(castOther.getGlAcctNo())))
				&& ((this.getGlacaDbTimestamp() == castOther
						.getGlacaDbTimestamp()) || (this.getGlacaDbTimestamp() != null
						&& castOther.getGlacaDbTimestamp() != null && this
						.getGlacaDbTimestamp().equals(
								castOther.getGlacaDbTimestamp())))
				&& ((this.getGlBusnTyp() == castOther.getGlBusnTyp()) || (this
						.getGlBusnTyp() != null
						&& castOther.getGlBusnTyp() != null && this
						.getGlBusnTyp().equals(castOther.getGlBusnTyp())))
				&& ((this.getGlAcctName() == castOther.getGlAcctName()) || (this
						.getGlAcctName() != null
						&& castOther.getGlAcctName() != null && this
						.getGlAcctName().equals(castOther.getGlAcctName())))
				&& ((this.getGlAcctFaceBal() == castOther.getGlAcctFaceBal()) || (this
						.getGlAcctFaceBal() != null
						&& castOther.getGlAcctFaceBal() != null && this
						.getGlAcctFaceBal()
						.equals(castOther.getGlAcctFaceBal())))
				&& ((this.getGlAfcBal() == castOther.getGlAfcBal()) || (this
						.getGlAfcBal() != null
						&& castOther.getGlAfcBal() != null && this
						.getGlAfcBal().equals(castOther.getGlAfcBal())))
				&& ((this.getGlBalDireFlg() == castOther.getGlBalDireFlg()) || (this
						.getGlBalDireFlg() != null
						&& castOther.getGlBalDireFlg() != null && this
						.getGlBalDireFlg().equals(castOther.getGlBalDireFlg())))
				&& ((this.getGlCrntDayDrAmt() == castOther.getGlCrntDayDrAmt()) || (this
						.getGlCrntDayDrAmt() != null
						&& castOther.getGlCrntDayDrAmt() != null && this
						.getGlCrntDayDrAmt().equals(
								castOther.getGlCrntDayDrAmt())))
				&& ((this.getGlCrntDayCrAmt() == castOther.getGlCrntDayCrAmt()) || (this
						.getGlCrntDayCrAmt() != null
						&& castOther.getGlCrntDayCrAmt() != null && this
						.getGlCrntDayCrAmt().equals(
								castOther.getGlCrntDayCrAmt())))
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
				&& ((this.getGlMnaccumDrAmt() == castOther.getGlMnaccumDrAmt()) || (this
						.getGlMnaccumDrAmt() != null
						&& castOther.getGlMnaccumDrAmt() != null && this
						.getGlMnaccumDrAmt().equals(
								castOther.getGlMnaccumDrAmt())))
				&& ((this.getGlMnaccumCrAmt() == castOther.getGlMnaccumCrAmt()) || (this
						.getGlMnaccumCrAmt() != null
						&& castOther.getGlMnaccumCrAmt() != null && this
						.getGlMnaccumCrAmt().equals(
								castOther.getGlMnaccumCrAmt())))
				&& ((this.getGlMnaccumDrItem() == castOther
						.getGlMnaccumDrItem()) || (this.getGlMnaccumDrItem() != null
						&& castOther.getGlMnaccumDrItem() != null && this
						.getGlMnaccumDrItem().equals(
								castOther.getGlMnaccumDrItem())))
				&& ((this.getGlMnaccumCrItem() == castOther
						.getGlMnaccumCrItem()) || (this.getGlMnaccumCrItem() != null
						&& castOther.getGlMnaccumCrItem() != null && this
						.getGlMnaccumCrItem().equals(
								castOther.getGlMnaccumCrItem())))
				&& ((this.getGlMnaccumDrBal() == castOther.getGlMnaccumDrBal()) || (this
						.getGlMnaccumDrBal() != null
						&& castOther.getGlMnaccumDrBal() != null && this
						.getGlMnaccumDrBal().equals(
								castOther.getGlMnaccumDrBal())))
				&& ((this.getGlMnaccumCrBal() == castOther.getGlMnaccumCrBal()) || (this
						.getGlMnaccumCrBal() != null
						&& castOther.getGlMnaccumCrBal() != null && this
						.getGlMnaccumCrBal().equals(
								castOther.getGlMnaccumCrBal())))
				&& ((this.getGlSsnDrTotlAmt() == castOther.getGlSsnDrTotlAmt()) || (this
						.getGlSsnDrTotlAmt() != null
						&& castOther.getGlSsnDrTotlAmt() != null && this
						.getGlSsnDrTotlAmt().equals(
								castOther.getGlSsnDrTotlAmt())))
				&& ((this.getGlSsnCrTotlAmt() == castOther.getGlSsnCrTotlAmt()) || (this
						.getGlSsnCrTotlAmt() != null
						&& castOther.getGlSsnCrTotlAmt() != null && this
						.getGlSsnCrTotlAmt().equals(
								castOther.getGlSsnCrTotlAmt())))
				&& ((this.getGlSsnDrTotlNumbe() == castOther
						.getGlSsnDrTotlNumbe()) || (this.getGlSsnDrTotlNumbe() != null
						&& castOther.getGlSsnDrTotlNumbe() != null && this
						.getGlSsnDrTotlNumbe().equals(
								castOther.getGlSsnDrTotlNumbe())))
				&& ((this.getGlSsnCrTotlNumbe() == castOther
						.getGlSsnCrTotlNumbe()) || (this.getGlSsnCrTotlNumbe() != null
						&& castOther.getGlSsnCrTotlNumbe() != null && this
						.getGlSsnCrTotlNumbe().equals(
								castOther.getGlSsnCrTotlNumbe())))
				&& ((this.getGlSsnDrTotlBal() == castOther.getGlSsnDrTotlBal()) || (this
						.getGlSsnDrTotlBal() != null
						&& castOther.getGlSsnDrTotlBal() != null && this
						.getGlSsnDrTotlBal().equals(
								castOther.getGlSsnDrTotlBal())))
				&& ((this.getGlSsnCrTotlBal() == castOther.getGlSsnCrTotlBal()) || (this
						.getGlSsnCrTotlBal() != null
						&& castOther.getGlSsnCrTotlBal() != null && this
						.getGlSsnCrTotlBal().equals(
								castOther.getGlSsnCrTotlBal())))
				&& ((this.getGlYrAccumDrAmt() == castOther.getGlYrAccumDrAmt()) || (this
						.getGlYrAccumDrAmt() != null
						&& castOther.getGlYrAccumDrAmt() != null && this
						.getGlYrAccumDrAmt().equals(
								castOther.getGlYrAccumDrAmt())))
				&& ((this.getGlYrAccumCrAmt() == castOther.getGlYrAccumCrAmt()) || (this
						.getGlYrAccumCrAmt() != null
						&& castOther.getGlYrAccumCrAmt() != null && this
						.getGlYrAccumCrAmt().equals(
								castOther.getGlYrAccumCrAmt())))
				&& ((this.getGlYrAccumDrQty() == castOther.getGlYrAccumDrQty()) || (this
						.getGlYrAccumDrQty() != null
						&& castOther.getGlYrAccumDrQty() != null && this
						.getGlYrAccumDrQty().equals(
								castOther.getGlYrAccumDrQty())))
				&& ((this.getGlYrAccumCrQty() == castOther.getGlYrAccumCrQty()) || (this
						.getGlYrAccumCrQty() != null
						&& castOther.getGlYrAccumCrQty() != null && this
						.getGlYrAccumCrQty().equals(
								castOther.getGlYrAccumCrQty())))
				&& ((this.getGlYrAccumDrBal() == castOther.getGlYrAccumDrBal()) || (this
						.getGlYrAccumDrBal() != null
						&& castOther.getGlYrAccumDrBal() != null && this
						.getGlYrAccumDrBal().equals(
								castOther.getGlYrAccumDrBal())))
				&& ((this.getGlYrAccumCrBal() == castOther.getGlYrAccumCrBal()) || (this
						.getGlYrAccumCrBal() != null
						&& castOther.getGlYrAccumCrBal() != null && this
						.getGlYrAccumCrBal().equals(
								castOther.getGlYrAccumCrBal())))
				&& ((this.getGlDrIntrCod() == castOther.getGlDrIntrCod()) || (this
						.getGlDrIntrCod() != null
						&& castOther.getGlDrIntrCod() != null && this
						.getGlDrIntrCod().equals(castOther.getGlDrIntrCod())))
				&& ((this.getGlCrIntrCod() == castOther.getGlCrIntrCod()) || (this
						.getGlCrIntrCod() != null
						&& castOther.getGlCrIntrCod() != null && this
						.getGlCrIntrCod().equals(castOther.getGlCrIntrCod())))
				&& ((this.getGlDrFltIntr() == castOther.getGlDrFltIntr()) || (this
						.getGlDrFltIntr() != null
						&& castOther.getGlDrFltIntr() != null && this
						.getGlDrFltIntr().equals(castOther.getGlDrFltIntr())))
				&& ((this.getGlCrFltIntr() == castOther.getGlCrFltIntr()) || (this
						.getGlCrFltIntr() != null
						&& castOther.getGlCrFltIntr() != null && this
						.getGlCrFltIntr().equals(castOther.getGlCrFltIntr())))
				&& ((this.getGlTprdAccBal() == castOther.getGlTprdAccBal()) || (this
						.getGlTprdAccBal() != null
						&& castOther.getGlTprdAccBal() != null && this
						.getGlTprdAccBal().equals(castOther.getGlTprdAccBal())))
				&& ((this.getGlCrntPrdCd() == castOther.getGlCrntPrdCd()) || (this
						.getGlCrntPrdCd() != null
						&& castOther.getGlCrntPrdCd() != null && this
						.getGlCrntPrdCd().equals(castOther.getGlCrntPrdCd())))
				&& ((this.getGlAcctLargstBal() == castOther
						.getGlAcctLargstBal()) || (this.getGlAcctLargstBal() != null
						&& castOther.getGlAcctLargstBal() != null && this
						.getGlAcctLargstBal().equals(
								castOther.getGlAcctLargstBal())))
				&& ((this.getGlOverDrawLagstAmt() == castOther
						.getGlOverDrawLagstAmt()) || (this
						.getGlOverDrawLagstAmt() != null
						&& castOther.getGlOverDrawLagstAmt() != null && this
						.getGlOverDrawLagstAmt().equals(
								castOther.getGlOverDrawLagstAmt())))
				&& ((this.getGlOverDrawStartDt() == castOther
						.getGlOverDrawStartDt()) || (this
						.getGlOverDrawStartDt() != null
						&& castOther.getGlOverDrawStartDt() != null && this
						.getGlOverDrawStartDt().equals(
								castOther.getGlOverDrawStartDt())))
				&& ((this.getGlLastAccIntDt() == castOther.getGlLastAccIntDt()) || (this
						.getGlLastAccIntDt() != null
						&& castOther.getGlLastAccIntDt() != null && this
						.getGlLastAccIntDt().equals(
								castOther.getGlLastAccIntDt())))
				&& ((this.getGlLastTsfAccbalDt() == castOther
						.getGlLastTsfAccbalDt()) || (this
						.getGlLastTsfAccbalDt() != null
						&& castOther.getGlLastTsfAccbalDt() != null && this
						.getGlLastTsfAccbalDt().equals(
								castOther.getGlLastTsfAccbalDt())))
				&& ((this.getGlLastAccDt() == castOther.getGlLastAccDt()) || (this
						.getGlLastAccDt() != null
						&& castOther.getGlLastAccDt() != null && this
						.getGlLastAccDt().equals(castOther.getGlLastAccDt())))
				&& ((this.getGlLstAmndDt() == castOther.getGlLstAmndDt()) || (this
						.getGlLstAmndDt() != null
						&& castOther.getGlLstAmndDt() != null && this
						.getGlLstAmndDt().equals(castOther.getGlLstAmndDt())))
				&& ((this.getGlOpacDt() == castOther.getGlOpacDt()) || (this
						.getGlOpacDt() != null
						&& castOther.getGlOpacDt() != null && this
						.getGlOpacDt().equals(castOther.getGlOpacDt())))
				&& ((this.getGlCloseDt() == castOther.getGlCloseDt()) || (this
						.getGlCloseDt() != null
						&& castOther.getGlCloseDt() != null && this
						.getGlCloseDt().equals(castOther.getGlCloseDt())))
				&& ((this.getGlFrzSts() == castOther.getGlFrzSts()) || (this
						.getGlFrzSts() != null
						&& castOther.getGlFrzSts() != null && this
						.getGlFrzSts().equals(castOther.getGlFrzSts())))
				&& ((this.getGlAcctSts() == castOther.getGlAcctSts()) || (this
						.getGlAcctSts() != null
						&& castOther.getGlAcctSts() != null && this
						.getGlAcctSts().equals(castOther.getGlAcctSts())))
				&& ((this.getGlIntcFlg() == castOther.getGlIntcFlg()) || (this
						.getGlIntcFlg() != null
						&& castOther.getGlIntcFlg() != null && this
						.getGlIntcFlg().equals(castOther.getGlIntcFlg())))
				&& ((this.getGlIntcCycle() == castOther.getGlIntcCycle()) || (this
						.getGlIntcCycle() != null
						&& castOther.getGlIntcCycle() != null && this
						.getGlIntcCycle().equals(castOther.getGlIntcCycle())))
				&& ((this.getGlPayIntAcctNo() == castOther.getGlPayIntAcctNo()) || (this
						.getGlPayIntAcctNo() != null
						&& castOther.getGlPayIntAcctNo() != null && this
						.getGlPayIntAcctNo().equals(
								castOther.getGlPayIntAcctNo())))
				&& ((this.getGlColaIntAcctNo() == castOther
						.getGlColaIntAcctNo()) || (this.getGlColaIntAcctNo() != null
						&& castOther.getGlColaIntAcctNo() != null && this
						.getGlColaIntAcctNo().equals(
								castOther.getGlColaIntAcctNo())))
				&& ((this.getGlReconDuedt() == castOther.getGlReconDuedt()) || (this
						.getGlReconDuedt() != null
						&& castOther.getGlReconDuedt() != null && this
						.getGlReconDuedt().equals(castOther.getGlReconDuedt())))
				&& ((this.getGlResponCent() == castOther.getGlResponCent()) || (this
						.getGlResponCent() != null
						&& castOther.getGlResponCent() != null && this
						.getGlResponCent().equals(castOther.getGlResponCent())))
				&& ((this.getGlResponer() == castOther.getGlResponer()) || (this
						.getGlResponer() != null
						&& castOther.getGlResponer() != null && this
						.getGlResponer().equals(castOther.getGlResponer())))
				&& ((this.getGlAcctLmt() == castOther.getGlAcctLmt()) || (this
						.getGlAcctLmt() != null
						&& castOther.getGlAcctLmt() != null && this
						.getGlAcctLmt().equals(castOther.getGlAcctLmt())))
				&& ((this.getGlAcctPageFmt() == castOther.getGlAcctPageFmt()) || (this
						.getGlAcctPageFmt() != null
						&& castOther.getGlAcctPageFmt() != null && this
						.getGlAcctPageFmt()
						.equals(castOther.getGlAcctPageFmt())))
				&& ((this.getGlAcctMode() == castOther.getGlAcctMode()) || (this
						.getGlAcctMode() != null
						&& castOther.getGlAcctMode() != null && this
						.getGlAcctMode().equals(castOther.getGlAcctMode())))
				&& ((this.getGlOpunInst() == castOther.getGlOpunInst()) || (this
						.getGlOpunInst() != null
						&& castOther.getGlOpunInst() != null && this
						.getGlOpunInst().equals(castOther.getGlOpunInst())))
				&& ((this.getGlCustNo() == castOther.getGlCustNo()) || (this
						.getGlCustNo() != null
						&& castOther.getGlCustNo() != null && this
						.getGlCustNo().equals(castOther.getGlCustNo())))
				&& ((this.getGlOpunCod() == castOther.getGlOpunCod()) || (this
						.getGlOpunCod() != null
						&& castOther.getGlOpunCod() != null && this
						.getGlOpunCod().equals(castOther.getGlOpunCod())))
				&& ((this.getGlAcctTyp() == castOther.getGlAcctTyp()) || (this
						.getGlAcctTyp() != null
						&& castOther.getGlAcctTyp() != null && this
						.getGlAcctTyp().equals(castOther.getGlAcctTyp())))
				&& ((this.getGlLgNo() == castOther.getGlLgNo()) || (this
						.getGlLgNo() != null
						&& castOther.getGlLgNo() != null && this.getGlLgNo()
						.equals(castOther.getGlLgNo())))
				&& ((this.getGlAmndrNo() == castOther.getGlAmndrNo()) || (this
						.getGlAmndrNo() != null
						&& castOther.getGlAmndrNo() != null && this
						.getGlAmndrNo().equals(castOther.getGlAmndrNo())))
				&& ((this.getGlSecondBillType() == castOther
						.getGlSecondBillType()) || (this.getGlSecondBillType() != null
						&& castOther.getGlSecondBillType() != null && this
						.getGlSecondBillType().equals(
								castOther.getGlSecondBillType())))
				&& ((this.getGlSecondLastBal() == castOther
						.getGlSecondLastBal()) || (this.getGlSecondLastBal() != null
						&& castOther.getGlSecondLastBal() != null && this
						.getGlSecondLastBal().equals(
								castOther.getGlSecondLastBal())))
				&& ((this.getGlSecondBal() == castOther.getGlSecondBal()) || (this
						.getGlSecondBal() != null
						&& castOther.getGlSecondBal() != null && this
						.getGlSecondBal().equals(castOther.getGlSecondBal())))
				&& ((this.getGlCurrPageNo() == castOther.getGlCurrPageNo()) || (this
						.getGlCurrPageNo() != null
						&& castOther.getGlCurrPageNo() != null && this
						.getGlCurrPageNo().equals(castOther.getGlCurrPageNo())))
				&& ((this.getGlAccumNonPrtItem() == castOther
						.getGlAccumNonPrtItem()) || (this
						.getGlAccumNonPrtItem() != null
						&& castOther.getGlAccumNonPrtItem() != null && this
						.getGlAccumNonPrtItem().equals(
								castOther.getGlAccumNonPrtItem())))
				&& ((this.getGlLstPrtRcdDt() == castOther.getGlLstPrtRcdDt()) || (this
						.getGlLstPrtRcdDt() != null
						&& castOther.getGlLstPrtRcdDt() != null && this
						.getGlLstPrtRcdDt()
						.equals(castOther.getGlLstPrtRcdDt())))
				&& ((this.getGlMaxPrntTxnNo() == castOther.getGlMaxPrntTxnNo()) || (this
						.getGlMaxPrntTxnNo() != null
						&& castOther.getGlMaxPrntTxnNo() != null && this
						.getGlMaxPrntTxnNo().equals(
								castOther.getGlMaxPrntTxnNo())))
				&& ((this.getGlOpenMode() == castOther.getGlOpenMode()) || (this
						.getGlOpenMode() != null
						&& castOther.getGlOpenMode() != null && this
						.getGlOpenMode().equals(castOther.getGlOpenMode())))
				&& ((this.getGlIntrRcrdFlg() == castOther.getGlIntrRcrdFlg()) || (this
						.getGlIntrRcrdFlg() != null
						&& castOther.getGlIntrRcrdFlg() != null && this
						.getGlIntrRcrdFlg()
						.equals(castOther.getGlIntrRcrdFlg())))
				&& ((this.getGlProdFlg() == castOther.getGlProdFlg()) || (this
						.getGlProdFlg() != null
						&& castOther.getGlProdFlg() != null && this
						.getGlProdFlg().equals(castOther.getGlProdFlg())))
				&& ((this.getGlInfoCod() == castOther.getGlInfoCod()) || (this
						.getGlInfoCod() != null
						&& castOther.getGlInfoCod() != null && this
						.getGlInfoCod().equals(castOther.getGlInfoCod())))
				&& ((this.getGlOppoAcctNo() == castOther.getGlOppoAcctNo()) || (this
						.getGlOppoAcctNo() != null
						&& castOther.getGlOppoAcctNo() != null && this
						.getGlOppoAcctNo().equals(castOther.getGlOppoAcctNo())))
				&& ((this.getGlAutoInvstIntrCod() == castOther
						.getGlAutoInvstIntrCod()) || (this
						.getGlAutoInvstIntrCod() != null
						&& castOther.getGlAutoInvstIntrCod() != null && this
						.getGlAutoInvstIntrCod().equals(
								castOther.getGlAutoInvstIntrCod())))
				&& ((this.getGlAutoInvstFltIntr() == castOther
						.getGlAutoInvstFltIntr()) || (this
						.getGlAutoInvstFltIntr() != null
						&& castOther.getGlAutoInvstFltIntr() != null && this
						.getGlAutoInvstFltIntr().equals(
								castOther.getGlAutoInvstFltIntr())))
				&& ((this.getGlAutoInvstAccum() == castOther
						.getGlAutoInvstAccum()) || (this.getGlAutoInvstAccum() != null
						&& castOther.getGlAutoInvstAccum() != null && this
						.getGlAutoInvstAccum().equals(
								castOther.getGlAutoInvstAccum())))
				&& ((this.getGlCostCntr() == castOther.getGlCostCntr()) || (this
						.getGlCostCntr() != null
						&& castOther.getGlCostCntr() != null && this
						.getGlCostCntr().equals(castOther.getGlCostCntr())))
				&& ((this.getGlDueDt() == castOther.getGlDueDt()) || (this
						.getGlDueDt() != null
						&& castOther.getGlDueDt() != null && this.getGlDueDt()
						.equals(castOther.getGlDueDt())))
				&& ((this.getGlDlayFlg() == castOther.getGlDlayFlg()) || (this
						.getGlDlayFlg() != null
						&& castOther.getGlDlayFlg() != null && this
						.getGlDlayFlg().equals(castOther.getGlDlayFlg())))
				&& ((this.getGlOverDrawAccum() == castOther
						.getGlOverDrawAccum()) || (this.getGlOverDrawAccum() != null
						&& castOther.getGlOverDrawAccum() != null && this
						.getGlOverDrawAccum().equals(
								castOther.getGlOverDrawAccum())))
				&& ((this.getGlExtnSts() == castOther.getGlExtnSts()) || (this
						.getGlExtnSts() != null
						&& castOther.getGlExtnSts() != null && this
						.getGlExtnSts().equals(castOther.getGlExtnSts())))
				&& ((this.getGlDtBgstSeqNo() == castOther.getGlDtBgstSeqNo()) || (this
						.getGlDtBgstSeqNo() != null
						&& castOther.getGlDtBgstSeqNo() != null && this
						.getGlDtBgstSeqNo()
						.equals(castOther.getGlDtBgstSeqNo())))
				&& ((this.getGlLastBal() == castOther.getGlLastBal()) || (this
						.getGlLastBal() != null
						&& castOther.getGlLastBal() != null && this
						.getGlLastBal().equals(castOther.getGlLastBal())))
				&& ((this.getGlSecondBillDrAm() == castOther
						.getGlSecondBillDrAm()) || (this.getGlSecondBillDrAm() != null
						&& castOther.getGlSecondBillDrAm() != null && this
						.getGlSecondBillDrAm().equals(
								castOther.getGlSecondBillDrAm())))
				&& ((this.getGlSecondBillCrAm() == castOther
						.getGlSecondBillCrAm()) || (this.getGlSecondBillCrAm() != null
						&& castOther.getGlSecondBillCrAm() != null && this
						.getGlSecondBillCrAm().equals(
								castOther.getGlSecondBillCrAm())))
				&& ((this.getGlAcctMaxBal() == castOther.getGlAcctMaxBal()) || (this
						.getGlAcctMaxBal() != null
						&& castOther.getGlAcctMaxBal() != null && this
						.getGlAcctMaxBal().equals(castOther.getGlAcctMaxBal())))
				&& ((this.getGlOpacInstn() == castOther.getGlOpacInstn()) || (this
						.getGlOpacInstn() != null
						&& castOther.getGlOpacInstn() != null && this
						.getGlOpacInstn().equals(castOther.getGlOpacInstn())))
				&& ((this.getFiller() == castOther.getFiller()) || (this
						.getFiller() != null
						&& castOther.getFiller() != null && this.getFiller()
						.equals(castOther.getFiller())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getGlAcctNo() == null ? 0 : this.getGlAcctNo().hashCode());
		result = 37
				* result
				+ (getGlacaDbTimestamp() == null ? 0 : this
						.getGlacaDbTimestamp().hashCode());
		result = 37 * result
				+ (getGlBusnTyp() == null ? 0 : this.getGlBusnTyp().hashCode());
		result = 37
				* result
				+ (getGlAcctName() == null ? 0 : this.getGlAcctName()
						.hashCode());
		result = 37
				* result
				+ (getGlAcctFaceBal() == null ? 0 : this.getGlAcctFaceBal()
						.hashCode());
		result = 37 * result
				+ (getGlAfcBal() == null ? 0 : this.getGlAfcBal().hashCode());
		result = 37
				* result
				+ (getGlBalDireFlg() == null ? 0 : this.getGlBalDireFlg()
						.hashCode());
		result = 37
				* result
				+ (getGlCrntDayDrAmt() == null ? 0 : this.getGlCrntDayDrAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlCrntDayCrAmt() == null ? 0 : this.getGlCrntDayCrAmt()
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
				+ (getGlMnaccumDrAmt() == null ? 0 : this.getGlMnaccumDrAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlMnaccumCrAmt() == null ? 0 : this.getGlMnaccumCrAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlMnaccumDrItem() == null ? 0 : this.getGlMnaccumDrItem()
						.hashCode());
		result = 37
				* result
				+ (getGlMnaccumCrItem() == null ? 0 : this.getGlMnaccumCrItem()
						.hashCode());
		result = 37
				* result
				+ (getGlMnaccumDrBal() == null ? 0 : this.getGlMnaccumDrBal()
						.hashCode());
		result = 37
				* result
				+ (getGlMnaccumCrBal() == null ? 0 : this.getGlMnaccumCrBal()
						.hashCode());
		result = 37
				* result
				+ (getGlSsnDrTotlAmt() == null ? 0 : this.getGlSsnDrTotlAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlSsnCrTotlAmt() == null ? 0 : this.getGlSsnCrTotlAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlSsnDrTotlNumbe() == null ? 0 : this
						.getGlSsnDrTotlNumbe().hashCode());
		result = 37
				* result
				+ (getGlSsnCrTotlNumbe() == null ? 0 : this
						.getGlSsnCrTotlNumbe().hashCode());
		result = 37
				* result
				+ (getGlSsnDrTotlBal() == null ? 0 : this.getGlSsnDrTotlBal()
						.hashCode());
		result = 37
				* result
				+ (getGlSsnCrTotlBal() == null ? 0 : this.getGlSsnCrTotlBal()
						.hashCode());
		result = 37
				* result
				+ (getGlYrAccumDrAmt() == null ? 0 : this.getGlYrAccumDrAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlYrAccumCrAmt() == null ? 0 : this.getGlYrAccumCrAmt()
						.hashCode());
		result = 37
				* result
				+ (getGlYrAccumDrQty() == null ? 0 : this.getGlYrAccumDrQty()
						.hashCode());
		result = 37
				* result
				+ (getGlYrAccumCrQty() == null ? 0 : this.getGlYrAccumCrQty()
						.hashCode());
		result = 37
				* result
				+ (getGlYrAccumDrBal() == null ? 0 : this.getGlYrAccumDrBal()
						.hashCode());
		result = 37
				* result
				+ (getGlYrAccumCrBal() == null ? 0 : this.getGlYrAccumCrBal()
						.hashCode());
		result = 37
				* result
				+ (getGlDrIntrCod() == null ? 0 : this.getGlDrIntrCod()
						.hashCode());
		result = 37
				* result
				+ (getGlCrIntrCod() == null ? 0 : this.getGlCrIntrCod()
						.hashCode());
		result = 37
				* result
				+ (getGlDrFltIntr() == null ? 0 : this.getGlDrFltIntr()
						.hashCode());
		result = 37
				* result
				+ (getGlCrFltIntr() == null ? 0 : this.getGlCrFltIntr()
						.hashCode());
		result = 37
				* result
				+ (getGlTprdAccBal() == null ? 0 : this.getGlTprdAccBal()
						.hashCode());
		result = 37
				* result
				+ (getGlCrntPrdCd() == null ? 0 : this.getGlCrntPrdCd()
						.hashCode());
		result = 37
				* result
				+ (getGlAcctLargstBal() == null ? 0 : this.getGlAcctLargstBal()
						.hashCode());
		result = 37
				* result
				+ (getGlOverDrawLagstAmt() == null ? 0 : this
						.getGlOverDrawLagstAmt().hashCode());
		result = 37
				* result
				+ (getGlOverDrawStartDt() == null ? 0 : this
						.getGlOverDrawStartDt().hashCode());
		result = 37
				* result
				+ (getGlLastAccIntDt() == null ? 0 : this.getGlLastAccIntDt()
						.hashCode());
		result = 37
				* result
				+ (getGlLastTsfAccbalDt() == null ? 0 : this
						.getGlLastTsfAccbalDt().hashCode());
		result = 37
				* result
				+ (getGlLastAccDt() == null ? 0 : this.getGlLastAccDt()
						.hashCode());
		result = 37
				* result
				+ (getGlLstAmndDt() == null ? 0 : this.getGlLstAmndDt()
						.hashCode());
		result = 37 * result
				+ (getGlOpacDt() == null ? 0 : this.getGlOpacDt().hashCode());
		result = 37 * result
				+ (getGlCloseDt() == null ? 0 : this.getGlCloseDt().hashCode());
		result = 37 * result
				+ (getGlFrzSts() == null ? 0 : this.getGlFrzSts().hashCode());
		result = 37 * result
				+ (getGlAcctSts() == null ? 0 : this.getGlAcctSts().hashCode());
		result = 37 * result
				+ (getGlIntcFlg() == null ? 0 : this.getGlIntcFlg().hashCode());
		result = 37
				* result
				+ (getGlIntcCycle() == null ? 0 : this.getGlIntcCycle()
						.hashCode());
		result = 37
				* result
				+ (getGlPayIntAcctNo() == null ? 0 : this.getGlPayIntAcctNo()
						.hashCode());
		result = 37
				* result
				+ (getGlColaIntAcctNo() == null ? 0 : this.getGlColaIntAcctNo()
						.hashCode());
		result = 37
				* result
				+ (getGlReconDuedt() == null ? 0 : this.getGlReconDuedt()
						.hashCode());
		result = 37
				* result
				+ (getGlResponCent() == null ? 0 : this.getGlResponCent()
						.hashCode());
		result = 37
				* result
				+ (getGlResponer() == null ? 0 : this.getGlResponer()
						.hashCode());
		result = 37 * result
				+ (getGlAcctLmt() == null ? 0 : this.getGlAcctLmt().hashCode());
		result = 37
				* result
				+ (getGlAcctPageFmt() == null ? 0 : this.getGlAcctPageFmt()
						.hashCode());
		result = 37
				* result
				+ (getGlAcctMode() == null ? 0 : this.getGlAcctMode()
						.hashCode());
		result = 37
				* result
				+ (getGlOpunInst() == null ? 0 : this.getGlOpunInst()
						.hashCode());
		result = 37 * result
				+ (getGlCustNo() == null ? 0 : this.getGlCustNo().hashCode());
		result = 37 * result
				+ (getGlOpunCod() == null ? 0 : this.getGlOpunCod().hashCode());
		result = 37 * result
				+ (getGlAcctTyp() == null ? 0 : this.getGlAcctTyp().hashCode());
		result = 37 * result
				+ (getGlLgNo() == null ? 0 : this.getGlLgNo().hashCode());
		result = 37 * result
				+ (getGlAmndrNo() == null ? 0 : this.getGlAmndrNo().hashCode());
		result = 37
				* result
				+ (getGlSecondBillType() == null ? 0 : this
						.getGlSecondBillType().hashCode());
		result = 37
				* result
				+ (getGlSecondLastBal() == null ? 0 : this.getGlSecondLastBal()
						.hashCode());
		result = 37
				* result
				+ (getGlSecondBal() == null ? 0 : this.getGlSecondBal()
						.hashCode());
		result = 37
				* result
				+ (getGlCurrPageNo() == null ? 0 : this.getGlCurrPageNo()
						.hashCode());
		result = 37
				* result
				+ (getGlAccumNonPrtItem() == null ? 0 : this
						.getGlAccumNonPrtItem().hashCode());
		result = 37
				* result
				+ (getGlLstPrtRcdDt() == null ? 0 : this.getGlLstPrtRcdDt()
						.hashCode());
		result = 37
				* result
				+ (getGlMaxPrntTxnNo() == null ? 0 : this.getGlMaxPrntTxnNo()
						.hashCode());
		result = 37
				* result
				+ (getGlOpenMode() == null ? 0 : this.getGlOpenMode()
						.hashCode());
		result = 37
				* result
				+ (getGlIntrRcrdFlg() == null ? 0 : this.getGlIntrRcrdFlg()
						.hashCode());
		result = 37 * result
				+ (getGlProdFlg() == null ? 0 : this.getGlProdFlg().hashCode());
		result = 37 * result
				+ (getGlInfoCod() == null ? 0 : this.getGlInfoCod().hashCode());
		result = 37
				* result
				+ (getGlOppoAcctNo() == null ? 0 : this.getGlOppoAcctNo()
						.hashCode());
		result = 37
				* result
				+ (getGlAutoInvstIntrCod() == null ? 0 : this
						.getGlAutoInvstIntrCod().hashCode());
		result = 37
				* result
				+ (getGlAutoInvstFltIntr() == null ? 0 : this
						.getGlAutoInvstFltIntr().hashCode());
		result = 37
				* result
				+ (getGlAutoInvstAccum() == null ? 0 : this
						.getGlAutoInvstAccum().hashCode());
		result = 37
				* result
				+ (getGlCostCntr() == null ? 0 : this.getGlCostCntr()
						.hashCode());
		result = 37 * result
				+ (getGlDueDt() == null ? 0 : this.getGlDueDt().hashCode());
		result = 37 * result
				+ (getGlDlayFlg() == null ? 0 : this.getGlDlayFlg().hashCode());
		result = 37
				* result
				+ (getGlOverDrawAccum() == null ? 0 : this.getGlOverDrawAccum()
						.hashCode());
		result = 37 * result
				+ (getGlExtnSts() == null ? 0 : this.getGlExtnSts().hashCode());
		result = 37
				* result
				+ (getGlDtBgstSeqNo() == null ? 0 : this.getGlDtBgstSeqNo()
						.hashCode());
		result = 37 * result
				+ (getGlLastBal() == null ? 0 : this.getGlLastBal().hashCode());
		result = 37
				* result
				+ (getGlSecondBillDrAm() == null ? 0 : this
						.getGlSecondBillDrAm().hashCode());
		result = 37
				* result
				+ (getGlSecondBillCrAm() == null ? 0 : this
						.getGlSecondBillCrAm().hashCode());
		result = 37
				* result
				+ (getGlAcctMaxBal() == null ? 0 : this.getGlAcctMaxBal()
						.hashCode());
		result = 37
				* result
				+ (getGlOpacInstn() == null ? 0 : this.getGlOpacInstn()
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