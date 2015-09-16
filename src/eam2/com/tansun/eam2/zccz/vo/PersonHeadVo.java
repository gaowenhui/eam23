package com.tansun.eam2.zccz.vo;

import com.tansun.eam2.common.model.orm.bo.CzStcztz;

public class PersonHeadVo extends CzStcztz {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7471948443622876460L;

	private String sfName;
	
	private String stxzName;
	
	private String CStzt;

	public String getCStzt() {
		return CStzt;
	}

	public void setCStzt(String stzt) {
		CStzt = stzt;
	}

	public String getSfName() {
		return sfName;
	}

	public void setSfName(String sfName) {
		this.sfName = sfName;
	}

	public String getStxzName() {
		return stxzName;
	}

	public void setStxzName(String stxzName) {
		this.stxzName = stxzName;
	}
}
