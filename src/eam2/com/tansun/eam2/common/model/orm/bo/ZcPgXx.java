package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * ZcPgXx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ZcPgXx extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	private static final long serialVersionUID = -4290578156068214146L;
	private String id;
	private String zcid;
	private String jygczcbh;
	private String zcmc;
	private String sfmc;
	private String zclb;
	private String zclbbm;
	private String zkpbh;
	private Double zczmjz;
	private String dkzh;
	private String wdid;
	private String czcmc;
	private String csjzyr;
	private String czcbh;
	private String ccfwz;
	private String czclx;
	private String stid;
	private String stmc;         //实体名称
	private String stzcmc;       //实体内资产名称
	private String stfsxxid;     //实体附属信息ID
	private String stzcbh;       //实体内资产编号
	private String sttzclx;      //实体内资产类型
	private String stzclb;       //资产类别
	private String stsjzyr;      //资产实际占有人
	private String stcfwz;       //实体内资产存放位置
	private String pgjg;
	private Double pingguzhi;
	private String CJzlx;
	private String CCzfs;
	private String pgff;
	private Date pgjzr;
	private String beizhu;
	private String pgmd;
	private Double jzrzmjz;
	private String pgzclb;
	private Double zjz;
	private Double zjfd;
	private Double jingzhi;
	private Double zcybyz;
	private Double bxe;
	private String xzlb;
	private String gqstid;
	private String gqstmc;
	private String gqstsf;
	private String gqstzl;
	private String gqstglbm;
	private String gqstwtgljg;
	private Double gqjzrjzcz;
	private String zqid;
	private String zqzl;
	private String zwrmc;
	private Double grzye;
	private Double pgjzrzmzqz;
	//是否保存  1： 保存
	private String sfbc;
	// Constructors

	//添加自用资产信息
	private String zyzcid;
	private String zyzcbh;
	private String zyzcmc;
	private String zykpbh;
	private String zykpmc;
	private Double zyccyz;
	private String zybgdd;
	
	/** default constructor */
	public ZcPgXx() {
	}

	/** full constructor */
	public ZcPgXx(String zcid, String jygczcbh, String zcmc, String sfmc,
			String zclb, String zclbbm, String zkpbh, Double zczmjz,
			String dkzh, String wdid, String czcmc, String csjzyr,
			String czcbh, String ccfwz, String czclx, String stid, String stmc,
			String stzcmc, String stfsxxid, String stzcbh, String sttzclx,
			String stzclb, String stsjzyr, String stcfwz, String pgjg,
			Double pingguzhi, String CJzlx, String CCzfs, String pgff,
			Date pgjzr, String beizhu, String pgmd, Double jzrzmjz,
			String pgzclb, Double zjz, Double zjfd, Double jingzhi,
			Double zcybyz, Double bxe, String xzlb, String gqstid,
			String gqstmc, String gqstsf, String gqstzl, String gqstglbm,
			String gqstwtgljg, Double gqjzrjzcz, String zqid, String zqzl,
			String zwrmc,String sfbc, Double grzye, Double pgjzrzmzqz) {
		this.zcid = zcid;
		this.jygczcbh = jygczcbh;
		this.zcmc = zcmc;
		this.sfmc = sfmc;
		this.zclb = zclb;
		this.zclbbm = zclbbm;
		this.zkpbh = zkpbh;
		this.zczmjz = zczmjz;
		this.dkzh = dkzh;
		this.wdid = wdid;
		this.czcmc = czcmc;
		this.csjzyr = csjzyr;
		this.czcbh = czcbh;
		this.ccfwz = ccfwz;
		this.czclx = czclx;
		this.stid = stid;
		this.stmc = stmc;
		this.stzcmc = stzcmc;
		this.stfsxxid = stfsxxid;
		this.stzcbh = stzcbh;
		this.sttzclx = sttzclx;
		this.stzclb = stzclb;
		this.stsjzyr = stsjzyr;
		this.stcfwz = stcfwz;
		this.pgjg = pgjg;
		this.pingguzhi = pingguzhi;
		this.CJzlx = CJzlx;
		this.CCzfs = CCzfs;
		this.pgff = pgff;
		this.pgjzr = pgjzr;
		this.beizhu = beizhu;
		this.pgmd = pgmd;
		this.jzrzmjz = jzrzmjz;
		this.pgzclb = pgzclb;
		this.zjz = zjz;
		this.zjfd = zjfd;
		this.jingzhi = jingzhi;
		this.zcybyz = zcybyz;
		this.bxe = bxe;
		this.xzlb = xzlb;
		this.gqstid = gqstid;
		this.gqstmc = gqstmc;
		this.gqstsf = gqstsf;
		this.gqstzl = gqstzl;
		this.gqstglbm = gqstglbm;
		this.gqstwtgljg = gqstwtgljg;
		this.gqjzrjzcz = gqjzrjzcz;
		this.zqid = zqid;
		this.zqzl = zqzl;
		this.zwrmc = zwrmc;
		this.grzye = grzye;
		this.pgjzrzmzqz = pgjzrzmzqz;
		this.sfbc = sfbc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getZcid() {
		return this.zcid;
	}

	public void setZcid(String zcid) {
		this.zcid = zcid;
	}

	public String getJygczcbh() {
		return this.jygczcbh;
	}

	public void setJygczcbh(String jygczcbh) {
		this.jygczcbh = jygczcbh;
	}

	public String getZcmc() {
		return this.zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getSfmc() {
		return this.sfmc;
	}

	public void setSfmc(String sfmc) {
		this.sfmc = sfmc;
	}

	public String getZclb() {
		return this.zclb;
	}

	public void setZclb(String zclb) {
		this.zclb = zclb;
	}

	public String getZclbbm() {
		return this.zclbbm;
	}

	public void setZclbbm(String zclbbm) {
		this.zclbbm = zclbbm;
	}

	public String getZkpbh() {
		return this.zkpbh;
	}

	public void setZkpbh(String zkpbh) {
		this.zkpbh = zkpbh;
	}

	public Double getZczmjz() {
		return this.zczmjz;
	}

	public void setZczmjz(Double zczmjz) {
		this.zczmjz = zczmjz;
	}

	public String getDkzh() {
		return this.dkzh;
	}

	public void setDkzh(String dkzh) {
		this.dkzh = dkzh;
	}

	public String getWdid() {
		return this.wdid;
	}

	public void setWdid(String wdid) {
		this.wdid = wdid;
	}

	public String getCzcmc() {
		return this.czcmc;
	}

	public void setCzcmc(String czcmc) {
		this.czcmc = czcmc;
	}

	public String getCsjzyr() {
		return this.csjzyr;
	}

	public void setCsjzyr(String csjzyr) {
		this.csjzyr = csjzyr;
	}

	public String getCzcbh() {
		return this.czcbh;
	}

	public void setCzcbh(String czcbh) {
		this.czcbh = czcbh;
	}

	public String getCcfwz() {
		return this.ccfwz;
	}

	public void setCcfwz(String ccfwz) {
		this.ccfwz = ccfwz;
	}

	public String getCzclx() {
		return this.czclx;
	}

	public void setCzclx(String czclx) {
		this.czclx = czclx;
	}

	public String getStid() {
		return this.stid;
	}

	public void setStid(String stid) {
		this.stid = stid;
	}

	public String getStmc() {
		return this.stmc;
	}

	public void setStmc(String stmc) {
		this.stmc = stmc;
	}

	public String getStzcmc() {
		return this.stzcmc;
	}

	public void setStzcmc(String stzcmc) {
		this.stzcmc = stzcmc;
	}

	public String getStfsxxid() {
		return this.stfsxxid;
	}

	public void setStfsxxid(String stfsxxid) {
		this.stfsxxid = stfsxxid;
	}

	public String getStzcbh() {
		return this.stzcbh;
	}

	public void setStzcbh(String stzcbh) {
		this.stzcbh = stzcbh;
	}

	public String getSttzclx() {
		return this.sttzclx;
	}

	public void setSttzclx(String sttzclx) {
		this.sttzclx = sttzclx;
	}

	public String getStzclb() {
		return this.stzclb;
	}

	public void setStzclb(String stzclb) {
		this.stzclb = stzclb;
	}

	public String getStsjzyr() {
		return this.stsjzyr;
	}

	public void setStsjzyr(String stsjzyr) {
		this.stsjzyr = stsjzyr;
	}

	public String getStcfwz() {
		return this.stcfwz;
	}

	public void setStcfwz(String stcfwz) {
		this.stcfwz = stcfwz;
	}

	public String getPgjg() {
		return this.pgjg;
	}

	public void setPgjg(String pgjg) {
		this.pgjg = pgjg;
	}

	public Double getPingguzhi() {
		return this.pingguzhi;
	}

	public void setPingguzhi(Double pingguzhi) {
		this.pingguzhi = pingguzhi;
	}

	public String getCJzlx() {
		return this.CJzlx;
	}

	public void setCJzlx(String CJzlx) {
		this.CJzlx = CJzlx;
	}

	public String getCCzfs() {
		return this.CCzfs;
	}

	public void setCCzfs(String CCzfs) {
		this.CCzfs = CCzfs;
	}

	public String getPgff() {
		return this.pgff;
	}

	public void setPgff(String pgff) {
		this.pgff = pgff;
	}

	public Date getPgjzr() {
		return this.pgjzr;
	}

	public void setPgjzr(Date pgjzr) {
		this.pgjzr = pgjzr;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getPgmd() {
		return this.pgmd;
	}

	public void setPgmd(String pgmd) {
		this.pgmd = pgmd;
	}

	public Double getJzrzmjz() {
		return this.jzrzmjz;
	}

	public void setJzrzmjz(Double jzrzmjz) {
		this.jzrzmjz = jzrzmjz;
	}

	public String getPgzclb() {
		return this.pgzclb;
	}

	public void setPgzclb(String pgzclb) {
		this.pgzclb = pgzclb;
	}

	public Double getZjz() {
		return this.zjz;
	}

	public void setZjz(Double zjz) {
		this.zjz = zjz;
	}

	public Double getZjfd() {
		return this.zjfd;
	}

	public void setZjfd(Double zjfd) {
		this.zjfd = zjfd;
	}

	public Double getJingzhi() {
		return this.jingzhi;
	}

	public void setJingzhi(Double jingzhi) {
		this.jingzhi = jingzhi;
	}

	public Double getZcybyz() {
		return this.zcybyz;
	}

	public void setZcybyz(Double zcybyz) {
		this.zcybyz = zcybyz;
	}

	public Double getBxe() {
		return this.bxe;
	}

	public void setBxe(Double bxe) {
		this.bxe = bxe;
	}

	public String getXzlb() {
		return this.xzlb;
	}

	public void setXzlb(String xzlb) {
		this.xzlb = xzlb;
	}

	public String getGqstid() {
		return this.gqstid;
	}

	public void setGqstid(String gqstid) {
		this.gqstid = gqstid;
	}

	public String getGqstmc() {
		return this.gqstmc;
	}

	public void setGqstmc(String gqstmc) {
		this.gqstmc = gqstmc;
	}

	public String getGqstsf() {
		return this.gqstsf;
	}

	public void setGqstsf(String gqstsf) {
		this.gqstsf = gqstsf;
	}

	public String getGqstzl() {
		return this.gqstzl;
	}

	public void setGqstzl(String gqstzl) {
		this.gqstzl = gqstzl;
	}

	public String getGqstglbm() {
		return this.gqstglbm;
	}

	public void setGqstglbm(String gqstglbm) {
		this.gqstglbm = gqstglbm;
	}

	public String getGqstwtgljg() {
		return this.gqstwtgljg;
	}

	public void setGqstwtgljg(String gqstwtgljg) {
		this.gqstwtgljg = gqstwtgljg;
	}

	public Double getGqjzrjzcz() {
		return this.gqjzrjzcz;
	}

	public void setGqjzrjzcz(Double gqjzrjzcz) {
		this.gqjzrjzcz = gqjzrjzcz;
	}

	public String getZqid() {
		return this.zqid;
	}

	public void setZqid(String zqid) {
		this.zqid = zqid;
	}

	public String getZqzl() {
		return this.zqzl;
	}

	public void setZqzl(String zqzl) {
		this.zqzl = zqzl;
	}

	public String getZwrmc() {
		return this.zwrmc;
	}

	public void setZwrmc(String zwrmc) {
		this.zwrmc = zwrmc;
	}

	public Double getGrzye() {
		return this.grzye;
	}

	public void setGrzye(Double grzye) {
		this.grzye = grzye;
	}

	public Double getPgjzrzmzqz() {
		return this.pgjzrzmzqz;
	}

	public void setPgjzrzmzqz(Double pgjzrzmzqz) {
		this.pgjzrzmzqz = pgjzrzmzqz;
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

	public String getZyzcid() {
		return zyzcid;
	}

	public void setZyzcid(String zyzcid) {
		this.zyzcid = zyzcid;
	}

	public String getZyzcbh() {
		return zyzcbh;
	}

	public void setZyzcbh(String zyzcbh) {
		this.zyzcbh = zyzcbh;
	}

	public String getZyzcmc() {
		return zyzcmc;
	}

	public void setZyzcmc(String zyzcmc) {
		this.zyzcmc = zyzcmc;
	}

	public String getZykpbh() {
		return zykpbh;
	}

	public void setZykpbh(String zykpbh) {
		this.zykpbh = zykpbh;
	}

	public String getZykpmc() {
		return zykpmc;
	}

	public void setZykpmc(String zykpmc) {
		this.zykpmc = zykpmc;
	}

	public Double getZyccyz() {
		return zyccyz;
	}

	public void setZyccyz(Double zyccyz) {
		this.zyccyz = zyccyz;
	}

	public String getZybgdd() {
		return zybgdd;
	}

	public void setZybgdd(String zybgdd) {
		this.zybgdd = zybgdd;
	}

}