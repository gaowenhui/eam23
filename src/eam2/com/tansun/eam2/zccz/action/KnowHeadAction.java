package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskHead;
import com.tansun.eam2.zccz.ucc.IKnowOperateUCC;
import com.tansun.eam2.zccz.ucc.IKnowQueryUCC;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

/**
 * 知识库维护表头
 * 
 * @author 陈煜霄
 * @date 2010-12-22
 */

public class KnowHeadAction extends CommonAction {

	private CzSczskHead head;
	private CzSczskBdxx body;
	@Autowired
	private IKnowOperateUCC knowOperateUCCImpl;
	@Autowired
	private IKnowQueryUCC knowQueryUCCImpl;
	@Autowired
	private IUserUCC iUserUCCimpl;
	@Autowired
	public ICodeGenerator iCodeGenerator;
	@Autowired
	private IDeptUCC deptUCCimpl;
	@Autowired
	private WorkflowUtil workflowutil;
	@Autowired
	PTTodoBS todoBS;
	public String pdk = "";
	/**
	 * 进入表头页面保存一条数据
	 * 
	 * @return
	 */
	public String newHead() {
//		String piId = this.workflowutil.getPiIdByPDK(this.pdk);
//		String userName = null;
//		Long userId = null;
//		if(piId!=null&&!piId.equals("")){
//			List todoList = this.todoBS.findUnfinishedTodoListByPiId(piId);
//			if(todoList.size()>0){
//				PTTodo todo = (PTTodo)todoList.get(0);
//				userId = todo.getUserId();
//				userName = knowOperateUCCImpl.getUserName(String.valueOf(userId));
//				request.setAttribute("userName", userName);
//			}else{
//				head = new CzSczskHead();
//				// 得到登录人的信息
//				userId = UserThreadLocal.get().getUserTid();
//				PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
//				String ngrmc = userBo.getUsername();
//				Long ngbmbh = userBo.getTid();
//				head.setNigaorenxm(ngrmc);
//				head.setNigaoren(String.valueOf(ngbmbh));
//				head.setNgrq(new Date());
//				List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
//						.getUserTid());
//				if (list != null && list.size() > 0) {
//					PTDeptBO dept = list.get(0);
//					head.setNgbm(String.valueOf(dept.getRsvdNum1()));
//					head.setNgbmmc(dept.getRsvdStr1());
//				}
//				knowOperateUCCImpl.saveHead(head);
//				request.setAttribute("headId", head.getId());
//			}
		Long userId = null;
		String str = knowQueryUCCImpl.getKnowInFlow();
		if(str!=""&&str!=null){
			String[] str1 = str.split(",");
			String id = str1[0];
			String userName = knowOperateUCCImpl.getUserName(String.valueOf(id));
			String flow = str1[1];
			request.setAttribute("userName", userName);
		}else{
			head = new CzSczskHead();
			// 得到登录人的信息
			userId = UserThreadLocal.get().getUserTid();
			PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
			String ngrmc = userBo.getUsername();
			Long ngbmbh = userBo.getTid();
			head.setNigaorenxm(ngrmc);
			head.setNigaoren(String.valueOf(ngbmbh));
			head.setNgrq(new Date());
			List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
					.getUserTid());
			if (list != null && list.size() > 0) {
				PTDeptBO dept = list.get(0);
				head.setNgbm(String.valueOf(dept.getRsvdNum1()));
				head.setNgbmmc(dept.getRsvdStr1());
			}
			knowOperateUCCImpl.saveHead(head);
			request.setAttribute("headId", head.getId());
		}
		return "tomodify";
	}
	
	/**
	 * 修改表头
	 * 
	 * @return
	 */
	public String saveHead() {
		knowOperateUCCImpl.updateHead(head);
		request.setAttribute("headId", head.getId());
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		// ====================编号作废所需参数
		String taskId = (String) request.getParameter("taskId");
		if (StringUtils.isNotEmpty(taskId)) {
			workflowutil.putVariables(taskId, "codeType", "sczsk");
			workflowutil.putVariables(taskId, "generatedCode", head
					.getBianhao());
			workflowutil.putVariables(taskId, "deptid", head.getNgbm());
		}
		// ====================编号作废所需参数
		return "toWorkflow";
	}

	/**
	 * 添加到待办
	 * 
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(CzSczskHead head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		todo.setSheetId(head.getBianhao());
		return todo;
	}

	/**
	 * 添加到草稿
	 * 
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzSczskHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType(head.getSheettype());
		draft.setTitle(head.getBiaoti());
		if (StringUtils.isNotEmpty(head.getNgbm())) {
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return draft;
	}

	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示, 以及后续的修改等操作. 直接返回
	 * 
	 * @return
	 */
	public String modifyHead() {
		String sheadID = (String) request.getAttribute("headId");
		if (sheadID == null) {
			sheadID = request.getParameter("headId");
		}
		head = knowOperateUCCImpl.findHeadByHeadId(sheadID);
		request.setAttribute("userTid", head.getNigaoren());
		return "biaodan";
	}

	/**
	 * 生成处理单编号
	 * 
	 * @return
	 * @throws IOException
	 * 
	 */
	public String createNum() throws IOException {
		String headId = request.getParameter("headId");
		String code = request.getParameter("code");
		head = (CzSczskHead) knowOperateUCCImpl.findHeadByHeadId(headId);
		String code2 = "";
		if (head.getBianhao() == null || head.getBianhao().length() == 0) {
			String bianhao = iCodeGenerator.generateCurrentCode(code, head
					.getNgbm(), head.getNgbmmc());
			code2 = bianhao.replace("#DEPT#", head.getNgbmmc());
			head.setBianhao(code2);
			knowOperateUCCImpl.updateHead(head);
		} else {
			code2 = head.getBianhao();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(code2);
		return null;
	}

	/*
	 * 以下为用到的getter setter
	 */
	public CzSczskHead getHead() {
		return head;
	}

	public void setHead(CzSczskHead head) {
		this.head = head;
	}

	public CzSczskBdxx getBody() {
		return body;
	}

	public void setBody(CzSczskBdxx body) {
		this.body = body;
	}

	public String getPdk() {
		return pdk;
	}

	public void setPdk(String pdk) {
		this.pdk = pdk;
	}

}
