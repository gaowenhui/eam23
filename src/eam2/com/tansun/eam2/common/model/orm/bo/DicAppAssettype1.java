package com.tansun.eam2.common.model.orm.bo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * DicAppAssettype1 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class DicAppAssettype1 extends CommonBO implements java.io.Serializable{

	// Fields

	private String assettype1Id;
	private String typecode;
	private Long typeorder;
	private String typearea;
	private String typename;
	private String orgid;
	private String memo1;
	private String memo2;

	// Constructors

	/** default constructor */
	public DicAppAssettype1() {
	}

	/** full constructor */
	public DicAppAssettype1(String typecode, Long typeorder, String typearea,
			String typename, String orgid, String memo1, String memo2) {
		this.typecode = typecode;
		this.typeorder = typeorder;
		this.typearea = typearea;
		this.typename = typename;
		this.orgid = orgid;
		this.memo1 = memo1;
		this.memo2 = memo2;
	}

	// Property accessors

	public String getAssettype1Id() {
		return this.assettype1Id;
	}

	public void setAssettype1Id(String assettype1Id) {
		this.assettype1Id = assettype1Id;
	}

	public String getTypecode() {
		return this.typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public Long getTypeorder() {
		return this.typeorder;
	}

	public void setTypeorder(Long typeorder) {
		this.typeorder = typeorder;
	}

	public String getTypearea() {
		return this.typearea;
	}

	public void setTypearea(String typearea) {
		this.typearea = typearea;
	}

	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getOrgid() {
		return this.orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getMemo1() {
		return this.memo1;
	}

	public void setMemo1(String memo1) {
		this.memo1 = memo1;
	}

	public String getMemo2() {
		return this.memo2;
	}

	public void setMemo2(String memo2) {
		this.memo2 = memo2;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}