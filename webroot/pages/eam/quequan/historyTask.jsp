<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.history.HistoryTask"%>
<%@ page language="java" import="org.jbpm.api.task.*"%>
<%@ page language="java" import="com.tansun.eam.quequan.vo.*"%>
<%@ page language="java" import="java.util.Set"%>
<%@ include file="/inc/taglibs.inc"%>

<%
HashMap history = (HashMap)request.getAttribute("history");
if(history==null){
	history = new HashMap();
}
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
  <body class='body1' >
    <table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr height="25">
					<th>流程跟踪<input type='button'  onclick='history.go(-1)' class='button1'  value='返回'>
					<input type='button' class='button1' onclick='window.close()' value='关闭'>
					</th>
				</tr>
				<tr>
					<td valign="top">
  	<table border="0" width="95%" class='table1' class="tabletitle" cellSpacing="1" cellPadding="1">
        <tr>
          <th>序号</th>
          <th>id</th>
          <th>环节名称</th>
          <th>处理人</th>
        </tr>
      	<%
      	
      		Iterator it = history.keySet().iterator();
      		int i=1;
      	      	      		while(it.hasNext()){
      	      	      			String key = (String)it.next();
      	      	      			TaskHistoryVo historyTask = (TaskHistoryVo)history.get(key);
      	%>
		<tr>
			<td><%=i%></td>
    		<td><%=historyTask.getTaskId()%></td>
    		<td><%=historyTask.getTaskName()%></td>
    		<td><%=historyTask.getUserName()%></td>
    	</tr>
    	<%
    	i++;
    	}
    	%>
	  
	</table>
	</td></tr></table>
	
  </body>
</html>
