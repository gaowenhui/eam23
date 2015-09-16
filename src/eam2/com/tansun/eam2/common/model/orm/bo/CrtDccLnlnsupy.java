package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccLnlnsupy entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccLnlnsupy extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccLnlnsupyId id;

	// Constructors

	/** default constructor */
	public CrtDccLnlnsupy() {
	}

	/** full constructor */
	public CrtDccLnlnsupy(CrtDccLnlnsupyId id) {
		this.id = id;
	}

	// Property accessors

	public CrtDccLnlnsupyId getId() {
		return this.id;
	}

	public void setId(CrtDccLnlnsupyId id) {
		this.id = id;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}