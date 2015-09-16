package com.tansun.eam2.common.workflow.listener;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IPgscWfBS;
import com.tansun.rdp4j.workflow.common.model.PTAbandon;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.PTAbandonBS;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

public class EndEventListener implements EventListener{
	WorkflowUtil workflowutil;		//工作流工具类
	PTTodoBS todoBS;				//任务待办BS
	PTDidBS didBS;					//
	PTEndBS endBS;			//
	PTMessageBS messageBS;
	IPgscWfBS pgscWfBS;
	
	public static ApplicationContext ctx  = JbpmServlet.ctx;
	
	public EndEventListener(){
		this.workflowutil = (WorkflowUtil) ctx.getBean("workflowUtil");
		this.todoBS = (PTTodoBS)ctx.getBean("PTTodoBS");
		this.didBS = (PTDidBS)ctx.getBean("PTDidBS");
		this.endBS = (PTEndBS)ctx.getBean("PTEndBS");
		this.messageBS = (PTMessageBS)ctx.getBean("PTMessageBS");
		this.pgscWfBS = (IPgscWfBS)ctx.getBean(IPgscWfBS.class);
	}

	public void notify(EventListenerExecution arg0) throws Exception {
		String piId = arg0.getId();
		String taskId = this.workflowutil.findLastHisTask(piId).getId();
		PTTodo todo = this.todoBS.findPTTodoByTaskId(taskId);
		String url  = (String)arg0.getVariable("endUrl");
		String sheetId  = (String)arg0.getVariable("sheetId");
		todo.setSheetId(sheetId);
		this.todoBS.saveOrUpdate(todo);
		this.didBS.saveOrUpdate(todo.toPTDid());
		PTEnd end = todo.toPTEnd();
		end.setUrl(url);
		this.endBS.SaveOrUpdate(end);
		this.sendMsg(this.didBS.findUserIdListByHeadId(todo.getHeadId()), todo.getUserId(),
			todo.getTitle()+"  ("+todo.getProcInstId()+")  已办结", 
			url,"headId="+todo.getHeadId()+"&id="+end.getId()
		);
		this.todoBS.finishTodoByHeadId(todo.getHeadId());
		this.didBS.delPTDidByHeadId(todo.getHeadId());
		//如果是评估审查办结
		if(StringUtils.equals(end.getHeadType(), "评估审查")){
			//修改P_T_DID表中办理评估审查的办理人对应的已办信息。
			//1:查询历次办理的head_id
			String allIds = pgscWfBS.getAllHeadIdById(end.getHeadId());
			//2:根据head_id修改p_t_did中的statu为0,修改head_id为最后一次的id。
			if(allIds != null){
				String[] ids = allIds.split(",");
				for(String id : ids){
					List<PTDid> didList = this.didBS.findDidListByHeadId(id);
					for(PTDid did: didList){
						if("评估审查办理".equals(did.getTaskName())){
							did.setHeadId(end.getHeadId());
							did.setStatu("0");
							this.didBS.saveOrUpdate(did);
						}
					}
				}
			}			
		}
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
