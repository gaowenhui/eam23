package com.tansun.eam2.common.workflow.counterSign.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignBO;
import com.tansun.eam2.common.workflow.counterSign.service.ETCounterSignBS;
import com.tansun.eam2.common.workflow.pgsc.service.ETPgscCounterSignBS;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;
//@Controller("CounterSignAction")
//@Scope("prototype")
public class CounterSignAction extends CommonAction {
	public String deptId = ""; // 部门ID
	public String assign = ""; // 执行人ID
	public String pdName = ""; // 流程名称
	public String assignpersonId = ""; // 执行人ID
	public String assignParticipantId = "";// 执行的流程参与ID
	public String counterSignId = ""; // 会签单ID
	public String users = "";
	public String outCome = ""; // 执行的下一步转换名称
	public String nextTaskUrl = ""; // 下一任务的URL
	public String didUrl = ""; // 办结的URL
	public String newParticipantTaskUrl = "";
	public String content = "";
	public String sendBackContent = ""; // 退回意见
	public String finalContent = ""; // 最终意见
	public String contentType = ""; // 意见类型
	public String contentSetType = ""; // 意见集合类型
	public String taskId = ""; // 对应的taskID
	public String bizPiId = "";
	public String roleList = "";
	public String counterSignUrl = "";
	public String headId = "";
	public String actionName = "";
	public String namespace = "";
	@Autowired
	WorkflowUtil workflowutil;
	@Autowired
	ETCounterSignBS eTCounterSignBS;
	@Autowired
	IDeptUCC iDeptUCCimpl;
	@Autowired
	ETPgscCounterSignBS eTPgscCounterSignBS;


	public String findCSPartUserList() {
		this.eTCounterSignBS.todo(taskId, this.request);
		return "findCSPartUserListResult";
	}

	/**
	 * 启动部门会签的流程入口方法 流程名称,执行人,所属部门从request中获取,然后启动会签对应的工作流
	 * 
	 * @return
	 */
	public String startPD() {
		String url = "countersign/countersign_todo.do";
		this.eTCounterSignBS.startCounterSign(pdName, this.bizPiId, "会签单", Long
				.parseLong(assign), Long.parseLong(deptId), 0, 0, 0, 0,
				new Date(), url, this.counterSignUrl, this.headId);
		return "psstart";
	}

	/**
	 * 从已办列表进入
	 * 
	 * @return
	 */
	public String toDid() {
		IUser user=UserThreadLocal.get();
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            String DLRbmmc= dept.getRsvdStr1();
            request.setAttribute("DLRbmmc", DLRbmmc);
		}
		this.request.setAttribute("isDid", "yes");
		this.request.setAttribute("workflowStateEAM", "signDid");
		this.eTCounterSignBS.toDid(taskId, this.request);
		ETCounterSignBO counterSign = (ETCounterSignBO)this.request.getAttribute("counterSign");
		this.namespace = counterSign.getUrl().split("/")[0];
		this.actionName = counterSign.getUrl().split("/")[1];
		this.request.setAttribute("headId", counterSign.getHeadId());
		return "todo";
	}

	/**
	 * 从待办列表进入
	 * 
	 * @return
	 */
	public String todo() {
		IUser user=UserThreadLocal.get();
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            String DLRbmmc= dept.getRsvdStr1();
            request.setAttribute("DLRbmmc", DLRbmmc);
		}
		this.request.setAttribute("isDid", "no");
		this.request.setAttribute("workflowStateEAM", "signTodo");
		this.eTCounterSignBS.todo(taskId, this.request);
		ETCounterSignBO counterSign = (ETCounterSignBO)this.request.getAttribute("counterSign");
		this.namespace = counterSign.getUrl().split("/")[0];
		this.actionName = counterSign.getUrl().split("/")[1];
		this.request.setAttribute("headId", counterSign.getHeadId());
		return "todo";
	}

	/**
	 * 得到参与者
	 * 
	 * @return
	 */
	public String getParticipants() {
		HttpSession session1 = ServletActionContext.getRequest().getSession();
		String deptList = this.eTCounterSignBS.newInitParticipants(Long
				.parseLong(counterSignId), deptId);
		session1.setAttribute(WorkflowAction.DEPT_LIST, deptList);
		session1.setAttribute(WorkflowAction.ROLE_LIST, "");
		session1.setAttribute(WorkflowAction.USER_LIST, "");
		session1.setAttribute(WorkflowAction.COUNTERSIGN_ID, counterSignId);
		session1.setAttribute(WorkflowAction.IF_COUNTERSIGN,
				WorkflowAction.IS_COUNTERSIGN);
		session1.setAttribute(WorkflowAction.MULTIPLE, "true");
		return "getParticipants";
	}

	/**
	 * 加签功能
	 * 
	 * @return
	 */
	public String addCounterSignParticipants() {
		String[] users =  this.getUserIds(this.users.split(","));
		for (int i = 0; i < users.length; i++) {
			this.eTCounterSignBS.startCounterSignParticipant(users[i], Long.parseLong(this.counterSignId),
					Long.parseLong(this.assignParticipantId),  Long.parseLong(this.taskId), newParticipantTaskUrl, pdName);
		}
		String newTaskId = this.eTCounterSignBS.addCounterSignParticipants(Long
				.parseLong(this.counterSignId), Long
				.parseLong(this.assignParticipantId), this
				.getUserIds(this.users.split(",")),
				Long.parseLong(this.taskId), this.outCome, this.nextTaskUrl,
				this.newParticipantTaskUrl, this.pdName);
		this.eTPgscCounterSignBS.editPortal(taskId,newTaskId);
		this.taskId = newTaskId;
		return this.todo();
	}

	private String[] getUserIds(String[] deptUsers) {
		String[] userIds = new String[deptUsers.length - 1];
		for (int i = 0; i < userIds.length; i++) {
			userIds[i] = deptUsers[i + 1];
		}
		return userIds;
	}

	/**
	 * 提交综合过程意见
	 * 
	 * @return
	 */
	public String commitZHGCContent() {
		String newTaskId = this.eTCounterSignBS.commitZHGCContent(
			this.taskId, this.outCome, this.content, 
			Integer.parseInt(this.contentSetType), 
			this.nextTaskUrl, this.didUrl
		);
		if(newTaskId==null){
			return this.toDid();
		}
		this.taskId = newTaskId;
		return this.todo();
	}

	/**
	 * 提交领导过程意见
	 * 
	 * @return
	 */
	public String commitLDGCContent() {
		String newTaskId = this.eTCounterSignBS.commitJBGCContent(
			this.taskId, this.outCome, this.content, 
			Integer.parseInt(this.contentSetType), 
			this.nextTaskUrl, this.didUrl
		);
		if(newTaskId==null){
			return this.toDid();
		}
		this.taskId = newTaskId;
		return this.todo();
	}

	/**
	 * 提交经办过程意见
	 * 
	 * @return
	 */
	public String commitJBGCContent() {
		String newTaskId = this.eTCounterSignBS.commitJBGCContent(
			this.taskId, this.outCome, this.content, 
			Integer.parseInt(this.contentSetType), 
			this.nextTaskUrl, this.didUrl
		);
		return this.toDid();
	}

	/**
	 * 提交退回意见
	 * 
	 * @return
	 */
	public String commitSendBackContent() {
		String newTaskId = this.eTCounterSignBS.commitFinalContent(
			this.taskId, this.outCome, this.sendBackContent, 
			Integer.parseInt(this.contentSetType), 
			Integer.parseInt(this.contentType), this.didUrl, this.headId
		);
		return this.toDid();
	}

	/**
	 * 提交最终意见
	 * 
	 * @return
	 */
	public String commitFinalContent() {
		String newTaskId = this.eTCounterSignBS.commitFinalContent(
			this.taskId, this.outCome, this.finalContent, 
			Integer.parseInt(this.contentSetType), 
			Integer.parseInt(this.contentType), 
			this.didUrl, this.headId
		);
		return this.toDid();
	}

	/**
	 * 得到会签列表
	 * 
	 * @return
	 */
	public String counterSignList() {
		this.eTCounterSignBS.counterSignList(this.bizPiId, this.request);
		return "counterSignList";
	}

	/**
	 * 得到当前是否已经启动会签
	 * 
	 * @return
	 */
	public String findCounter() {
		String headId = request.getParameter("headId");
		String counter = this.eTCounterSignBS.findCounter(headId);
		System.out.println(counter);
		if (counter != null && counter.length() > 0 && Integer.parseInt(counter) > 0) {
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print("success");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print("fail");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String getCounterSignUrl() {
		return counterSignUrl;
	}

	public void setCounterSignUrl(String counterSignUrl) {
		this.counterSignUrl = counterSignUrl;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getAssign() {
		return assign;
	}

	public void setAssign(String assign) {
		this.assign = assign;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public String getAssignpersonId() {
		return assignpersonId;
	}

	public void setAssignpersonId(String assignpersonId) {
		this.assignpersonId = assignpersonId;
	}

	public String getAssignParticipantId() {
		return assignParticipantId;
	}

	public void setAssignParticipantId(String assignParticipantId) {
		this.assignParticipantId = assignParticipantId;
	}

	public String getCounterSignId() {
		return counterSignId;
	}

	public void setCounterSignId(String counterSignId) {
		this.counterSignId = counterSignId;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public String getOutCome() {
		return outCome;
	}

	public void setOutCome(String outCome) {
		this.outCome = outCome;
	}

	public String getNextTaskUrl() {
		return nextTaskUrl;
	}

	public void setNextTaskUrl(String nextTaskUrl) {
		this.nextTaskUrl = nextTaskUrl;
	}

	public String getDidUrl() {
		return didUrl;
	}

	public void setDidUrl(String didUrl) {
		this.didUrl = didUrl;
	}

	public String getNewParticipantTaskUrl() {
		return newParticipantTaskUrl;
	}

	public void setNewParticipantTaskUrl(String newParticipantTaskUrl) {
		this.newParticipantTaskUrl = newParticipantTaskUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSendBackContent() {
		return sendBackContent;
	}

	public void setSendBackContent(String sendBackContent) {
		this.sendBackContent = sendBackContent;
	}

	public String getFinalContent() {
		return finalContent;
	}

	public void setFinalContent(String finalContent) {
		this.finalContent = finalContent;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentSetType() {
		return contentSetType;
	}

	public void setContentSetType(String contentSetType) {
		this.contentSetType = contentSetType;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getBizPiId() {
		return bizPiId;
	}

	public void setBizPiId(String bizPiId) {
		this.bizPiId = bizPiId;
	}

	public String getRoleList() {
		return roleList;
	}

	public void setRoleList(String roleList) {
		this.roleList = roleList;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getNamespace() {
		return namespace;
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}

	public WorkflowUtil getWorkflowutil() {
		return workflowutil;
	}

	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}

	public ETCounterSignBS getETCounterSignBS() {
		return eTCounterSignBS;
	}

	public void setETCounterSignBS(ETCounterSignBS counterSignBS) {
		eTCounterSignBS = counterSignBS;
	}

	public IDeptUCC getIDeptUCCimpl() {
		return iDeptUCCimpl;
	}

	public void setIDeptUCCimpl(IDeptUCC deptUCCimpl) {
		iDeptUCCimpl = deptUCCimpl;
	}

	// public String findUnCounterSignDeptZHList(){
	// String deptList =
	// this.eTCounterSignBS.findUnCounterSignDeptZHList(this.bizPiId);
	// HttpSession session1 = ServletActionContext.getRequest().getSession();
	// session1.setAttribute(WorkflowAction.ROLE_LIST, this.roleList);
	// session1.setAttribute(WorkflowAction.DEPT_LIST, deptList);
	// return "findUnCounterSignDeptZHListResult";
	// }

}
