<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.task.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%
String taskId = (String)request.getAttribute("taskId");
String outCome = (String)request.getAttribute("outCome");
String userName = (String)request.getAttribute("userName");
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
  <form action="task/task_joinTask.do">
  	<input type="hidden" name="taskId" value="<%=taskId%>"/>
  	<input type="hidden" name="outCome" value="<%=outCome%>"/>
  	<input type="hidden" name="userName" value="<%=userName%>"/>
  	<table border="1" width="100%">
      <caption>参与会签人员</caption>
      <thead>
        <tr><td align="center"><input type="checkbox" name="joinUser" value="会签人员1"/>会签人员1</td></tr>
    	<tr><td align="center"><input type="checkbox" name="joinUser" value="会签人员2"/>会签人员2</td></tr>
    	<tr><td align="center"><input type="checkbox" name="joinUser" value="会签人员3"/>会签人员3</td></tr>
    	<tr><td align="center"><input type="submit" value="提交"/></td></tr>
      </thead>
    </table>
  </form>
  </body>
</html>
