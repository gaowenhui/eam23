package com.tansun.eam2.wtdk.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.WtdkEndInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.oa.GetsubjectService;
import com.tansun.eam2.oa.ucc.CommonEam2OAUcc;
import com.tansun.eam2.wtdk.ucc.IEndInfoUCC;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.eam2.wtdk.vo.RelateQueryVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.Paginator;
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
 * 终止委托贷款管理
 * 
 * @author 陈煜霄
 * @date 2010-12-07
 */
public class EndInfoAction extends CommonAction {

	private WtdkGlHead head;
	private WtdkEndInfo body;
	private Paginator paginator;
	private RelateQueryVO queryVO;
	private CommonEam2Oa eam2oa;
	@Autowired
	private IEndInfoUCC endInfoUCCImpl;
	@Autowired
	private IUserUCC iUserUCCimpl;
	@Autowired
	private IFuncQueryUCC funcQueryUCCImpl;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private IDeptUCC deptUCCimpl;
	@Autowired
	private WorkflowUtil workflowutil;
	@Autowired
	private CommonEam2OAUcc commonEam2OAUccImpl;
	@Autowired
	private GetsubjectService gs;

	/**
	 * 进入表头页面保存一条数据
	 * 
	 * @return
	 */
	public String newHead() {
		head = new WtdkGlHead();
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String ngrmc = userBo.getUsername();
		head.setNgrmc(ngrmc);
		head.setNgrq(new Date());
		head.setNgrbh(String.valueOf(userBo.getTid()));
		head.setSheetType("委贷账务审批");
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
				.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		endInfoUCCImpl.saveHead(head);
		request.setAttribute("headId", head.getSheadId());
		return "tomodify";
	}

	/**
	 * 修改表头
	 * 
	 * @return
	 */
	public String saveHead() {
		endInfoUCCImpl.updateHead(head);
		request.setAttribute("headId", head.getSheadId());
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		// ====================编号作废所需参数
		String taskId = (String) request.getParameter("taskId");
		if (StringUtils.isNotEmpty(taskId)) {
			workflowutil.putVariables(taskId, "codeType", "zzwtdlbh");
			workflowutil.putVariables(taskId, "generatedCode", head
					.getSheetId());
			workflowutil.putVariables(taskId, "deptid", head.getNgbmbh());
		}
		// ====================编号作废所需参数
		return "toWorkflow";
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
		head = endInfoUCCImpl.findHeadByHeadId(sheadID);
		eam2oa = commonEam2OAUccImpl.queryEAM2OAByHeadID(sheadID);
		if (eam2oa != null) {
			request.setAttribute("oaurl", eam2oa.getUrl());
			request.setAttribute("status", eam2oa.getStatus());
		}
		request.setAttribute("userTid", head.getNgrbh());
		request.setAttribute("headId", sheadID);
		return "biaodan";
	}

	/**
	 * 通过表头ID查找表体信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findBody() throws IOException {
		String headId = request.getParameter("headId");
		String bodyJSON = endInfoUCCImpl.findBodyByHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(bodyJSON);
		return null;
	}

	/**
	 * 根据表体id删除表体信息
	 * 
	 * @return
	 */
	public String deleteBody() {
		String bodyIds = request.getParameter("bodyIds");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] ids = bodyIds.split(",");
		endInfoUCCImpl.deleteBodyByBodyId(ids);
		return null;
	}

	/**
	 * 打开表体信息
	 * 
	 * @return
	 */
	public String addBody() {
		String headId = request.getParameter("headId");
		String bodyId = request.getParameter("bodyId");
		if (!"".equals(bodyId) && bodyId != null) {
			body = endInfoUCCImpl.findBodyByBodyId(bodyId);
			request.setAttribute("isDisable", "false");
		} else {
			body = new WtdkEndInfo();
			body.setHeadId(headId);
			request.setAttribute("isDisable", "true");
		}
		return "bodyInfo";
	}

	public String endQueryDetail() {
		String bodyId = request.getParameter("bodyId");
		body = endInfoUCCImpl.findBodyByBodyId(bodyId);
		request.setAttribute("isDisable", "false");
		return "endQueryDetail";
	}

	/**
	 * 保存表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveBody() throws IOException {
		endInfoUCCImpl.saveBody(body);
		request.setAttribute("message", "保存成功");
		return "bodyInfo";
	}

	/**
	 * 修改表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updateBody() throws IOException {
		endInfoUCCImpl.updateBody(body);
		request.setAttribute("message", "保存成功");
		return "bodyInfo";
	}

	/**
	 * 回调方法得到body信息
	 * 
	 * @return
	 */
	public String fuToBody() {
		String fuNo = request.getParameter("fuNo");
		FuncQueryVO func = funcQueryUCCImpl.findFuncInfoByFuncNo(fuNo);
		body.setFundAccount(func.getSaAcctNo());
		body.setKhbh(func.getSaAcctNo());
		body.setKhmc(func.getSaCustName());
		request.setAttribute("isDisable", "false");
		return "bodyInfo";
	}

	/**
	 * 打开基金查询页面
	 * 
	 * @return
	 */
	public String findFuInfo() {
		request.setAttribute("isEndInfo", "true");
		return "choose";
	}

	/**
	 * 添加到待办
	 * 
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(WtdkGlHead head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getTitle());
		todo.setSheetId(head.getSheetId());
		return todo;
	}

	/**
	 * 添加到草稿
	 * 
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(WtdkGlHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getSheadId());
		draft.setHeadType(head.getSheetType());
		draft.setTitle(head.getTitle());
		if (StringUtils.isNotEmpty(head.getNgbmbh())) {
			draft.setDeptId(Long.parseLong(head.getNgbmbh()));
		}
		draft.setSubsystem(GlobalVariable.WTDK_SUBSYSTEM);
		return draft;
	}

	/**
	 * 基金退回编号生成
	 * 
	 * @return
	 * @throws IOException
	 */
	public String endInfoCode() throws IOException {
		String ngbmmc = request.getParameter("ngbmmc");
		String ngbmbh = request.getParameter("ngbmbh");
		String headId = request.getParameter("headId");
		head = endInfoUCCImpl.findHeadByHeadId(headId);
		String code2 = "";
		if (head.getSheetId() == null || head.getSheetId().length() == 0) {
			String code = codeGenerator.generateCurrentCode("zzwtdlbh", ngbmbh,
					ngbmmc);
			code2 = code.replace("#DEPT#", ngbmmc);
			head.setSheetId(code2);
			endInfoUCCImpl.updateHead(head);
		} else {
			code2 = head.getSheetId();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(code2);
		return null;
	}

	/**
	 * 打开批量选择页面
	 * 
	 * @return
	 */
	public String openBatchChoose() {
		String batch = request.getParameter("batch");
		request.setAttribute("batch", batch);
		return "openBatchChoose";
	}

	/**
	 * 批量选择后回调方法
	 * 
	 * @return
	 * @throws IOException
	 */
	public String batchChoose() throws IOException {
		String headId = request.getParameter("headId");
		String funcNo = request.getParameter("funcNo");
		if (funcNo.startsWith(",")) {
			funcNo = funcNo.substring(1);
		}
		endInfoUCCImpl.batchFuToBody(headId, funcNo);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 打开批量操作页面
	 * 
	 * @return
	 */
	public String openBatchOperate() {
		String bodyIds = request.getParameter("bodyIds");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);
		}
		request.setAttribute("bodyIds", bodyIds);
		return "openBatchOperate";
	}

	/**
	 * 批量操作后回调方法
	 * 
	 * @return
	 * @throws IOException
	 */
	public String batchOperate() throws IOException {
		String bodyIds = request.getParameter("bodyIds");
		String spjg = request.getParameter("spjg");
		String bz = request.getParameter("bz");
		endInfoUCCImpl.batchUpdateBody(bodyIds, spjg, bz);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功!");
		return null;
	}

	/**
	 * 打开基金和贷款关联的查询页面
	 * 
	 * @return
	 */
	public String openRelateQuery() {
		return "openRelateQuery";
	}

	/**
	 * 查询基金与贷款关联的列表
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryRelate() throws IOException {
		if (queryVO == null) {
			queryVO = new RelateQueryVO();
		}
		String json = endInfoUCCImpl.findRelate(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 回调保存表体
	 * 
	 * @return
	 */
	public String saveBodysByRelate() throws IOException {
		String xulies = request.getParameter("xulies");
		String headId = request.getParameter("headId");
		endInfoUCCImpl.saveBodysByXulie(xulies, headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 流程办结启动oa发文
	 * 
	 * @return
	 * @throws Exception
	 */
	public String startOAFlow() throws Exception {
		String ngrq = request.getParameter("ngrq");
		String ngr = request.getParameter("ngr");
		String zbbm = request.getParameter("zbbm");
		String yjwjurl = request.getParameter("yjwjurl");
		String nglx = request.getParameter("nglx");
		String EAMmsgid = request.getParameter("EAMmsgid");
		String title = request.getParameter("title");
		List<Map<String, String>> list = gs.startOAFlow(EAMmsgid, ngrq, ngr,
				zbbm, title, "", "", yjwjurl, nglx, null, "");
		response.setCharacterEncoding("UTF-8");
		if (list == null || list.size() == 0) {
			response.getWriter().write("发送不成功,请重新发送");
		} else {
			Map map = list.get(0);
			String status = String.valueOf(map.get("status"));
			String errorinfo = String.valueOf(map.get("errorinfo"));
			String lcid = String.valueOf(map.get("lcid"));
			String url = String.valueOf(map.get("url"));
			if ("ERROR".equalsIgnoreCase(status)) {
				response.getWriter().write("发送不成功,请重新发送");
			} else if (!"0".equals(errorinfo)) {
				response.getWriter().write("发送不成功,请重新发送");
			} else if ("0".equals(lcid)) {
				response.getWriter().write("发送不成功,请重新发送");
			} else {
				CommonEam2Oa eamoa = new CommonEam2Oa();
				eamoa.setBiaoti(title);
				eamoa.setHeadid(EAMmsgid);
				eamoa.setLcid(lcid);
				eamoa.setNgr(ngr);
				// eamoa.setNgrid(ngrid);
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date toDate = dateFormat.parse(ngrq);
				eamoa.setNgrq(toDate);
				eamoa.setYwmc("终止委托代理");
				eamoa.setYwzl("委托贷款管理子系统");
				eamoa.setUrl(url);
				eamoa.setStatus("0");
				commonEam2OAUccImpl.saveEAM2OA(eamoa);
				response.getWriter().write(url);
			}
		}
		return null;
	}

	/**
	 * 以下为用到的get set
	 */
	public WtdkGlHead getHead() {
		return head;
	}

	public void setHead(WtdkGlHead head) {
		this.head = head;
	}

	public WtdkEndInfo getBody() {
		return body;
	}

	public void setBody(WtdkEndInfo body) {
		this.body = body;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public RelateQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(RelateQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public CommonEam2Oa getEam2oa() {
		return eam2oa;
	}

	public void setEam2oa(CommonEam2Oa eam2oa) {
		this.eam2oa = eam2oa;
	}

}
