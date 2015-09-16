package com.tansun.eam2.common.model.orm.bo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * WtdkFuncBackInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class WtdkFuncBackInfo extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	private String id;
	private String sheadId;
	private String hkdw;
	private String dkzh;
	private String hskm;
	private BigDecimal ncye;
	private Date bjhkrq;
	private BigDecimal bchkje;
	private BigDecimal bnljhkje;
	private BigDecimal hkhbjye;
	private String dywtdw;
	private BigDecimal nhfje;
	private String spjg;
	private String bz;
	private BigDecimal spje;
	private String xtjjzh;
	private String jjkhmc;
	private Double jjzhye;

	// Constructors

	/** default constructor */
	public WtdkFuncBackInfo() {
	}

	/** full constructor */
	public WtdkFuncBackInfo(String sheadId, String hkdw, String dkzh,
			String hskm, BigDecimal ncye, Date bjhkrq, BigDecimal bchkje,
			BigDecimal bnljhkje, BigDecimal hkhbjye, String dywtdw,
			BigDecimal nhfje, String spjg, String bz, BigDecimal spje,
			String xtjjzh, String jjkhmc, Double jjzhye) {
		this.sheadId = sheadId;
		this.hkdw = hkdw;
		this.dkzh = dkzh;
		this.hskm = hskm;
		this.ncye = ncye;
		this.bjhkrq = bjhkrq;
		this.bchkje = bchkje;
		this.bnljhkje = bnljhkje;
		this.hkhbjye = hkhbjye;
		this.dywtdw = dywtdw;
		this.nhfje = nhfje;
		this.spjg = spjg;
		this.bz = bz;
		this.spje = spje;
		this.xtjjzh = xtjjzh;
		this.jjkhmc = jjkhmc;
		this.jjzhye = jjzhye;
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

	public String getHkdw() {
		return this.hkdw;
	}

	public void setHkdw(String hkdw) {
		this.hkdw = hkdw;
	}

	public String getDkzh() {
		return this.dkzh;
	}

	public void setDkzh(String dkzh) {
		this.dkzh = dkzh;
	}

	public String getHskm() {
		return this.hskm;
	}

	public void setHskm(String hskm) {
		this.hskm = hskm;
	}

	public BigDecimal getNcye() {
		return this.ncye;
	}

	public void setNcye(BigDecimal ncye) {
		this.ncye = ncye;
	}

	public Date getBjhkrq() {
		return bjhkrq;
	}

	public void setBjhkrq(Date bjhkrq) {
		this.bjhkrq = bjhkrq;
	}

	public BigDecimal getBchkje() {
		return this.bchkje;
	}

	public void setBchkje(BigDecimal bchkje) {
		this.bchkje = bchkje;
	}

	public BigDecimal getBnljhkje() {
		return this.bnljhkje;
	}

	public void setBnljhkje(BigDecimal bnljhkje) {
		this.bnljhkje = bnljhkje;
	}

	public BigDecimal getHkhbjye() {
		return this.hkhbjye;
	}

	public void setHkhbjye(BigDecimal hkhbjye) {
		this.hkhbjye = hkhbjye;
	}

	public String getDywtdw() {
		return this.dywtdw;
	}

	public void setDywtdw(String dywtdw) {
		this.dywtdw = dywtdw;
	}

	public BigDecimal getNhfje() {
		return this.nhfje;
	}

	public void setNhfje(BigDecimal nhfje) {
		this.nhfje = nhfje;
	}

	public String getSpjg() {
		return this.spjg;
	}

	public void setSpjg(String spjg) {
		this.spjg = spjg;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public BigDecimal getSpje() {
		return this.spje;
	}

	public void setSpje(BigDecimal spje) {
		this.spje = spje;
	}

	public String getXtjjzh() {
		return xtjjzh;
	}

	public void setXtjjzh(String xtjjzh) {
		this.xtjjzh = xtjjzh;
	}

	public String getJjkhmc() {
		return jjkhmc;
	}

	public void setJjkhmc(String jjkhmc) {
		this.jjkhmc = jjkhmc;
	}

	public Double getJjzhye() {
		return jjzhye;
	}

	public void setJjzhye(Double jjzhye) {
		this.jjzhye = jjzhye;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}