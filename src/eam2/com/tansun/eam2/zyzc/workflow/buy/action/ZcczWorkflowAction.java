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
public class ZcczWorkflowAction extends CommonWorkflowAction{

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
	private String saveFlag = "";
	private String circulationUrl;
	private String circulationPageTag;
	
	public String getCirculationPageTag() {
		return circulationPageTag;
	}

	public void setCirculationPageTag(String circulationPageTag) {
		this.circulationPageTag = circulationPageTag;
	}

	public String getCirculationUrl() {
		return circulationUrl;
	}

	public void setCirculationUrl(String circulationUrl) {
		this.circulationUrl = circulationUrl;
	}

	public String getSaveFlag() {
		return saveFlag;
	}

	public void setSaveFlag(String saveFlag) {
		this.saveFlag = saveFlag;
	}

	public String endView(){
		this.workflowBS.endView(this.id, request);
		WorkflowVO vo = (WorkflowVO)request.getAttribute("workflowVO");
		if(StringUtils.equals("zccz_nbgb", vo.pdk)){
			return "myEndViewResult";
		}
		return "endViewResult";
	}

	public String todo(){
		this.workflowBS.todo(this.taskId,this.request);
		if(StringUtils.equals("AsDraft", saveFlag)){
			return "saveTodoHyzz";
		}else if(StringUtils.equals("saveSummargSuggestion", saveFlag)){
			return "saveSummargSuggestion";
		}
		return "todoResult";
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
			stwfBS.modifyStztczStateSpz(this.todo.getProcInstId(), this.todo.getHeadId());  //更新表头
			stwfBS.uadateStJbxxStatuInCld(this.todo.getHeadId());  //更新表体
		}
		return result;
	}
	
	public String hgscTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hgscTodoResult";
	}
	
	public String hgscDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hgscDidResult";
	}
	
	public String hyzzTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hyzzTodoResult";
	}
	
	public String hyzzDidResult(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hyzzDidResult";
	}
	
	public String hzspyjTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hzspyjTodoResult";
	}
	
	public String hzspyjDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hzspyjDidResult";
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
