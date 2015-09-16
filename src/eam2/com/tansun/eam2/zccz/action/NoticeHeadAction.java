package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzNoticeHead;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.zccz.ucc.INoticeUCC;
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

/**
 * 处置公告
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */

public class NoticeHeadAction extends CommonAction {

	private CzNoticeHead head;
	@Autowired
	private INoticeUCC noticeUCCImpl;
	@Autowired
	private IUserUCC iUserUCCimpl;
	@Autowired
	private IDeptUCC deptUCCimpl;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private WorkflowUtil workflowutil;

	/**
	 * 进入处理单保存一条空数据为了得到id
	 * 
	 * @return
	 */
	public String newHead() {
		head = new CzNoticeHead();
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String nigaorenxm = userBo.getUsername();
		head.setNigaorenxm(nigaorenxm);
		head.setNgrq(new Date());
		head.setNigaoren(String.valueOf(userBo.getTid()));
		head.setLcmc("处置公告");
		head.setSfhcgg("0");
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
				.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			head.setNgbm(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		noticeUCCImpl.saveHead(head);
		request.setAttribute("headId", head.getId());
		request.setAttribute("sfscgg", head.getSfhcgg());
		return "tomodify";
	}

	/**
	 * 修改表头
	 * 
	 * @return
	 */
	public String saveHead() {
		noticeUCCImpl.updateHead(head);
		request.setAttribute("headId", head.getId());
		request.setAttribute("sfscgg", head.getSfhcgg());
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		// ====================编号作废所需参数
		String taskId = (String) request.getParameter("taskId");
		if (StringUtils.isNotEmpty(taskId)) {
			workflowutil.putVariables(taskId, "codeType", "zzwtdlbh");
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
	private PTTodo headToPTTodo(CzNoticeHead head) {
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
	private PTDraft headToPTDraft(CzNoticeHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType(head.getLcmc());
		draft.setTitle(head.getBiaoti());
		if (StringUtils.isNotEmpty(head.getNgbm())) {
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.ASSET_FOR_USING);
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
		head = noticeUCCImpl.findHeadByHeadId(headId);
		request.setAttribute("sfscgg", head.getSfhcgg());
		request.setAttribute("userTid", head.getNigaoren());
		request.setAttribute("headId", headId);
		return "biaodan";
	}

	/**
	 * 编号生成
	 * 
	 * @return
	 * @throws IOException
	 */
	public String creatBH() throws IOException {
		String ngbmmc = request.getParameter("ngbmmc");
		String headId = request.getParameter("headId");
		head = noticeUCCImpl.findHeadByHeadId(headId);
		String code2 = "";
		if (head.getBianhao() == null || head.getBianhao().length() == 0) {
			String code = codeGenerator.generateCurrentCode("zcgg", "",
					ngbmmc);
			code2 = code.replace("#DEPT#", ngbmmc);
			head.setBianhao(code2);
			noticeUCCImpl.updateHead(head);
		} else {
			code2 = head.getBianhao();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(code2);
		return null;
	}

	/**
	 * 资产描述生成
	 * 
	 * @return
	 * @throws IOException
	 * @throws IOException
	 */
	public String creatMS() throws IOException {
		String mc = request.getParameter("mc");
		String bs = request.getParameter("bs");
		if (mc.startsWith(",")) {
			mc = mc.substring(1);
			bs = bs.substring(1);
		}
		String str = mc + "=" + bs;
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(str);
		return null;
	}

	/**
	 * 修改是否合成字段
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updateHCGG() throws IOException {
		String headId = request.getParameter("headId");
		head = noticeUCCImpl.findHeadByHeadId(headId);
		head.setSfhcgg("1");
		noticeUCCImpl.updateHead(head);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("ok");
		return null;
	}

	/*
	 * 以下为用到的getter setter
	 */
	public CzNoticeHead getHead() {
		return head;
	}

	public void setHead(CzNoticeHead head) {
		this.head = head;
	}

}
