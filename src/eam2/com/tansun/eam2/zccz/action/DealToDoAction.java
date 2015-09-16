package com.tansun.eam2.zccz.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.util.ESBBean;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.oa.GetsubjectService;
import com.tansun.eam2.oa.ucc.CommonEam2OAUcc;
import com.tansun.eam2.portal.PortalService;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

public class DealToDoAction extends CommonAction {
	Log log = LogFactory.getLog(this.getClass());

	private CzHyxx hyxx;	//会议信息实体
	private String hyId;	//会议id
	private String spwyId;	//	审批委员id
	private String ids;		//选择的项目ids
	private String code;	//会议会签次数
	private String fenlei;	//项目的分类
	private CzXmxxLsb czxmxx;//处置项目
	@Autowired
	private CommonEam2OAUcc commonEam2OAUccImpl;
	@Autowired
	private IDeptUCC deptUCC;
	@Autowired
	private IDealToDoUCC dealToDoUCC;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private ZcczWfBS zcczWfBSImpl;
	@Autowired
	private GetsubjectService gs;
	@Autowired
	public IUserUCC userUCC;
	@Autowired
	IAttachHandleUCC attachHandleUcc;
	WorkflowUtil workflowutil;	
	@Autowired
	public void setWorkflowutil(WorkflowUtil workflowutil) {
		this.workflowutil = workflowutil;
	}
	/**
	 * 安排待办功能
	 * @return
	 */
	public String init(){
		String itemType = this.request.getParameter("itemType");
		request.setAttribute("itemType", itemType);
		if(StringUtils.isNotEmpty(hyId)){
			request.setAttribute("hyId", hyId);//这个是为在已建会议下添加项目而用，并且，hyId也是判断进入项目列表的入口
		}
		return "init";
	}
	/**
	 * jf add
	 * 点击“处置项目列表”跳转到改项目的详细信息表单
	 * @return
	 */
	public String viewItemInfo(){
		String itemId = request.getParameter("id");
//		czxmxx = dealToDoUCC.findCzXmxxLsbById(id);
		CzXmxxLsb czXmXxLsb = this.dealToDoUCC.findCzXmXxById(itemId);
		String itemType = czXmXxLsb.getFenlei();
		request.setAttribute("itemId", itemId);
		request.setAttribute("itemType", itemType);
		request.setAttribute("cldId", czXmXxLsb.getCldId());
		return "czxmxxItemInfo"; 
	}
	
	/**
	 * 查出所有处置项目，并用jqgrad展现
	 * @return
	 */
	public String findZCXMs(){
		try {
			response.setCharacterEncoding("UTF-8");
			String flag = this.request.getParameter("itemType");
			
			if(StringUtils.equals(flag, "dispose")){//资产管理--安排审批代办
				response.getWriter().print(dealToDoUCC.getDsiposeXmJson(czxmxx));
				this.request.setAttribute("itemType", "dispose");
				return null;
			}else if(StringUtils.equals(flag, "investment")){
				response.getWriter().print(dealToDoUCC.getInvestmentXmJson(czxmxx));
				this.request.setAttribute("itemType", "investment");
				return null;
			}
			CzXmxxLsb lsb = new CzXmxxLsb();
			lsb.setZhuangtai(ZcczCommon.DEALTODO_XMZT_WSH);
			lsb.setHyId("");
			lsb.setFenlei(fenlei);
			String JSON = dealToDoUCC.findZCXMs(lsb);//查询状态是未上会的所有项目，第二个参数为hyId会议id，不关联hyId
			response.getWriter().write(JSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查出已有会议下所有的处置项目，并用jqgrad展现
	 * @return
	 */
	public String findZCXMsByMeeting(){
		CzXmxxLsb lsb1 = new CzXmxxLsb();
		lsb1.setZhuangtai("");
		lsb1.setHyId(hyId);
		lsb1.setFenlei(fenlei);
		String JSON = dealToDoUCC.findZCXMs(lsb1);//查询第二个参数为hyId会议id，第一个参数为上会状态，为空，则过滤掉
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(JSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 发送委员时 保存一下会议信息
	 * @return
	 */
	public String saveHyDiDian(){
		String hyid = request.getParameter("hyId");
		String hydd = request.getParameter("hydd");
		CzHyxx hy = dealToDoUCC.findHyxxById(hyid);
		hy.setHydd(hydd);
		dealToDoUCC.update(hy);
		return null;
	}
	/**
	 * 保存添加的会议信息
	 * @return
	 */
	public String saveHyxx(){
		dealToDoUCC.update(hyxx);
		dealToDoUCC.updateXmZt(hyxx.getId());//保存会议后更新项目的状态为上会
		String taskId = (String)request.getParameter("taskId");
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(hyxx));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(hyxx));
		if(StringUtils.isNotEmpty(taskId)){
			workflowutil.putVariables(taskId, "headId", hyxx.getId());
		}
		return "toWorkflow";
	}
	
	//办结时启动oa

	public String startOA(){
		String EAMmsgid = request.getParameter("EAMmsgid");
		String taskid = request.getParameter("taskid");
		String endViewUrl = request.getParameter("endViewUrl");
		String hylx = request.getParameter("hylx");
		String ngrq = "";//拟稿日期
		String ngr = "";//拟稿人
		String zbbm = "";//拟稿部门
		String zwbt = request.getParameter("zwbt");//正文标题
		String zwnr = "";//正文neirong
		String fwsm = "";//发文说明
		String yjwjurl = endViewUrl;//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给OA,在OA中可以直接打开查看
		String Nglx = "";
		if("2".equals(hylx)){
			Nglx = "承继业务投资审批委员会会议纪要"; //需要启动的OA流程名称：发文、签报、法律性文件、会议纪要
		}else{
			Nglx = "资产处置审批会议纪要";
		}
		String wordName = "";//附件名称
		byte[] fileData = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		ngrq = sdf.format(date);
		
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		ngr = user.getUsername();
		Iterator<PTDeptBO> deptIte = deptUCC.getDeptByUserId(user.getTid()).iterator();
		if(deptIte.hasNext()){
			PTDeptBO dept = deptIte.next();
			zbbm = dept.getDeptName();
		}
		
		
		PTAttachment ptattachement = attachHandleUcc.downloadAttachmentByBDIBFW(EAMmsgid,"manager_zcczbahz");
		fileData = ptattachement.getBlob().getContent();
		wordName = ptattachement.getYwjm();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			list = gs.startOAFlow(EAMmsgid, ngrq, ngr,
					zbbm, zwbt, zwnr,fwsm, yjwjurl, Nglx, fileData, wordName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		try{
			if (list.size() == 0) {
					response.getWriter().write("0");//0 表示 不成功  
			}else{
				Map map = list.get(0);
				String status = String.valueOf(map.get("status"));
				String errorinfo = String.valueOf(map.get("errorinfo"));
				String lcid = String.valueOf(map.get("lcid"));
				String url = String.valueOf(map.get("url"));
				if ("ERROR".equalsIgnoreCase(status)) {
					response.getWriter().write("0");
				}else{
					CommonEam2Oa eamoa = new CommonEam2Oa();
					eamoa.setBiaoti("组织安排会议");
					eamoa.setHeadid(EAMmsgid);
					eamoa.setLcid(lcid);
					eamoa.setNgr(ngr);
//					eamoa.setNgrid(ngrid);
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				    Date toDate=dateFormat.parse(ngrq);
					eamoa.setNgrq(toDate);
					eamoa.setYwmc("资产管理");
					eamoa.setYwzl("资产管理上会流程");
					eamoa.setUrl(url);
					eamoa.setStatus("0");
					commonEam2OAUccImpl.saveEAM2OA(eamoa);
					response.getWriter().write(url);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 保存添加的会议信息
	 * @return
	 */
	public String endHyxx(){
		try{
			dealToDoUCC.update(hyxx);
			dealToDoUCC.updateXmZt(hyxx.getId());//保存会议后更新项目的状态为上会
			String taskId = (String)request.getParameter("taskId");
			if(StringUtils.isNotEmpty(taskId)){
				workflowutil.putVariables(taskId, "headId", hyxx.getId());
			}
			response.getWriter().print("SUCCESS_END");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public String endHyxx1(){
		try{
			dealToDoUCC.update(hyxx);
			//dealToDoUCC.updateXmZt(hyxx.getId());//保存会议后更新项目的状态为上会
			String taskId = (String)request.getParameter("taskId");
			if(StringUtils.isNotEmpty(taskId)){
				workflowutil.putVariables(taskId, "headId", hyxx.getId());
			}
			response.getWriter().print("SUCCESS_END");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public String submitHyxx(){
		//dealToDoUCC.update(hyxx);   // 整理会议纪要  时  清空此表了
		return "toWorkflow";
	}
	
	private PTTodo headToPTTodo(CzHyxx head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getHycs());
		todo.setHeadType(ZcczCommon.PROCESS_NAME_SHANGHUI);
		todo.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return todo;
	}

	/**
	 * 添加到草稿
	 * 
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzHyxx head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType(ZcczCommon.PROCESS_NAME_SHANGHUI);
		if(StringUtils.isNotEmpty(head.getNgbm()))
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		draft.setTitle(head.getHycs());
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		draft.setUserId(userThreadLocal.get().getUserTid());
		draft.setDeptId(userThreadLocal.get().getDeptList().get(0).getTid());
		return draft;
	}
	
	//查询方法
	public String modifyMeeting(){
		String hyId = (String)this.request.getAttribute("headId");
		if(hyId == null){
			hyId = this.request.getParameter("headId");
		}
		hyxx = this.dealToDoUCC.findHyxxById(hyId);	
		CzXmxxLsb lsb1 = new CzXmxxLsb();
		lsb1.setZhuangtai("");
		lsb1.setHyId(hyId);
		lsb1.setFenlei(fenlei);
		String JSON = dealToDoUCC.findZCXMs(lsb1);//查询第二个参数为hyId会议id，第一个参数为上会状态，为空，则过滤掉
		response.setCharacterEncoding("UTF-8");
		int i = JSON.indexOf("委员提交意见中");
		int j = JSON.indexOf("意见汇总中");
		int k = JSON.indexOf("意见汇总完毕");
		int h = JSON.indexOf("委员提交意见完毕");
		request.getSession().removeAttribute("wyzhuangtai");
		if(i > 0){
			request.getSession().setAttribute("wyzhuangtai", "委员提交意见中");
		}else if(j > 0){
			request.getSession().setAttribute("wyzhuangtai", "汇总审批意见中");
		}else if(k > 0){
			request.getSession().setAttribute("wyzhuangtai", "整理会议纪要");
			
		}else if(i < 0 && h > 0){
			request.getSession().setAttribute("wyzhuangtai", "委员提交意见完毕");
		}
		request.setAttribute("sffscl", hyxx.getSffscl());
		return "addMeeting";
	}
	
	/**
	 * 删除会议信息
	 * @return
	 */
	public String cancelHyxx(){
		String huiyicishu = request.getParameter("huiyicishu");
		String huiqiancishu = request.getParameter("huiqiancishu");
		if(huiyicishu!=null&&huiyicishu.length()>0){
			codeGenerator.disableCurrentCode("huiyi", huiyicishu, "");//取消会议次数
		}
		if(huiqiancishu!=null&&huiqiancishu.length()>0){
			codeGenerator.disableCurrentCode("huiqian", huiqiancishu, "");//取消会签次数
		}
		dealToDoUCC.delCzxm2Meeting(hyId,null);//传的为null时，是删除全部
		return null;
	}
	
	/**
	 * 组织会议，并关联选择的项目到会议下,并给每个项目配主持人
	 * @return
	 */
	public String addMeeting(){
		hyxx = new CzHyxx();
		hyxx.setHylx(request.getParameter("itemType"));
		dealToDoUCC.saveHyxxAndZcr(hyxx);//创建会议信息，并保存
		String ids = request.getParameter("ids");//得到选择的处置项目，
		String[] xmIds = ids.split(",");
		dealToDoUCC.creatCzxm2Meeting(hyxx.getId(),xmIds);//处置项目关联到会议下
		request.setAttribute("headId", hyxx.getId());
		request.setAttribute("itemType",request.getParameter("itemType"));
		return "tomodify";
	}

	/**
	 * 在会议下 增加一条或多条项目
	 * @return
	 */
	public String addXm(){
		
		String ids = request.getParameter("ids");//得到选择的处置项目，
		String[] xmIds = ids.split(",");
		String flag = request.getParameter("flag");//这个标志是表示 新增的 处置项目  并且要更改这些项目为上会中。
		if(flag != null && "Y".equals(flag)){
			this.updateHyZT(xmIds);
		}
		dealToDoUCC.creatCzxm2Meeting(hyId,xmIds);//处置项目关联到会议下
		return null;
	}

	//不在 会议组织  环节添加项目时要改为  上会中。
	public void updateHyZT(String[] xmIds){
		dealToDoUCC.updateHyZT(xmIds);
	}
	/**
	 * 在会议下 删除处置项目
	 * @return
	 */
	public String delXm(){
		String ids = request.getParameter("ids");//得到选择的处置项目，
		if(ids.startsWith(",")){
			ids = ids.substring(1);
		}
		String[] xmIds = ids.split(",");
		dealToDoUCC.delCzxm2Meeting(hyId,xmIds);//会议下,删除处置项目
		return null;
	}
	
	/**
	 * 取得会议或会签的会议次数
	 * @return
	 */
	public String getCode4Hycs(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(new Date());
		String codeType = request.getParameter("codeType");//会议为1，会签为2
		String code = "";
		if(ZcczCommon.DEALTODO_HUIYI.equals(codeType)){
			code = codeGenerator.getNextCode("huiyi", "", "");
		}else if(ZcczCommon.DEALTODO_HUIQIAN.equals(codeType)){
			code = codeGenerator.getNextCode("huiqian", "", "");
		}
		String code2 = code.replace("#1#", year);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(codeType+","+code2);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String getCode5Hycs(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(new Date());
		String codeType = request.getParameter("codeType");//会议为1，会签为2
		String code = "";
		
		if(ZcczCommon.DEALTODO_HUIYI.equals(codeType)){
			code = codeGenerator.generateCurrentCode("huiyi", "", "");//会议
		}else if(ZcczCommon.DEALTODO_HUIQIAN.equals(codeType)){
			code = codeGenerator.generateCurrentCode("huiqian", "", "");//会签
		}
		String code2 = code.replace("#1#", year);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(codeType+","+code2);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String disableCode6Hycs(){
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(new Date());
		String codeType = request.getParameter("codeType");//会议为1，会签为2
		String code = request.getParameter("code");
		String[] msg = code.split("-");
		int count = msg.length;
		String str = "#1#";
		for(int i = 1; i < count; i++){
			str+="-"+msg[i];
		}
		if(ZcczCommon.DEALTODO_HUIYI.equals(codeType)){
			codeGenerator.disableCurrentCode("huiyi", str, "");
		}else if(ZcczCommon.DEALTODO_HUIQIAN.equals(codeType)){
			codeGenerator.disableCurrentCode("huiqian", str, "");
		}
//		String code2 = code.replace("#1#", year);

		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(codeType+","+code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
//	public String getCode4Hycs(){
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//		String year = sdf.format(new Date());
//		String codeType = request.getParameter("codeType");//会议为1，会签为2
//		String code = "";
//		if(ZcczCommon.DEALTODO_HUIYI.equals(codeType)){
//			code = codeGenerator.generateCurrentCode("huiyi", "", "");//会议
//		}else if(ZcczCommon.DEALTODO_HUIQIAN.equals(codeType)){
//			code = codeGenerator.generateCurrentCode("huiqian", "", "");//会签
//		}
//		String code2 = code.replace("#1#", year);
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.getWriter().write(codeType+","+code2);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	/**
	 * 进入选择审批委员或主持人页面
	 * @return
	 */
	public String getZcrSpwy(){
		String isZcrOrSpwy = request.getParameter("isZcrOrSpwy");
		String pdk = request.getParameter("pdk");
		String hylx = request.getParameter("hylx");
		request.setAttribute("isZcrOrSpwy", isZcrOrSpwy);
		request.setAttribute("pdk", pdk);
		request.setAttribute("hylx", hylx);
		return "getZcrOrSpwy";
	}
	
	//给会议内所有没有提交意见的审批委员发送提醒消息
	public String sendMessageToWtjSpwy(){
		try{
			String hyId = request.getParameter("hyId");
			dealToDoUCC.sendMessageToWtjSpwy(hyId,UserThreadLocal.get().getUserTid());
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
			if(log.isDebugEnabled())
				log.debug(e.getStackTrace());
		}
		return null;
	}
	
	/**
	 * 得到主持人和审批委员的列表
	 * @return
	 */
	public String getZcrOrSpwyByRole(){
		String isZcrOrSpwy = request.getParameter("isZcrOrSpwy");
		String pdk = request.getParameter("pdk");
		String hylx = request.getParameter("hylx");
		String JSONStr = "";
		String role = "";
		if("true".equals(isZcrOrSpwy)){
			if(StringUtils.equals("investment", hylx) || StringUtils.equals("cjtz_shenpi", pdk))
				role = ZcczCommon.CJTZ_ROLE_ZCR;//主持人的角色id(承继投资)
			else
				role = ZcczCommon.DEALTODO_ROLE_ZCR;//主持人的角色id(资产处置)
		}else if("false".equals(isZcrOrSpwy)){
			if(StringUtils.equals("investment", hylx) || StringUtils.equals("cjtz_shenpi", pdk))
				role = ZcczCommon.CJTZ_ROLE_SPWY;//审批委员的角色id(承继投资)
			else
				role = ZcczCommon.DEALTODO_ROLE_SPWY;//审批委员的角色id
		}
		JSONStr = dealToDoUCC.getZcrOrSpwyByRole(role);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(JSONStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改处置项目的审批委员
	 * @return
	 */
	public String modigySpwy(){
		
		String xmIds   = request.getParameter("xmIds");//项目名称ids
		String spwyIds = request.getParameter("spwyIds");//审批委员ids
		String spwys	   = request.getParameter("spwy");		//审批委员姓名
		dealToDoUCC.modigySpwy(xmIds,spwyIds,spwys);
		return null;
	}
	
	/**
	 * 会议下项目的排序
	 * @return
	 */
	public String sortXm(){
		String sortType = request.getParameter("sortType");
		String xmId 	= request.getParameter("xmId");
		String message = dealToDoUCC.sortXm(sortType,hyId,xmId);
		if(message!=null&&message.length()>0){
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().write(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 打开会议纪要整理人的树
	 * @return
	 */
	public String tree(){
		
		return "tree";
	}
	
	/**
	 * 进入会议明细，会议纪要总页面，
	 * @return
	 */
	public String info(){
		
		return "info";
	}
	
	/**
	 * 展现会议信息页面 这是iframe
	 * @return
	 */
	public String hyxxInfo(){
		hyxx = dealToDoUCC.findHyxxById(hyId);
		return "addMeeting";
	}

	/**
	 * 展现会议纪要页面 这也是iframe
	 * @return
	 */
	public String hyJiyao(){
		return "hyJiyao";
	}
	
	/**
	 * 处置项目审批，
	 * @return
	 */
	public String czxmsp(){
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		hyId = this.request.getParameter("headId");
		if(StringUtils.isEmpty(hyId))
			hyId = (String)request.getAttribute("headId");
		if(StringUtils.isEmpty(hyId)){
			hyId = this.request.getParameter("hyId");
		}
		if(StringUtils.isEmpty(hyId)){
			hyId = (String)request.getAttribute("hyId");
		}
		String todoId = request.getParameter("todoId");
		hyxx = dealToDoUCC.findHyxxById(hyId);
		request.setAttribute("hyId", hyId);
		request.setAttribute("spwyId", user.getTid());
		request.setAttribute("todoId", todoId);
		PortalService portal = new PortalService();
		String flag = "true";
		ESBBean esbBean = (ESBBean)SpringContextHelper.getBean("esbBean");
		portal.setPrefix(esbBean.getEsb());
		flag = esbBean.getMode();
		if(!"true".equals(flag)){
			PTTodo todo = dealToDoUCC.getPTTodoById(todoId);
			if(todo != null){
				portal.setHaveRead(todo);
			}
		}
		return "czxmsp";
	}
	
	/**
	 * 根据审批委员Id，会议id查询上会中项目
	 * @return
	 */
	public String getCzxm4Sp(){
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		String JSONstr = dealToDoUCC.findCzxmJSON4Sp(String.valueOf(user.getTid()),hyId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(JSONstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 上会意见情况查看
	 * @return
	 */
	public String czxm4Shyj(){
		hyxx = dealToDoUCC.findHyxxById(hyId);
		return "czxm4Shyj";
	}
	
	/**
	 * 根据会议id查询上会中项目上会意见情况
	 * @return
	 */
	public String getCzxm4Shyj(){
		String JSONstr = dealToDoUCC.findCzxmJSON4Shyj(hyId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(JSONstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String endMeeting(){
		String hyId = request.getParameter("hyId");
		String isAllSubmit = dealToDoUCC.isAllSpwySubmit(hyId);
		response.setCharacterEncoding("UTF-8");	
		String returnStr = "";
		if(StringUtils.isEmpty(isAllSubmit)){
			returnStr = "success";
		}else{
			returnStr = "fail";
		}
		try {
			response.getWriter().write(returnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//**************getter、setter*******
	public CzHyxx getHyxx() {
		return hyxx;
	}

	public void setHyxx(CzHyxx hyxx) {
		this.hyxx = hyxx;
	}

	public String getHyId() {
		return hyId;
	}

	public void setHyId(String hyId) {
		this.hyId = hyId;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public String getFenlei() {
		return fenlei;
	}

	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}

	public String getSpwyId() {
		return spwyId;
	}

	public void setSpwyId(String spwyId) {
		this.spwyId = spwyId;
	}

	public ZcczWfBS getZcczWfBSImpl() {
		return zcczWfBSImpl;
	}

	public void setZcczWfBSImpl(ZcczWfBS zcczWfBSImpl) {
		this.zcczWfBSImpl = zcczWfBSImpl;
	}
	
	public String sendToDoWysp(){
		PTUserBO currentUser = null;
		IUser user = UserThreadLocal.get();
		currentUser = userUCC.getSingleById(user.getUserTid());
		try{
			dealToDoUCC.sendToDoWysp(hyId, currentUser);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 选主持人的时候设置主持人相关信息（主持人id、主持人姓名、主持人部门id、主持人部门名称）
	 * @return
	 */
	public String setZcrInfo(){
		try{
			response.setCharacterEncoding("UTF-8");
			CzHyxx hy = dealToDoUCC.setZcrInfo(hyxx.getId(), hyxx.getSpzcr());
			if(hyxx != null){
				response.getWriter().print(BodyListToJSON.bodyToJSON(hy, this.getJsonConfig(), false));
			}else{
				response.getWriter().println("ERROR");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//是否说有的审批委员都已经提交意见
	public String isAllSpwySubmit(){
		try{
			String jsonStr = dealToDoUCC.isAllSpwySubmit(hyId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonStr.trim());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String saveSpsj(){
		try{
			dealToDoUCC.saveSpsj(hyxx.getId(),hyxx.getSpsj());
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
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
	
	public String sortOrder(){
		
		String aaap[]=request.getParameterValues("purchase_list[]");
		
		for(int i=1;i<aaap.length;i++){
			String strid=aaap[i];
			String sortid=String.valueOf(i);
			dealToDoUCC.setOrder(strid,sortid);
		}
		return null;
	}
	
	/**
	 * 生成备案汇总正文
	 * @return
	 */
	public String getZhenWen(){
		try{
			String returnStr = dealToDoUCC.generatorZhenwen(hyxx.getId(),hyxx.getHylx());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr);
		}catch(Exception e){
			e.printStackTrace();
			if(log.isDebugEnabled())
				log.debug(e.getStackTrace());
		}
		return null;
	}
	
	public CzXmxxLsb getCzxmxx() {
		return czxmxx;
	}
	public void setCzxmxx(CzXmxxLsb czxmxx) {
		this.czxmxx = czxmxx;
	}
	public Log getLog() {
		return log;
	}
	public void setLog(Log log) {
		this.log = log;
	}
	public IDeptUCC getDeptUCC() {
		return deptUCC;
	}
	public void setDeptUCC(IDeptUCC deptUCC) {
		this.deptUCC = deptUCC;
	}
	public IDealToDoUCC getDealToDoUCC() {
		return dealToDoUCC;
	}
	public void setDealToDoUCC(IDealToDoUCC dealToDoUCC) {
		this.dealToDoUCC = dealToDoUCC;
	}
	public ICodeGenerator getCodeGenerator() {
		return codeGenerator;
	}
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}
	public GetsubjectService getGs() {
		return gs;
	}
	public void setGs(GetsubjectService gs) {
		this.gs = gs;
	}
	public IUserUCC getUserUCC() {
		return userUCC;
	}
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}
	public IAttachHandleUCC getAttachHandleUcc() {
		return attachHandleUcc;
	}
	public void setAttachHandleUcc(IAttachHandleUCC attachHandleUcc) {
		this.attachHandleUcc = attachHandleUcc;
	}
	public WorkflowUtil getWorkflowutil() {
		return workflowutil;
	}	
	
	
	
}
