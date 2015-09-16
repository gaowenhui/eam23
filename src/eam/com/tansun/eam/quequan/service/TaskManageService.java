package com.tansun.eam.quequan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.HistoryService;
import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.TaskQuery;
import org.jbpm.api.TaskService;
import org.jbpm.api.cmd.Environment;
import org.jbpm.api.history.HistoryActivityInstance;
import org.jbpm.api.history.HistoryTask;
import org.jbpm.api.history.HistoryTaskQuery;
import org.jbpm.api.model.Transition;
import org.jbpm.api.task.Participation;
import org.jbpm.api.task.Task;
import org.jbpm.pvm.internal.env.EnvironmentFactory;
import org.jbpm.pvm.internal.env.EnvironmentImpl;
import org.jbpm.pvm.internal.model.ActivityImpl;
import org.jbpm.pvm.internal.model.ProcessDefinitionImpl;
import org.jbpm.pvm.internal.model.TransitionImpl;
import org.jbpm.pvm.internal.task.TaskImpl;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam.quequan.vo.Order;
import com.tansun.eam.quequan.vo.TaskHistoryVo;

@Service
public class TaskManageService implements InitializingBean {
	@Autowired
	public ProcessEngine processEngine;
	public RepositoryService repositoryService;
	public ExecutionService executionService;
	public TaskService taskService;
	public HistoryService historyService;
	public HistoryTaskQuery historyTaskQuery;
	public HistoryActivityInstance historyActivityInstance;

	public TaskQuery taskQuery;
	public HistoryTask historyTask;
	public Task task;

	public void afterPropertiesSet() throws Exception {
//		processEngine = new Configuration().buildProcessEngine();
		repositoryService = processEngine.getRepositoryService();
		executionService = processEngine.getExecutionService();
		taskService = processEngine.getTaskService();
		historyService = processEngine.getHistoryService();
	}

	public Object getHistory(String taskId) {
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId,
				variableNames);
		Task task = taskService.getTask(taskId);
		return variables.get(task.getExecutionId());
	}

	public void saveHistory(String taskId) {
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId,
				variableNames);
		Task task = taskService.getTask(taskId);
		String processId = task.getExecutionId();
		TaskHistoryVo vo = new TaskHistoryVo();
		vo.setProcessId(processId);
		vo.setTaskId(task.getId());
		vo.setTaskName(task.getName());
		vo.setUserName(task.getAssignee());
		HashMap historyTask = (HashMap) variables.get(processId);
		if (historyTask == null) {
			historyTask = new HashMap();
		}
		historyTask.put(taskId, vo);
		variables.put(processId, historyTask);
		taskService.setVariables(taskId, variables);
	}

	public void putVariables(String taskId, String key, String value) {
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId,
				variableNames);
		HashMap contents = (HashMap) variables.get("contents");
		if (contents == null) {
			contents = new HashMap();
		}
		contents.put(taskService.getTask(taskId).getName(), value);// + "-----"
		// + key
		variables.put("contents", contents);
		taskService.setVariables(taskId, variables);
	}

	public Object getVariable(String taskId, String key) {
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId,
				variableNames);
		return variables.get(key);
	}

	public void assignTask(String taskId, String userName) {
		taskService.assignTask(taskId, userName);
	}

	public List<Participation> getTaskParticipations(String taskId) {
		return taskService.getTaskParticipations(taskId);
	}

	public List<Participation> getTaskParticipations(String taskId,
			String outCome) {
		ProcessInstance pi = executionService
				.findProcessInstanceById(taskService.getTask(taskId)
						.getExecutionId());
		taskService.completeTask(taskId, outCome);
		this.task = taskService.createTaskQuery().processInstanceId(pi.getId())
				.uniqueResult();
		List<Participation> list = taskService.getTaskParticipations(this.task
				.getId());
		return list;
	}

	public HistoryTask getBeforeTaskByTaskId(Task task) {
		return historyService.createHistoryTaskQuery().executionId(
				task.getExecutionId()).orderDesc(HistoryTaskQuery.PROPERTY_ID)
				.uniqueResult();
	}

	public HistoryTask getBeforeTaskByTaskId(String taskId) {
		return getBeforeTaskByTaskId(taskService.getTask(taskId));
	}

	public Task queryTask(String taskId) {
		return taskService.getTask(taskId);
	}

	public Set getOutcomes(Task task) {
		return getOutcomes(task.getId());
	}

	public Set getOutcomes(String taskId) {
		return taskService.getOutcomes(taskId);
	}

	public List<ProcessDefinition> getProcessDefinitionList() {
		return repositoryService.createProcessDefinitionQuery().list();
	}

	public List<Task> getUserTask(String userName) {
		return taskService.findPersonalTasks(userName);
	}

	public void startProcess(String pdId, String userName) {
		Map<String, Object> variables = new HashMap<String, Object>();
		HashMap contents = new HashMap();
		variables.put("contents", contents);
		variables.put("order", new Order(userName));
		executionService.startProcessInstanceById(pdId, variables);
	}

	public void startJoinTask(String taskId, String outCome, String[] joinUser,
			String startJoinUser) {
		Set<String> variableNames = taskService.getVariableNames(taskId);
		Map<String, Object> variables = taskService.getVariables(taskId,
				variableNames);
		variables.put("users", joinUser);
		variables.put("quorum", joinUser.length);
		variables.put("startJoinUser", startJoinUser);
		taskService.setVariables(taskId, variables);
		taskService.completeTask(taskId, outCome, variables);
	}

	public void completeTask(String taskId) {
		taskService.completeTask(taskId);
	}

	public void completeTask(String taskId, String outCome) {
		taskService.completeTask(taskId, outCome);
	}

	public void deleteTask(String hisTaskId) {

		historyTaskQuery = processEngine.getHistoryService()
				.createHistoryTaskQuery();

		historyTask = historyTaskQuery.taskId(hisTaskId).uniqueResult();// orderAsc(HistoryTaskQuery.PROPERTY_CREATETIME)
		historyTask.getExecutionId();
		ProcessInstance pi = this.executionService
				.findProcessInstanceById(historyTask.getExecutionId());
		this.taskQuery = this.taskService.createTaskQuery();
		List<Task> taskList = taskQuery.processInstanceId(
				historyTask.getExecutionId()).list();

		for (Task task : taskList) {
			// pi.getProcessInstance().();
			// task.setExecution((Execution)null);
			TaskImpl taskimpl = (TaskImpl) taskService.getTask(task.getId());
			taskService.deleteTaskCascade(taskimpl.getId());
			// task
		}
	}

	
	/**  
	 * 动态创建连接当前任务节点至名称为destName的节点的Transition  
	 * @param taskId 任务节点ID  
	 * @param sourceName 源节点名称  
	 * @param destName  目标节点名称  
	 */  
	
	public void addOutTransition(ProcessDefinitionImpl pd, String sourceName,
			String destName) {

		EnvironmentFactory environmentFactory = (EnvironmentFactory) processEngine;
		EnvironmentImpl  env =null;
		//Environment env = null;
		try {
			env = environmentFactory.openEnvironment();
			// 取得当前流程的活动定义
			ActivityImpl sourceActivity = pd.findActivity(sourceName);
			// 取得目标的活动定义
			ActivityImpl destActivity = pd.findActivity(destName);
			// 为两个节点创建连接
			TransitionImpl transition = sourceActivity
					.createOutgoingTransition();
			transition.setName("退回");
			transition.setDestination(destActivity);
			sourceActivity.addOutgoingTransition(transition);
		} catch (Exception ex) {
			//logger.error(ex.getMessage());

		} finally {
			if (env != null) {
				 env.close();
			}

		}
	}

	/**
	 * 动态删除连接sourceName与destName的Transition
	 * 
	 * @param taskId
	 * @param sourceName
	 * @param destName
	 */

	public void removeOutTransition(ProcessDefinitionImpl pd,
			String sourceName, String destName) {
		EnvironmentFactory environmentFactory = (EnvironmentFactory) processEngine;
		Environment env = null;
		try {
			env = environmentFactory.openEnvironment();
			// 取得当前流程的活动定义
			ActivityImpl sourceActivity = pd.findActivity(sourceName);

			// 若存在这个连接，则需要把该连接删除
			List<Transition> trans = (List<Transition>) sourceActivity
					.getOutgoingTransitions();
			for (Transition tran : trans) {
				if (destName.equals(tran.getDestination().getName())) {// 删除该连接
					trans.remove(tran);
					break;
				}
			}
		} catch (Exception ex) {
			//logger.error(ex.getMessage());
		} finally {
			if (env != null) {
				// env.close();
			}
		}
	}
}
