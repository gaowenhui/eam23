package com.tansun.eam2.jygdzc.vo;

import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;

public class JyzlXxBodyVO extends JyzcJyzlLsb{
	/**
	 * 处理单 表体 展示 信息
	 */
	private static final long serialVersionUID = 8534881279194075106L;
	// 资产编号
	private String zcbh;
	// 资产名称
	private String zcmc;
	// 资产类型
	private String CZclx;
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

}
