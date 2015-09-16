package com.tansun.eam2.common.model.orm.bo;

/**
 * CzSczskLsb entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzSczskLsb extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -4033814461929900072L;
	private String id;
	private String cldId;
	private String pid;
	private String code;
	private String value;
	private String scbz;
	private String zskId;
	private String zjbz;

	// Constructors

	/** default constructor */
	public CzSczskLsb() {
	}

	/** full constructor */
	public CzSczskLsb(String cldId, String pid, String code, String value,
			String scbz, String zskId, String zjbz) {
		this.cldId = cldId;
		this.pid = pid;
		this.code = code;
		this.value = value;
		this.scbz = scbz;
		this.zskId = zskId;
		this.zjbz = zjbz;
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

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getScbz() {
		return this.scbz;
	}

	public void setScbz(String scbz) {
		this.scbz = scbz;
	}

	public String getZskId() {
		return zskId;
	}

	public void setZskId(String zskId) {
		this.zskId = zskId;
	}

	public String getZjbz() {
		return zjbz;
	}

	public void setZjbz(String zjbz) {
		this.zjbz = zjbz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}