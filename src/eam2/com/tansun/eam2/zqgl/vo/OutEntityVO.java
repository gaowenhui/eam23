package com.tansun.eam2.zqgl.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class OutEntityVO extends CommonBO {


	//实体编号
	private String entityNumber;
	//实体名称
	private String entityName;
	//法人
	private String corporation;
	
	private String stlx;
	
	public String getStlx() {
		return stlx;
	}
	public void setStlx(String stlx) {
		this.stlx = stlx;
	}
	public String getEntityNumber() {
		return entityNumber;
	}
	public void setEntityNumber(String entityNumber) {
		this.entityNumber = entityNumber;
	}
	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
