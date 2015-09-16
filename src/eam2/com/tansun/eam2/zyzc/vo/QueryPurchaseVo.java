package com.tansun.eam2.zyzc.vo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * @author 穆占强
 * @date 2010-11-20
 */
public class QueryPurchaseVo extends CommonBO {

	private static final long serialVersionUID = 1L;
	private String yjflbm = ""; // 一级分类编码
	private String ejflbm = ""; // 二级分类编码
	private String sjflbm = ""; // 三级分类编码
	private String yjflmc = ""; // 一级分类名称
	private String ejflmc = ""; // 二级分类名称
	private String sjflmc = ""; // 三级分类名称
	private String gg = ""; // 规格型号
	private String zcmc = ""; // 资产名称
	private String zcbh = ""; // 资产编号
	private String zczt = ""; // 资产状态
	private String sfsckp = ""; // 是否生成卡片
	private Integer zdjg; // 最低价格
	private Integer zgjg; // 最高价格
	private String tzlx = ""; // 台账类型
	private String zclx = ""; // 资产类型
	private String zcid = ""; // 资产ID
	private String syr = ""; // 使用人
	private String sybm = ""; // 使用部门
	private String gys = ""; // 供应商
	private String zdkcl = ""; // 最低库存量
	private String zgkcl = ""; // 最高库存量
	private String qyzzrq = ""; // 启用最早日期
	private String qyzwrq = ""; // 启用最晚日期
	private String ksrq = ""; // 开始日期
	private String jsrq = ""; // 结束日期
	private String qscbrq = ""; // 开始出保时间
	private String jscbrq = ""; // 结束出保时间
	private String qscgrq = ""; // 开始采购时间
	private String jscgrq = ""; // 结束采购时间
	private String bxfws = ""; // 保修机构
	private String syzt = ""; // 使用状态，物品更换时用，0，更换前，1，更换后
	private String cbrq = "";
	private String cbrqc = "";
	private String cbrqz = "";
	private String sytsc;

	private String jldw; // 计量单位
	private String ghlx; // 归还类型
	private String syts; // 借用天数
	private String sybmmc; // 借用部门
	private String syrmc; // 借用人
	private String syrq; // 领用借用日期
	private String syrqc;
	private String syrqz;
	private String sytsz;
	
	private Date zzcgrq;			//采购最早日期
	private Date zwcgrq;			//采购最晚日期
	private String lph;				//令牌号
	private String lpdlm;			//令牌登录名

	public String getLph() {
		return lph;
	}

	public void setLph(String lph) {
		this.lph = lph;
	}

	public String getLpdlm() {
		return lpdlm;
	}

	public void setLpdlm(String lpdlm) {
		this.lpdlm = lpdlm;
	}

	public Date getZzcgrq() {
		return zzcgrq;
	}

	public void setZzcgrq(Date zzcgrq) {
		this.zzcgrq = zzcgrq;
	}

	public Date getZwcgrq() {
		return zwcgrq;
	}

	public void setZwcgrq(Date zwcgrq) {
		this.zwcgrq = zwcgrq;
	}

	public Map<String, String> toMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("yjflbm", this.getYjflbm());
		map.put("ejflbm", this.getEjflbm());
		map.put("sjflbm", this.getSjflbm());
		map.put("yjflmc", this.getYjflmc());
		map.put("ejflmc", this.getEjflmc());
		map.put("sjflmc", this.getSjflmc());
		map.put("gg", this.getGg());
		map.put("zcmc", this.getZcmc());
		map.put("zcbh", this.getZcbh());
		map.put("zczt", this.getZczt());
		map.put("sfsckp", this.getSfsckp());
		map.put("zdjg", String.valueOf(this.getZdjg()));
		map.put("zgjg", String.valueOf(this.getZgjg()));
		map.put("tzlx", this.getTzlx());
		map.put("zclx", this.getZclx());
		map.put("zcid", this.getZcid());
		map.put("syr", this.getSyr());
		map.put("sybm", this.getSybm());
		map.put("gys", this.getGys());
		map.put("zdkcl", this.getZdkcl());
		map.put("zgkcl", this.getZgkcl());
		map.put("qyzzrq", this.getQyzzrq());
		map.put("qyzwrq", this.getQyzwrq());
		map.put("ksrq", this.getKsrq());
		map.put("jsrq", this.getJsrq());
		map.put("qscbrq", this.getQscbrq());
		map.put("jscbrq", this.getJscbrq());
		map.put("qscgrq", this.getQscgrq());
		map.put("jscgrq", this.getJscgrq());
		map.put("bxfws", this.getBxfws());
		map.put("syzt", this.getSyzt());
		map.put("cbrq", this.getCbrq());
		map.put("cbrqc", this.getCbrqc());
		map.put("cbrqz", this.getCbrqz());
		map.put("syts", this.getSyts());
		map.put("sybmmc", this.getSybmmc());
		map.put("syrmc", this.getSyrmc());
		map.put("syrq", this.getSyrq());
		map.put("ghlx", this.getGhlx());
		map.put("jldw", this.getJldw());
		map.put("syrqc", this.getSyrqc());
		map.put("syrqz", this.getSyrqz());
		map.put("sytsc", this.getSytsc());
		map.put("sytsz", this.getSytsz());
		return map;
	}

	public String getYjflbm() {
		return yjflbm;
	}

	public void setYjflbm(String yjflbm) {
		this.yjflbm = yjflbm;
	}

	public String getEjflbm() {
		return ejflbm;
	}

	public void setEjflbm(String ejflbm) {
		this.ejflbm = ejflbm;
	}

	public String getSjflbm() {
		return sjflbm;
	}

	public void setSjflbm(String sjflbm) {
		this.sjflbm = sjflbm;
	}

	public String getYjflmc() {
		return yjflmc;
	}

	public void setYjflmc(String yjflmc) {
		this.yjflmc = yjflmc;
	}

	public String getEjflmc() {
		return ejflmc;
	}

	public void setEjflmc(String ejflmc) {
		this.ejflmc = ejflmc;
	}

	public String getSjflmc() {
		return sjflmc;
	}

	public void setSjflmc(String sjflmc) {
		this.sjflmc = sjflmc;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getZdkcl() {
		return zdkcl;
	}

	public void setZdkcl(String zdkcl) {
		this.zdkcl = zdkcl;
	}

	public String getZgkcl() {
		return zgkcl;
	}

	public void setZgkcl(String zgkcl) {
		this.zgkcl = zgkcl;
	}

	public String getKsrq() {
		return ksrq;
	}

	public void setKsrq(String ksrq) {
		this.ksrq = ksrq;
	}

	public String getJsrq() {
		return jsrq;
	}

	public void setJsrq(String jsrq) {
		this.jsrq = jsrq;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getQyzzrq() {
		return qyzzrq;
	}

	public void setQyzzrq(String qyzzrq) {
		this.qyzzrq = qyzzrq;
	}

	public String getQyzwrq() {
		return qyzwrq;
	}

	public void setQyzwrq(String qyzwrq) {
		this.qyzwrq = qyzwrq;
	}

	public String getSfsckp() {
		return sfsckp;
	}

	public void setSfsckp(String sfsckp) {
		this.sfsckp = sfsckp;
	}

	public Integer getZdjg() {
		return zdjg;
	}

	public void setZdjg(Integer zdjg) {
		this.zdjg = zdjg;
	}

	public Integer getZgjg() {
		return zgjg;
	}

	public void setZgjg(Integer zgjg) {
		this.zgjg = zgjg;
	}

	public String getTzlx() {
		return tzlx;
	}

	public void setTzlx(String tzlx) {
		this.tzlx = tzlx;
	}

	public String getZclx() {
		return zclx;
	}

	public void setZclx(String zclx) {
		this.zclx = zclx;
	}

	public String getZcid() {
		return zcid;
	}

	public void setZcid(String zcid) {
		this.zcid = zcid;
	}

	public String getSyr() {
		return syr;
	}

	public void setSyr(String syr) {
		this.syr = syr;
	}

	public String getSybm() {
		return sybm;
	}

	public void setSybm(String sybm) {
		this.sybm = sybm;
	}

	public String getGys() {
		return gys;
	}

	public void setGys(String gys) {
		this.gys = gys;
	}

	public String getQscbrq() {
		return qscbrq;
	}

	public void setQscbrq(String qscbrq) {
		this.qscbrq = qscbrq;
	}

	public String getJscbrq() {
		return jscbrq;
	}

	public void setJscbrq(String jscbrq) {
		this.jscbrq = jscbrq;
	}

	public String getQscgrq() {
		return qscgrq;
	}

	public void setQscgrq(String qscgrq) {
		this.qscgrq = qscgrq;
	}

	public String getJscgrq() {
		return jscgrq;
	}

	public void setJscgrq(String jscgrq) {
		this.jscgrq = jscgrq;
	}

	public String getBxfws() {
		return bxfws;
	}

	public void setBxfws(String bxfws) {
		this.bxfws = bxfws;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public String getSyzt() {
		return syzt;
	}

	public void setSyzt(String syzt) {
		this.syzt = syzt;
	}

	public String getCbrq() {
		return cbrq;
	}

	public void setCbrq(String cbrq) {
		this.cbrq = cbrq;
	}

	public String getCbrqc() {
		return cbrqc;
	}

	public void setCbrqc(String cbrqc) {
		this.cbrqc = cbrqc;
	}

	public String getCbrqz() {
		return cbrqz;
	}

	public void setCbrqz(String cbrqz) {
		this.cbrqz = cbrqz;
	}

	public String getSyts() {
		return syts;
	}

	public void setSyts(String syts) {
		this.syts = syts;
	}

	public String getSybmmc() {
		return sybmmc;
	}

	public void setSybmmc(String sybmmc) {
		this.sybmmc = sybmmc;
	}

	public String getSyrmc() {
		return syrmc;
	}

	public void setSyrmc(String syrmc) {
		this.syrmc = syrmc;
	}

	public String getSyrq() {
		return syrq;
	}

	public void setSyrq(String syrq) {
		this.syrq = syrq;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getGhlx() {
		return ghlx;
	}

	public void setGhlx(String ghlx) {
		this.ghlx = ghlx;
	}

	public String getJldw() {
		return jldw;
	}

	public void setJldw(String jldw) {
		this.jldw = jldw;
	}

	public String getSyrqc() {
		return syrqc;
	}

	public void setSyrqc(String syrqc) {
		this.syrqc = syrqc;
	}

	public String getSyrqz() {
		return syrqz;
	}

	public void setSyrqz(String syrqz) {
		this.syrqz = syrqz;
	}

	public String getSytsc() {
		return sytsc;
	}

	public void setSytsc(String sytsc) {
		this.sytsc = sytsc;
	}

	public String getSytsz() {
		return sytsz;
	}

	public void setSytsz(String sytsz) {
		this.sytsz = sytsz;
	}

}
