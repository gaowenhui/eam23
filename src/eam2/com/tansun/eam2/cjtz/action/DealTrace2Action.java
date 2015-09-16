package com.tansun.eam2.cjtz.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.cjtz.ucc.ICjtzUCC;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmjaBody;
import com.tansun.eam2.common.model.orm.bo.CzXmjaHead;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.eam2.zccz.ucc.IDealTrace1HeadUCC;
import com.tansun.eam2.zccz.ucc.IItemShUCC;
import com.tansun.eam2.zccz.vo.CzXmSpwYjVO;
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
public class DealTrace2Action extends CommonAction {
	private String xmlx;
	private String xmIds;
	private DealQueryVo vo;
	private Paginator paginator;
	private CzXmjaHead head;
	private CzXmjaBody body;
	private String headId;
	private String message;
	private CzXmxxLsbVO xmXXVO;
	private String zcId;
	private String zclb;
	@Autowired
	private IDealTrace1HeadUCC ucc;
	@Autowired
	private IDealToDoUCC toDo1UCC;
	@Autowired
	IDeptUCC deptUCCimpl;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private WorkflowUtil workflowutil;	
	@Autowired
	private ICjtzUCC cjtzucc;
	@Autowired
	private IItemShUCC itemShUCCImpl;
	private List<CzXmSpwYjVO> finalList = new ArrayList<CzXmSpwYjVO>();
	
	public List<CzXmSpwYjVO> getFinalList() {
		return finalList;
	}

	public void setFinalList(List<CzXmSpwYjVO> finalList) {
		this.finalList = finalList;
	}
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
		head.setLcmc("申请结案");
		toDo1UCC.save(head);
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
		
		toDo1UCC.update(head);
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
			workflowutil.putVariables(taskId, "codeType", "cjtzja");
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
		String code = codeGenerator.generateCurrentCode("cjtzja", String.valueOf(head.getNgbm()), head.getNgbmmc());
		head.setBianhao(code);
		this.toDo1UCC.update(head);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(code);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String zxqk(){
		
		return "zxqk";
	}
	public String zxqk4Date(){
		String s=this.cjtzucc.findXmxxByZc(zcId,zclb);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String viewItemInfo(){
		String itemId = this.request.getParameter("itemId");
		request.setAttribute("itemId", itemId);
		//根据处置项目id查询处置项目
		CzXmXx czXmXx = this.ucc.findCzXmXxById(itemId);
		//根据处置项目的分类查找不同的处置资产信息
		String itemType = czXmXx.getFenlei();
		request.setAttribute("itemType", itemType);
		request.setAttribute("cldId", czXmXx.getCldId());
		/*
		 * 分类  0：经营性固产处置
				1：实体内资产
				2：委贷抵债物
				3：实体整体处置
				4：实体人员安置
				5：承继投资
		 */
		if(StringUtils.indexOfAny(itemType,  new String[]{"0","1","2","6","7","8","9"}) != -1){
			//根据处理单id查询处理单信息
			CzCztzfaXx cldInfo = ucc.findCldById(czXmXx.getCldId());
			//设置处置资产类别进行页面展示
			request.setAttribute("zclb", cldInfo.getZclb());
		}
		return "disposeItemInfo";
	}
	//查询项目上会信息页面
	public String viewMeetingInfo(){
		String itemId = request.getParameter("itemId");
		CzXmXx xmXx = ucc.findCzXmXxById(itemId);
		if(xmXx != null){
			//处置项目临时表id
			String itemLsbId = xmXx.getXmlsb();
			//根据处置项目信息临时表id查询项目信息
			 xmXXVO = itemShUCCImpl.findCzXmxxById(itemLsbId);
			//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
			List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemLsbId);
			String spwys = "";
			String spzcr = "";
			for(CzXmSpwYj temp : list){
				if(StringUtils.equals(temp.getSfwzcr(),ZcczCommon.DEALTODO_SPWY)){
					spwys += temp.getSpwyxm() + ",";
				}else if(StringUtils.equals(temp.getSfwzcr(), ZcczCommon.DEALTODO_ZCR))
					spzcr += temp.getSpwyxm();
			}
			//审批委员
			xmXXVO.setSpwys(spwys.substring(0, spwys.lastIndexOf(",")));
			//审批主持人
			xmXXVO.setSpzcr(spzcr);
			//根据会议信息Id，获得会议信息
			CzHyxx hyxx = this.itemShUCCImpl.findHyxxById(xmXXVO.getHyId());
			if(hyxx != null){
				xmXXVO.setHycs(hyxx.getHycs());
				//审批时间
				xmXXVO.setSpsj(hyxx.getSpsj());
				//审批方式
				if(StringUtils.equals(hyxx.getCSpfs(), "1")){
					xmXXVO.setCSpfs("会议");
				}else if(StringUtils.equals(hyxx.getCSpfs(), "2")){
					xmXXVO.setCSpfs("会签");
				}
			}
		}
		return "itemShxx";
	}
	
	//查询项目意见汇总页面
	public String viewSummaryInfo(){
		String itemId = request.getParameter("itemId");
		//根据处置项目id获取处置项目信息
		CzXmXx czXmXx = this.ucc.findCzXmXxById(itemId);
		if(czXmXx != null){
			//处置项目临时表id
			String itemLsbId = czXmXx.getXmlsb();
			//根据处置项目信息临时表id查询项目信息
			xmXXVO = itemShUCCImpl.findCzXmxxById(itemLsbId);
			//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
			List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemLsbId);
			Long agreeCount = 0l;
			Long disagreeCount = 0l;
			if(list != null && list.size() > 0){
				for(CzXmSpwYj temp:list){
					CzXmSpwYjVO tempVO = new CzXmSpwYjVO();
					tempVO.copyProperties(temp);
					if(ZcczCommon.DEALTODO_SPWY.equals(temp.getSfwzcr()))
						tempVO.setPersonType("审批委员");
					else if(ZcczCommon.DEALTODO_ZCR.equals(temp.getSfwzcr()))
						tempVO.setPersonType("审批主持人");
					if(temp.getButongyi() == 1){
						tempVO.setDisagreeStr("不同意");
						agreeCount += 1;
					}
					if(temp.getTongyi() == 1){
						tempVO.setAgreeStr("同意");
						disagreeCount += 1;
					}
					xmXXVO.setAgreeCount(agreeCount);
					xmXXVO.setDisagreeCount(disagreeCount);
					finalList.add(tempVO);
				}
			}
		}
		return "summary";
	}
	/**
	 * 流程办结
	 * @return
	 */
	public String banjie(){
		String result = this.ucc.banjie(headId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String zhixingqingkuang(){
		
		return "zhixingqingkuang";
		
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

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getZclb() {
		return zclb;
	}

	public void setZclb(String zclb) {
		this.zclb = zclb;
	}
}
