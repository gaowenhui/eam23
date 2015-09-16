package com.tansun.eam2.zyzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class TokenVO extends CommonBO {
	private static final long serialVersionUID = 6836336193539576888L;

	private String lyrmc;	//姓名
	private String lpdlm;	//令牌登录名
	private String lph;		//令牌号
	private String lpqx;	//令牌权限
	private String zczt;	//资产状态
	private Date lpsx;		//令牌时限
	
	public String getLyrmc() {
		return lyrmc;
	}

	public void setLyrmc(String lyrmc) {
		this.lyrmc = lyrmc;
	}

	public String getLpdlm() {
		return lpdlm;
	}

	public void setLpdlm(String lpdlm) {
		this.lpdlm = lpdlm;
	}

	public String getLph() {
		return lph;
	}

	public void setLph(String lph) {
		this.lph = lph;
	}

	public String getLpqx() {
		return lpqx;
	}

	public void setLpqx(String lpqx) {
		this.lpqx = lpqx;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public Date getLpsx() {
		return lpsx;
	}

	public void setLpsx(Date lpsx) {
		this.lpsx = lpsx;
	}

}
