package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.JjzcGctbXx;
import com.tansun.eam2.common.model.orm.bo.JjzcTbgcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlHead;
import com.tansun.eam2.jygdzc.ucc.IIntentionUCC;
import com.tansun.eam2.jygdzc.vo.JjzcGctbXxVO;
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
 *	赁租管理
 * 
 * @author lihuan
 * 
 */

public class IntentionManageHeadAction extends CommonAction {
	public JjzcTbgcXx jjzcTbgcXx; //投保固产信息
	public JyzcJyzlHead head;
	public String sheettype;
	public String headId;
	public String tbId;//投保ID
	public JjzcGctbXx jjzcGctbXx ;//固保信息
	public JjzcGctbXxVO jjzcGctbXxVO ; //固保信息/vo
	@Autowired
	public IIntentionUCC intentionUCCImpl;
	@Autowired
	IUserUCC iUserUCCimpl;
	@Autowired
	IDeptUCC iDeptUCCimpl;

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
		head = intentionUCCImpl.findJyzcJyzlHeadById(headId);
		String bianhao="";
		if(head.getBianhao() == null || head.getBianhao().length() == 0){
		    bianhao = iCodeGenerator.generateCurrentCode(code, head.getNgbm(), head.getNgbmmc());
			head.setBianhao(bianhao);
			intentionUCCImpl.update(head);
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
	 * 新增流程入口
	 * 
	 * @return
	 */
	public String newHead() {
		head = new JyzcJyzlHead();
		jjzcGctbXx = new JjzcGctbXx();
		jjzcGctbXxVO = new JjzcGctbXxVO();
		head.setNgrq(new Date());
		head.setSheettype(sheettype);
		// 得到登录人的信息
		IUser user=UserThreadLocal.get();
		head.setNgrmc(user.getUsername());
		head.setNgr(String.valueOf(user.getUserTid()));
		//得到人所在部门
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1().toString());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		
		// 设置默认值
		head.setNgrmc(user.getUsername());
		intentionUCCImpl.save(head);
		headId = head.getId();
		jjzcGctbXx.setCldId(headId);
		tbId = jjzcGctbXx.getId();
		intentionUCCImpl.save(jjzcGctbXx);
		intentionUCCImpl.copyGctbXxToJGctbXxVO(jjzcGctbXx, jjzcGctbXxVO);
		request.setAttribute("tbId", tbId);
		request.setAttribute("headId", headId);
		return "tomodify";

	}

	/**
	 * 保存信息
	 * 
	 * @return
	 */
	public String save() {
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		//====================编号作废所需参数
		jjzcGctbXx = new JjzcGctbXx();
		intentionUCCImpl.update(head);
		if(jjzcGctbXxVO!=null&&jjzcGctbXxVO.getId()!=null){
			intentionUCCImpl.copyGctbXxVOToJGctbXx(jjzcGctbXxVO, jjzcGctbXx);
			intentionUCCImpl.update(jjzcGctbXx);
		}
		sheettype = head.getSheettype();
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		//====================编号作废所需参数	
		if(StringUtils.isNotEmpty(taskId)){
			if(StringUtils.equals("assurance", head.getSheettype())){
				workflowutil.putVariables(taskId, "codeType", "gctb");
			}
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", head.getNgbm());
		}
		//====================编号作废所需参数
		
		
		return "toWorkflow";
	}

	/**
	 * 存放session的信息 以确保session的值与数据库同步
	 * 
	 * @return
	 */
	public String modify() {
		String view = request.getParameter("view");
		headId = (String) request.getAttribute("headId");
		List<JjzcGctbXxVO> list = intentionUCCImpl.getJjzcGctbXxBycldId(headId);
		if(list!=null&&list.size()>0){
			jjzcGctbXxVO = list.get(0);
			tbId = jjzcGctbXxVO.getId();
			request.setAttribute("tbId", tbId);
		}
		head = intentionUCCImpl.findJyzcJyzlHeadById(headId);
		sheettype = head.getSheettype();
		request.setAttribute("userTid", head.getNgr());
		request.setAttribute("headId", headId);
		request.setAttribute("ywlx", head.getYwlx());
		request.setAttribute("userName", head.getNgrmc());
		request.setAttribute("view", view);
		return sheettype;
	}

	/**
	 * 添加到待办
	 * 
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(JyzcJyzlHead head) {
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
	private PTDraft headToPTDraft(JyzcJyzlHead head) {
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
	public String createBookBycldId(){
		headId = request.getParameter("headId");
		String Message = "生成失败";
		if(headId!=null&&!"".equals(headId)){
			Message = intentionUCCImpl.createBookBycldId(headId);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(Message);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
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

	public IIntentionUCC getIntentionUCCImpl() {
		return intentionUCCImpl;
	}

	public void setIntentionUCCImpl(IIntentionUCC intentionUCCImpl) {
		this.intentionUCCImpl = intentionUCCImpl;
	}

	public JyzcJyzlHead getHead() {
		return head;
	}

	public void setHead(JyzcJyzlHead head) {
		this.head = head;
	}

	public String getTbId() {
		return tbId;
	}

	public void setTbId(String tbId) {
		this.tbId = tbId;
	}

	public JjzcGctbXx getJjzcGctbXx() {
		return jjzcGctbXx;
	}

	public void setJjzcGctbXx(JjzcGctbXx jjzcGctbXx) {
		this.jjzcGctbXx = jjzcGctbXx;
	}

	public IUserUCC getIUserUCCimpl() {
		return iUserUCCimpl;
	}

	public void setIUserUCCimpl(IUserUCC userUCCimpl) {
		iUserUCCimpl = userUCCimpl;
	}

	public JjzcGctbXxVO getJjzcGctbXxVO() {
		return jjzcGctbXxVO;
	}

	public void setJjzcGctbXxVO(JjzcGctbXxVO jjzcGctbXxVO) {
		this.jjzcGctbXxVO = jjzcGctbXxVO;
	}

}
