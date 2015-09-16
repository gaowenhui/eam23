<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*"%>	
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.model.*"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%@ page import="com.tansun.rdp4j.workflow.task.action.*" %>
<%@ page language="java" import="java.text.*"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String headId = request.getAttribute("head.id").toString();
	boolean isTitleShow = Boolean.parseBoolean(
			request.getParameter("isTitleShow")==null?
					"true":request.getParameter("isTitleShow"));
	Date date = new Date();
    String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template"); 
    boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);				
	boolean ishistory = false;
	ishistory = "true".equals((String)request.getAttribute("ishistory"))?true:false;
	String userTid = (String) request.getAttribute("userTid");
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/dealEval/chuzhi_pinggu.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%
boolean isInWorkflow = true;
WorkflowVO workflowVO = (WorkflowVO)request.getAttribute("workflowVO");
if(workflowVO==null){
	isInWorkflow = false;
	workflowVO = new WorkflowVO();
}
PTDraft draft = (PTDraft)request.getAttribute("draft");
if(draft==null){
	draft = new PTDraft();
}

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
boolean saveBtnDisplay = true;
boolean counterSignBtnDisplay = false;
boolean pgscCounterSignBtnDisplay = false;
%>
<!-- ===================================办理单属性===================================== -->
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String isDid = (String)request.getAttribute("isDid");
	PTDeptBO dept = (PTDeptBO)request.getAttribute("dept");
	String taskId = (String)request.getAttribute("taskId");
	String taskName = (String)request.getAttribute("taskName");
	String assignName = (String)request.getAttribute("assignName");
	List participantVOList = (List)request.getAttribute("participantVOList");
	ETCounterSignBO counterSign = (ETCounterSignBO)request.getAttribute("counterSign");
	boolean isInCounterSign = false;
	if(counterSign!=null) isInCounterSign=true;
	ETCounterSignParticipantBO assignParticipant = (ETCounterSignParticipantBO)request.getAttribute("assignParticipant");
	List gcOpinionVOList = (List)request.getAttribute("gcOpinionVOList");
	if(gcOpinionVOList==null){
		gcOpinionVOList=new ArrayList();
	}
	List snedBackCommonOpinionVOList = (List)request.getAttribute("snedBackCommonOpinionVOList");
	if(snedBackCommonOpinionVOList==null){
		snedBackCommonOpinionVOList=new ArrayList();
	}
	List finalCommonOpinionVOList = (List)request.getAttribute("finalCommonOpinionVOList");
	if(finalCommonOpinionVOList==null){
		finalCommonOpinionVOList=new ArrayList();
	}
	String userType = "JBR";
	List<PTRoleBO> roleList = new ArrayList<PTRoleBO>();
	if(isInCounterSign) roleList = assignParticipant.getRoleList();
	for(PTRoleBO role:roleList){
		if(role.getTid()==(long)107){
			userType = "ZH";
			break;
		}
		if(role.getTid()==(long)96){
			userType = "BMLD";
			break;
		}
		if(role.getTid()==(long)125){
			userType = "JBR";
			break;
		}
	}
%>
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		pgscCounterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>处置评估审查</title>
<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "dealEvalHeadWorkflow";
			actionPath = "dealEvalHeadWorkflow";
		%>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
<script>
	function choiceDept(){
		if(confirm('确定要增加会签吗？')){
			var hqbmids = ""; 
			if('getCallBack4Tree' in window){
				hqbmids = document.getElementById("hqbmids").value;
			} else if ('getCallBack4Tree1' in window){
				hqbmids = document.getElementById("hqbmids1").value;
			}
			var bizPiId = document.getElementById("piId").value;
			var counterSignTitle = document.getElementById("counterSignTitle").value;
			var taskId = document.getElementById("taskId").value;
			var counterSignUrl = document.getElementById("counterSignUrl").value;
			var headId = document.getElementById("headId").value;
			var result = window.showModalDialog("<%=request.getContextPath()%>/countersign/startcountersign_init.do?bizPiId="+bizPiId+"&hqbmids="+hqbmids,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
			if(typeof(result)!='undefined'){
				document.<%=formName%>.dept_user.value = result;
				document.<%=formName%>.pdk.value = "countersign";
				$.post("<%=request.getContextPath()%>/countersign/startcountersign_start.do",{
							"dept_user" 		: result,
							"pdk" 				: "countersign",
							"bizPiId" 			: bizPiId,
							"counterSignTitle" 	: counterSignTitle,
							"taskId" 			: taskId,
							"counterSignUrl"	: counterSignUrl,
							"headId"			: headId
						},function(data){	
							if(data.length > 0 && data != "_"){
								var dept = data.split("_");
								var deptids = dept[0];
								var deptnames = dept[1];
								if('getCallBack4Tree' in window){
									getCallBack4Tree(deptids, deptnames);
								} else if ('getCallBack4Tree1' in window){
									getCallBack4Tree1(deptids, deptnames);
								}
								counterSaveTodo();
							}
						});
			}
		}
	}
	
	function selectMeeting(){
		var headId = document.getElementById("headId").value;
		window.open("<%=request.getContextPath()%>/countersign/startcountersign_query2.do?headId="+headId,
				"","scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
	}
	
	function commit(taskId,outCome){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('commitWorkflow' in window){
			if(commitWorkflow instanceof Function){
				if(!commitWorkflow(taskId,outCome)){
					return;
				}
			}
		}
		if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2(taskId,outCome);
                if(!result) return;
            }
        }
		if(outCome=="作废"){
			if(confirm('确定要作废处理单吗？')){
				document.<%=formName%>.action = document.getElementById("abandonUrl").value;
				document.<%=formName%>.url.value = document.getElementById("abandonViewUrl").value;
				document.<%=formName%>.taskId.value = taskId;
				document.<%=formName%>.outCome.value = outCome;
				if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
		            if(beforeWorkFlowSubmit instanceof Function){
		                var result = beforeWorkFlowSubmit(taskId,outCome);
		                if(!result) return;
		            }
	        	}
				document.<%=formName%>.submit();
				return;
			}
			return;
		}
		if(outCome=="流程办结"||
		   outCome=="结束"||
		   outCome=="生成台账结束"||
		   outCome=="不生成台账结束"||
		   outCome=="提交意见触发会议纪要整理"||
		   outCome=="整理会议纪要结束"
		){
			if(confirm('确定要办结处理单吗？')){
				document.<%=formName%>.action = document.getElementById("endUrl").value;
				document.<%=formName%>.url.value = document.getElementById("endViewUrl").value;
				document.<%=formName%>.taskId.value = taskId;
				document.<%=formName%>.sheetId.value = document.getElementById("bianhao").value;
				document.<%=formName%>.outCome.value = outCome;
				if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
		            if(beforeWorkFlowSubmit instanceof Function){
		                var result = beforeWorkFlowSubmit(taskId,outCome);
		                if(!result) return;
		            }
	        	}
				document.<%=formName%>.submit();
				return;
			}
			return;
		}
		var nowTaskName = "<%=workflowVO.taskName%>";
		var urlpush = encodeURI(document.getElementById("participationUrl").value+"?taskId="+taskId+"&outCome="+outCome+"&multiple=false&taskName="+nowTaskName);
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_COMPLETETASK%>';
			document.<%=formName%>.action = document.getElementById("commitUrl").value;
			document.<%=formName%>.nextTodoUrl.value = document.getElementById("commitNextTodoUrl").value;
			document.<%=formName%>.didUrl.value = document.getElementById("commitDidUrl").value;
			document.<%=formName%>.taskId.value = taskId;
			document.<%=formName%>.outCome.value = outCome;
			document.<%=formName%>.assignId.value = result;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit(taskId,outCome);
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function changeNgbmmc(){
		var dept = document.getElementById("ngbm");
   	 	var i =document.getElementById("ngbm").selectedIndex;
   	 	document.getElementById("ngbmmc").value =dept.options[i].text;
	}
	function commitDraft(processDefinitionKey,outCome){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2(processDefinitionKey,outCome);
                if(!result) return;
            }
        }
		var urlpush = encodeURI(document.getElementById("draftParticipationUrl").value+"?pdk="+processDefinitionKey+"&outCome="+outCome+"&multiple=false");
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.action = document.getElementById("commitDraftUrl").value;
			document.<%=formName%>.outCome.value = outCome;
			document.<%=formName%>.assignId.value = result;
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_DRAFTCOMMIT%>';
			document.<%=formName%>.url.value = document.getElementById("draftCommitUrl").value;
			document.<%=formName%>.todoUrl.value = document.getElementById("draftCommitTodoUrl").value;
			document.<%=formName%>.nextTodoUrl.value = document.getElementById("draftCommitNextTodoUrl").value;
			document.<%=formName%>.didUrl.value = document.getElementById("commitDidUrl").value;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit(processDefinitionKey,outCome);
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	
	function checkEAMFormTitle(){
		var biaoti = document.getElementById("biaoti");
		if(biaoti.value == null || biaoti.value.trim().length == 0){
		alert("标题不能为空！");
		biaoti.focus();
	      return false;
	    }
	    return true;
	} 
	
	function saveDraft(){
		var biaoti = document.getElementById("biaoti");
		if(biaoti.value == null || biaoti.value.trim().length == 0){
			alert("标题不能为空！");
			biaoti.focus();
			return false;
		}
		if(confirm('确定要保存吗？')){
			checkEAMFormTitle();
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_SAVEDRAFT%>';
			document.<%=formName%>.url.value = document.getElementById("draftCommitUrl").value;
			document.<%=formName%>.action = encodeURI(document.getElementById("saveDraftUrl").value);
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveDraft","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	
	function saveTodo(){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2("saveTodo","");
                if(!result) return;
            }
        }
		if(confirm('确定要保存吗？')){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_SAVE_TODO%>';
			document.<%=formName%>.action = encodeURI(document.getElementById("saveTodoUrl").value);
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveTodo","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	
	function counterSaveTodo(){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2("saveTodo","");
                if(!result) return;
            }
        }
		document.<%=formName%>.result.value = '<%=WorkflowAction.TO_SAVE_TODO%>';
		document.<%=formName%>.action = encodeURI(document.getElementById("saveTodoUrl").value);
		if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
            if(beforeWorkFlowSubmit instanceof Function){
                var result = beforeWorkFlowSubmit("saveTodo","");
                if(!result) return;
            }
       	}
		document.<%=formName%>.submit();
	}
	function circulation(){
		var urlpush = encodeURI(document.getElementById("circulationParticipation").value);
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_CIRCULATION%>';
			document.<%=formName%>.action = document.getElementById("commitUrl").value;
			document.<%=formName%>.url.value = document.getElementById("circulationUrl").value;
			document.<%=formName%>.param.value = document.getElementById("circulationparam").value;
			document.<%=formName%>.assignId.value = result;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("circulation","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function backto(){
		if(confirm('确定要收回任务吗？')){
			var taskId = document.<%=formName%>.taskId.value;
			var result = window.showModalDialog("<%=request.getContextPath()%>/workflow/workflow_backto.do?taskId="+taskId+"&BACK_OPERATION=BACK_OPERATION","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:300px;dialogHeight:150px;center:yes");
			if(typeof(result)!='undefined'){
				document.<%=formName%>.action = "<%=request.getContextPath()%>/workflow/userTask_findMyTodo.do";
				document.<%=formName%>.submit();
			}
		}
	}
<%
if(isInCounterSign){
%>
	function counterSignUserList(){
		window.showModalDialog("<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_findCSPartUserList.do?taskId=<%=taskId%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
	}
	function choiceUser(){
		var result = window.showModalDialog("<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_getParticipants.do?counterSignId=<%=counterSign.getTid()%>&deptId=<%=dept.getTid()%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.users.value = result;
			document.<%=formName%>.pdName.value = "pgscCountersign";
			document.<%=formName%>.outCome.value = "加签";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.nextTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.<%=formName%>.newParticipantTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_addCounterSignParticipants.do";
			document.<%=formName%>.submit();
		}
	}
	function commitZHGCContent(){
		if(document.<%=formName%>.content.value==''){
			//document.<%=formName%>.content.focus();
			alert('请填写过程意见！');
			return;
		}
		if(confirm("确定要提交过程意见？")){
			if(!updateJlxz("0")){
				alert("更新意见类型失败，请联系管理员！");
				return false;
			}
			$("textarea[name='finalContent']").val("");
			$("textarea[name='sendBackContent']").val("");
			document.<%=formName%>.outCome.value = "综合过程意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.nextTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitZHGCContent.do";
			document.<%=formName%>.submit();
		}
	}
	function commitLDGCContent(){
		if(document.<%=formName%>.content.value==''){
			//document.<%=formName%>.content.focus();
			alert('请填写过程意见！');
			return;
		}
		if(confirm("确定要提交过程意见？")){
			$("textarea[name='finalContent']").val("");
			$("textarea[name='sendBackContent']").val("");	
			if(!updateJlxz("0")){
				alert("更新意见类型失败，请联系管理员！");
				return false;
			}
			document.<%=formName%>.outCome.value = "领导过程意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.nextTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitLDGCContent.do";
			document.<%=formName%>.submit();
		}
	}
	function commitJBGCContent(){
		if(document.<%=formName%>.content.value==''){
			//document.<%=formName%>.content.focus();
			alert('请填写过程意见！');
			return;
		}
		if(confirm("确定要提交过程意见？")){
			$("textarea[name='finalContent']").val("");
			$("textarea[name='sendBackContent']").val("");	
			if(!updateJlxz("0")){
				alert("更新意见类型失败，请联系管理员！");
				return false;
			}
			document.<%=formName%>.outCome.value = "经办过程意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitJBGCContent.do";
			document.<%=formName%>.submit();
		}
	}
	//提交退回意见 部门领导
	function commitBMLDSendBackContent(){
		if(document.<%=formName%>.sendBackContent.value==''){
			//document.<%=formName%>.sendBackContent.focus();
			alert('请填写退回意见！');
			return;
		}
		if(confirm("确定要提交退回意见？")){
			$("textarea[name='finalContent']").val("");
			$("textarea[name='content']").val("");		
			$("textarea[name='finalContent']").val("");
			$("textarea[name='content']").val("");		
			if(!updateJlxz("2")){
				alert("更新意见类型失败，请联系管理员！");
				return false;
			}
			document.<%=formName%>.outCome.value = "退回";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQTH%>";
			document.<%=formName%>.contentType.value = "<%=CommonGlobal.OPINION_YJLX_BACK%>";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitBMLDSendBackContent.do?blbm=<%=dept.getTid()%>";
			copyFile2FormNew();
			document.<%=formName%>.submit();
		}
	}
	
	// 提交退回意见 综合处理人
	function commitZHSendBackContent(){
		if(document.<%=formName%>.sendBackContent.value==''){
			//document.<%=formName%>.sendBackContent.focus();
			alert('请填写退回意见！');
			return;
		}
		if(confirm("确定要提交退回意见？")){
			$("textarea[name='finalContent']").val("");
			$("textarea[name='content']").val("");		
			$("textarea[name='finalContent']").val("");
			$("textarea[name='content']").val("");		
			if(!updateJlxz("2")){
				alert("更新意见类型失败，请联系管理员！");
				return false;
			}
			document.<%=formName%>.outCome.value = "退回";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQTH%>";
			document.<%=formName%>.contentType.value = "<%=CommonGlobal.OPINION_YJLX_BACK%>";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitZHSendBackContent.do?blbm=<%=dept.getTid()%>";
			copyFile2FormNew();
			document.<%=formName%>.submit();
		}
	}
	function commitFinalContent(){
		if(document.<%=formName%>.finalContent.value==''){
		//document.<%=formName%>.finalContent.focus();
			alert('请填写最终意见！');
			return;
		}
		if(confirm("确定要提交最终意见？")){
			$("textarea[name='sendBackContent']").val("");
			$("textarea[name='content']").val("");		
			if(!updateJlxz("1")){
				alert("更新意见类型失败，请联系管理员！");
				return false;
			}
			document.<%=formName%>.outCome.value = "最终意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQZZ%>";
			document.<%=formName%>.contentType.value = "<%=CommonGlobal.OPINION_YJLX_FINAL%>";
			document.<%=formName%>.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitFinalContent.do?blbm=<%=dept.getTid()%>";
			copyFile2FormNew();
			document.<%=formName%>.submit();
		}
	}
<%
}
%>

function updateJlxz(jlxz){
	var value = false;
	$.post("<%=basePath%>zccz/dealEvalHead_updateJlxz.do",{
		"jlxz" : "" + jlxz,
		"headId" : "<%=headId%>"
	},function(returnStr){
		if(returnStr == "SUCCESS"){
			value = true;
		}
	});
	return value;
}
</script>
<script type="text/javascript">
		var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.generatorBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
		var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
		var myAdviceType = "",myAdvice = "",mySpjl = "";
		$(function(){
			getAdviceType();
			initList();
			window.parent.clearPanelTool();
			
		var banlidan = "";	
		if("2" == "<%=status%>" || isHczw){
			banlidan = '{"buttonIcon":"icon-ok","buttonText":"办理单","buttonMenuId":"mmhq"},';
		}
		var tijiao = '{"buttonIcon":"icon-ok","buttonText":"提交","buttonMenuId":"mm1"}';
		var baocunDraft = ',{"buttonHandler":"mainWindow.saveDraft","buttonIcon":"icon-save","buttonText":"保存"}';
		var baocunTodo = ',{"buttonHandler":"mainWindow.saveTodo","buttonIcon":"icon-save","buttonText":"保存"}';
		var chuanyue = ',{"buttonHandler":"mainWindow.circulation","buttonIcon":"icon-edit","buttonText":"传阅"}';
		var shouhui = '{"buttonHandler":"mainWindow.backto","buttonIcon":"icon-edit","buttonText":"收回"}';
	  	var openhuiqian = '<div onClick="mainWindow.choiceDept()">开启会签</div>';

<%
	if(isInWorkflow){
%>
		var parentButtonStr = 
			'[' +
<%
		if(workflowVO.step.equals("draft")||workflowVO.step.equals("todo")){
%>
<%
			if(pgscCounterSignBtnDisplay && workflowVO.step.equals("todo")){
%>
				banlidan + 
<% 
			}
%>
<%
			if(workflowVO.getUnfinishCounterSignCount() == 0){
%>
				tijiao + 
<%
			}
%>
<%
			if(saveBtnDisplay){
				if(workflowVO.step.equals("draft")){%>
					baocunDraft + 
<%
				}else{
%>
<%					if(workflowVO.getUnfinishCounterSignCount() == 0){%>
						baocunTodo +
<%		
					}
%>
<%				}
			}
			if(workflowVO.step.equals("todo")){
%>
				//chuanyue +
<%
			}
		}
		if(workflowVO.step.equals("did")&&workflowVO.isCanBackto()){
%>
			shouhui +
<%
		}
		if(workflowVO.step.equals("did")){
%>
			//chuanyue +
<%
		}
%>
			']';
		var menuStr = 
<%
		if(workflowVO.step.equals("draft")||workflowVO.step.equals("todo")){
%>
<%
			if(pgscCounterSignBtnDisplay && workflowVO.step.equals("todo")){
%>
				'<div id="mmhq" style="width:150px;">' + 
				<%
				if(workflowVO.getUnfinishCounterSignCount() == 0){%>
					'<div onClick="mainWindow.choiceCLR()">开启办理单</div>' + 
				<%}%>
					'<div onClick="mainWindow.selectMeeting()">办理单查询</div>' +
				'</div>' +
<%
			}
%>
			'<div id="mm1" style="width:150px;">' + 
				<%	
					boolean first = true;
					for(String outCome : workflowVO.outComes){
						if(workflowVO.step.equals("draft")){
							if(outCome.equals("作废")||outCome.equals("流程办结")){continue;}
				%>
							'<div onClick="mainWindow.commitDraft(&quot;<%=workflowVO.pdk%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></div>' +
				<%		}else{
							if(outCome.equals("生成台账")||outCome.equals("流程办结"))
							{
								continue;
							}
				%>
							'<div onClick="mainWindow.commit(&quot;<%=workflowVO.taskId%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></div>' +
						<%}
					}
				%>
			'</div>';
<%
		}
		else{
%>
			'';
<%
		}
%>
		window.parent.addButtonsFromChildren(parentButtonStr,menuStr);
<%
	}
%>
	
<%
if(isInCounterSign){
	if(isDid==null||!(isDid.equals("yes"))){
%>
		var parentButtonStr = 
			'[{"buttonIcon":"icon-ok","buttonText":"提交","buttonMenuId":"mm1"}' +
			',{"buttonHandler":"mainWindow.choiceUser","buttonIcon":"icon-edit","buttonText":"添加办理人员"}' +
			',{"buttonHandler":"mainWindow.counterSignUserList","buttonIcon":"icon-edit","buttonText":"办理人员列表"}' +
		']';
		var menuStr = 
			'<div id="mm1" style="width:150px;">' +
<%
				if(userType.equals("ZH")){
%>
				'<div onClick="mainWindow.commitZHGCContent();">过程意见</div>' +
<%
				}if(userType.equals("BMLD")){
%>
				'<div onClick="mainWindow.commitLDGCContent();">过程意见</div>' +
<%
				}if(userType.equals("JBR")){
%>
				'<div onClick="mainWindow.commitJBGCContent();">过程意见</div>' +
<%
				}if(userType.equals("ZH")){
%>					
				'<div onClick="mainWindow.commitZHSendBackContent();">退回意见</div>' +
<%				
				}if(userType.equals("BMLD")){
%>
				'<div onClick="mainWindow.commitBMLDSendBackContent();">退回意见</div>' +
<%
				}if(userType.equals("BMLD")){
%>
				'<div onClick="mainWindow.commitFinalContent();">最终意见</div>' +
<%
				}
%>
			'</div>';
		window.parent.addButtonsFromChildren(parentButtonStr,menuStr);
<%
	}
}
%>
	<e:pc id="chuanyue">
	<%if(isInWorkflow){%>
		var chuyue = '[{"id":"chuanyue1","buttonHandler":"mainWindow.circulation","buttonIcon":"icon-edit","buttonText":"传阅"}]';
		window.parent.prependButtonsFromChildren(chuyue,"");
	<%}%>
	</e:pc>
	
	<%if(isInCounterSign || ishistory){%>
		var buttonStr_history = '[{"id":"chuanyue1","buttonHandler":"mainWindow.seehistory","buttonIcon":"icon-search","buttonText":"查看历史"}]';
		window.parent.prependButtonsFromChildren(buttonStr_history,"");
	<%}%>
			$("#zjfdShow").val(${head.zjfd*100}.toFixed(2) + "%");
			initValue();
			//设置资产grid宽度
			jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
			jQuery("#file_list").setGridWidth($("#conditions").width());
			jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
			jQuery("#file_huiqian_endlist").setGridWidth($("#conditions").width());
			jQuery("#assetList").setGridWidth($("#conditions").width());
			jQuery("#entity_asset_list").setGridWidth($("#conditions").width());
			jQuery("#loan_pledge_asset_list").setGridWidth($("#conditions").width());
			jQuery("#entityList").setGridWidth($("#conditions").width());
			jQuery("#debtList").setGridWidth($("#conditions").width());
			jQuery("#zyzc_asset_list").setGridWidth($("#conditions").width());
			$(window).bind('resize', function(){
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
				jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
				jQuery("#file_huiqian_endlist").setGridWidth($("#conditions").width());
				jQuery("#assetList").setGridWidth($("#conditions").width());
				jQuery("#entity_asset_list").setGridWidth($("#conditions").width());
				jQuery("#loan_pledge_asset_list").setGridWidth($("#conditions").width());
				jQuery("#entityList").setGridWidth($("#conditions").width());
				jQuery("#debtList").setGridWidth($("#conditions").width());
				jQuery("#zyzc_asset_list").setGridWidth($("#conditions").width());
			});
<%
		if(workflowVO.getUnfinishCounterSignCount() == 0){
			
%>
			<e:pc id="blyj_reason_listButtons">
			//======================办理依据和附件按钮=========================
		    	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			</e:pc>
			<e:pc id="file_listButtons">
			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^办理依据和附件按钮^^^^^^^^^^^^^^^^^^^^^^^^^^^
			</e:pc>
				//（处理）新建正文按钮
			<e:pc id="sczw">
				var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
				//var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"处理正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
<%}%>
				//查看正文按钮
			<e:pc id="ckzw">
				var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
			
			<e:pc id="bjzw">
                var buttonStr_bjzhengwen ='[{"buttonHandler":"mainWindow.bjzhengwen","buttonIcon":"icon-viewFile","buttonText":"编辑正文"}]';
                window.parent.prependButtonsFromChildren(buttonStr_bjzhengwen,"");
                
			</e:pc>
<%
		if(workflowVO.getUnfinishCounterSignCount() == 0){
%>
			//生成编号
			<e:pc id="scbh">
					var headBHGen = document.getElementById("bianhao").value;
					if(headBHGen == null || headBHGen.length == 0){
						window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
					}else{
						//合成正文
						<e:pc id="hczw">
							<% if(!status.equals("2")){%>
								window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
							<%}%>
					   </e:pc>
					}
			</e:pc>
<%}%>			

		<e:pc id="didEndButton">
		</e:pc>	
		//添加资产列表按钮
<%
		if(workflowVO.getUnfinishCounterSignCount() == 0){
%>
		<e:pc id="assetListButtons">
			var buttonsString = '[\
				{"buttonHandler":"viewAssetDetail","buttonIcon":"icon-search","buttonText":"查看"},\
				{"buttonHandler":"addAsset(&quot;0&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
				{"buttonHandler":"delAsset(&quot;0&quot;)","buttonIcon":"icon-remove","buttonText":"删除"},\
				{"buttonHandler":"editMessage(&quot;0&quot;)","buttonIcon":"icon-edit","buttonText":"编辑评估信息"}\
			]';
			//自用资产按钮
			var zyzcListButtonsStr ='[\
				{"buttonHandler":"viewPgxx(&quot;5&quot;)","buttonIcon":"icon-add","buttonText":"查看"},\
				{"buttonHandler":"addAsset(&quot;5&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
				{"buttonHandler":"delAsset(&quot;5&quot;)","buttonIcon":"icon-remove","buttonText":"删除"},\
				{"buttonHandler":"editMessage(&quot;5&quot;)","buttonIcon":"icon-edit","buttonText":"编辑评估信息"}\
			]';
		</e:pc>	
		<e:pc id="assetListButtons1">	
			var buttonsString = '[\
						{"buttonHandler":"viewAssetDetail","buttonIcon":"icon-search","buttonText":"查看"}\
					]';
			var zyzcListButtonsStr ='[\
						{"buttonHandler":"viewPgxx(&quot;5&quot;)","buttonIcon":"icon-add","buttonText":"查看"}\
					]';	
		</e:pc>	
		prependButtons(jQuery("#gview_assetList > .ui-jqgrid-titlebar"),buttonsString);
		addButtons(jQuery("#gview_zyzc_asset_list > .ui-jqgrid-titlebar"),zyzcListButtonsStr);		
<%
		}else{
%>
				var buttonsString = '[{"buttonHandler":"viewAssetDetail","buttonIcon":"icon-search","buttonText":"查看"}]';
				var zyzcListButtonsStr = '[{"buttonHandler":"viewPgxx(&quot;5&quot;)","buttonIcon":"icon-add","buttonText":"查看"},\
									   	   {"buttonHandler":"viewZyzcPgxx","buttonIcon":"icon-search","buttonText":"查看评估信息"}\
									   	  ]';
				prependButtons(jQuery("#gview_assetList > .ui-jqgrid-titlebar"),buttonsString);
				addButtons(jQuery("#gview_zyzc_asset_list > .ui-jqgrid-titlebar"),zyzcListButtonsStr);
	<%}%>		
<%
		if(workflowVO.getUnfinishCounterSignCount() == 0){
%>			
			<e:pc id="entity_asset_listButtons">			
				//实体内资产
				var buttonsString2 ='[\
						{"buttonIcon":"icon-add","buttonText":"选择实体","buttonMenuId":"chooseEntity"},\
						{"buttonHandler":"delEntityAsset","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';						
				addButtons(jQuery("#gview_entity_asset_list > .ui-jqgrid-titlebar"),buttonsString2);
			</e:pc>
			<e:pc id="loan_pledge_asset_listButtons">
				//委贷抵债物
				//{"buttonHandler":"editMessage(&quot;2&quot;)","buttonIcon":"icon-edit","buttonText":"编辑评估信息"}\
				var buttonsString3 ='[\
						{"buttonHandler":"addAsset(&quot;2&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
						{"buttonHandler":"delLoanPledgeAsset","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';						
				addButtons(jQuery("#gview_loan_pledge_asset_list > .ui-jqgrid-titlebar"),buttonsString3);				
			</e:pc>
			<e:pc id="entityListButtons">			
				//实体
				var entityListButtonsStr ='[\
						{"buttonIcon":"icon-add","buttonText":"选择实体","buttonMenuId":"chooseEntity2"},\
						{"buttonHandler":"delAsset(&quot;3&quot;)","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
				addButtons(jQuery("#gview_entityList > .ui-jqgrid-titlebar"),entityListButtonsStr);
			</e:pc>
			<e:pc id="entityListButtons">			
				//债权按钮
				var debtListButtonsStr ='[\
						{"buttonHandler":"addAsset(&quot;4&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
						{"buttonHandler":"delAsset(&quot;4&quot;)","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
				addButtons(jQuery("#gview_debtList > .ui-jqgrid-titlebar"),debtListButtonsStr);
				
			</e:pc>
			
			$("#pgjzr").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
			});
			
			var bjButtonStr = '[{"buttonHandler":"mainWindow.endProcess","buttonIcon":"icon-ok","buttonText":"办结"}]';
			<e:pc id="bjButton">
				//办结按钮
				if("2" == "<%=status%>" || isHczw){
					window.parent.prependButtonsFromChildren(bjButtonStr,"");
				}
			</e:pc>
<%}else{%>
	$("input").attr("readonly","readonly");
	$("textarea").attr("readonly","readonly");
	$("select").attr("disabled","disabled");
<%}%>
		$("#prePgzclb").val($("#pgzclb").val());
		<e:pc id="cjscjlButton">
		var submitButton = '[{"buttonHandler":"editScyj","buttonIcon":"icon-search","buttonText":"查看及提交审查结论"}]';
		addButtonsjl($("#headButton"),submitButton);
		</e:pc>
	});

	function viewZyzcPgxx(){
	
	}
			
	function addButtonsjl(obj, buttonsJSonString){
		var jsonObj = $.parseJSON(buttonsJSonString);
		var text,icon,handler,menuId,id;
		var insertButtons = '';
		var linkIds = new Array();
		var menuIds = new Array();
		for (var i = 0; i < jsonObj.length; i++) {
			if(jsonObj[i] != null && jsonObj[i] != ""){
				text = jsonObj[i].buttonText==null?'':jsonObj[i].buttonText;
				icon = jsonObj[i].buttonIcon==null?'':jsonObj[i].buttonIcon;
				handler = jsonObj[i].buttonHandler==null?'':jsonObj[i].buttonHandler;
				menuId = jsonObj[i].buttonMenuId==null?'':jsonObj[i].buttonMenuId;
				id = jsonObj[i].id==null?Math.random()*Math.random():jsonObj[i].id;
				if(menuId == ''){
					linkIds.push(id);
					insertButtons += '<a '
						 + ' id="' + id + '"' 
						 + ' href="#"' ;
						 if(handler.indexOf('(') != -1){
						 	insertButtons += ' onclick="' + handler + ';return false;"'
						 }else{
						 	insertButtons += ' onclick="' + handler + '();return false;"'
						 }
					insertButtons += ' plain="false" class="easyui-linkbutton" ' 
						 + ' iconCls="' + icon + '">' 
						 + ' <font size="2"> <strong>'
						 + text 
						 + ' </strong></font> '
						 + '</a>';
				}else{
					menuIds.push(id);
					insertButtons += '<a '
						 + ' id="' + id + '"' 
						 + ' href="#"' 
						 + ' onclick="return false;"'
						 + ' name="#' + menuId + '"'
						 + ' href="#"' 
						 + ' plain="true" class="easyui-menubutton" ' 
						 + ' iconCls="' + icon + '">' 
						 + text + '</a>\
					';
				}
			}
		}
	
		$(obj).append('\
			<table cellspacing="0" cellpadding="0" border="0" style="margin-right:20;float: right; table-layout: auto;" class="ui-pg-table navtable">\
			<tbody>\
			<tr>\
			<td>' + insertButtons + '</td>\
			</tr>\
			</tbody>\
			</table>\
		');
		$(linkIds).each(function(i,id){
			$(document.getElementById(id)).linkbutton({
		        duration: 9999999999,
				plain:true
			});
		});
		$(menuIds).each(function(i,id){
			$(document.getElementById(id)).menubutton({
	            duration: 9999999999,
	            menu: "" + $(document.getElementById(id)).attr("name"),
				plain:true
			});
		});
	}
	//办理单相关方法================================================================================
	function editScyj(){
		var url = "";
		<%if(isDid==null||!(isDid.equals("yes"))){ //这个是修改用的%>
			url = "<%=basePath %>zccz/dealEvalHead_editScyjSubmit.do?"
			+ "pgscYj.cldId=${head.id}"
			+ "&isInCounterSign=<%=isInCounterSign%>"
			+ "&adviceType=" + getAdviceType()
			+ "&myAdviceType=" + myAdviceType
			+ "&myAdvice=" + myAdvice
			+ "&mySpjl=" + mySpjl;
		<%}else{ // 这个是查看用的%>
			url = "<%=basePath %>zccz/dealEvalHead_editScyjQuery.do?"
			+ "pgscYj.cldId=${head.id}"
			+ "&isInCounterSign=<%=isInCounterSign%>"
			+ "&adviceType=" + getAdviceType()
			+ "&myAdviceType=" + myAdviceType
			+ "&myAdvice=" + myAdvice
			+ "&mySpjl=" + mySpjl;
		<%}%>
		var urlc = encodeURI(url);
		window.open(urlc,"",winOpenStr);
	}
	
	function save(){
		$("#myform").attr("action","<%=basePath%>zccz/dealEvalHead_saveHead.do");
		if('beforeWorkFlowSubmit' in window){
            if(beforeWorkFlowSubmit instanceof Function){
                var result = beforeWorkFlowSubmit("saveDraft","");
                if(!result) return;
            }
        }			
    	$("#myform").submit();
	}
	//================================================================================
	
	function addDoc(){
      		wordTemplate("bank_Template", document.getElementById("myForm"),false,true, "处置报告"); 
      		return false;
	}
	
	function endProcess(){
		if(confirm('确定要提交'+'流程办结'+'吗？')){
			$("#myform").ajaxForm({
				success:function(responseText){
					if(responseText == 'SUCCESS_END'){
						document.<%=formName%>.action = document.getElementById("endUrl").value;
						document.<%=formName%>.url.value = document.getElementById("endViewUrl").value;
						document.<%=formName%>.taskId.value = '<%=workflowVO.taskId%>';
						document.<%=formName%>.sheetId.value = document.getElementById("bianhao").value;
						document.<%=formName%>.outCome.value = '流程办结';
						if('beforeWorkFlowSubmit' in window){
				            if(beforeWorkFlowSubmit instanceof Function){
				                var result = beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>");
				                if(!result) return;
				            }
				        }
						document.myform.submit();
					}
				}
			});
			beforeWorkFlowSubmit("","");				
			$("#myform").attr("action","<%=basePath%>zccz/dealEvalHead_endHead.do");
			document.myform.taskId.value = '<%=workflowVO.taskId%>';
			if('beforeWorkFlowSubmit' in window){
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>");
	                if(!result) return;
	            }
	        }
			$("#myform").submit();
		}
	}
	
	function choiceCLR(){
		$.ajaxSetup({async: false});
		if(!confirm('确定要开启办理单吗？')) return;
		var flag = "1";
		var urlpush = encodeURI("/eam2/pgscCountersign/startPgscCountersign_getParticipationList.do?multiple=false");
		//默认发送给林桦
		//var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		//if(typeof(result)=='undefined') return;
		document.myform.action = "/eam2/pgscCountersign/startPgscCountersign_start.do";
		// 查找风险管理部综合
		$.post("<%=basePath%>users/users_getZhUserByDept.do",{
			"deptID"	: "11443"
		},function(userId){
			if(userId != null && userId != ""){
				document.myform.dept_user.value = "11443," + userId;
			}else{
				alert("查找风险管理部综合失败,请联系管理员!");
				flag = "0";
			}
		});
		if(flag == "0"){
			return ;
		}
	//  document.myform.dept_user.value = "11315,15197";
		//document.myform.dept_user.value = result;
		document.myform.pdk.value = "pgscCountersign";
		$.ajaxSetup({async: true});
		document.myform.submit();
	}
	function viewPgxx(assetType){
		if(assetType == "5"){
			var gr = jQuery("#zyzc_asset_list").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要查看的记录!");
			}else if(gr.length > 1){
				alert("一次只能查看一条记录!");
			}else if (gr.length == 1){
				var zyzcId = jQuery("#zyzc_asset_list").getCell(gr,"zyzcid");
				window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + zyzcId +"&sheettype=zcBook_swtz_view&showPgInfo=true",
			'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		}
	}
	
	function lookZyzc(id){
		window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + id +"&sheettype=zcBook_swtz_view&showPgInfo=true",
			'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
		
	function addAsset(assetType){
		if(assetType == "0"){
			window.open("<%=basePath %>jygdzc/AssetQuery_init.do?" 
				+ "returnValue=true&" 
				+ "sheettype=query","",winOpenStr);
		}else if(assetType == "2"){
			window.open("<%=basePath %>wtdk/loansQuery_init.do?"
			+ "ctlButton=show&"
			+ "assetType=2&"
			+ "zcczpg=1&"
			+ "cldId=${head.id }"
			+ "&ispgsc=1",'',winOpenStr);
		}else if(assetType == "4"){
			window.open("<%=basePath %>zqgl/debt_debtList.do"
				+ "?option=czpg"
				+ "&assetType=4","",winOpenStr);
		}else if(assetType == "5"){
			window.open("<%=basePath %>zyzc/ZCQuery_init.do"
				+ "?cldId=${head.id}"
				+ "&isForPgsc=true"
				+ "&assetType=5","",winOpenStr);
		}
	}
	
	function addValue(ids){
		var assetType = $("#pgzclb").val();
		$.post("<%=basePath%>zccz/dealEvalBody_addBodys.do",{
			"assetIds"	: "" + ids,
			"assetType" : "" + assetType,
			"jzr"		: "" + $("#pgjzr").val(),
			"cldId"		: "" + $("#id").val()
		},function(returnStr){
			if(returnStr=="success"){
				reloadMessage(assetType);
			}else{
				alert("新增资产失败,请联系管理员!");
			}
		});
		return false;
	}
	
	//删除经营性固定资产、股权、债权	
	function delAsset(assetType){
		var ids;
		if("0" == assetType)
			ids = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
		else if("3" == assetType)
			ids = jQuery("#entityList").jqGrid('getGridParam','selarrrow');
		else if("4" == assetType)
			ids = jQuery("#debtList").jqGrid('getGridParam','selarrrow');
		else if("5" == assetType)
			ids = jQuery("#zyzc_asset_list").jqGrid('getGridParam','selarrrow');	
		if(ids.length == 0){
			alert("请选择要删除的记录!");
			return;
		}else if(confirm("确认删除！")){
			$.post("<%=basePath %>zccz/dealEvalBody_delAsset.do",{
				"assetIds" : "" + ids,
				"cldId" : "" + $("#id").val()
			},function(returnStr){
				if(returnStr == "SUCCESS"){
					reloadMessage(assetType);
				}else{
					alert("删除失败,请联系管理员!");
				}
			});
		}
	}
	//删除实体内资产	
	function delEntityAsset(){
		var gr = jQuery("#entity_asset_list").jqGrid('getGridParam','selarrrow');
		if(gr.length > 0) {
			if(confirm("确认删除！")){
				$.post("<%=request.getContextPath()%>/zccz/dealEvalBody_deleteBody.do",{
					"deleteId":"" + gr,
					"cldId" : "" + $("#id").val()
				},function(returnStr){
					reloadMessage("1");
				});
			}
		}else{
			alert("请选择要删除的记录!"); 		
		}
	}
	//删除委贷抵债物	
	function delLoanPledgeAsset(){
		var gr = jQuery("#loan_pledge_asset_list").jqGrid('getGridParam','selarrrow');
		if(gr.length > 0) {
			if(confirm("确认删除！")){
				$.post("<%=request.getContextPath()%>/zccz/dealEvalBody_deleteBody.do",{
					"deleteId":"" + gr
				},function(returnStr){
					$("#loan_pledge_asset_list").trigger("reloadGrid");
				});
			}
		}else{
			alert("请选择要删除的记录!"); 		
		}
	}
	
	//gridIndex 	'0':经营性固定资产，'1'：实体内资产，'2'：委贷抵债物，'3':'股权'，'4':'债权'
	function editMessage(assetType){
		if("0" == assetType){
			var id = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
			if(id.length < 1){
				alert("请选择一项资产");return;
			}else if(id.length > 1){
				alert("只能选择一条记录！");return;
			}else{
				window.open("<%=basePath %>zccz/dealEvalBody_editPgxx.do?"
					+ "cpl.id=" + id
					+ "&gridIndex=" + assetType
					+ "&cpl.czpgscclid=" + $("#id").val(),"",winOpenStr);
			}
		}else if("1" == assetType){ 
			var id = jQuery("#entity_asset_list").jqGrid('getGridParam','selarrrow');
			if(id.length < 1){
				alert("请选择一项资产");return;
			}else if(id.length > 1){
				alert("只能选择一条记录！");return;
			}else{
				window.open("<%=basePath %>zccz/dealEvalBody_editPgxx.do?"
					+ "cpl.id=" + id
					+ "&gridIndex=" + assetType
					+ "&cpl.czpgscclid=" + $("#id").val(),"",winOpenStr);
			}
		}else if("2" == assetType){
		
		}else if("3" == assetType){
			
			var id = jQuery("#entityList").jqGrid('getGridParam','selarrrow');
		}else if("4" == assetType){
			var id = jQuery("#debtList").jqGrid('getGridParam','selarrrow');
		}else if("5" == assetType){
			var id = jQuery("#zyzc_asset_list").jqGrid('getGridParam','selarrrow');
			if(id.length < 1){
				alert("请选择一项资产");
				return;
			}else if(id.length > 1){
				alert("只能选择一条记录！");
				return;
			}else{
				window.open("<%=basePath %>zccz/dealEvalBody_editPgxx.do?"
					+ "cpl.id=" + id
					+ "&gridIndex=" + assetType
					+ "&cpl.czpgscclid=" + $("#id").val(),"",winOpenStr);
			}
		}
	}
	
	//跟新head的金额信息、reloadGrid.
	//0:经营性固定资产,1:实体内资产,2:委贷抵债物,3:股权,4:债权
	function reloadMessage(gridIndex){
		$.post("<%=basePath%>zccz/dealEvalHead_getHeadJson.do",{
				"head.id"		: "" + $("#id").val()
			},function(returnStr){
				returnObj = eval('(' + returnStr + ')');
				$("#pgzzwy").val(new Number(returnObj.pgzz).toFixed(2));
				$("#zczmyzwy").val(new Number(returnObj.zczmyz).toFixed(2));
				$("#zczmjzwy").val(new Number(returnObj.zczmjz).toFixed(2));
				$("#zjzwy").val(new Number(returnObj.zjz).toFixed(2));
				$("#jzrzmjzwy").val(new Number(returnObj.jzrzmjz).toFixed(2));
				$("#zjfd").val(returnObj.zjfd);
				if(new Number(returnObj.jzrzmjzwy) == 0){
					if(new Number(returnObj.pgzz) > 0){
						$("#zjfdShow").val("∞");
					}else if(new Number(returnObj.pgzz) == 0){
						$("#zjfdShow").val("0%");
					}else{
						$("#zjfdShow").val("-∞");
					}
				}else{
					var temp = new Number(returnObj.zjfd);
				    var zjfdbfb = temp * 100;
					$("#zjfdShow").val(zjfdbfb.toFixed(2) + "%");
				}
			});
		if("0" == gridIndex){
			reloadAssetGrid("0");
		}else if("1" == gridIndex){
			jQuery("#entity_asset_list").setGridParam({
				postData:{
					"cldId":"${head.id }",
					"assetType":"1"				
				}
			}).trigger("reloadGrid");	
		}else if("2" == gridIndex){
			jQuery("#loan_pledge_asset_list").setGridParam({
				postData:{
					"cldId":"${head.id }",
					"assetType":"1"				
				}
			}).trigger("reloadGrid");			
		}else if("3" == gridIndex){
			jQuery("#entityList").setGridParam({
				postData:{
					"cldId":"${head.id }",
					"assetType":"3"				
				}
			}).trigger("reloadGrid");			
		}else if("4" == gridIndex){
			jQuery("#debtList").setGridParam({
				postData:{
					"cldId":"${head.id }",
					"assetType":"4"				
				}
			}).trigger("reloadGrid");
		}else if("5" == gridIndex){
			jQuery("#zyzc_asset_list").setGridParam({
				postData:{
					"cldId":"${head.id }",
					"assetType":"5"				
				}
			}).trigger("reloadGrid");
		}
	}
	
	function selectDept(){
		var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?notPerson=false";
		var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	}
	
	function reloadAssetGrid(assetType){
		jQuery("#assetList").setGridParam({
			postData:{
				"cldId":"${head.id }",
				"assetType":assetType				
			}
		}).trigger("reloadGrid");
	}

	//在点击类型时候，记忆当前是什么类型
	var oldZclb = "0";
	function remberValue(pgzclb){
		oldZclb = document.getElementById("pgzclb").value;
	}
	////////////////////////////生成正文///////////////////////////////////////////////////////////
	//（处理）新建正文
	var myWordState = false;
	function openzhengwen(){
		wordTemplate('bank_Template', document.getElementById("myform"),false,true, "处置评估正文"); 
		//修改按钮名称为“处理正文”
		window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
		window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		myWordState = true;
	}
	//查看正文
	function viewzhengwen(){
		wordTemplate('bank_Template', document.getElementById("myform"),true,false,"处置评估正文"); 
	}
	//编辑正文
	function bjzhengwen(){
	    wordTemplate('bank_Template', document.getElementById("myform"),false,true, "处置评估正文");
	}
	
	//合成正文
	var isHczw = false;
	function hechengzhengwen(){
	    var bianhao = document.getElementById('bianhao').value;
		MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "处置评估正文",'hechengHead()','hechengBottom()');
		window.parent.removeObj("#hczwButton");
		var bjButtonStr = '[{"buttonHandler":"mainWindow.endProcess","buttonIcon":"icon-ok","buttonText":"办结"}]';
		window.parent.prependButtonsFromChildren(bjButtonStr,"");
		window.parent.prependButtonsFromChildren('[{"buttonIcon":"icon-ok","buttonText":"办理单","buttonMenuId":"mmhq"}]',"");
		isHczw = true;
	}
	
	function hechengHead(){
		MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("head.blbm").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("head.blbm").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
	}
	
	function hechengBottom(){
	    var strDate = "<%=strDate%>";
		MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
		MyRangeBottom.find.execute("￥￥HCRQ",false,false,false,false,false,true,false,false, strDate,2,false,false,false,false);
		var headId=$("#headId").val();
		$.ajaxSetup({async:false});
		$.post("<%=basePath %>file/file_getFileList.do",{
			"bdid":headId
		},function(data){
			if(data != null && data.length != 0){
		        MyRangeBottom.find.execute("￥￥F_J",false,false,false,false,false,true,false,false, "附件：",2,false,false,false,false);
			}else{
			    MyRangeBottom.find.execute("￥￥F_J",false,false,false,false,false,true,false,false, "",2,false,false,false,false);
			}
			MyRangeBottom.find.execute("￥￥FJBTLIST",false,false,false,false,false,true,false,false, data,2,false,false,false,false);
		});
	}
	
	//设置意见域意见
	function setAdvice(adviceType, advicePreview, advice,spjl){
		if(isNotNull(adviceType))
			myAdviceType = adviceType;
		if(isNotNull(advice))
		    myAdvice = advice;
		if(isNotNull(spjl))
			mySpjl = spjl;
		if(adviceType == "1"){
			$(".newTable tr:contains('最终意见：') textarea").val(advicePreview);
			$(".newTable tr:contains('过程意见：') textarea").val("");
			$(".newTable tr:contains('退回意见：') textarea").val("");
		}else if(adviceType == "0"){
			$(".newTable tr:contains('最终意见：') textarea").val("");
			$(".newTable tr:contains('过程意见：') textarea").val(advicePreview);
			$(".newTable tr:contains('退回意见：') textarea").val("")
		}else if(adviceType == "2"){
			$(".newTable tr:contains('最终意见：') textarea").val("");
			$(".newTable tr:contains('过程意见：') textarea").val("");
			$(".newTable tr:contains('退回意见：') textarea").val(advicePreview);
		}
	}
	
	function getAdviceType(){
		if($(".newTable tr:contains('最终意见：') textarea").html() != null){
			return "1";
		}
		if($(".newTable tr:contains('退回意见：') textarea").html() != null){
			return "2";
		}
		if($(".newTable tr:contains('过程意见：') textarea").html() != null){
			return "0";
		}
	}

	function initList(){
		$(".list").hide();
	  	if($("#pgzclb").val() == "0"){
	  		$("#fixed_asset").show();
	  	}else if($("#pgzclb").val() == "1"){
	  		$("#entity_asset").show();
	  	}else if($("#pgzclb").val() == "2"){
	  		$("#loan_pledge_asset").show();
	  	}else if($("#pgzclb").val() == "3"){
	  		$("#entityListDiv").show();
	  	}else if($("#pgzclb").val() == "4"){
	  		$("#debtListDiv").show();
	  	}else if($("#pgzclb").val() == "5"){
	  		$("#zyzcListDiv").show();
	  	}
	  	$("#prePgzclb").val($("#pgzclb").val());
	}
	
	//改变列表
	function changeAssetList(){
	  	if($("#prePgzclb").val() == "0"){
		  	var fixedAsset = jQuery("#assetList").getDataIDs();
	  		if(fixedAsset.length > 0){
		  		alert("请先删除固定资产信息列表中所有的资产信息，再更改评估资产类别！");
		  		$("#pgzclb").val($("#prePgzclb").val());
		  		return false;
	  		}
	  	}else if($("#prePgzclb").val() == "1"){
		  	var entityAsset = jQuery("#entity_asset_list").getDataIDs();
	  		if(entityAsset.length > 0){
	  			alert("请先删除实体内资产信息列表中的实体内资产信息，再更改评估资产类别！");
	  			$("#pgzclb").val($("#prePgzclb").val());
	  			return false;
	  		}
	  	}else if($("#prePgzclb").val() == "2"){
		  	var loanPledgeAsset = jQuery("#loan_pledge_asset_list").getDataIDs();
	  		if(loanPledgeAsset.length > 0){
	  			alert("请先删除委贷抵债物信息列表中的抵债物信息，再更改评估资产类别！");
	  			$("#pgzclb").val($("#prePgzclb").val());
	  			return false;
	  		}
	  	}else if($("#prePgzclb").val() == "3"){
		  	var entitys = jQuery("#entityList").getDataIDs();
	  		if(entitys.length > 0){
	  			alert("请先删除实体信息列表中的实体信息，再更改评估资产类别！");
	  			$("#pgzclb").val($("#prePgzclb").val());
	  			return false;
	  		}
	  	}else if($("#prePgzclb").val() == "4"){
		  	var debts = jQuery("#debtList").getDataIDs();
		  	if(debts.length > 0){
		  		alert("请先删除债权信息列表中的债权信息，再更改评估资产类型");
	  			$("#pgzclb").val($("#prePgzclb").val());
	  			return false;
		  	}
	  	}else if($("#prePgzclb").val() == "5"){
	  		var zyzcs = jQuery("#zyzc_asset_list").getDataIDs();
		  	if(zyzcs.length > 0){
		  		alert("请先删除自用资产信息列表中的债权信息，再更改评估资产类型");
	  			$("#pgzclb").val($("#prePgzclb").val());
	  			return false;
		  	}
	  	}
	  	$(".list").hide();
	  	if($("#pgzclb").val() == "0"){
	  		$("#fixed_asset").show();
	  	}else if($("#pgzclb").val() == "1"){
	  		$("#entity_asset").show();
	  	}else if($("#pgzclb").val() == "2"){
	  		$("#loan_pledge_asset").show();
	  	}else if($("#pgzclb").val() == "3"){
	  		$("#entityListDiv").show();
	  	}else if($("#pgzclb").val() == "4"){
	  		$("#debtListDiv").show();
	  	}else if($("#pgzclb").val() == "5"){
	  		$("#zyzcListDiv").show();
	  	}
	  	$("#prePgzclb").val($("#pgzclb").val());
	}

	//选择实体股权
	function selectComEntity(zixunType, pgzclx){
		document.getElementById("zixunType").value = zixunType;
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + '&zixunType=' + zixunType 
		 + '&cldId=${head.id }' 
		 + '&option=pgsc_gq'
		 + '&zcczpg=1' 
		 + '&ispgsc=1','',winOpenStr);
	}
	
	// 实体内资产
	function selectComEntityAsset(zixunType,pgzclx){
		document.getElementById("zixunType").value = zixunType;
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + '&ctlButton=hidden'
		 + '&zixunType=' + zixunType 
		 + '&cldId=${head.id }' 
		 + '&option=pgsc_gq'
		 + '&zcczpg=1' 
		 + '&ispgsc=1','',winOpenStr);
	}
	
	function setComMessage(stids,assetType){
		$.post("<%=basePath%>zccz/dealEvalBody_addBodys.do",{
			"assetIds"	: "" + stids,
			"assetType" : "" + assetType,
			"jzr"		: "" + $("#pgjzr").val(),
			"cldId"		: "" + $("#id").val()
		},function(returnStr){
			if(returnStr=="success"){
				reloadMessage(assetType);
			}else{
				alert(returnStr);
			}
		});
		return false;
	}
	
	function lookdblclickAss1(gr){
		if(gr.length == 0  ){
			alert("请选择要查看的记录")
		}else if (gr.length > 32){
			alert("只能选择一条要查看的记录")
		}else{
			var fsxxId = jQuery("#entityList").getCell(gr,"gqstid");
			var zixunType = jQuery("#entityList").getCell(gr,"gqstzl");
			if("0" == zixunType || "3" == zixunType){
				window.open('<%=basePath %>stgl/weihu_newEntity.do?stid='+fsxxId+'&stlx='+0+'&rework='+1+'&look='+1);
			}else if("1" == zixunType){
				window.open('<%=basePath %>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+fsxxId+'&stlx='+1+'&look='+1);
			}
		}
	}
		
	function viewAssetDetail() {
		var gr = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
		if (gr.length == 0){
			alert("请选择要查看的记录!");
		}else if(gr.length > 1){	
			alert("一次只能查看一条资产");
		}else{
			var zcid = jQuery("#assetList").getCell(gr,'zcid');
			lookAsset(zcid);
		}
		return false;
	};
	
	//查看经营性固定资产明细
	function lookAsset(gr){
		window.open('<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		//window.open('http://localhost:80/eam2/jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
	}
	
	
//验证标题为空
function checkEAMFormTitle(){
	var biaoti = document.getElementById("biaoti");
	if(biaoti.value == null || biaoti.value.trim().length == 0){
			alert("标题不能为空！");
			biaoti.focus();
      	return false;
   	}
    return true;
}  
	
	function lookdblclickAss(gr){
		var fsxxId = jQuery("#entity_asset_list").getCell(gr,"stid");
		var zixunType = document.getElementById("zixunType").value;
		if("0" == zixunType || "3" == zixunType){
			window.open('<%=basePath %>stgl/weihu_newEntity.do?stid='+fsxxId+'&stlx='+0+'&rework='+1+'&look='+1+'&zcczpg=1');
		}else if("1" == zixunType){
			window.open('<%=basePath %>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+fsxxId+'&stlx='+1+'&look='+1+'&zcczpg=1');
		}
	}
		
	function initValue(){
		$("#pgzzwy").val(${head.pgzz}.toFixed(2));
		$("#zczmyzwy").val(${head.zczmyz}.toFixed(2));
		$("#zczmjzwy").val(${head.zczmjz}.toFixed(2));
		$("#zjzwy").val(${head.zjz}.toFixed(2));
		if(isNaN(${head.jzrzmjz})){
			$("#jzrzmjzwy").val(null);
		}else{
			$("#jzrzmjzwy").val(${head.jzrzmjz}.toFixed(2));
		}
		$("#zjfd").val(${head.zjfd});
		if(new Number(${head.jzrzmjz}) == 0){
			if(new Number(${head.pgzz}) > 0){
				$("#zjfdShow").val("∞");
			}else if(new Number(${head.pgzz}) == 0){
				$("#zjfdShow").val("0%");
			}else{
				$("#zjfdShow").val("-∞");
			}
		}else{
		     var temp = ${head.zjfd};
			 var zjfdbfb = temp * 100;
			 $("#zjfdShow").val(zjfdbfb.toFixed(2) + "%");
		}
	}
	
	function generatorBianhao(){
		$.post("<%=basePath%>zccz/dealEvalHead_generatorBianhao.do",{
			"head.id" : "" + $("#id").val()
		},function(returnStr){
			$("#bianhao").val(returnStr);
			window.parent.removeObj("#shengchenButton");
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		});
	}
		
	/**
	checkEAMFormJSMethod2(arg1, arg2)
								arg1								arg2
	提交							taskId								outCome			
	拟稿提交						processDefinitionKey				outCome
	保存待办						"saveTodo"							""	
	**/
	function checkEAMFormJSMethod2(arg1, arg2){
		if($.trim($("#biaoti").val()) == ""){
			alert("请输入标题");
			return false;
		}
		if($.trim($("#lxdh").val()) == ""){
			alert("请输入联系电话");
			return false;
		}
		if($.trim($("#CBglx").val()) == ""){
			alert("请输入报告类型");
			return false;
		}
		if($.trim($("#pgjg").val()) == ""){
			alert("请输入评估机构");
			return false;
		}
		if($.trim($("#pgjzr").val()) == ""){
			alert("请输入评估基准日");
			return false;
		}
		if($.trim($("#pgzclb").val()) == ""){
			alert("请输入评估资产类别");
			return false;
		}
		if($.trim($("#pgmd").val()) == ""){
			alert("请输入评估目的");
			return false;
		}
	<%if(StringUtils.equals("draft",workflowVO.step)){%>
		if("<%=status%>"=="0" && !myWordState){
			alert("请先新建正文");
			return false;
		}
	<%}%>
    var czlb = jQuery("#assetList").getDataIDs();
    var count  = czlb.length;
    var czlb2 = jQuery("#entity_asset_list").getDataIDs();
	var count2 = czlb2.length;
    var czlb3 = jQuery("#loan_pledge_asset_list").getDataIDs();
	var count3 = czlb3.length;	
	var czlb4 = jQuery("#entityList").getDataIDs();
	var count4 = czlb4.length;	
	var czlb5 = jQuery("#debtList").getDataIDs();
	var count5 = czlb5.length;	
	var czlb6 = jQuery("#zyzc_asset_list").getDataIDs();
	var count6 = czlb6.length;		
	if(count <= 0 && count2 <= 0 && count3 <= 0 && count4 <= 0 && count5 <= 0 && count6 <= 0){
		alert("请选择评估资产！");
		return false;
	}
	
	<!--添加 编辑评估信息 控制-->
	if($("#pgzclb").val() == "0"){
		var gr = jQuery("#assetList").getDataIDs();
		for(var i=0;i<gr.length;i++){
			var	pingguzhi = $("#assetList").getCell(gr[i],"pingguzhi");
			var	pgffName  = $("#assetList").getCell(gr[i],"pgffName");
			var	czfsName  = $("#assetList").getCell(gr[i],"czfsName");
			var	jzlxName  = $("#assetList").getCell(gr[i],"jzlxName");
			var	jzrzmjz   = $("#assetList").getCell(gr[i],"jzrzmjz");
			
			if(pingguzhi=='' || pgffName =='' || czfsName=='' || jzlxName=='' || jzrzmjz==''){
				alert("请编辑评估信息");
				return false;
			}
		}
	}
		return true;
}
		
	/**
	beforeWorkFlowSubmit(arg1,arg2)
								arg1								arg2
	拟稿提交						processDefinitionKey 				outCome
	拟稿保存						"saveDraft"							""
	提交							taskId								outCome
	保存							"saveTodo"							""
	传阅							"circulation"						""
	**/
	function beforeWorkFlowSubmit(arg1,arg2){
		$("select").removeAttr("disabled");
		$("input").removeAttr("disabled");
		$("textarea").removeAttr("disabled");
		$("#pgzz").val(new Number($("#pgzzwy").val()));
		$("#zczmyz").val(new Number($("#zczmyzwy").val()));
		$("#zczmjz").val(new Number($("#zczmjzwy").val()));
		$("#zjz").val(new Number($("#zjzwy").val()));
		$("#jzrzmjz").val(new Number($("#jzrzmjzwy").val()));
		return true;
	}
</script>
</head>
<body>
<script type="text/javascript">
$.ajaxSetup({
	async : false
});
</script>
	<s:form id="myform" name="myform">
		<!-- 实体内资产 -->
		<div id="chooseEntity" style="width: 150px;display: none;" >
			<div onClick="selectComEntityAsset('0', '1');return false;" >咨询类实体</div>
			<div onClick="selectComEntityAsset('1', '1');return false;" >非咨询处置类实体</div>
			<div onClick="selectComEntityAsset('3', '1');return false;" >非咨询持续经营类实体</div>
		</div>
		<!-- 股权 -->
		<div id="chooseEntity2" style="width: 150px;display: none;" >
			<div onClick="selectComEntity('0', '3');return false;" >咨询类实体</div>
			<div onClick="selectComEntity('1', '3');return false;" >非咨询处置类实体</div>
			<div onClick="selectComEntity('3', '3');return false;" >非咨询持续经营类实体</div>
		</div>
	
	
<%if(isTitleShow){ %>	
		<div align="center">
			<span class="STYLE1">中国建银投资有限责任公司资产处置评估审查<%if(isInWorkflow){%>处理单<%}if(isInCounterSign){%>办理单<%}%></span>
		</div>
		<s:hidden name="headId" id="headId" value="%{#request.head.id}"></s:hidden>
		<!-- ==========================工作流信息项======================================= -->
<%
if(isInWorkflow){
%>
<input type="hidden" name="taskId" value="<%=workflowVO.taskId%>"/>
<input type="hidden" name="taskName" value="<%=workflowVO.taskName%>" />
<input type="hidden" name="outCome"/>
<input type="hidden" name="assignId"/>
<input type="hidden" name="url"/>
<input type="hidden" name="param"/>
<input type="hidden" name="sheetId" id="sheetId">
<input type="hidden" name="result"/>
<input type="hidden" name="todoUrl"/>
<input type="hidden" name="nextTodoUrl"/>
<input type="hidden" name="didUrl"/>
<input type="hidden" name="draftId" value="<%=draft.getId()%>"/>
<input type="hidden" name="pdk" id="pdk" value="<%=workflowVO.pdk%>"/>
<input type="hidden" name="piId" id="piId" value="<%=workflowVO.piId%>"/>
<input type="hidden" name="bizPiId" value="<%=workflowVO.piId%>"/>
<input type="hidden" name="dept_user"/>

<%
	//if(!(workflowVO.step.equals("draft"))){
%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%">
	<tr>
		<td>
			<div align="center">
				<br />
				当前环节：<%=workflowVO.getUnfinishCounterSignCount()>0?"办理进行中":workflowVO.taskName%>&nbsp;&nbsp;&nbsp;&nbsp;
				<%
					if(!(workflowVO.step.equals("draft"))){
				 %>
					处理人：<%=workflowVO.getAssign().getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<%} %>
				<a target="_blank" href="<%=request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_taskHisGraph.do?piId="%><%=workflowVO.getPiId()%>&pdk=<%=workflowVO.getPdk()%>">流程跟踪</a>
			</div>
		</td>
	</tr>
</table>
<%
	//}
}
%>
<%
if(isInCounterSign){
%>
  	<input type="hidden" name="didUrl"/>
  	<input type="hidden" name="contentSetType"/>
  	<input type="hidden" name="contentType"/>
  	<input type="hidden" name="pdName"/>
  	<input type="hidden" name="nextTaskUrl"/>
  	<input type="hidden" name="newParticipantTaskUrl"/>
  	
  	<input type="hidden" name="users"/>
  	<input type="hidden" name="outCome"/>
  	<input type="hidden" name="taskId" value="<%=taskId%>"/>
  	<input type="hidden" name="counterSignId" value="<%=counterSign.getTid()%>"/>
  	<input type="hidden" name="assignParticipantId" value="<%=assignParticipant.getTid()%>"/>
  	
  	<input type="hidden" name="assignId"/>
	<input type="hidden" name="url"/>
	<input type="hidden" name="param"/>
  	<input type="hidden" name="result"/>
  	
	<div align="center"><br/>
		办理部门：<%=dept.getDeptName()%>&nbsp;&nbsp;&nbsp;&nbsp;
		当前环节：<%=taskName%>&nbsp;&nbsp;&nbsp;&nbsp;
		处理人：<%=assignName%>
	</div>
<%
}
%>
<!-- =========================================================================== -->
<hr />
<%} %>
<s:hidden name="zixunType" id="zixunType" value="%{#request.zixunType}"/>
<s:hidden name="head.id" id="id" />
<s:hidden name="head.liuchengid" id="liuchengid" />
<s:hidden name="head.scsj" id="scsj" />
<s:hidden name="head.bccltjsj" id="bccltjsj" />
<s:hidden name="head.CScjl" id="CScjl" />
<s:hidden name="head.cldzt" id="cldzt" />
<s:hidden name="head.scsccldId" id="scsccldId" />
<s:hidden name="head.lcmc" id="lcmc" />
<s:hidden name="head.fblsj" id="fblsj" />
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:depthidden/>
<!-- 意见域、 依据和文件上传需要表单id -->
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<s:hidden id="strsel" name="strsel"/>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/dealEvalHead_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/dealEvalHead_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/dealEvalHead_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/dealEvalHead_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/dealEvalHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="head.id" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 办理单"/>
<input type="hidden" name="counterSignUrl" value="zccz/dealEvalHead_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<!-- 意见域、 依据和文件上传需要表单id -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<s:hidden name="jlxz" id="jlxz"/>
		
<!-- ------------------------------- 表头信息 --------------------------------- -->		
<table width="100%" border="0" class="newtable" cellpadding="2" cellspacing="0" align="center" id="conditions">
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font> 标 题：
		</td>
		<td class="td_zxy02" colspan="3">
			<r:textfield id="biaoti" name="head.biaoti" cssClass="input2"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			办理部门：
		</td>
		<td class="td_zxy02" colspan="3">
			<s:hidden id="blbmbh" name="head.blbmbh"/>
			<s:textfield id="blbm" name="head.blbm" cssClass="input2" readonly="true"/>
		
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			编号：
		</td>
		<td class="td_zxy02">
			<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true" />
		</td>
		<td class="td_zxy01">
			急缓程度：
		</td>
		<td class="td_zxy02">
			<e:select cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" id="jhcd" name="head.jhcd"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			拟稿人：
		</td>
		<td class="td_zxy02">
			<s:hidden id="nigaoren" name="head.nigaoren" />
			<s:textfield id="nigaorenxm" name="head.nigaorenxm" id="ngrmc" cssClass="input" readonly="true" />
		</td>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font> 联系电话：
		</td>
		<td class="td_zxy02">
			<r:textfield id="lxdh" name="head.lxdh" cssClass="input" />
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			拟稿日期：
		</td>
		<td class="td_zxy02">
			<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
		<td class="td_zxy01">
			拟稿部门：
		</td>
		<td class="td_zxy02">
			<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
			<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font>报告类型：
		</td>
		<td class="td_zxy02">
			<e:select id="CBglx" name="head.CBglx" cssClass="input" headerValue="--请选择--" headerKey="0" list="#{}" parRefKey="ESTIMATE_REPORT_TYPE" />
		</td>
		<td class="td_zxy01">
			历史审查次数：
		</td>
		<td class="td_zxy02">
			<r:textfield id="lssccs" name="head.lssccs" cssClass="input" readonly="true"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font>评估资产类别：
		</td>
		<td class="td_zxy02">
			<s:hidden id="prePgzclb" />
			<e:select cssClass="input" id="pgzclb" name="head.pgzclb" list="#{'0':'固定资产','1':'实体内资产','2':'委贷抵债物','3':'股权','4':'债权','5':'自用资产'}" cssClass="input" onchange="changeAssetList();"/>
		</td>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font> 评估基准日：
		</td>
		<td class="td_zxy02">
			<s:date var="pgjzr" name="head.pgjzr" format="yyyy-MM-dd"/>
		<%
			if(isInCounterSign || workflowVO.step.equals("did")){
		%>
			<s:textfield id="pgjzr" name="head.pgjzr" value="%{#pgjzr}" cssClass="input" disabled="true"/>
		<%} else{%>
			<s:textfield id="pgjzr" name="head.pgjzr" value="%{#pgjzr}" cssClass="input" readonly="true"/>
		<%} %>
		</td>
	</tr>			
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font>评估机构：
		</td>
		<td class="td_zxy02" colspan="3">
			<r:textfield id="pgjg" name="head.pgjg" cssClass="input2" />
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>* </strong></font> 评估目的：
		</td>
		<td colspan="3" class="td_zxy02">
			<r:textarea id="pgmd" rows="3" name="head.pgmd" cssClass="input2" />
		</td>
	</tr>	
          <tr>
                <td height="20" colspan="4" class="panel-header" style="text-align:center;">以下信息系统自动计算</td>
          </tr>		
	<tr>
		<td class="td_zxy01">账面原值(元)：</td>
		<td class="td_zxy02">
			<s:hidden id="zczmyz" name="head.zczmyz" />
			<r:textfield id="zczmyzwy" cssClass="input" readonly="true" />
		</td>
		<td class="td_zxy01">评估基准日账面价值(元)：</td>
		<td class="td_zxy02">
			<s:hidden id="jzrzmjz" name="head.jzrzmjz" />
			<r:textfield id="jzrzmjzwy" cssClass="input" readonly="true"/>
		</td>						
	</tr>
	<tr>
		<td class="td_zxy01">评估值(元)：</td>
		<td class="td_zxy02">
			<s:hidden id="pgzz" name="head.pgzz" />
			<r:textfield id="pgzzwy" cssClass="input" readonly="true"/>
		</td>
	<!-- 
		<td class="td_zxy01">账面价值(元)：</td>
		<td class="td_zxy02">
			<s:hidden id="zczmjz" name="head.zczmjz" />
			<r:textfield id="zczmjzwy" cssClass="input" readonly="true"/>
		</td>
	 -->
	 <td class="td_zxy01">评估增减值(元)：</td>
		<td class="td_zxy02">
			<s:hidden id="zjz" name="head.zjz" />
			<r:textfield id="zjzwy" cssClass="input" readonly="true" />
		</td>
	 		
	</tr>
	<tr>
		<td class="td_zxy01">&nbsp</td>
		<td class="td_zxy02">&nbsp;
			<s:hidden id="zjfd" name="head.zjfd" />
			<s:hidden  id="zjfdShow" cssClass="input" readonly="true"/>
		</td>
	<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;
			<s:hidden id="zczmjz" name="head.zczmjz" />
			<s:hidden id="zczmjzwy" cssClass="input" readonly="true"/>
		</td>
	</tr>		
</table>
		
<!-- ------------------------------- 表体信息 --------------------------------- -->	
<div class="list" style="display:block" id="fixed_asset">
	<table id="assetList"></table>
</div>
<div class="list" style="display:none" id="entity_asset">
	<table id="entity_asset_list"></table>
</div>
<div class="list" style="display:none" id="loan_pledge_asset">
	<table id="loan_pledge_asset_list"></table>
</div>
<div class="list" style="display:none" id="entityListDiv">
	<table id="entityList"></table>
</div>
<div class="list" style="display:none" id="debtListDiv">
	<table id="debtList"></table>
</div>
<div class="list" style="display:none" id="zyzcListDiv">
	<table id="zyzc_asset_list"></table>
</div>
<!-- ------------------------------- 办理依据 --------------------------------- -->	
<%@ include file="/inc/according.inc"%>
<!-- ------------------------------- 意 见 域 --------------------------------- -->		
<e:opinion id="test" width="100%">
	<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="办理部门意见："></e:opinionPart>
	<e:pc id="editScyj">
		<tr>
			<td class="td_zxy01" colspan="2" id="headButton" height="50"></td>
		</tr>
	</e:pc>
<%
	if(isInCounterSign || ishistory){
%>
		<tr>
			<td class="td_zxy01" norawp>最终意见：</td>
			<td class="td_zxy03">
<%
	boolean isDisplay = false;
	if(isDid==null||!(isDid.equals("yes"))){
		if(userType.equals("BMLD")){
			isDisplay = true;
%>
				<textarea name="finalContent" rows="4" style="background-color:#ffffff;width: 94%;" readonly="true" style= "BORDER-BOTTOM:   0px   solid;   BORDER-LEFT:   0px   solid;   BORDER-RIGHT:   0px   solid;   BORDER-TOP:   0px   solid; "></textarea>
<%
		}
	}
	for(int i=0;i<finalCommonOpinionVOList.size();i++){
		isDisplay = true;
		ETCommonOpinionVO vo = (ETCommonOpinionVO)finalCommonOpinionVOList.get(i);
		PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
		PTUserBO user = vo.getUserBO();
		//修改意见内容字符串中的换行
		String yjnr = "<pre>" + commonOpinionBO.getYjnr() + "</pre>";
%>
				<table cellspacing=0 cellpadding=0 width="100%">
					<tr height="20">
						<td align="left" norawp>&nbsp;&nbsp;<%=yjnr%></td>
					</tr>
					<tr height="20">
						<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr height="20">
						<td bgcolor="#E4F8F8" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table><br/><br/>
<%
	}
	if(!isDisplay){
%>
				<br/><br/><br/><br/><br/><br/>
<%
	}
%>
			</td>
		</tr>
		<tr>
			<td class="td_zxy01" norawp>过程意见：</td>
			<td class="td_zxy03">
<%
	isDisplay = false;
	if(isDid==null||!(isDid.equals("yes"))){
		isDisplay = true;
%>
				<textarea name="content"  rows="4" style="background-color:#ffffff;width: 94%;" readonly="true" style= "BORDER-BOTTOM:   0px   solid;   BORDER-LEFT:   0px   solid;   BORDER-RIGHT:   0px   solid;   BORDER-TOP:   0px   solid; "></textarea>
<%
	}
	for(int i=0;i<gcOpinionVOList.size();i++){
		isDisplay = true;
		ETCommonOpinionVO vo = (ETCommonOpinionVO)gcOpinionVOList.get(i);
		PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
		//修改意见内容字符串中的换行
		String yjnr = "<pre>" + commonOpinionBO.getYjnr() + "</pre>";
		PTUserBO user = vo.getUserBO();
%>
	  			<table cellspacing=0 cellpadding=0 width="100%">
					<tr height="20">
	  					<td align="left" norawp>&nbsp;&nbsp;<%=yjnr%></td>
	  				</tr>
	  				<tr height="20">
	  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  				</tr>
	  				<tr height="20">
						<td bgcolor="#E4F8F8" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
	  			</table><br/><br/>
<%
	}
	if(!isDisplay){
%>
				<br/><br/><br/><br/><br/><br/>
<%
	}
%>
			</td>
		</tr>
		<tr>
			<td class="td_zxy01" norawp>退回意见：</td>
			<td class="td_zxy03">
<%
	isDisplay = false;
	if(isDid==null||!(isDid.equals("yes"))){
		if(userType.equals("ZH")||userType.equals("BMLD")){
			isDisplay = true;
%>
				<textarea name="sendBackContent"  rows="4" style="background-color:#ffffff;width: 94%;" readonly="true" style= "BORDER-BOTTOM:   0px   solid;   BORDER-LEFT:   0px   solid;   BORDER-RIGHT:   0px   solid;   BORDER-TOP:   0px   solid; "></textarea>
<%
		}
		else{
			request.setAttribute("isDid","Y");//文件拖拽控制
		}
	}
	else{
		request.setAttribute("isDid","Y");//文件拖拽控制
	}
	for(int i=0;i<snedBackCommonOpinionVOList.size();i++){
		isDisplay = true;
		ETCommonOpinionVO vo = (ETCommonOpinionVO)snedBackCommonOpinionVOList.get(i);
		PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
		//修改意见内容字符串中的换行
		String yjnr = "<pre>" + commonOpinionBO.getYjnr() + "</pre>";
		PTUserBO user = vo.getUserBO();
%>
	  			<table cellspacing=0 cellpadding=0 width="100%">
					<tr height="20">
	  					<td align="left" norawp>&nbsp;&nbsp;<%=yjnr%></td>
	  				</tr>
	  				<tr height="20">
	  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  				</tr>
	  				<tr height="20">
						<td bgcolor="#E4F8F8" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
	  			</table><br/><br/>
<%
	}
	if(!isDisplay){
%>
	  			<br/><br/><br/><br/><br/><br/>
<%
	}
%>
			</td>
		</tr>
<%
	}
%>
	<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
</e:opinion>

<s:set name="biaodanid" value="%{#request.biaodanid}" scope="request"/>	 
<s:set name="type" scope="request">huiqian</s:set>

<%if(isInCounterSign || ishistory) {%>
	<%@ include file="/inc/file_bld.inc"%>
<%} %>
<%@ include file="/inc/file.inc"%>
<%if(isInWorkflow){%>
	<%@ include file="/inc/file_bld_end.inc"%>
<%} %>
</s:form>
		<!-- 提交按钮muneButton的下拉数据源 -->
		<div id="addToParent" style="display: none;">
		</div>
	</body>
</html>

<script type="text/javascript">
	function copyFile2FormNew(){
		var obj=document.getElementsByName("checkfile");
		var strsel = "";
		for (var i=0;i<=obj.length-1;i++){
			if (obj[i].checked){
				strsel = strsel +","+ obj[i].value;
			}
		}
		if(strsel==""){
		}else { //if(confirm('确定将过程附件转换为正式表单的附件?')) //不用提示
			var fileurl="/eam2/file/file_copyFile2Form.do?zzid=<%=counterSign==null?"":counterSign.getHeadId()%>&ids="+strsel;
			$.post(fileurl,{}, function(data){
				jQuery("#file_huiqianlist").trigger("reloadGrid");
			});
		}
	}
	
	function seehistory(){
		var scsccldId = document.getElementById("scsccldId").value;
		if(scsccldId == null || scsccldId == ""){
			alert("该处理单还没有历史记录");
			return false;
		}else{
			scsccldId = scsccldId + ",true";
			var url = "zccz/dealEvalHead_modifyHead.do?headId="+scsccldId;
			var openCardUrl = basePathJs + "zccz/index.do?urlPortal=" + url;
			window.open(openCardUrl,"","");
		}
	}
	
	function clearPanelTool(){
		//iframe 页面调用 window.parent.clearPanelTool();
		//无此方法会报js错误
	}
    function openTreeByType(){//打开树，根据类型打开类型  
		var url = basePathJs + "chooseHqbm.do?option=pgsc&multi=false&deptType=0&ids=" + document.getElementById("blbmbh").value;
		var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		//alert(url);
		window.open(url,'',_g_privateDialogFeatures);
    }
   	function getCallBack4Tree(ids,value){
		document.getElementById("blbm").value = value;
		document.getElementById("blbmbh").value = ids;
  	}
//-------------------------------------------------经营性固定资产------------------------------------------------------
//{name:'zczmjz',index:'zczmjz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}},
  	jQuery("#assetList").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"0"
		},
		colNames:['id','zcid','资产名称','资产所在省份','主卡片编号','资产种类','账面原值','评估基准日账面价值','评估值','评估增减值','评估增减幅度(%)','处置方式','评估方法','价值类型'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'zcid',index:'zcid',hidden:true},
			{name:'zcmc',index:'zcmc'},	
			{name:'sfmc',index:'sfmc'},
			{name:'zkpbh',index:'zkpbh'},
			{name:'zclb',index:'zclb'},
			{name:'zcybyz',index:'zcybyz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}},
			{name:'jzrzmjz',index:'jzrzmjz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}},
			{name:'pingguzhi',index:'pingguzhi',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}},
			{name:'zjz',index:'zjz',align:"right", formatter: 'number', formatoptions: {decimalPlaces: 2, defaultValue: "0.00"}},
			{name:'zjfdValue',index:'zjfdValue',align:"right", formatter: 'number',formatoptions:{suffix: "%"}},
			{name:'czfsName',index:'czfsName'},
			{name:'pgffName',index:'pgffName'},
			{name:'jzlxName',index:'jzlxName'}
		],
		ondblClickRow:function(gr){
			var zcid = jQuery("#assetList").getCell(gr,'zcid');
			lookAsset(zcid);
		},
		forceFit : true,
		multiselect:true,
		rowNum:0,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		viewrecords:true,
		caption: '固定资产信息列表（单位：元）',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		},
		loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#assetList").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#assetList").setGridHeight(0);
			}		
		},			
	shrinkToFit:false	
	});
	jQuery("#assetList").jqGrid('navGrid','#pagers2',{edit:false,add:false,del:false}); 
//--------------------------------------------------实体内资产------------------------------------------------------
	jQuery("#entity_asset_list").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_viewBodyList.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"1"
		},
		colNames:['id','实体Id','实体名称','资产编号','资产名称','资产类型', '实际占有人','存放位置','评估价值(元)','评估方法','评估基准日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'stid',index:'stid',hidden:true},
			{name:'stmc',index:'bstmc'},
			{name:'stzcbh',index:'bzcbh'},
			{name:'stzcmc',index:'bzcmc'},
			{name:'sttzclx',index:'bstzclx'},
			{name:'stsjzyr',index:'bsjzyr'},
			{name:'stcfwz',index:'bcfwz'},
			{name:'pingguzhi',index:'bpgz'},
			{name:'pgff',index:'pgff'},
			{name:'pgjzr',index:'pgjzr'}
		],
		height:'auto',
		autowidth:true,
		rowNum:0,
		multiselect: true,
		caption: '实体内资产信息列表（单位：元）',
		toolbar: [false,"top"],
		ondblClickRow:function(rowid){
			lookdblclickAss(rowid);
		},
		gridComplete: function(gr){
			var ids = $("#entity_asset_list").getDataIDs();
			for(var i=0;i<ids.length;i++){
				var gr=ids[i];
				var x ="";
				x= jQuery("#entity_asset_list").getCell(gr,'pgff');
					if(x=='1'){
					 x="市场法";
					}else if(x=='2'){
					 x="收益法";
					}else if(x=='3'){
					  x="成本法";
					}else if(x=='4'){
					 x="基准地价修正法";
					}else if(x=='5'){
					  x="假设开发法";
					}else if(x=='6'){
					 x="假设清算法";
					}else if(x=='7'){
					  x="剩余法";
					}else if(x=='8'){
					 x="成本逼近法";
					}else if(x=='9'){
					  x="其他";
					}
				jQuery("#entity_asset_list").jqGrid('setRowData',ids[i],{pgff:x});
        	}
     	},
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	function reloadGridwww(gr){
		$.post("<%=basePath%>zccz/dealEvalBody_saveBody.do",{
	 		 'id':''+gr,
	 		 'pgzclb':'1'
	 	},function(returnStr){
	 		jQuery("#entity_asset_list").setGridParam({
			}).trigger("reloadGrid");
			jQuery("#loan_pledge_asset_list").setGridParam({
			}).trigger("reloadGrid");
			reloadMessage("3");
	 	});
	}
//--------------------------------------------------委托贷款抵债物资产------------------------------------------------------
	jQuery("#loan_pledge_asset_list").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_viewBodyList.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"2"
		},
		colNames:['id','贷款账号','抵债物资产编号','抵债物资名称','抵债物资产类型', '抵债物资产实际占有人','存放位置','评估价值(元)','评估方法','评估基准日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'dkzh',index:'dkzh',hidden:true},
			{name:'czcbh',index:'czcbh'},
			{name:'czcmc',index:'czcmc'},
			{name:'czclx',index:'czclx'},
			{name:'csjzyr',index:'csjzyr'},
			{name:'stcfwz',index:'stcfwz'},
			{name:'pingguzhi',index:'pingguzhi'},
			{name:'pgff',index:'pgff'},
			{name:'pgjzr',index:'pgjzr'}
		],
		height:'auto',
		autowidth:true,
		rowNum:0,
		multiselect: true,
		caption: '委贷抵债物信息列表（单位：元）',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
//--------------------------------------------------股权（也就是实体）------------------------------------------------------		
	jQuery("#entityList").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"3"
		},
		colNames:['id','实体id','实体种类','实体名称','地区','管理部门','委托管理机构','基准日账面净资产值','评估值','评估增减值','评估增减幅度'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'gqstid',index:'gqstid',hidden:true},
			{name:'gqstzl',index:'gqstzl',hidden:true},
			{name:'gqstmc',index:'gqstmc',sortable:false},
			{name:'sfName',index:'sfName',sortable:false},
			{name:'stglbmName',index:'gqstglbm',sortable:false},
			{name:'gqstwtgljg',index:'gqstwtgljg',sortable:false},
			{name:'gqjzrjzcz',index:'gqjzrjzcz',formatter:"number",editable: true,sortable:false},
			{name:'pingguzhi',index:'pingguzhi',formatter:"currency",editable: true,sortable:false},
			{name:'zjz',index:'zjz',formatter:"number",sortable:false},
			{name:'zjfdValue',index:'zjfdValue',formatter:"number",
				 formatoptions:{decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaulValue: 0,suffix:"%"},sortable:false}
			],
		multiselect:true,
		rownumbers:true,
		rowNum:0,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption:'实体信息列表（单位：元）',
		ondblClickRow:function(rowid){
			lookdblclickAss1(rowid);
		},
		onSelectRow: function(id){
			jQuery('#entityList').jqGrid('editRow',id,true);
			$("#" + id + "_pingguzhi, #" + id + "_gqjzrjzcz").change(function(){
				jQuery('#entityList').jqGrid('saveRow',id,function(){
					reloadMessage("3");
					return true;
				});
			});
		},
		editurl:'<%=basePath %>zccz/dealEvalBody_updateBodyGqjzrjzcz.do',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
//--------------------------------------------------债权（也就是实体对建投债务）------------------------------------------------------		
	jQuery("#debtList").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"4"
		},
		colNames:['id','债权id','债权种类','债务人名称','购入债权余额','评估基准日账面债权值','评估值','评估增减值','评估增减幅度'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'zqid',index:'zqid',hidden:true},
			{name:'zqzlName',index:'zqzlName'},
			{name:'zwrmc',index:'zwrmc'},
			{name:'grzye',index:'grzye',formatter:"number"},
			{name:'pgjzrzmzqz',index:'pgjzrzmzqz',editable: true,formatter:"currency"},
			{name:'pingguzhi',index:'pingguzhi',formatter:"currency",editable: true,sortable:false},
			{name:'zjz',index:'zjz',formatter:"currency",sortable:false},
			{name:'zjfdValue',index:'zjfdValue',formatter:"currency",
				 formatoptions:{decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaulValue: 0,suffix:"%"},sortable:false}
			],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		rowNum:0,
		height:'auto',
		viewrecords:true,
		caption:'债权信息列表（单位：元）',
		ondblClickRow:function(rowid){
			//lookdblclickAss1(rowid);
		},
		onSelectRow: function(id){
			jQuery('#debtList').jqGrid('editRow',id,true);
			$("#" + id + "_pingguzhi, #" + id + "_pgjzrzmzqz").change(function(){
				jQuery('#debtList').jqGrid('saveRow',id,function(){
					reloadMessage("4");
					return true;
				});
			});
		},
		editurl:'<%=basePath %>zccz/dealEvalBody_updateBodyPgjzrzmzqz.do',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
//--------------------------------------------------自用资产------------------------------------------------------
		jQuery("#zyzc_asset_list").jqGrid({
			url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"${head.id }",
				assetType:"5"
			},
			colNames:['id','自用资产ID','资产编号','资产名称','卡片编号','卡片名称','财产原值','保管地点', '基准日账面价值','评估值','评估增减值','评估增减幅度(%)','处置方式','评估方法','价值类型'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'zyzcid',index:'zyzcid',hidden:true},
				{name:'zyzcbh',index:'zyzcbh',sortable:true},
				{name:'zyzcmc',index:'zyzcmc',sortable:true},
				{name:'zykpbh',index:'zykpbh',sortable:true,hidden:true},
				{name:'zykpmc',index:'zykpmc',sortable:true,hidden:true},
				{name:'zyccyzWy',index:'zyccyzWy',sortable:true},
				{name:'zybgdd',index:'zybgdd',sortable:true},
				{name:'jzrzmjz',index:'jzrzmjz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 2}},
				{name:'pingguzhi',index:'pingguzhi',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 2}},
				{name:'zjz',index:'zjz',align:"right", formatter: 'number', formatoptions: {decimalPlaces: 2}},
				{name:'zjfdValue',index:'zjfdValue',align:"right", formatter: 'number',formatoptions:{suffix: "%"}},
				{name:'czfsName',index:'czfsName'},
				{name:'pgffName',index:'pgffName'},
				{name:'jzlxName',index:'jzlxName'}				
			],
			ondblClickRow:function(gr){
				var id  = jQuery("#zyzc_asset_list").getCell(gr,'zyzcid');
				lookZyzc(id);
			},
			height:"auto",
			autowidth:true,
			multiselect: true,
			caption: '自用资产信息列表（单位：元）',
			rowNum:0,
			footerrow : false, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#zyzc_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#zyzc_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});		
</script>