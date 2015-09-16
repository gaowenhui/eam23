package com.tansun.eam2.common.workflow.counterSign.vo;

import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignParticipantBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;

public class ETCounterSignParticipantVO {
	public ETCounterSignParticipantBO participantBO = new ETCounterSignParticipantBO();
	public PTUserBO userBO = new PTUserBO();
	public PTUserBO assignBO = new PTUserBO();
	public ETCounterSignParticipantBO getParticipantBO() {
		return participantBO;
	}
	public void setParticipantBO(ETCounterSignParticipantBO participantBO) {
		this.participantBO = participantBO;
	}
	public PTUserBO getUserBO() {
		return userBO;
	}
	public void setUserBO(PTUserBO userBO) {
		this.userBO = userBO;
	}
	public PTUserBO getAssignBO() {
		return assignBO;
	}
	public void setAssignBO(PTUserBO assignBO) {
		this.assignBO = assignBO;
	}
}
