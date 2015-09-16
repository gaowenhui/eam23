package com.tansun.eam2.zyzc.workflow.buy.action;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.common.vo.WorkflowVO;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

public class ZcczPerWorkflowAction extends CommonWorkflowAction{
	
	@Autowired
	private CzStcztzWfBS wfBS;
	@Autowired
	public CzStcztzWfBS stwfBS;
	@Autowired
	public ZcczWfBS zcczwfBS;
	@Autowired
	public PTTodoBS todoBS;
	@Autowired
	public WorkflowUtil workflowutil;
	public String hyOutCome = "";
	public String hyNextTodoUrl = "";
	public String hyDidUrl = "";
	private String circulationPageTag;
	
	public String getCirculationPageTag() {
		return circulationPageTag;
	}

	public void setCirculationPageTag(String circulationPageTag) {
		this.circulationPageTag = circulationPageTag;
	}
	
	public String hgscCommit(){
		this.saveTodo();
		this.workflowBS.completeTask(
			this.taskId,
			this.outCome,
			this.nextTodoUrl,this.didUrl
		);
		this.request.setAttribute("subSystem", "");
		return "completeTaskResult";
	}
	
	public String commitToXmsl(){
		workflowutil.putVariables(taskId, "xmslAssignee", String.valueOf(this.assignId.split(",")[1]));
		workflowutil.putVariables(taskId, "xmslAssigneeDeptId", String.valueOf(this.assignId.split(",")[0]));
		return super.completeTask();
	}
	
	public String draftCommit(){
		String result = super.draftCommit();
		if(StringUtils.equals("拟稿",this.todo.getTaskName())){
			wfBS.modifyStztczStateSpz(this.todo.getProcInstId(), this.todo.getHeadId());  //更新表头
			wfBS.uadatePersonStatuInCld(this.todo.getHeadId());  //更新表体
		}
		return result;
	}
	
	/**
	 * 合规审查的下一环节，转到项目受理
	 * @return
	 */
	public String hgscToXmslTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hgscToXmslTodoResult";
	}

	/**
	 * 项目受理的下一环节，转到合规审查
	 * @return
	 */
	public String xmslTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "xmslTodoResult";
	}

	/**
	 * 合规审查的已办
	 * @return
	 */
	public String hgscDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hgscDidResult";
	}

	/**
	 * 合规审查的下一环节，转到会议组织
	 * @return
	 */
	public String hgscTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hgscTodoResult";
	}

	/**
	 * 会议组织的已办
	 * @return
	 */
	public String hyzzDidResult(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hyzzDidResult";
	}

	/**
	 * 会议组织的下一环节，转到上会
	 * @return
	 */
	public String hyzzTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hyzzTodoResult";
	}

	/**
	 * 上会的已办
	 * @return
	 */
	public String shDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "shDidResult";
	}

	/**
	 * 上会的下一环节，转到审批
	 * @return
	 */
	public String shTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "shTodoResult";
	}

	/**
	 * 审批的已办
	 * @return
	 */
	public String spDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "spDidResult";
	}
	
	public String endPi(){
		PTTodo todo = this.todoBS.findPTTodoByTaskId(this.taskId);
		stwfBS.endLc(todo.getHeadId());
//		if(this.stwfBS.isAllXmIsOverByCldId(todo.getHeadId())){
//			CzHyxx hy = this.zcczwfBS.getHyxxByCldId(todo.getHeadId());
//			String hyTaskId = this.workflowutil.getTodoTaskIdByPiId(hy.getLcId());
//			this.workflowBS.completeTask(
//				hyTaskId, 
//				hyOutCome,
//				Long.parseLong(hy.getHyjyzlrbmid()),
//				Long.parseLong(hy.getHyjyzlr()),
//				hyNextTodoUrl, 
//				hyDidUrl
//			);
//		}
		return super.endPi();
	}
	
	public String endView() {
		this.workflowBS.endView(this.id, request);
		WorkflowVO vo = (WorkflowVO)request.getAttribute("workflowVO");
		if(StringUtils.equals("zccz_persondeal2", vo.pdk)){
			return "endViewResult2";
		}else{
			return "endViewResult";
		}
	}
	
	/**
	 * 覆盖父类的父类的传阅方法
	 */
	public String unSaveCirculation(){
		String[] tmpStr = this.assignId.split(",");
		String deptId = tmpStr[0];
		String[] users = new String[tmpStr.length-1];
		for(int i=0;i<tmpStr.length-1;i++){
			users[i] = tmpStr[i+1];
		}
		this.workflowBS.circulation(
			UserThreadLocal.get().getUserTid(),
			this.circulationTitle,
			this.url,
			this.param,  
			Long.parseLong(deptId),
			users,
			this.piId,
			"2"
		);
		return "circulationPage";
	}
}
