package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CrtDccLnlnslnsH entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccLnlnslnsH extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccLnlnslnsHId id;
	private String lnlnsDbTimestamp;
	private Long lnFinlVrsn;
	private Long lnDbMntnNo;
	private String lnCustNo;
	private String lnCrlmtNo;
	private String lnOdLnBusn;
	private String lnAcctSts;
	private String lnLnTyp;
	private String lnHypoTyp;
	private String lnAccpTyp;
	private String lnCurrCod;
	private Double lnNwlnAmtHypoAmt;
	private Double lnTotlLnAmtHypoAmt;
	private Double lnLnBal;
	private Double lnPprdRfnAmt;
	private Double lnRepayPr;
	private Double lnIntApclTotlInplan;
	private Double lnAdvpmtTotl;
	private Double lnWhhdIntAccrud;
	private Double lnWhhdPrAccrud;
	private Double lnTrblApclAmtTotl;
	private Double lnCrntYrIntrbl;
	private Double lnCrntMnAdvSvcIntAccum;
	private Double lnYheadRblUcollLnInt;
	private Long lnTotlPrd;
	private Long lnArfnSchdPr;
	private Long lnArfnSchdInt;
	private Double lnFrstIntcIntr;
	private String lnFrstAlfdDt;
	private String lnDueDt;
	private String lnPrCacDt;
	private String lnIntcUpDt;
	private String lnIntcUpDtOddDays;
	private String lnRfnSty;
	private Long lnColiCyclTotlMn;
	private Long lnRopCyclTotlMn;
	private String lnRopDuran;
	private Long lnPprdIntpDay;
	private String lnIntrEffDt;
	private String lnIntsEffDt;
	private String lnIntrAdjSty;
	private String lnIntrAdjCycl;
	private String lnIntrAdjStrtDt;
	private String lnIntrAcorSty;
	private Double lnIntrNegoRate;
	private String lnDlayIntrAcorSty;
	private Double lnDlayIntrPlmnRate;
	private String lnCollSvcSty;
	private Double lnSvcRto;
	private Double lnTrto;
	private String lnRctExtnDt;
	private String lnBusnTypChgDt;
	private String lnOldLnAcctTrni;
	private String lnNwlnAcctNoTrno;
	private String lnAutoDdutPrFlg;
	private String lnAutoDeduIntFlg;
	private String lnAutoDeduDepAcctNo0;
	private String lnAutoDeduDepAcctNo1;
	private String lnAutoDeduDepAcctNo2;
	private String lnAutoDeduAcctTyp0;
	private String lnAutoDeduAcctTyp1;
	private String lnAutoDeduAcctTyp2;
	private String lnIntDisEndDtN;
	private String lnLastIntcUpDt;
	private Double lnCrntOvdlnIntInt;
	private Double lnDeratePenaltyTotl;
	private Double lnDerateArramtTotl;
	private String lnIntStrvDtN;
	private String lnPrIntsFlag;
	private String lnIntIntsFlag;
	private String lnBadLnFlg;
	private String lnApclFlg;
	private String lnFundToAuorFlg;
	private String lnIntRcptMail;
	private String lnDlayAdv;
	private String lnInstalRfnPlan;
	private Long lnLnPrd;
	private String lnRopRoiExcsFlag;
	private String lnCloseFlg;
	private Double lnArrPr;
	private String lnManTovdFlg;
	private Long lnTnrno;
	private String lnChgRfnStyDt;
	private String lnChgRfnSty;
	private String lnPaySeqFlg;
	private String lnDlyAutoPayFlg;
	private String lnDuranIntFlg;
	private Long lnIntDisRateN;
	private String lnGuarAccpExptNo;
	private String lnRcptNo;
	private String lnRwhldNo;
	private String lnSynlnFlg;
	private String lnClsdDt;
	private String lnAuorDepAcctNo;
	private String lnRmrk;
	private String lnDlayRskRtng;
	private String lnDlayLnRsn;
	private String lnDlayLnDt;
	private String lnFovdlnSqDt;
	private String lnDlayLnFrnDt;
	private String lnDlayLnFrnRsn;
	private Double lnDlayLnFrnAmt;
	private Double lnTovdlnPrBal;
	private Double lnTovdlnIntBal;
	private Double lnTovdlnAdvpmtBal;
	private String lnIntIntcUpDtN;
	private Double lnTbdbtPrBal;
	private Double lnTbdbtIntBal;
	private Double lnTbdbtAdvpmtBal;
	private String lnBddbIntRcvdDt;
	private String lnCrntDayFstTxSqNo;
	private String lnCrntDayLstTxSqNo;
	private String lnFlstTlrNo;
	private String lnFlstArpvPicNo;
	private String lnFlstDt;
	private String lnLtstMntnOprNo;
	private String lnLtstAprvPicNo;
	private String lnLtstMntnDt;
	private String lnBusnTyp;
	private String lnAautoRop;
	private String lnAautoPint;
	private String lnAalfdSucs;
	private Double lnTovdlnInt;
	private String lnFsAcct;
	private String lnGuarMarginAcctNo;
	private String lnPmnIntcCod;
	private String lnIntcCodTrnFee;
	private String lnAcctTyp;
	private String lnFundAcctNo;
	private String lnFstmRfnDt;
	private String lnFstmIntpDt;
	private String lnRopDuranCutdt;
	private String lnDepAcctNo;
	private String lnHypoSqNo;
	private Long lnPrToleDays;
	private Long lnIntDuranDays;
	private String lnIntrNegoSymb;
	private String lnDlayIntrPlmnSymb;
	private String lnCustdRcptRefNo;
	private String lnClsdIntcTyp;
	private String lnDtlPrtFlag;
	private Long lnDtlPrtPg;
	private String lnDtlPrtKey;
	private String lnLnFundRsur;
	private String lnLnPurp;
	private Long lnExtnTm;
	private String lnExtnCtrtNo;
	private String lnBusnTypNew;
	private String lnBusnTypOrg;
	private Double lnPenaltySttdAmt;
	private String lnPenaltyNegoSymb;
	private Double lnPenaltyNegoCod;
	private String lnCustTyp;
	private String lnIntrTyp;
	private Long lnIncrDecrInterPrd;
	private Double lnIncrDecrAmt;
	private Double lnEqpropIncrDecr;
	private String lnSignlLnInturnTable;
	private Double lnDlayPrTotl;
	private String lnRopDay;
	private String lnLtstPrMvDt;
	private Double lnFrstDelayIntr;
	private String lnLnToDepFlg;
	private String lnLtstPrMvTm;
	private String lnLtstRiskTypDt;
	private String lnCurrIden;
	private Double lnLsacIntPrAmt;
	private Double lnLsacInt;
	private Double lnIntrblInt;
	private String lnTrnlstOvdDt;
	private Double lnOvdlnIntrbl;
	private Double lnOvdlnIntrblApclTotl;
	private Double lnOvdlnIntApclTotl;
	private Double lnLsacIntApclTotl;
	private Double lnPrApclTotl;
	private Double lnDlayIntInt;
	private Double lnArrAmt;
	private Double lnNextPrdArfnAmt;
	private Double lnApclPenalty;
	private Double lnAccumColi;
	private Double lnAccumRecvPnl;
	private Double lnAccumRecvSvc;
	private Double lnAdvpmtApclTotl;
	private Double lnCrntPrdPayrblInt;
	private Double lnPenalty;
	private String lnPenlStrtDtN;
	private String lnHaltStrtDtN;
	private String lnHaltCutDtN;
	private Double lnSvcBal;
	private Double lnRcvIntTotl;
	private Double lnCrntOvdlnIntrbl;
	private Double lnCrntOvdlnLnIntr;
	private String lnHaltIntcSymb;
	private String lnSpv;
	private Double lnCrntPrdPayrblPr;
	private Double lnNextPrdPayrblInt;
	private Double lnNextPrdPayrblPr;
	private Double lnYheadLnBal;
	private Double lnCrntYrLnAccum;
	private Double lnCrntYrRevAccum;
	private Double lnCrntYrColledInt;
	private Double lnCrntPrdRtnAmt;
	private String lnExceFlg;
	private String lnFsFlg;
	private String lnZhibiaoNo;
	private String lnFrzDtN;
	private Long lnTdPsbkNo;
	private Long lnTdPsbkSeqNo;
	private String lnNacctSts;
	private String lnNorBackFlg;
	private String lnHuntDueDtN;
	private String lnLocCityFlg;
	private String lnVipAcctFlg;
	private String filler;
	private String comAccountNo;
	private String loanNorLgNo;
	private Date endDate;

	// Constructors

	/** default constructor */
	public CrtDccLnlnslnsH() {
	}

	/** minimal constructor */
	public CrtDccLnlnslnsH(CrtDccLnlnslnsHId id) {
		this.id = id;
	}

	/** full constructor */
	public CrtDccLnlnslnsH(CrtDccLnlnslnsHId id, String lnlnsDbTimestamp,
			Long lnFinlVrsn, Long lnDbMntnNo, String lnCustNo,
			String lnCrlmtNo, String lnOdLnBusn, String lnAcctSts,
			String lnLnTyp, String lnHypoTyp, String lnAccpTyp,
			String lnCurrCod, Double lnNwlnAmtHypoAmt,
			Double lnTotlLnAmtHypoAmt, Double lnLnBal, Double lnPprdRfnAmt,
			Double lnRepayPr, Double lnIntApclTotlInplan, Double lnAdvpmtTotl,
			Double lnWhhdIntAccrud, Double lnWhhdPrAccrud,
			Double lnTrblApclAmtTotl, Double lnCrntYrIntrbl,
			Double lnCrntMnAdvSvcIntAccum, Double lnYheadRblUcollLnInt,
			Long lnTotlPrd, Long lnArfnSchdPr, Long lnArfnSchdInt,
			Double lnFrstIntcIntr, String lnFrstAlfdDt, String lnDueDt,
			String lnPrCacDt, String lnIntcUpDt, String lnIntcUpDtOddDays,
			String lnRfnSty, Long lnColiCyclTotlMn, Long lnRopCyclTotlMn,
			String lnRopDuran, Long lnPprdIntpDay, String lnIntrEffDt,
			String lnIntsEffDt, String lnIntrAdjSty, String lnIntrAdjCycl,
			String lnIntrAdjStrtDt, String lnIntrAcorSty,
			Double lnIntrNegoRate, String lnDlayIntrAcorSty,
			Double lnDlayIntrPlmnRate, String lnCollSvcSty, Double lnSvcRto,
			Double lnTrto, String lnRctExtnDt, String lnBusnTypChgDt,
			String lnOldLnAcctTrni, String lnNwlnAcctNoTrno,
			String lnAutoDdutPrFlg, String lnAutoDeduIntFlg,
			String lnAutoDeduDepAcctNo0, String lnAutoDeduDepAcctNo1,
			String lnAutoDeduDepAcctNo2, String lnAutoDeduAcctTyp0,
			String lnAutoDeduAcctTyp1, String lnAutoDeduAcctTyp2,
			String lnIntDisEndDtN, String lnLastIntcUpDt,
			Double lnCrntOvdlnIntInt, Double lnDeratePenaltyTotl,
			Double lnDerateArramtTotl, String lnIntStrvDtN,
			String lnPrIntsFlag, String lnIntIntsFlag, String lnBadLnFlg,
			String lnApclFlg, String lnFundToAuorFlg, String lnIntRcptMail,
			String lnDlayAdv, String lnInstalRfnPlan, Long lnLnPrd,
			String lnRopRoiExcsFlag, String lnCloseFlg, Double lnArrPr,
			String lnManTovdFlg, Long lnTnrno, String lnChgRfnStyDt,
			String lnChgRfnSty, String lnPaySeqFlg, String lnDlyAutoPayFlg,
			String lnDuranIntFlg, Long lnIntDisRateN, String lnGuarAccpExptNo,
			String lnRcptNo, String lnRwhldNo, String lnSynlnFlg,
			String lnClsdDt, String lnAuorDepAcctNo, String lnRmrk,
			String lnDlayRskRtng, String lnDlayLnRsn, String lnDlayLnDt,
			String lnFovdlnSqDt, String lnDlayLnFrnDt, String lnDlayLnFrnRsn,
			Double lnDlayLnFrnAmt, Double lnTovdlnPrBal, Double lnTovdlnIntBal,
			Double lnTovdlnAdvpmtBal, String lnIntIntcUpDtN,
			Double lnTbdbtPrBal, Double lnTbdbtIntBal, Double lnTbdbtAdvpmtBal,
			String lnBddbIntRcvdDt, String lnCrntDayFstTxSqNo,
			String lnCrntDayLstTxSqNo, String lnFlstTlrNo,
			String lnFlstArpvPicNo, String lnFlstDt, String lnLtstMntnOprNo,
			String lnLtstAprvPicNo, String lnLtstMntnDt, String lnBusnTyp,
			String lnAautoRop, String lnAautoPint, String lnAalfdSucs,
			Double lnTovdlnInt, String lnFsAcct, String lnGuarMarginAcctNo,
			String lnPmnIntcCod, String lnIntcCodTrnFee, String lnAcctTyp,
			String lnFundAcctNo, String lnFstmRfnDt, String lnFstmIntpDt,
			String lnRopDuranCutdt, String lnDepAcctNo, String lnHypoSqNo,
			Long lnPrToleDays, Long lnIntDuranDays, String lnIntrNegoSymb,
			String lnDlayIntrPlmnSymb, String lnCustdRcptRefNo,
			String lnClsdIntcTyp, String lnDtlPrtFlag, Long lnDtlPrtPg,
			String lnDtlPrtKey, String lnLnFundRsur, String lnLnPurp,
			Long lnExtnTm, String lnExtnCtrtNo, String lnBusnTypNew,
			String lnBusnTypOrg, Double lnPenaltySttdAmt,
			String lnPenaltyNegoSymb, Double lnPenaltyNegoCod,
			String lnCustTyp, String lnIntrTyp, Long lnIncrDecrInterPrd,
			Double lnIncrDecrAmt, Double lnEqpropIncrDecr,
			String lnSignlLnInturnTable, Double lnDlayPrTotl, String lnRopDay,
			String lnLtstPrMvDt, Double lnFrstDelayIntr, String lnLnToDepFlg,
			String lnLtstPrMvTm, String lnLtstRiskTypDt, String lnCurrIden,
			Double lnLsacIntPrAmt, Double lnLsacInt, Double lnIntrblInt,
			String lnTrnlstOvdDt, Double lnOvdlnIntrbl,
			Double lnOvdlnIntrblApclTotl, Double lnOvdlnIntApclTotl,
			Double lnLsacIntApclTotl, Double lnPrApclTotl, Double lnDlayIntInt,
			Double lnArrAmt, Double lnNextPrdArfnAmt, Double lnApclPenalty,
			Double lnAccumColi, Double lnAccumRecvPnl, Double lnAccumRecvSvc,
			Double lnAdvpmtApclTotl, Double lnCrntPrdPayrblInt,
			Double lnPenalty, String lnPenlStrtDtN, String lnHaltStrtDtN,
			String lnHaltCutDtN, Double lnSvcBal, Double lnRcvIntTotl,
			Double lnCrntOvdlnIntrbl, Double lnCrntOvdlnLnIntr,
			String lnHaltIntcSymb, String lnSpv, Double lnCrntPrdPayrblPr,
			Double lnNextPrdPayrblInt, Double lnNextPrdPayrblPr,
			Double lnYheadLnBal, Double lnCrntYrLnAccum,
			Double lnCrntYrRevAccum, Double lnCrntYrColledInt,
			Double lnCrntPrdRtnAmt, String lnExceFlg, String lnFsFlg,
			String lnZhibiaoNo, String lnFrzDtN, Long lnTdPsbkNo,
			Long lnTdPsbkSeqNo, String lnNacctSts, String lnNorBackFlg,
			String lnHuntDueDtN, String lnLocCityFlg, String lnVipAcctFlg,
			String filler, String comAccountNo, String loanNorLgNo, Date endDate) {
		this.id = id;
		this.lnlnsDbTimestamp = lnlnsDbTimestamp;
		this.lnFinlVrsn = lnFinlVrsn;
		this.lnDbMntnNo = lnDbMntnNo;
		this.lnCustNo = lnCustNo;
		this.lnCrlmtNo = lnCrlmtNo;
		this.lnOdLnBusn = lnOdLnBusn;
		this.lnAcctSts = lnAcctSts;
		this.lnLnTyp = lnLnTyp;
		this.lnHypoTyp = lnHypoTyp;
		this.lnAccpTyp = lnAccpTyp;
		this.lnCurrCod = lnCurrCod;
		this.lnNwlnAmtHypoAmt = lnNwlnAmtHypoAmt;
		this.lnTotlLnAmtHypoAmt = lnTotlLnAmtHypoAmt;
		this.lnLnBal = lnLnBal;
		this.lnPprdRfnAmt = lnPprdRfnAmt;
		this.lnRepayPr = lnRepayPr;
		this.lnIntApclTotlInplan = lnIntApclTotlInplan;
		this.lnAdvpmtTotl = lnAdvpmtTotl;
		this.lnWhhdIntAccrud = lnWhhdIntAccrud;
		this.lnWhhdPrAccrud = lnWhhdPrAccrud;
		this.lnTrblApclAmtTotl = lnTrblApclAmtTotl;
		this.lnCrntYrIntrbl = lnCrntYrIntrbl;
		this.lnCrntMnAdvSvcIntAccum = lnCrntMnAdvSvcIntAccum;
		this.lnYheadRblUcollLnInt = lnYheadRblUcollLnInt;
		this.lnTotlPrd = lnTotlPrd;
		this.lnArfnSchdPr = lnArfnSchdPr;
		this.lnArfnSchdInt = lnArfnSchdInt;
		this.lnFrstIntcIntr = lnFrstIntcIntr;
		this.lnFrstAlfdDt = lnFrstAlfdDt;
		this.lnDueDt = lnDueDt;
		this.lnPrCacDt = lnPrCacDt;
		this.lnIntcUpDt = lnIntcUpDt;
		this.lnIntcUpDtOddDays = lnIntcUpDtOddDays;
		this.lnRfnSty = lnRfnSty;
		this.lnColiCyclTotlMn = lnColiCyclTotlMn;
		this.lnRopCyclTotlMn = lnRopCyclTotlMn;
		this.lnRopDuran = lnRopDuran;
		this.lnPprdIntpDay = lnPprdIntpDay;
		this.lnIntrEffDt = lnIntrEffDt;
		this.lnIntsEffDt = lnIntsEffDt;
		this.lnIntrAdjSty = lnIntrAdjSty;
		this.lnIntrAdjCycl = lnIntrAdjCycl;
		this.lnIntrAdjStrtDt = lnIntrAdjStrtDt;
		this.lnIntrAcorSty = lnIntrAcorSty;
		this.lnIntrNegoRate = lnIntrNegoRate;
		this.lnDlayIntrAcorSty = lnDlayIntrAcorSty;
		this.lnDlayIntrPlmnRate = lnDlayIntrPlmnRate;
		this.lnCollSvcSty = lnCollSvcSty;
		this.lnSvcRto = lnSvcRto;
		this.lnTrto = lnTrto;
		this.lnRctExtnDt = lnRctExtnDt;
		this.lnBusnTypChgDt = lnBusnTypChgDt;
		this.lnOldLnAcctTrni = lnOldLnAcctTrni;
		this.lnNwlnAcctNoTrno = lnNwlnAcctNoTrno;
		this.lnAutoDdutPrFlg = lnAutoDdutPrFlg;
		this.lnAutoDeduIntFlg = lnAutoDeduIntFlg;
		this.lnAutoDeduDepAcctNo0 = lnAutoDeduDepAcctNo0;
		this.lnAutoDeduDepAcctNo1 = lnAutoDeduDepAcctNo1;
		this.lnAutoDeduDepAcctNo2 = lnAutoDeduDepAcctNo2;
		this.lnAutoDeduAcctTyp0 = lnAutoDeduAcctTyp0;
		this.lnAutoDeduAcctTyp1 = lnAutoDeduAcctTyp1;
		this.lnAutoDeduAcctTyp2 = lnAutoDeduAcctTyp2;
		this.lnIntDisEndDtN = lnIntDisEndDtN;
		this.lnLastIntcUpDt = lnLastIntcUpDt;
		this.lnCrntOvdlnIntInt = lnCrntOvdlnIntInt;
		this.lnDeratePenaltyTotl = lnDeratePenaltyTotl;
		this.lnDerateArramtTotl = lnDerateArramtTotl;
		this.lnIntStrvDtN = lnIntStrvDtN;
		this.lnPrIntsFlag = lnPrIntsFlag;
		this.lnIntIntsFlag = lnIntIntsFlag;
		this.lnBadLnFlg = lnBadLnFlg;
		this.lnApclFlg = lnApclFlg;
		this.lnFundToAuorFlg = lnFundToAuorFlg;
		this.lnIntRcptMail = lnIntRcptMail;
		this.lnDlayAdv = lnDlayAdv;
		this.lnInstalRfnPlan = lnInstalRfnPlan;
		this.lnLnPrd = lnLnPrd;
		this.lnRopRoiExcsFlag = lnRopRoiExcsFlag;
		this.lnCloseFlg = lnCloseFlg;
		this.lnArrPr = lnArrPr;
		this.lnManTovdFlg = lnManTovdFlg;
		this.lnTnrno = lnTnrno;
		this.lnChgRfnStyDt = lnChgRfnStyDt;
		this.lnChgRfnSty = lnChgRfnSty;
		this.lnPaySeqFlg = lnPaySeqFlg;
		this.lnDlyAutoPayFlg = lnDlyAutoPayFlg;
		this.lnDuranIntFlg = lnDuranIntFlg;
		this.lnIntDisRateN = lnIntDisRateN;
		this.lnGuarAccpExptNo = lnGuarAccpExptNo;
		this.lnRcptNo = lnRcptNo;
		this.lnRwhldNo = lnRwhldNo;
		this.lnSynlnFlg = lnSynlnFlg;
		this.lnClsdDt = lnClsdDt;
		this.lnAuorDepAcctNo = lnAuorDepAcctNo;
		this.lnRmrk = lnRmrk;
		this.lnDlayRskRtng = lnDlayRskRtng;
		this.lnDlayLnRsn = lnDlayLnRsn;
		this.lnDlayLnDt = lnDlayLnDt;
		this.lnFovdlnSqDt = lnFovdlnSqDt;
		this.lnDlayLnFrnDt = lnDlayLnFrnDt;
		this.lnDlayLnFrnRsn = lnDlayLnFrnRsn;
		this.lnDlayLnFrnAmt = lnDlayLnFrnAmt;
		this.lnTovdlnPrBal = lnTovdlnPrBal;
		this.lnTovdlnIntBal = lnTovdlnIntBal;
		this.lnTovdlnAdvpmtBal = lnTovdlnAdvpmtBal;
		this.lnIntIntcUpDtN = lnIntIntcUpDtN;
		this.lnTbdbtPrBal = lnTbdbtPrBal;
		this.lnTbdbtIntBal = lnTbdbtIntBal;
		this.lnTbdbtAdvpmtBal = lnTbdbtAdvpmtBal;
		this.lnBddbIntRcvdDt = lnBddbIntRcvdDt;
		this.lnCrntDayFstTxSqNo = lnCrntDayFstTxSqNo;
		this.lnCrntDayLstTxSqNo = lnCrntDayLstTxSqNo;
		this.lnFlstTlrNo = lnFlstTlrNo;
		this.lnFlstArpvPicNo = lnFlstArpvPicNo;
		this.lnFlstDt = lnFlstDt;
		this.lnLtstMntnOprNo = lnLtstMntnOprNo;
		this.lnLtstAprvPicNo = lnLtstAprvPicNo;
		this.lnLtstMntnDt = lnLtstMntnDt;
		this.lnBusnTyp = lnBusnTyp;
		this.lnAautoRop = lnAautoRop;
		this.lnAautoPint = lnAautoPint;
		this.lnAalfdSucs = lnAalfdSucs;
		this.lnTovdlnInt = lnTovdlnInt;
		this.lnFsAcct = lnFsAcct;
		this.lnGuarMarginAcctNo = lnGuarMarginAcctNo;
		this.lnPmnIntcCod = lnPmnIntcCod;
		this.lnIntcCodTrnFee = lnIntcCodTrnFee;
		this.lnAcctTyp = lnAcctTyp;
		this.lnFundAcctNo = lnFundAcctNo;
		this.lnFstmRfnDt = lnFstmRfnDt;
		this.lnFstmIntpDt = lnFstmIntpDt;
		this.lnRopDuranCutdt = lnRopDuranCutdt;
		this.lnDepAcctNo = lnDepAcctNo;
		this.lnHypoSqNo = lnHypoSqNo;
		this.lnPrToleDays = lnPrToleDays;
		this.lnIntDuranDays = lnIntDuranDays;
		this.lnIntrNegoSymb = lnIntrNegoSymb;
		this.lnDlayIntrPlmnSymb = lnDlayIntrPlmnSymb;
		this.lnCustdRcptRefNo = lnCustdRcptRefNo;
		this.lnClsdIntcTyp = lnClsdIntcTyp;
		this.lnDtlPrtFlag = lnDtlPrtFlag;
		this.lnDtlPrtPg = lnDtlPrtPg;
		this.lnDtlPrtKey = lnDtlPrtKey;
		this.lnLnFundRsur = lnLnFundRsur;
		this.lnLnPurp = lnLnPurp;
		this.lnExtnTm = lnExtnTm;
		this.lnExtnCtrtNo = lnExtnCtrtNo;
		this.lnBusnTypNew = lnBusnTypNew;
		this.lnBusnTypOrg = lnBusnTypOrg;
		this.lnPenaltySttdAmt = lnPenaltySttdAmt;
		this.lnPenaltyNegoSymb = lnPenaltyNegoSymb;
		this.lnPenaltyNegoCod = lnPenaltyNegoCod;
		this.lnCustTyp = lnCustTyp;
		this.lnIntrTyp = lnIntrTyp;
		this.lnIncrDecrInterPrd = lnIncrDecrInterPrd;
		this.lnIncrDecrAmt = lnIncrDecrAmt;
		this.lnEqpropIncrDecr = lnEqpropIncrDecr;
		this.lnSignlLnInturnTable = lnSignlLnInturnTable;
		this.lnDlayPrTotl = lnDlayPrTotl;
		this.lnRopDay = lnRopDay;
		this.lnLtstPrMvDt = lnLtstPrMvDt;
		this.lnFrstDelayIntr = lnFrstDelayIntr;
		this.lnLnToDepFlg = lnLnToDepFlg;
		this.lnLtstPrMvTm = lnLtstPrMvTm;
		this.lnLtstRiskTypDt = lnLtstRiskTypDt;
		this.lnCurrIden = lnCurrIden;
		this.lnLsacIntPrAmt = lnLsacIntPrAmt;
		this.lnLsacInt = lnLsacInt;
		this.lnIntrblInt = lnIntrblInt;
		this.lnTrnlstOvdDt = lnTrnlstOvdDt;
		this.lnOvdlnIntrbl = lnOvdlnIntrbl;
		this.lnOvdlnIntrblApclTotl = lnOvdlnIntrblApclTotl;
		this.lnOvdlnIntApclTotl = lnOvdlnIntApclTotl;
		this.lnLsacIntApclTotl = lnLsacIntApclTotl;
		this.lnPrApclTotl = lnPrApclTotl;
		this.lnDlayIntInt = lnDlayIntInt;
		this.lnArrAmt = lnArrAmt;
		this.lnNextPrdArfnAmt = lnNextPrdArfnAmt;
		this.lnApclPenalty = lnApclPenalty;
		this.lnAccumColi = lnAccumColi;
		this.lnAccumRecvPnl = lnAccumRecvPnl;
		this.lnAccumRecvSvc = lnAccumRecvSvc;
		this.lnAdvpmtApclTotl = lnAdvpmtApclTotl;
		this.lnCrntPrdPayrblInt = lnCrntPrdPayrblInt;
		this.lnPenalty = lnPenalty;
		this.lnPenlStrtDtN = lnPenlStrtDtN;
		this.lnHaltStrtDtN = lnHaltStrtDtN;
		this.lnHaltCutDtN = lnHaltCutDtN;
		this.lnSvcBal = lnSvcBal;
		this.lnRcvIntTotl = lnRcvIntTotl;
		this.lnCrntOvdlnIntrbl = lnCrntOvdlnIntrbl;
		this.lnCrntOvdlnLnIntr = lnCrntOvdlnLnIntr;
		this.lnHaltIntcSymb = lnHaltIntcSymb;
		this.lnSpv = lnSpv;
		this.lnCrntPrdPayrblPr = lnCrntPrdPayrblPr;
		this.lnNextPrdPayrblInt = lnNextPrdPayrblInt;
		this.lnNextPrdPayrblPr = lnNextPrdPayrblPr;
		this.lnYheadLnBal = lnYheadLnBal;
		this.lnCrntYrLnAccum = lnCrntYrLnAccum;
		this.lnCrntYrRevAccum = lnCrntYrRevAccum;
		this.lnCrntYrColledInt = lnCrntYrColledInt;
		this.lnCrntPrdRtnAmt = lnCrntPrdRtnAmt;
		this.lnExceFlg = lnExceFlg;
		this.lnFsFlg = lnFsFlg;
		this.lnZhibiaoNo = lnZhibiaoNo;
		this.lnFrzDtN = lnFrzDtN;
		this.lnTdPsbkNo = lnTdPsbkNo;
		this.lnTdPsbkSeqNo = lnTdPsbkSeqNo;
		this.lnNacctSts = lnNacctSts;
		this.lnNorBackFlg = lnNorBackFlg;
		this.lnHuntDueDtN = lnHuntDueDtN;
		this.lnLocCityFlg = lnLocCityFlg;
		this.lnVipAcctFlg = lnVipAcctFlg;
		this.filler = filler;
		this.comAccountNo = comAccountNo;
		this.loanNorLgNo = loanNorLgNo;
		this.endDate = endDate;
	}

	// Property accessors

	public CrtDccLnlnslnsHId getId() {
		return this.id;
	}

	public void setId(CrtDccLnlnslnsHId id) {
		this.id = id;
	}

	public String getLnlnsDbTimestamp() {
		return this.lnlnsDbTimestamp;
	}

	public void setLnlnsDbTimestamp(String lnlnsDbTimestamp) {
		this.lnlnsDbTimestamp = lnlnsDbTimestamp;
	}

	public Long getLnFinlVrsn() {
		return this.lnFinlVrsn;
	}

	public void setLnFinlVrsn(Long lnFinlVrsn) {
		this.lnFinlVrsn = lnFinlVrsn;
	}

	public Long getLnDbMntnNo() {
		return this.lnDbMntnNo;
	}

	public void setLnDbMntnNo(Long lnDbMntnNo) {
		this.lnDbMntnNo = lnDbMntnNo;
	}

	public String getLnCustNo() {
		return this.lnCustNo;
	}

	public void setLnCustNo(String lnCustNo) {
		this.lnCustNo = lnCustNo;
	}

	public String getLnCrlmtNo() {
		return this.lnCrlmtNo;
	}

	public void setLnCrlmtNo(String lnCrlmtNo) {
		this.lnCrlmtNo = lnCrlmtNo;
	}

	public String getLnOdLnBusn() {
		return this.lnOdLnBusn;
	}

	public void setLnOdLnBusn(String lnOdLnBusn) {
		this.lnOdLnBusn = lnOdLnBusn;
	}

	public String getLnAcctSts() {
		return this.lnAcctSts;
	}

	public void setLnAcctSts(String lnAcctSts) {
		this.lnAcctSts = lnAcctSts;
	}

	public String getLnLnTyp() {
		return this.lnLnTyp;
	}

	public void setLnLnTyp(String lnLnTyp) {
		this.lnLnTyp = lnLnTyp;
	}

	public String getLnHypoTyp() {
		return this.lnHypoTyp;
	}

	public void setLnHypoTyp(String lnHypoTyp) {
		this.lnHypoTyp = lnHypoTyp;
	}

	public String getLnAccpTyp() {
		return this.lnAccpTyp;
	}

	public void setLnAccpTyp(String lnAccpTyp) {
		this.lnAccpTyp = lnAccpTyp;
	}

	public String getLnCurrCod() {
		return this.lnCurrCod;
	}

	public void setLnCurrCod(String lnCurrCod) {
		this.lnCurrCod = lnCurrCod;
	}

	public Double getLnNwlnAmtHypoAmt() {
		return this.lnNwlnAmtHypoAmt;
	}

	public void setLnNwlnAmtHypoAmt(Double lnNwlnAmtHypoAmt) {
		this.lnNwlnAmtHypoAmt = lnNwlnAmtHypoAmt;
	}

	public Double getLnTotlLnAmtHypoAmt() {
		return this.lnTotlLnAmtHypoAmt;
	}

	public void setLnTotlLnAmtHypoAmt(Double lnTotlLnAmtHypoAmt) {
		this.lnTotlLnAmtHypoAmt = lnTotlLnAmtHypoAmt;
	}

	public Double getLnLnBal() {
		return this.lnLnBal;
	}

	public void setLnLnBal(Double lnLnBal) {
		this.lnLnBal = lnLnBal;
	}

	public Double getLnPprdRfnAmt() {
		return this.lnPprdRfnAmt;
	}

	public void setLnPprdRfnAmt(Double lnPprdRfnAmt) {
		this.lnPprdRfnAmt = lnPprdRfnAmt;
	}

	public Double getLnRepayPr() {
		return this.lnRepayPr;
	}

	public void setLnRepayPr(Double lnRepayPr) {
		this.lnRepayPr = lnRepayPr;
	}

	public Double getLnIntApclTotlInplan() {
		return this.lnIntApclTotlInplan;
	}

	public void setLnIntApclTotlInplan(Double lnIntApclTotlInplan) {
		this.lnIntApclTotlInplan = lnIntApclTotlInplan;
	}

	public Double getLnAdvpmtTotl() {
		return this.lnAdvpmtTotl;
	}

	public void setLnAdvpmtTotl(Double lnAdvpmtTotl) {
		this.lnAdvpmtTotl = lnAdvpmtTotl;
	}

	public Double getLnWhhdIntAccrud() {
		return this.lnWhhdIntAccrud;
	}

	public void setLnWhhdIntAccrud(Double lnWhhdIntAccrud) {
		this.lnWhhdIntAccrud = lnWhhdIntAccrud;
	}

	public Double getLnWhhdPrAccrud() {
		return this.lnWhhdPrAccrud;
	}

	public void setLnWhhdPrAccrud(Double lnWhhdPrAccrud) {
		this.lnWhhdPrAccrud = lnWhhdPrAccrud;
	}

	public Double getLnTrblApclAmtTotl() {
		return this.lnTrblApclAmtTotl;
	}

	public void setLnTrblApclAmtTotl(Double lnTrblApclAmtTotl) {
		this.lnTrblApclAmtTotl = lnTrblApclAmtTotl;
	}

	public Double getLnCrntYrIntrbl() {
		return this.lnCrntYrIntrbl;
	}

	public void setLnCrntYrIntrbl(Double lnCrntYrIntrbl) {
		this.lnCrntYrIntrbl = lnCrntYrIntrbl;
	}

	public Double getLnCrntMnAdvSvcIntAccum() {
		return this.lnCrntMnAdvSvcIntAccum;
	}

	public void setLnCrntMnAdvSvcIntAccum(Double lnCrntMnAdvSvcIntAccum) {
		this.lnCrntMnAdvSvcIntAccum = lnCrntMnAdvSvcIntAccum;
	}

	public Double getLnYheadRblUcollLnInt() {
		return this.lnYheadRblUcollLnInt;
	}

	public void setLnYheadRblUcollLnInt(Double lnYheadRblUcollLnInt) {
		this.lnYheadRblUcollLnInt = lnYheadRblUcollLnInt;
	}

	public Long getLnTotlPrd() {
		return this.lnTotlPrd;
	}

	public void setLnTotlPrd(Long lnTotlPrd) {
		this.lnTotlPrd = lnTotlPrd;
	}

	public Long getLnArfnSchdPr() {
		return this.lnArfnSchdPr;
	}

	public void setLnArfnSchdPr(Long lnArfnSchdPr) {
		this.lnArfnSchdPr = lnArfnSchdPr;
	}

	public Long getLnArfnSchdInt() {
		return this.lnArfnSchdInt;
	}

	public void setLnArfnSchdInt(Long lnArfnSchdInt) {
		this.lnArfnSchdInt = lnArfnSchdInt;
	}

	public Double getLnFrstIntcIntr() {
		return this.lnFrstIntcIntr;
	}

	public void setLnFrstIntcIntr(Double lnFrstIntcIntr) {
		this.lnFrstIntcIntr = lnFrstIntcIntr;
	}

	public String getLnFrstAlfdDt() {
		return this.lnFrstAlfdDt;
	}

	public void setLnFrstAlfdDt(String lnFrstAlfdDt) {
		this.lnFrstAlfdDt = lnFrstAlfdDt;
	}

	public String getLnDueDt() {
		return this.lnDueDt;
	}

	public void setLnDueDt(String lnDueDt) {
		this.lnDueDt = lnDueDt;
	}

	public String getLnPrCacDt() {
		return this.lnPrCacDt;
	}

	public void setLnPrCacDt(String lnPrCacDt) {
		this.lnPrCacDt = lnPrCacDt;
	}

	public String getLnIntcUpDt() {
		return this.lnIntcUpDt;
	}

	public void setLnIntcUpDt(String lnIntcUpDt) {
		this.lnIntcUpDt = lnIntcUpDt;
	}

	public String getLnIntcUpDtOddDays() {
		return this.lnIntcUpDtOddDays;
	}

	public void setLnIntcUpDtOddDays(String lnIntcUpDtOddDays) {
		this.lnIntcUpDtOddDays = lnIntcUpDtOddDays;
	}

	public String getLnRfnSty() {
		return this.lnRfnSty;
	}

	public void setLnRfnSty(String lnRfnSty) {
		this.lnRfnSty = lnRfnSty;
	}

	public Long getLnColiCyclTotlMn() {
		return this.lnColiCyclTotlMn;
	}

	public void setLnColiCyclTotlMn(Long lnColiCyclTotlMn) {
		this.lnColiCyclTotlMn = lnColiCyclTotlMn;
	}

	public Long getLnRopCyclTotlMn() {
		return this.lnRopCyclTotlMn;
	}

	public void setLnRopCyclTotlMn(Long lnRopCyclTotlMn) {
		this.lnRopCyclTotlMn = lnRopCyclTotlMn;
	}

	public String getLnRopDuran() {
		return this.lnRopDuran;
	}

	public void setLnRopDuran(String lnRopDuran) {
		this.lnRopDuran = lnRopDuran;
	}

	public Long getLnPprdIntpDay() {
		return this.lnPprdIntpDay;
	}

	public void setLnPprdIntpDay(Long lnPprdIntpDay) {
		this.lnPprdIntpDay = lnPprdIntpDay;
	}

	public String getLnIntrEffDt() {
		return this.lnIntrEffDt;
	}

	public void setLnIntrEffDt(String lnIntrEffDt) {
		this.lnIntrEffDt = lnIntrEffDt;
	}

	public String getLnIntsEffDt() {
		return this.lnIntsEffDt;
	}

	public void setLnIntsEffDt(String lnIntsEffDt) {
		this.lnIntsEffDt = lnIntsEffDt;
	}

	public String getLnIntrAdjSty() {
		return this.lnIntrAdjSty;
	}

	public void setLnIntrAdjSty(String lnIntrAdjSty) {
		this.lnIntrAdjSty = lnIntrAdjSty;
	}

	public String getLnIntrAdjCycl() {
		return this.lnIntrAdjCycl;
	}

	public void setLnIntrAdjCycl(String lnIntrAdjCycl) {
		this.lnIntrAdjCycl = lnIntrAdjCycl;
	}

	public String getLnIntrAdjStrtDt() {
		return this.lnIntrAdjStrtDt;
	}

	public void setLnIntrAdjStrtDt(String lnIntrAdjStrtDt) {
		this.lnIntrAdjStrtDt = lnIntrAdjStrtDt;
	}

	public String getLnIntrAcorSty() {
		return this.lnIntrAcorSty;
	}

	public void setLnIntrAcorSty(String lnIntrAcorSty) {
		this.lnIntrAcorSty = lnIntrAcorSty;
	}

	public Double getLnIntrNegoRate() {
		return this.lnIntrNegoRate;
	}

	public void setLnIntrNegoRate(Double lnIntrNegoRate) {
		this.lnIntrNegoRate = lnIntrNegoRate;
	}

	public String getLnDlayIntrAcorSty() {
		return this.lnDlayIntrAcorSty;
	}

	public void setLnDlayIntrAcorSty(String lnDlayIntrAcorSty) {
		this.lnDlayIntrAcorSty = lnDlayIntrAcorSty;
	}

	public Double getLnDlayIntrPlmnRate() {
		return this.lnDlayIntrPlmnRate;
	}

	public void setLnDlayIntrPlmnRate(Double lnDlayIntrPlmnRate) {
		this.lnDlayIntrPlmnRate = lnDlayIntrPlmnRate;
	}

	public String getLnCollSvcSty() {
		return this.lnCollSvcSty;
	}

	public void setLnCollSvcSty(String lnCollSvcSty) {
		this.lnCollSvcSty = lnCollSvcSty;
	}

	public Double getLnSvcRto() {
		return this.lnSvcRto;
	}

	public void setLnSvcRto(Double lnSvcRto) {
		this.lnSvcRto = lnSvcRto;
	}

	public Double getLnTrto() {
		return this.lnTrto;
	}

	public void setLnTrto(Double lnTrto) {
		this.lnTrto = lnTrto;
	}

	public String getLnRctExtnDt() {
		return this.lnRctExtnDt;
	}

	public void setLnRctExtnDt(String lnRctExtnDt) {
		this.lnRctExtnDt = lnRctExtnDt;
	}

	public String getLnBusnTypChgDt() {
		return this.lnBusnTypChgDt;
	}

	public void setLnBusnTypChgDt(String lnBusnTypChgDt) {
		this.lnBusnTypChgDt = lnBusnTypChgDt;
	}

	public String getLnOldLnAcctTrni() {
		return this.lnOldLnAcctTrni;
	}

	public void setLnOldLnAcctTrni(String lnOldLnAcctTrni) {
		this.lnOldLnAcctTrni = lnOldLnAcctTrni;
	}

	public String getLnNwlnAcctNoTrno() {
		return this.lnNwlnAcctNoTrno;
	}

	public void setLnNwlnAcctNoTrno(String lnNwlnAcctNoTrno) {
		this.lnNwlnAcctNoTrno = lnNwlnAcctNoTrno;
	}

	public String getLnAutoDdutPrFlg() {
		return this.lnAutoDdutPrFlg;
	}

	public void setLnAutoDdutPrFlg(String lnAutoDdutPrFlg) {
		this.lnAutoDdutPrFlg = lnAutoDdutPrFlg;
	}

	public String getLnAutoDeduIntFlg() {
		return this.lnAutoDeduIntFlg;
	}

	public void setLnAutoDeduIntFlg(String lnAutoDeduIntFlg) {
		this.lnAutoDeduIntFlg = lnAutoDeduIntFlg;
	}

	public String getLnAutoDeduDepAcctNo0() {
		return this.lnAutoDeduDepAcctNo0;
	}

	public void setLnAutoDeduDepAcctNo0(String lnAutoDeduDepAcctNo0) {
		this.lnAutoDeduDepAcctNo0 = lnAutoDeduDepAcctNo0;
	}

	public String getLnAutoDeduDepAcctNo1() {
		return this.lnAutoDeduDepAcctNo1;
	}

	public void setLnAutoDeduDepAcctNo1(String lnAutoDeduDepAcctNo1) {
		this.lnAutoDeduDepAcctNo1 = lnAutoDeduDepAcctNo1;
	}

	public String getLnAutoDeduDepAcctNo2() {
		return this.lnAutoDeduDepAcctNo2;
	}

	public void setLnAutoDeduDepAcctNo2(String lnAutoDeduDepAcctNo2) {
		this.lnAutoDeduDepAcctNo2 = lnAutoDeduDepAcctNo2;
	}

	public String getLnAutoDeduAcctTyp0() {
		return this.lnAutoDeduAcctTyp0;
	}

	public void setLnAutoDeduAcctTyp0(String lnAutoDeduAcctTyp0) {
		this.lnAutoDeduAcctTyp0 = lnAutoDeduAcctTyp0;
	}

	public String getLnAutoDeduAcctTyp1() {
		return this.lnAutoDeduAcctTyp1;
	}

	public void setLnAutoDeduAcctTyp1(String lnAutoDeduAcctTyp1) {
		this.lnAutoDeduAcctTyp1 = lnAutoDeduAcctTyp1;
	}

	public String getLnAutoDeduAcctTyp2() {
		return this.lnAutoDeduAcctTyp2;
	}

	public void setLnAutoDeduAcctTyp2(String lnAutoDeduAcctTyp2) {
		this.lnAutoDeduAcctTyp2 = lnAutoDeduAcctTyp2;
	}

	public String getLnIntDisEndDtN() {
		return this.lnIntDisEndDtN;
	}

	public void setLnIntDisEndDtN(String lnIntDisEndDtN) {
		this.lnIntDisEndDtN = lnIntDisEndDtN;
	}

	public String getLnLastIntcUpDt() {
		return this.lnLastIntcUpDt;
	}

	public void setLnLastIntcUpDt(String lnLastIntcUpDt) {
		this.lnLastIntcUpDt = lnLastIntcUpDt;
	}

	public Double getLnCrntOvdlnIntInt() {
		return this.lnCrntOvdlnIntInt;
	}

	public void setLnCrntOvdlnIntInt(Double lnCrntOvdlnIntInt) {
		this.lnCrntOvdlnIntInt = lnCrntOvdlnIntInt;
	}

	public Double getLnDeratePenaltyTotl() {
		return this.lnDeratePenaltyTotl;
	}

	public void setLnDeratePenaltyTotl(Double lnDeratePenaltyTotl) {
		this.lnDeratePenaltyTotl = lnDeratePenaltyTotl;
	}

	public Double getLnDerateArramtTotl() {
		return this.lnDerateArramtTotl;
	}

	public void setLnDerateArramtTotl(Double lnDerateArramtTotl) {
		this.lnDerateArramtTotl = lnDerateArramtTotl;
	}

	public String getLnIntStrvDtN() {
		return this.lnIntStrvDtN;
	}

	public void setLnIntStrvDtN(String lnIntStrvDtN) {
		this.lnIntStrvDtN = lnIntStrvDtN;
	}

	public String getLnPrIntsFlag() {
		return this.lnPrIntsFlag;
	}

	public void setLnPrIntsFlag(String lnPrIntsFlag) {
		this.lnPrIntsFlag = lnPrIntsFlag;
	}

	public String getLnIntIntsFlag() {
		return this.lnIntIntsFlag;
	}

	public void setLnIntIntsFlag(String lnIntIntsFlag) {
		this.lnIntIntsFlag = lnIntIntsFlag;
	}

	public String getLnBadLnFlg() {
		return this.lnBadLnFlg;
	}

	public void setLnBadLnFlg(String lnBadLnFlg) {
		this.lnBadLnFlg = lnBadLnFlg;
	}

	public String getLnApclFlg() {
		return this.lnApclFlg;
	}

	public void setLnApclFlg(String lnApclFlg) {
		this.lnApclFlg = lnApclFlg;
	}

	public String getLnFundToAuorFlg() {
		return this.lnFundToAuorFlg;
	}

	public void setLnFundToAuorFlg(String lnFundToAuorFlg) {
		this.lnFundToAuorFlg = lnFundToAuorFlg;
	}

	public String getLnIntRcptMail() {
		return this.lnIntRcptMail;
	}

	public void setLnIntRcptMail(String lnIntRcptMail) {
		this.lnIntRcptMail = lnIntRcptMail;
	}

	public String getLnDlayAdv() {
		return this.lnDlayAdv;
	}

	public void setLnDlayAdv(String lnDlayAdv) {
		this.lnDlayAdv = lnDlayAdv;
	}

	public String getLnInstalRfnPlan() {
		return this.lnInstalRfnPlan;
	}

	public void setLnInstalRfnPlan(String lnInstalRfnPlan) {
		this.lnInstalRfnPlan = lnInstalRfnPlan;
	}

	public Long getLnLnPrd() {
		return this.lnLnPrd;
	}

	public void setLnLnPrd(Long lnLnPrd) {
		this.lnLnPrd = lnLnPrd;
	}

	public String getLnRopRoiExcsFlag() {
		return this.lnRopRoiExcsFlag;
	}

	public void setLnRopRoiExcsFlag(String lnRopRoiExcsFlag) {
		this.lnRopRoiExcsFlag = lnRopRoiExcsFlag;
	}

	public String getLnCloseFlg() {
		return this.lnCloseFlg;
	}

	public void setLnCloseFlg(String lnCloseFlg) {
		this.lnCloseFlg = lnCloseFlg;
	}

	public Double getLnArrPr() {
		return this.lnArrPr;
	}

	public void setLnArrPr(Double lnArrPr) {
		this.lnArrPr = lnArrPr;
	}

	public String getLnManTovdFlg() {
		return this.lnManTovdFlg;
	}

	public void setLnManTovdFlg(String lnManTovdFlg) {
		this.lnManTovdFlg = lnManTovdFlg;
	}

	public Long getLnTnrno() {
		return this.lnTnrno;
	}

	public void setLnTnrno(Long lnTnrno) {
		this.lnTnrno = lnTnrno;
	}

	public String getLnChgRfnStyDt() {
		return this.lnChgRfnStyDt;
	}

	public void setLnChgRfnStyDt(String lnChgRfnStyDt) {
		this.lnChgRfnStyDt = lnChgRfnStyDt;
	}

	public String getLnChgRfnSty() {
		return this.lnChgRfnSty;
	}

	public void setLnChgRfnSty(String lnChgRfnSty) {
		this.lnChgRfnSty = lnChgRfnSty;
	}

	public String getLnPaySeqFlg() {
		return this.lnPaySeqFlg;
	}

	public void setLnPaySeqFlg(String lnPaySeqFlg) {
		this.lnPaySeqFlg = lnPaySeqFlg;
	}

	public String getLnDlyAutoPayFlg() {
		return this.lnDlyAutoPayFlg;
	}

	public void setLnDlyAutoPayFlg(String lnDlyAutoPayFlg) {
		this.lnDlyAutoPayFlg = lnDlyAutoPayFlg;
	}

	public String getLnDuranIntFlg() {
		return this.lnDuranIntFlg;
	}

	public void setLnDuranIntFlg(String lnDuranIntFlg) {
		this.lnDuranIntFlg = lnDuranIntFlg;
	}

	public Long getLnIntDisRateN() {
		return this.lnIntDisRateN;
	}

	public void setLnIntDisRateN(Long lnIntDisRateN) {
		this.lnIntDisRateN = lnIntDisRateN;
	}

	public String getLnGuarAccpExptNo() {
		return this.lnGuarAccpExptNo;
	}

	public void setLnGuarAccpExptNo(String lnGuarAccpExptNo) {
		this.lnGuarAccpExptNo = lnGuarAccpExptNo;
	}

	public String getLnRcptNo() {
		return this.lnRcptNo;
	}

	public void setLnRcptNo(String lnRcptNo) {
		this.lnRcptNo = lnRcptNo;
	}

	public String getLnRwhldNo() {
		return this.lnRwhldNo;
	}

	public void setLnRwhldNo(String lnRwhldNo) {
		this.lnRwhldNo = lnRwhldNo;
	}

	public String getLnSynlnFlg() {
		return this.lnSynlnFlg;
	}

	public void setLnSynlnFlg(String lnSynlnFlg) {
		this.lnSynlnFlg = lnSynlnFlg;
	}

	public String getLnClsdDt() {
		return this.lnClsdDt;
	}

	public void setLnClsdDt(String lnClsdDt) {
		this.lnClsdDt = lnClsdDt;
	}

	public String getLnAuorDepAcctNo() {
		return this.lnAuorDepAcctNo;
	}

	public void setLnAuorDepAcctNo(String lnAuorDepAcctNo) {
		this.lnAuorDepAcctNo = lnAuorDepAcctNo;
	}

	public String getLnRmrk() {
		return this.lnRmrk;
	}

	public void setLnRmrk(String lnRmrk) {
		this.lnRmrk = lnRmrk;
	}

	public String getLnDlayRskRtng() {
		return this.lnDlayRskRtng;
	}

	public void setLnDlayRskRtng(String lnDlayRskRtng) {
		this.lnDlayRskRtng = lnDlayRskRtng;
	}

	public String getLnDlayLnRsn() {
		return this.lnDlayLnRsn;
	}

	public void setLnDlayLnRsn(String lnDlayLnRsn) {
		this.lnDlayLnRsn = lnDlayLnRsn;
	}

	public String getLnDlayLnDt() {
		return this.lnDlayLnDt;
	}

	public void setLnDlayLnDt(String lnDlayLnDt) {
		this.lnDlayLnDt = lnDlayLnDt;
	}

	public String getLnFovdlnSqDt() {
		return this.lnFovdlnSqDt;
	}

	public void setLnFovdlnSqDt(String lnFovdlnSqDt) {
		this.lnFovdlnSqDt = lnFovdlnSqDt;
	}

	public String getLnDlayLnFrnDt() {
		return this.lnDlayLnFrnDt;
	}

	public void setLnDlayLnFrnDt(String lnDlayLnFrnDt) {
		this.lnDlayLnFrnDt = lnDlayLnFrnDt;
	}

	public String getLnDlayLnFrnRsn() {
		return this.lnDlayLnFrnRsn;
	}

	public void setLnDlayLnFrnRsn(String lnDlayLnFrnRsn) {
		this.lnDlayLnFrnRsn = lnDlayLnFrnRsn;
	}

	public Double getLnDlayLnFrnAmt() {
		return this.lnDlayLnFrnAmt;
	}

	public void setLnDlayLnFrnAmt(Double lnDlayLnFrnAmt) {
		this.lnDlayLnFrnAmt = lnDlayLnFrnAmt;
	}

	public Double getLnTovdlnPrBal() {
		return this.lnTovdlnPrBal;
	}

	public void setLnTovdlnPrBal(Double lnTovdlnPrBal) {
		this.lnTovdlnPrBal = lnTovdlnPrBal;
	}

	public Double getLnTovdlnIntBal() {
		return this.lnTovdlnIntBal;
	}

	public void setLnTovdlnIntBal(Double lnTovdlnIntBal) {
		this.lnTovdlnIntBal = lnTovdlnIntBal;
	}

	public Double getLnTovdlnAdvpmtBal() {
		return this.lnTovdlnAdvpmtBal;
	}

	public void setLnTovdlnAdvpmtBal(Double lnTovdlnAdvpmtBal) {
		this.lnTovdlnAdvpmtBal = lnTovdlnAdvpmtBal;
	}

	public String getLnIntIntcUpDtN() {
		return this.lnIntIntcUpDtN;
	}

	public void setLnIntIntcUpDtN(String lnIntIntcUpDtN) {
		this.lnIntIntcUpDtN = lnIntIntcUpDtN;
	}

	public Double getLnTbdbtPrBal() {
		return this.lnTbdbtPrBal;
	}

	public void setLnTbdbtPrBal(Double lnTbdbtPrBal) {
		this.lnTbdbtPrBal = lnTbdbtPrBal;
	}

	public Double getLnTbdbtIntBal() {
		return this.lnTbdbtIntBal;
	}

	public void setLnTbdbtIntBal(Double lnTbdbtIntBal) {
		this.lnTbdbtIntBal = lnTbdbtIntBal;
	}

	public Double getLnTbdbtAdvpmtBal() {
		return this.lnTbdbtAdvpmtBal;
	}

	public void setLnTbdbtAdvpmtBal(Double lnTbdbtAdvpmtBal) {
		this.lnTbdbtAdvpmtBal = lnTbdbtAdvpmtBal;
	}

	public String getLnBddbIntRcvdDt() {
		return this.lnBddbIntRcvdDt;
	}

	public void setLnBddbIntRcvdDt(String lnBddbIntRcvdDt) {
		this.lnBddbIntRcvdDt = lnBddbIntRcvdDt;
	}

	public String getLnCrntDayFstTxSqNo() {
		return this.lnCrntDayFstTxSqNo;
	}

	public void setLnCrntDayFstTxSqNo(String lnCrntDayFstTxSqNo) {
		this.lnCrntDayFstTxSqNo = lnCrntDayFstTxSqNo;
	}

	public String getLnCrntDayLstTxSqNo() {
		return this.lnCrntDayLstTxSqNo;
	}

	public void setLnCrntDayLstTxSqNo(String lnCrntDayLstTxSqNo) {
		this.lnCrntDayLstTxSqNo = lnCrntDayLstTxSqNo;
	}

	public String getLnFlstTlrNo() {
		return this.lnFlstTlrNo;
	}

	public void setLnFlstTlrNo(String lnFlstTlrNo) {
		this.lnFlstTlrNo = lnFlstTlrNo;
	}

	public String getLnFlstArpvPicNo() {
		return this.lnFlstArpvPicNo;
	}

	public void setLnFlstArpvPicNo(String lnFlstArpvPicNo) {
		this.lnFlstArpvPicNo = lnFlstArpvPicNo;
	}

	public String getLnFlstDt() {
		return this.lnFlstDt;
	}

	public void setLnFlstDt(String lnFlstDt) {
		this.lnFlstDt = lnFlstDt;
	}

	public String getLnLtstMntnOprNo() {
		return this.lnLtstMntnOprNo;
	}

	public void setLnLtstMntnOprNo(String lnLtstMntnOprNo) {
		this.lnLtstMntnOprNo = lnLtstMntnOprNo;
	}

	public String getLnLtstAprvPicNo() {
		return this.lnLtstAprvPicNo;
	}

	public void setLnLtstAprvPicNo(String lnLtstAprvPicNo) {
		this.lnLtstAprvPicNo = lnLtstAprvPicNo;
	}

	public String getLnLtstMntnDt() {
		return this.lnLtstMntnDt;
	}

	public void setLnLtstMntnDt(String lnLtstMntnDt) {
		this.lnLtstMntnDt = lnLtstMntnDt;
	}

	public String getLnBusnTyp() {
		return this.lnBusnTyp;
	}

	public void setLnBusnTyp(String lnBusnTyp) {
		this.lnBusnTyp = lnBusnTyp;
	}

	public String getLnAautoRop() {
		return this.lnAautoRop;
	}

	public void setLnAautoRop(String lnAautoRop) {
		this.lnAautoRop = lnAautoRop;
	}

	public String getLnAautoPint() {
		return this.lnAautoPint;
	}

	public void setLnAautoPint(String lnAautoPint) {
		this.lnAautoPint = lnAautoPint;
	}

	public String getLnAalfdSucs() {
		return this.lnAalfdSucs;
	}

	public void setLnAalfdSucs(String lnAalfdSucs) {
		this.lnAalfdSucs = lnAalfdSucs;
	}

	public Double getLnTovdlnInt() {
		return this.lnTovdlnInt;
	}

	public void setLnTovdlnInt(Double lnTovdlnInt) {
		this.lnTovdlnInt = lnTovdlnInt;
	}

	public String getLnFsAcct() {
		return this.lnFsAcct;
	}

	public void setLnFsAcct(String lnFsAcct) {
		this.lnFsAcct = lnFsAcct;
	}

	public String getLnGuarMarginAcctNo() {
		return this.lnGuarMarginAcctNo;
	}

	public void setLnGuarMarginAcctNo(String lnGuarMarginAcctNo) {
		this.lnGuarMarginAcctNo = lnGuarMarginAcctNo;
	}

	public String getLnPmnIntcCod() {
		return this.lnPmnIntcCod;
	}

	public void setLnPmnIntcCod(String lnPmnIntcCod) {
		this.lnPmnIntcCod = lnPmnIntcCod;
	}

	public String getLnIntcCodTrnFee() {
		return this.lnIntcCodTrnFee;
	}

	public void setLnIntcCodTrnFee(String lnIntcCodTrnFee) {
		this.lnIntcCodTrnFee = lnIntcCodTrnFee;
	}

	public String getLnAcctTyp() {
		return this.lnAcctTyp;
	}

	public void setLnAcctTyp(String lnAcctTyp) {
		this.lnAcctTyp = lnAcctTyp;
	}

	public String getLnFundAcctNo() {
		return this.lnFundAcctNo;
	}

	public void setLnFundAcctNo(String lnFundAcctNo) {
		this.lnFundAcctNo = lnFundAcctNo;
	}

	public String getLnFstmRfnDt() {
		return this.lnFstmRfnDt;
	}

	public void setLnFstmRfnDt(String lnFstmRfnDt) {
		this.lnFstmRfnDt = lnFstmRfnDt;
	}

	public String getLnFstmIntpDt() {
		return this.lnFstmIntpDt;
	}

	public void setLnFstmIntpDt(String lnFstmIntpDt) {
		this.lnFstmIntpDt = lnFstmIntpDt;
	}

	public String getLnRopDuranCutdt() {
		return this.lnRopDuranCutdt;
	}

	public void setLnRopDuranCutdt(String lnRopDuranCutdt) {
		this.lnRopDuranCutdt = lnRopDuranCutdt;
	}

	public String getLnDepAcctNo() {
		return this.lnDepAcctNo;
	}

	public void setLnDepAcctNo(String lnDepAcctNo) {
		this.lnDepAcctNo = lnDepAcctNo;
	}

	public String getLnHypoSqNo() {
		return this.lnHypoSqNo;
	}

	public void setLnHypoSqNo(String lnHypoSqNo) {
		this.lnHypoSqNo = lnHypoSqNo;
	}

	public Long getLnPrToleDays() {
		return this.lnPrToleDays;
	}

	public void setLnPrToleDays(Long lnPrToleDays) {
		this.lnPrToleDays = lnPrToleDays;
	}

	public Long getLnIntDuranDays() {
		return this.lnIntDuranDays;
	}

	public void setLnIntDuranDays(Long lnIntDuranDays) {
		this.lnIntDuranDays = lnIntDuranDays;
	}

	public String getLnIntrNegoSymb() {
		return this.lnIntrNegoSymb;
	}

	public void setLnIntrNegoSymb(String lnIntrNegoSymb) {
		this.lnIntrNegoSymb = lnIntrNegoSymb;
	}

	public String getLnDlayIntrPlmnSymb() {
		return this.lnDlayIntrPlmnSymb;
	}

	public void setLnDlayIntrPlmnSymb(String lnDlayIntrPlmnSymb) {
		this.lnDlayIntrPlmnSymb = lnDlayIntrPlmnSymb;
	}

	public String getLnCustdRcptRefNo() {
		return this.lnCustdRcptRefNo;
	}

	public void setLnCustdRcptRefNo(String lnCustdRcptRefNo) {
		this.lnCustdRcptRefNo = lnCustdRcptRefNo;
	}

	public String getLnClsdIntcTyp() {
		return this.lnClsdIntcTyp;
	}

	public void setLnClsdIntcTyp(String lnClsdIntcTyp) {
		this.lnClsdIntcTyp = lnClsdIntcTyp;
	}

	public String getLnDtlPrtFlag() {
		return this.lnDtlPrtFlag;
	}

	public void setLnDtlPrtFlag(String lnDtlPrtFlag) {
		this.lnDtlPrtFlag = lnDtlPrtFlag;
	}

	public Long getLnDtlPrtPg() {
		return this.lnDtlPrtPg;
	}

	public void setLnDtlPrtPg(Long lnDtlPrtPg) {
		this.lnDtlPrtPg = lnDtlPrtPg;
	}

	public String getLnDtlPrtKey() {
		return this.lnDtlPrtKey;
	}

	public void setLnDtlPrtKey(String lnDtlPrtKey) {
		this.lnDtlPrtKey = lnDtlPrtKey;
	}

	public String getLnLnFundRsur() {
		return this.lnLnFundRsur;
	}

	public void setLnLnFundRsur(String lnLnFundRsur) {
		this.lnLnFundRsur = lnLnFundRsur;
	}

	public String getLnLnPurp() {
		return this.lnLnPurp;
	}

	public void setLnLnPurp(String lnLnPurp) {
		this.lnLnPurp = lnLnPurp;
	}

	public Long getLnExtnTm() {
		return this.lnExtnTm;
	}

	public void setLnExtnTm(Long lnExtnTm) {
		this.lnExtnTm = lnExtnTm;
	}

	public String getLnExtnCtrtNo() {
		return this.lnExtnCtrtNo;
	}

	public void setLnExtnCtrtNo(String lnExtnCtrtNo) {
		this.lnExtnCtrtNo = lnExtnCtrtNo;
	}

	public String getLnBusnTypNew() {
		return this.lnBusnTypNew;
	}

	public void setLnBusnTypNew(String lnBusnTypNew) {
		this.lnBusnTypNew = lnBusnTypNew;
	}

	public String getLnBusnTypOrg() {
		return this.lnBusnTypOrg;
	}

	public void setLnBusnTypOrg(String lnBusnTypOrg) {
		this.lnBusnTypOrg = lnBusnTypOrg;
	}

	public Double getLnPenaltySttdAmt() {
		return this.lnPenaltySttdAmt;
	}

	public void setLnPenaltySttdAmt(Double lnPenaltySttdAmt) {
		this.lnPenaltySttdAmt = lnPenaltySttdAmt;
	}

	public String getLnPenaltyNegoSymb() {
		return this.lnPenaltyNegoSymb;
	}

	public void setLnPenaltyNegoSymb(String lnPenaltyNegoSymb) {
		this.lnPenaltyNegoSymb = lnPenaltyNegoSymb;
	}

	public Double getLnPenaltyNegoCod() {
		return this.lnPenaltyNegoCod;
	}

	public void setLnPenaltyNegoCod(Double lnPenaltyNegoCod) {
		this.lnPenaltyNegoCod = lnPenaltyNegoCod;
	}

	public String getLnCustTyp() {
		return this.lnCustTyp;
	}

	public void setLnCustTyp(String lnCustTyp) {
		this.lnCustTyp = lnCustTyp;
	}

	public String getLnIntrTyp() {
		return this.lnIntrTyp;
	}

	public void setLnIntrTyp(String lnIntrTyp) {
		this.lnIntrTyp = lnIntrTyp;
	}

	public Long getLnIncrDecrInterPrd() {
		return this.lnIncrDecrInterPrd;
	}

	public void setLnIncrDecrInterPrd(Long lnIncrDecrInterPrd) {
		this.lnIncrDecrInterPrd = lnIncrDecrInterPrd;
	}

	public Double getLnIncrDecrAmt() {
		return this.lnIncrDecrAmt;
	}

	public void setLnIncrDecrAmt(Double lnIncrDecrAmt) {
		this.lnIncrDecrAmt = lnIncrDecrAmt;
	}

	public Double getLnEqpropIncrDecr() {
		return this.lnEqpropIncrDecr;
	}

	public void setLnEqpropIncrDecr(Double lnEqpropIncrDecr) {
		this.lnEqpropIncrDecr = lnEqpropIncrDecr;
	}

	public String getLnSignlLnInturnTable() {
		return this.lnSignlLnInturnTable;
	}

	public void setLnSignlLnInturnTable(String lnSignlLnInturnTable) {
		this.lnSignlLnInturnTable = lnSignlLnInturnTable;
	}

	public Double getLnDlayPrTotl() {
		return this.lnDlayPrTotl;
	}

	public void setLnDlayPrTotl(Double lnDlayPrTotl) {
		this.lnDlayPrTotl = lnDlayPrTotl;
	}

	public String getLnRopDay() {
		return this.lnRopDay;
	}

	public void setLnRopDay(String lnRopDay) {
		this.lnRopDay = lnRopDay;
	}

	public String getLnLtstPrMvDt() {
		return this.lnLtstPrMvDt;
	}

	public void setLnLtstPrMvDt(String lnLtstPrMvDt) {
		this.lnLtstPrMvDt = lnLtstPrMvDt;
	}

	public Double getLnFrstDelayIntr() {
		return this.lnFrstDelayIntr;
	}

	public void setLnFrstDelayIntr(Double lnFrstDelayIntr) {
		this.lnFrstDelayIntr = lnFrstDelayIntr;
	}

	public String getLnLnToDepFlg() {
		return this.lnLnToDepFlg;
	}

	public void setLnLnToDepFlg(String lnLnToDepFlg) {
		this.lnLnToDepFlg = lnLnToDepFlg;
	}

	public String getLnLtstPrMvTm() {
		return this.lnLtstPrMvTm;
	}

	public void setLnLtstPrMvTm(String lnLtstPrMvTm) {
		this.lnLtstPrMvTm = lnLtstPrMvTm;
	}

	public String getLnLtstRiskTypDt() {
		return this.lnLtstRiskTypDt;
	}

	public void setLnLtstRiskTypDt(String lnLtstRiskTypDt) {
		this.lnLtstRiskTypDt = lnLtstRiskTypDt;
	}

	public String getLnCurrIden() {
		return this.lnCurrIden;
	}

	public void setLnCurrIden(String lnCurrIden) {
		this.lnCurrIden = lnCurrIden;
	}

	public Double getLnLsacIntPrAmt() {
		return this.lnLsacIntPrAmt;
	}

	public void setLnLsacIntPrAmt(Double lnLsacIntPrAmt) {
		this.lnLsacIntPrAmt = lnLsacIntPrAmt;
	}

	public Double getLnLsacInt() {
		return this.lnLsacInt;
	}

	public void setLnLsacInt(Double lnLsacInt) {
		this.lnLsacInt = lnLsacInt;
	}

	public Double getLnIntrblInt() {
		return this.lnIntrblInt;
	}

	public void setLnIntrblInt(Double lnIntrblInt) {
		this.lnIntrblInt = lnIntrblInt;
	}

	public String getLnTrnlstOvdDt() {
		return this.lnTrnlstOvdDt;
	}

	public void setLnTrnlstOvdDt(String lnTrnlstOvdDt) {
		this.lnTrnlstOvdDt = lnTrnlstOvdDt;
	}

	public Double getLnOvdlnIntrbl() {
		return this.lnOvdlnIntrbl;
	}

	public void setLnOvdlnIntrbl(Double lnOvdlnIntrbl) {
		this.lnOvdlnIntrbl = lnOvdlnIntrbl;
	}

	public Double getLnOvdlnIntrblApclTotl() {
		return this.lnOvdlnIntrblApclTotl;
	}

	public void setLnOvdlnIntrblApclTotl(Double lnOvdlnIntrblApclTotl) {
		this.lnOvdlnIntrblApclTotl = lnOvdlnIntrblApclTotl;
	}

	public Double getLnOvdlnIntApclTotl() {
		return this.lnOvdlnIntApclTotl;
	}

	public void setLnOvdlnIntApclTotl(Double lnOvdlnIntApclTotl) {
		this.lnOvdlnIntApclTotl = lnOvdlnIntApclTotl;
	}

	public Double getLnLsacIntApclTotl() {
		return this.lnLsacIntApclTotl;
	}

	public void setLnLsacIntApclTotl(Double lnLsacIntApclTotl) {
		this.lnLsacIntApclTotl = lnLsacIntApclTotl;
	}

	public Double getLnPrApclTotl() {
		return this.lnPrApclTotl;
	}

	public void setLnPrApclTotl(Double lnPrApclTotl) {
		this.lnPrApclTotl = lnPrApclTotl;
	}

	public Double getLnDlayIntInt() {
		return this.lnDlayIntInt;
	}

	public void setLnDlayIntInt(Double lnDlayIntInt) {
		this.lnDlayIntInt = lnDlayIntInt;
	}

	public Double getLnArrAmt() {
		return this.lnArrAmt;
	}

	public void setLnArrAmt(Double lnArrAmt) {
		this.lnArrAmt = lnArrAmt;
	}

	public Double getLnNextPrdArfnAmt() {
		return this.lnNextPrdArfnAmt;
	}

	public void setLnNextPrdArfnAmt(Double lnNextPrdArfnAmt) {
		this.lnNextPrdArfnAmt = lnNextPrdArfnAmt;
	}

	public Double getLnApclPenalty() {
		return this.lnApclPenalty;
	}

	public void setLnApclPenalty(Double lnApclPenalty) {
		this.lnApclPenalty = lnApclPenalty;
	}

	public Double getLnAccumColi() {
		return this.lnAccumColi;
	}

	public void setLnAccumColi(Double lnAccumColi) {
		this.lnAccumColi = lnAccumColi;
	}

	public Double getLnAccumRecvPnl() {
		return this.lnAccumRecvPnl;
	}

	public void setLnAccumRecvPnl(Double lnAccumRecvPnl) {
		this.lnAccumRecvPnl = lnAccumRecvPnl;
	}

	public Double getLnAccumRecvSvc() {
		return this.lnAccumRecvSvc;
	}

	public void setLnAccumRecvSvc(Double lnAccumRecvSvc) {
		this.lnAccumRecvSvc = lnAccumRecvSvc;
	}

	public Double getLnAdvpmtApclTotl() {
		return this.lnAdvpmtApclTotl;
	}

	public void setLnAdvpmtApclTotl(Double lnAdvpmtApclTotl) {
		this.lnAdvpmtApclTotl = lnAdvpmtApclTotl;
	}

	public Double getLnCrntPrdPayrblInt() {
		return this.lnCrntPrdPayrblInt;
	}

	public void setLnCrntPrdPayrblInt(Double lnCrntPrdPayrblInt) {
		this.lnCrntPrdPayrblInt = lnCrntPrdPayrblInt;
	}

	public Double getLnPenalty() {
		return this.lnPenalty;
	}

	public void setLnPenalty(Double lnPenalty) {
		this.lnPenalty = lnPenalty;
	}

	public String getLnPenlStrtDtN() {
		return this.lnPenlStrtDtN;
	}

	public void setLnPenlStrtDtN(String lnPenlStrtDtN) {
		this.lnPenlStrtDtN = lnPenlStrtDtN;
	}

	public String getLnHaltStrtDtN() {
		return this.lnHaltStrtDtN;
	}

	public void setLnHaltStrtDtN(String lnHaltStrtDtN) {
		this.lnHaltStrtDtN = lnHaltStrtDtN;
	}

	public String getLnHaltCutDtN() {
		return this.lnHaltCutDtN;
	}

	public void setLnHaltCutDtN(String lnHaltCutDtN) {
		this.lnHaltCutDtN = lnHaltCutDtN;
	}

	public Double getLnSvcBal() {
		return this.lnSvcBal;
	}

	public void setLnSvcBal(Double lnSvcBal) {
		this.lnSvcBal = lnSvcBal;
	}

	public Double getLnRcvIntTotl() {
		return this.lnRcvIntTotl;
	}

	public void setLnRcvIntTotl(Double lnRcvIntTotl) {
		this.lnRcvIntTotl = lnRcvIntTotl;
	}

	public Double getLnCrntOvdlnIntrbl() {
		return this.lnCrntOvdlnIntrbl;
	}

	public void setLnCrntOvdlnIntrbl(Double lnCrntOvdlnIntrbl) {
		this.lnCrntOvdlnIntrbl = lnCrntOvdlnIntrbl;
	}

	public Double getLnCrntOvdlnLnIntr() {
		return this.lnCrntOvdlnLnIntr;
	}

	public void setLnCrntOvdlnLnIntr(Double lnCrntOvdlnLnIntr) {
		this.lnCrntOvdlnLnIntr = lnCrntOvdlnLnIntr;
	}

	public String getLnHaltIntcSymb() {
		return this.lnHaltIntcSymb;
	}

	public void setLnHaltIntcSymb(String lnHaltIntcSymb) {
		this.lnHaltIntcSymb = lnHaltIntcSymb;
	}

	public String getLnSpv() {
		return this.lnSpv;
	}

	public void setLnSpv(String lnSpv) {
		this.lnSpv = lnSpv;
	}

	public Double getLnCrntPrdPayrblPr() {
		return this.lnCrntPrdPayrblPr;
	}

	public void setLnCrntPrdPayrblPr(Double lnCrntPrdPayrblPr) {
		this.lnCrntPrdPayrblPr = lnCrntPrdPayrblPr;
	}

	public Double getLnNextPrdPayrblInt() {
		return this.lnNextPrdPayrblInt;
	}

	public void setLnNextPrdPayrblInt(Double lnNextPrdPayrblInt) {
		this.lnNextPrdPayrblInt = lnNextPrdPayrblInt;
	}

	public Double getLnNextPrdPayrblPr() {
		return this.lnNextPrdPayrblPr;
	}

	public void setLnNextPrdPayrblPr(Double lnNextPrdPayrblPr) {
		this.lnNextPrdPayrblPr = lnNextPrdPayrblPr;
	}

	public Double getLnYheadLnBal() {
		return this.lnYheadLnBal;
	}

	public void setLnYheadLnBal(Double lnYheadLnBal) {
		this.lnYheadLnBal = lnYheadLnBal;
	}

	public Double getLnCrntYrLnAccum() {
		return this.lnCrntYrLnAccum;
	}

	public void setLnCrntYrLnAccum(Double lnCrntYrLnAccum) {
		this.lnCrntYrLnAccum = lnCrntYrLnAccum;
	}

	public Double getLnCrntYrRevAccum() {
		return this.lnCrntYrRevAccum;
	}

	public void setLnCrntYrRevAccum(Double lnCrntYrRevAccum) {
		this.lnCrntYrRevAccum = lnCrntYrRevAccum;
	}

	public Double getLnCrntYrColledInt() {
		return this.lnCrntYrColledInt;
	}

	public void setLnCrntYrColledInt(Double lnCrntYrColledInt) {
		this.lnCrntYrColledInt = lnCrntYrColledInt;
	}

	public Double getLnCrntPrdRtnAmt() {
		return this.lnCrntPrdRtnAmt;
	}

	public void setLnCrntPrdRtnAmt(Double lnCrntPrdRtnAmt) {
		this.lnCrntPrdRtnAmt = lnCrntPrdRtnAmt;
	}

	public String getLnExceFlg() {
		return this.lnExceFlg;
	}

	public void setLnExceFlg(String lnExceFlg) {
		this.lnExceFlg = lnExceFlg;
	}

	public String getLnFsFlg() {
		return this.lnFsFlg;
	}

	public void setLnFsFlg(String lnFsFlg) {
		this.lnFsFlg = lnFsFlg;
	}

	public String getLnZhibiaoNo() {
		return this.lnZhibiaoNo;
	}

	public void setLnZhibiaoNo(String lnZhibiaoNo) {
		this.lnZhibiaoNo = lnZhibiaoNo;
	}

	public String getLnFrzDtN() {
		return this.lnFrzDtN;
	}

	public void setLnFrzDtN(String lnFrzDtN) {
		this.lnFrzDtN = lnFrzDtN;
	}

	public Long getLnTdPsbkNo() {
		return this.lnTdPsbkNo;
	}

	public void setLnTdPsbkNo(Long lnTdPsbkNo) {
		this.lnTdPsbkNo = lnTdPsbkNo;
	}

	public Long getLnTdPsbkSeqNo() {
		return this.lnTdPsbkSeqNo;
	}

	public void setLnTdPsbkSeqNo(Long lnTdPsbkSeqNo) {
		this.lnTdPsbkSeqNo = lnTdPsbkSeqNo;
	}

	public String getLnNacctSts() {
		return this.lnNacctSts;
	}

	public void setLnNacctSts(String lnNacctSts) {
		this.lnNacctSts = lnNacctSts;
	}

	public String getLnNorBackFlg() {
		return this.lnNorBackFlg;
	}

	public void setLnNorBackFlg(String lnNorBackFlg) {
		this.lnNorBackFlg = lnNorBackFlg;
	}

	public String getLnHuntDueDtN() {
		return this.lnHuntDueDtN;
	}

	public void setLnHuntDueDtN(String lnHuntDueDtN) {
		this.lnHuntDueDtN = lnHuntDueDtN;
	}

	public String getLnLocCityFlg() {
		return this.lnLocCityFlg;
	}

	public void setLnLocCityFlg(String lnLocCityFlg) {
		this.lnLocCityFlg = lnLocCityFlg;
	}

	public String getLnVipAcctFlg() {
		return this.lnVipAcctFlg;
	}

	public void setLnVipAcctFlg(String lnVipAcctFlg) {
		this.lnVipAcctFlg = lnVipAcctFlg;
	}

	public String getFiller() {
		return this.filler;
	}

	public void setFiller(String filler) {
		this.filler = filler;
	}

	public String getComAccountNo() {
		return this.comAccountNo;
	}

	public void setComAccountNo(String comAccountNo) {
		this.comAccountNo = comAccountNo;
	}

	public String getLoanNorLgNo() {
		return this.loanNorLgNo;
	}

	public void setLoanNorLgNo(String loanNorLgNo) {
		this.loanNorLgNo = loanNorLgNo;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}