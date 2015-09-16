package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * CzPgscJl entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzPgscJl extends CommonBO implements java.io.Serializable {
	private static final long serialVersionUID = -45334699536079845L;
	private String id;
	private String cldId;
	private String oldId;
	private String pid;
	private String code;
	private String value;
	private String CScjl;
	private String tjyjr;
	private String tjyjrxm;
	private Date tjrq;
	private String jlxz;
	private String beizhu;
	private String sfxxz;
	private String bgwtbz;
	private String scbz;
	private Double tjpc;

	// Constructors

	/** default constructor */
	public CzPgscJl() {
	}

	/** full constructor */
	public CzPgscJl(String cldId, String oldId, String pid, String code,
			String value, String CScjl, String tjyjr, String tjyjrxm,
			Date tjrq, String jlxz, String beizhu, String sfxxz, String bgwtbz,
			String scbz, Double tjpc) {
		this.cldId = cldId;
		this.oldId = oldId;
		this.pid = pid;
		this.code = code;
		this.value = value;
		this.CScjl = CScjl;
		this.tjyjr = tjyjr;
		this.tjyjrxm = tjyjrxm;
		this.tjrq = tjrq;
		this.jlxz = jlxz;
		this.beizhu = beizhu;
		this.sfxxz = sfxxz;
		this.bgwtbz = bgwtbz;
		this.scbz = scbz;
		this.tjpc = tjpc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCldId() {
		return this.cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public String getOldId() {
		return this.oldId;
	}

	public void setOldId(String oldId) {
		this.oldId = oldId;
	}

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getCScjl() {
		return this.CScjl;
	}

	public void setCScjl(String CScjl) {
		this.CScjl = CScjl;
	}

	public String getTjyjr() {
		return this.tjyjr;
	}

	public void setTjyjr(String tjyjr) {
		this.tjyjr = tjyjr;
	}

	public String getTjyjrxm() {
		return this.tjyjrxm;
	}

	public void setTjyjrxm(String tjyjrxm) {
		this.tjyjrxm = tjyjrxm;
	}

	public Date getTjrq() {
		return this.tjrq;
	}

	public void setTjrq(Date tjrq) {
		this.tjrq = tjrq;
	}

	public String getJlxz() {
		return this.jlxz;
	}

	public void setJlxz(String jlxz) {
		this.jlxz = jlxz;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getSfxxz() {
		return this.sfxxz;
	}

	public void setSfxxz(String sfxxz) {
		this.sfxxz = sfxxz;
	}

	public String getScbz() {
		return scbz;
	}

	public void setScbz(String scbz) {
		this.scbz = scbz;
	}

	public Double getTjpc() {
		return tjpc;
	}

	public void setTjpc(Double tjpc) {
		this.tjpc = tjpc;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getBgwtbz() {
		return bgwtbz;
	}

	public void setBgwtbz(String bgwtbz) {
		this.bgwtbz = bgwtbz;
	}

}