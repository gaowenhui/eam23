package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CommonEam2Oa entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CommonEam2Oa extends com.tansun.rdp4j.common.web.vo.CommonBO implements java.io.Serializable {

	// Fields

	private String id;
	private String headid;
	private String biaoti;
	private String ywzl;
	private String ywmc;
	private String lcid;
	private String url;
	private String status;
	private String ngrid;
	private String ngr;
	private Date ngrq;
	private Date updateDate;
	private Date rsvdDate1;
	private Date rsvdDate2;
	private Date rsvdDate3;
	private Date rsvdDate4;
	private Long rsvdNum1;
	private Long rsvdNum2;
	private Long rsvdNum3;
	private String rsvdStr1;
	private String rsvdStr2;
	private String rsvdStr3;
	private String rsvdStr4;
	private String rsvdStr5;
	private String rsvdStr6;

	// Constructors

	/** default constructor */
	public CommonEam2Oa() {
	}

	/** minimal constructor */
	public CommonEam2Oa(String id) {
		this.id = id;
	}

	/** full constructor */
	public CommonEam2Oa(String id, String headid, String biaoti, String ywzl,
			String ywmc, String lcid, String url, String status, String ngrid,
			String ngr, Date ngrq, Date updateDate, Date rsvdDate1,
			Date rsvdDate2, Date rsvdDate3, Date rsvdDate4, Long rsvdNum1,
			Long rsvdNum2, Long rsvdNum3, String rsvdStr1, String rsvdStr2,
			String rsvdStr3, String rsvdStr4, String rsvdStr5, String rsvdStr6) {
		this.id = id;
		this.headid = headid;
		this.biaoti = biaoti;
		this.ywzl = ywzl;
		this.ywmc = ywmc;
		this.lcid = lcid;
		this.url = url;
		this.status = status;
		this.ngrid = ngrid;
		this.ngr = ngr;
		this.ngrq = ngrq;
		this.updateDate = updateDate;
		this.rsvdDate1 = rsvdDate1;
		this.rsvdDate2 = rsvdDate2;
		this.rsvdDate3 = rsvdDate3;
		this.rsvdDate4 = rsvdDate4;
		this.rsvdNum1 = rsvdNum1;
		this.rsvdNum2 = rsvdNum2;
		this.rsvdNum3 = rsvdNum3;
		this.rsvdStr1 = rsvdStr1;
		this.rsvdStr2 = rsvdStr2;
		this.rsvdStr3 = rsvdStr3;
		this.rsvdStr4 = rsvdStr4;
		this.rsvdStr5 = rsvdStr5;
		this.rsvdStr6 = rsvdStr6;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeadid() {
		return this.headid;
	}

	public void setHeadid(String headid) {
		this.headid = headid;
	}

	public String getBiaoti() {
		return this.biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getYwzl() {
		return this.ywzl;
	}

	public void setYwzl(String ywzl) {
		this.ywzl = ywzl;
	}

	public String getYwmc() {
		return this.ywmc;
	}

	public void setYwmc(String ywmc) {
		this.ywmc = ywmc;
	}

	public String getLcid() {
		return this.lcid;
	}

	public void setLcid(String lcid) {
		this.lcid = lcid;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getNgrid() {
		return this.ngrid;
	}

	public void setNgrid(String ngrid) {
		this.ngrid = ngrid;
	}

	public String getNgr() {
		return this.ngr;
	}

	public void setNgr(String ngr) {
		this.ngr = ngr;
	}

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getRsvdDate1() {
		return this.rsvdDate1;
	}

	public void setRsvdDate1(Date rsvdDate1) {
		this.rsvdDate1 = rsvdDate1;
	}

	public Date getRsvdDate2() {
		return this.rsvdDate2;
	}

	public void setRsvdDate2(Date rsvdDate2) {
		this.rsvdDate2 = rsvdDate2;
	}

	public Date getRsvdDate3() {
		return this.rsvdDate3;
	}

	public void setRsvdDate3(Date rsvdDate3) {
		this.rsvdDate3 = rsvdDate3;
	}

	public Date getRsvdDate4() {
		return this.rsvdDate4;
	}

	public void setRsvdDate4(Date rsvdDate4) {
		this.rsvdDate4 = rsvdDate4;
	}

	public Long getRsvdNum1() {
		return this.rsvdNum1;
	}

	public void setRsvdNum1(Long rsvdNum1) {
		this.rsvdNum1 = rsvdNum1;
	}

	public Long getRsvdNum2() {
		return this.rsvdNum2;
	}

	public void setRsvdNum2(Long rsvdNum2) {
		this.rsvdNum2 = rsvdNum2;
	}

	public Long getRsvdNum3() {
		return this.rsvdNum3;
	}

	public void setRsvdNum3(Long rsvdNum3) {
		this.rsvdNum3 = rsvdNum3;
	}

	public String getRsvdStr1() {
		return this.rsvdStr1;
	}

	public void setRsvdStr1(String rsvdStr1) {
		this.rsvdStr1 = rsvdStr1;
	}

	public String getRsvdStr2() {
		return this.rsvdStr2;
	}

	public void setRsvdStr2(String rsvdStr2) {
		this.rsvdStr2 = rsvdStr2;
	}

	public String getRsvdStr3() {
		return this.rsvdStr3;
	}

	public void setRsvdStr3(String rsvdStr3) {
		this.rsvdStr3 = rsvdStr3;
	}

	public String getRsvdStr4() {
		return this.rsvdStr4;
	}

	public void setRsvdStr4(String rsvdStr4) {
		this.rsvdStr4 = rsvdStr4;
	}

	public String getRsvdStr5() {
		return this.rsvdStr5;
	}

	public void setRsvdStr5(String rsvdStr5) {
		this.rsvdStr5 = rsvdStr5;
	}

	public String getRsvdStr6() {
		return this.rsvdStr6;
	}

	public void setRsvdStr6(String rsvdStr6) {
		this.rsvdStr6 = rsvdStr6;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}