package com.tansun.eam.verifyright.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.task.Task;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam.verifyright.service.VerifyService;
import com.tansun.rdp4j.common.exception.BizException;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTBizData;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;

public class VerifyJoinAction extends CommonAction {
	public final static String DEPT_LIST = "deptList";
	public final static String ROLE_LIST = "roleList";
	public final static String USER_LIST = "userList";
	@Autowired
	IDeptUCC deptUCCimpl;
	@Autowired
	IUserBS userBSimpl;
	@Autowired
	IUserUCC userUCCimpl;
	@Autowired
	WorkflowUtil workflowutil;

	String pdName = "";
	String taskId = "";
	String outCome = "";
	String userId = "";
//	String deptId = "";
	String leaderId = "";
	String[] userList;
	PTBizData bizData = new PTBizData();
	String content = "";

//	public String dptList() throws BizException {
//		HashMap map = new HashMap();
//		List<PTDeptBO> dptList = deptUCCimpl.getAll();
//		for (PTDeptBO dept : dptList) {
//			List<PTUserBO> userList = userBSimpl.getUsersByDeptIdAndRoleId(dept
//					.getTid(), Long.parseLong("9003"));
//			System.out.println(userList.size());
//			map.put(dept, userList);
//		}
//		this.request.setAttribute("map", map);
//		return "dptList";
//	}

	public String startForkTask() throws NumberFormatException, BizException{
		workflowutil.startForkTask(taskId, outCome,leaderId,userList,content);
		return myTask();
	}
	/**
	 * 获取会签候选人
	 * @return
	 * @throws NumberFormatException
	 * @throws BizException
	 */
	public String getForkParticipations() throws NumberFormatException, BizException{
		String deptId = (String)workflowutil.getVariable(taskId, "deptId");
		List<PTUserBO> userList = this.userBSimpl.getUsersInDep(Long.valueOf(deptId));
		List<PTUserBO> leaderList = this.userUCCimpl.getUsersByDeptIdAndRoleId(Long.valueOf(deptId),(long)9004);
		this.request.setAttribute("userList", userList);
		this.request.setAttribute("leaderList", leaderList);
		this.request.setAttribute("taskId", taskId);
		this.request.setAttribute("outCome", outCome);
		this.request.setAttribute("content", content);
		return "forkUserList";
	}
	
	public String getParticipationList(){
		String nextTaskName = workflowutil.getNextTaskName(taskId, outCome);
		String deptList = workflowutil.getPDVariableValue(workflowutil.getProcessDefinitionByTaskId(taskId), nextTaskName+ this.DEPT_LIST);
		String roleList = workflowutil.getPDVariableValue(workflowutil.getProcessDefinitionByTaskId(taskId), nextTaskName+ this.ROLE_LIST);
		String userList = workflowutil.getPDVariableValue(workflowutil.getProcessDefinitionByTaskId(taskId), nextTaskName+ this.USER_LIST);
		this.request.setAttribute("deptList", deptList);
		this.request.setAttribute("roleList", roleList);
		this.request.setAttribute("userList", userList);
		return "participationList";
	}
	/**
	 * 获取候选人列表
	 * @return
	 * @throws BizException
	 */
	public String getParticipations() throws BizException {
		String nextTaskName = workflowutil.getNextTaskName(taskId, outCome);
		String deptList = workflowutil.getPDVariableValue(workflowutil
				.getProcessDefinitionByTaskId(taskId), nextTaskName
				+ this.DEPT_LIST);
		String roleList = workflowutil.getPDVariableValue(workflowutil
				.getProcessDefinitionByTaskId(taskId), nextTaskName
				+ this.ROLE_LIST);
		String userList = workflowutil.getPDVariableValue(workflowutil
				.getProcessDefinitionByTaskId(taskId), nextTaskName
				+ this.USER_LIST);
		String[] roles = new String[0];
		String[] users = new String[0];
		if(roles!=null&&roleList.trim().length()>0)
			roles = roleList.split(",");
		if(userList!=null&&userList.trim().length()>0)
			users = userList.split(",");
		String deptId = (String)this.workflowutil.getVariable(taskId, "deptId");
		List<PTUserBO> userBOList = this.workflowutil.geuUsersByRoleUserId(deptId,roles,users);
		this.request.setAttribute("users", userBOList);
		this.request.setAttribute("outCome", outCome);
		this.request.setAttribute("taskId", taskId);
		//return this.getUserByRoleAndDepId(deptList, roleList, userList);
		return "choiceUser";
	}
	
	// 得到人员
	public String getUserByRoleAndDepId(String deptList, String roleList,
			String userList) {
		List<Long> roleId = new ArrayList<Long>();
		 roleId.add(9005l);
		 roleId.add(9004l);
		 roleId.add(9007l);
		List<PTUserBO> result = userUCCimpl.getUsersByDeptIdAndRoleIds(
				(long) 1046, roleId);
		this.request.setAttribute("userList", result);
		return "selectUser";
	}
	/**
	 * 完成任务
	 * @return
	 */
	public String completeForkTask() {
		String taskName = this.workflowutil.getTaskName(taskId);
		if(taskName.equals("领导会签")){
			this.workflowutil.putVariables(taskId, "result", content);
			this.workflowutil.completeOtherTasks(taskId);
		}
		if(taskName.equals("等待会签结果")){
			String reslut = (String)this.workflowutil.getVariable(taskId, "result");
			String deptId = (String)this.workflowutil.getVariable(taskId, "deptId");
			String uperTaskID = (String)this.workflowutil.getVariable(taskId, "uperTaskID");
			String piId = (String)this.workflowutil.getVariable(taskId, "piId");
			Map<String,Object> map1 = new HashMap<String,Object>();
			map1.put("deptId", deptId);
			map1.put("content", reslut);
			this.workflowutil.putVariables(uperTaskID, piId, map1);
		}
		workflowutil.completeTask(taskId, outCome,content);
		return myTask();
	}
	/**
	 * 完成任务
	 * @return
	 */
	public String completeTask() {
		workflowutil.completeTask(taskId, outCome, userId,content);
		return myTask();
	}
	/**
	 * 转到任务页面
	 * @return
	 * @throws NumberFormatException
	 * @throws BizException
	 */
	public String toTask() throws NumberFormatException, BizException {
		this.request
				.setAttribute("outComes", workflowutil.getOutComes(taskId));
		this.request.setAttribute("taskId", taskId);
		this.request.setAttribute("taskName", workflowutil.getTaskName(taskId));
		this.request.setAttribute("contents", workflowutil.getVariable(taskId, "contents"));
		String uperTaskID = (String)workflowutil.getVariable(taskId, "uperTaskID");
		String uperTid = (String)workflowutil.getVariable(taskId, "uperTid");
		this.request.setAttribute("uperTaskID", uperTaskID);
		this.request.setAttribute("uperTid", uperTid);
		Task task = this.workflowutil.getTaskById(taskId);
		PTUserBO user = this.userBSimpl.getSingleById(Long.valueOf(task.getAssignee()));
		this.request.setAttribute("userName", user.getUsername());
		return "task";
	}

	public String startProcess() {
		bizData.setApprovalNumber("确权会签");
		bizData.setSummary("摘要:"+"确权会签");
		bizData.setBizId((long)0);
		bizData.setTitle("会签办理单");
		bizData.setDraftDeptId(new Long(0));
		bizData.setDraftUserId(UserThreadLocal.get().getUserTid());
		bizData.setDraftDate(new Date());
		bizData.setUrl("/verifyjoin/verifyjoin_toTask.do");
		ProcessDefinition pd = workflowutil.findNewPDByName(pdName);
		workflowutil.startProcessInstance(pd.getId(), bizData);
//		verifyService.startJoinProcess(pdName);
		return "psstart";
	}

	public String myTask() {
		List<Task> myTask = workflowutil.getUserTask();
		this.request.setAttribute("myTask", myTask);
		return "myTask";
	}

	public IDeptUCC getDeptUCCimpl() {
		return deptUCCimpl;
	}

	public void setDeptUCCimpl(IDeptUCC deptUCCimpl) {
		this.deptUCCimpl = deptUCCimpl;
	}

	public IUserBS getUserBSimpl() {
		return userBSimpl;
	}

	public void setUserBSimpl(IUserBS userBSimpl) {
		this.userBSimpl = userBSimpl;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getOutCome() {
		return outCome;
	}

	public void setOutCome(String outCome) {
		this.outCome = outCome;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public IUserUCC getUserUCCimpl() {
		return userUCCimpl;
	}

	public void setUserUCCimpl(IUserUCC userUCCimpl) {
		this.userUCCimpl = userUCCimpl;
	}

	public WorkflowUtil getWorkflowutil() {
		return workflowutil;
	}

	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}

	public PTBizData getBizData() {
		return bizData;
	}

	public void setBizData(PTBizData bizData) {
		this.bizData = bizData;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public String[] getUserList() {
		return userList;
	}

	public void setUserList(String[] userList) {
		this.userList = userList;
	}
}
