package com.tansun.eam2.zyzc.workflow.buy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

public class CommonWorkflowAction extends WorkflowAction{
	@Autowired
	ICommonOpinionUcc commonOpinionUcc;
	
	public String todo(){
		String result = super.todo();
		String headId = (String)this.request.getAttribute("headId");
		List<PTCommonOpinionBO> opinionList = commonOpinionUcc
			.query4View(headId, (int)CommonGlobal.OPINION_YJYLX_LEADER);
		this.request.setAttribute("opinionList", opinionList);
		return result;
	}
}
