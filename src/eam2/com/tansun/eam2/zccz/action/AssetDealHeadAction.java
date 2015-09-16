package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IAssetDealHeadUCC;
import com.tansun.eam2.zccz.vo.CztzfaXxVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;


public class AssetDealHeadAction extends CommonAction {

	private String bufenjiean;
	private String headId1;
	// 资产处置方案审核表头
	private CztzfaXxVO disposeHead;

	@Autowired
	public IUserUCC userUCC;

	@Autowired
	public IDeptUCC deptUCC;

	@Autowired
	public IAssetDealHeadUCC assetDealHeadUCCImpl;
	@Autowired
	private ICodeGenerator codeGenerator;

	WorkflowUtil workflowutil;

	public String getXmId() {
		return xmId;
	}

	public void setXmId(String xmId) {
		this.xmId = xmId;
	}

	public String getFenlei() {
		return fenlei;
	}

	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}

	@Autowired
	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}

	@Autowired
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}

	/**
	 * 新建入口
	 */
	public String newHead() {
		// 设置表头信息
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		Iterator<PTDeptBO> deptIte = deptUCC.getDeptByUserId(user.getTid())
				.iterator();
		disposeHead = new CztzfaXxVO();
		String userId = String.valueOf(user.getTid());
		disposeHead.setNgr(userId);
		disposeHead.setNgrxm(user.getUsername());
		Date date = new Date();
		disposeHead.setNgrq(date);
		if (deptIte.hasNext()) {
			PTDeptBO dept = deptIte.next();
			disposeHead.setNgbm(String.valueOf(dept.getRsvdNum1()));
			disposeHead.setNgbmmc(dept.getRsvdStr1());
		}
		// 设置资产类别
		disposeHead.setZclb("0");
		disposeHead.setFafl("0");
		disposeHead.setLxdh(user.getCellphone());
		// 设置合规审查次数
		disposeHead.setHgsccs(0l);
		// 设置流程名称
		disposeHead.setLcmc(ZcczCommon.PROCESS_NAME_ASSET_DISPOSE);
		// 设置处理单状态 未审批
		disposeHead.setCldzt(ZcczCommon.FORM_HAVE_NOT_APPROVED);
		// 保存表头信息
		CzCztzfaXx head = assetDealHeadUCCImpl.newHeadVO(disposeHead);
		// 设置初始处理单id
		head.setCscldid(head.getId());
		disposeHead.setCscldid(head.getId());
		assetDealHeadUCCImpl.saveOrUpdateHead(head);
		disposeHead.setId(head.getId());
		request.setAttribute("disposeHead", disposeHead);
		request.setAttribute("headId", head.getId());
		request.setAttribute("user", user);
		// 账面原值
		request.setAttribute("zmyz", 0);
		request.setAttribute("zclbList", head.getZclbList());
		request.setAttribute("czfsJson", assetDealHeadUCCImpl.getCzfsJson());
		return "tomodify";
	}

	public String saveHead() {
		// 对页面上的信息进行处理
		IUser tuser = UserThreadLocal.get();
		if(StringUtils.isNotEmpty(disposeHead.getZclb())){
			disposeHead.setZclb(disposeHead.getZclb() + ",");
		}
		assetDealHeadUCCImpl.saveOrUpdateHeadVO(disposeHead);
		request.setAttribute("headId", disposeHead.getId());
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(disposeHead));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(disposeHead));

		// 工作流需要变量
		if (StringUtils.isNotEmpty(disposeHead.getLcid())) {
			String taskId = workflowutil.getTodoTaskIdByPiId(disposeHead
					.getLcid());
			workflowutil.putVariables(taskId, "cldId", disposeHead.getId());
			workflowutil.putVariables(taskId, "currentUserId", String
					.valueOf(tuser.getUserTid()));
			
			String strsel = request.getParameter("strsel");
			if(StringUtils.isNotEmpty(strsel)){
				workflowutil.putVariables(taskId, "strsel", strsel);
			}
		}
		return "toWorkflow";
	}

	// 跳转到处置费用明细页面
	public String expensesDetail() {
		return "expensesDetail";
	}

	// 设置处置费用信息
	public String fillDisposeExpense() {
		String cldId = this.request.getParameter("cldId");
		Double disposeExpense = this.assetDealHeadUCCImpl
				.fillDisposeExpense(cldId);
		try {
			this.response.getWriter().print(disposeExpense);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String modifyHead() {
		String cldId = (String) request.getAttribute("headId");
		if (cldId == null) {
			cldId = request.getParameter("headId");
		}
		// 查询表头
		disposeHead = this.assetDealHeadUCCImpl.findHeadVOById(cldId);
		request.setAttribute("czfsJson", assetDealHeadUCCImpl.getCzfsJson());
		request.setAttribute("userTid", disposeHead.getNgr());
		if (disposeHead != null) {
			request.setAttribute("zclbList", disposeHead.getZclbList());
		}
		if(StringUtils.isNotEmpty(disposeHead.getZclb())){
			if(",".equals(disposeHead.getZclb().charAt(disposeHead.getZclb().length()-1))){
				disposeHead.setZclb(disposeHead.getZclb().substring(0, disposeHead.getZclb().length()-1));
			}
		}
		return "openHead";
	}

	public String createBianhao() {
		String cldId = this.request.getParameter("cldId");
		this.disposeHead = assetDealHeadUCCImpl.findHeadVOById(cldId);
		// 资产处置-#DEPT#-#2#-#3#
		// 设置表头信息
		String bianhao = null;
		if (StringUtils.isEmpty(disposeHead.getBianhao())) {
			bianhao = codeGenerator.generateCurrentCode("zccz", disposeHead.getNgbm(),
					disposeHead.getNgbmmc());
			if (StringUtils.indexOf(bianhao, "未找到编号生成规则") != -1)
				return null;
			disposeHead.setBianhao(bianhao);
			this.assetDealHeadUCCImpl.saveBianHao(disposeHead);
		} else {
			bianhao = disposeHead.getBianhao();
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(bianhao);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String createBianhao1() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String rq = sdf.format(new Date());
		String cldId = this.request.getParameter("cldId");
		this.disposeHead = assetDealHeadUCCImpl.findHeadVOById(cldId);
		String bianhao = null;
		if (StringUtils.isEmpty(disposeHead.getSlxh())) {
			bianhao = codeGenerator.generateCurrentCode("slxh", "", "");
			if (StringUtils.indexOf(bianhao, "未找到编号生成规则") != -1)
				return null;
			disposeHead.setSlxh(bianhao);
			disposeHead.setSbrq(new Date());
			this.assetDealHeadUCCImpl.saveSlxh(disposeHead);
		} else {
			bianhao = disposeHead.getSlxh();
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(bianhao + "," + rq);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查找当前流程在项目受理中的部门和人员,返回到页面，在合规审查提交会议组织时用
	 * 
	 * @return
	 */
	public String findXmslDept() {
		String taskId = request.getParameter("taskId");
		String taskp = request.getParameter("taskp");
		String deptAndUser = assetDealHeadUCCImpl.findXmslDept(taskId, taskp);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(deptAndUser);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 添加到待办
	 * 
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(CzCztzfaXx disposeHead) {
		PTTodo todo = new PTTodo();
		todo.setTitle(disposeHead.getCztzxmmc());
		if (StringUtils.isNotEmpty(disposeHead.getBianhao()))
			todo.setSheetId(disposeHead.getBianhao());
		todo.setHeadType(ZcczCommon.PROCESS_NAME_ASSET_DISPOSE);
		todo.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return todo;
	}

	/**
	 * 添加到草稿
	 * 
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzCztzfaXx disposeHead) {
		PTDraft draft = new PTDraft();
		draft.setHeadId(disposeHead.getId());
		draft.setHeadType(disposeHead.getLcmc());
		draft.setTitle(disposeHead.getCztzxmmc());
		draft.setHeadType(ZcczCommon.PROCESS_NAME_ASSET_DISPOSE);
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		if (StringUtils.isNotEmpty(disposeHead.getNgbm())) {
			draft.setDeptId(Long.parseLong(disposeHead.getNgbm()));
		}
		return draft;
	}

	private String xmId;
	private String fenlei;

	// 查询处置项目中选择处置的资产
	public String showZcxx() {
		xmId = request.getParameter("xmId");
		fenlei = request.getParameter("fenlei");
		request.setAttribute("xmId", xmId);
		request.setAttribute("fenlei", fenlei);
		request.setAttribute("czfsJson", assetDealHeadUCCImpl.getCzfsJson());
		//处置项目临时表ID
		String headId = request.getParameter("headId");
		//根据临时表ID获得czxmxxlsb
//		CzXmxxLsb czxmxxlsb = assetDealHeadUCCImpl.findXmLsbById(czxmxxlsbId);
		disposeHead = assetDealHeadUCCImpl.findHeadVOById(headId);
		return "showZcxx";
	}

	// 查询处置项目处理单
	public String showCldxx() {
		String cldId = request.getParameter("headId");
		request.setAttribute("czfsJson", assetDealHeadUCCImpl.getCzfsJson());
		disposeHead = assetDealHeadUCCImpl.findHeadVOById(cldId);
		
		List<String> list = null;
		if (disposeHead == null) {
			list = new ArrayList<String>();
		} else {
			list = disposeHead.getZclbList();
		}
		request.setAttribute("zclbList", list);
		return "showCldxx";
	}

	public CztzfaXxVO getDisposeHead() {
		return disposeHead;
	}

	public void setDisposeHead(CztzfaXxVO disposeHead) {
		this.disposeHead = disposeHead;
	}

	public String getBufenjiean() {
		return bufenjiean;
	}

	public void setBufenjiean(String bufenjiean) {
		this.bufenjiean = bufenjiean;
	}

	public String getHeadId1() {
		return headId1;
	}

	public void setHeadId1(String headId1) {
		this.headId1 = headId1;
	}
}
