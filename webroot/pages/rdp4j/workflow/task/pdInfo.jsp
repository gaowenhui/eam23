<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.*"%>
<%@ page language="java" import="org.jbpm.api.history.*"%>
<%@ page language="java" import="java.text.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%
	ProcessDefinition pd = (ProcessDefinition)request.getAttribute("processDefinition");
	List<ProcessInstance> piList = (List<ProcessInstance>)request.getAttribute("piList");
	List<HistoryProcessInstance> hisPiList = (List<HistoryProcessInstance>)request.getAttribute("hisPiList");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>流程定义详细内容</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script>
		/**
			function delPD(deployId){
				if(confirm('删除流程定义同时将删除其下所有实例流程，确定要删除吗？')){
					f1.action = "processDefinition/processDefinition_delDeploy.do";
					f1.deployId.value = deployId;
					f1.submit();
				}
			}
			function toUpload(){
				f1.action = "processDefinition/processDefinition_toUpload.do";
				f1.submit();
			}
		**/
		</script>
	</head>

	<body class='body1'>
	<form name="f1" action="processDefinition/processDefinition_findPDList.do">
		<table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr>
					<th>流程定义</th>
				</tr>
				<tr>
					<td valign="top">
						<table class="table1" cellSpacing="1" cellPadding="1">
							<tr>
								<td nowrap>流程定义编号</td>
								<td nowrap><%=pd.getId()%></td>
							</tr>
							<tr>
								<td nowrap>流程定义名称</td>
								<td nowrap><%=pd.getName()%></td>
							</tr>
							<tr>
								<td nowrap>KEY</td>
								<td nowrap><%=pd.getKey()%></td>
							</tr>
							<tr>
								<td nowrap>版本</td>
								<td nowrap><%=pd.getVersion()%></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>未结束流程</th>
				</tr>
				<tr>
					<td valign="top">
						<table class="table1" cellSpacing="1" cellPadding="1">
							<tr>
								<th nowrap>序号</th>
								<th nowrap>编号</th>
								<th nowrap>名称</th>
								<th nowrap>KEY</th>
								<th nowrap>优先级</th>
								<th nowrap>父流程</th>
								<th nowrap>是否挂起</th>
							</tr>
<%
						int n = 1;
						for(ProcessInstance pi:piList){
%>
							<tr>
								<td nowrap><%=n%></td>
								<td nowrap><%=pi.getId()%></td>
								<td nowrap><%=pi.getName()!=null?pi.getName():""%></td>
								<td nowrap><%=pi.getKey()!=null?pi.getKey():""%></td>
								<td nowrap><%=pi.getPriority()%></td>
								<td nowrap><%=pi.getParent()!=null?pi.getParent().getId():""%></td>
								<td nowrap>
								<%if(pi.isSuspended()){%>挂起<%}else{%>正常<%}%>
								</td>
							</tr>
<%
							n++;
						}
%>
						</table>
					</td>
				</tr>
				<tr>
					<th>历史流程</th>
				</tr>
				<tr>
					<td valign="top">
						<table class="table1" cellSpacing="1" cellPadding="1">
							<tr>
								<th nowrap>序号</th>
								<th nowrap>编号</th>
								<th nowrap>KEY</th>
								<th nowrap>最终环节</th>
								<th nowrap>开始时间</th>
								<th nowrap>结束时间</th>
								<th nowrap>历时</th>
								<th nowrap>状态</th>
							</tr>
<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						n = 1;
						for(HistoryProcessInstance hisPi:hisPiList){
%>
							<tr>
								<td nowrap><%=n%></td>
								<td nowrap><%=hisPi.getProcessInstanceId()%></td>
								<td nowrap><%=hisPi.getKey()!=null?hisPi.getKey():""%></td>
								<td nowrap><%=hisPi.getEndActivityName()!=null?hisPi.getEndActivityName():""%></td>
								<td nowrap><%=sdf.format(hisPi.getStartTime())%></td>
								<td nowrap><%=hisPi.getEndTime()!=null?sdf.format(hisPi.getEndTime()):""%></td>
								<td nowrap><%=hisPi.getDuration()!=null?hisPi.getDuration():""%></td>
								<td nowrap><%=hisPi.getState()%></td>
							</tr>
<%
							n++;
						}
%>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</body>
</html>