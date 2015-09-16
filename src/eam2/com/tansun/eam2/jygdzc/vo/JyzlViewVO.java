package com.tansun.eam2.jygdzc.vo;

import com.tansun.eam2.common.model.orm.bo.JyzcJyzlXx;

public class JyzlViewVO extends JyzcJyzlXx{

	private static final long serialVersionUID = -6100109263221604378L;
	//标题
	private String biaoti;
    //编号 
	private String bianhao;
	//业务类型
	private String ywlx;
	//资产编号
	private String zcbh;
	//资产名称
	private String zcmc;
	//资产类型
	private String CZclx;
	//地区
	private String dq;
	//租赁状态
	private String zlzt;
	//意向租金总金额
	private Double yxzjzje;
	
	public Double getYxzjzje() {
		return yxzjzje;
	}
	public void setYxzjzje(Double yxzjzje) {
		this.yxzjzje = yxzjzje;
	}
	public String getBiaoti() {
		return biaoti;
	}
	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}
	public String getBianhao() {
		return bianhao;
	}
	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
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
	public String getCZclx() {
		return CZclx;
	}
	public void setCZclx(String zclx) {
		CZclx = zclx;
	}
	public String getDq() {
		return dq;
	}
	public void setDq(String dq) {
		this.dq = dq;
	}
	public String getZlzt() {
		return zlzt;
	}
	public void setZlzt(String zlzt) {
		this.zlzt = zlzt;
	}

	
}
