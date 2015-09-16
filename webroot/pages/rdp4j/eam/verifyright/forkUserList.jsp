<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="org.jbpm.api.task.Task"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%
String taskId = (String)request.getAttribute("taskId");
String outCome = (String)request.getAttribute("outCome");
String content = (String)request.getAttribute("content");
List<PTUserBO> userList = (List<PTUserBO>)request.getAttribute("userList");
List<PTUserBO> leaderList = (List<PTUserBO>)request.getAttribute("leaderList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/resource/css/maincss.css"
			type="text/css">
		<title>Insert title here</title>
	</head>
	<body class="body1">
		<form name="myForm" method="post" action="/rdp4j/verifyjoin/verifyjoin_startForkTask.do">
			<input type="hidden" name="taskId" value="<%=taskId%>">
			<input type="hidden" name="outCome" value="<%=outCome%>">
			<input type="hidden" name="content" value="<%=content%>">
			<table class='tabletitle' cellspacing=1 cellpadding=1>
				<tr>
					<td colspan="2">部门领导列表</td>
				</tr>
					<%
						for(PTUserBO leader:leaderList){
					%>
				<tr><td><input type="radio" name="leaderId" value="<%=leader.getTid()%>"/></td><td><%=leader.getUsername()%></td></tr>
					<%
						}
					%>
				<tr>
					<td colspan="2">会签经办列表</td>
				</tr>
				<%
						for(PTUserBO user:userList){
					%>
				<tr><td><input type="checkbox" name="userList" value="<%=user.getTid()%>"/></td><td><%=user.getUsername()%></td></tr>
					<%
						}
					%>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="确定"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>