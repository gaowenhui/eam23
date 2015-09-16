package com.tansun.eam2.zccz.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IPersonDealHeadService;
import com.tansun.eam2.zccz.vo.PersonHeadVo;
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


public class PersonDealHeadAction extends CommonAction {

	private CzStcztz head;
	private String oldStid;
	private String headId;
	
	private IUserUCC userUCC;
	private IDeptUCC deptUCC;
	private	IPersonDealHeadService headService;
	private WorkflowUtil workflowutil;

	@Autowired
	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	/**
	 * 新建入口
	 * @return
	 */
	public String newHead(){
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		Iterator<PTDeptBO> deptIte = deptUCC.getDeptByUserId(user.getTid()).iterator();
		//如果head不为空，创建一个对象保存
		if(head == null){
			head = new CzStcztz();
			head.setNgr(String.valueOf(user.getTid()));
			head.setNgrxm(user.getUsername());
			head.setNgrq(new Date());
			head.setHgsccs(0L);
			head.setCldzt(ZcczCommon.FORM_HAVE_NOT_APPROVED);
			if(deptIte.hasNext()){
				PTDeptBO dept = deptIte.next();
				head.setNgbm(String.valueOf(dept.getRsvdNum1()));
				head.setNgbmmc(dept.getRsvdStr1());
			}
			head.setLxdh(user.getCellphone());
		}
		headService.saveHead(head);
		request.setAttribute("headId", head.getId());
		request.setAttribute("head", head);
		request.setAttribute("user", user);
		return "tomodify";
	}
	
	public String setStJbxxToHead(){
		try {
			PersonHeadVo vo = headService.setStjbxxToCzStcztz(head.getId(), head.getStid(), head.getFafl(), oldStid);
			response.setCharacterEncoding("UTF-8");
			System.out.println(BodyListToJSON.bodyToJSON(vo, getJsonConfig(), false));
			response.getWriter().print(BodyListToJSON.bodyToJSON(vo, getJsonConfig(), false));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String setRyFyInfo(){
		try{
			CzStcztz stcztz = headService.setRyFyInfo(head.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.bodyToJSON(stcztz, getJsonConfig(), false));
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String reSetRenyuanFeiyong(){
		try{
			headService.reSetRenyuanFeiyong(head.getId());
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String submitHead(){
		String taskId = (String)request.getParameter("taskId");
		IUser tuser = UserThreadLocal.get();
		headService.saveHead(head);
		this.request.setAttribute(WorkflowAction.PT_DRAFT, 
			this.headToPTDraft(head)
		);
			this.request.setAttribute(WorkflowAction.PT_TODO, 
			this.headToPTTodo(head)
		);
		if(StringUtils.isNotEmpty(taskId)){
			workflowutil.putVariables(taskId, "headId", head.getId());
			workflowutil.putVariables(taskId, "currentUserId", String.valueOf(tuser.getUserTid()));
			
			String strsel = request.getParameter("strsel");
			if(StringUtils.isNotEmpty(strsel)){
				workflowutil.putVariables(taskId, "strsel", strsel);
			}
		}
		return "toWorkflow";
	}
	
	/**
	 * 查询head方法
	 * @return
	 */
	public String toModify(){
		try{
		headId = (String)request.getAttribute("headId");
		if(StringUtils.isEmpty(headId))
			headId = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headId)){
			head = headService.viewDraft(headId);
		}else if(head != null && StringUtils.isNotEmpty(head.getId())){
			head = headService.viewDraft(head.getId());
		}
		List<CzStcztz>  historyHeadList = new ArrayList<CzStcztz>();
		if(StringUtils.isNotEmpty(head.getStid())){
			List<CzStcztz>  headList = new ArrayList<CzStcztz>();
			headList =  headService.viewHead(head.getStid(), "实体人员安置");
			for(CzStcztz object:headList){
				if(object.getId()!=headId){
					historyHeadList.add(object);
				}
			}
		}
		request.setAttribute("userTid", head.getNgr());
		request.setAttribute("head", head);
		request.setAttribute("historyHeadList", historyHeadList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "newHead";
	}

	public String endProcess(){
		try{
			String taskId = (String)request.getParameter("taskId");
			IUser tuser = UserThreadLocal.get();
			//headService.saveHead(head);
			headService.endProcess(head);//办结实体整体处置流程（"是否上会" = "否",就是实体"处置方式" = "内部关闭"）
			if(StringUtils.isNotEmpty(taskId)){
				workflowutil.putVariables(taskId, "headId", head.getId());
				workflowutil.putVariables(taskId, "currentUserId", String.valueOf(tuser.getUserTid()));
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS_END");
		}catch(Exception e){
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
	private PTTodo headToPTTodo(CzStcztz head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getCzxmmc());
		todo.setHeadType(ZcczCommon.PROCESS_NAME_ENTITY_PERSON_DISPOSE);
		todo.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		if(StringUtils.isNotEmpty(head.getBianhao()))
			todo.setSheetId(head.getBianhao());
		return todo;
	}

	/**
	 * 添加到草稿
	 * 
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzStcztz head) {
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType("head.getLcmc()");
		draft.setTitle(head.getCzxmmc());
		draft.setHeadType(ZcczCommon.PROCESS_NAME_ENTITY_PERSON_DISPOSE);
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		if(StringUtils.isNotEmpty(head.getNgbm()))
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		return draft;
	}
	
	public String generateBianhao(){
		try{
			CzStcztz czStcztz = headService.generateBianhao(head.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.bodyToJSON(czStcztz, this.getJsonConfig(), false));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public String generatorSlxh(){
		try{
			CzStcztz czStcztz = headService.generateShoulixuhaoShenbaoRQ(head.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.bodyToJSON(czStcztz, this.getJsonConfig(), false));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public String showPersonCld(){
		try{
			headId = request.getParameter("headId");
			if(StringUtils.isNotEmpty(headId)){
				head = headService.viewDraft(headId);
			}else if(head != null && StringUtils.isNotEmpty(head.getId())){
				head = headService.viewDraft(head.getId());
			}
			request.setAttribute("head", head);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "showPersonCld";
	}
	
	private String xmId;
	private String fenlei;
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
	
	public String showPersonZc(){
		xmId = request.getParameter("xmId");
		fenlei = request.getParameter("fenlei");
		headId = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headId)){
			head = headService.viewDraft(headId);
		}else if(head != null && StringUtils.isNotEmpty(head.getId())){
			head = headService.viewDraft(head.getId());
		}
		List<CzStcztz>  historyHeadList = new ArrayList<CzStcztz>();
		if(StringUtils.isNotEmpty(head.getStid())){
			List<CzStcztz>  headList = new ArrayList<CzStcztz>();
			headList =  headService.viewHead(head.getStid(), "实体人员安置");
			for(CzStcztz object:headList){
				if(object.getId()!=headId){
					historyHeadList.add(object);
				}
			}
		}
		request.setAttribute("head", head);
		request.setAttribute("historyHeadList", historyHeadList);
		return "showPersonZc";
	}
	
	public String feiyongDetail(){
		return "feiyongDetail";
	}
	
	public String renyuanDetail(){
		return "renyuanDetail";
	}
	
	public void setHead(CzStcztz head) {
		this.head = head;
	}

	public CzStcztz getHead() {
		return head;
	}

	@Autowired
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}

	@Autowired
	public void setDeptUCC(IDeptUCC deptUCC) {
		this.deptUCC = deptUCC;
	}

	@Autowired
	public void setHeadService(IPersonDealHeadService headService) {
		this.headService = headService;
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

	public void setOldStid(String oldStid) {
		this.oldStid = oldStid;
	}
}
