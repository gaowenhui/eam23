package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.oa.GetsubjectService;
import com.tansun.eam2.oa.ucc.CommonEam2OAUcc;
import com.tansun.eam2.stgl.ucc.ICEMEntityFormUcc;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.stgl.vo.EntityDisplayVO;
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
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 用工计划
 * @author <a href="mailto:gengxiaoli@gmail.com">gengxiaoli</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class CEMStaffRecruitPlanHeadAction extends CommonAction{
 
    /**
     * 用工计划
     * @return
     */
	
	private StHead head;
	private String headId;
	private StJbxx jbxx;
	private StGlbt stGlbt; 
	private EntityDisplayVO entityDisplayVO;
	private String stId;
	private String zixuntype;
	private String bianhao;
	private StGlbt body;
	private CommonEam2Oa eam2oa;
	
	@Autowired 
	ICodeGenerator iCodeGenerator;	
    @Autowired
    IUserUCC userUCCimpl;
    @Autowired
    IDeptUCC deptUCCimpl;	
	@Autowired
	ICEMEntityService cEMEntityService;
	@Autowired
	ICEMEntityFormUcc cEMEntityFormUccImpl;
	@Autowired
	WorkflowUtil workflowutil;	
	@Autowired
	private CommonEam2OAUcc commonEam2OAUccImpl;
	@Autowired
	private GetsubjectService gs;		
	public String newHead() {
		head = new StHead();
		
		// 设置拟稿人
		IUser user=UserThreadLocal.get();
		head.setNgr(String.valueOf(user.getUserTid()));
		head.setNgrxm(user.getUsername());
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1().toString());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		//设置该处理单所关联的实体类型
		zixuntype = (String)request.getParameter("zixunType");
		head.setZixuntype(zixuntype);
		//设置拟稿日期
		head.setNgrq(new Date());
		//处理单流程
		head.setLcmc("用工计划");
		//设置处理单审批状态
		head.setSpzt("0");
		// 在数据库中插入一条空的head记录，得到处理单ID
		cEMEntityFormUccImpl.newEntityForm(head);
		request.setAttribute("headId", head.getId());
		request.setAttribute("ngrxm", head.getNgrxm());
		request.setAttribute("ngbmmc", head.getNgbmmc());
		return "tomodify";
	}
	
	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示, 以及后续的修改等操作. 直接返回
	 * @return
	 */
	public String modifyHead() {
		// 获得表头ID
		headId = (String) request.getAttribute("headId");
		// 在数据库中检索出表头信息，返回到页面表头
		head = cEMEntityFormUccImpl.viewEntityHead(headId);
		//查看oa开始
		eam2oa = commonEam2OAUccImpl.queryEAM2OAByHeadID(headId);
		if (eam2oa != null) {
			request.setAttribute("oaurl", eam2oa.getUrl());
			request.setAttribute("status", eam2oa.getStatus());
		}
		//查看oa结束
		List<StGlbt> list = cEMEntityFormUccImpl.viewEntityBody(headId);
		if(list != null && list.size() > 0){
			stGlbt = list.get(0);
			jbxx = cEMEntityService.viewEntityJbxx(head.getStId());
		}
		request.setAttribute("userTid", head.getNgr());
		return "start";
	}

	/**
	 * 界面上有一个保存按钮,点击以后保存到数据库, 从request里面得到bo对象,然后更新到表头数据表去
	 * 
	 * @return
	 */
	public String saveHead() {
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		//====================编号作废所需参数
		cEMEntityFormUccImpl.updateStGlbt(head.getId(), head.getStId());
		cEMEntityFormUccImpl.saveEntityForm(head);
		this.request.setAttribute(WorkflowAction.PT_DRAFT, 
				this.headToPTDraft(head)
			);
			this.request.setAttribute(WorkflowAction.PT_TODO, 
				this.headToPTTodo(head)
			);
		//====================编号作废所需参数	
		if(StringUtils.isNotEmpty(taskId)){
			workflowutil.putVariables(taskId, "codeType", "stgl_ygjh");
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", head.getNgbm());
		}
		//====================编号作废所需参数
		return "toWorkflow";
	}
	
	private PTTodo headToPTTodo(StHead head){
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		todo.setSheetId(head.getBianhao());
		return todo;
	}
	
	private PTDraft headToPTDraft(StHead head){
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType("用工计划");
		draft.setTitle(head.getBiaoti());
		if(StringUtils.isNotEmpty(head.getNgbm())){
		  draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.ENTITY_SUBSYSTEM);
		return draft;
	}
	
	/**
	 * 生成处理单编号
	 * @return
	 * 
	 */
	public String createNum(){
		headId =request.getParameter("headId");
		head = cEMEntityFormUccImpl.viewEntityHead(headId);
		bianhao = head.getBianhao();
		if(bianhao==null||bianhao.length()==0){
			bianhao = iCodeGenerator.generateCurrentCode("stgl_ygjh", head.getNgbm(), head.getNgbmmc());
			head.setBianhao(bianhao);
			cEMEntityFormUccImpl.newEntityForm(head);
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
	 * 处理单办结
	 * @return
	 */
	public String completeHead(){
		headId = (String) request.getParameter("headId");
		cEMEntityFormUccImpl.updateStHead(headId, "spzt", "2");
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 流程办结启动oa发文
	 * 
	 * @return
	 * @throws Exception
	 */
	public String startOAFlow() throws Exception {
		boolean isCompleted = true;
		String EAMmsgid = request.getParameter("EAMmsgid");
		try {
			cEMEntityFormUccImpl.updateStHead(EAMmsgid, "spzt", "2");
		} catch (Exception e) {
			isCompleted = false;
		}
		System.out.println("======"+isCompleted);
		String ngrq = request.getParameter("ngrq");
		String ngr = request.getParameter("ngr");
		String zbbm = request.getParameter("zbbm");
		String yjwjurl = request.getParameter("yjwjurl");
		String nglx = request.getParameter("nglx");
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
			} else if(isCompleted == false){
				response.getWriter().write("发送不成功,请重新发送");
			}else {
				response.getWriter().write(url);
			}
		}
		return null;
	}	
	public StHead getHead() {
		return head;
	}

	public void setHead(StHead head) {
		this.head = head;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public StJbxx getJbxx() {
		return jbxx;
	}

	public void setJbxx(StJbxx jbxx) {
		this.jbxx = jbxx;
	}

	public StGlbt getStGlbt() {
		return stGlbt;
	}

	public void setStGlbt(StGlbt stGlbt) {
		this.stGlbt = stGlbt;
	}

	public EntityDisplayVO getEntityDisplayVO() {
		return entityDisplayVO;
	}

	public void setEntityDisplayVO(EntityDisplayVO entityDisplayVO) {
		this.entityDisplayVO = entityDisplayVO;
	}

	public String getStId() {
		return stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
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

	public ICEMEntityService getCEMEntityService() {
		return cEMEntityService;
	}

	public void setCEMEntityService(ICEMEntityService entityService) {
		cEMEntityService = entityService;
	}

	public ICEMEntityFormUcc getCEMEntityFormUccImpl() {
		return cEMEntityFormUccImpl;
	}

	public void setCEMEntityFormUccImpl(ICEMEntityFormUcc entityFormUccImpl) {
		cEMEntityFormUccImpl = entityFormUccImpl;
	}

	public String getZixuntype() {
		return zixuntype;
	}

	public void setZixuntype(String zixuntype) {
		this.zixuntype = zixuntype;
	}

	public StGlbt getBody() {
		return body;
	}

	public void setBody(StGlbt body) {
		this.body = body;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public CommonEam2Oa getEam2oa() {
		return eam2oa;
	}

	public void setEam2oa(CommonEam2Oa eam2oa) {
		this.eam2oa = eam2oa;
	}

}
