package com.tansun.eam2.common.model.orm.bo;

/**
 * CzSczsk entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzSczsk extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	private static final long serialVersionUID = -8898950931160094528L;
	private String id;
	private String pid;
	private String code;
	private String value;
	private String scbz;

	// Constructors

	/** default constructor */
	public CzSczsk() {
	}

	/** full constructor */
	public CzSczsk(String pid, String code, String value, String scbz) {
		this.pid = pid;
		this.code = code;
		this.value = value;
		this.scbz = scbz;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}