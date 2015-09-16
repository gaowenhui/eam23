<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.task.*"%>
<%@ include file="/inc/taglibs.inc"%>

<%
List<Participation> pts = (List<Participation>)request.getAttribute("participations");
String taskId = (String)request.getAttribute("taskId");

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
	
	<link rel="stylesheet" type="text/css" href="resource/css/maincss.css">
	

  </head>
  
  <body class='body1'>
  
  <table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr height="25">
					<th>当前位置：选择处理人</th>
				</tr>
				<tr>
					<td valign="top">
  
  	<table border="0" width="100%" class='table1' cellSpacing="1" cellPadding="1">

     
      <thead>
        <%
    		for(int i=0;i<pts.size();i++){
    			Participation pt = (Participation)pts.get(i);
    			String strTid= (String)pt.getUserId();
    			request.setAttribute("strTid",strTid);
    	%>
    	<tr><td align="center"><a href="<%=path %>/quequan/quequan_assignTask.do?taskId=<%=taskId%>&choiceUser=<%=pt.getUserId()%>"><r:user userId="${strTid}"/><%=pt.getUserId()%></a></td></tr>
    	<%
    		}
    	%>
      </thead>
    </table>
    </td></tr></tbody></table>
  </body>
</html>
