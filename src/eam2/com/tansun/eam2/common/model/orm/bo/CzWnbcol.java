package com.tansun.eam2.common.model.orm.bo;

/**
 * CzWnbcol entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzWnbcol extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	// Fields

	private String wnbcolid;
	private String zdCode;
	private String zdName;
	private String colId;
	private String colName;
	private String colType;
	private String inputType;
	private String inputSize;
	private String islist;

	// Constructors

	/** default constructor */
	public CzWnbcol() {
	}

	/** minimal constructor */
	public CzWnbcol(String zdCode, String colId) {
		this.zdCode = zdCode;
		this.colId = colId;
	}

	/** full constructor */
	public CzWnbcol(String zdCode, String zdName, String colId, String colName,
			String colType, String inputType, String inputSize, String islist) {
		this.zdCode = zdCode;
		this.zdName = zdName;
		this.colId = colId;
		this.colName = colName;
		this.colType = colType;
		this.inputType = inputType;
		this.inputSize = inputSize;
		this.islist = islist;
	}

	// Property accessors

	public String getWnbcolid() {
		return this.wnbcolid;
	}

	public void setWnbcolid(String wnbcolid) {
		this.wnbcolid = wnbcolid;
	}

	public String getZdCode() {
		return this.zdCode;
	}

	public void setZdCode(String zdCode) {
		this.zdCode = zdCode;
	}

	public String getZdName() {
		return this.zdName;
	}

	public void setZdName(String zdName) {
		this.zdName = zdName;
	}

	public String getColId() {
		return this.colId;
	}

	public void setColId(String colId) {
		this.colId = colId;
	}

	public String getColName() {
		return this.colName;
	}

	public void setColName(String colName) {
		this.colName = colName;
	}

	public String getColType() {
		return this.colType;
	}

	public void setColType(String colType) {
		this.colType = colType;
	}

	public String getInputType() {
		return this.inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	public String getInputSize() {
		return this.inputSize;
	}

	public void setInputSize(String inputSize) {
		this.inputSize = inputSize;
	}

	public String getIslist() {
		return this.islist;
	}

	public void setIslist(String islist) {
		this.islist = islist;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}