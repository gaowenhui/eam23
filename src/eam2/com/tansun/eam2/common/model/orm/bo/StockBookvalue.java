package com.tansun.eam2.common.model.orm.bo;

/**
 * StockBookvalue entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockBookvalue extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	//债券面值id
	private String id;
	//债券ID
	private String stockid;
	//债券名称
	private String zqmc;
	//年份
	private String nf;
	//债券面值_年初
	private Double zqmz;
	//投资减持准备_年初
	private Double tzjczb;
	//债券投资净额_年初
	private Double zqtzje;
	//应收利息_年初
	private Double yslx;
	//应收利息坏账准备_年初
	private Double yslxhzzb;
	//应收利息净额_年初
	private Double yslxje;
	//债券面值_年末
	private Double zqmz2;
	//投资减持准备_年末
	private Double tzjczb2;
	//债券投资净额_年末
	private Double zqtzje2;
	//应收利息_年末
	private Double yslx2;
	//应收利息坏账准备_年末
	private Double yslxhzzb2;
	//应收利息净额_年末
	private Double yslxje2;
	//备注
	private String bz;
	//债券投资损益(年初)
	private Double tzsync;
	//债券投资损益(年末)
	private Double tzsynm;
	// Constructors

	/** default constructor */
	public StockBookvalue() {
	}

	/** full constructor */
	public StockBookvalue(String stockid, String zqmc, String nf, Double zqmz,
			Double tzjczb, Double zqtzje, Double yslx, Double yslxhzzb,
			Double yslxje, Double zqmz2, Double tzjczb2, Double zqtzje2,
			Double yslx2, Double yslxhzzb2, Double yslxje2, String bz,Double tzsync,Double tzsynm) {
		this.stockid = stockid;
		this.zqmc = zqmc;
		this.nf = nf;
		this.zqmz = zqmz;
		this.tzjczb = tzjczb;
		this.zqtzje = zqtzje;
		this.yslx = yslx;
		this.yslxhzzb = yslxhzzb;
		this.yslxje = yslxje;
		this.zqmz2 = zqmz2;
		this.tzjczb2 = tzjczb2;
		this.zqtzje2 = zqtzje2;
		this.yslx2 = yslx2;
		this.yslxhzzb2 = yslxhzzb2;
		this.yslxje2 = yslxje2;
		this.bz = bz;
		this.tzsynm = tzsynm;
		this.tzsync = tzsync;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStockid() {
		return this.stockid;
	}

	public void setStockid(String stockid) {
		this.stockid = stockid;
	}

	public String getZqmc() {
		return this.zqmc;
	}

	public void setZqmc(String zqmc) {
		this.zqmc = zqmc;
	}

	public String getNf() {
		return this.nf;
	}

	public void setNf(String nf) {
		this.nf = nf;
	}

	public Double getZqmz() {
		return this.zqmz;
	}

	public void setZqmz(Double zqmz) {
		this.zqmz = zqmz;
	}

	public Double getTzjczb() {
		return this.tzjczb;
	}

	public void setTzjczb(Double tzjczb) {
		this.tzjczb = tzjczb;
	}

	public Double getZqtzje() {
		return this.zqtzje;
	}

	public void setZqtzje(Double zqtzje) {
		this.zqtzje = zqtzje;
	}

	public Double getYslx() {
		return this.yslx;
	}

	public void setYslx(Double yslx) {
		this.yslx = yslx;
	}

	public Double getYslxhzzb() {
		return this.yslxhzzb;
	}

	public void setYslxhzzb(Double yslxhzzb) {
		this.yslxhzzb = yslxhzzb;
	}

	public Double getYslxje() {
		return this.yslxje;
	}

	public void setYslxje(Double yslxje) {
		this.yslxje = yslxje;
	}

	public Double getZqmz2() {
		return this.zqmz2;
	}

	public void setZqmz2(Double zqmz2) {
		this.zqmz2 = zqmz2;
	}

	public Double getTzjczb2() {
		return this.tzjczb2;
	}

	public void setTzjczb2(Double tzjczb2) {
		this.tzjczb2 = tzjczb2;
	}

	public Double getZqtzje2() {
		return this.zqtzje2;
	}

	public void setZqtzje2(Double zqtzje2) {
		this.zqtzje2 = zqtzje2;
	}

	public Double getYslx2() {
		return this.yslx2;
	}

	public void setYslx2(Double yslx2) {
		this.yslx2 = yslx2;
	}

	public Double getYslxhzzb2() {
		return this.yslxhzzb2;
	}

	public void setYslxhzzb2(Double yslxhzzb2) {
		this.yslxhzzb2 = yslxhzzb2;
	}

	public Double getYslxje2() {
		return this.yslxje2;
	}

	public void setYslxje2(Double yslxje2) {
		this.yslxje2 = yslxje2;
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

	public Double getTzsync() {
		return tzsync;
	}

	public void setTzsync(Double tzsync) {
		this.tzsync = tzsync;
	}

	public Double getTzsynm() {
		return tzsynm;
	}

	public void setTzsynm(Double tzsynm) {
		this.tzsynm = tzsynm;
	}

}