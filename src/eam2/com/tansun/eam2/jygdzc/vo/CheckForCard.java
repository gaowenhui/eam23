package com.tansun.eam2.jygdzc.vo;

import java.math.BigDecimal;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 盘点管理里面查询卡片的
 * 
 * @author 陈煜霄
 * @date 2010-12-29
 */
public class CheckForCard extends CommonBO {
	private String id; // id
	private String kpid; // 卡片id
	private String cardcode; // 卡片编号
	private String zcname; // 卡片名称
	private String glbm; // 管理部门
	private String usepartment; // 使用部门
	private String firstbranch; // 一级分行
	private String zcbh; // 资产编号
	private String zcmc; // 资产名称
	private Double ybyz; // 原币原值

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getZcname() {
		return zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getUsepartment() {
		return usepartment;
	}

	public void setUsepartment(String usepartment) {
		this.usepartment = usepartment;
	}

	public String getFirstbranch() {
		return firstbranch;
	}

	public void setFirstbranch(String firstbranch) {
		this.firstbranch = firstbranch;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public Double getYbyz() {
		return ybyz;
	}

	public void setYbyz(Double ybyz) {
		this.ybyz = ybyz;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKpid() {
		return kpid;
	}

	public void setKpid(String kpid) {
		this.kpid = kpid;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
