<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/rdp4j-tags" prefix="r"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>资产管理系统首页面</title>
	<%@ include file="/inc/header-standard.inc"%>
  </head>

  <body>
  	<s:if test="#session.user != null">
    
  		<jsp:forward page="/pages/eam2/index/mainpage.jsp" /> 
  	</s:if>
  	<s:else>
  		<jsp:forward page="/pages/eam2/index/login.jsp" /> 
  	</s:else>
  </body>
</html>
