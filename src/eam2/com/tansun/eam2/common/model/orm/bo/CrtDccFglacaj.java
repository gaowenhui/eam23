package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccFglacaj entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccFglacaj extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccFglacajId id;

	// Constructors

	/** default constructor */
	public CrtDccFglacaj() {
	}

	/** full constructor */
	public CrtDccFglacaj(CrtDccFglacajId id) {
		this.id = id;
	}

	// Property accessors

	public CrtDccFglacajId getId() {
		return this.id;
	}

	public void setId(CrtDccFglacajId id) {
		this.id = id;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}