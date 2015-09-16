package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * StockWorklog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockWorklog extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	//工作日志ID
	private String logid;
	//债券ID
	private String stockid;
	//催办人ID
	private String cbrid;
	//催办人名称
	private String cbrmc;
	//催办日期
	private Date cbrq;
	//催办方式编码
	private String cbfsbm;
	//催办方式名称
	private String cbfsmc;
	//债务负责人
	private String zwfzr;
	//债务负责人电话
	private String zwfzrdh;
	//办理结果
	private String bljg;
	//备注
	private String bz;
	//是否保存
	private String sfbc;
	// Constructors

	/** default constructor */
	public StockWorklog() {
	}

	/** full constructor */
	public StockWorklog(String stockid, String cbrid, String cbrmc, Date cbrq,
			String cbfsbm, String cbfsmc, String zwfzr, String zwfzrdh,
			String bljg, String bz ,String sfbc) {
		this.stockid = stockid;
		this.cbrid = cbrid;
		this.cbrmc = cbrmc;
		this.cbrq = cbrq;
		this.cbfsbm = cbfsbm;
		this.cbfsmc = cbfsmc;
		this.zwfzr = zwfzr;
		this.zwfzrdh = zwfzrdh;
		this.bljg = bljg;
		this.bz = bz;
		this.sfbc = sfbc;
	}

	// Property accessors

	public String getLogid() {
		return this.logid;
	}

	public void setLogid(String logid) {
		this.logid = logid;
	}

	public String getStockid() {
		return this.stockid;
	}

	public void setStockid(String stockid) {
		this.stockid = stockid;
	}

	public String getCbrid() {
		return this.cbrid;
	}

	public void setCbrid(String cbrid) {
		this.cbrid = cbrid;
	}

	public String getCbrmc() {
		return this.cbrmc;
	}

	public void setCbrmc(String cbrmc) {
		this.cbrmc = cbrmc;
	}

	public Date getCbrq() {
		return this.cbrq;
	}

	public void setCbrq(Date cbrq) {
		this.cbrq = cbrq;
	}

	public String getCbfsbm() {
		return this.cbfsbm;
	}

	public void setCbfsbm(String cbfsbm) {
		this.cbfsbm = cbfsbm;
	}

	public String getCbfsmc() {
		return this.cbfsmc;
	}

	public void setCbfsmc(String cbfsmc) {
		this.cbfsmc = cbfsmc;
	}

	public String getZwfzr() {
		return this.zwfzr;
	}

	public void setZwfzr(String zwfzr) {
		this.zwfzr = zwfzr;
	}

	public String getZwfzrdh() {
		return this.zwfzrdh;
	}

	public void setZwfzrdh(String zwfzrdh) {
		this.zwfzrdh = zwfzrdh;
	}

	public String getBljg() {
		return this.bljg;
	}

	public void setBljg(String bljg) {
		this.bljg = bljg;
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

	public String getSfbc() {
		return sfbc;
	}

	public void setSfbc(String sfbc) {
		this.sfbc = sfbc;
	}

}