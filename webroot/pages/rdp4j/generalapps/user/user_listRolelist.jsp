<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户列表</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${request.contextPath}/resource/css/maincss.css" type="text/css">
		<script type="text/javascript" 	src="${request.contextPath}/resource/js/validate.js"></script>
	</head>
	<body class='body1'>
	<form id="myForm" name="myForm" method="post" action="">
			<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="${request.contextPath}/resource/images/dots1.gif"> 
						&nbsp;当前位置：&nbsp;用户分配角色 
					</td>
				</tr>
				<tr>
		<td valign="top" align="center">
  <table  class='table1' cellspacing="1" cellpadding="1">
  <tr>
  <th>登录编号</th>
  <th>用户名称</th>
  <th>编辑角色</th>
  </tr>
	<s:iterator value="userList">
		<tr>
		<td><s:property value="TUserBO.loginId"/></td>
			<td><s:property value="TUserBO.username"/></td>
			<td><a href="userRole_edit.do?tid=${TUserBO.tid!}&mid=${TUserBO.mid!}">用户角色编辑</a></td>
		</tr>
	</s:iterator>
  </table>
  </td></tr></table>				
</form>
</body>
</html>