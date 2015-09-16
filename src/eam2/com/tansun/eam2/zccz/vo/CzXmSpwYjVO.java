package com.tansun.eam2.zccz.vo;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;

public class CzXmSpwYjVO extends CzXmSpwYj{
	
	private static final long serialVersionUID = -7525699410290033208L;

	private String personType;
	
	private String agreeStr;
	
	private String disagreeStr;

	public String getPersonType() {
		return personType;
	}

	public void setPersonType(String personType) {
		this.personType = personType;
	}

	public String getAgreeStr() {
		return agreeStr;
	}

	public void setAgreeStr(String agreeStr) {
		this.agreeStr = agreeStr;
	}

	public String getDisagreeStr() {
		return disagreeStr;
	}

	public void setDisagreeStr(String disagreeStr) {
		this.disagreeStr = disagreeStr;
	}
	
	public void copyProperties(CzXmSpwYj bo){
		try {
			BeanUtils.copyProperties(this, bo);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
