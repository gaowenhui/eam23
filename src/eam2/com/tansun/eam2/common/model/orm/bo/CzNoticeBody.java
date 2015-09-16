package com.tansun.eam2.common.model.orm.bo;

/**
 * CzNoticeBody entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzNoticeBody extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -1486303831652104940L;
	private String id;
	private String cldId;
	private String ccbId;
	private String zcId;
	private String zcms;
	private String czysbs;

	// Constructors

	/** default constructor */
	public CzNoticeBody() {
	}

	/** full constructor */
	public CzNoticeBody(String cldId, String ccbId, String zcId, String zcms,
			String czysbs) {
		this.cldId = cldId;
		this.ccbId = ccbId;
		this.zcId = zcId;
		this.zcms = zcms;
		this.czysbs = czysbs;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCldId() {
		return this.cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public String getCcbId() {
		return this.ccbId;
	}

	public void setCcbId(String ccbId) {
		this.ccbId = ccbId;
	}

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getZcms() {
		return this.zcms;
	}

	public void setZcms(String zcms) {
		this.zcms = zcms;
	}

	public String getCzysbs() {
		return this.czysbs;
	}

	public void setCzysbs(String czysbs) {
		this.czysbs = czysbs;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}