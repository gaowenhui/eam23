package com.tansun.eam2.common.model.orm.bo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * DicAppAssettype2 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class DicAppAssettype2 extends CommonBO implements java.io.Serializable{

	// Fields

	private String assettype2Id;
	private String typecode;
	private String maincode;
	private Long typeorder;
	private String typename;
	private String orgid;
	private String memo1;
	private String memo2;

	// Constructors

	/** default constructor */
	public DicAppAssettype2() {
	}

	/** full constructor */
	public DicAppAssettype2(String typecode, String maincode, Long typeorder,
			String typename, String orgid, String memo1, String memo2) {
		this.typecode = typecode;
		this.maincode = maincode;
		this.typeorder = typeorder;
		this.typename = typename;
		this.orgid = orgid;
		this.memo1 = memo1;
		this.memo2 = memo2;
	}

	// Property accessors

	public String getAssettype2Id() {
		return this.assettype2Id;
	}

	public void setAssettype2Id(String assettype2Id) {
		this.assettype2Id = assettype2Id;
	}

	public String getTypecode() {
		return this.typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public String getMaincode() {
		return this.maincode;
	}

	public void setMaincode(String maincode) {
		this.maincode = maincode;
	}

	public Long getTypeorder() {
		return this.typeorder;
	}

	public void setTypeorder(Long typeorder) {
		this.typeorder = typeorder;
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