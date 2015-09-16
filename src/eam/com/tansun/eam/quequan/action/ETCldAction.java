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
 * ȷȨ����
 * @author xuecj
 * 
 */
@Service
public class ETCldAction extends CommonAction {
	/* 
	 * ������ص���Ϣ
	 */
	@Autowired
	TaskManageService taskManageService;
	@Autowired
	public ProcessEngine processEngine;


	public TaskQuery taskQuery;
	
	@Autowired
	WorkflowUtil workflowutil;

	public String userName; //�û�����
	public String pdId; //���̱��
	public String taskId;
	public String taskName;
	public String outCome;
	public String choiceUser;
	public String[] joinUser;
	public String content;
	
	public String pdName ; //��������
	public String userId; //�û����
	public String deptId ; //���ű��
	public String leaderId = ""; //�쵼���
	String[] userList; 
	
	
	/*  �����ص���Ϣ */
	public List<ETLcYjBO> listLcYj; // ������
	public List<ETLcYjBO> listLcYj_ng; // ������
	public List<ETLcYjBO> listLcYj_hqbmyj; // ��ǩ�������
	public List<ETLcYjBO> listLcYj_ywyyz; // ҵ����Ӫ�����
	public List<ETLcYjBO> listLcYj_cbbmyj; // �а첿�����
	public List<ETLcYjBO> listLcYj_psyj; // ��ʾ���
	 
	/* ҵ�������Ϣ */
	@Autowired
	IETCldUCC etcldUCCimpl;
	@Autowired
	IETLcYjUCC etlcyjUCCimpl;
	
	public Long tid; //�������
	public ETCldBO etcld = new ETCldBO();
	public PTBizData bizData = new PTBizData();
	public ETLcYjBO etlcyj = new ETLcYjBO();
	
	public List listzc; //�ʲ��б�
	public List listblyj; //��������



	public String draftsub() {
		Long cldbh= new Long(getSequence());
		//������Ϣ
		etlcyj.setTid(new Long(getSequence()));// ����������
		etlcyj.setCldbh(cldbh);//���ô������
		etlcyj.setYjnr(content);
		etlcyj.setYjtjsj(new Date());
		etlcyj.setYjlx("������");
		//������Ϣ
		etcld.setCldbh(cldbh);
		//������Ϣ
		etcldUCCimpl.draftsub(etcld, bizData,etlcyj);
		return "list";
	}

	
	public String draftnoflow() {
		Long cldbh= new Long(getSequence());
		//������Ϣ
		etlcyj.setTid(new Long(getSequence()));// ����������
		etlcyj.setCldbh(cldbh);//���ô������
		etlcyj.setYjnr(content);
		etlcyj.setYjtjsj(new Date());
		etlcyj.setYjlx("������");
		//������Ϣ
		etcld.setCldbh(cldbh);
		//������Ϣ
//		etcldUCCimpl.draftnoflow(etcld, bizData,etlcyj);
		return "list";
	}
	
	
	/**
	 * ��������
	 * 
	 * @return
	 */
	public String endTask() {
		
		workflowutil.completeTask(taskId,"����");
		return myTask();
	}
	

	/**
	 * ��һ����
	 * 
	 * @return
	 * @throws NumberFormatException
	 * @throws UnOnlyOneException
	 */
	public String next() throws NumberFormatException {
		
		//�������
		request.setAttribute("task", taskManageService.queryTask(taskId));
		request.setAttribute("outComes", taskManageService.getOutcomes(taskId));
		request.setAttribute("contents", taskManageService.getVariable(taskId,"contents"));
		request.setAttribute("taskname",taskManageService.queryTask(taskId).getName());
	
		etcld = etcldUCCimpl.getETCldBObyId(new Long(tid));

		//��ȡ��������б�
		Long cldbh=etcld.getCldbh();
		listLcYj = etlcyjUCCimpl.listLcYj(cldbh,"������");
		listLcYj_ng = etlcyjUCCimpl.listLcYj(cldbh,"������"); // ������
		listLcYj_ywyyz = etlcyjUCCimpl.listLcYj(cldbh,"ҵ����Ӫ�����"); // ҵ����Ӫ�����
		listLcYj_cbbmyj = etlcyjUCCimpl.listLcYj(cldbh,"�а첿�����"); // �а첿�����
		listLcYj_psyj = etlcyjUCCimpl.listLcYj(cldbh,"��ʾ���"); // ��ʾ���
		listLcYj_hqbmyj = etlcyjUCCimpl.listLcYj(cldbh,"��ǩ�������"); // ��ǩ�������
		
		return "next";
	}

	/**
	 * 
	 * ��ʾ���̸��� 
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
	 * �������
	 * 
	 * @return
	 */
	public String completeTask() {
		//etcld = etcldUCCimpl.getETCldBObyId(tid);
		etlcyj.setTid(new Long(getSequence()));//����������
		etlcyj.setCldbh(etcld.getCldbh());//�������
		etlcyj.setDeptId(new Long(1046));//���ű��
		etlcyj.setYjnr(content);//�������
		etlcyj.setYjtjr(String.valueOf(UserThreadLocal.get().getUserTid()));
		taskName=taskManageService.queryTask(taskId).getName();
		//��д�����������
		etlcyj.setYjlx(hashLcYj(taskName));
		etlcyj.setYjtjsj(new Date());
		System.out.println("xuserId:================="+userId+"");
		etcldUCCimpl.completeTask(etcld, etlcyj, taskId, outCome,userId, content);
		etcld = etcldUCCimpl.getETCldBObyId(tid);
		return myTask();
	}

	/**
	 * ���ڵ���������������Ͷ�Ӧ��ϵ
	 * @param key �ڵ����� 
	 * @return �������
	 */
	public String hashLcYj(String key) {
		/*
		 * ���ڵ���������������Ͷ�Ӧ��ϵ
		 */
		HashMap hashMap = new HashMap();
		hashMap.put("���", "������");
		hashMap.put("�����", "�а첿�����");
		hashMap.put("��岿���ۺϴ���", "������");
		hashMap.put("�����쵼���", "��ʾ���");
		hashMap.put("�а첿���ۺϴ���", "�а첿�����");
		hashMap.put("�а첿���鴦��", "�а첿�����");
		hashMap.put("�˻�", "�˻����");
		hashMap.put("��˾�쵼��ʾ", "��ʾ���");
		hashMap.put("ҵ����Ӫ�鴦��", "ҵ����Ӫ�����");
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
	 * �༭����
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