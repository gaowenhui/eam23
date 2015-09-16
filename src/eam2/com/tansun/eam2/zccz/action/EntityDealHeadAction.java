package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IEntityDealHeadService;
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


public class EntityDealHeadAction extends CommonAction {

	private IUserUCC userUCC;
	private IEntityDealHeadService headService;
	private IDeptUCC deptUCC;
	private CzStcztz head;
	
	WorkflowUtil workflowutil;	
	@Autowired
	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}

	@Autowired
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}

	@Autowired
	public void setHeadService(IEntityDealHeadService headService) {
		this.headService = headService;
	}

	@Autowired
	public void setDeptUCC(IDeptUCC deptUCC) {
		this.deptUCC = deptUCC;
	}

	public void setHead(CzStcztz head) {
		this.head = head;
	}
	
	/**
	 * 新建入口
	 * @return
	 */
	public String newHead(){
		try{
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
				request.setAttribute("deptId", dept.getRsvdNum1());
				head.setNgbm(String.valueOf(dept.getRsvdNum1()));
				head.setNgbmmc(dept.getRsvdStr1());
			}
			head.setLxdh(user.getCellphone());
		}
		headService.saveHead(head);
		request.setAttribute("user", user);
		request.setAttribute("headId", head.getId());
		request.setAttribute("sheettype", "");
		request.setAttribute("head", head);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "tomodify";
	}
	
	//显示选择实体债务（对建投）的页面
	public String showDebtListWin(){
		String stId = request.getParameter("stId");
		request.setAttribute("stId", stId);
		return "showDebtListWin";
	}
	
    //查询实体处置中，未结案的，实体内资产。预计回收金额及收入明细
    public String selectEDM(){
        try {
            String stid = request.getParameter("stid");
            double[] val = headService.selectEDM(stid);
            response.getWriter().write(val[0] + "," + val[1]);
            response.setCharacterEncoding("UTF-8");
        } catch (IOException ex) {
            Logger.getLogger(EntityDealHeadAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

	//保存债权
	public String selectDebtList(){
		try{
			String ids = request.getParameter("ids");
			headService.selectDebtList(head.getId(), head.getStid(), ids);
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//删除债权
	public String delDebtList(){
		try{
			String ids = request.getParameter("ids");
			headService.delDebtList(ids);
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//跟新债权的转让金额
	public String updateDept(){
		String id = request.getParameter("id");
		Double zrje = Double.parseDouble(request.getParameter("zrje"));
		headService.updateDept(id,zrje);
		return null;
	}
	
	//打印本次处置的债权列表Json
	public String showDeptBodys(){
		try{
			String returnStr = headService.getDebtListJsonByHeadId(head.getId());
			if(StringUtils.isNotEmpty(returnStr)){
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(returnStr);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//打印实体内的所有对建投债务
	public String showDebtList(){
		try{
			String stId = request.getParameter("stId");
			List<DebtInfo> debtList = headService.getDebtListByStid(stId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.getJSON(debtList, 1, 1, debtList.size()));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	//提交处理单
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
	
	private PTTodo headToPTTodo(CzStcztz head){
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getCzxmmc());
		todo.setHeadType(ZcczCommon.PROCESS_NAME_ENTITY_DISPOSE);
		if(StringUtils.isNotEmpty(head.getBianhao()))
			todo.setSheetId(head.getBianhao());
		todo.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return todo;
	}
	
	private PTDraft headToPTDraft(CzStcztz head){
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType(ZcczCommon.PROCESS_NAME_ENTITY_DISPOSE);
		draft.setTitle(head.getCzxmmc());
		if(!this.head.getNgbm().equals("")){
			draft.setDeptId(Long.parseLong(this.head.getNgbm()));
		}
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return draft;
	}
	/**
	 * 查询处理单，相当于modifyHead
	 * @return
	 * url	: zccz/entityDealHead_viewDraft.do?head.id=8a81893e2cac0b08012cac24bcd10002
	 */
	public String viewDraft(){
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		String headID = (String)request.getAttribute("headId");
		if(StringUtils.isEmpty(headID))
			headID = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headID)){
			head = headService.viewDraft(headID);
		}else if(head != null){
			head = headService.viewDraft(head.getId());
		}
		request.setAttribute("userTid", head.getNgr());
		request.setAttribute("user", user);
		request.setAttribute("head", head);
		return "newHead";
	}
	
	//打印生成的编号
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
	
	public String cleanStMessage(){
		try{
			headService.cleanStMessage(head.getId(),head.getStid());
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//打印生成的受理序号
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

	public String showStczZc(){
		xmId = request.getParameter("xmId");
		fenlei = request.getParameter("fenlei");
		String headID = request.getParameter("headId");
		head = headService.viewDraft(headID);
		request.setAttribute("headId", headID);
		request.setAttribute("head", head);
		return "showStczZc";
	}
	
	public String showStczCld(){
		String headID = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headID)){
			head = headService.viewDraft(headID);
		}else if(head != null){
			head = headService.viewDraft(head.getId());
		}
		request.setAttribute("head", head);
		return "showStczCld";
	}
	
	public CzStcztz getHead() {
		return head;
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
}
