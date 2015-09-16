package com.tansun.eam.quequan.ucc.impl;

import java.util.Date;

import org.jbpm.api.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.eam.quequan.service.IETCldBS;
import com.tansun.eam.quequan.service.IETLcYjBS;
import com.tansun.eam.quequan.ucc.IETCldUCC;
import com.tansun.rdp4j.common.exception.BizException;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.workflow.common.model.PTBizData;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
@Service
public class ETCldUCCimpl implements IETCldUCC{
	
	@Autowired
	public IETCldBS etcldBSimpl;
	
	@Autowired
	public IETLcYjBS etlcyjBSimpl;
	
	@Autowired
	WorkflowUtil workflowutil;
	
	public void create(ETCldBO etcld) {
		etcldBSimpl.create(etcld);
	}

	
	public void save(ETCldBO etcld) {
		etcldBSimpl.save(etcld);
	}

	public void list() {
	}
	
	
	public ETCldBO getETCldBObyId(Long tid) {
		
		return etcldBSimpl.getETCldBObyId(tid);
	}

	
	public void saveCldAndBiz(PTBizData bizData, ETCldBO etcld) {
		etcldBSimpl.save(etcld);
	}
	
	public void completeTask(ETCldBO etcld,ETLcYjBO etlcyj,String taskId,
			String outCome, String userid, String content) {
		try {
			
			etcldBSimpl.save(etcld);
			etlcyjBSimpl.save(etlcyj);
			//流程转入下一个节点
			workflowutil.completeTask(taskId, outCome, userid, content);
			
			
		} catch (BizException e) {
			e.printStackTrace();
		}
	}


	public void draftsub(ETCldBO etcld,PTBizData  bizData ,ETLcYjBO etlcyj) {
		try {
			etcldBSimpl.save(etcld);
			bizData.setApprovalNumber("确权2010-" + etcld.getTid());
			bizData.setSummary("摘要:" + "确权2010-" + etcld.getTid());
			bizData.setBizId(etcld.getTid());
			bizData.setTitle(etcld.getZt());
			bizData.setDraftDeptId(new Long(0));
			bizData.setDraftUserId(UserThreadLocal.get().getUserTid());
			bizData.setDraftDate(new Date());
			bizData.setUrl("/quequan/quequan_next.do?tid=" + etcld.getTid());
			
			etlcyjBSimpl.save(etlcyj);//保存流程意见
			ProcessDefinition pd = workflowutil.findNewPDByName("确权主流程");
			workflowutil.startProcessInstance(pd.getId(), bizData);
			etlcyjBSimpl.save(etlcyj);//保存流程意见
		} catch (BizException e) {
			e.printStackTrace();
		}
	}


	public void editsub(ETCldBO etcld, PTBizData bizData, ETLcYjBO etlcyj) {
		
		ProcessDefinition pd = workflowutil.findNewPDByName("确权主流程");
		workflowutil.startProcessInstance(pd.getId(), bizData);		
		etcldBSimpl.save(etcld);
		
	}
}
