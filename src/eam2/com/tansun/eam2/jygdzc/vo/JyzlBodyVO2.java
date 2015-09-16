package com.tansun.eam2.jygdzc.vo;

import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwgLsb;

/**
 * hetong
 * @author lihuan
 *
 */
public class JyzlBodyVO2 extends JjzcHtZlwgLsb  {

	
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
