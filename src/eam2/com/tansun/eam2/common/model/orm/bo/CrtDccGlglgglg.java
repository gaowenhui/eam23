package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtDccGlglgglg entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtDccGlglgglg extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtDccGlglgglgId id;

	// Constructors

	/** default constructor */
	public CrtDccGlglgglg() {
	}

	/** full constructor */
	public CrtDccGlglgglg(CrtDccGlglgglgId id) {
		this.id = id;
	}

	// Property accessors

	public CrtDccGlglgglgId getId() {
		return this.id;
	}

	public void setId(CrtDccGlglgglgId id) {
		this.id = id;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}