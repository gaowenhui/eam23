package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * StockInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockInfo extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	//债券ID,UUID
	private String id;
	//建行分行id
	private String jhfhid;
	//建行分行编码
	private String jhfhbm;
	//建行分行名称
	private String jhfhmc;
	//债券种类ID,
	private String zqzlid;
	//债券种类编码
	private String zqzlbm;
	//债券种类名称
	private String zqzlmc;
	//债券名称
	private String zqmc;
	//到期日
	private Date dqr;
	//债券面值核算科目
	private String zqmzhskm;
	//金额1
	private Double je1;
	//应收利息核算科目
	private String yslxhskm;
	//金额2
	private Double je2;
	//备注
	private String bz;
	//项目id
	private String xmId;
	//项目名称
	private String xmmc;
	// Constructors

	public String getXmId() {
		return xmId;
	}

	public void setXmId(String xmId) {
		this.xmId = xmId;
	}

	private String CZcqs;
	private String wtrmc;

	// Constructors

	/** default constructor */
	public StockInfo() {
	}

	/** full constructor */
	public StockInfo(String jhfhid, String jhfhbm, String jhfhmc,
			String zqzlid, String zqzlbm, String zqzlmc, String zqmc, Date dqr,
			String zqmzhskm, Double je1, String yslxhskm, Double je2,
			String bz, String xmId, String xmmc, String CZcqs, String wtrmc) {
		this.jhfhid = jhfhid;
		this.jhfhbm = jhfhbm;
		this.jhfhmc = jhfhmc;
		this.zqzlid = zqzlid;
		this.zqzlbm = zqzlbm;
		this.zqzlmc = zqzlmc;
		this.zqmc = zqmc;
		this.dqr = dqr;
		this.zqmzhskm = zqmzhskm;
		this.je1 = je1;
		this.yslxhskm = yslxhskm;
		this.je2 = je2;
		this.bz = bz;
		this.xmId = xmId;
		this.xmmc = xmmc;
		this.CZcqs = CZcqs;
		this.wtrmc = wtrmc;
	}


	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJhfhid() {
		return this.jhfhid;
	}

	public void setJhfhid(String jhfhid) {
		this.jhfhid = jhfhid;
	}

	public String getJhfhbm() {
		return this.jhfhbm;
	}

	public void setJhfhbm(String jhfhbm) {
		this.jhfhbm = jhfhbm;
	}

	public String getJhfhmc() {
		return this.jhfhmc;
	}

	public void setJhfhmc(String jhfhmc) {
		this.jhfhmc = jhfhmc;
	}

	public String getZqzlid() {
		return this.zqzlid;
	}

	public void setZqzlid(String zqzlid) {
		this.zqzlid = zqzlid;
	}

	public String getZqzlbm() {
		return this.zqzlbm;
	}

	public void setZqzlbm(String zqzlbm) {
		this.zqzlbm = zqzlbm;
	}

	public String getZqzlmc() {
		return this.zqzlmc;
	}

	public void setZqzlmc(String zqzlmc) {
		this.zqzlmc = zqzlmc;
	}

	public String getZqmc() {
		return this.zqmc;
	}

	public void setZqmc(String zqmc) {
		this.zqmc = zqmc;
	}

	public Date getDqr() {
		return this.dqr;
	}

	public void setDqr(Date dqr) {
		this.dqr = dqr	;
		}

	public String getZqmzhskm() {
		return this.zqmzhskm;
	}

	public void setZqmzhskm(String zqmzhskm) {
		this.zqmzhskm = zqmzhskm;
	}

	public Double getJe1() {
		return this.je1;
	}

	public void setJe1(Double je1) {
		this.je1 = je1;
	}

	public String getYslxhskm() {
		return this.yslxhskm;
	}

	public void setYslxhskm(String yslxhskm) {
		this.yslxhskm = yslxhskm;
	}

	public Double getJe2() {
		return this.je2;
	}

	public void setJe2(Double je2) {
		this.je2 = je2;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public String getCZcqs() {
		return CZcqs;
	}

	public void setCZcqs(String zcqs) {
		CZcqs = zcqs;
	}

	public String getWtrmc() {
		return wtrmc;
	}

	public void setWtrmc(String wtrmc) {
		this.wtrmc = wtrmc;
	}
	
}