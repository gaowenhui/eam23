package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class EvalVO2 extends CommonBO {
	String id;
	String biaoti;
	String scxmmc; // 审查项目
	String scydmc; //审查要点
	String jtyj;// 审查结论
	String bgmc; // 报告名称
	String memo; //备注
	String tjrqB;
	String tjrqE;
	
	
	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getTjrqB() {
		return tjrqB;
	}

	public void setTjrqB(String tjrqB) {
		this.tjrqB = tjrqB;
	}

	public String getTjrqE() {
		return tjrqE;
	}

	public void setTjrqE(String tjrqE) {
		this.tjrqE = tjrqE;
	}

	@Override
	public String getMid() {
		return null;
	}

	public String getScxmmc() {
		return scxmmc;
	}

	public void setScxmmc(String scxmmc) {
		this.scxmmc = scxmmc;
	}

	public String getScydmc() {
		return scydmc;
	}

	public void setScydmc(String scydmc) {
		this.scydmc = scydmc;
	}

	public String getJtyj() {
		return jtyj;
	}

	public void setJtyj(String jtyj) {
		this.jtyj = jtyj;
	}

	public String getBgmc() {
		return bgmc;
	}

	public void setBgmc(String bgmc) {
		this.bgmc = bgmc;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}