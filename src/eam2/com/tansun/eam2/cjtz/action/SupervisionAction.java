package com.tansun.eam2.cjtz.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzXmjaBody;
import com.tansun.eam2.common.model.orm.bo.CzXmjaHead;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.eam2.zccz.ucc.IDealTrace1HeadUCC;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.eam2.zccz.vo.DealQueryVo;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

/**
 * 督办
 * @author lantb
 *
 */
public class SupervisionAction extends CommonAction {
	private String xmlx;
	private String xmIds;
	private DealQueryVo vo;
	private Paginator paginator;
	private CzXmjaHead head;
	private CzXmjaBody body;
	private String headId;
	private String message;
	private CzXmxxLsbVO xmXXVO;
	@Autowired
	private IDealTrace1HeadUCC ucc;
	@Autowired
	private IDealToDoUCC toDoUCC;
	@Autowired
	IDeptUCC deptUCCimpl;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private WorkflowUtil workflowutil;	
	/**
	 * 进入申请结案处理单页面
	 * @return
	 */
	public String addHead (){
		head = new CzXmjaHead();
		IUser user=UserThreadLocal.get();
		head.setNigaorenxm(user.getUsername());
		head.setNigaoren(String.valueOf(user.getUserTid()));
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1().toString());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		
		head.setNgrq(new Date());
		head.setLcmc("督办");
		toDoUCC.save(head);
		if(xmIds!=null&&xmIds.length()>0){
			if(xmIds.startsWith(",")){
				xmIds = xmIds.substring(1);
			}
			String [] xmids1 = xmIds.split(",");
			ucc.saveXm2Cld(head.getId(), xmids1);//modify by lantianbo
//			if(xmids1.length>0){
//				for (int i = 0; i < xmids1.length; i++) {
//					CzXmXx xx = new CzXmXx();
//					String xmId = xmids1[i];
//					xx = ucc.findCzXmXxById(xmId);
//					xx.setJacldId(head.getId());
//					toDoUCC.update(xx);
//					
//				}
//			}
		}
		request.setAttribute("headId", head.getId());
		return "tomodify";
//		return "addHead";
	}
	
	public String modifyHead(){
		headId = (String) request.getAttribute("headId");
		head = this.ucc.getCzXmjaHeadById(headId);
		
		return "addHead";
	}
	
	/**
	 * 保存处理单信息
	 * @return
	 */
	public String saveHead(){
		
		toDoUCC.update(head);
		request.setAttribute("headId", head.getId());
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		if(StringUtils.isNotEmpty(taskId)){
			// 取得当前用户
			IUser user=UserThreadLocal.get();
			//取得当前用户所在的所有部门
			List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
			PTDeptBO dept = null;
			if(list!=null&&list.size()>0){
	            dept = list.get(0);
			}
			workflowutil.putVariables(taskId, "codeType", "cjtzdb");
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", String.valueOf(dept.getTid()));
		}
		//====================编号作废所需参数
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
	private PTTodo headToPTTodo(CzXmjaHead head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		//表单编号。
		todo.setSheetId(head.getBianhao());
		return todo;
	}

	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzXmjaHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType("投资方案申请结案");
		draft.setTitle(head.getBiaoti());
		//拟稿部门
		if(StringUtils.isNotEmpty(head.getNgbm())){
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.INVESTMENT_SUBSYSTEM);
		return draft;
	}

	public String getCode() {
		head = this.ucc.getCzXmjaHeadById(headId);
		String code = codeGenerator.generateCurrentCode("cjtzdb", String.valueOf(head.getNgbm()), head.getNgbmmc());
		head.setBianhao(code);
		this.toDoUCC.update(head);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(code);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getXmlx() {
		return xmlx;
	}

	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}

	public String getXmIds() {
		return xmIds;
	}

	public void setXmIds(String xmIds) {
		this.xmIds = xmIds;
	}

	public DealQueryVo getVo() {
		return vo;
	}

	public void setVo(DealQueryVo vo) {
		this.vo = vo;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public CzXmjaHead getHead() {
		return head;
	}

	public void setHead(CzXmjaHead head) {
		this.head = head;
	}

	public CzXmjaBody getBody() {
		return body;
	}

	public void setBody(CzXmjaBody body) {
		this.body = body;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public CzXmxxLsbVO getXmXXVO() {
		return xmXXVO;
	}

	public void setXmXXVO(CzXmxxLsbVO xmXXVO) {
		this.xmXXVO = xmXXVO;
	}
}
