package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.ucc.ILiquidateUCC;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

/**
 * LiquidateHeadAction用来实现对合同清算审批表头的维护功能 合同清算审批表需要走审批流程
 * 
 * @author 刘峻松
 * 
 */

public class LiquidateHeadAction extends CommonAction {
	public JjzcHtqsHead head;
	public String sheettype;
	public String headId;
	public String contractId;
	public Paginator paginator = new Paginator();

	@Autowired
	public IUserUCC userUCCimpl;
	@Autowired
	public IDeptUCC deptUCCimpl;
	@Autowired
	public IContractUCC contractUCCImpl;
	@Autowired
	public IAssetUCC assetUCCimpl;
	@Autowired
	public ILiquidateUCC liquidateUCCimpl;
	@Autowired
	WorkflowUtil workflowutil;	
	
	/**
	 * 新增流程入口 新插入一条数据
	 * 
	 * @return
	 */
	public String newHead() {
		head = new JjzcHtqsHead();
		head.setSheettype(sheettype); // 单据类型
		// TODO
		 head.setNgrq(new Date()); //默认时间
		// 数据库中增加一条空记录

		IUser user=UserThreadLocal.get();
		head.setNgrmc(user.getUsername());
		head.setNgr(String.valueOf(user.getUserTid()));
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1().toString());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		

		// 把用户名称放到request里
		contractUCCImpl.saveJjzcHtqsHead(head);
		headId = head.getId();
		request.setAttribute("userName", user.getUsername());
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("headId", headId);
		// Struts配置程序跳转，跳转到modify方法的入口，返回tomodify
		return "tomodify";
	}

	/**
	 * 存放request的信息 以确保request的值与数据库同步 modifyHead从request对象中获取表单ID和表单类型 修改一条数据
	 * 
	 * @return
	 */
	public String modifyHead() {
		// modifyHead方法是所有更改数据库以后的统一出口Action
		headId = (String) request.getAttribute("headId");
		sheettype = (String) request.getAttribute("sheettype");
		
		// 得到head的信息
		head = contractUCCImpl.getJjzcHtqsHeadById(headId);
		if(head!=null){
			sheettype = head.getSheettype(); 
		}
		request.setAttribute("userTid", head.getNgr());
		request.setAttribute("userName", head.getNgrmc());
		request.setAttribute("head", head);
		request.setAttribute("headId", headId);
		// String ywlx = head.getYwlx();
		// request.setAttribute("ywlx", ywlx);
		return sheettype;
	}

	/**
	 * 保存数据 tid有数据的话 就是修改 没有数据的话就是删除
	 * 
	 * @return
	 */
	public String saveHead() {

		contractUCCImpl.updateJjzcHtqsHead(head);
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("headId", head.getId());
		//工作流需要变量
		if(StringUtils.isNotEmpty(head.getLcId())){
			String taskId = workflowutil.getTodoTaskIdByPiId(head.getLcId());
			workflowutil.putVariables(taskId, "cldId", head.getLcId());
		}	
		
		
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		//====================编号作废所需参数

		//====================编号作废所需参数	
		if(StringUtils.isNotEmpty(taskId)){
			if(StringUtils.equals("liquidate", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_zlqs");
			}else if(StringUtils.equals("liquidate1", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_agentzlqs");
			}
			
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", head.getNgbm());
		}
		//====================编号作废所需参数
		return "toWorkflow";
	}
	
	
	/**
	 * 添加到待办
	 * 
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(JjzcHtqsHead head) {
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
	private PTDraft headToPTDraft(JjzcHtqsHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType(head.getLcmc());
		draft.setTitle(head.getBiaoti());
		if(StringUtils.isNotEmpty(head.getNgbm())){
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.FIXED_ASSET_SUBSYSTEM);
		return draft;
	}

	/**
	 * 根据给定的headid来检索刷新数据,返回一个json串给界面上的jquery grid使用
	 * 
	 * @param hid
	 * @return
	 */
	public String refreshList() {
		List list = liquidateUCCimpl.getBodyListByHeadId(headId, paginator);
		if (list==null){
			list = new ArrayList();
		}
		double yszj = 0.0;
		double xghyszj = 0.0;
		double qstzje = 0.0;
		for(int i=0;i<list.size();i++){
			JyzcHtqsBody body = (JyzcHtqsBody) list.get(i);
			if(body!=null){
				yszj = yszj+body.getYszj();
				xghyszj = xghyszj+body.getXghyszj();
				qstzje = qstzje+body.getQstzje();
			}
		}
		String bodyJSON = null;
		try {
			bodyJSON = BodyListToJSON.getJSON(list, 1, 1, 1);
			StringBuffer returnSB = new StringBuffer(bodyJSON);
			String ss = ",\"userdata\":{\"yszj\":\"" + String.valueOf(yszj) + "\",\"qstzje\":\""+ String.valueOf(qstzje) +
						"\",\"xghyszj\":\""+ String.valueOf(xghyszj) +"\"}";
			returnSB.insert(returnSB.length()-1, ss);
			bodyJSON = returnSB.toString();
			//System.out.println(bodyJSON);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 在合同清算清单上增加一个新合同,并重新刷新界面返回
	 * @param headid		表单编号
	 * @param contractId	要加入的合同编号
	 * @return
	 */
	public String addContract(){
		//step1:利用合同编号,检索对应的合同信息
		
		//step2:生成一个新的LiquidateBO,插入到后台数据库去
		JyzcHtqsBody body = new JyzcHtqsBody();
		body.setHtId(contractId);
		body.setCldId(headId);
		liquidateUCCimpl.saveBody(body);
		
		return refreshList();
	}
	
	public String updateContractAfterApproval(){
		String s = "";
		try{
			this.liquidateUCCimpl.updateContractAfterApproval(headId);
			s = "办结成功！";
		}catch (Exception ex){
			s= "办结失败，请联系管理员！";
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ------------------------------------------------------//
	// ---------下面的功能为工作流入口而设计----------------------//
	public String viewDraft() {
		return "viewDraft";
	}

	public String viewToDo() {
		return "viewToDo";
	}

	public String viewDone() {
		return "viewDone";
	}

	public String viewFinished() {
		return "viewFinished";
	}

	public String viewRubbish() {
		return "viewRubbish";
	}

	//---------------------------------------------------------------//
	//-----------------程序自动生成的Get Set方法 -----------------------//
	//---------------------------------------------------------------//
	
	public JjzcHtqsHead getHead() {
		return head;
	}

	public void setHead(JjzcHtqsHead head) {
		this.head = head;
	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public IUserUCC getUserUCCimpl() {
		return userUCCimpl;
	}

	public void setUserUCCimpl(IUserUCC userUCCimpl) {
		this.userUCCimpl = userUCCimpl;
	}

	public IDeptUCC getDeptUCCimpl() {
		return deptUCCimpl;
	}

	public void setDeptUCCimpl(IDeptUCC deptUCCimpl) {
		this.deptUCCimpl = deptUCCimpl;
	}

	public IContractUCC getContractUCCImpl() {
		return contractUCCImpl;
	}

	public void setContractUCCImpl(IContractUCC contractUCCImpl) {
		this.contractUCCImpl = contractUCCImpl;
	}

	public IAssetUCC getAssetUCCimpl() {
		return assetUCCimpl;
	}

	public void setAssetUCCimpl(IAssetUCC assetUCCimpl) {
		this.assetUCCimpl = assetUCCimpl;
	}

	public ILiquidateUCC getLiquidateUCCimpl() {
		return liquidateUCCimpl;
	}

	public void setLiquidateUCCimpl(ILiquidateUCC liquidateUCCimpl) {
		this.liquidateUCCimpl = liquidateUCCimpl;
	}
}
