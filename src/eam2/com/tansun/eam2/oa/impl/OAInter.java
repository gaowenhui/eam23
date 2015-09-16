package com.tansun.eam2.oa.impl;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.jbpm.api.history.HistoryProcessInstance;
import org.jbpm.api.task.Task;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.oa.IOAInter;
import com.tansun.eam2.oa.en.BlyjEntity;
import com.tansun.eam2.oa.en.EamResult;
import com.tansun.eam2.oa.ucc.CommonEam2OAUcc;
import com.tansun.eam2.stgl.service.IEntityFormService;
import com.tansun.eam2.stgl.service.impl.EntityFormServiceImpl;
import com.tansun.eam2.zyzc.service.impl.TokenServiceImpl;
import com.tansun.eam2.zyzc.vo.ZyzcToken;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.service.IAccordingService;
import com.tansun.rdp4j.common.util.service.impl.AccordingServiceImpl;
import com.tansun.rdp4j.common.web.vo.DeptVO;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.generalapps.user.service.impl.UserBSimpl;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * EAM给OA调用的接口
 * @author Baitin.Fong
 *
 */
public class OAInter implements IOAInter {
	
    String prefix;
//    private String jic_url = "http://how.jic.cn";
//    private String webseal_url = "http://webseal.jic.cn";
    String url;
    public IAccordingService getIAccordingService(){
    	return (IAccordingService) SpringContextHelper.getBean(AccordingServiceImpl.class);
    }

    public IEntityFormService getIEntityFormService(){
    	return (IEntityFormService) SpringContextHelper.getBean(EntityFormServiceImpl.class);
    }

    public UserBSimpl getUserBSimpl(){
    	return (UserBSimpl) SpringContextHelper.getBean(UserBSimpl.class);
    }

    public DeptBSimpl getDeptBSimpl(){
    	return (DeptBSimpl) SpringContextHelper.getBean(DeptBSimpl.class);
    }

    public WorkflowBS getWorkflowBS(){
    	return (WorkflowBS) SpringContextHelper.getBean(WorkflowBS.class);
    }
    
	public PTEndBS getEndbs() {
		return (PTEndBS) SpringContextHelper.getBean(PTEndBS.class);
	}

	public CommonEam2OAUcc getCommonEam2OAUcc() {
		return (CommonEam2OAUcc) SpringContextHelper.getBean(CommonEam2OAUcc.class);
	}

	/**
	 * 获得EAM系统的办理依据
	 * @param userid
	 * @param labname
	 * @param beginnum
	 * @param endnum
	 * @param keyword
	 * @param docstatus
	 * @return
	 */
	public String getEAMBLYJ(String userid, String labname, String beginnum,
			String endnum, String keyword, String docstatus) {
		IUser user = getUserBSimpl().getUserByUserName(userid);
        Long usertid = new Long(-1);
        if(user != null){
            usertid = user.getUserTid();
            System.out.println("模块名"+labname);
            System.out.println("调用人用户名"+userid);
            System.out.println("调用人TID"+usertid);
        }
        // 查询的办结信息
        List<PTEnd> list = getEndbs().findPagedEndsBy(usertid, null, 0, Integer.MAX_VALUE, keyword, null);
        StringBuilder sb = new StringBuilder("");
        if(list != null){
            for(int i = 0; i < list.size(); i++){
                PTEnd end = list.get(i);
                BlyjEntity obj = new BlyjEntity();
                obj.setRecid(end.getProcInstId());
                obj.setTitle(end.getTitle());
                obj.setNgr(end.getUserId().toString());
                obj.setNgrq(DateUtils.formatDate(end.getDraftDate()));
                obj.setTotalnum(list.size());
                obj.setUrl(getOAUrl(end)) ;
                obj.setSource("EAM");
                sb.append(obj.toString());
                if(i < list.size() - 1)
                    sb.append("######");
            }
            System.out.println("发送OA办结信息条数"+ list.size());
        }
        // 查询的传阅信息
        List<PTEnd> mesgList = getAccordingServiceImpl().findPTMessage(usertid,null, 0, Integer.MAX_VALUE, keyword, null);
        if(mesgList != null && mesgList.size() > 0){
        	sb.append("######");
            for(int i = 0; i < mesgList.size(); i++){
                PTEnd end = mesgList.get(i);
                BlyjEntity obj = new BlyjEntity();
                obj.setRecid(end.getProcInstId());
                obj.setTitle(end.getTitle());
                obj.setNgr(end.getUserId().toString());
                obj.setNgrq(DateUtils.formatDate(end.getDraftDate()));
                obj.setTotalnum(list.size());
                obj.setUrl(getOAUrl(end)) ;
                obj.setSource("EAM");
                sb.append(obj.toString());
                if(i < list.size() - 1)
                    sb.append("######");
            }
            System.out.println("发送OA传阅信息条数"+ mesgList.size());
        }
        System.out.println(sb.toString());
		return sb.toString();
	}

    private AccordingServiceImpl getAccordingServiceImpl() {
		return (AccordingServiceImpl) SpringContextHelper.getBean(AccordingServiceImpl.class);
	}
    private TokenServiceImpl getTokenServiceImpl() {
    	return (TokenServiceImpl) SpringContextHelper.getBean(TokenServiceImpl.class);
    }
    

	private String getUrl(PTEnd end){
//		String url = prefix + getSubSystem(end.getSubsystem());
//		String url = url;
//        try {
//            String urlPortal = URLEncoder.encode(end.getUrl() + "?headId=" + end.getHeadId(), "UTF-8");
//            url += "&urlPortal=" + urlPortal;
        	String urlPortal = end.getUrl() + "?headId=" + end.getHeadId();
            url += urlPortal;
//        } catch (UnsupportedEncodingException ex) {
//            Logger.getLogger(OAInter.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return url;
    }
	private String getOAUrl(PTEnd end){
//		String url = prefix + getSubSystem(end.getSubsystem());
//		String url = url;
//        try {
//            String urlPortal = URLEncoder.encode(end.getUrl() + "?headId=" + end.getHeadId(), "UTF-8");
//            url += "&urlPortal=" + urlPortal;
        	String urlPortal = end.getUrl() + "?id=" + end.getId();
        	try {
				urlPortal = "index.do?urlPortal=" + java.net.URLEncoder.encode(urlPortal.substring(5), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           // url += urlPortal;
//        } catch (UnsupportedEncodingException ex) {
//            Logger.getLogger(OAInter.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return urlPortal;
    }
    private String getSubSystem(String sub){
        String url = "";
        if(GlobalVariable.ASSET_FOR_USING.equals(sub)){
            url = GlobalVariable.INDEX_ASSET_FOR_USING;
        } else if (GlobalVariable.CARD_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_CARD_SUBSYSTEM;
        } else if (GlobalVariable.FIXED_ASSET_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_FIXED_ASSET_SUBSYSTEM;
        } else if (GlobalVariable.ENTITY_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_ENTITY_SUBSYSTEM;
        } else if (GlobalVariable.STOCK_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_STOCK_SUBSYSTEM;
        } else if (GlobalVariable.DEBT_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_DEBT_SUBSYSTEM;
        } else if (GlobalVariable.ASSET_DISPOSE_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_ASSET_DISPOSE_SUBSYSTEM;
        } else if (GlobalVariable.INVESTMENT_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_INVESTMENT_SUBSYSTEM;
        }
        return url;
    }

	/**
	 * 根据流程ID查询EAM系统的流程状态
	 * @param lcid Lcid为上一个接口调用时返回的标记符号
	 * @return
	 */
	public String queryEAMFlow(String lcid) {
		String state = "";
		String dqhj = "";
		String dqr = "0";
		// 查询流程的办结状态
		List<HistoryProcessInstance> list = getWorkflowBS().queryFlowInfo(lcid);
		for(int i = 0; i < list.size(); i++){
			HistoryProcessInstance hpi = list.get(i);
			state = hpi.getState();
		}
		// 当流程未办结时查看流程的状态 信息，办理人和当前流程
		if(state.equals(HistoryProcessInstance.STATE_ACTIVE)){
			List<Task> listTask = getWorkflowBS().queryFlowTaskInfo(lcid);
			for(int i = 0; i < listTask.size(); i++){
				Task hpi = listTask.get(i);
				dqhj = hpi.getActivityName();
				String userid = hpi.getAssignee();
				if(userid != null && !userid.equals("")){
					 dqr = getUserBSimpl().getUserBO(Long.parseLong(userid)).getUsername();
				}
			}
		}
		EamResult re = new EamResult();
		re.setStatus(EamResult.STATUS_CODE_OK);
		re.setErrorinfo(EamResult.ERRORINFO_NORMAL);
		re.setStatuinfo(state);
		if(state.equals(HistoryProcessInstance.STATE_ACTIVE)){
			re.setDqr(dqr);
			re.setDqhj(dqhj);
		}else if(state.equals(HistoryProcessInstance.STATE_ENDED)){
			re.setDqr("0");
			re.setDqhj("结束");
		}else{
			re.setDqr("0");
			re.setStatuinfo("0");
		}
		return re.toQueryEAMFlow();
	}

	/**
	 * 查询EAM系统中可以启动的所有流程
	 * 1.	持续经营咨询类实体法人代表变更
	 * 2.	实体用工计划
	 * 3.	持续经营咨询类实体确权
	 * @return String 流程ID，流程名称
	 */
	public String queryUsingEAMFlow(){
		String workflows = "pdid=stgl_quequan####pdname=持续经营咨询类实体确权"
			+ "######pdid=stgl_farendaibiao####pdname=持续经营咨询类实体法人代表变更"
			+ "######pdid=stgl_yonggongjihua####pdname=实体用工计划";
		return workflows;
	}
	
	/**
	 * 办结流程，（1月7日：未启动）
	 * 是否应用待定
	 * @param lcid Lcid为上一个接口调用时返回的标记符号
	 * @param lczt 流程最终状态,1办结 2 非正常结束
	 * @param ngyj 拟稿部门意见
	 * @param qfyj 签发意见,领导意见
	 * @param hqyj 会签意见
	 * @param hgyj 核稿意见
	 * @param jdyj 校对意见
	 * @param bz 备注
	 * @return
	 */
	public String finishEAMFlow(String lcid, String lczt, String ngyj, String qfyj, String hqyj,
			String hgyj, String jdyj, String bz) {
		EamResult re = new EamResult();
		re.setStatus(EamResult.STATUS_CODE_OK);
		re.setErrorinfo(EamResult.ERRORINFO_NORMAL);
		getCommonEam2OAUcc().finishCommonEam2OABS(lcid);
		return re.toFinishEAMFlow();
	}

	/**
	 * 启动EAM系统的一个流程（1月7日：未启动）
	 * @param OAmsgid 消息标识符号,由OA提供,EAM在流程办理过程及完毕以后,通过此符号来回写发送消息.
	 * @param ngr 拟稿人,中文名称
	 * @param ngbm 拟稿部门，中文名称
	 * @param ngrq 拟稿日期,格式yyyy-mm-dd
	 * @param title 标题
	 * @param flowname 要启动的具体流程。中文名称：实体法人变更，实体用工计划
	 * @param url 访问OA原始信息的URL
	 * @param bz 从OA发过来的备注意见信息，保存在业务单据的备注字段
	 * @param blyjTitle 办理依据的标题
	 * @param blyjWh 文号，传递过来作为办理依据的编号使用
	 * @param blyjNgr 办理依据的拟稿人
	 * @param blyjNgrq 办理依据的拟稿时间，格式YYYY-MM-DD
	 * @param blyjMkmc 办理依据的模块名称，暂定为“OA收文”
	 * @param blyjLcmc 办理依据的流程名称，由OA系统提供。例如“OA收文流程”
	 * @return
	 */
	public String startEAMFlow(String OAmsgid, String ngr, String ngbm,	String ngrq, String title, 
			String workflow, String urloa, String bz,	String blyj_title, String blyj_wh, 
			String blyj_ngr, String blyj_ngrq, String blyj_mkmc, String blyj_lcmc,
			// mzq add
			String sendUserName, String workflowid) {
		String workflowurl = "";
		String pkName = "";
		if(workflowid != null && !workflowid.equals("")){
			if(workflowid.equals("stgl_quequan")){
				workflowurl = "stglWorkflow/qqWorkflow_todo.do";
				pkName = "stgl_quequan";
			}else if(workflowid.equals("stgl_farendaibiao")){
				workflowurl = "stglWorkflow/frdbWorkflow_todo.do";
				pkName = "stgl_farendaibiao";
			}else if(workflowid.equals("stgl_yonggongjihua")){
				workflowurl = "stglWorkflow/ygjhWorkflow_todo.do";
				pkName = "stgl_yonggongjihua";
			}
		}else{
			// 没有流程内容的时候返回
			EamResult re = new EamResult();
			re.setStatus(EamResult.STATUS_CODE_ERROR);
			re.setErrorinfo(EamResult.ERRORINFO_ERROR);
			re.setLcid("");
			re.setUrl("");
			return re.toStartEAMFlow();
		}
	
		IUser user = getUserBSimpl().getUserByUserName(ngr);
		IUser senduser = getUserBSimpl().getUserByUserName(sendUserName);
		UserThreadLocal.set(user);
		
		StHead head = new StHead();
		head.setBiaoti(title);
		head.setNgbmmc(ngbm);
		Long ngbmbh = null;
		List<DeptVO> depts = user.getDeptList();
		if(ngbm != null && !ngbm.equals("")){
			ngbmbh = ((PTDeptBO)getDeptBSimpl().getDeptByName(ngbm)).getTid();
		}
		head.setNgbm(ngbmbh.toString());
		head.setNgr(user.getUserTidChar());
		head.setNgrxm(ngr);
		DateFormat format1 = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date date = new java.util.Date();
		try {
			date = format1.parse(ngrq);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		head.setNgrq(date);
		
		// 保存表单信息
		getIEntityFormService().saveEntityForm(head);
		
		CommonAccording cad = new CommonAccording();
		cad.setBdid(head.getId());
		cad.setBt(blyj_title);
		cad.setBh(blyj_wh);
		cad.setNgr(blyj_ngr);
		cad.setNgrq(date);
		cad.setLcmc(blyj_lcmc);
		// 保存办理依据信息
		getIAccordingService().insertAccording(cad);
		
		PTTodo todo = new PTTodo();
		todo.setTitle(title);
		todo.setHeadId(head.getId());
		todo.setDeptId(ngbmbh);
		todo.setUrl(workflowurl);
		todo.setUserId(senduser.getUserTid());
		todo.setProcInstName(pkName);
		todo.setDraftDate(date);
		todo.setSendUserId(user.getUserTid());
		todo.setSubsystem(GlobalVariable.ENTITY_SUBSYSTEM);
		PTTodo todo2 = getWorkflowBS().startLastVersionPIByPDName(pkName, todo, user.getUserTid());
		
		EamResult re = new EamResult();
		re.setStatus(EamResult.STATUS_CODE_OK);
		re.setErrorinfo(EamResult.ERRORINFO_NORMAL);
		re.setLcid(todo2.getProcInstId());
		re.setUrl(url+ "/eam2/" + todo.getUrl());
		return re.toStartEAMFlow();
	}

	/**
	 * 办结流程，（1月7日：未启动）
	 * 是否应用待定
	 * @param lcid
	 * @param lczt
	 * @param ngyj
	 * @param qfyj
	 * @param hqyj
	 * @param hgyj
	 * @param jdyj
	 * @param bz
	 * @return
	 */
   public String token(String command,  String tokenSN, String useUser,
			String loginname, String auth, String status, String expireDate){
        StringBuffer sb = new StringBuffer("");
        // 根据状态查询，在库；在用
        System.out.println("command=="+command);
        System.out.println("tokenSN=="+tokenSN);
        System.out.println("useUser=="+useUser);
        System.out.println("loginname=="+loginname);
        System.out.println("auth=="+auth);
        System.out.println("status=="+status);
        System.out.println("expireDate=="+expireDate);
        if("byStatus".equals(command)){
        	List<ZyzcToken> list = getTokenServiceImpl().queryToken(status, tokenSN, useUser);
        	for(int i = 0; i < list.size(); i++){
        		ZyzcToken zyzcToken = list.get(i);
        		sb.append(zyzcToken.toString());
                if(i < list.size() - 1)
                    sb.append("######");
        	}
        // 根据用户名称查询
        }else if("byUserName".equals(command)){
        	List<ZyzcToken> list = getTokenServiceImpl().queryToken(status, tokenSN, useUser);
        	for(int i = 0; i < list.size(); i++){
        		ZyzcToken zyzcToken = list.get(i);
        		sb.append(zyzcToken.toString());
                if(i < list.size() - 1)
                    sb.append("######");
        	}
        // 根据令牌ID查询
        }else if("byNo".equals(command)){
        	List<ZyzcToken> list = getTokenServiceImpl().queryToken(status, tokenSN, useUser);
        	for(int i = 0; i < list.size(); i++){
        		ZyzcToken zyzcToken = list.get(i);
        		sb.append(zyzcToken.toString());
                if(i < list.size() - 1)
                    sb.append("######");
        	}
        // 根据令牌ID更新使用人或者使用部门， 并且把状态改为再用
        }else if("updateByTokenId".equals(command)){
//        	ZyzcToken zyzcToken = new ZyzcToken();
        	System.out.println("tokenSN==" + tokenSN + ",useUser==" + useUser + ",loginname=="+ loginname + ",auth==" + auth + ",status==" + status + ",expireDate==" + expireDate);
        	boolean issuccess = getTokenServiceImpl().updateToken(
        			tokenSN, useUser, loginname, auth, status, expireDate);
        	System.out.println("issuccess==" + issuccess);
        	if(issuccess){
        		sb.append("status=0");
        	}else{
        		sb.append("status=ERROR");
        	}
            //根据令牌id更多新使用部门及使用人，并把状态改为在用。
            //如果userid与depetid,未输入，即把状态改为在库，即归还令牌。
        }else{
        	sb.append("未识别命令!");
        }
        System.out.println("oa------>"+sb.toString());
        return sb.toString();
    }
    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }
}
