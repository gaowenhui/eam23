<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.*"%>
<%@ page language="java" import="java.text.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%
	List<ProcessDefinition> pdList = (List<ProcessDefinition>)request.getAttribute("pdList");
	Map<String,Deployment> deployMap = (Map<String,Deployment>)request.getAttribute("deployMap");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>流程定义查询列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script>
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
		</script>
	</head>

	<body class='body1'>
	<form name="f1" action="processDefinition/processDefinition_findPDList.do">
		<table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr height="25">
					<th>当前位置：流程定义查询</th>
				</tr>
				<tr>
					<td valign="top">
						<table class="table1" cellSpacing="1" cellPadding="1">
							<tr>
								<th nowrap><br></th>
								<th nowrap><input class="text1" type="text" name="deployId" value="<s:property value="deployId"/>"/></th>
								<th nowrap><br></th>
								<th nowrap><br></th>
								<th nowrap><input class="text1" type="text" name="pdId" value="<s:property value="pdId"/>"/></th>
								<th nowrap><input class="text1" type="text" name="pdName" value="<s:property value="pdName"/>"/></th>
								<th nowrap><input class="text1" type="text" name="pdk" value="<s:property value="pdk"/>"/></th>
								<th nowrap colspan="5"><input class="button1" type="submit" value="查询"/></th>
							</tr>
							<tr>
								<th nowrap>序号</th>
								<th nowrap>部署编号</th>
								<th nowrap>部署名称</th>
								<th nowrap>部署时间</th>
								<th nowrap>流程定义编号</th>
								<th nowrap>流程定义名称</th>
								<th nowrap>key</th>
								<th nowrap>版本号</th>
								<th nowrap>描述</th>
								<th nowrap>状态</th>
								<th nowrap>操作</th>
							</tr>
<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						int n = 1;
						for(ProcessDefinition pd:pdList){
%>
							<tr>
								<td nowrap><%=n%></td>
								<td nowrap><%=pd.getDeploymentId()%></td>
<%
								Deployment deployment = deployMap.get(pd.getDeploymentId());
%>
								<td nowrap><%=deployment.getName()!=null?deployment.getName():""%></td>
								<td nowrap><%=sdf.format(new Date(deployment.getTimestamp()))%></td>
								<td nowrap><%=pd.getId()%></td>
								<td nowrap><a target="_blank" href="processDefinition/processDefinition_getPDInfo.do?pdId=<%=pd.getId()%>"><%=pd.getName()%></a></td>
								<td nowrap><%=pd.getKey()%></td>
								<td nowrap><%=pd.getVersion()%></td>
								<td><%=pd.getDescription()!=null?pd.getDescription().length()>30?pd.getDescription().substring(0,29)+"&nbsp;&nbsp;<a href=''>>>></a>":pd.getDescription():""%></td>
								<td nowrap>
								<%if(pd.isSuspended()){%>挂起<%}else{%>正常<%}%>
								</td>
								<td nowrap><input type="button" value="删除" onclick="delPD('<%=deployment.getId()%>')"></td>
							</tr>
<%
							n++;
						}
%>
						</table>
					</td>
				</tr>
				<tr><td nowrap colspan="7" align="center"><input class="button1" type="button" value="部署新流程" onclick="toUpload()"/></td></tr>
			</tbody>
		</table>
	</form>
	</body>
</html>