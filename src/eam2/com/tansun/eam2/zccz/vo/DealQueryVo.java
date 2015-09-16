package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class DealQueryVo extends CommonBO {

	private String xmId;//项目id
	private String bh; // 编号
	private String czxmmc; // 处置项目名称
	private String ngbmmc; // 拟稿部门名称
	private String ngrmc; // 拟稿人名称
	private String ywlx; // 业务类型
	private String czfs; // 处置方式
	private String zcszwz; // 资产所在位置
	private String xmzt; // 项目状态
	private String xmlx;//项目类型
	private String spwys;
	private String zcr;
	private String czsx;//处置时限
	private String yjczhsje;//建议处置回收金额
	private String yjczfy;//预计处置费用
	private String sjczsr;//实际处置收入
	private String sjczfy;//实际处置费用
	private String sfqszczrxy;//是否签署资产转让协议
	private String kpsfjs;//卡片是否减少
	private String sfqbja;//是否全部结案

	public String getSfqbja() {
		return sfqbja;
	}

	public void setSfqbja(String sfqbja) {
		this.sfqbja = sfqbja;
	}

	public String getSpwys() {
		return spwys;
	}

	public void setSpwys(String spwys) {
		this.spwys = spwys;
	}

	public String getZcr() {
		return zcr;
	}

	public void setZcr(String zcr) {
		this.zcr = zcr;
	}

	public String getXmlx() {
		return xmlx;
	}

	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}

	public DealQueryVo() {
	}

	public String getBh() {
		return bh;
	}

	public DealQueryVo(String xmId,String bh, String czxmmc, String ngbmmc, String ngrmc,
			String ywlx, String czfs, String zcszwz, String xmzt,String xmlx,
			String zcr,String spwys) {
		this.xmId = xmId;
		this.bh = bh;
		this.czxmmc = czxmmc;
		this.ngbmmc = ngbmmc;
		this.ngrmc = ngrmc;
		this.ywlx = ywlx;
		this.czfs = czfs;
		this.zcszwz = zcszwz;
		this.xmzt = xmzt;
		this.xmlx = xmlx;
		this.spwys = spwys;
		this.zcr = zcr;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getCzxmmc() {
		return czxmmc;
	}

	public void setCzxmmc(String czxmmc) {
		this.czxmmc = czxmmc;
	}

	public String getNgbmmc() {
		return ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getNgrmc() {
		return ngrmc;
	}

	public void setNgrmc(String ngrmc) {
		this.ngrmc = ngrmc;
	}

	public String getYwlx() {
		return ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}

	public String getCzfs() {
		return czfs;
	}

	public void setCzfs(String czfs) {
		this.czfs = czfs;
	}

	public String getZcszwz() {
		return zcszwz;
	}

	public void setZcszwz(String zcszwz) {
		this.zcszwz = zcszwz;
	}

	public String getXmzt() {
		return xmzt;
	}

	public void setXmzt(String xmzt) {
		this.xmzt = xmzt;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getXmId() {
		return xmId;
	}

	public void setXmId(String xmId) {
		this.xmId = xmId;
	}

	public String getCzsx() {
		return czsx;
	}

	public void setCzsx(String czsx) {
		this.czsx = czsx;
	}

	public String getYjczhsje() {
		return yjczhsje;
	}

	public void setYjczhsje(String yjczhsje) {
		this.yjczhsje = yjczhsje;
	}

	public String getYjczfy() {
		return yjczfy;
	}

	public void setYjczfy(String yjczfy) {
		this.yjczfy = yjczfy;
	}

	public String getSjczsr() {
		return sjczsr;
	}

	public void setSjczsr(String sjczsr) {
		this.sjczsr = sjczsr;
	}

	public String getSjczfy() {
		return sjczfy;
	}

	public void setSjczfy(String sjczfy) {
		this.sjczfy = sjczfy;
	}

	public String getSfqszczrxy() {
		return sfqszczrxy;
	}

	public void setSfqszczrxy(String sfqszczrxy) {
		this.sfqszczrxy = sfqszczrxy;
	}

	public String getKpsfjs() {
		return kpsfjs;
	}

	public void setKpsfjs(String kpsfjs) {
		this.kpsfjs = kpsfjs;
	}

}
