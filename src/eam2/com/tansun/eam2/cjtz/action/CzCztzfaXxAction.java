package com.tansun.eam2.cjtz.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.cjtz.ucc.ICzCztzfaXxUCC;
import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

public class CzCztzfaXxAction extends CommonAction {

	private CzStcztz czstcztz;
	private CzZcXx czzcxx;
	private WorkflowUtil workflowutil;

	private StHead stHead;
	private StGlbt stGlbt; 
	private String zcIds;
	private String headId;
	
	@Autowired
	private IUserUCC userUCC;
	@Autowired
	private IDeptUCC deptUCC;
	@Autowired
	private ICzCztzfaXxUCC ucc;
	
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

	/**
	 * 进入处理单页面
	 * @return
	 */
	public String newHead(){
		czstcztz = new CzStcztz();
		//得到登录人的信息
		//设置默认值
		czstcztz.setNgrq(new Date());
		IUser user=UserThreadLocal.get();
		czstcztz.setNgr(String.valueOf(user.getUserTid()));
		czstcztz.setNgrxm(user.getUsername());
		//得到人所在部门
		List<PTDeptBO> list=deptUCC.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            czstcztz.setNgbm(String.valueOf(dept.getRsvdNum1()));
            czstcztz.setNgbmmc(dept.getRsvdStr1());
		}
		czstcztz.setHgsccs(0l);
		PTUserBO user1 = userUCC.getSingleById(user.getUserTid());
		czstcztz.setLxdh(user1.getCellphone());
//		czstcztz
		ucc.save(czstcztz);
		request.setAttribute("headId", czstcztz.getId());
		return "tomodify";
	}
	
	/**
	 * 显示修改信息,
	 */
	@Autowired
	private ICodeService codeService;
	public String modifyHead() {
		// 获得表头ID
		headId = (String)request.getAttribute("headId");
		if(StringUtils.isEmpty(headId)){
			headId = request.getParameter("headId");
		}
		czstcztz = ucc.getCzStcztzById(headId);
		String sfName = null;
		if(czstcztz.getStscsf() != null)
			sfName = codeService.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", czstcztz.getStscsf());
		request.setAttribute("sfName",sfName);
		return "showCzCztzfaXx";
	}
	
	/**
	 * 保存数据 
	 * 
	 * @return
	 */
	public String saveHead() {
		String ywlx = czstcztz.getTzywlx();
		ucc.update(czstcztz);
		request.setAttribute("ywlx", ywlx);
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(czstcztz));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(czstcztz));
		// 工作流需要变量
		String taskId = (String)request.getParameter("taskId");		
		if(StringUtils.isNotEmpty(taskId)){
			workflowutil.putVariables(taskId, "headId", czstcztz.getId());
//			workflowutil.putVariables(taskId, "currentUserId", String.valueOf(tuser.getUserTid()));
		}
		return "toWorkflow";
	}

	/**
	 * 添加到待办
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(CzStcztz head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getCzxmmc());
		//表单编号。
		todo.setSheetId(head.getBianhao());
		return todo;
	}

	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzStcztz head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType("承继投资审批");
		draft.setTitle(head.getCzxmmc());
		//拟稿部门
		if(StringUtils.isNotEmpty(head.getNgbm())){
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.INVESTMENT_SUBSYSTEM);
		return draft;
	}

	/**
	 * 保存表体,根据表头id 选择资产ids
	 * 
	 * @return
	 */
	public String saveBody(){
		ucc.saveBody(zcIds,headId);
		return null;
	}
	
	/**
	 * 得到固定资产的列表
	 * @return
	 */
	public String getGdzcList(){
		String str = ucc.getGdzcList(headId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	//打印生成的编号
	public String generateBianhao(){
		try{
			CzStcztz czStcztz = ucc.generateBianhao(czstcztz.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.bodyToJSON(czStcztz, this.getJsonConfig(), false));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//打印生成的受理序号
	public String generatorSlxh(){
		try{
			CzStcztz czStcztz = ucc.generateShoulixuhaoShenbaoRQ(czstcztz.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.bodyToJSON(czStcztz, this.getJsonConfig(), false));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	//**********以下为用到的getter setter*********************************************

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public StHead getStHead() {
		return stHead;
	}

	public void setStHead(StHead stHead) {
		this.stHead = stHead;
	}

	public StGlbt getStGlbt() {
		return stGlbt;
	}

	public void setStGlbt(StGlbt stGlbt) {
		this.stGlbt = stGlbt;
	}

	public CzZcXx getCzzcxx() {
		return czzcxx;
	}

	public void setCzzcxx(CzZcXx czzcxx) {
		this.czzcxx = czzcxx;
	}

	public CzStcztz getCzstcztz() {
		return czstcztz;
	}

	public void setCzstcztz(CzStcztz czstcztz) {
		this.czstcztz = czstcztz;
	}

	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}
	
	private JsonConfig getJsonConfig() {
		JsonConfig jsonConfig = new JsonConfig();
		
		//设置没有值，或者指定属性 不处理生成JSON串
		jsonConfig.setJsonPropertyFilter( new PropertyFilter(){   
			   public boolean apply( Object source, String name, Object value ){   
			      return name.equals("sysUpdateTime");   
			   }   
			});
		
		//特殊对象的数据进行转换，可以自行控制，如日期格式化。
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor(){

			public Object processArrayValue(Object value, JsonConfig jsonConfig) {
				return null;
			}

			public Object processObjectValue(String key, Object value,
					JsonConfig jsonConfig) {
				String str = "";
				if(value != null && value instanceof Date){
					str = new SimpleDateFormat("yyyy-MM-dd").format((Date)value);
				}
				
				return str;
			}
			
		});
		//指定某些属性如果为null则不转换成JSON串。
		jsonConfig.setExcludes( new String[]{ "Double", "Boolean"} );
		return jsonConfig;
	}
	
	public String showCjtzCld(){
		String headId = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headId)){
			czstcztz = ucc.getCzStcztzById(headId);
		}else if(czstcztz != null){
			czstcztz = ucc.getCzStcztzById(czstcztz.getId());
		}
//		request.setAttribute("czstcztz", czstcztz);
		return "showCjtzCld";
	}
	
	private String xmId;
	private String fenlei;

	// 查询处置项目中选择处置的资产
	public String showZcxx() {
		xmId = request.getParameter("xmId");
		fenlei = request.getParameter("fenlei");
		request.setAttribute("xmId", xmId);
		request.setAttribute("fenlei", fenlei);
		String headId = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headId)){
			czstcztz = ucc.getCzStcztzById(headId);
		}else if(czstcztz != null){
			czstcztz = ucc.getCzStcztzById(czstcztz.getId());
		}
		return "showZcxx";
	}

	// 查询处置项目处理单
	public String showCldxx() {
		String headId = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headId)){
			czstcztz = ucc.getCzStcztzById(headId);
		}else if(czstcztz != null){
			czstcztz = ucc.getCzStcztzById(czstcztz.getId());
		}
		return "showCldxx";
	}
}
