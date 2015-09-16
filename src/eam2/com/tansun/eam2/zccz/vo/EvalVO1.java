package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class EvalVO1 extends CommonBO {
	
	String bgmc; // 标题
	String cldh; // 处理单号
	String scjl;// 审查结论
	String jtyj; // 具体意见
	String jlxz; // 审查结论、结果
	String yjnr; //意见内容
	String spjl; //审批结论

	public String getBgmc() {
		return bgmc;
	}

	public void setBgmc(String bgmc) {
		this.bgmc = bgmc;
	}

	public String getCldh() {
		return cldh;
	}

	public void setCldh(String cldh) {
		this.cldh = cldh;
	}

	public String getScjl() {
		return scjl;
	}

	public void setScjl(String scjl) {
		this.scjl = scjl;
	}

	public String getJtyj() {
		return jtyj;
	}

	public void setJtyj(String jtyj) {
		this.jtyj = jtyj;
	}

	public String getJlxz() {
		return jlxz;
	}

	public void setJlxz(String jlxz) {
		this.jlxz = jlxz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getYjnr() {
		return yjnr;
	}

	public void setYjnr(String yjnr) {
		this.yjnr = yjnr;
	}

	public String getSpjl() {
		return spjl;
	}

	public void setSpjl(String spjl) {
		this.spjl = spjl;
	}

}
