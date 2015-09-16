package com.tansun.eam2.common.model.orm.bo;

import java.util.ArrayList;
import java.util.List;

/**
 * ZyShead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ZyShead extends com.tansun.rdp4j.common.web.vo.CommonBO implements Cloneable,
		java.io.Serializable {

	// Fields

	public ZyShead clone(ZyShead head){
		try {
			return (ZyShead)head.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return null;
		}
	}
	private String sheadId;
	private String sheetType;
	private String title;
	private String sheetId;
	private String ngrq;
	private String ngrbh;
	private String ngrmc;
	private String ngbmbh;
	private String ngbmmc;
	private String ldxh;
	private String jhcd;
	private String ytxq;
	private String cgyj;
	private String ngbmyj;
	private String spbmyj;
	private String hqyj;
	private String ywyyzyj;
	private String ldpsyj;
	private String bdzt;
	private String ysrq;
	private String bfrq;
	private String hqbm;
	private String hqbmId;
	private String pdpc;

	private List bodys = new ArrayList();
	
	// Constructors

	/** default constructor */
	public ZyShead() {
	}

	/** full constructor */
	public ZyShead(String sheetType, String title, String sheetId, String ngrq,
			String ngrbh, String ngrmc, String ngbmbh, String ngbmmc,
			String ldxh, String jhcd, String ytxq, String cgyj, String ngbmyj,
			String spbmyj, String hqyj, String ywyyzyj, String ldpsyj,
			String bdzt, String ysrq, String bfrq) {
		this.sheetType = sheetType;
		this.title = title;
		this.sheetId = sheetId;
		this.ngrq = ngrq;
		this.ngrbh = ngrbh;
		this.ngrmc = ngrmc;
		this.ngbmbh = ngbmbh;
		this.ngbmmc = ngbmmc;
		this.ldxh = ldxh;
		this.jhcd = jhcd;
		this.ytxq = ytxq;
		this.cgyj = cgyj;
		this.ngbmyj = ngbmyj;
		this.spbmyj = spbmyj;
		this.hqyj = hqyj;
		this.ywyyzyj = ywyyzyj;
		this.ldpsyj = ldpsyj;
		this.bdzt = bdzt;
		this.ysrq = ysrq;
		this.bfrq = bfrq;
	}

	// Property accessors

	public String getSheadId() {
		return this.sheadId;
	}

	public void setSheadId(String sheadId) {
		this.sheadId = sheadId;
	}

	public String getSheetType() {
		return this.sheetType;
	}

	public void setSheetType(String sheetType) {
		this.sheetType = sheetType;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSheetId() {
		return this.sheetId;
	}

	public void setSheetId(String sheetId) {
		this.sheetId = sheetId;
	}

	public String getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(String ngrq) {
		this.ngrq = ngrq;
	}

	public String getNgrbh() {
		return this.ngrbh;
	}

	public void setNgrbh(String ngrbh) {
		this.ngrbh = ngrbh;
	}

	public String getNgrmc() {
		return this.ngrmc;
	}

	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}

	public String getNgbmbh() {
		return this.ngbmbh;
	}

	public void setNgbmbh(String ngbmbh) {
		this.ngbmbh = ngbmbh;
	}

	public String getNgbmmc() {
		return this.ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getLdxh() {
		return this.ldxh;
	}

	public void setLdxh(String ldxh) {
		this.ldxh = ldxh;
	}

	public String getJhcd() {
		return this.jhcd;
	}

	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}

	public String getYtxq() {
		return this.ytxq;
	}

	public void setYtxq(String ytxq) {
		this.ytxq = ytxq;
	}

	public String getCgyj() {
		return this.cgyj;
	}

	public void setCgyj(String cgyj) {
		this.cgyj = cgyj;
	}

	public String getNgbmyj() {
		return this.ngbmyj;
	}

	public void setNgbmyj(String ngbmyj) {
		this.ngbmyj = ngbmyj;
	}

	public String getSpbmyj() {
		return this.spbmyj;
	}

	public void setSpbmyj(String spbmyj) {
		this.spbmyj = spbmyj;
	}

	public String getHqyj() {
		return this.hqyj;
	}

	public void setHqyj(String hqyj) {
		this.hqyj = hqyj;
	}

	public String getYwyyzyj() {
		return this.ywyyzyj;
	}

	public void setYwyyzyj(String ywyyzyj) {
		this.ywyyzyj = ywyyzyj;
	}

	public String getLdpsyj() {
		return this.ldpsyj;
	}

	public void setLdpsyj(String ldpsyj) {
		this.ldpsyj = ldpsyj;
	}

	public String getBdzt() {
		return this.bdzt;
	}

	public void setBdzt(String bdzt) {
		this.bdzt = bdzt;
	}

	public String getYsrq() {
		return this.ysrq;
	}

	public void setYsrq(String ysrq) {
		this.ysrq = ysrq;
	}

	public String getBfrq() {
		return this.bfrq;
	}

	public void setBfrq(String bfrq) {
		this.bfrq = bfrq;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getHqbm() {
		return hqbm;
	}

	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}

	public String getHqbmId() {
		return hqbmId;
	}

	public void setHqbmId(String hqbmId) {
		this.hqbmId = hqbmId;
	}

	public String getPdpc() {
		return pdpc;
	}

	public void setPdpc(String pdpc) {
		this.pdpc = pdpc;
	}

	public List getBodys() {
		return bodys;
	}

	public void setBodys(List bodys) {
		this.bodys = bodys;
	}

}