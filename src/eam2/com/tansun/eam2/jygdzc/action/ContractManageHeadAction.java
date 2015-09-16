package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO2;
import com.tansun.eam2.jygdzc.vo.WgHtViewVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
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

/**
 * ContractManageHeadAction 合同表头信息
 * 
 * @author lihuan
 * 
 */

public class ContractManageHeadAction extends CommonAction {

	private JjzcHtqsHead head;
	private String sheettype;
	private String headId;
	@Autowired
	IUserUCC userUCCimpl;
	@Autowired
	IDeptUCC deptUCCimpl;
	@Autowired
	private IContractUCC contractUCCImpl;
	@Autowired 
	public ICodeGenerator iCodeGenerator;	
	@Autowired
	WorkflowUtil workflowutil;
	/**
	 * 生成处理单编号
	 * @return
	 * 
	 */
	public String createNum(){
		headId =request.getParameter("headId");
		String code=request.getParameter("code");
		head = contractUCCImpl.getJjzcHtqsHeadById(headId);
		String bianhao="";
		if(head.getBianhao() ==null || head.getBianhao().length() == 0){
		    bianhao = iCodeGenerator.generateCurrentCode(code, head.getNgbm(), head.getNgbmmc());
			head.setBianhao(bianhao);
			contractUCCImpl.update(head);
		}else{
			bianhao = head.getBianhao();
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(bianhao);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	/**
	 * 新增流程入口 新插入一条数据
	 * 
	 * @return
	 */
	public String newHead() {
		head = new JjzcHtqsHead();
		head.setSheettype(sheettype);
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
		
		head.setNgrq(new Date());
		// 得到人所在部门
		

		// 把用户名称放到request里
		contractUCCImpl.saveJjzcHtqsHead(head);
		headId = head.getId();
		request.setAttribute("userName", user.getUsername());
		request.setAttribute("headId", headId);
		// Struts配置程序跳转，跳转到modify方法的入口，返回tomodify
		return "tomodify";
	}
	public String tenancyTOcontract() {
		String ywlx = request.getParameter("ywlx");
		head = new JjzcHtqsHead();
		head.setSheettype(sheettype);
		// 数据库中增加一条空记录
		String zlheadId = request.getParameter("zlheadId");
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
		head.setNgrq(new Date());
		// 得到人所在部门
		// 把用户名称放到request里
		head.setYwlx(ywlx==null?"1":ywlx);
		contractUCCImpl.saveJjzcHtqsHead(head);
		headId = head.getId();
		contractUCCImpl.tenancyTOcontract(zlheadId,headId);
		request.setAttribute("userName", user.getUsername());
		request.setAttribute("headId", headId);
		// Struts配置程序跳转，跳转到modify方法的入口，返回tomodify
		return "tomodify";
	}
	/**
	 * 存放session的信息 以确保session的值与数据库同步 modifyHead从request对象中获取表单ID和表单类型 修改一条数据
	 * 
	 * @return
	 */
	public String modifyHead() {
		// modifyHead方法是所有更改数据库以后的统一出口Action
		headId = (String) request.getAttribute("headId");
		head = contractUCCImpl.getJjzcHtqsHeadById(headId);
		request.setAttribute("userTid", head.getNgr());
		request.setAttribute("head", head);
		sheettype = head.getSheettype();
		// 得到head的信息
		return sheettype;
	}

	/**
	 * 保存数据 tid有数据的话 就是修改 没有数据的话就是删除
	 * 
	 * @return
	 */
	public String saveHead() {
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		//====================编号作废所需参数
		
		contractUCCImpl.updateJjzcHtqsHead(head);
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("headId", headId);

		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		//====================编号作废所需参数	
		if(StringUtils.isNotEmpty(taskId)){
			if(StringUtils.equals("contract", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "htwh");
			}else if(StringUtils.equals("agentContract", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "htwh_agent");
			}//得到合同租赁的临时表信息
			List<JyzlBodyVO2> assetList1 = contractUCCImpl .getJyzlBodyVO2ByCldId(head.getId());
			//得到车险非车险的合同表
			List<JyzlBodyVO> assetList2 = contractUCCImpl .getJyzlBodyVOByCldId(head.getId());
			//将两个表的公共属性放到一起
			List<WgHtViewVO> list = new ArrayList<WgHtViewVO>();
			if (assetList1 != null) {
				for (JyzlBodyVO2 jyzlBodyVO : assetList1) {
					WgHtViewVO ddd = new WgHtViewVO();
					ddd.setId(jyzlBodyVO.getId());
					ddd.setHtlx(jyzlBodyVO.getCHtlx());
					ddd.setHtbh(jyzlBodyVO.getHtbh());
					ddd.setHtzzrq(jyzlBodyVO.getHtzzrq());
					ddd.setHtdqrq(jyzlBodyVO.getHtdqrq());
					ddd.setZcbh(jyzlBodyVO.getZcbh());
					ddd.setZcmc(jyzlBodyVO.getZcmc());
					list.add(ddd);
				}
			}
			if (assetList2 != null) {
				for (JyzlBodyVO jyzlBodyVO : assetList2) {
					WgHtViewVO ddd = new WgHtViewVO();
					ddd.setId(jyzlBodyVO.getId());
					ddd.setHtlx(jyzlBodyVO.getHtlx());
					ddd.setHtbh(jyzlBodyVO.getHtbh());
					ddd.setHtzzrq(jyzlBodyVO.getHtdqrq());
					ddd.setHtksrq(jyzlBodyVO.getHtqsrq());
					ddd.setZcbh(jyzlBodyVO.getZcbh());
					ddd.setZcmc(jyzlBodyVO.getZcmc());
					list.add(ddd);
				}
			}
			
			//删除headId下挂接的合同编号  WgHtViewVO下挂接的合同信息编号的
		    //workflowutil.putVariables(taskId, "htbodyList",list);
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
		draft.setHeadType(head.getLcId());
		draft.setTitle(head.getBiaoti());
		if(StringUtils.isNotEmpty(head.getNgbm())){
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.FIXED_ASSET_SUBSYSTEM);
		return draft;
	}

	/**
	 * 流程办结
	 * @return
	 */
	public String banjie(){
		String result = this.contractUCCImpl.banjie(headId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
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

	public IContractUCC getContractUCCImpl() {
		return contractUCCImpl;
	}

	public void setContractUCCImpl(IContractUCC contractUCCImpl) {
		this.contractUCCImpl = contractUCCImpl;
	}
}
