package com.tansun.eam2.common.workflow.pgsc.vo;

import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignBO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;

public class UnfinishedCounterSignVO {
	public ETCounterSignBO eTCounterSignBO = new ETCounterSignBO();
	public PTDeptBO pTDeptBO = new PTDeptBO();
	public ETCounterSignBO getETCounterSignBO() {
		return eTCounterSignBO;
	}
	public void setETCounterSignBO(ETCounterSignBO counterSignBO) {
		eTCounterSignBO = counterSignBO;
	}
	public PTDeptBO getPTDeptBO() {
		return pTDeptBO;
	}
	public void setPTDeptBO(PTDeptBO deptBO) {
		pTDeptBO = deptBO;
	}
}
