package com.tansun.eam2.zyzc.workflow.buy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.kpgl.service.ICardCommonBS;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
public class KpglWorkflowAction  extends CommonWorkflowAction{
	@Autowired 
	public ICardCommonBS bs;
	@Autowired
	private PTTodoBS ptBs;  
	@Autowired
	private WorkflowUtil workflowUtil;
	public String draftCommit(){
		String result = super.draftCommit(); 
		String headId = this.todo.getHeadId();
		CaShead head = bs.findCaSheadById(headId);
		List list = bs.findLcCardtempsBySheadId(headId);
		if(list!=null && list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				LcCardtemp temp = (LcCardtemp) list.get(i);
				if(temp!=null){
					String bodyId = String.valueOf(temp.getId());
					List list1 = bs.findRecordsBybodyId(bodyId, headId);
					if(list1!=null && list1.size()>0){
						for (int j = 0; j < list1.size(); j++) {
							Recordhistory r = (Recordhistory) list1.get(j);
							if(r!=null){
								r.setZhuangTai("1");
								bs.updateRecord(r);
							}
						}
					}	
				}
			}
		}
		head.setWfconfigCode(this.todo.getProcInstId());
		bs.update(head);
		return result; 
	}
	public String saveDraft(){
		String result = super.saveDraft();
//		if(StringUtils.equals("拟稿",this.taskName)){
//			String headId = this.headId;
//			if("".equals(headId)){
//				headId = "0";
//			}
//			CaShead head = bs.findCaSheadById(headId);
//			List list = bs.findLcCardtempsBySheadId(headId);
//			if(list!=null && list.size()>0){
//				for (int i = 0; i < list.size(); i++) {
//					LcCardtemp temp = (LcCardtemp) list.get(i);
//					if(temp!=null){
//						String bodyId = String.valueOf(temp.getId());
//						List list1 = bs.findRecordsBybodyId(bodyId, headId);
//						if(list1!=null && list1.size()>0){
//							for (int j = 0; j < list1.size(); j++) {
//								Recordhistory r = (Recordhistory) list1.get(j);
//								if(r!=null){
//									r.setZhuangTai("1");
//									bs.updateRecord(r);
//								}
//							}
//						}	
//					}
//				}
//			}
//			if(head!=null){
//				head.setWfconfigCode(this.todo.getProcInstId());
//				bs.update(head);
//			}
//		}
		return result;
	}
	
	public String endPi(){
		CaShead head = bs.findCaSheadById(headId);
		String taskId = workflowUtil.getTodoTaskIdByPiId(head.getWfconfigCode());
		PTTodo todo = ptBs.findPTTodoByTaskId(taskId);
		todo.setSheetId(head.getBianhao());
		ptBs.saveOrUpdate(todo);
		return super.endPi();
	}
}
