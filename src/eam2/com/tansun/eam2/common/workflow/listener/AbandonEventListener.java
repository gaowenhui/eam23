package com.tansun.eam2.common.workflow.listener;

import java.util.List;

import org.jbpm.api.history.HistoryTask;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.jbpm.api.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.rdp4j.workflow.common.model.PTAbandon;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.rdp4j.workflow.task.service.PTAbandonBS;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

public class AbandonEventListener implements EventListener{
	
	WorkflowUtil workflowutil;		//工作流工具类
	PTTodoBS todoBS;				//任务待办BS
	PTDidBS didBS;					//
	PTAbandonBS abandonBS;			//
	PTMessageBS messageBS;
	
	public static ApplicationContext ctx = JbpmServlet.ctx;
	
	public AbandonEventListener(){
		this.workflowutil = (WorkflowUtil) ctx.getBean("workflowUtil");
		this.todoBS = (PTTodoBS)ctx.getBean("PTTodoBS");
		this.didBS = (PTDidBS)ctx.getBean("PTDidBS");
		this.abandonBS = (PTAbandonBS)ctx.getBean("PTAbandonBS");
		this.messageBS = (PTMessageBS)ctx.getBean("PTMessageBS");
	}
	
	public void notify(EventListenerExecution arg0) throws Exception {
		String piId = arg0.getId();
		String taskId = this.workflowutil.findLastHisTask(piId).getId();
		PTTodo todo = this.todoBS.findPTTodoByTaskId(taskId);
		String url  = (String)arg0.getVariable("abandonUrl");
		this.didBS.saveOrUpdate(todo.toPTDid());
		PTAbandon abandon = todo.toPTAbandon();
		abandon.setUrl(url);
		this.abandonBS.SaveOrUpdate(abandon);
		this.sendMsg(this.didBS.findUserIdListByHeadId(todo.getHeadId()), todo.getUserId(),
			todo.getTitle()+"  ("+todo.getProcInstId()+")  已作废", 
			url,"headId="+todo.getHeadId()+"&id="+abandon.getId()
		);
		this.todoBS.finishTodoByHeadId(todo.getHeadId());
		this.didBS.delPTDidByHeadId(todo.getHeadId());
	}
	
	private void sendMsg(List didUserIdList,long sender,String msg,String url,String param){
		for(int i=0;i<didUserIdList.size();i++){
			long userId = (Long)didUserIdList.get(i);
			PTMessage message = new PTMessage();
			message.setSendUserId(sender);
			message.setUserId(userId);
			message.setMessage(msg);
			message.setUrl(url);
			message.setParam(param);
			message.setType("3");
			this.messageBS.SaveOrUpdate(message);
		}
	}
}
