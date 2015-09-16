package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * DebtWorklog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class DebtWorklog extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields

	//债权工作日志ID,UUID债权工作日志ID,UUID
	private String id;
	//催收人ID
	private String csr;
	//催收人姓名
	private String csrmc;
	//催收时间
	private Date cssj;
	//催收方式
	private String csfs;
	//债务负责人
	private String zwfzr;
	//债务负责人电话
	private String zwfzrdh;
	//办理结果
	private String bljg;
	//备注
	private String bz;
	//对应债券ID
	private String zqid;
	//是否保存
	private String sfbc;
	// Constructors

	public String getSfbc() {
		return sfbc;
	}

	public void setSfbc(String sfbc) {
		this.sfbc = sfbc;
	}

	/** default constructor */
	public DebtWorklog() {
	}

	/** full constructor */
	public DebtWorklog(String csr, String csrmc, Date cssj, String csfs,
			String zwfzr, String zwfzrdh, String bljg, String bz, String zqid,String sfbc) {
		this.csr = csr;
		this.csrmc = csrmc;
		this.cssj = cssj;
		this.csfs = csfs;
		this.zwfzr = zwfzr;
		this.zwfzrdh = zwfzrdh;
		this.bljg = bljg;
		this.bz = bz;
		this.zqid = zqid;
		this.sfbc = sfbc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCsr() {
		return this.csr;
	}

	public void setCsr(String csr) {
		this.csr = csr;
	}

	public String getCsrmc() {
		return this.csrmc;
	}

	public void setCsrmc(String csrmc) {
		this.csrmc = csrmc;
	}

	public Date getCssj() {
		return this.cssj;
	}

	public void setCssj(Date cssj) {
		this.cssj = cssj;
	}

	public String getCsfs() {
		return this.csfs;
	}

	public void setCsfs(String csfs) {
		this.csfs = csfs;
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

	public String getZqid() {
		return this.zqid;
	}

	public void setZqid(String zqid) {
		this.zqid = zqid;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}