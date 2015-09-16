package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * StockSbody entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockSbody extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields
	//ID,uuid
	private String id;
	//表单ID
	private String sheadId;
	//债券ID,UUID
	private String stockId;
	//建行分行名称
	private String jhfhmc;
	//债券种类名称
	private String zqzlmc;
	//债券名称
	private String zqmc;
	//到期日
	private Date dqr;
	//债券最新面值年初
	private Double zqzxmznc;
	//债券最新面值年末
	private Double zqzxmznm;

	// Constructors

	/** default constructor */
	public StockSbody() {
	}

	/** minimal constructor */
	public StockSbody(String stockId) {
		this.stockId = stockId;
	}

	/** full constructor */
	public StockSbody(String sheadId, String stockId, String jhfhmc,
			String zqzlmc, String zqmc, Date dqr, Double zqzxmznc,
			Double zqzxmznm) {
		this.sheadId = sheadId;
		this.stockId = stockId;
		this.jhfhmc = jhfhmc;
		this.zqzlmc = zqzlmc;
		this.zqmc = zqmc;
		this.dqr = dqr;
		this.zqzxmznc = zqzxmznc;
		this.zqzxmznm = zqzxmznm;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSheadId() {
		return this.sheadId;
	}

	public void setSheadId(String sheadId) {
		this.sheadId = sheadId;
	}

	public String getStockId() {
		return this.stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public String getJhfhmc() {
		return this.jhfhmc;
	}

	public void setJhfhmc(String jhfhmc) {
		this.jhfhmc = jhfhmc;
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
		this.dqr = dqr;
	}

	public Double getZqzxmznc() {
		return this.zqzxmznc;
	}

	public void setZqzxmznc(Double zqzxmznc) {
		this.zqzxmznc = zqzxmznc;
	}

	public Double getZqzxmznm() {
		return this.zqzxmznm;
	}

	public void setZqzxmznm(Double zqzxmznm) {
		this.zqzxmznm = zqzxmznm;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}