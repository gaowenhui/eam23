<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int result = (Integer)request.getAttribute("result");
String msg = "";
if(result==0){
	msg = "任务收回成功！";
}
if(result==1){
	msg = "该任务已阅，无法收回！";
}
if(result==2||result==3){
	msg = "该任务不是可回收任务，无法收回！";
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
	<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/jquery-ui-1.8.1.custom.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.multiselect.css" />
	<link rel="stylesheet" type="text/css" href="../JQuery/themes/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../JQuery/themes/icon.css"/>
	<script type="text/javascript">
		function backto(){
			window.returnValue='true';
	  		window.close();
		}
	</script>
  </head>
  
  <body>
    <table cellspacing=0 cellpadding=0 width="100%" border=0>
    <%
    	if(result==0){
    %>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr align="center"><td><%=msg%></tr>
    	<tr><td><br></td></tr>
    	<tr><td align="center" width="100%"><input type="button" value="确定" onclick="backto()"/></td></tr>
    <% }else{%>
    	<tr><td><br></td></tr>
    	<tr><td><br></td></tr>
    	<tr align="center"><td><br><%=msg%></td></tr>
    	<tr><td><br></td></tr>
    	<tr><td align="center" width="100%"><input type="button" value="确定" onclick="window.close()"/></td></tr>
    <% }%>
    </table>
  </body>
</html>
