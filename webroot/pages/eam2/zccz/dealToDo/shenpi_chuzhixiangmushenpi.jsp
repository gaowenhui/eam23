<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String headId = (String)request.getAttribute("headId");
	String hyId = (String)request.getParameter("hyId");
	if(StringUtils.isEmpty(hyId))
	hyId = (String)request.getAttribute("hyId");
	//String spwyId = (String)request.getAttribute("spwyId");
	
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
<head>
<title>处置项目审批</title>
<script>
var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
<!--========================添加工作流按钮==========================================-->
	$(function(){
<%
	saveBtnDisplay = false;
	if(isInWorkflow){
%>	
		window.parent.clearPanelTool();
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
<%}%>		
		var buttonJSonString = '[{"buttonHandler":"submitYj","buttonIcon":"icon-add","buttonText":"提交或查看意见"}]';
		addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
	});

<!--==============================================================================-->
		function commitWorkflow(taskId,outCome){
<%
			if(workflowVO.taskName.equals("主持人审批")){
%>
				if(outCome=="整理会议纪要"){
					var datas = jQuery("#purchaselist").getDataIDs();
					var flag = "1";//主持人提交完毕
					var count = datas.length;
					for(var i = 0 ;i < count; i++){
						var rowData = jQuery("#purchaselist").jqGrid("getRowData",datas[i]);
						if(rowData.sftjspyj == "否"){
							flag = "0";//主持人有没有提交的项目
						}
					}
					if(flag == "0"){
						alert("您有没审核的项目，请先审核！");
						return false;
					}
					if(confirm('确定要提交'+outCome+'吗？')){
						document.myform.result.value = 'commitHuiZongYiJian';
						document.myform.action = "<%=request.getContextPath()%>/zccz/dealToDo_submitHyxx.do";
						document.myform.nextTodoUrl.value = "zcczshWorkflow/zcczshWorkflow_todo.do";
						document.myform.didUrl.value = "zcczshWorkflow/zcczshWorkflow_did.do";
						document.myform.taskId.value = taskId;
						document.myform.outCome.value = outCome;
						document.myform.submit();
						return false;
					}
					return false;
				}
				return true;
<%
			}
			if(workflowVO.taskName.equals("汇总意见中")){
%>
				document.getElementById("commitNextTodoUrl").value = "zcczshWorkflow/zcczshWorkflow_todo.do";
				return true;
<%
			}
%>
			return true;
		}
		
		function submitYj(){
			var xmId = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
			if(xmId.length < 1){
				alert("请选择一个项目");
			}else if(xmId.length > 1){
				alert("只能选择一个项目");
			}else{
				window.open('<%=basePath %>zccz/appAdviceAction_adviceForm.do' 
					+ '?czXmSpwYj.xmId=' + xmId
					+ '&todoId=${todoId}','','');
			}
		}
		
		function reloadGrid(){
			jQuery("#purchaselist").trigger("reloadGrid");
		}
</script>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zcczshWorkflow";
	actionPath = "zcczshWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
</head>
<body >
<s:form action="" theme="simple" name="myform">
<br/>
<div align="center">
	<span class="STYLE7 STYLE1">处置项目审批</span>
</div>
<s:hidden id="todoId" name="todoId" value="%{#request.todoId}" />
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
	
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_submitHyxx.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_modifyMeeting"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_modifyMeeting"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader+"did.do"%>"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<input type="hidden" id="renYuanOutCome" name="renYuanOutCome" value="汇总审批意见"/>
<input type="hidden" id="renYuanNextTodoUrl" name="renYuanNextTodoUrl" value="zcczperWorkflow/zcczperWorkflow_shTodo.do"/>
<input type="hidden" id="renYuanDidUrl" name="renYuanDidUrl" value="zcczperWorkflow/zcczperWorkflow_hyzzDid.do"/>
<input type="hidden" id="ziChanOutCome" name="ziChanOutCome" value="汇总审批意见"/>
<input type="hidden" id="ziChanNextTodoUrl" name="ziChanNextTodoUrl" value="zcczassetWorkflow/zcczassetWorkflow_shTodo.do"/>
<input type="hidden" id="ziChanDidUrl" name="ziChanDidUrl" value="zcczassetWorkflow/zcczassetWorkflow_hyzzDid.do"/>
<input type="hidden" id="shiTiOutCome" name="shiTiOutCome" value="汇总审批意见"/>
<input type="hidden" id="shiTiNextTodoUrl" name="shiTiNextTodoUrl" value="zcczWorkflow/zcczWorkflow_hzspyjTodo.do"/>
<input type="hidden" id="shiTiDidUrl" name="shiTiDidUrl" value="zcczWorkflow/zcczWorkflow_hyzzDid.do"/>
<input type="hidden" id="cjtzOutCome" name="cjtzOutCome" value="汇总审批意见"/>
<input type="hidden" id="cjtzNextTodoUrl" name="cjtzNextTodoUrl" value="cjtzWorkflow/cjtzspWorkflow_hzspyjTodo.do"/>
<input type="hidden" id="cjtzDidUrl" name="cjtzDidUrl" value="cjtzWorkflow/cjtzspWorkflow_hyzzDid.do"/>
<s:hidden name="hyxx.hyjyzlr"/>
<s:hidden name="hyxx.hyjyzlrbmid" />
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="采购会签办理单"/>
<input type="hidden" name="counterSignUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do?headId=<%=headId%>"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<s:hidden name="hyxx.id"/>
<hr color="#6600CC" align="center" width="100%" />
<table id="tableWidth" width="100%" border="0" align="center" cellspacing="0">
  	<tr>
    	<td>
    	
<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
 	<tr>
		<td align="left" class="td_zxy01">审批时间：</td>
		<td class="td_zxy02">
			<s:textfield name="hyxx.spsj" theme="simple" cssClass="input" disabled="true"/>
		</td>
		<td align="left"  class="td_zxy01">会议次数：</td>
		<td class="td_zxy02">
			<s:textfield name="hyxx.hycs" theme="simple" cssClass="input" disabled="true"/>
		</td>
	</tr>
	<table id="purchaselist"> </table>
		<div id="pgtoolbar1"></div>
</table>
</td>
</tr>
</table>
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:"<%=basePath %>zccz/dealToDo_getCzxm4Sp.do?hyId=<%=hyId %>",
	datatype: "json",
	mtype:"POST",
   	colNames:['id','项目名称','是否提交'],
	colModel:[
		{name:'id',index:'id',align:"center",hidden:true},
		{name:'czxmmc',index:'theme'},
		{name:'sftjspyj',index:'tache'}
		],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	rowNum:0,
	viewrecords:true,
	caption: '项目信息',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
$(window).bind('resize', function(){
	jQuery("#purchaselist").setGridWidth($("#items").width());
});
</script>
