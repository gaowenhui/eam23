package com.tansun.eam2.common.web.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.StrutsStatics;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.common.web.components.OpinionPartComponent;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class OpinionInterceptor extends AbstractInterceptor {
	
	private static final long serialVersionUID = -7500989944073433089L;
	private static final String BACK_OPERATION = "BACK_OPERATION";
	private static final String BACK_OPERATION_IDS = "BACK_OPERATION_IDS";
	private final static String RADIO = "Radio";
	private final static String OPINION_HAS_SAVE = "OPINION_HAS_SAVE";
	private HttpServletRequest request;
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		 request = (HttpServletRequest) ai.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		String hasSave = "N";
		hasSave = request.getParameter(OPINION_HAS_SAVE);
		String taskid = request.getParameter("taskId");
		String attrHasSave = (String)request.getAttribute(OPINION_HAS_SAVE);
		if(attrHasSave != null && attrHasSave.length() > 0 && "Y".equals(attrHasSave)){
			return ai.invoke();
		}
		if(hasSave != null && hasSave.length() > 0 && "N".equals(hasSave)){
			String backOperation = request.getParameter(BACK_OPERATION);
			String backOperationIds = request.getParameter(BACK_OPERATION_IDS);
			String account = request.getParameter(OpinionPartComponent.ACCOUNT_DEPT);
			String agent = request.getParameter(OpinionPartComponent.AGENT_DEPT);
			String checkDept = request.getParameter(OpinionPartComponent.CHECK_DEPT);
			String draft = request.getParameter(OpinionPartComponent.DRAFT_DEPT);
			String erp = request.getParameter(OpinionPartComponent.ERP_RESULT);
			String handle = request.getParameter(OpinionPartComponent.HANDLE_DEPT);
			String leader = request.getParameter(OpinionPartComponent.LEADER);
			String meeting = request.getParameter(OpinionPartComponent.MEETING);
			String meetingDept = request.getParameter(OpinionPartComponent.MEETING_DEPT);
			String operation = request.getParameter(OpinionPartComponent.OPERATION_GROUP);
			String work = request.getParameter(OpinionPartComponent.WORK_DEPT);
			String workManage = request.getParameter(OpinionPartComponent.WORK_MANAGE_DEPT);
			String agentManage = request.getParameter(OpinionPartComponent.AGENT_MANAGE_DEPT);
			String compere = request.getParameter(OpinionPartComponent.COMPERE);
			String secratary = request.getParameter(OpinionPartComponent.SECRATARY);
			String summary_suggest = request.getParameter(OpinionPartComponent.SUMMARY_SUGGEST);
			String approvement = request.getParameter(OpinionPartComponent.APPROVEMENT);
			String check = request.getParameter(OpinionPartComponent.CHECK);
			String hqzz = request.getParameter(OpinionPartComponent.HQZZ);
			String hqth = request.getParameter(OpinionPartComponent.HQTH);
			String deptLeader = request.getParameter(OpinionPartComponent.DEPT_LEADER);
			String checkDeptModify = request.getParameter(OpinionPartComponent.CHECK_DEPT_MODIFY);
			String agentMeetingDept = request.getParameter(OpinionPartComponent.AGENT_MEETING_DEPT);
			String blyjZzyjDept = request.getParameter(OpinionPartComponent.BLYJ_ZZYJ);
			String blyjGcyjDept = request.getParameter(OpinionPartComponent.BLYJ_GCYJ);
			String blyjThyjDept = request.getParameter(OpinionPartComponent.BLYJ_THYJ);
			String remark = request.getParameter(OpinionPartComponent.REMARK);
            String result = request.getParameter("result");
            Integer yjlx = new Integer(CommonGlobal.OPINION_YJLX_AGREE);
            if(result != null){
                if(result.equals(WorkflowAction.TO_SAVEDRAFT) || result.equals(WorkflowAction.TO_SAVE_TODO) || result.equals(WorkflowAction.TO_CIRCULATION)){
                   yjlx = new Integer(CommonGlobal.OPINION_YJLX_SAVE);
                }
            }
            if(remark != null && remark.length() > 0){
            	Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_REMARK);
            	savePTCommonOpinionBO(getHeadId(), yjlx, remark, yjylx, taskid, backOperationIds );
            	hasSave = "Y";
            }
            if(blyjThyjDept != null && blyjThyjDept.length() > 0){
            	Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_THYJ);
            	savePTCommonOpinionBO(getHeadId(), yjlx, blyjThyjDept, yjylx, taskid, backOperationIds );
            	hasSave = "Y";
            }
            if(blyjGcyjDept != null && blyjGcyjDept.length() > 0){
            	Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_GCYJ);
            	savePTCommonOpinionBO(getHeadId(), yjlx, blyjGcyjDept, yjylx, taskid, backOperationIds );
            	hasSave = "Y";
            }
            if(blyjZzyjDept != null && blyjZzyjDept.length() > 0){
            	Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_ZZYJ);
            	savePTCommonOpinionBO(getHeadId(), yjlx, blyjZzyjDept, yjylx, taskid, backOperationIds );
            	hasSave = "Y";
            }
            if(agentMeetingDept != null && agentMeetingDept.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_AGENT_MEETING_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, agentMeetingDept, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(hqth != null && hqth.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_HQTH);
				savePTCommonOpinionBO(getHeadId(), yjlx, hqth, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(checkDeptModify != null && checkDeptModify.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY);
				savePTCommonOpinionBO(getHeadId(), yjlx, checkDeptModify, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(deptLeader != null && deptLeader.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_DEPT_LEADER);
				savePTCommonOpinionBO(getHeadId(), yjlx, deptLeader, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(hqzz != null && hqzz.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_HQZZ);
				savePTCommonOpinionBO(getHeadId(), yjlx, hqzz, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(check != null && check.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_CHECK);
				savePTCommonOpinionBO(getHeadId(), yjlx, check, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(approvement != null && approvement.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_APPROVEMENT);
				savePTCommonOpinionBO(getHeadId(), yjlx, approvement, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(summary_suggest != null && summary_suggest.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST);
				savePTCommonOpinionBO(getHeadId(), yjlx, summary_suggest, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(secratary != null && secratary.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_SECRATARY);
				savePTCommonOpinionBO(getHeadId(), yjlx, secratary, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(compere != null && compere.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_COMPERE);
				savePTCommonOpinionBO(getHeadId(), yjlx, compere, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(agentManage != null && agentManage.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_AGENT_MANAGE_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, agentManage, yjylx, taskid, backOperationIds );
				hasSave = "Y";
			}
			if(workManage != null && workManage.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_WORK_MANAGE_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, workManage, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(work != null && work.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_WORK_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, work, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(operation != null && operation.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_OPERATION_GROUP);
				savePTCommonOpinionBO(getHeadId(), yjlx, operation, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(meetingDept != null && meetingDept.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_MEETING_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, meetingDept, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(meeting != null && meeting.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_MEETING);
				savePTCommonOpinionBO(getHeadId(), yjlx, meeting, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(leader != null && leader.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_LEADER);
				savePTCommonOpinionBO(getHeadId(), yjlx, leader, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(handle != null && handle.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_HANDLE_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, handle, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(erp != null && erp.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_ERP_RESULT);
				savePTCommonOpinionBO(getHeadId(), yjlx, erp, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(account != null && account.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_ACCOUNT_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, account, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(agent != null && agent.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_AGENT_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, agent, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(checkDept != null && checkDept.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, checkDept, yjylx, taskid, backOperationIds);
				hasSave = "Y";
			}
			if(draft != null && draft.length() > 0){
				Integer yjylx = new Integer(CommonGlobal.OPINION_YJYLX_DRAFT_DEPT);
				savePTCommonOpinionBO(getHeadId(), yjlx, draft, yjylx, taskid, backOperationIds);
				hasSave = "Y";
				
			}
			if(backOperation != null && BACK_OPERATION.equals(backOperation)){
				updatePTCommaonOpnionBO(taskid);
			}
			request.setAttribute(OPINION_HAS_SAVE, hasSave);
		}
		return ai.invoke();
	}
	
	private String getHeadId(){
		return request.getParameter("biaodanid");
	}
	
	public PTTodoBS getPTTodoBS(){
		return (PTTodoBS)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean(PTTodoBS.class);
	}
	
	public PTDidBS getPTDidBS(){
		return (PTDidBS)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean(PTDidBS.class);
	}
	
	private Long getDeptId(String taskid){
        if(taskid == null || taskid.length() == 0){
            return UserThreadLocal.get().getDeptList().get(0).getTid();
        }
        PTTodoBS obj = getPTTodoBS();
		PTTodo todo = obj.findPTTodoByTaskId(taskid);
		Long deptname = null;
		if(todo == null){
			PTDidBS didbs = getPTDidBS();
			PTDid did = didbs.findPTDidByTaskId(taskid);
			deptname = did.getDeptId();
		}else{
			deptname = todo.getDeptId();
		}
		return deptname;
	}
	
	private void updatePTCommaonOpnionBO(String taskid){
		getCommonOpinionUcc().updateOpinionByTaskId(taskid);
	}
	
	private void savePTCommonOpinionBO(String bdid, Integer yjlx, String yjnr, Integer yjylx, String taskid, String backOperationIds){
		PTCommonOpinionBO pt = getCommonOpinionUcc().getOpinionByTaskId(taskid, yjylx);
		pt.setBdid(bdid);
		pt.setTaskId(taskid);
		pt.setYjbm(getDeptId(taskid));
		pt.setTjr(UserThreadLocal.get().getUserTidChar());
		if(CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST == yjylx.byteValue() 
//				&& StringUtils.equals(UserThreadLocal.get().getUserTidChar(),"15405")){
				&& StringUtils.equals(UserThreadLocal.get().getUserTidChar(),"15208")){
			pt.setYjlx((int)CommonGlobal.OPINION_YJLX_SAVE);
			
		}else if(CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST == yjylx.byteValue() 
//					&& StringUtils.equals(UserThreadLocal.get().getUserTidChar(),"15367")){
				    && StringUtils.equals(UserThreadLocal.get().getUserTidChar(),"166434")){
				pt.setYjlx((int)CommonGlobal.OPINION_YJLX_SAVE);
		}else{
			pt.setYjlx(yjlx);
		}
		pt.setYjnr(yjnr);
		pt.setTjrq(new Date());
		pt.setYjylx(yjylx);
		if(backOperationIds != null && backOperationIds.length() > 0){
			getCommonOpinionUcc().deleteOpinionById(backOperationIds);
		}
		
		PTTodo todo = getPTTodoByTaskId(taskid);
		if(todo != null)
			pt.setTaskName(todo.getTaskName());
		getCommonOpinionUcc().saveOrUpdateOpinion(pt);
	}
	
	private PTTodo getPTTodoByTaskId(String taskId){
		return getPTTodoBS().findPTTodoByTaskId(taskId);
	}
	
	public ICommonOpinionUcc getCommonOpinionUcc() {
		return (ICommonOpinionUcc)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("commonOpinionUcc");
	}
}
