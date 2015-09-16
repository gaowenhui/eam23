package com.tansun.eam2.zyzc.workflow.buy.action;

public class HkglWorkflowAction extends CommonWorkflowAction{

	/**
	 * 秘书处综合处理的下一环节，转到办理部门综合处理
	 * @return
	 */
	public String ngbmTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "ngbmTodoResult";
	}

	/**
	 * 办理部门综合处理的下一环节，转到秘书处综合处理
	 * @return
	 */
	public String cbbmTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "cbbmTodoResult";
	}

	/**
	 * 秘书处综合处理的已办
	 * @return
	 */
	public String mgbmDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "mgbmDidResult";
	}

	/**
	 * 办理部门综合处理的已办
	 * @return
	 */
	public String cbbmDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "mgbmDidResult";
	}
	
	/**
	 * 秘书处综合处理的提交
	 * @return
	 */
	public String xmslCommit(){
		this.saveTodo();
		this.workflowBS.completeTask(
			this.taskId,
			this.outCome,
			this.nextTodoUrl,this.didUrl
		);
		this.request.setAttribute("subSystem", "");
		return "completeTaskResult";
	}
}
