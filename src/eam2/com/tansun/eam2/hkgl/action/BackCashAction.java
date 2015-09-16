package com.tansun.eam2.hkgl.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.BizBackCashInfo;
import com.tansun.eam2.hkgl.ucc.IHkglUCC;
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

/**
 * 回款管理
 * 
 * @author 陈煜霄
 * @date 2011-03-04
 */
public class BackCashAction extends CommonAction {

	private BizBackCashInfo head;
	@Autowired
	private IUserUCC iUserUCCimpl;
	@Autowired
	private IHkglUCC hkglUCCImpl;
	@Autowired
	private IDeptUCC deptUCCimpl;
	@Autowired
	private ICodeGenerator codeGenerator;

	/**
	 * 进入回款表头页面保存一条数据
	 * 
	 * @return
	 */
	public String newHead() {
		head = new BizBackCashInfo();
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String ngrmc = userBo.getUsername();
		head.setNgrmc(ngrmc);
		head.setNgrq(new Date());
		head.setNgrbh(String.valueOf(userBo.getTid()));
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
				.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		hkglUCCImpl.saveHead(head);
		request.setAttribute("headId", head.getId());
		return "tomodify";
	}

	/**
	 * 修改表头
	 * 
	 * @return
	 */
	public String saveHead() {
		hkglUCCImpl.updateHead(head);
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		return "toWorkflow";
	}

	/**
	 * 添加到待办
	 * 
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(BizBackCashInfo head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		// 表单编号。
		todo.setSheetId(head.getBianhao());
		return todo;
	}

	/**
	 * 添加到草稿
	 * 
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(BizBackCashInfo head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType("回款管理");
		draft.setTitle(head.getBiaoti());
		// 拟稿部门
		if (StringUtils.isNotEmpty(head.getNgbmbh())) {
			draft.setDeptId(Long.parseLong(head.getNgbmbh()));
		}
		draft.setSubsystem(GlobalVariable.HKGL_SUBSYSTEM);
		return draft;
	}

	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示, 以及后续的修改等操作. 直接返回
	 * 
	 * @return
	 */
	public String modifyHead() {
		String headId = (String) request.getAttribute("headId");
		if (headId == null) {
			headId = request.getParameter("headId");
		}
		head = hkglUCCImpl.findHeadByHeadId(headId);
		request.setAttribute("headId", headId);
		request.setAttribute("userTid", head.getNgrbh());
		request.setAttribute("head", head);
		return "biaodan";
	}

	/**
	 * 回款管理编号生成
	 * 
	 * @return
	 * @throws IOException
	 */
	public String backCashCode() throws IOException {
		String ngbmmc = request.getParameter("ngbmmc");
		String ngbmbh = request.getParameter("ngbmbh");
		String headId = request.getParameter("headId");
		head = hkglUCCImpl.findHeadByHeadId(headId);
		String code2 = "";
		if (head.getBianhao() == null || head.getBianhao().length() == 0) {
			String code = codeGenerator.generateCurrentCode("hkqrdbh", ngbmbh,
					ngbmmc);
			code2 = code.replace("#DEPT#", ngbmmc);
			head.setBianhao(code2);
			hkglUCCImpl.updateHead(head);
		} else {
			code2 = head.getBianhao();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(code2);
		return null;
	}

	/**
	 * 处理单办结
	 * 
	 * @return
	 * @throws IOException
	 */
	public String doOver() throws IOException {
		String id = request.getParameter("id");
		String qrdlx = request.getParameter("qrdlx");
		if (qrdlx.startsWith(",")) {
			qrdlx = qrdlx.substring(1);
		}
		String headId = request.getParameter("headId");
		hkglUCCImpl.doOver(id, qrdlx, headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("ok");
		return null;
	}

	/**
	 * 确定为最终回款
	 * 
	 * @return
	 * @throws IOException
	 */
	public String confirmTheEnd() throws IOException {
		String confirmHeadId = request.getParameter("id");
		String headId = request.getParameter("headId");
		String json = hkglUCCImpl.checkOutDeptEnd(confirmHeadId, headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 取消确认
	 * 
	 * @return
	 * @throws IOException
	 */
	public String cancleConfirm() throws IOException {
		String confirmHeadId = request.getParameter("id");
		String json = hkglUCCImpl.cancleConfirmOutDept(confirmHeadId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/*
	 * 以下为用到的getter setter
	 */
	public BizBackCashInfo getHead() {
		return head;
	}

	public void setHead(BizBackCashInfo head) {
		this.head = head;
	}

}