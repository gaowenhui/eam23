<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../inc/taglibs.inc"%>
<#escape x as ((x!)?html)!>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
		<title>角色增加</title>
		<%@ include file="../inc/header-standard.inc"%>
		<link href="../resource/css/maincss.css" rel="stylesheet" type="text/css">
		
	</head>
	<body class='body1'>
		<table align="center" cellspacing="1" cellpadding="1"	class="tabletitle">
			<tr height="25">
				<td class="formtitle">
					&nbsp;
					<img src='../resource/images/dots1.gif'>
					&nbsp;当前位置：新增角色
				</td>
			</tr>
			<tr>
				<td valign="top" align="center">
					<form action="role_addSub.do" method="post">
						<table   class='table1' cellspacing="1" cellpadding="1">
						
							<tr>
								<td width="33%" valign="top">
									角色名称 
									<input type="text" name="newRole.roleName" value="" vtype='' vmode='not null' />
									<br>
									角色描述
									<input type="text" name="newRole.roleDesc" value="" />
									<p>
										<input type="submit" name="submit" value="提交" class='button1' />
										<input type="button" name="button2" value="取消" class='button1'
											onclick='window.history.back(-1)' />
										<br>
								</td>
								

								<!-- 
								
								<td width="33%
									" valign="top">
									<table>
										<#list roleList2! as PTRoleBO>
										<tr>
											<td>
												<input type="checkbox" name="roleTid"
													value="${PTRoleBO.tid!}" />
											</td>
											<td>
												${PTRoleBO.roleName!}
											</td>
										</tr>
										</#list>
									</table>
								</td><td width="33%" valign="top">
									<table>
										<#list menulist! as TMenuBO>
										<tr>
											<td>
												<input type="checkbox" name="roleTid"
													value="${TMenuBO.menuid!}" />
											</td>
											<td>
												${TMenuBO.menuname!}
											</td>
										</tr>
										</#list>
									</table>
								</td> 
								
									<td width="34%" valign="top">
									<table>
										<#list functionList! as PTFunctionResBO>
										<tr>
											<td>
												<input type="checkbox" name="functionTid"
													value="${PTFunctionResBO.tid!}" />
											</td>
											<td>
												${PTFunctionResBO.modulename!}/${PTFunctionResBO.functionName!}
											</td>
										</tr>
										</#list>
									</table>
								</td>
								-->
							
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
</#escape>
