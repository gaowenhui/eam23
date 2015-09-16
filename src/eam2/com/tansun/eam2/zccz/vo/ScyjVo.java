package com.tansun.eam2.zccz.vo;

import com.tansun.eam2.common.model.orm.bo.CzPgscJl;

public class ScyjVo extends CzPgscJl {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2569372331661723554L;
	
	private String scxmId  ;
	private String scxmText;
	private String scydId  ;
	private String scydText;
	private String jtyjId  ;
	private String jtyjText;
	
	public String getScxmId() {
		return scxmId;
	}
	public void setScxmId(String scxmId) {
		this.scxmId = scxmId;
	}
	public String getScxmText() {
		return scxmText;
	}
	public void setScxmText(String scxmText) {
		this.scxmText = scxmText;
	}
	public String getScydId() {
		return scydId;
	}
	public void setScydId(String scydId) {
		this.scydId = scydId;
	}
	public String getScydText() {
		return scydText;
	}
	public void setScydText(String scydText) {
		this.scydText = scydText;
	}
	public String getJtyjId() {
		return jtyjId;
	}
	public void setJtyjId(String jtyjId) {
		this.jtyjId = jtyjId;
	}
	public String getJtyjText() {
		return jtyjText;
	}
	public void setJtyjText(String jtyjText) {
		this.jtyjText = jtyjText;
	}

}
