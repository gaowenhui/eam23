package com.tansun.eam.quequan.action;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.HistoryService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.TaskQuery;
import org.jbpm.api.history.HistoryActivityInstance;
import org.jbpm.api.history.HistoryTask;
import org.jbpm.api.history.HistoryTaskQuery;
import org.jbpm.api.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.ActionContext;
import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.eam.quequan.service.TaskManageService;
import com.tansun.eam.quequan.ucc.IETCldUCC;
import com.tansun.eam.quequan.ucc.IETLcYjUCC;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.common.model.PTBizData;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;

/**
 * 确权处理单
 * @author xuecj
 * 
 */
@Service
public class ETCldAction extends CommonAction {
	/* 
	 * 流程相关的信息
	 */
	@Autowired
	TaskManageService taskManageService;
	@Autowired
	public ProcessEngine processEngine;


	public TaskQuery taskQuery;
	
	@Autowired
	WorkflowUtil workflowutil;

	public String userName; //用户名称
	public String pdId; //流程编号
	public String taskId;
	public String taskName;
	public String outCome;
	public String choiceUser;
	public String[] joinUser;
	public String content;
	
	public String pdName ; //流程名称
	public String userId; //用户编号
	public String deptId ; //部门编号
	public String leaderId = ""; //领导编号
	String[] userList; 
	
	
	/*  意见相关的信息 */
	public List<ETLcYjBO> listLcYj; // 拟稿意见
	public List<ETLcYjBO> listLcYj_ng; // 拟稿意见
	public List<ETLcYjBO> listLcYj_hqbmyj; // 会签部门意见
	public List<ETLcYjBO> listLcYj_ywyyz; // 业务运营组意见
	public List<ETLcYjBO> listLcYj_cbbmyj; // 承办部门意见
	public List<ETLcYjBO> listLcYj_psyj; // 批示意见
	 
	/* 业务相关信息 */
	@Autowired
	IETCldUCC etcldUCCimpl;
	@Autowired
	IETLcYjUCC etlcyjUCCimpl;
	
	public Long tid; //处理单编号
	public ETCldBO etcld = new ETCldBO();
	public PTBizData bizData = new PTBizData();
	public ETLcYjBO etlcyj = new ETLcYjBO();
	
	public List listzc; //资产列表
	public List listblyj; //办理依据



	public String draftsub() {
		Long cldbh= new Long(getSequence());
		//留言信息
		etlcyj.setTid(new Long(getSequence()));// 设置随机编号
		etlcyj.setCldbh(cldbh);//设置处理单编号
		etlcyj.setYjnr(content);
		etlcyj.setYjtjsj(new Date());
		etlcyj.setYjlx("拟稿意见");
		//处理单信息
		etcld.setCldbh(cldbh);
		//待办信息
		etcldUCCimpl.draftsub(etcld, bizData,etlcyj);
		return "list";
	}

	
	public String draftnoflow() {
		Long cldbh= new Long(getSequence());
		//留言信息
		etlcyj.setTid(new Long(getSequence()));// 设置随机编号
		etlcyj.setCldbh(cldbh);//设置处理单编号
		etlcyj.setYjnr(content);
		etlcyj.setYjtjsj(new Date());
		etlcyj.setYjlx("拟稿意见");
		//处理单信息
		etcld.setCldbh(cldbh);
		//待办信息
//		etcldUCCimpl.draftnoflow(etcld, bizData,etlcyj);
		return "list";
	}
	
	
	/**
	 * 结束任务
	 * 
	 * @return
	 */
	public String endTask() {
		
		workflowutil.completeTask(taskId,"结束");
		return myTask();
	}
	

	/**
	 * 下一环节
	 * 
	 * @return
	 * @throws NumberFormatException
	 * @throws UnOnlyOneException
	 */
	public String next() throws NumberFormatException {
		
		//流程相关
		request.setAttribute("task", taskManageService.queryTask(taskId));
		request.setAttribute("outComes", taskManageService.getOutcomes(taskId));
		request.setAttribute("contents", taskManageService.getVariable(taskId,"contents"));
		request.setAttribute("taskname",taskManageService.queryTask(taskId).getName());
	
		etcld = etcldUCCimpl.getETCldBObyId(new Long(tid));

		//获取流程意见列表
		Long cldbh=etcld.getCldbh();
		listLcYj = etlcyjUCCimpl.listLcYj(cldbh,"拟稿意见");
		listLcYj_ng = etlcyjUCCimpl.listLcYj(cldbh,"拟稿意见"); // 拟稿意见
		listLcYj_ywyyz = etlcyjUCCimpl.listLcYj(cldbh,"业务运营组意见"); // 业务运营组意见
		listLcYj_cbbmyj = etlcyjUCCimpl.listLcYj(cldbh,"承办部门意见"); // 承办部门意见
		listLcYj_psyj = etlcyjUCCimpl.listLcYj(cldbh,"批示意见"); // 批示意见
		listLcYj_hqbmyj = etlcyjUCCimpl.listLcYj(cldbh,"会签部门意见"); // 会签部门意见
		
		return "next";
	}

	/**
	 * 
	 * 显示流程跟踪 
	 * 
	 * @return
	 */
	public String toHistory() {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		request.setAttribute("history", taskManageService.getHistory(taskId));
		return "toHistory";
	}

	public String taskManage() {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		request.setAttribute("processDefinitionList", taskManageService.getProcessDefinitionList());
		request.setAttribute("taskList", taskManageService.getUserTask(UserThreadLocal.get().getUsername()));
		request.setAttribute("userName", UserThreadLocal.get().getUsername());
		return "taskManage";
	}

	/**
	 * 完成任务
	 * 
	 * @return
	 */
	public String completeTask() {
		//etcld = etcldUCCimpl.getETCldBObyId(tid);
		etlcyj.setTid(new Long(getSequence()));//流程意见编号
		etlcyj.setCldbh(etcld.getCldbh());//处理单编号
		etlcyj.setDeptId(new Long(1046));//部门编号
		etlcyj.setYjnr(content);//意见内容
		etlcyj.setYjtjr(String.valueOf(UserThreadLocal.get().getUserTid()));
		taskName=taskManageService.queryTask(taskId).getName();
		//填写保存流程意见
		etlcyj.setYjlx(hashLcYj(taskName));
		etlcyj.setYjtjsj(new Date());
		System.out.println("xuserId:================="+userId+"");
		etcldUCCimpl.completeTask(etcld, etlcyj, taskId, outCome,userId, content);
		etcld = etcldUCCimpl.getETCldBObyId(tid);
		return myTask();
	}

	/**
	 * 各节点与流程中意见类型对应关系
	 * @param key 节点名称 
	 * @return 意见类型
	 */
	public String hashLcYj(String key) {
		/*
		 * 各节点与流程中意见类型对应关系
		 */
		HashMap hashMap = new HashMap();
		hashMap.put("拟稿", "拟稿意见");
		hashMap.put("组审核", "承办部门意见");
		hashMap.put("拟稿部门综合处理", "拟稿意见");
		hashMap.put("部门领导审核", "批示意见");
		hashMap.put("承办部门综合处理", "承办部门意见");
		hashMap.put("承办部门组处理", "承办部门意见");
		hashMap.put("退回", "退回意见");
		hashMap.put("公司领导批示", "批示意见");
		hashMap.put("业务运营组处理", "业务运营组意见");
		return (String) hashMap.get(key);
	}
	

	public String assignTask() {
		taskManageService.assignTask(taskId, choiceUser);
		return taskManage();
	}
	
	public String startProcess() {
		taskManageService.startProcess(pdId, UserThreadLocal.get().getUsername());
		return taskManage();
	}

	public String myTask() {
		List<Task> myTask = workflowutil.getUserTask();
		this.request.setAttribute("myTask", myTask);
		return "myTask";
	}
	
	public String add() {
		return "add";
	}
	
	public String getSequence() {
		Date currentDateTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("MMddHHmm");
		String strYMDHMSS = formatter.format(currentDateTime);
		SecureRandom seeder = new SecureRandom();
		String strValue = "";
		try {
			String strRandom = String.valueOf(nextInt(0x186a0, 0xdbb9f, seeder.nextInt(0x5f5e100)));
			strValue = strYMDHMSS + strRandom;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return strValue;
	}

	private int nextInt(int iLower, int iUpper, long lSeed) {
		if (iUpper <= iLower) {
			return 0;
		} else {
			int iRandom = 0;
			Random random1 = new Random();
			random1.setSeed(lSeed);
			iRandom = iLower + random1.nextInt(iUpper);
			return iRandom;
		}
	}
	
	
	/**
	 * 
	 * 编辑处理单
	 * 
	 * @return
	 * @throws NumberFormatException
	 * @throws UnOnlyOneException
	 */
	public String edit() {
		String tid = (String) request.getParameter("tid");
		etcld = etcldUCCimpl.getETCldBObyId(new Long(tid));
		return "edit";

	}
}