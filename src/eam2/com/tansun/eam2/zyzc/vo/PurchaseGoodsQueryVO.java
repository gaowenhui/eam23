package com.tansun.eam2.zyzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class PurchaseGoodsQueryVO extends CommonBO {
	private static final long serialVersionUID = -492940423502971017L;
	
	private String yjflbm = "";     //一级分类编码
	private String ejflbm = "";     //二级分类编码
	private String sjflbm = "";     //三级分类编码
	private String yjflmc = "";     //一级分类名称
	private String ejflmc = "";     //二级分类名称
	private String sjflmc = "";     //三级分类名称
	private String gg = "";         //规格型号
	private String zcmc = "";	    //资产名称
	private Date zzcgrq;			//采购最早日期
	private Date zwcgrq;			//采购最晚日期
	private String epe;				//导出Excel用的字段

	public String getEpe() {
		return epe;
	}

	public void setEpe(String epe) {
		this.epe = epe;
	}

	@Override
	public String getMid() {
		return null;
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

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
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

}
