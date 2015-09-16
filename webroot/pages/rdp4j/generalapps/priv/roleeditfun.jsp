<%@ page language="java" pageEncoding="UTF-8"%>
<#escape x as ((x!)?html)!>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>roleeditfun.jsp</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="../resource/css/maincss.css" type="text/css">
  </head>
  
  <body>
  
     	<table align="center" cellspacing="1" cellpadding="1" class="tabletitle">
	<tr height="25">
		<td class="formtitle">&nbsp;<img src="../resource/images/dots1.gif">&nbsp;当前位置：编辑角色 
		角色名称<input type="text" name="oldRole.roleName" value=""/>	角色描述<input type="text" name="oldRole.description" value="${roleVo.description!}"/><p>
		
		<input type="hidden" name="oldRole.tid" value="${roleVo.tid!}"/>
	    			<input type="submit" name="button" value="提交" class='button1' />
		  </td>
	</tr>
	<tr>
		<td valign="top" align="center">
		
	  <form action="role_editSub.do" method="post">
	    <table width="100%">
	    	<tr>
	    		<td width="33%" valign="top">
	    			<table>
	    			<#list roleVo.linkRoleList! as vo>
	    				<tr>
	    					<td><input type="checkbox" name="roleTid" value="${vo.tid!}" <#if vo.selected = true>checked</#if> <#if vo.enable = false>disabled</#if>/></td>
	    					<td>${vo.roleName!}_${vo.tid!}</td>
	    				</tr>
	    			</#list>
	    			</table>  
	    		</td>
	    		<td width="34%" valign="top">
	    			<table>
	    			<#list roleVo.linkFunList! as PTFunctionResBO>
	    				<tr>
	    					<td><input type="checkbox" name="functionId" value="${PTFunctionResBO.tid!}" /></td>
	    					<td>${PTFunctionResBO.module!}/${PTFunctionResBO.functionName!}</td>
	    				</tr>
	    			</#list>
	    			</table>
	    		</td>
	    	</tr>
	    </table>
	  </form>  
	  </td></tr></table>
  </body>
</html>
</#escape>