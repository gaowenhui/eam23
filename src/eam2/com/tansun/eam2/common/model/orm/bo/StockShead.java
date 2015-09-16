package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * StockShead entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockShead extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	//系统内部编号 
	private String sheadId;
	//表单类型
	private String sheetType;
	//表单标题
	private String title;
	//表单呈送
	private String chengsong;
	//流程Id
	private String lcId;
	//表单编号
	private String sheetId;
	//拟稿日期
	private Date ngrq;
	//拟稿人编号
	private String ngrbh;
	//拟稿人名称
	private String ngrmc;
	//拟稿部门编号
	private String ngbmbh;
	//拟稿部门名称
	private String ngbmmc;
	//联系电话
	private String ldxh;
	//急缓程度
	private String jhcd;
	//表单状态
	private String bdzt;
	//备注
	private String bz;
	//会签部门
	private String hqbm;
	//会签部门id;
	private String hqbmid;
	
	private String lcmc;
	public String getLcmc() {
		return lcmc;
	}
	public void setLcmc(String lcmc) {
		this.lcmc = lcmc;
	}
	public String getSheadId() {
		return sheadId;
	}
	public void setSheadId(String sheadId) {
		this.sheadId = sheadId;
	}
	public String getSheetType() {
		return sheetType;
	}
	public void setSheetType(String sheetType) {
		this.sheetType = sheetType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChengsong() {
		return chengsong;
	}
	public void setChengsong(String chengsong) {
		this.chengsong = chengsong;
	}
	public String getSheetId() {
		return sheetId;
	}
	public void setSheetId(String sheetId) {
		this.sheetId = sheetId;
	}
	public Date getNgrq() {
		return ngrq;
	}
	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}
	public String getNgrbh() {
		return ngrbh;
	}
	public void setNgrbh(String ngrbh) {
		this.ngrbh = ngrbh;
	}
	public String getNgrmc() {
		return ngrmc;
	}
	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}
	public String getNgbmbh() {
		return ngbmbh;
	}
	public void setNgbmbh(String ngbmbh) {
		this.ngbmbh = ngbmbh;
	}
	public String getNgbmmc() {
		return ngbmmc;
	}
	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}
	public String getLdxh() {
		return ldxh;
	}
	public void setLdxh(String ldxh) {
		this.ldxh = ldxh;
	}
	public String getJhcd() {
		return jhcd;
	}
	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}
	public String getBdzt() {
		return bdzt;
	}
	public void setBdzt(String bdzt) {
		this.bdzt = bdzt;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getHqbm() {
		return hqbm;
	}
	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}
	public String getHqbmid() {
		return hqbmid;
	}
	public void setHqbmid(String hqbmid) {
		this.hqbmid = hqbmid;
	}
	public String getLcId() {
		return lcId;
	}
	public void setLcId(String lcId) {
		this.lcId = lcId;
	}
	public StockShead(String sheadId, String sheetType, String title,
			String chengsong, String sheetId, Date ngrq, String ngrbh,
			String ngrmc, String ngbmbh, String ngbmmc, String ldxh,
			String jhcd, String bdzt, String bz, String hqbm, String hqbmid) {
		super();
		this.sheadId = sheadId;
		this.sheetType = sheetType;
		this.title = title;
		this.chengsong = chengsong;
		this.sheetId = sheetId;
		this.ngrq = ngrq;
		this.ngrbh = ngrbh;
		this.ngrmc = ngrmc;
		this.ngbmbh = ngbmbh;
		this.ngbmmc = ngbmmc;
		this.ldxh = ldxh;
		this.jhcd = jhcd;
		this.bdzt = bdzt;
		this.bz = bz;
		this.hqbm = hqbm;
		this.hqbmid = hqbmid;
	}
	public StockShead() {
		super();
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}