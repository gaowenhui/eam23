package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccCicifci1 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccCicifci1 extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String ciCustNo;
	private String cicifDbTimestamp;
	private String ciCustTyp;
	private String ciChnName;
	private String ciRegBirdy;
	private String ciEngSplName1;
	private String ciRescnty;
	private String ciResCnty;
	private String ciFlstTlrNo;
	private String ciFlstDt;
	private String ciLtstMntnOpr;
	private String ciLtstMntnDt;
	private String ciLtstAwbk0;
	private String ciLtstAwbk1;
	private String ciLtstAwbk2;
	private String ciLtstAwbk3;
	private String ciUnitChnInil;
	private String ciLgprRepCust;
	private String ciTabsRegNo;
	private String ciTaxrScal;
	private String ciGovnCertNo;
	private String ciAdmnTyp;
	private String ciBusntp;
	private String ciBlngSys;
	private String ciEconChar;
	private String ciMangDept;
	private String ciLnCertNo;
	private Double ciRegCap;
	private Double ciCapInhd;
	private String ciEntpScal;
	private String ciFinConntr;
	private String ciEntpCrdg;
	private String ciEntpQualCod;
	private Double ciFcurrBalContr;
	private Long ciAprvLnCrlmt;
	private String ciAprvYr;
	private String ciAprvFileNo;
	private String ciFundPicDept;
	private String ciLedgPdt;
	private String ciGovnExpdDt;
	private String ciOpacPermNo;
	private String ciCrlmtNoMax;
	private String ciRegCapCurr;
	private String ciCcNo;
	private String ciConCustFlg;
	private String ciCardCrlmtNo;
	private String filler;

	// Constructors

	/** default constructor */
	public CrtDccCicifci1() {
	}

	/** minimal constructor */
	public CrtDccCicifci1(String ciCustNo) {
		this.ciCustNo = ciCustNo;
	}

	/** full constructor */
	public CrtDccCicifci1(String ciCustNo, String cicifDbTimestamp,
			String ciCustTyp, String ciChnName, String ciRegBirdy,
			String ciEngSplName1, String ciRescnty, String ciResCnty,
			String ciFlstTlrNo, String ciFlstDt, String ciLtstMntnOpr,
			String ciLtstMntnDt, String ciLtstAwbk0, String ciLtstAwbk1,
			String ciLtstAwbk2, String ciLtstAwbk3, String ciUnitChnInil,
			String ciLgprRepCust, String ciTabsRegNo, String ciTaxrScal,
			String ciGovnCertNo, String ciAdmnTyp, String ciBusntp,
			String ciBlngSys, String ciEconChar, String ciMangDept,
			String ciLnCertNo, Double ciRegCap, Double ciCapInhd,
			String ciEntpScal, String ciFinConntr, String ciEntpCrdg,
			String ciEntpQualCod, Double ciFcurrBalContr, Long ciAprvLnCrlmt,
			String ciAprvYr, String ciAprvFileNo, String ciFundPicDept,
			String ciLedgPdt, String ciGovnExpdDt, String ciOpacPermNo,
			String ciCrlmtNoMax, String ciRegCapCurr, String ciCcNo,
			String ciConCustFlg, String ciCardCrlmtNo, String filler) {
		this.ciCustNo = ciCustNo;
		this.cicifDbTimestamp = cicifDbTimestamp;
		this.ciCustTyp = ciCustTyp;
		this.ciChnName = ciChnName;
		this.ciRegBirdy = ciRegBirdy;
		this.ciEngSplName1 = ciEngSplName1;
		this.ciRescnty = ciRescnty;
		this.ciResCnty = ciResCnty;
		this.ciFlstTlrNo = ciFlstTlrNo;
		this.ciFlstDt = ciFlstDt;
		this.ciLtstMntnOpr = ciLtstMntnOpr;
		this.ciLtstMntnDt = ciLtstMntnDt;
		this.ciLtstAwbk0 = ciLtstAwbk0;
		this.ciLtstAwbk1 = ciLtstAwbk1;
		this.ciLtstAwbk2 = ciLtstAwbk2;
		this.ciLtstAwbk3 = ciLtstAwbk3;
		this.ciUnitChnInil = ciUnitChnInil;
		this.ciLgprRepCust = ciLgprRepCust;
		this.ciTabsRegNo = ciTabsRegNo;
		this.ciTaxrScal = ciTaxrScal;
		this.ciGovnCertNo = ciGovnCertNo;
		this.ciAdmnTyp = ciAdmnTyp;
		this.ciBusntp = ciBusntp;
		this.ciBlngSys = ciBlngSys;
		this.ciEconChar = ciEconChar;
		this.ciMangDept = ciMangDept;
		this.ciLnCertNo = ciLnCertNo;
		this.ciRegCap = ciRegCap;
		this.ciCapInhd = ciCapInhd;
		this.ciEntpScal = ciEntpScal;
		this.ciFinConntr = ciFinConntr;
		this.ciEntpCrdg = ciEntpCrdg;
		this.ciEntpQualCod = ciEntpQualCod;
		this.ciFcurrBalContr = ciFcurrBalContr;
		this.ciAprvLnCrlmt = ciAprvLnCrlmt;
		this.ciAprvYr = ciAprvYr;
		this.ciAprvFileNo = ciAprvFileNo;
		this.ciFundPicDept = ciFundPicDept;
		this.ciLedgPdt = ciLedgPdt;
		this.ciGovnExpdDt = ciGovnExpdDt;
		this.ciOpacPermNo = ciOpacPermNo;
		this.ciCrlmtNoMax = ciCrlmtNoMax;
		this.ciRegCapCurr = ciRegCapCurr;
		this.ciCcNo = ciCcNo;
		this.ciConCustFlg = ciConCustFlg;
		this.ciCardCrlmtNo = ciCardCrlmtNo;
		this.filler = filler;
	}

	// Property accessors

	public String getCiCustNo() {
		return this.ciCustNo;
	}

	public void setCiCustNo(String ciCustNo) {
		this.ciCustNo = ciCustNo;
	}

	public String getCicifDbTimestamp() {
		return this.cicifDbTimestamp;
	}

	public void setCicifDbTimestamp(String cicifDbTimestamp) {
		this.cicifDbTimestamp = cicifDbTimestamp;
	}

	public String getCiCustTyp() {
		return this.ciCustTyp;
	}

	public void setCiCustTyp(String ciCustTyp) {
		this.ciCustTyp = ciCustTyp;
	}

	public String getCiChnName() {
		return this.ciChnName;
	}

	public void setCiChnName(String ciChnName) {
		this.ciChnName = ciChnName;
	}

	public String getCiRegBirdy() {
		return this.ciRegBirdy;
	}

	public void setCiRegBirdy(String ciRegBirdy) {
		this.ciRegBirdy = ciRegBirdy;
	}

	public String getCiEngSplName1() {
		return this.ciEngSplName1;
	}

	public void setCiEngSplName1(String ciEngSplName1) {
		this.ciEngSplName1 = ciEngSplName1;
	}

	public String getCiRescnty() {
		return this.ciRescnty;
	}

	public void setCiRescnty(String ciRescnty) {
		this.ciRescnty = ciRescnty;
	}

	public String getCiResCnty() {
		return this.ciResCnty;
	}

	public void setCiResCnty(String ciResCnty) {
		this.ciResCnty = ciResCnty;
	}

	public String getCiFlstTlrNo() {
		return this.ciFlstTlrNo;
	}

	public void setCiFlstTlrNo(String ciFlstTlrNo) {
		this.ciFlstTlrNo = ciFlstTlrNo;
	}

	public String getCiFlstDt() {
		return this.ciFlstDt;
	}

	public void setCiFlstDt(String ciFlstDt) {
		this.ciFlstDt = ciFlstDt;
	}

	public String getCiLtstMntnOpr() {
		return this.ciLtstMntnOpr;
	}

	public void setCiLtstMntnOpr(String ciLtstMntnOpr) {
		this.ciLtstMntnOpr = ciLtstMntnOpr;
	}

	public String getCiLtstMntnDt() {
		return this.ciLtstMntnDt;
	}

	public void setCiLtstMntnDt(String ciLtstMntnDt) {
		this.ciLtstMntnDt = ciLtstMntnDt;
	}

	public String getCiLtstAwbk0() {
		return this.ciLtstAwbk0;
	}

	public void setCiLtstAwbk0(String ciLtstAwbk0) {
		this.ciLtstAwbk0 = ciLtstAwbk0;
	}

	public String getCiLtstAwbk1() {
		return this.ciLtstAwbk1;
	}

	public void setCiLtstAwbk1(String ciLtstAwbk1) {
		this.ciLtstAwbk1 = ciLtstAwbk1;
	}

	public String getCiLtstAwbk2() {
		return this.ciLtstAwbk2;
	}

	public void setCiLtstAwbk2(String ciLtstAwbk2) {
		this.ciLtstAwbk2 = ciLtstAwbk2;
	}

	public String getCiLtstAwbk3() {
		return this.ciLtstAwbk3;
	}

	public void setCiLtstAwbk3(String ciLtstAwbk3) {
		this.ciLtstAwbk3 = ciLtstAwbk3;
	}

	public String getCiUnitChnInil() {
		return this.ciUnitChnInil;
	}

	public void setCiUnitChnInil(String ciUnitChnInil) {
		this.ciUnitChnInil = ciUnitChnInil;
	}

	public String getCiLgprRepCust() {
		return this.ciLgprRepCust;
	}

	public void setCiLgprRepCust(String ciLgprRepCust) {
		this.ciLgprRepCust = ciLgprRepCust;
	}

	public String getCiTabsRegNo() {
		return this.ciTabsRegNo;
	}

	public void setCiTabsRegNo(String ciTabsRegNo) {
		this.ciTabsRegNo = ciTabsRegNo;
	}

	public String getCiTaxrScal() {
		return this.ciTaxrScal;
	}

	public void setCiTaxrScal(String ciTaxrScal) {
		this.ciTaxrScal = ciTaxrScal;
	}

	public String getCiGovnCertNo() {
		return this.ciGovnCertNo;
	}

	public void setCiGovnCertNo(String ciGovnCertNo) {
		this.ciGovnCertNo = ciGovnCertNo;
	}

	public String getCiAdmnTyp() {
		return this.ciAdmnTyp;
	}

	public void setCiAdmnTyp(String ciAdmnTyp) {
		this.ciAdmnTyp = ciAdmnTyp;
	}

	public String getCiBusntp() {
		return this.ciBusntp;
	}

	public void setCiBusntp(String ciBusntp) {
		this.ciBusntp = ciBusntp;
	}

	public String getCiBlngSys() {
		return this.ciBlngSys;
	}

	public void setCiBlngSys(String ciBlngSys) {
		this.ciBlngSys = ciBlngSys;
	}

	public String getCiEconChar() {
		return this.ciEconChar;
	}

	public void setCiEconChar(String ciEconChar) {
		this.ciEconChar = ciEconChar;
	}

	public String getCiMangDept() {
		return this.ciMangDept;
	}

	public void setCiMangDept(String ciMangDept) {
		this.ciMangDept = ciMangDept;
	}

	public String getCiLnCertNo() {
		return this.ciLnCertNo;
	}

	public void setCiLnCertNo(String ciLnCertNo) {
		this.ciLnCertNo = ciLnCertNo;
	}

	public Double getCiRegCap() {
		return this.ciRegCap;
	}

	public void setCiRegCap(Double ciRegCap) {
		this.ciRegCap = ciRegCap;
	}

	public Double getCiCapInhd() {
		return this.ciCapInhd;
	}

	public void setCiCapInhd(Double ciCapInhd) {
		this.ciCapInhd = ciCapInhd;
	}

	public String getCiEntpScal() {
		return this.ciEntpScal;
	}

	public void setCiEntpScal(String ciEntpScal) {
		this.ciEntpScal = ciEntpScal;
	}

	public String getCiFinConntr() {
		return this.ciFinConntr;
	}

	public void setCiFinConntr(String ciFinConntr) {
		this.ciFinConntr = ciFinConntr;
	}

	public String getCiEntpCrdg() {
		return this.ciEntpCrdg;
	}

	public void setCiEntpCrdg(String ciEntpCrdg) {
		this.ciEntpCrdg = ciEntpCrdg;
	}

	public String getCiEntpQualCod() {
		return this.ciEntpQualCod;
	}

	public void setCiEntpQualCod(String ciEntpQualCod) {
		this.ciEntpQualCod = ciEntpQualCod;
	}

	public Double getCiFcurrBalContr() {
		return this.ciFcurrBalContr;
	}

	public void setCiFcurrBalContr(Double ciFcurrBalContr) {
		this.ciFcurrBalContr = ciFcurrBalContr;
	}

	public Long getCiAprvLnCrlmt() {
		return this.ciAprvLnCrlmt;
	}

	public void setCiAprvLnCrlmt(Long ciAprvLnCrlmt) {
		this.ciAprvLnCrlmt = ciAprvLnCrlmt;
	}

	public String getCiAprvYr() {
		return this.ciAprvYr;
	}

	public void setCiAprvYr(String ciAprvYr) {
		this.ciAprvYr = ciAprvYr;
	}

	public String getCiAprvFileNo() {
		return this.ciAprvFileNo;
	}

	public void setCiAprvFileNo(String ciAprvFileNo) {
		this.ciAprvFileNo = ciAprvFileNo;
	}

	public String getCiFundPicDept() {
		return this.ciFundPicDept;
	}

	public void setCiFundPicDept(String ciFundPicDept) {
		this.ciFundPicDept = ciFundPicDept;
	}

	public String getCiLedgPdt() {
		return this.ciLedgPdt;
	}

	public void setCiLedgPdt(String ciLedgPdt) {
		this.ciLedgPdt = ciLedgPdt;
	}

	public String getCiGovnExpdDt() {
		return this.ciGovnExpdDt;
	}

	public void setCiGovnExpdDt(String ciGovnExpdDt) {
		this.ciGovnExpdDt = ciGovnExpdDt;
	}

	public String getCiOpacPermNo() {
		return this.ciOpacPermNo;
	}

	public void setCiOpacPermNo(String ciOpacPermNo) {
		this.ciOpacPermNo = ciOpacPermNo;
	}

	public String getCiCrlmtNoMax() {
		return this.ciCrlmtNoMax;
	}

	public void setCiCrlmtNoMax(String ciCrlmtNoMax) {
		this.ciCrlmtNoMax = ciCrlmtNoMax;
	}

	public String getCiRegCapCurr() {
		return this.ciRegCapCurr;
	}

	public void setCiRegCapCurr(String ciRegCapCurr) {
		this.ciRegCapCurr = ciRegCapCurr;
	}

	public String getCiCcNo() {
		return this.ciCcNo;
	}

	public void setCiCcNo(String ciCcNo) {
		this.ciCcNo = ciCcNo;
	}

	public String getCiConCustFlg() {
		return this.ciConCustFlg;
	}

	public void setCiConCustFlg(String ciConCustFlg) {
		this.ciConCustFlg = ciConCustFlg;
	}

	public String getCiCardCrlmtNo() {
		return this.ciCardCrlmtNo;
	}

	public void setCiCardCrlmtNo(String ciCardCrlmtNo) {
		this.ciCardCrlmtNo = ciCardCrlmtNo;
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