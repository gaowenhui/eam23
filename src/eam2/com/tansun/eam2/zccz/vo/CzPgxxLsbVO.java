package com.tansun.eam2.zccz.vo;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;

public class CzPgxxLsbVO extends CzPgxxLsb{
	
	private static final long serialVersionUID = -1124362005818005176L;
	//评估方法
	private String pgffName;
	//价值类型
	private String jzlxName;
	//处置方式
	private String czfsName;
	//股权实体省份
	private String sfName;
	//受托管理部门名称
	private String stglbmName;
	//债权种类名称
	private String zqzlName;
	//增减幅度
	private Double zjfdValue;
	
	public String getPgffName() {
		return pgffName;
	}
	public void setPgffName(String pgffName) {
		this.pgffName = pgffName;
	}
	public String getJzlxName() {
		return jzlxName;
	}
	public void setJzlxName(String jzlxName) {
		this.jzlxName = jzlxName;
	}
	public String getCzfsName() {
		return czfsName;
	}
	public void setCzfsName(String czfsName) {
		this.czfsName = czfsName;
	}
	public String getSfName() {
		return sfName;
	}
	public void setSfName(String sfName) {
		this.sfName = sfName;
	}
	
	public void copyValue(CzPgxxLsb lsb){
		try {
			BeanUtils.copyProperties(this, lsb);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	public String getStglbmName() {
		return stglbmName;
	}
	public void setStglbmName(String stglbmName) {
		this.stglbmName = stglbmName;
	}
	public String getZqzlName() {
		return zqzlName;
	}
	public void setZqzlName(String zqzlName) {
		this.zqzlName = zqzlName;
	}
	public Double getZjfdValue() {
		return zjfdValue;
	}
	public void setZjfdValue(Double zjfdValue) {
		this.zjfdValue = zjfdValue;
	}
}
