package com.tansun.eam2.zccz.vo;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;

public class CztzfaXxVO extends CzCztzfaXx{

	private static final long serialVersionUID = -3703288824127390088L;
	//预计处置回收金额万元
	private String yjczhsjewy;
	//预计损失金额万元
	private String yjssjewy;
	//预计处置费用
	private String yjczfyStr;
	
	public String getYjczhsjewy() {
		return yjczhsjewy;
	}

	public void setYjczhsjewy(String yjczhsjewy) {
		this.yjczhsjewy = yjczhsjewy;
	}

	public String getYjssjewy() {
		return yjssjewy;
	}

	public void setYjssjewy(String yjssjewy) {
		this.yjssjewy = yjssjewy;
	}

	public String getYjczfyStr() {
		return yjczfyStr;
	}

	public void setYjczfyStr(String yjczfyStr) {
		this.yjczfyStr = yjczfyStr;
	}

	public void copyBO(CzCztzfaXx bo){
		try {
			BeanUtils.copyProperties(this, bo);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
