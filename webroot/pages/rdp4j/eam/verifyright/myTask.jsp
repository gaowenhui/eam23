<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.ProcessDefinition"%>
<%@ page language="java" import="org.jbpm.api.task.Task"%>
<%@ include file="/inc/taglibs.inc"%>
<%
List<Task> myTask = (List<Task>)request.getAttribute("myTask");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
	<table border="1" width="100%">
      <caption>待办任务</caption>
      <thead>
        <tr>
          <td>id</td>
          <td>名称</td>
          <td>时间</td>
        </tr>
      </thead>
      <tbody>
<%
	for (Task task : myTask) {
%>
	    <tr>
	      <td><a href="<%=path%><%=task.getFormResourceName()%>?taskId=<%=task.getId()%>"><%=task.getId() %></a></td>
	      <td><a href="<%=path%><%=task.getFormResourceName()%>?taskId=<%=task.getId()%>"><%=task.getName() %></a></td>
	      <td><%=task.getCreateTime()%></td>
	    </tr>
<%
	}
%>
	  </tbody>
	</table>
  </body>
</html>
