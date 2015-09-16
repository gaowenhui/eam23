package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccFcicif0 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccFcicif0 extends com.tansun.rdp4j.common.web.vo.CommonBO
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
	private String ciLtstMntnOprNo;
	private String ciLtstMntnDt;
	private String ciLtstAwbk1;
	private String ciLtstAwbk2;
	private String ciLtstAwbk3;
	private String ciLtstAwbk4;
	private String ciMrgCond;
	private String ciCustTtl;
	private String ciSex;
	private String ciPplCod;
	private String ciMaxEducLvlCod;
	private String ciOccupCod;
	private String ciOfrn;
	private String ciPosn;
	private String ciTitl;
	private String ciWokgUnitName;
	private String ciUnitTel;
	private Long ciDependNo;
	private String ciPeconResur;
	private String ciOthEconRsur;
	private String ciMnIncom;
	private Long ciCrdUdtkTm;
	private String ciMbtelno;
	private String ciBpMachNo;
	private String ciCustSts;
	private String ciCouIdNam;
	private String ciCrlmtNoMax;
	private String ciEntpCode;
	private String ciCfCouName;
	private String ciCfUnitTyp;
	private String ciHaveWorkYear;
	private String ciConCustFlg;
	private String ciCardCrlmtNo;
	private String ciHouseType;
	private String ciRegister;
	private String ciWorkNo;
	private String ciVipLevel;
	private String ciSignLgprOperFlg;
	private String filler;

	// Constructors

	/** default constructor */
	public CrtDccFcicif0() {
	}

	/** minimal constructor */
	public CrtDccFcicif0(String ciCustNo) {
		this.ciCustNo = ciCustNo;
	}

	/** full constructor */
	public CrtDccFcicif0(String ciCustNo, String cicifDbTimestamp,
			String ciCustTyp, String ciChnName, String ciRegBirdy,
			String ciEngSplName1, String ciRescnty, String ciResCnty,
			String ciFlstTlrNo, String ciFlstDt, String ciLtstMntnOprNo,
			String ciLtstMntnDt, String ciLtstAwbk1, String ciLtstAwbk2,
			String ciLtstAwbk3, String ciLtstAwbk4, String ciMrgCond,
			String ciCustTtl, String ciSex, String ciPplCod,
			String ciMaxEducLvlCod, String ciOccupCod, String ciOfrn,
			String ciPosn, String ciTitl, String ciWokgUnitName,
			String ciUnitTel, Long ciDependNo, String ciPeconResur,
			String ciOthEconRsur, String ciMnIncom, Long ciCrdUdtkTm,
			String ciMbtelno, String ciBpMachNo, String ciCustSts,
			String ciCouIdNam, String ciCrlmtNoMax, String ciEntpCode,
			String ciCfCouName, String ciCfUnitTyp, String ciHaveWorkYear,
			String ciConCustFlg, String ciCardCrlmtNo, String ciHouseType,
			String ciRegister, String ciWorkNo, String ciVipLevel,
			String ciSignLgprOperFlg, String filler) {
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
		this.ciLtstMntnOprNo = ciLtstMntnOprNo;
		this.ciLtstMntnDt = ciLtstMntnDt;
		this.ciLtstAwbk1 = ciLtstAwbk1;
		this.ciLtstAwbk2 = ciLtstAwbk2;
		this.ciLtstAwbk3 = ciLtstAwbk3;
		this.ciLtstAwbk4 = ciLtstAwbk4;
		this.ciMrgCond = ciMrgCond;
		this.ciCustTtl = ciCustTtl;
		this.ciSex = ciSex;
		this.ciPplCod = ciPplCod;
		this.ciMaxEducLvlCod = ciMaxEducLvlCod;
		this.ciOccupCod = ciOccupCod;
		this.ciOfrn = ciOfrn;
		this.ciPosn = ciPosn;
		this.ciTitl = ciTitl;
		this.ciWokgUnitName = ciWokgUnitName;
		this.ciUnitTel = ciUnitTel;
		this.ciDependNo = ciDependNo;
		this.ciPeconResur = ciPeconResur;
		this.ciOthEconRsur = ciOthEconRsur;
		this.ciMnIncom = ciMnIncom;
		this.ciCrdUdtkTm = ciCrdUdtkTm;
		this.ciMbtelno = ciMbtelno;
		this.ciBpMachNo = ciBpMachNo;
		this.ciCustSts = ciCustSts;
		this.ciCouIdNam = ciCouIdNam;
		this.ciCrlmtNoMax = ciCrlmtNoMax;
		this.ciEntpCode = ciEntpCode;
		this.ciCfCouName = ciCfCouName;
		this.ciCfUnitTyp = ciCfUnitTyp;
		this.ciHaveWorkYear = ciHaveWorkYear;
		this.ciConCustFlg = ciConCustFlg;
		this.ciCardCrlmtNo = ciCardCrlmtNo;
		this.ciHouseType = ciHouseType;
		this.ciRegister = ciRegister;
		this.ciWorkNo = ciWorkNo;
		this.ciVipLevel = ciVipLevel;
		this.ciSignLgprOperFlg = ciSignLgprOperFlg;
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

	public String getCiLtstMntnOprNo() {
		return this.ciLtstMntnOprNo;
	}

	public void setCiLtstMntnOprNo(String ciLtstMntnOprNo) {
		this.ciLtstMntnOprNo = ciLtstMntnOprNo;
	}

	public String getCiLtstMntnDt() {
		return this.ciLtstMntnDt;
	}

	public void setCiLtstMntnDt(String ciLtstMntnDt) {
		this.ciLtstMntnDt = ciLtstMntnDt;
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

	public String getCiLtstAwbk4() {
		return this.ciLtstAwbk4;
	}

	public void setCiLtstAwbk4(String ciLtstAwbk4) {
		this.ciLtstAwbk4 = ciLtstAwbk4;
	}

	public String getCiMrgCond() {
		return this.ciMrgCond;
	}

	public void setCiMrgCond(String ciMrgCond) {
		this.ciMrgCond = ciMrgCond;
	}

	public String getCiCustTtl() {
		return this.ciCustTtl;
	}

	public void setCiCustTtl(String ciCustTtl) {
		this.ciCustTtl = ciCustTtl;
	}

	public String getCiSex() {
		return this.ciSex;
	}

	public void setCiSex(String ciSex) {
		this.ciSex = ciSex;
	}

	public String getCiPplCod() {
		return this.ciPplCod;
	}

	public void setCiPplCod(String ciPplCod) {
		this.ciPplCod = ciPplCod;
	}

	public String getCiMaxEducLvlCod() {
		return this.ciMaxEducLvlCod;
	}

	public void setCiMaxEducLvlCod(String ciMaxEducLvlCod) {
		this.ciMaxEducLvlCod = ciMaxEducLvlCod;
	}

	public String getCiOccupCod() {
		return this.ciOccupCod;
	}

	public void setCiOccupCod(String ciOccupCod) {
		this.ciOccupCod = ciOccupCod;
	}

	public String getCiOfrn() {
		return this.ciOfrn;
	}

	public void setCiOfrn(String ciOfrn) {
		this.ciOfrn = ciOfrn;
	}

	public String getCiPosn() {
		return this.ciPosn;
	}

	public void setCiPosn(String ciPosn) {
		this.ciPosn = ciPosn;
	}

	public String getCiTitl() {
		return this.ciTitl;
	}

	public void setCiTitl(String ciTitl) {
		this.ciTitl = ciTitl;
	}

	public String getCiWokgUnitName() {
		return this.ciWokgUnitName;
	}

	public void setCiWokgUnitName(String ciWokgUnitName) {
		this.ciWokgUnitName = ciWokgUnitName;
	}

	public String getCiUnitTel() {
		return this.ciUnitTel;
	}

	public void setCiUnitTel(String ciUnitTel) {
		this.ciUnitTel = ciUnitTel;
	}

	public Long getCiDependNo() {
		return this.ciDependNo;
	}

	public void setCiDependNo(Long ciDependNo) {
		this.ciDependNo = ciDependNo;
	}

	public String getCiPeconResur() {
		return this.ciPeconResur;
	}

	public void setCiPeconResur(String ciPeconResur) {
		this.ciPeconResur = ciPeconResur;
	}

	public String getCiOthEconRsur() {
		return this.ciOthEconRsur;
	}

	public void setCiOthEconRsur(String ciOthEconRsur) {
		this.ciOthEconRsur = ciOthEconRsur;
	}

	public String getCiMnIncom() {
		return this.ciMnIncom;
	}

	public void setCiMnIncom(String ciMnIncom) {
		this.ciMnIncom = ciMnIncom;
	}

	public Long getCiCrdUdtkTm() {
		return this.ciCrdUdtkTm;
	}

	public void setCiCrdUdtkTm(Long ciCrdUdtkTm) {
		this.ciCrdUdtkTm = ciCrdUdtkTm;
	}

	public String getCiMbtelno() {
		return this.ciMbtelno;
	}

	public void setCiMbtelno(String ciMbtelno) {
		this.ciMbtelno = ciMbtelno;
	}

	public String getCiBpMachNo() {
		return this.ciBpMachNo;
	}

	public void setCiBpMachNo(String ciBpMachNo) {
		this.ciBpMachNo = ciBpMachNo;
	}

	public String getCiCustSts() {
		return this.ciCustSts;
	}

	public void setCiCustSts(String ciCustSts) {
		this.ciCustSts = ciCustSts;
	}

	public String getCiCouIdNam() {
		return this.ciCouIdNam;
	}

	public void setCiCouIdNam(String ciCouIdNam) {
		this.ciCouIdNam = ciCouIdNam;
	}

	public String getCiCrlmtNoMax() {
		return this.ciCrlmtNoMax;
	}

	public void setCiCrlmtNoMax(String ciCrlmtNoMax) {
		this.ciCrlmtNoMax = ciCrlmtNoMax;
	}

	public String getCiEntpCode() {
		return this.ciEntpCode;
	}

	public void setCiEntpCode(String ciEntpCode) {
		this.ciEntpCode = ciEntpCode;
	}

	public String getCiCfCouName() {
		return this.ciCfCouName;
	}

	public void setCiCfCouName(String ciCfCouName) {
		this.ciCfCouName = ciCfCouName;
	}

	public String getCiCfUnitTyp() {
		return this.ciCfUnitTyp;
	}

	public void setCiCfUnitTyp(String ciCfUnitTyp) {
		this.ciCfUnitTyp = ciCfUnitTyp;
	}

	public String getCiHaveWorkYear() {
		return this.ciHaveWorkYear;
	}

	public void setCiHaveWorkYear(String ciHaveWorkYear) {
		this.ciHaveWorkYear = ciHaveWorkYear;
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

	public String getCiHouseType() {
		return this.ciHouseType;
	}

	public void setCiHouseType(String ciHouseType) {
		this.ciHouseType = ciHouseType;
	}

	public String getCiRegister() {
		return this.ciRegister;
	}

	public void setCiRegister(String ciRegister) {
		this.ciRegister = ciRegister;
	}

	public String getCiWorkNo() {
		return this.ciWorkNo;
	}

	public void setCiWorkNo(String ciWorkNo) {
		this.ciWorkNo = ciWorkNo;
	}

	public String getCiVipLevel() {
		return this.ciVipLevel;
	}

	public void setCiVipLevel(String ciVipLevel) {
		this.ciVipLevel = ciVipLevel;
	}

	public String getCiSignLgprOperFlg() {
		return this.ciSignLgprOperFlg;
	}

	public void setCiSignLgprOperFlg(String ciSignLgprOperFlg) {
		this.ciSignLgprOperFlg = ciSignLgprOperFlg;
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