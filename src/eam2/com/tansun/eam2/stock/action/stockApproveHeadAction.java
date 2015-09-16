package com.tansun.eam2.stock.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.StockSbody;
import com.tansun.eam2.common.model.orm.bo.StockShead;
import com.tansun.eam2.stock.ucc.IStockApproveService;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

public class stockApproveHeadAction extends CommonAction {
	private StockShead head;
	private String headId = "";
	private String bmbh;
	private String bmmc;
	private String StockIds;
	private String BodyIds;
	private Paginator paginator =new Paginator();
	@Autowired
	private IStockApproveService stService;
    @Autowired
    private IStockApproveService stockApproveService;
    @Autowired
    private ICodeGenerator codeGenerator;
    @Autowired
    private WorkflowUtil workflowutil;
    
	public String newHead(){
		head = new StockShead();
		// 得到当前登陆人员
		head.setNgrbh(UserThreadLocal.get().getUserTidChar());
		head.setNgrmc(UserThreadLocal.get().getUsername());
		head.setNgbmbh(UserThreadLocal.get().getDeptList().get(0).getTid().toString());
		head.setNgbmmc(UserThreadLocal.get().getDeptList().get(0).getDeptName());
		head.setNgrq(new Date());
		head.setSheetType("债券相关事项审批");
		// 在数据库中插入一条空的head记录，得到处理单ID


		stService.newHead(head);
		request.setAttribute("headId", head.getSheadId());
		return "tomodify";
	}
	
	
	public String modifyHead(){
//		headId = (String) request.getAttribute("headId");
//		head = contractUCCImpl.getJjzcHtqsHeadById(headId);
//		request.setAttribute("head", head);
//		sheettype = head.getSheettype();
		
		String headid =(String)request.getAttribute("headId");
		head = stService.viewStockShead(headid);
		request.setAttribute("head", head);
		request.setAttribute("userTid", head.getNgrbh());
		return "modifyHead";
	}
	
	
	public String crateStockBh() {
//		String bmbh="11316";
//		String bmmc="风险监控组";
//		String code = codeGenerator.generateCurrentCode("hkqrdbh","",bmmc);
		String sheadId = request.getParameter("sheadId");
		head = stService.viewStockShead(sheadId);
		System.out.println("-----------");
		String code = codeGenerator.generateCurrentCode("zqglspbh",head.getNgrbh(),head.getNgbmmc());
		head.setSheetId(code); 
		stService.saveHead(head);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(code);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	
    /**
     * jsp  返回 url
     * @return
     */
    public String viewListStock(){
    	
    	try {
    		String look = request.getParameter("look");
    		String sheadId = request.getParameter("sheadId");
    		String Id = request.getParameter("Id");
    			List<StockSbody> list = null;
    			if (!"1".equals(look)){
    				list = stService.viewStockList(sheadId);
    			}else {
    				list = stService.viewStockList(Id);
    			}
	            String josnStr = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
				response.setCharacterEncoding("UTF-8");
				System.out.println("========"+josnStr);
				response.getWriter().print(josnStr);
        	} catch (Exception e) {
    			e.printStackTrace();
    		}
        return null;
    }
	
	public String saveHead(){
//		String headid = request.getParameter("headId");
//		if("".equals(head.getSheetId())){
//			String code = codeGenerator.generateCurrentCode("zqglspbh",head.getNgbmbh(),head.getNgbmmc());
////			String code2 = code.replace("#DEPT#", head.getNgbmmc());
//
//			head.setSheetId(code);
//		}
//		head.setSheadId(headid);
		String taskId = (String)request.getParameter("taskId");

		stService.saveHead(head);
		
		this.request.setAttribute(WorkflowAction.PT_DRAFT, 
				this.headToPTDraft(head)
			);
		this.request.setAttribute(WorkflowAction.PT_TODO, 
			this.headToPTTodo(head));
		
		
		if(StringUtils.isNotEmpty(taskId)){
			workflowutil.putVariables(taskId, "headId", head.getSheadId());
		}
		
		return "toWorkflow";
	}
	
	
	public String saveBody(){
		String sheadId = request.getParameter("sheadId");
		String[] ids = StockIds.split(",");
		stService.saveStockList(ids, sheadId);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("保存成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String creatCode(){
		
		String code = codeGenerator.generateCurrentCode("zqglspbh",head.getNgbmbh(),head.getNgbmmc());
		head.setSheetId(code);
		return null;
	}
	
	
	/**
	 * 删除附属信息
	 * @return
	 */
	public String deleList(){
		if(BodyIds != null){
			String [] ids = BodyIds.split(",");
			stService.deleteStockSbody(ids);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 添加到待办
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(StockShead head){
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getTitle());
		todo.setSheetId(head.getSheadId());
		return todo;
	}
	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(StockShead head){
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getSheadId());
		draft.setHeadType(head.getSheetType());
		draft.setTitle(head.getTitle());
		draft.setDeptId(Long.parseLong(head.getNgbmbh()));
		draft.setSubsystem(GlobalVariable.STOCK_SUBSYSTEM);
		return draft;
	}

    /**
     * 查看相关工作流详细记录
     * @return
     */
    public String viewFlow(){
    	
    	String sheadId = request.getParameter("sheadId");
    	stockApproveService.viewStockShead(sheadId);
    	
    	return "tomodify";
    }
    

    
    


	public StockShead getHead() {
		return head;
	}


	public void setHead(StockShead head) {
		this.head = head;
	}


	public IStockApproveService getStService() {
		return stService;
	}


	public void setStService(IStockApproveService stService) {
		this.stService = stService;
	}


	public String getStockIds() {
		return StockIds;
	}


	public void setStockIds(String stockIds) {
		StockIds = stockIds;
	}


	public Paginator getPaginator() {
		return paginator;
	}


	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}


	public String getHeadId() {
		return headId;
	}


	public void setHeadId(String headId) {
		this.headId = headId;
	}


	public String getBodyIds() {
		return BodyIds;
	}


	public void setBodyIds(String bodyIds) {
		BodyIds = bodyIds;
	}


	public IStockApproveService getStockApproveService() {
		return stockApproveService;
	}


	public void setStockApproveService(IStockApproveService stockApproveService) {
		this.stockApproveService = stockApproveService;
	}


	public String getBmbh() {
		return bmbh;
	}


	public void setBmbh(String bmbh) {
		this.bmbh = bmbh;
	}


	public String getBmmc() {
		return bmmc;
	}


	public void setBmmc(String bmmc) {
		this.bmmc = bmmc;
	}


	public ICodeGenerator getCodeGenerator() {
		return codeGenerator;
	}


	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}


	public WorkflowUtil getWorkflowutil() {
		return workflowutil;
	}


	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}

}
