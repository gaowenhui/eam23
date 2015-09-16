package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccSaacnacnHis entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccSaacnacnHis extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccSaacnacnHisId id;
	private Long saacnLl;
	private String saacnDbTimestamp;
	private String saPsbkNo;
	private String saPsbkDlDt;
	private String saPsbkPrtNo;
	private String saPsbkSts;
	private String saMbstmtFlg;
	private String saOpacInstnNo;
	private Double saOpacAmt;
	private String saOpacDt;
	private String saOpacPermNo;
	private String saCustNo;
	private String saCustName;
	private String saConntrNo;
	private String saCrptPin;
	private String saPswdDlDt;
	private String saPswdSts;
	private Long saDetItemN;
	private String saCacctInstnNo;
	private String saCacctDt;
	private Long saPglnTotl;
	private Long saAentrDetTotl;
	private Long saAckacDetTotl;
	private String saSlcrdNo;
	private String saPrdsInstnDpdwFlg;
	private String saAcctTyp;
	private String saAcctChar;
	private String saDrwTyp;
	private String saAstmtAddrCod;
	private String saSealSts;
	private Long saAccPageNo;
	private Long saPrintedMaxNo;
	private Long saAccUnprintNo;
	private String saOpacTlNo;
	private String saCacctTlNo;
	private String saIntcFlg;
	private String saSealDlDt;
	private String saStlmSvcSty;
	private String saDepTyp;
	private Long saPagesumN;
	private String saCurrChar;
	private String saAvalDt;
	private String saXtSignFlg;
	private String saYhtSignFlg;
	private String saReverseArea;
	private String saQpswd;
	private String saVipAcctFlg;
	private String saRptAcctFlg;
	private String saCardNo;
	private String saIntTaxFlg;
	private String saAcctCtlSts;
	private String saFsSts;
	private Long saNextPageFlgN;
	private String saSignFlg;
	private String saCcrFlg;
	private String saLastTxnDt;
	private String saDpdwRang;
	private Long saRecogTypNumN;
	private String saOrgDepType;
	private String saTransInstnNo;
	private Long saNonFrzConsignTime;
	private String saDistCod;
	private String saPsbkPrtNo1;
	private String comAccountNo;
	private String subCod;

	// Constructors

	/** default constructor */
	public CrtDccSaacnacnHis() {
	}

	/** minimal constructor */
	public CrtDccSaacnacnHis(CrtDccSaacnacnHisId id) {
		this.id = id;
	}

	/** full constructor */
	public CrtDccSaacnacnHis(CrtDccSaacnacnHisId id, Long saacnLl,
			String saacnDbTimestamp, String saPsbkNo, String saPsbkDlDt,
			String saPsbkPrtNo, String saPsbkSts, String saMbstmtFlg,
			String saOpacInstnNo, Double saOpacAmt, String saOpacDt,
			String saOpacPermNo, String saCustNo, String saCustName,
			String saConntrNo, String saCrptPin, String saPswdDlDt,
			String saPswdSts, Long saDetItemN, String saCacctInstnNo,
			String saCacctDt, Long saPglnTotl, Long saAentrDetTotl,
			Long saAckacDetTotl, String saSlcrdNo, String saPrdsInstnDpdwFlg,
			String saAcctTyp, String saAcctChar, String saDrwTyp,
			String saAstmtAddrCod, String saSealSts, Long saAccPageNo,
			Long saPrintedMaxNo, Long saAccUnprintNo, String saOpacTlNo,
			String saCacctTlNo, String saIntcFlg, String saSealDlDt,
			String saStlmSvcSty, String saDepTyp, Long saPagesumN,
			String saCurrChar, String saAvalDt, String saXtSignFlg,
			String saYhtSignFlg, String saReverseArea, String saQpswd,
			String saVipAcctFlg, String saRptAcctFlg, String saCardNo,
			String saIntTaxFlg, String saAcctCtlSts, String saFsSts,
			Long saNextPageFlgN, String saSignFlg, String saCcrFlg,
			String saLastTxnDt, String saDpdwRang, Long saRecogTypNumN,
			String saOrgDepType, String saTransInstnNo,
			Long saNonFrzConsignTime, String saDistCod, String saPsbkPrtNo1,
			String comAccountNo, String subCod) {
		this.id = id;
		this.saacnLl = saacnLl;
		this.saacnDbTimestamp = saacnDbTimestamp;
		this.saPsbkNo = saPsbkNo;
		this.saPsbkDlDt = saPsbkDlDt;
		this.saPsbkPrtNo = saPsbkPrtNo;
		this.saPsbkSts = saPsbkSts;
		this.saMbstmtFlg = saMbstmtFlg;
		this.saOpacInstnNo = saOpacInstnNo;
		this.saOpacAmt = saOpacAmt;
		this.saOpacDt = saOpacDt;
		this.saOpacPermNo = saOpacPermNo;
		this.saCustNo = saCustNo;
		this.saCustName = saCustName;
		this.saConntrNo = saConntrNo;
		this.saCrptPin = saCrptPin;
		this.saPswdDlDt = saPswdDlDt;
		this.saPswdSts = saPswdSts;
		this.saDetItemN = saDetItemN;
		this.saCacctInstnNo = saCacctInstnNo;
		this.saCacctDt = saCacctDt;
		this.saPglnTotl = saPglnTotl;
		this.saAentrDetTotl = saAentrDetTotl;
		this.saAckacDetTotl = saAckacDetTotl;
		this.saSlcrdNo = saSlcrdNo;
		this.saPrdsInstnDpdwFlg = saPrdsInstnDpdwFlg;
		this.saAcctTyp = saAcctTyp;
		this.saAcctChar = saAcctChar;
		this.saDrwTyp = saDrwTyp;
		this.saAstmtAddrCod = saAstmtAddrCod;
		this.saSealSts = saSealSts;
		this.saAccPageNo = saAccPageNo;
		this.saPrintedMaxNo = saPrintedMaxNo;
		this.saAccUnprintNo = saAccUnprintNo;
		this.saOpacTlNo = saOpacTlNo;
		this.saCacctTlNo = saCacctTlNo;
		this.saIntcFlg = saIntcFlg;
		this.saSealDlDt = saSealDlDt;
		this.saStlmSvcSty = saStlmSvcSty;
		this.saDepTyp = saDepTyp;
		this.saPagesumN = saPagesumN;
		this.saCurrChar = saCurrChar;
		this.saAvalDt = saAvalDt;
		this.saXtSignFlg = saXtSignFlg;
		this.saYhtSignFlg = saYhtSignFlg;
		this.saReverseArea = saReverseArea;
		this.saQpswd = saQpswd;
		this.saVipAcctFlg = saVipAcctFlg;
		this.saRptAcctFlg = saRptAcctFlg;
		this.saCardNo = saCardNo;
		this.saIntTaxFlg = saIntTaxFlg;
		this.saAcctCtlSts = saAcctCtlSts;
		this.saFsSts = saFsSts;
		this.saNextPageFlgN = saNextPageFlgN;
		this.saSignFlg = saSignFlg;
		this.saCcrFlg = saCcrFlg;
		this.saLastTxnDt = saLastTxnDt;
		this.saDpdwRang = saDpdwRang;
		this.saRecogTypNumN = saRecogTypNumN;
		this.saOrgDepType = saOrgDepType;
		this.saTransInstnNo = saTransInstnNo;
		this.saNonFrzConsignTime = saNonFrzConsignTime;
		this.saDistCod = saDistCod;
		this.saPsbkPrtNo1 = saPsbkPrtNo1;
		this.comAccountNo = comAccountNo;
		this.subCod = subCod;
	}

	// Property accessors

	public CrtDccSaacnacnHisId getId() {
		return this.id;
	}

	public void setId(CrtDccSaacnacnHisId id) {
		this.id = id;
	}

	public Long getSaacnLl() {
		return this.saacnLl;
	}

	public void setSaacnLl(Long saacnLl) {
		this.saacnLl = saacnLl;
	}

	public String getSaacnDbTimestamp() {
		return this.saacnDbTimestamp;
	}

	public void setSaacnDbTimestamp(String saacnDbTimestamp) {
		this.saacnDbTimestamp = saacnDbTimestamp;
	}

	public String getSaPsbkNo() {
		return this.saPsbkNo;
	}

	public void setSaPsbkNo(String saPsbkNo) {
		this.saPsbkNo = saPsbkNo;
	}

	public String getSaPsbkDlDt() {
		return this.saPsbkDlDt;
	}

	public void setSaPsbkDlDt(String saPsbkDlDt) {
		this.saPsbkDlDt = saPsbkDlDt;
	}

	public String getSaPsbkPrtNo() {
		return this.saPsbkPrtNo;
	}

	public void setSaPsbkPrtNo(String saPsbkPrtNo) {
		this.saPsbkPrtNo = saPsbkPrtNo;
	}

	public String getSaPsbkSts() {
		return this.saPsbkSts;
	}

	public void setSaPsbkSts(String saPsbkSts) {
		this.saPsbkSts = saPsbkSts;
	}

	public String getSaMbstmtFlg() {
		return this.saMbstmtFlg;
	}

	public void setSaMbstmtFlg(String saMbstmtFlg) {
		this.saMbstmtFlg = saMbstmtFlg;
	}

	public String getSaOpacInstnNo() {
		return this.saOpacInstnNo;
	}

	public void setSaOpacInstnNo(String saOpacInstnNo) {
		this.saOpacInstnNo = saOpacInstnNo;
	}

	public Double getSaOpacAmt() {
		return this.saOpacAmt;
	}

	public void setSaOpacAmt(Double saOpacAmt) {
		this.saOpacAmt = saOpacAmt;
	}

	public String getSaOpacDt() {
		return this.saOpacDt;
	}

	public void setSaOpacDt(String saOpacDt) {
		this.saOpacDt = saOpacDt;
	}

	public String getSaOpacPermNo() {
		return this.saOpacPermNo;
	}

	public void setSaOpacPermNo(String saOpacPermNo) {
		this.saOpacPermNo = saOpacPermNo;
	}

	public String getSaCustNo() {
		return this.saCustNo;
	}

	public void setSaCustNo(String saCustNo) {
		this.saCustNo = saCustNo;
	}

	public String getSaCustName() {
		return this.saCustName;
	}

	public void setSaCustName(String saCustName) {
		this.saCustName = saCustName;
	}

	public String getSaConntrNo() {
		return this.saConntrNo;
	}

	public void setSaConntrNo(String saConntrNo) {
		this.saConntrNo = saConntrNo;
	}

	public String getSaCrptPin() {
		return this.saCrptPin;
	}

	public void setSaCrptPin(String saCrptPin) {
		this.saCrptPin = saCrptPin;
	}

	public String getSaPswdDlDt() {
		return this.saPswdDlDt;
	}

	public void setSaPswdDlDt(String saPswdDlDt) {
		this.saPswdDlDt = saPswdDlDt;
	}

	public String getSaPswdSts() {
		return this.saPswdSts;
	}

	public void setSaPswdSts(String saPswdSts) {
		this.saPswdSts = saPswdSts;
	}

	public Long getSaDetItemN() {
		return this.saDetItemN;
	}

	public void setSaDetItemN(Long saDetItemN) {
		this.saDetItemN = saDetItemN;
	}

	public String getSaCacctInstnNo() {
		return this.saCacctInstnNo;
	}

	public void setSaCacctInstnNo(String saCacctInstnNo) {
		this.saCacctInstnNo = saCacctInstnNo;
	}

	public String getSaCacctDt() {
		return this.saCacctDt;
	}

	public void setSaCacctDt(String saCacctDt) {
		this.saCacctDt = saCacctDt;
	}

	public Long getSaPglnTotl() {
		return this.saPglnTotl;
	}

	public void setSaPglnTotl(Long saPglnTotl) {
		this.saPglnTotl = saPglnTotl;
	}

	public Long getSaAentrDetTotl() {
		return this.saAentrDetTotl;
	}

	public void setSaAentrDetTotl(Long saAentrDetTotl) {
		this.saAentrDetTotl = saAentrDetTotl;
	}

	public Long getSaAckacDetTotl() {
		return this.saAckacDetTotl;
	}

	public void setSaAckacDetTotl(Long saAckacDetTotl) {
		this.saAckacDetTotl = saAckacDetTotl;
	}

	public String getSaSlcrdNo() {
		return this.saSlcrdNo;
	}

	public void setSaSlcrdNo(String saSlcrdNo) {
		this.saSlcrdNo = saSlcrdNo;
	}

	public String getSaPrdsInstnDpdwFlg() {
		return this.saPrdsInstnDpdwFlg;
	}

	public void setSaPrdsInstnDpdwFlg(String saPrdsInstnDpdwFlg) {
		this.saPrdsInstnDpdwFlg = saPrdsInstnDpdwFlg;
	}

	public String getSaAcctTyp() {
		return this.saAcctTyp;
	}

	public void setSaAcctTyp(String saAcctTyp) {
		this.saAcctTyp = saAcctTyp;
	}

	public String getSaAcctChar() {
		return this.saAcctChar;
	}

	public void setSaAcctChar(String saAcctChar) {
		this.saAcctChar = saAcctChar;
	}

	public String getSaDrwTyp() {
		return this.saDrwTyp;
	}

	public void setSaDrwTyp(String saDrwTyp) {
		this.saDrwTyp = saDrwTyp;
	}

	public String getSaAstmtAddrCod() {
		return this.saAstmtAddrCod;
	}

	public void setSaAstmtAddrCod(String saAstmtAddrCod) {
		this.saAstmtAddrCod = saAstmtAddrCod;
	}

	public String getSaSealSts() {
		return this.saSealSts;
	}

	public void setSaSealSts(String saSealSts) {
		this.saSealSts = saSealSts;
	}

	public Long getSaAccPageNo() {
		return this.saAccPageNo;
	}

	public void setSaAccPageNo(Long saAccPageNo) {
		this.saAccPageNo = saAccPageNo;
	}

	public Long getSaPrintedMaxNo() {
		return this.saPrintedMaxNo;
	}

	public void setSaPrintedMaxNo(Long saPrintedMaxNo) {
		this.saPrintedMaxNo = saPrintedMaxNo;
	}

	public Long getSaAccUnprintNo() {
		return this.saAccUnprintNo;
	}

	public void setSaAccUnprintNo(Long saAccUnprintNo) {
		this.saAccUnprintNo = saAccUnprintNo;
	}

	public String getSaOpacTlNo() {
		return this.saOpacTlNo;
	}

	public void setSaOpacTlNo(String saOpacTlNo) {
		this.saOpacTlNo = saOpacTlNo;
	}

	public String getSaCacctTlNo() {
		return this.saCacctTlNo;
	}

	public void setSaCacctTlNo(String saCacctTlNo) {
		this.saCacctTlNo = saCacctTlNo;
	}

	public String getSaIntcFlg() {
		return this.saIntcFlg;
	}

	public void setSaIntcFlg(String saIntcFlg) {
		this.saIntcFlg = saIntcFlg;
	}

	public String getSaSealDlDt() {
		return this.saSealDlDt;
	}

	public void setSaSealDlDt(String saSealDlDt) {
		this.saSealDlDt = saSealDlDt;
	}

	public String getSaStlmSvcSty() {
		return this.saStlmSvcSty;
	}

	public void setSaStlmSvcSty(String saStlmSvcSty) {
		this.saStlmSvcSty = saStlmSvcSty;
	}

	public String getSaDepTyp() {
		return this.saDepTyp;
	}

	public void setSaDepTyp(String saDepTyp) {
		this.saDepTyp = saDepTyp;
	}

	public Long getSaPagesumN() {
		return this.saPagesumN;
	}

	public void setSaPagesumN(Long saPagesumN) {
		this.saPagesumN = saPagesumN;
	}

	public String getSaCurrChar() {
		return this.saCurrChar;
	}

	public void setSaCurrChar(String saCurrChar) {
		this.saCurrChar = saCurrChar;
	}

	public String getSaAvalDt() {
		return this.saAvalDt;
	}

	public void setSaAvalDt(String saAvalDt) {
		this.saAvalDt = saAvalDt;
	}

	public String getSaXtSignFlg() {
		return this.saXtSignFlg;
	}

	public void setSaXtSignFlg(String saXtSignFlg) {
		this.saXtSignFlg = saXtSignFlg;
	}

	public String getSaYhtSignFlg() {
		return this.saYhtSignFlg;
	}

	public void setSaYhtSignFlg(String saYhtSignFlg) {
		this.saYhtSignFlg = saYhtSignFlg;
	}

	public String getSaReverseArea() {
		return this.saReverseArea;
	}

	public void setSaReverseArea(String saReverseArea) {
		this.saReverseArea = saReverseArea;
	}

	public String getSaQpswd() {
		return this.saQpswd;
	}

	public void setSaQpswd(String saQpswd) {
		this.saQpswd = saQpswd;
	}

	public String getSaVipAcctFlg() {
		return this.saVipAcctFlg;
	}

	public void setSaVipAcctFlg(String saVipAcctFlg) {
		this.saVipAcctFlg = saVipAcctFlg;
	}

	public String getSaRptAcctFlg() {
		return this.saRptAcctFlg;
	}

	public void setSaRptAcctFlg(String saRptAcctFlg) {
		this.saRptAcctFlg = saRptAcctFlg;
	}

	public String getSaCardNo() {
		return this.saCardNo;
	}

	public void setSaCardNo(String saCardNo) {
		this.saCardNo = saCardNo;
	}

	public String getSaIntTaxFlg() {
		return this.saIntTaxFlg;
	}

	public void setSaIntTaxFlg(String saIntTaxFlg) {
		this.saIntTaxFlg = saIntTaxFlg;
	}

	public String getSaAcctCtlSts() {
		return this.saAcctCtlSts;
	}

	public void setSaAcctCtlSts(String saAcctCtlSts) {
		this.saAcctCtlSts = saAcctCtlSts;
	}

	public String getSaFsSts() {
		return this.saFsSts;
	}

	public void setSaFsSts(String saFsSts) {
		this.saFsSts = saFsSts;
	}

	public Long getSaNextPageFlgN() {
		return this.saNextPageFlgN;
	}

	public void setSaNextPageFlgN(Long saNextPageFlgN) {
		this.saNextPageFlgN = saNextPageFlgN;
	}

	public String getSaSignFlg() {
		return this.saSignFlg;
	}

	public void setSaSignFlg(String saSignFlg) {
		this.saSignFlg = saSignFlg;
	}

	public String getSaCcrFlg() {
		return this.saCcrFlg;
	}

	public void setSaCcrFlg(String saCcrFlg) {
		this.saCcrFlg = saCcrFlg;
	}

	public String getSaLastTxnDt() {
		return this.saLastTxnDt;
	}

	public void setSaLastTxnDt(String saLastTxnDt) {
		this.saLastTxnDt = saLastTxnDt;
	}

	public String getSaDpdwRang() {
		return this.saDpdwRang;
	}

	public void setSaDpdwRang(String saDpdwRang) {
		this.saDpdwRang = saDpdwRang;
	}

	public Long getSaRecogTypNumN() {
		return this.saRecogTypNumN;
	}

	public void setSaRecogTypNumN(Long saRecogTypNumN) {
		this.saRecogTypNumN = saRecogTypNumN;
	}

	public String getSaOrgDepType() {
		return this.saOrgDepType;
	}

	public void setSaOrgDepType(String saOrgDepType) {
		this.saOrgDepType = saOrgDepType;
	}

	public String getSaTransInstnNo() {
		return this.saTransInstnNo;
	}

	public void setSaTransInstnNo(String saTransInstnNo) {
		this.saTransInstnNo = saTransInstnNo;
	}

	public Long getSaNonFrzConsignTime() {
		return this.saNonFrzConsignTime;
	}

	public void setSaNonFrzConsignTime(Long saNonFrzConsignTime) {
		this.saNonFrzConsignTime = saNonFrzConsignTime;
	}

	public String getSaDistCod() {
		return this.saDistCod;
	}

	public void setSaDistCod(String saDistCod) {
		this.saDistCod = saDistCod;
	}

	public String getSaPsbkPrtNo1() {
		return this.saPsbkPrtNo1;
	}

	public void setSaPsbkPrtNo1(String saPsbkPrtNo1) {
		this.saPsbkPrtNo1 = saPsbkPrtNo1;
	}

	public String getComAccountNo() {
		return this.comAccountNo;
	}

	public void setComAccountNo(String comAccountNo) {
		this.comAccountNo = comAccountNo;
	}

	public String getSubCod() {
		return this.subCod;
	}

	public void setSubCod(String subCod) {
		this.subCod = subCod;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}