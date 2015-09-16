package com.tansun.eam2.zccz.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class EvalVO3 extends CommonBO {

	String bianhao; // 标题
	String biaoti; // 处理单号
	String pinggujigou;// 评估机构
	String ngr; // 拟稿人
	String scjl;
	String spjg;
	String cldzt;
	String ngrqbegin;
	String ngrqend;
	String scrqbegin;
	String scrqend;
	String sprqbegin;
	String sprqend;

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getPinggujigou() {
		return pinggujigou;
	}

	public void setPinggujigou(String pinggujigou) {
		this.pinggujigou = pinggujigou;
	}


	public String getScjl() {
		return scjl;
	}

	public void setScjl(String scjl) {
		this.scjl = scjl;
	}

	public String getSpjg() {
		return spjg;
	}

	public void setSpjg(String spjg) {
		this.spjg = spjg;
	}

	public String getCldzt() {
		return cldzt;
	}

	public void setCldzt(String cldzt) {
		this.cldzt = cldzt;
	}

	
	public String getNgr() {
		return ngr;
	}

	public void setNgr(String ngr) {
		this.ngr = ngr;
	}

	public String getNgrqbegin() {
		return ngrqbegin;
	}

	public void setNgrqbegin(String ngrqbegin) {
		this.ngrqbegin = ngrqbegin;
	}

	public String getNgrqend() {
		return ngrqend;
	}

	public void setNgrqend(String ngrqend) {
		this.ngrqend = ngrqend;
	}

	public String getScrqbegin() {
		return scrqbegin;
	}

	public void setScrqbegin(String scrqbegin) {
		this.scrqbegin = scrqbegin;
	}

	public String getScrqend() {
		return scrqend;
	}

	public void setScrqend(String scrqend) {
		this.scrqend = scrqend;
	}

	public String getSprqbegin() {
		return sprqbegin;
	}

	public void setSprqbegin(String sprqbegin) {
		this.sprqbegin = sprqbegin;
	}

	public String getSprqend() {
		return sprqend;
	}

	public void setSprqend(String sprqend) {
		this.sprqend = sprqend;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
