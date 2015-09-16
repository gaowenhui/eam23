package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * StockSdzmzXx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockSdzmzXx extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {
	private static final long serialVersionUID = -9005062094182433942L;
	private String id;
	//项目ID
	private String xmId;
	//时点
	private Date shidian;
	//账面值
	private Double zmz;
	//减值准备
	private Double jzzb;
	//备注
	private String beizhu;

	// Constructors

	/** default constructor */
	public StockSdzmzXx() {
	}

	/** full constructor */
	public StockSdzmzXx(String xmId, Date shidian, Double zmz, Double jzzb,
			String beizhu) {
		this.xmId = xmId;
		this.shidian = shidian;
		this.zmz = zmz;
		this.jzzb = jzzb;
		this.beizhu = beizhu;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getXmId() {
		return this.xmId;
	}

	public void setXmId(String xmId) {
		this.xmId = xmId;
	}

	public Date getShidian() {
		return this.shidian;
	}

	public void setShidian(Date shidian) {
		this.shidian = shidian;
	}

	public Double getZmz() {
		return this.zmz;
	}

	public void setZmz(Double zmz) {
		this.zmz = zmz;
	}

	public Double getJzzb() {
		return this.jzzb;
	}

	public void setJzzb(Double jzzb) {
		this.jzzb = jzzb;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}