package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * JyzcRisk entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class JyzcRisk extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	private static final long serialVersionUID = -2137480621601908033L;
	private String id;
	private String CFxlx;
	private String fxbh;
	private String fxms;
	private String fxzt;
	private String fxkz;
	private Date lrrq;
	private String lrrbh;
	private String lrr;
	private String zczsbId;

	// Constructors

	/** default constructor */
	public JyzcRisk() {
	}

	/** full constructor */
	public JyzcRisk(String CFxlx, String fxbh, String fxms, String fxzt,
			String fxkz, Date lrrq, String lrrbh, String lrr, String zczsbId) {
		this.CFxlx = CFxlx;
		this.fxbh = fxbh;
		this.fxms = fxms;
		this.fxzt = fxzt;
		this.fxkz = fxkz;
		this.lrrq = lrrq;
		this.lrrbh = lrrbh;
		this.lrr = lrr;
		this.zczsbId = zczsbId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCFxlx() {
		return this.CFxlx;
	}

	public void setCFxlx(String CFxlx) {
		this.CFxlx = CFxlx;
	}

	public String getFxbh() {
		return this.fxbh;
	}

	public void setFxbh(String fxbh) {
		this.fxbh = fxbh;
	}

	public String getFxms() {
		return this.fxms;
	}

	public void setFxms(String fxms) {
		this.fxms = fxms;
	}

	public String getFxzt() {
		return this.fxzt;
	}

	public void setFxzt(String fxzt) {
		this.fxzt = fxzt;
	}

	public String getFxkz() {
		return this.fxkz;
	}

	public void setFxkz(String fxkz) {
		this.fxkz = fxkz;
	}

	public Date getLrrq() {
		return this.lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}

	public String getLrrbh() {
		return this.lrrbh;
	}

	public void setLrrbh(String lrrbh) {
		this.lrrbh = lrrbh;
	}

	public String getLrr() {
		return this.lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public String getZczsbId() {
		return this.zczsbId;
	}

	public void setZczsbId(String zczsbId) {
		this.zczsbId = zczsbId;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}