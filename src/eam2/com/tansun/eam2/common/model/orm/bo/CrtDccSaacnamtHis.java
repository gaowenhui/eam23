package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccSaacnamtHis entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccSaacnamtHis extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccSaacnamtHisId id;
	private Long saamtLl;
	private String saamtDbTimestamp;
	private Double saRsvCrlmt;
	private Double saFrzAmt;
	private Long saRtnOvIntD1;
	private String saComOdFlg;
	private Long saOdIntDaysN;
	private String saAclg;
	private String saComFlg;
	private Double saSignPdt;
	private Double saDdpPdt;
	private String saDdpAcctSts;
	private Double saDdpOdMax;
	private Double saOdIntAmt;
	private Double saIntcAmt;
	private Double saClnAmt;
	private Double saAvlBal;
	private Double saInt;
	private String saIntAcctNo;
	private String saLtmPdtcDt;
	private String saLtmIntcDt;
	private String saLtmTxDt;
	private Double saActuPdt;
	private Double saAsExcAmt;
	private String saRcvPayRang;
	private Long saOdTm;
	private Double saOdPdt;
	private Double saOdAmt;
	private Long saOdDays;
	private Double saOdInt;
	private Double saTodayOdCshAmt;
	private Long saNgoDepFlTotl;
	private Double saAcctBal;
	private Double saAcctBalUlmt;
	private String saNgoIntAcctNo;
	private Double saPsbkAmt;
	private String saNgoAvalDt;
	private String saNgoCnclDt;
	private Double saOvdlnOdInt;
	private Long saCertNum;
	private Double saTrtVal;
	private String saIntTaxRptFlg;
	private String saEndFlg;
	private Double saSvc;
	private String saOdLgFlg;
	private Double saOdCshAmt;
	private String saIntrCod;
	private Double saIntr;
	private String saFltrFvrSign;
	private Double saFltrFvr;
	private String saSleepDate;
	private String saSleepSts;
	private Double saClrFrzAmt;
	private Double saPstgExp;
	private String saLessIntrFlg;
	private String saMafeFlg;
	private Double saMafeOweAmt;
	private String saMafeYear;
	private String saLgNo;

	// Constructors

	/** default constructor */
	public CrtDccSaacnamtHis() {
	}

	/** minimal constructor */
	public CrtDccSaacnamtHis(CrtDccSaacnamtHisId id) {
		this.id = id;
	}

	/** full constructor */
	public CrtDccSaacnamtHis(CrtDccSaacnamtHisId id, Long saamtLl,
			String saamtDbTimestamp, Double saRsvCrlmt, Double saFrzAmt,
			Long saRtnOvIntD1, String saComOdFlg, Long saOdIntDaysN,
			String saAclg, String saComFlg, Double saSignPdt, Double saDdpPdt,
			String saDdpAcctSts, Double saDdpOdMax, Double saOdIntAmt,
			Double saIntcAmt, Double saClnAmt, Double saAvlBal, Double saInt,
			String saIntAcctNo, String saLtmPdtcDt, String saLtmIntcDt,
			String saLtmTxDt, Double saActuPdt, Double saAsExcAmt,
			String saRcvPayRang, Long saOdTm, Double saOdPdt, Double saOdAmt,
			Long saOdDays, Double saOdInt, Double saTodayOdCshAmt,
			Long saNgoDepFlTotl, Double saAcctBal, Double saAcctBalUlmt,
			String saNgoIntAcctNo, Double saPsbkAmt, String saNgoAvalDt,
			String saNgoCnclDt, Double saOvdlnOdInt, Long saCertNum,
			Double saTrtVal, String saIntTaxRptFlg, String saEndFlg,
			Double saSvc, String saOdLgFlg, Double saOdCshAmt,
			String saIntrCod, Double saIntr, String saFltrFvrSign,
			Double saFltrFvr, String saSleepDate, String saSleepSts,
			Double saClrFrzAmt, Double saPstgExp, String saLessIntrFlg,
			String saMafeFlg, Double saMafeOweAmt, String saMafeYear,
			String saLgNo) {
		this.id = id;
		this.saamtLl = saamtLl;
		this.saamtDbTimestamp = saamtDbTimestamp;
		this.saRsvCrlmt = saRsvCrlmt;
		this.saFrzAmt = saFrzAmt;
		this.saRtnOvIntD1 = saRtnOvIntD1;
		this.saComOdFlg = saComOdFlg;
		this.saOdIntDaysN = saOdIntDaysN;
		this.saAclg = saAclg;
		this.saComFlg = saComFlg;
		this.saSignPdt = saSignPdt;
		this.saDdpPdt = saDdpPdt;
		this.saDdpAcctSts = saDdpAcctSts;
		this.saDdpOdMax = saDdpOdMax;
		this.saOdIntAmt = saOdIntAmt;
		this.saIntcAmt = saIntcAmt;
		this.saClnAmt = saClnAmt;
		this.saAvlBal = saAvlBal;
		this.saInt = saInt;
		this.saIntAcctNo = saIntAcctNo;
		this.saLtmPdtcDt = saLtmPdtcDt;
		this.saLtmIntcDt = saLtmIntcDt;
		this.saLtmTxDt = saLtmTxDt;
		this.saActuPdt = saActuPdt;
		this.saAsExcAmt = saAsExcAmt;
		this.saRcvPayRang = saRcvPayRang;
		this.saOdTm = saOdTm;
		this.saOdPdt = saOdPdt;
		this.saOdAmt = saOdAmt;
		this.saOdDays = saOdDays;
		this.saOdInt = saOdInt;
		this.saTodayOdCshAmt = saTodayOdCshAmt;
		this.saNgoDepFlTotl = saNgoDepFlTotl;
		this.saAcctBal = saAcctBal;
		this.saAcctBalUlmt = saAcctBalUlmt;
		this.saNgoIntAcctNo = saNgoIntAcctNo;
		this.saPsbkAmt = saPsbkAmt;
		this.saNgoAvalDt = saNgoAvalDt;
		this.saNgoCnclDt = saNgoCnclDt;
		this.saOvdlnOdInt = saOvdlnOdInt;
		this.saCertNum = saCertNum;
		this.saTrtVal = saTrtVal;
		this.saIntTaxRptFlg = saIntTaxRptFlg;
		this.saEndFlg = saEndFlg;
		this.saSvc = saSvc;
		this.saOdLgFlg = saOdLgFlg;
		this.saOdCshAmt = saOdCshAmt;
		this.saIntrCod = saIntrCod;
		this.saIntr = saIntr;
		this.saFltrFvrSign = saFltrFvrSign;
		this.saFltrFvr = saFltrFvr;
		this.saSleepDate = saSleepDate;
		this.saSleepSts = saSleepSts;
		this.saClrFrzAmt = saClrFrzAmt;
		this.saPstgExp = saPstgExp;
		this.saLessIntrFlg = saLessIntrFlg;
		this.saMafeFlg = saMafeFlg;
		this.saMafeOweAmt = saMafeOweAmt;
		this.saMafeYear = saMafeYear;
		this.saLgNo = saLgNo;
	}

	// Property accessors

	public CrtDccSaacnamtHisId getId() {
		return this.id;
	}

	public void setId(CrtDccSaacnamtHisId id) {
		this.id = id;
	}

	public Long getSaamtLl() {
		return this.saamtLl;
	}

	public void setSaamtLl(Long saamtLl) {
		this.saamtLl = saamtLl;
	}

	public String getSaamtDbTimestamp() {
		return this.saamtDbTimestamp;
	}

	public void setSaamtDbTimestamp(String saamtDbTimestamp) {
		this.saamtDbTimestamp = saamtDbTimestamp;
	}

	public Double getSaRsvCrlmt() {
		return this.saRsvCrlmt;
	}

	public void setSaRsvCrlmt(Double saRsvCrlmt) {
		this.saRsvCrlmt = saRsvCrlmt;
	}

	public Double getSaFrzAmt() {
		return this.saFrzAmt;
	}

	public void setSaFrzAmt(Double saFrzAmt) {
		this.saFrzAmt = saFrzAmt;
	}

	public Long getSaRtnOvIntD1() {
		return this.saRtnOvIntD1;
	}

	public void setSaRtnOvIntD1(Long saRtnOvIntD1) {
		this.saRtnOvIntD1 = saRtnOvIntD1;
	}

	public String getSaComOdFlg() {
		return this.saComOdFlg;
	}

	public void setSaComOdFlg(String saComOdFlg) {
		this.saComOdFlg = saComOdFlg;
	}

	public Long getSaOdIntDaysN() {
		return this.saOdIntDaysN;
	}

	public void setSaOdIntDaysN(Long saOdIntDaysN) {
		this.saOdIntDaysN = saOdIntDaysN;
	}

	public String getSaAclg() {
		return this.saAclg;
	}

	public void setSaAclg(String saAclg) {
		this.saAclg = saAclg;
	}

	public String getSaComFlg() {
		return this.saComFlg;
	}

	public void setSaComFlg(String saComFlg) {
		this.saComFlg = saComFlg;
	}

	public Double getSaSignPdt() {
		return this.saSignPdt;
	}

	public void setSaSignPdt(Double saSignPdt) {
		this.saSignPdt = saSignPdt;
	}

	public Double getSaDdpPdt() {
		return this.saDdpPdt;
	}

	public void setSaDdpPdt(Double saDdpPdt) {
		this.saDdpPdt = saDdpPdt;
	}

	public String getSaDdpAcctSts() {
		return this.saDdpAcctSts;
	}

	public void setSaDdpAcctSts(String saDdpAcctSts) {
		this.saDdpAcctSts = saDdpAcctSts;
	}

	public Double getSaDdpOdMax() {
		return this.saDdpOdMax;
	}

	public void setSaDdpOdMax(Double saDdpOdMax) {
		this.saDdpOdMax = saDdpOdMax;
	}

	public Double getSaOdIntAmt() {
		return this.saOdIntAmt;
	}

	public void setSaOdIntAmt(Double saOdIntAmt) {
		this.saOdIntAmt = saOdIntAmt;
	}

	public Double getSaIntcAmt() {
		return this.saIntcAmt;
	}

	public void setSaIntcAmt(Double saIntcAmt) {
		this.saIntcAmt = saIntcAmt;
	}

	public Double getSaClnAmt() {
		return this.saClnAmt;
	}

	public void setSaClnAmt(Double saClnAmt) {
		this.saClnAmt = saClnAmt;
	}

	public Double getSaAvlBal() {
		return this.saAvlBal;
	}

	public void setSaAvlBal(Double saAvlBal) {
		this.saAvlBal = saAvlBal;
	}

	public Double getSaInt() {
		return this.saInt;
	}

	public void setSaInt(Double saInt) {
		this.saInt = saInt;
	}

	public String getSaIntAcctNo() {
		return this.saIntAcctNo;
	}

	public void setSaIntAcctNo(String saIntAcctNo) {
		this.saIntAcctNo = saIntAcctNo;
	}

	public String getSaLtmPdtcDt() {
		return this.saLtmPdtcDt;
	}

	public void setSaLtmPdtcDt(String saLtmPdtcDt) {
		this.saLtmPdtcDt = saLtmPdtcDt;
	}

	public String getSaLtmIntcDt() {
		return this.saLtmIntcDt;
	}

	public void setSaLtmIntcDt(String saLtmIntcDt) {
		this.saLtmIntcDt = saLtmIntcDt;
	}

	public String getSaLtmTxDt() {
		return this.saLtmTxDt;
	}

	public void setSaLtmTxDt(String saLtmTxDt) {
		this.saLtmTxDt = saLtmTxDt;
	}

	public Double getSaActuPdt() {
		return this.saActuPdt;
	}

	public void setSaActuPdt(Double saActuPdt) {
		this.saActuPdt = saActuPdt;
	}

	public Double getSaAsExcAmt() {
		return this.saAsExcAmt;
	}

	public void setSaAsExcAmt(Double saAsExcAmt) {
		this.saAsExcAmt = saAsExcAmt;
	}

	public String getSaRcvPayRang() {
		return this.saRcvPayRang;
	}

	public void setSaRcvPayRang(String saRcvPayRang) {
		this.saRcvPayRang = saRcvPayRang;
	}

	public Long getSaOdTm() {
		return this.saOdTm;
	}

	public void setSaOdTm(Long saOdTm) {
		this.saOdTm = saOdTm;
	}

	public Double getSaOdPdt() {
		return this.saOdPdt;
	}

	public void setSaOdPdt(Double saOdPdt) {
		this.saOdPdt = saOdPdt;
	}

	public Double getSaOdAmt() {
		return this.saOdAmt;
	}

	public void setSaOdAmt(Double saOdAmt) {
		this.saOdAmt = saOdAmt;
	}

	public Long getSaOdDays() {
		return this.saOdDays;
	}

	public void setSaOdDays(Long saOdDays) {
		this.saOdDays = saOdDays;
	}

	public Double getSaOdInt() {
		return this.saOdInt;
	}

	public void setSaOdInt(Double saOdInt) {
		this.saOdInt = saOdInt;
	}

	public Double getSaTodayOdCshAmt() {
		return this.saTodayOdCshAmt;
	}

	public void setSaTodayOdCshAmt(Double saTodayOdCshAmt) {
		this.saTodayOdCshAmt = saTodayOdCshAmt;
	}

	public Long getSaNgoDepFlTotl() {
		return this.saNgoDepFlTotl;
	}

	public void setSaNgoDepFlTotl(Long saNgoDepFlTotl) {
		this.saNgoDepFlTotl = saNgoDepFlTotl;
	}

	public Double getSaAcctBal() {
		return this.saAcctBal;
	}

	public void setSaAcctBal(Double saAcctBal) {
		this.saAcctBal = saAcctBal;
	}

	public Double getSaAcctBalUlmt() {
		return this.saAcctBalUlmt;
	}

	public void setSaAcctBalUlmt(Double saAcctBalUlmt) {
		this.saAcctBalUlmt = saAcctBalUlmt;
	}

	public String getSaNgoIntAcctNo() {
		return this.saNgoIntAcctNo;
	}

	public void setSaNgoIntAcctNo(String saNgoIntAcctNo) {
		this.saNgoIntAcctNo = saNgoIntAcctNo;
	}

	public Double getSaPsbkAmt() {
		return this.saPsbkAmt;
	}

	public void setSaPsbkAmt(Double saPsbkAmt) {
		this.saPsbkAmt = saPsbkAmt;
	}

	public String getSaNgoAvalDt() {
		return this.saNgoAvalDt;
	}

	public void setSaNgoAvalDt(String saNgoAvalDt) {
		this.saNgoAvalDt = saNgoAvalDt;
	}

	public String getSaNgoCnclDt() {
		return this.saNgoCnclDt;
	}

	public void setSaNgoCnclDt(String saNgoCnclDt) {
		this.saNgoCnclDt = saNgoCnclDt;
	}

	public Double getSaOvdlnOdInt() {
		return this.saOvdlnOdInt;
	}

	public void setSaOvdlnOdInt(Double saOvdlnOdInt) {
		this.saOvdlnOdInt = saOvdlnOdInt;
	}

	public Long getSaCertNum() {
		return this.saCertNum;
	}

	public void setSaCertNum(Long saCertNum) {
		this.saCertNum = saCertNum;
	}

	public Double getSaTrtVal() {
		return this.saTrtVal;
	}

	public void setSaTrtVal(Double saTrtVal) {
		this.saTrtVal = saTrtVal;
	}

	public String getSaIntTaxRptFlg() {
		return this.saIntTaxRptFlg;
	}

	public void setSaIntTaxRptFlg(String saIntTaxRptFlg) {
		this.saIntTaxRptFlg = saIntTaxRptFlg;
	}

	public String getSaEndFlg() {
		return this.saEndFlg;
	}

	public void setSaEndFlg(String saEndFlg) {
		this.saEndFlg = saEndFlg;
	}

	public Double getSaSvc() {
		return this.saSvc;
	}

	public void setSaSvc(Double saSvc) {
		this.saSvc = saSvc;
	}

	public String getSaOdLgFlg() {
		return this.saOdLgFlg;
	}

	public void setSaOdLgFlg(String saOdLgFlg) {
		this.saOdLgFlg = saOdLgFlg;
	}

	public Double getSaOdCshAmt() {
		return this.saOdCshAmt;
	}

	public void setSaOdCshAmt(Double saOdCshAmt) {
		this.saOdCshAmt = saOdCshAmt;
	}

	public String getSaIntrCod() {
		return this.saIntrCod;
	}

	public void setSaIntrCod(String saIntrCod) {
		this.saIntrCod = saIntrCod;
	}

	public Double getSaIntr() {
		return this.saIntr;
	}

	public void setSaIntr(Double saIntr) {
		this.saIntr = saIntr;
	}

	public String getSaFltrFvrSign() {
		return this.saFltrFvrSign;
	}

	public void setSaFltrFvrSign(String saFltrFvrSign) {
		this.saFltrFvrSign = saFltrFvrSign;
	}

	public Double getSaFltrFvr() {
		return this.saFltrFvr;
	}

	public void setSaFltrFvr(Double saFltrFvr) {
		this.saFltrFvr = saFltrFvr;
	}

	public String getSaSleepDate() {
		return this.saSleepDate;
	}

	public void setSaSleepDate(String saSleepDate) {
		this.saSleepDate = saSleepDate;
	}

	public String getSaSleepSts() {
		return this.saSleepSts;
	}

	public void setSaSleepSts(String saSleepSts) {
		this.saSleepSts = saSleepSts;
	}

	public Double getSaClrFrzAmt() {
		return this.saClrFrzAmt;
	}

	public void setSaClrFrzAmt(Double saClrFrzAmt) {
		this.saClrFrzAmt = saClrFrzAmt;
	}

	public Double getSaPstgExp() {
		return this.saPstgExp;
	}

	public void setSaPstgExp(Double saPstgExp) {
		this.saPstgExp = saPstgExp;
	}

	public String getSaLessIntrFlg() {
		return this.saLessIntrFlg;
	}

	public void setSaLessIntrFlg(String saLessIntrFlg) {
		this.saLessIntrFlg = saLessIntrFlg;
	}

	public String getSaMafeFlg() {
		return this.saMafeFlg;
	}

	public void setSaMafeFlg(String saMafeFlg) {
		this.saMafeFlg = saMafeFlg;
	}

	public Double getSaMafeOweAmt() {
		return this.saMafeOweAmt;
	}

	public void setSaMafeOweAmt(Double saMafeOweAmt) {
		this.saMafeOweAmt = saMafeOweAmt;
	}

	public String getSaMafeYear() {
		return this.saMafeYear;
	}

	public void setSaMafeYear(String saMafeYear) {
		this.saMafeYear = saMafeYear;
	}

	public String getSaLgNo() {
		return this.saLgNo;
	}

	public void setSaLgNo(String saLgNo) {
		this.saLgNo = saLgNo;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}