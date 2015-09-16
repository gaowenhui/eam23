package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
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
 * 资产管理headAction
 * 
 * @author lihuan
 * 
 */

public class AssetManageHeadAction extends CommonAction {

	private JyzcHead head;
	public String sheettype;
	public String headId;
	@Autowired
	IUserUCC iUserUCCimpl;
	@Autowired
	IDeptUCC iDeptUCCimpl;
	@Autowired
	public IAssetUCC assetUCCimpl;
	@Autowired 
	ICodeService codeServiceImpl;	
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
		head = assetUCCimpl.getJyzcHeadByHeadId(headId);
		
		String bianhao ="";
		if(head.getBianhao()==null || head.getBianhao().length() == 0){
			//if("11263".equals(head.getNgbm())||"11264".equals(head.getNgbm())||"11265".equals(head.getNgbm())||"11266".equals(head.getNgbm())||"11267".equals(head.getNgbm())){
			//	 bianhao = iCodeGenerator.generateCurrentCode(code,"11262", head.getNgbmmc());
			//}else{
			 bianhao = iCodeGenerator.generateCurrentCode(code, head.getNgbm(), head.getNgbmmc());
			 head.setBianhao(bianhao);
			 assetUCCimpl.update(head);
			//}
		}else{
			bianhao=head.getBianhao();
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
		head = new JyzcHead();
		//assetUCCimpl.test();
	  IUser user=UserThreadLocal.get();
		head.setNgrmc(user.getUsername());
		head.setNgr(String.valueOf(user.getUserTid()));
		//得到人所在部门7
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            //if("11262".equals(dept.getRsvdNum1().toString())){
            //	head.setNgbm(dept.getTid().toString());
            //	head.setNgbmmc(dept.getDeptName());
           // }else{
            	head.setNgbm(dept.getRsvdNum1().toString());
            	head.setNgbmmc(dept.getRsvdStr1());
          //  }
		}
		
		// 设置默认值
		head.setNgrq(new Date());
		head.setSheettype(sheettype);
		// 数据库中增加一条记录
		if ("manage".equals(sheettype)||"agentManage".equals(sheettype)) {
			head.setXlid(assetUCCimpl.getSend2ERPSEQ()); // add by lantianbo
															// 得到发送erp的唯一标识，因为发送到erp的表单id长度大于20，
		}
		assetUCCimpl.save(head);
		headId = head.getId();
		// 把用户名称放到request里
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
		// 得到head的信息
		head = assetUCCimpl.getJyzcHeadByHeadId(headId);
		sheettype = head.getSheettype();
		String ywlx = head.getYwlx();
		String pdjg = head.getPdjg();
		request.setAttribute("userTid", head.getNgr());
		request.setAttribute("userName", head.getNgrmc());
		request.setAttribute("pdjg", pdjg);
		request.setAttribute("ywlx", ywlx);
		return sheettype;
	}

	/**
	 * 保存数据 只是对数据的修改
	 * 
	 * @return
	 */
	public String saveHead() {
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		//====================编号作废所需参数
		assetUCCimpl.update(head);
		//
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("headId", headId);

		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		
		
		//====================编号作废所需参数	
		if(StringUtils.isNotEmpty(taskId)){
			if(StringUtils.equals("add", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_add");
			}else if(StringUtils.equals("change", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_change");
			}else if(StringUtils.equals("check", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_check");
			}else if(StringUtils.equals("agentCheck", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_agentcheck");
			}else if(StringUtils.equals("manage", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_manger");
			}else if(StringUtils.equals("agentManage", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_agentmanger");
			}else if(StringUtils.equals("scrap", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_scrapt");
			}else if(StringUtils.equals("agentScrap", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "jjgdzc_agentscrapt");
			}
			//删除headId下挂接的资产编号 AssetBodyVO 下挂接的的资产信息编号getAssetBodyVOById
		    workflowutil.putVariables(taskId, "zcbodyList",assetUCCimpl.getAssetBodyVOById(head.getId()));
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
	private PTTodo headToPTTodo(JyzcHead head) {
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
	private PTDraft headToPTDraft(JyzcHead head) {
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
	public String createBookBycldId(){                     
		headId = request.getParameter("headId");
		String Message = "生成失败";
		if(headId!=null&&!"".equals(headId)){
			Message = assetUCCimpl.createBookBycldId(headId);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(Message);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public JyzcHead getHead() {
		return head;
	}

	public void setHead(JyzcHead head) {
		this.head = head;
	}

	public IAssetUCC getAssetUCCimpl() {
		return assetUCCimpl;
	}

	public void setAssetUCCimpl(IAssetUCC assetUCCimpl) {
		this.assetUCCimpl = assetUCCimpl;
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

}
