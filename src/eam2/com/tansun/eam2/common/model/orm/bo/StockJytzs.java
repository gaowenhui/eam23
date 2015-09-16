package com.tansun.eam2.common.model.orm.bo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * StockJytzs entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockJytzs extends CommonBO implements java.io.Serializable{

	// Fields

	private String id;
	private String nf;
	private Double zqmz;
	private Double tzjczb;
	private Double zqtzje;
	private Double yslx;
	private Double yslxhzzb;
	private Double yslxje;
	private Double zqmz2;
	private Double tzjczb2;
	private Double zqtzje2;
	private Double yslx2;
	private Double yslxhzzb2;
	private Double yslxje2;

	// Constructors

	/** default constructor */
	public StockJytzs() {
	}

	/** full constructor */
	public StockJytzs(String nf, Double zqmz, Double tzjczb, Double zqtzje,
			Double yslx, Double yslxhzzb, Double yslxje, Double zqmz2,
			Double tzjczb2, Double zqtzje2, Double yslx2, Double yslxhzzb2,
			Double yslxje2) {
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
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}