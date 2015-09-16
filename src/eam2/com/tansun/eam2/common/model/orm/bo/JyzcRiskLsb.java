package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * JyzcRiskLsb entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class JyzcRiskLsb extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = 1152618924977876119L;
	private String id;
	private String CFxlx;
	private String fxbh;
	private String fxms;
	private String fxzt;
	private String fxkz;
	private Date lrrq;
	private String lrrbh;
	private String lrr;
	private String zcId;
	private String zhuangtai;
	private String cldId;

	// Constructors

	/** default constructor */
	public JyzcRiskLsb() {
	}

	/** full constructor */
	public JyzcRiskLsb(String CFxlx, String fxbh, String fxms, String fxzt,
			String fxkz, Date lrrq, String lrrbh, String lrr, String zcId,
			String zhuangtai, String cldId) {
		this.CFxlx = CFxlx;
		this.fxbh = fxbh;
		this.fxms = fxms;
		this.fxzt = fxzt;
		this.fxkz = fxkz;
		this.lrrq = lrrq;
		this.lrrbh = lrrbh;
		this.lrr = lrr;
		this.zcId = zcId;
		this.zhuangtai = zhuangtai;
		this.cldId = cldId;
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

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getZhuangtai() {
		return this.zhuangtai;
	}

	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getCldId() {
		return cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

}