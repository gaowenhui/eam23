package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccGlacaaca entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccGlacaaca extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccGlacaacaId id;

	// Constructors

	/** default constructor */
	public CrtDccGlacaaca() {
	}

	/** full constructor */
	public CrtDccGlacaaca(CrtDccGlacaacaId id) {
		this.id = id;
	}

	// Property accessors

	public CrtDccGlacaacaId getId() {
		return this.id;
	}

	public void setId(CrtDccGlacaacaId id) {
		this.id = id;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}