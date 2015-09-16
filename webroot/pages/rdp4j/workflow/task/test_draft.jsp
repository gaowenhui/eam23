<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="org.jbpm.api.task.Task"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>

<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

<%
List<String> outComes = (List<String>)request.getAttribute("outComes");
String processDefinitionKey = (String)request.getAttribute("processDefinitionKey");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/maincss.css" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
		<title>Insert title here</title>
		<style type="text/css">
			.container {
				width: 100px;
			}
			
			.container div {
				width: 100px;
				background: #CCCCCC;
				line-height: 30px;
				border: 1px solid #000000;
			}
			
			.on {
				font-weight: bold;
			}
			
			.container2 {
				width: 100px;
				text-align: center;
			}
			
			.container2 div {
				width: 100px;
				line-height: 30px;
			}
			
			.container2 a {
				text-decoration: none;
				display: block;
				border: 1px solid #d4d4d3;
				background: #e6e6e6;
				color: #000000;
			}
			
			.container2 .on a {
				background: #ffebac;
				color: #982e00;
				border-color: #ffb200;
			}
			
			#idMenu2 {
				clear: both;
				width: auto;
			}
			
			#idMenu2 div {
				float: left;
			}
			
			#idMenu2_6 a {
				background-color: red;
				border-color: red;
				color: #ffb200;
			}
		</style>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
		<script type="text/javascript">
			function choiceUser(processDefinitionKey,outCome){
				var result = window.showModalDialog("<%=request.getContextPath()%>/wf_draft/wf_draft_getParticipationList.do?processDefinitionKey="+processDefinitionKey+"&outCome="+outCome+"&multiple=false","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
				if(typeof(result)!='undefined'){
					//document.myForm.processDefinitionName.value = processDefinitionName;
					document.myForm.outCome.value = outCome;
					document.myForm.nextUserId.value = result;
					document.myForm.submit();
				}
			}
			window.onload=function(){
			var menu2 = [
				{'txt': '<input type="button" class="button1" value="提交">', 'position': 'down', 'menu': [
			<%	
				boolean first = true;
				for(String outCome : outComes){
					if(first){
						first=false;
					}
					else{%>,<%}%>{'txt': '<a href="javascript:commitDraft(&quot;<%=processDefinitionKey%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></a>'}
			<%
				}
			%>
					]}
				];
				var container2=["idMenu2"];
				var cs2 = new CascadeMenu(container2, menu2, { Delay: 200, onClass: "on" });
			}
			
			function commitDraft(processDefinitionKey,outCome){
				var result = window.showModalDialog("<%=request.getContextPath()%>/wf_draft/wf_draft_getParticipationList.do?processDefinitionKey="+processDefinitionKey+"&outCome="+outCome+"&multiple=false","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
				if(typeof(result)!='undefined'){
					jQuery.post("<%=request.getContextPath()%>/draft/userDraft_draftCommit.do",{
//========================================================只要修改下面参数的值就行了,其它的不要动=========================================================================================================================================
						"draftCommitVo.headId"			:	"headId001",			//处理单Id
						"draftCommitVo.sheetId"         :	"sheetId001",			//处理单编号
						"draftCommitVo.title"           :	"title",                //处理单标题
						"draftCommitVo.draftUserId"     :	"${currentUserId}",     //拟稿用户Id
						"draftCommitVo.draftDate"       :	"2001-09-09 12:12:12",  //拟稿日期
						"draftCommitVo.procInstKey"     :	processDefinitionKey,   //流程定义的Key,这个参数必须提前设置在request中,如:request.setAttribute("processDefinitionKey","确权主流程");其中processDefinitionKey不要修改.
						"draftCommitVo.subSystem"       :	"01",                   //所属子系统
						"draftCommitVo.nextStep"        :	outCome,                //下一环节,这个参数不要修改改,就写outCome就行了,也不要打引号.但是候选的outComes必须设置在request中.名字不要修改.就写request.setAttribute("outComes",outComes);其中outComes可以调用平台接口获得
						"draftCommitVo.toDoUrl"         :	"todoUrl",              //生成待办后访问待办用的URL
						"draftCommitVo.didUrl"          :	"didUrl",               //生成已办后访问已办用的URL
						"draftCommitVo.draftUrl"        :	"draftUrl",             //生成草稿后访问用的URL
						"draftCommitVo.nextNodeUserId"  :	result,                 //这个参数是下一个环节的办理人,不要修改,就写result就行了
						"draftCommitVo.currentUserId"   :	"${currentUserId}",     //当前用户Id,一般情况下和拟稿人都是是当前系统登录用户
						"draftCommitVo.headType"	    :	"01"                    //处理单类型
//=================================================================================================================================================================================================================================						
					},function(returnStr){
						//alert(processDefinitionKey + "^_^,提交成功啦!");
						//window.location = "#";
					});
				}
			}
			//发送传阅
			function sendMessage(){
				var result = window.showModalDialog("<%=request.getContextPath()%>/workflow/workflow_getParticipationList2.do?multiple=true","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
				if(typeof(result)!='undefined'){
					jQuery.post("<%=request.getContextPath()%>/message/userMessage_flowProc.do",{
//========================================只要修改下面参数的值就行了,其它的不要动=========================================================================================================================================					
						userIds			:	result,					//传阅接收人字符串,逗号分割.这个参数已经实现,不需要修改.
						message			:	"message",				//传阅信息
						messageUrl		:	"messageUrl",			//查看传阅URL,查看的时候会在url后面自动加上messageId=XXXX
						currentUserId	:	"${currentUserId}"		//发送传阅的用户Id
//=================================================================================================================================================================================================================================						
					},function(){
						alert("^_^,发送成功啦!");
					});
				}
			}
			
			function saveDraft(){
				jQuery.post("<%=request.getContextPath()%>/draft/userDraft_saveAsDraft.do",{
//=================================================只要修改下面参数的值就行了,其它的不要动=========================================================================================================================================				
						"draft.userId"			:	"${currentUserId}",		//草稿所属用户ID
						"draft.headType"		:	"01",					//处理单类型
						"draft.headId"			:	"123123",				//处理单Id
						"draft.title"			:	"title",				//处理单标题
						"draft.url"				:	"url",					//草稿访问URL
						"draft.draftDate"		:	"2010-01-01 10:10:10",	//拟稿日期
						"draft.subsystem"		:	"01"					//所属子系统
//=================================================================================================================================================================================================================================						
					},function(draftId){
						alert("^_^,保存成功啦!");
					});
			}
		</script>
		<base href="<%=basePath %>">
	</head>
	<body class="body1">
		<form name="myForm" method="post" action="<%=request.getContextPath()%>/test/test_draftCommit.do">
		
			<input type="hidden" name="processDefinitionKey" value="${processDefinitionKey}">
			<!-- 提交草稿参数 -->
			<input type="hidden" name="outCome" value="">
			<input type="hidden" id="nextUserId" name="nextUserId" value="">
			<input type="hidden" id="currentUserId" name="currentUserId" value="${currentUserId }">
			<!-- 传阅参数 -->
			<table class='tabletitle' cellspacing=1 cellpadding=1>
				<tr>
					<td></td>
					<td align="center">
						<div id="idMenu2" class="container2"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<br>
						<br>
						<div align="center">
							<span class="STYLE7 STYLE1">确权办理单</span>
						</div>
						<br>
						<div align="center">
							<br />
							<input type="button" value="保存" onclick="saveDraft();return false;"/>
							<input type="button" value="传阅" onclick="sendMessage();return false;">
							&nbsp;&nbsp;&nbsp;&nbsp;当前环节：拟稿&nbsp;&nbsp;&nbsp;&nbsp;处理人：<r:user userId="${currentUserId }"/><%=request.getAttribute("currentUserId")%></div>
						<hr color="#6600CC" align="center" width="100%">
					</td>
				</tr>
			</table>

			<table class='tabletitle' cellspacing=1 cellpadding=1>
				<tr><td colspan="2">
				</td></tr>
				<tr>
					<td height="63">意见:</td>
					<td>
						<textarea name="content" cols="150" rows="4"
							style="background-color: #CCCCCC"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>