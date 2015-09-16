package com.tansun.eam2.common.workflow.pgsc.vo;

import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;

public class ETParticipantVO {
	public PTUserBO userBO = new PTUserBO();
	public boolean disable = false;
	public String statu = "";
	public PTUserBO getUserBO() {
		return userBO;
	}
	public void setUserBO(PTUserBO userBO) {
		this.userBO = userBO;
	}
	public boolean isDisable() {
		return disable;
	}
	public void setDisable(boolean disable) {
		this.disable = disable;
	}
	public String getStatu() {
		return statu;
	}
	public void setStatu(String statu) {
		this.statu = statu;
	}
}
