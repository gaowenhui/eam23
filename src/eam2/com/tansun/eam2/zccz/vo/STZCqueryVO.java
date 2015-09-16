package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 处置公告实体和资产查询vo
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
public class STZCqueryVO extends CommonBO {

	private String id; // 处置表id
	private String stmc; // 实体名称
	private String stbh; // 实体资产编号
	private String stlx; // 实体类型
	private String stxz; // 实体现状
	private String stscsf; // 实体所处省份

	private String zcbh; // 资产编号
	private String zcmc; // 资产名称
	private String zcfl; // 资产分类
	private String czfs; // 处置方式
	private Double pgz; // 评估值
	private String szd; // 所在地

	private String xmmc; // 项目名称
	private String zqzlmc; // 债券种类名称
	private String zqmc; // 债券名称
	private String hm; // 行名
	private String dqr; // 到期日

	private String zcms; // 资产描述
	private String czysbs; // 处置意思表示

	public String getStmc() {
		return stmc;
	}

	public void setStmc(String stmc) {
		this.stmc = stmc;
	}

	public String getStbh() {
		return stbh;
	}

	public void setStbh(String stbh) {
		this.stbh = stbh;
	}

	public String getStlx() {
		return stlx;
	}

	public void setStlx(String stlx) {
		this.stlx = stlx;
	}

	public String getStxz() {
		return stxz;
	}

	public void setStxz(String stxz) {
		this.stxz = stxz;
	}

	public String getStscsf() {
		return stscsf;
	}

	public void setStscsf(String stscsf) {
		this.stscsf = stscsf;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getZcms() {
		return zcms;
	}

	public void setZcms(String zcms) {
		this.zcms = zcms;
	}

	public String getCzysbs() {
		return czysbs;
	}

	public void setCzysbs(String czysbs) {
		this.czysbs = czysbs;
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

	public String getZcfl() {
		return zcfl;
	}

	public void setZcfl(String zcfl) {
		this.zcfl = zcfl;
	}

	public String getCzfs() {
		return czfs;
	}

	public void setCzfs(String czfs) {
		this.czfs = czfs;
	}

	public Double getPgz() {
		return pgz;
	}

	public void setPgz(Double pgz) {
		this.pgz = pgz;
	}

	public String getSzd() {
		return szd;
	}

	public void setSzd(String szd) {
		this.szd = szd;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public String getZqzlmc() {
		return zqzlmc;
	}

	public void setZqzlmc(String zqzlmc) {
		this.zqzlmc = zqzlmc;
	}

	public String getZqmc() {
		return zqmc;
	}

	public void setZqmc(String zqmc) {
		this.zqmc = zqmc;
	}

	public String getHm() {
		return hm;
	}

	public void setHm(String hm) {
		this.hm = hm;
	}

	public String getDqr() {
		return dqr;
	}

	public void setDqr(String dqr) {
		this.dqr = dqr;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
