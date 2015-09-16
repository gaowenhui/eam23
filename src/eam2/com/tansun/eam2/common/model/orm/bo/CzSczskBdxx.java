package com.tansun.eam2.common.model.orm.bo;

/**
 * CzSczskBdxx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzSczskBdxx extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -6168069974019474011L;
	private String id;
	private String cldId;
	private String bdqfid;
	private String bdhfid;
	private String bdfs;
	private String bdqbh;
	private String bdhbh;
	private String bdqz;
	private String bdhz;
	private String zskId;
	private String spjg;

	// Constructors

	/** default constructor */
	public CzSczskBdxx() {
	}

	/** full constructor */
	public CzSczskBdxx(String cldId, String bdqfid, String bdhfid, String bdfs,
			String bdqbh, String bdhbh, String bdqz, String bdhz, String zskId,
			String spjg) {
		this.cldId = cldId;
		this.bdqfid = bdqfid;
		this.bdhfid = bdhfid;
		this.bdfs = bdfs;
		this.bdqbh = bdqbh;
		this.bdhbh = bdhbh;
		this.bdqz = bdqz;
		this.bdhz = bdhz;
		this.zskId = zskId;
		this.spjg = spjg;
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

	public String getBdqfid() {
		return this.bdqfid;
	}

	public void setBdqfid(String bdqfid) {
		this.bdqfid = bdqfid;
	}

	public String getBdhfid() {
		return this.bdhfid;
	}

	public void setBdhfid(String bdhfid) {
		this.bdhfid = bdhfid;
	}

	public String getBdfs() {
		return this.bdfs;
	}

	public void setBdfs(String bdfs) {
		this.bdfs = bdfs;
	}

	public String getBdqbh() {
		return this.bdqbh;
	}

	public void setBdqbh(String bdqbh) {
		this.bdqbh = bdqbh;
	}

	public String getBdhbh() {
		return this.bdhbh;
	}

	public void setBdhbh(String bdhbh) {
		this.bdhbh = bdhbh;
	}

	public String getBdqz() {
		return this.bdqz;
	}

	public void setBdqz(String bdqz) {
		this.bdqz = bdqz;
	}

	public String getBdhz() {
		return this.bdhz;
	}

	public void setBdhz(String bdhz) {
		this.bdhz = bdhz;
	}

	public String getZskId() {
		return this.zskId;
	}

	public void setZskId(String zskId) {
		this.zskId = zskId;
	}

	public String getSpjg() {
		return this.spjg;
	}

	public void setSpjg(String spjg) {
		this.spjg = spjg;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}