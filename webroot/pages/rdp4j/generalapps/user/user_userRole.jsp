<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<#escape x as ((x!)?html)!>
<#include "../../common/paginator.html"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>userlist.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${request.contextPath}/resource/css/maincss.css" type="text/css">
  </head>
  
  <body class='body1'>
  
    
     	<table align="center" cellspacing="1" cellpadding="1" class="tabletitle">
	<tr height="25">
		<td class="formtitle">&nbsp;<img src="${request.contextPath}/resource/images/dots1.gif">&nbsp;当前位置：用户分配角色   </td>
	</tr>
	<tr>
		<td valign="top" align="center">
  
  <form action="userRole_editSub.do" method="post">
  
  <table class='table1' cellspacing="1" cellpadding="1" width="300">
  	
		<tr>
			<td width="200" valign="top">${userRoleVO.userName!}<input type="hidden" name="userId" value="#{userRoleVO.tid!}"/></td>
			<td>
				<table  >
						<#list UserRoleVO.userRoleList! as UserRolesListVO>
					<tr>
						<td><input type="checkbox" name="roleId" value='#{UserRolesListVO.tid!}' <#if UserRolesListVO.selected = true>checked</#if>  />
						</td>
						<td>${UserRolesListVO.roleName!}</td>
						<td>${UserRolesListVO.description!}</td>
					</tr>
					</#list>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" class='button1' value="保存">
			<input type="button" value="返回" class='button1' onclick='history.go(-1)' >
			</td>
		</tr>
  </table>
  
  
  </form></td></tr></table>
  </body>
</html>
</#escape>
