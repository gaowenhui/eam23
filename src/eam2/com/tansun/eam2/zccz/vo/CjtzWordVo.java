package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class CjtzWordVo extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5406394393868576210L;

	private String hyqs = "";//会议次数
	
	private String zqs = "";//总期数（count（CzHyxx（hylx＝'承继投资'）））
	
	private String hyrq = "";//会议日期
	
	private String hysj = "";//会议时间
	
	private String hydd = "";//会议地点
	
	private String hyzc = "";//会议主持人
	
	private String cxry = "";//出席人员
	
	private String wcxry = "";//为出席人员
	
	private String jcy = "";//检查员
	
	private String hyjyzlr = "";//会议记录人
	
	private String zhengwen = "";//正文
	
	private String fsbm = "";//拟稿部门（项目名称）
	
	private String dqrq = "";//当前日期

	public String getHyqs() {
		return hyqs;
	}

	public void setHyqs(String hyqs) {
		this.hyqs = hyqs;
	}

	public String getZqs() {
		return zqs;
	}

	public void setZqs(String zqs) {
		this.zqs = zqs;
	}

	public String getHyrq() {
		return hyrq;
	}

	public void setHyrq(String hyrq) {
		this.hyrq = hyrq;
	}

	public String getHysj() {
		return hysj;
	}

	public void setHysj(String hysj) {
		this.hysj = hysj;
	}

	public String getHydd() {
		return hydd;
	}

	public void setHydd(String hydd) {
		this.hydd = hydd;
	}

	public String getHyzc() {
		return hyzc;
	}

	public void setHyzc(String hyzc) {
		this.hyzc = hyzc;
	}

	public String getCxry() {
		return cxry;
	}

	public void setCxry(String cxry) {
		this.cxry = cxry;
	}

	public String getWcxry() {
		return wcxry;
	}

	public void setWcxry(String wcxry) {
		this.wcxry = wcxry;
	}

	public String getJcy() {
		return jcy;
	}

	public void setJcy(String jcy) {
		this.jcy = jcy;
	}

	public String getHyjyzlr() {
		return hyjyzlr;
	}

	public void setHyjyzlr(String hyjyzlr) {
		this.hyjyzlr = hyjyzlr;
	}

	public String getZhengwen() {
		return zhengwen;
	}

	public void setZhengwen(String zhengwen) {
		this.zhengwen = zhengwen;
	}

	public String getFsbm() {
		return fsbm;
	}

	public void setFsbm(String fsbm) {
		this.fsbm = fsbm;
	}

	public String getDqrq() {
		return dqrq;
	}

	public void setDqrq(String dqrq) {
		this.dqrq = dqrq;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
