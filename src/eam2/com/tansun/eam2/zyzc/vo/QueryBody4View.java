package com.tansun.eam2.zyzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class QueryBody4View extends CommonBO{

	private static final long serialVersionUID = 3517842423947487322L;
	private String yjflmc = "";     //jjflmc   一级分类名称
	private String ejflmc = "";     //ejflmc   二级分类名称
	private String sjflmc = "";     //sjflmc   三级分类名称
	private String yjflbm = "";     //yjflbm   一级分类编号
	private String ejflbm = "";     //ejflbm   二级分类编号
	private String sjflbm = "";     //sjflbm   三级分类编号
	private String sbodyId ="";		//sbodyId  jqgrid中每条记录的id
	private String zcmc = "";       //zcmc     资产名称
	private String gg = "";       	//gg       规格型号
	private String kcsl = "";       //kcsl     库存量
	private String zcbh = "";       //zcbh     资产编号
	private String zczt = "";       //zczt     资产状态
	private Date   kssyrq;	        //kssyrq   开始使用日期（启用日期）
	private String sfsckp = "";     //sfsckp   是否生成卡片
	private String jldw = "";       //jldw     计量单位
	private Double dj;              //jg;      价格
	private Double je;				//je       金额	
	private int    sl;				//sl	    数量
	private String zcId = "";		//zcid	    资产ID
	private Date   jydqrq ;			//jydqrq   借用到期日期
	private String lyrmc = "";		//lyrmc	    领用借用人名称
	private String bz = "";   		//bz	    资产描述，zyzc表备注?
	private String lybmmc = "";		//lybmmc   领用部门名称
	private String jybmmc ="";		//jybmmc   借用部门名称
	private String bgdd = "";		//bgdd     保管（存放）地点 
	private String gys = "";		//gys	    供应商
	private String bxjg;			//bxfws	    保修机构 
	private String bxfws;			//bxfws	    保修服务商 
	private String cbrq;			//cbrq	    出保日期 
	private String pdjg;			//pdjg	    盘点结果	
	private Date   xxbrq;			//xxbrq	    新出保日期
	private int	   yjkcsl;			//yjkcsl   预警库存数量
	private Double czyz;			//ccyz	    财产原值
	private Date   lyrq;			//lyrq	   领用日期

	public QueryBody4View(){
		
	}

	@Override
	public String getMid() {
		return null;
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

	public String getSbodyId() {
		return sbodyId;
	}

	public void setSbodyId(String sbodyId) {
		this.sbodyId = sbodyId;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getKcsl() {
		return kcsl;
	}

	public void setKcsl(String kcsl) {
		this.kcsl = kcsl;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public Date getKssyrq() {
		return kssyrq;
	}

	public void setKssyrq(Date kssyrq) {
		this.kssyrq = kssyrq;
	}

	public String getSfsckp() {
		return sfsckp;
	}

	public void setSfsckp(String sfsckp) {
		this.sfsckp = sfsckp;
	}

	public String getJldw() {
		return jldw;
	}

	public void setJldw(String jldw) {
		this.jldw = jldw;
	}

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcid) {
		this.zcId = zcid;
	}

	public Date getJydqrq() {
		return jydqrq;
	}

	public void setJydqrq(Date jydqrq) {
		this.jydqrq = jydqrq;
	}

	public String getLyrmc() {
		return lyrmc;
	}

	public void setLyrmc(String lyrmc) {
		this.lyrmc = lyrmc;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getLybmmc() {
		return lybmmc;
	}

	public void setLybmmc(String lybmmc) {
		this.lybmmc = lybmmc;
	}

	public String getJybmmc() {
		return jybmmc;
	}

	public void setJybmmc(String jybmmc) {
		this.jybmmc = jybmmc;
	}

	public String getBgdd() {
		return bgdd;
	}

	public void setBgdd(String bgdd) {
		this.bgdd = bgdd;
	}

	public String getGys() {
		return gys;
	}

	public void setGys(String gys) {
		this.gys = gys;
	}

	public String getBxjg() {
		return bxjg;
	}

	public void setBxjg(String bxjg) {
		this.bxjg = bxjg;
	}

	public String getBxfws() {
		return bxfws;
	}

	public void setBxfws(String bxfws) {
		this.bxfws = bxfws;
	}

	public String getCbrq() {
		return cbrq;
	}

	public void setCbrq(String cbrq) {
		this.cbrq = cbrq;
	}

	public String getPdjg() {
		return pdjg;
	}

	public void setPdjg(String pdjg) {
		this.pdjg = pdjg;
	}

	public Date getXxbrq() {
		return xxbrq;
	}

	public void setXxbrq(Date xxbrq) {
		this.xxbrq = xxbrq;
	}

	public Double getDj() {
		return dj;
	}

	public void setDj(Double dj) {
		this.dj = dj;
	}

	public Double getJe() {
		return je;
	}

	public void setJe(Double je) {
		this.je = je;
	}

	public int getYjkcsl() {
		return yjkcsl;
	}

	public void setYjkcsl(int yjkcsl) {
		this.yjkcsl = yjkcsl;
	}

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public Date getLyrq() {
		return lyrq;
	}

	public void setLyrq(Date lyrq) {
		this.lyrq = lyrq;
	}

	public Double getCzyz() {
		return czyz;
	}

	public void setCzyz(Double czyz) {
		this.czyz = czyz;
	}
}
