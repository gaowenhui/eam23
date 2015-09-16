package com.tansun.eam2.common.model.orm.bo;

/**
 * CrtLoanType entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CrtLoanType extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private CrtLoanTypeId id;

	// Constructors

	/** default constructor */
	public CrtLoanType() {
	}

	/** full constructor */
	public CrtLoanType(CrtLoanTypeId id) {
		this.id = id;
	}

	// Property accessors

	public CrtLoanTypeId getId() {
		return this.id;
	}

	public void setId(CrtLoanTypeId id) {
		this.id = id;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}