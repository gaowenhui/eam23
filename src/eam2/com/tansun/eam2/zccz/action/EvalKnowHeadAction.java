package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzSczskHead;
import com.tansun.eam2.zccz.ucc.ICzSczskUCC;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

public class EvalKnowHeadAction extends CommonAction {

	public CzSczskHead head;
	public String sheettype;
	public String headId;
	@Autowired
	IUserUCC iUserUCCimpl;
	@Autowired
	IDeptUCC iDeptUCCimpl;
	@Autowired
	public ICzSczskUCC czSczskUCCImpl;
	@Autowired
	public ICodeGenerator iCodeGenerator;

	/**
	 * 生成处理单编号
	 * @return
	 * 
	 */
	public String createNum() {
		headId = request.getParameter("headId");
		String code = request.getParameter("code");
		head = (CzSczskHead) czSczskUCCImpl.findById(CzSczskHead.class, headId);
		String bianhao = iCodeGenerator.generateCurrentCode(code, "", head
				.getNgbmmc());
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(bianhao);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 新建入口
	 * @return
	 */
	public String newHead() {
		head = new CzSczskHead();
		//单据类型
		head.setSheettype(sheettype);
		//得到登录人的信息
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String userName = userBo.getUsername();
		//设置默认值
		head.setNigaorenxm(userName);
		head.setNgrq(new Date());
		//得到人所在部门
		List<PTDeptBO> list = iDeptUCCimpl.getDeptByUserId(userBo.getTid());
		if (list != null && list.size() > 0) {
			head.setNgbmmc(list.get(0).getDeptName());
		}
		czSczskUCCImpl.save(head);
		headId = head.getId();
		czSczskUCCImpl.CopyCzSczsk(headId);
		request.setAttribute("headId", headId);
		return "tomodify";
	}

	/**
	 * 存放request的信息 以确保request的值与数据库同步
	 * modifyHead从request对象中获取表单ID和表单类型
	 * 修改一条数据
	 * @return
	 */
	public String modifyHead() {
		headId = (String) request.getAttribute("headId");
		head = (CzSczskHead) czSczskUCCImpl.findById(CzSczskHead.class, headId);
		sheettype = head.getSheettype();
		return sheettype;
	}

	public String saveHead() {
		czSczskUCCImpl.update(head);
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		return "toWorkflow";
	}

	/**
	 * 添加到待办
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(CzSczskHead head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		return todo;
	}

	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzSczskHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType(head.getSheettype());
		draft.setTitle(head.getBiaoti());
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return draft;
	}
	
	
	public CzSczskHead getHead() {
		return head;
	}

	public void setHead(CzSczskHead head) {
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

	public IUserUCC getIUserUCCimpl() {
		return iUserUCCimpl;
	}

	public void setIUserUCCimpl(IUserUCC userUCCimpl) {
		iUserUCCimpl = userUCCimpl;
	}

	public IDeptUCC getIDeptUCCimpl() {
		return iDeptUCCimpl;
	}

	public void setIDeptUCCimpl(IDeptUCC deptUCCimpl) {
		iDeptUCCimpl = deptUCCimpl;
	}

	public ICzSczskUCC getCzSczskUCCImpl() {
		return czSczskUCCImpl;
	}

	public void setCzSczskUCCImpl(ICzSczskUCC czSczskUCCImpl) {
		this.czSczskUCCImpl = czSczskUCCImpl;
	}
}
