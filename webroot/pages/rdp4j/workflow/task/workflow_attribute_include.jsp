<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%
boolean isInWorkflow = true;
WorkflowVO workflowVO = (WorkflowVO)request.getAttribute("workflowVO");
if(workflowVO==null){
	isInWorkflow = false;
	workflowVO = new WorkflowVO();
}
PTDraft draft = (PTDraft)request.getAttribute("draft");
boolean chuanyueBtnDisplay = true;
if(draft==null){
	draft = new PTDraft();
	if(workflowVO.step.equals("draft")){
		chuanyueBtnDisplay = false;
	}
}
String id = (String)request.getAttribute("id");
String actionSpaceName = "workflow";
String actionPath = "workflow";
String commitMethod = "completeTask";
String participationMethod = "getParticipationList";
String abandonMethod = "abandonPi";
String endMethod = "endPi";
String commitDraftMethod = "draftCommit";
String draftParticipationMethod = "getDraftParticipationList";

String participationUrl = "";
String commitUrl = "";
String abandonUrl = "";
String endUrl = "";
String commitDraftUrl = "";
String saveDraftUrl = "";
boolean commitBtnDisplay = true;
boolean saveBtnDisplay = true;
boolean counterSignBtnDisplay = false;
boolean pgscCounterSignBtnDisplay = false;
%>
<%@ include file="/pages/rdp4j/workflow/task/counterSign_attribute_include.jsp"%>
	<script type="text/javascript">
	var huiqianmenuStr = 	'<div id="mmhqhq" style="width:150px;">' + 
								'<div onClick="mainWindow.choiceDept()">开启会签</div>' + 
								'<div onClick="mainWindow.selectMeeting()">会签查询</div>' +
							'</div>' ;

	var huiqianButtonStr = '[{"buttonIcon":"icon-ok","buttonText":"会签","buttonMenuId":"mmhqhq"}]';
	</script>
<%
	List<PTCommonOpinionBO> opinionList = (List<PTCommonOpinionBO>)request.getAttribute("opinionList");
	if(opinionList!=null&&opinionList.size()>0){
		for(PTCommonOpinionBO opinion : opinionList ){
			if(opinion.getTaskName().equals("公司领导批示")){
				workflowVO.getOutComes().remove("承办部门综合处理");
			}
			if(opinion.getTaskName().equals("承办部门负责人审批")){
				workflowVO.getOutComes().remove("业务运营组处理");
			}
		}
	}
%>