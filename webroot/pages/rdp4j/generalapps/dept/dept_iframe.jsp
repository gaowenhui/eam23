<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/inc/header-standard.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>选择用户</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/maincss.css" type="text/css">
	</head>
	<body>
		<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
				<tr height="25">
					<td class="formtitle" colspan="2">
						<img
							src="<%=request.getContextPath()%>/resource/images/dots1.gif">
						&nbsp;当前位置：选择用户
					</td>
				</tr>
				<tr>
				<td width="35%">
				<iframe frameBorder="0" name="deptTree" scrolling="auto"
							src="<%=request.getContextPath()%>/dept/dept_toTreeAssign.do?userList=${userList}&deptList=${deptList}&roleList=${roleList}"
							style="VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 420pt; Z-INDEX: 1"
							align="left"></iframe>
				</td>
				<td width="65%">
				<iframe frameBorder="0" name="userTree" scrolling="auto"
							src="<%=request.getContextPath()%>/dept/dept_getUserByRoleAndDepId.do?deptId=${deptId}&userId=${userId}&userList=${userList}&deptList=${deptList}&roleList=${roleList}"
							style="VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 420pt; Z-INDEX: 1"
							align="left"></iframe>
				</td>
				
				
				</tr>
				</table>
		
	</body>
</html>