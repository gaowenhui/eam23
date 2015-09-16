package com.tansun.eam.quequan.model;

/**
 * ETCldLZc entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ETCldLZcBO implements java.io.Serializable {

	// Fields

	private String tid;
	private Long zcbh;
	private Long cldbh;

	// Constructors

	/** default constructor */
	public ETCldLZcBO() {
	}

	/** minimal constructor */
	public ETCldLZcBO(String tid) {
		this.tid = tid;
	}

	/** full constructor */
	public ETCldLZcBO(String tid, Long zcbh, Long cldbh) {
		this.tid = tid;
		this.zcbh = zcbh;
		this.cldbh = cldbh;
	}

	// Property accessors

	public String getTid() {
		return this.tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public Long getZcbh() {
		return this.zcbh;
	}

	public void setZcbh(Long zcbh) {
		this.zcbh = zcbh;
	}

	public Long getCldbh() {
		return this.cldbh;
	}

	public void setCldbh(Long cldbh) {
		this.cldbh = cldbh;
	}

}