package com.tansun.eam2.kpgl.vo;

import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 查询时候管理部门等查出的编码转化为名称VO
 * @author 陈煜霄
 * @date 2010-11-25
 */
public class CardNameVO extends CommonBO{

	private String glbmValue;

	private String usepartmentValue;

	private String usestateValue;

	private String addtypeValue;

	private String typecodeValue;

	public String getGlbmValue() {
		return glbmValue;
	}

	public void setGlbmValue(String glbmValue) {
		this.glbmValue = glbmValue;
	}

	public String getUsepartmentValue() {
		return usepartmentValue;
	}

	public void setUsepartmentValue(String usepartmentValue) {
		this.usepartmentValue = usepartmentValue;
	}

	public String getUsestateValue() {
		return usestateValue;
	}

	public void setUsestateValue(String usestateValue) {
		this.usestateValue = usestateValue;
	}

	public String getAddtypeValue() {
		return addtypeValue;
	}

	public void setAddtypeValue(String addtypeValue) {
		this.addtypeValue = addtypeValue;
	}

	public String getTypecodeValue() {
		return typecodeValue;
	}

	public void setTypecodeValue(String typecodeValue) {
		this.typecodeValue = typecodeValue;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
