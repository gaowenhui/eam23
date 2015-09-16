package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * AssetChangeLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AssetChangeLog extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -2158597650336837445L;
	private String id;
	private String personId;
	private String personName;
	private Date updatedate;
	private String updatetype;
	private String upobjId;
	private String upobjcode;
	private String upsheet;
	private String upproper;
	private String upbefovalue;
	private String upaftervalue;
	private String subsys;
    private String assetName;
	// Constructors

	/** default constructor */
	public AssetChangeLog() {
	}

	public AssetChangeLog(String id, String personId, String personName, Date updatedate,
			String updatetype, String upobjId, String assetName, String upobjcode,
			String upsheet, String upproper, String upbefovalue,
			String upaftervalue, String subsys) {
        this.id = id;
		this.personId = personId;
		this.personName = personName;
		this.updatedate = updatedate;
		this.updatetype = updatetype;
		this.upobjId = upobjId;
        this.assetName = assetName;
		this.upobjcode = upobjcode;
		this.upsheet = upsheet;
		this.upproper = upproper;
		this.upbefovalue = upbefovalue;
		this.upaftervalue = upaftervalue;
		this.subsys = subsys;
	}

	/** full constructor */
	public AssetChangeLog(String personId, String personName, Date updatedate,
			String updatetype, String upobjId, String upobjcode,
			String upsheet, String upproper, String upbefovalue,
			String upaftervalue, String subsys) {
		this.personId = personId;
		this.personName = personName;
		this.updatedate = updatedate;
		this.updatetype = updatetype;
		this.upobjId = upobjId;
		this.upobjcode = upobjcode;
		this.upsheet = upsheet;
		this.upproper = upproper;
		this.upbefovalue = upbefovalue;
		this.upaftervalue = upaftervalue;
		this.subsys = subsys;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPersonId() {
		return this.personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getPersonName() {
		return this.personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public Date getUpdatedate() {
		return this.updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getUpdatetype() {
		return this.updatetype;
	}

	public void setUpdatetype(String updatetype) {
		this.updatetype = updatetype;
	}

	public String getUpobjId() {
		return this.upobjId;
	}

	public void setUpobjId(String upobjId) {
		this.upobjId = upobjId;
	}

	public String getUpobjcode() {
		return this.upobjcode;
	}

	public void setUpobjcode(String upobjcode) {
		this.upobjcode = upobjcode;
	}

	public String getUpsheet() {
		return this.upsheet;
	}

	public void setUpsheet(String upsheet) {
		this.upsheet = upsheet;
	}

	public String getUpproper() {
		return this.upproper;
	}

	public void setUpproper(String upproper) {
		this.upproper = upproper;
	}

	public String getUpbefovalue() {
		return this.upbefovalue;
	}

	public void setUpbefovalue(String upbefovalue) {
		this.upbefovalue = upbefovalue;
	}

	public String getUpaftervalue() {
		return this.upaftervalue;
	}

	public void setUpaftervalue(String upaftervalue) {
		this.upaftervalue = upaftervalue;
	}

	public String getSubsys() {
		return this.subsys;
	}

	public void setSubsys(String subsys) {
		this.subsys = subsys;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    public String toString() {
        final String TAB = ",";
        String retValue = "";
        retValue = "AssetChangeLog ( " + super.toString() + TAB + "id=" + this.id + TAB + "personId=" + this.personId + TAB + "personName=" + this.personName + TAB + "updatedate=" + this.updatedate + TAB + "updatetype=" + this.updatetype + TAB + "upobjId=" + this.upobjId + TAB + "upobjcode=" + this.upobjcode + TAB + "upsheet=" + this.upsheet + TAB + "upproper=" + this.upproper + TAB + "upbefovalue=" + this.upbefovalue + TAB + "upaftervalue=" + this.upaftervalue + TAB + "subsys=" + this.subsys + TAB + "assetName=" + this.assetName + " )";
        return retValue;
    }

}