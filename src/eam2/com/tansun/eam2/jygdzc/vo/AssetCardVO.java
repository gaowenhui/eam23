package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class AssetCardVO extends CommonBO{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6318950330229445524L;
	//ID
	private String id;
	//资产编号
	private  String  zcId;
	//卡片编号
	private  String  cardcode;
	//卡片名称
	private  String  zcname;
	//卡片类型
	private  String  typecode;
	//卡片状态
	private  String  cardState;
	//使用部门
	private  String  usepartment;
	//管理部门
	private  String  glbm;
	//一级分行
	private  String  firstbranch;
	//挂接开始日期（CardAssetHistory）
	private  String  gjksrq;
	//是否为主卡片（CardAssetHistory）
	private  String  sfwzkp;
	//存放地点 				add by  lantianbo
	private String saveadsress;
	//原值
	private double yz;
	//开始使用日期
	private Date ksdate;
	//使用年限
	private String synx;
	
	public String getCardcode() {
		return cardcode;
	}
	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}
	public String getZcname() {
		return zcname;
	}
	public void setZcname(String zcname) {
		this.zcname = zcname;
	}
	public String getTypecode() {
		return typecode;
	}
	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}
	public String getUsepartment() {
		return usepartment;
	}
	public void setUsepartment(String usepartment) {
		this.usepartment = usepartment;
	}
	public String getGlbm() {
		return glbm;
	}
	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}
	public String getFirstbranch() {
		return firstbranch;
	}
	public void setFirstbranch(String firstbranch) {
		this.firstbranch = firstbranch;
	}
	public String getGjksrq() {
		return gjksrq;
	}
	public void setGjksrq(String gjksrq) {
		this.gjksrq = gjksrq;
	}
	public String getSfwzkp() {
		return sfwzkp;
	}
	public void setSfwzkp(String sfwzkp) {
		this.sfwzkp = sfwzkp;
	}
	public String getZcId() {
		return zcId;
	}
	public void setZcId(String zcId) {
		this.zcId = zcId;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getSaveadsress() {
		return saveadsress;
	}
	public void setSaveadsress(String saveadsress) {
		this.saveadsress = saveadsress;
	}
	public double getYz() {
		return yz;
	}
	public void setYz(double yz) {
		this.yz = yz;
	}
	public Date getKsdate() {
		return ksdate;
	}
	public void setKsdate(Date ksdate) {
		this.ksdate = ksdate;
	}
	public String getSynx() {
		return synx;
	}
	public void setSynx(String synx) {
		this.synx = synx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCardState() {
		return cardState;
	}
	public void setCardState(String cardState) {
		this.cardState = cardState;
	}

}
