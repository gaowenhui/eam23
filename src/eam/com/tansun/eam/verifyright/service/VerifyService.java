package com.tansun.eam.verifyright.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.HistoryService;
import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.ProcessDefinitionQuery;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.ProcessInstanceQuery;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.TaskQuery;
import org.jbpm.api.TaskService;
import org.jbpm.api.model.Transition;
import org.jbpm.api.task.Task;
import org.jbpm.pvm.internal.env.EnvironmentFactory;
import org.jbpm.pvm.internal.env.EnvironmentImpl;
import org.jbpm.pvm.internal.model.ActivityImpl;
import org.jbpm.pvm.internal.model.ExecutionImpl;
import org.jbpm.pvm.internal.model.ProcessDefinitionImpl;
import org.jbpm.pvm.internal.model.VariableDefinitionImpl;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.exception.BizException;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.workflow.common.model.PTBizData;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;

@Service
public class VerifyService implements InitializingBean {
	@Autowired
	public ProcessEngine processEngine;
	public RepositoryService repositoryService;
	public ExecutionService executionService;
	public TaskService taskService;
	public HistoryService historyService;
	public EnvironmentImpl evn;
	
	@Autowired
	IUserBS userBSimpl;
	@Autowired
	IUserUCC userUCCimpl;
	@Autowired
	WorkflowUtil workflowutil;
	
	public void afterPropertiesSet() throws Exception {
//		processEngine = new Configuration().buildProcessEngine();
		repositoryService = processEngine.getRepositoryService();
		executionService = processEngine.getExecutionService();
		taskService = processEngine.getTaskService();
		historyService = processEngine.getHistoryService();
	}
	
	/**
	 * 根据任务ID获得任务名称
	 * @param taskId
	 * @return
	 */
	public String getTaskName(String taskId){
		return this.taskService.getTask(taskId).getName();
	}
	
	/**
	 * 开启环境
	 */
	public void openEnv(){
		this.evn = ((EnvironmentFactory)this.processEngine).openEnvironment();
	}
	/**
	 * 关闭环境
	 */
	public void closeEnv(){
		this.evn.close();
		this.evn = null;
	}
	/**
	 * 将变量存入当前任务
	 * @param taskId 任务ID
	 * @param key 变量KEY
	 * @param value 变量值
	 */
	public void putVariables(String taskId,String key,String value){
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId, variableNames);
		variables.put(key, value);
		taskService.setVariables(taskId, variables);
	}
	/**
	 * 将变量数组存入当前任务
	 * @param taskId 任务ID
	 * @param key 变量KEY
	 * @param value 变量数组
	 */
	public void putVariables(String taskId,String key,String[] value){
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId, variableNames);
		variables.put(key, value);
		taskService.setVariables(taskId, variables);
	}
	/**
	 * 将变量MAP存入当前任务
	 * @param taskId 任务ID
	 * @param key 变量KEY
	 * @param value 变量MAP
	 */
	public void putVariables(String taskId,String key,Map<String, Object> value){
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId, variableNames);
		variables.put(key, value);
		taskService.setVariables(taskId, variables);
	}
	
	public void putVariables(String taskId,String value){
		String key = taskService.getTask(taskId).getName()+"——"+UserThreadLocal.get().getUsername();
		this.putContentVariables(taskId, key, value);
	}
	/**
	 * 将变量存入contents MAP类型变量
	 * @param taskId 任务ID
	 * @param key 变量KEY
	 * @param value 变量MAP
	 */
	public void putContentVariables(String taskId,String key,String value){
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId, variableNames);
		HashMap contents = (HashMap)variables.get("contents");
		if(contents==null){
			contents = new HashMap();
		}
		contents.put(key, value);
		variables.put("contents", contents);
		taskService.setVariables(taskId, variables);
	}
	/**
	 * 获取变量值
	 * @param taskId 任务ID
	 * @param key 变量KEY
	 * @return
	 */
	public Object getVariable(String taskId,String key){
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId, variableNames);
		return variables.get(key);
	}
	/**
	 * 完成任务
	 * @param taskId 任务ID
	 * @param outCome 任务转向名称
	 */
	public void completeTask(String taskId,String outCome){
		taskService.completeTask(taskId, outCome);
	}
	/**
	 * 完成任务，同时设置下个环节的处理人并保存当前环节的内容
	 * @param taskId
	 * @param outCome
	 * @param nextTaskAssignee
	 * @param content
	 */
	public void completeTask(String taskId,String outCome,String nextTaskAssignee,String content){
		this.putVariables(taskId, content);
		this.completeTask(taskId, outCome, nextTaskAssignee);
	}
	/**
	 * 完成任务，并保存变量MAP
	 * @param taskId
	 * @param outCome
	 * @param nextTaskAssignee
	 * @param variables
	 */
	public void completeTask(String taskId,String outCome,String nextTaskAssignee,Map<String, Object> variables){
		TaskQuery tq = taskService.createTaskQuery();
		ProcessInstanceQuery piq = executionService.createProcessInstanceQuery();
		ProcessInstance pi = piq.processInstanceId(
				taskService.getTask(taskId).getExecutionId()).uniqueResult();
		if(variables!=null){
			taskService.completeTask(taskId, outCome,variables);
		}else{
			taskService.completeTask(taskId, outCome);
		}
		Task nextTask = tq.processInstanceId(pi.getId()).uniqueResult();
		taskService.assignTask(nextTask.getId(), nextTaskAssignee);
	}
	
	public void completeTask(String taskId,String outCome,String nextTaskAssignee){
		TaskQuery tq = taskService.createTaskQuery();
		ProcessInstanceQuery piq = executionService.createProcessInstanceQuery();
		ProcessInstance pi = piq.processInstanceId(
				taskService.getTask(taskId).getExecutionId()).uniqueResult();
		taskService.completeTask(taskId, outCome);
		Task nextTask = tq.processInstanceId(pi.getId()).uniqueResult();
		taskService.assignTask(nextTask.getId(), nextTaskAssignee);
	}
	/**
	 * 通过任务ID获取流程定义
	 */
	public ProcessDefinitionImpl getProcessDefinitionByTaskId(String taskId){
		this.openEnv();
		Task task = taskService.getTask(taskId);
		ProcessInstanceQuery piq = executionService.createProcessInstanceQuery();
		ProcessInstance pi = piq.processInstanceId(task.getExecutionId()).uniqueResult();
		ProcessDefinitionImpl pdi = ((ExecutionImpl)pi).getProcessDefinition();
		this.closeEnv();
		return pdi;
	}
	/**
	 * 获取流程的变量
	 * @param pdl
	 * @param variableName
	 * @return
	 */
	public String getPDVariableValue(ProcessDefinitionImpl pdl,String variableName){
		List<VariableDefinitionImpl> l = pdl.getVariableDefinitions();
		for(VariableDefinitionImpl vdl:l){
			if(vdl.getName().equals(variableName)){
				return (String)(vdl.getInitExpression().evaluate());
			}
		}
		return "";
	}
	/**
	 * 获取下个任务的名称
	 * @param taskId
	 * @param outCome
	 * @return
	 */
	public String getNextTaskName(String taskId,String outCome){
		Task task = taskService.getTask(taskId);
		ProcessDefinitionImpl pd = this.getProcessDefinitionByTaskId(taskId);
		ActivityImpl activity = pd.getActivity(task.getActivityName());
		Transition ts = activity.findOutgoingTransition(outCome);
		return ts.getDestination().getName();
	}
	
	/**
	 * 获取任务的转向列表
	 * @param taskId
	 * @return
	 */
	public Set<String> getOutComes(String taskId){
		return taskService.getOutcomes(taskId);
	}
	/**
	 * 获取当前人员的代办任务
	 * @return
	 */
	public List<Task> getUserTask(){
		IUser user = UserThreadLocal.get();
		return taskService.findPersonalTasks(""+user.getUserTid());
	}
	/**
	 * 获取某个用户的代办任务
	 * @param userId
	 * @return
	 */
	public List<Task> getUserTask(String userId){
		return taskService.findPersonalTasks(userId);
	}
	/**
	 * 启动会签流程
	 * @param pdName
	 */
	public void startJoinProcess(String pdName){
		ProcessDefinition pd = this.findNewPDByName(pdName);
		IUser user = UserThreadLocal.get();
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("assignee", ""+user.getUserTid());
		executionService.startProcessInstanceById(pd.getId(),variables);
	}
	/**
	 * 通过流程名称获取流程定义
	 * @param pdName
	 * @return
	 */
	public ProcessDefinition findNewPDByName(String pdName){
		ProcessDefinitionQuery pdQuery = repositoryService.createProcessDefinitionQuery();
		return pdQuery.processDefinitionName(pdName)
			.orderDesc(ProcessDefinitionQuery.PROPERTY_VERSION)
			.list().get(0);
	}
	/**
	 * 开始会签任务
	 * @param taskId
	 * @param outCome
	 * @param leaderId
	 * @param userList
	 * @param content
	 * @throws NumberFormatException
	 * @throws BizException
	 */
	public void startForkTask(String taskId, String outCome, String leaderId,
			String[] userList, String content) throws NumberFormatException, BizException {
		this.putVariables(taskId, content);
		this.putVariables(taskId, "leader",leaderId);
		this.putVariables(taskId, "users",userList);
		this.putVariables(taskId, "startJoinUser",""+UserThreadLocal.get().getUserTid());
		for(String userId:userList){
			PTUserBO user = this.userBSimpl.getSingleById(Long.valueOf(userId));
			this.putContentVariables(taskId, "经办会签——"+user.getUsername(),  "");
		}
		this.completeTask(taskId, outCome);
	}
	/**
	 * 开始会签流程
	 * @param pdName
	 * @param strTaskId
	 * @param strTid
	 * @param strZongheId
	 * @param strDeptId
	 * @return
	 */
	public String startForkProc(String pdName, String strTaskId, String strTid,
			String strZongheId, String strDeptId) {
		PTBizData bizData = new PTBizData();
		bizData.setApprovalNumber("确权会签");
		bizData.setSummary("摘要:"+"确权会签");
		bizData.setBizId((long)0);
		bizData.setTitle("确权会签");
		bizData.setDraftDeptId(new Long(0));
		bizData.setDraftUserId(UserThreadLocal.get().getUserTid());
		bizData.setDraftDate(new Date());
		bizData.setUrl("/verifyjoin/verifyjoin_toTask.do");
		ProcessDefinition pd = this.findNewPDByName(pdName);
		Map<String, Object> variables = new HashMap();
		variables.put("assignee", strZongheId);
		variables.put("deptId", strDeptId);
		variables.put("uperTaskID", strTaskId);
		variables.put("uperTid", strTid);
		return workflowutil.startProcessInstance(pd.getId(), bizData,variables);
	}
	/**
	 * 完成本流程的其他代办任务
	 * @param taskId
	 */
	public void completeOtherTasks(String taskId) {
		String piId = (String)this.getVariable(taskId, "piId");
		TaskQuery tq = this.taskService.createTaskQuery();
		List<Task> taskList = tq.processInstanceId(piId).list();
		for(Task otherTask:taskList){
			if(otherTask.getName().equals("经办会签")){
				this.taskService.completeTask(otherTask.getId(),"提交办理单");
			}
		}
	}
	/**
	 * 通过任务ID获得任务对象
	 * @param taskId
	 * @return
	 */
	public Task getTaskById(String taskId){
		return this.taskService.getTask(taskId);
	}
	/**
	 * 通过部门、角色、用户ID获取用户列表
	 * @param deptId
	 * @param roles
	 * @param users
	 * @return
	 * @throws BizException
	 */
	public List<PTUserBO> geuUsersByRoleUserId(String deptId,String[] roles, String[] users) throws BizException {
		List<Long> roleIds = new ArrayList<Long>();
		for(String roleId : roles){
			roleIds.add(Long.valueOf(roleId));
		}
		Collection<Long> roleList = new ArrayList<Long>(roleIds);
		List<PTUserBO> userList= new ArrayList();// = this.userBSimpl.getUsersByDeptIdAndRoleIds(Long.valueOf(deptId), roleList);
		for(String userId : users){
			PTUserBO user = this.userBSimpl.getSingleById(Long.valueOf(userId));
			userList.add(user);
		}
		return userList;
	}
}
