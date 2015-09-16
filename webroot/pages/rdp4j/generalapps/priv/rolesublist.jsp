<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<#escape x as ((x!)?html)!><#include "../../common/paginator.html"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>rolelist.html</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${request.contextPath}/resource/css/maincss.css" type="text/css">
	</head>
	<body class='body1' align=center>
		<form name='from1' id='from1' action='#'>
			<table class='table1' cellspacing="1" cellpadding="1">
							<tr>
								<th>
									角色编号
								</th>
								<th>
									角色名称
								</th>
								<th>
									角色描述
								</th>
								<th>
									操作
								</th>
							</tr>
							<#list roleList.results! as PTRoleBO>
							<tr>
								<td>
									${PTRoleBO.tid!}
								</td>
								<td>
									${PTRoleBO.roleName!}
								</td>
								<td>
									${PTRoleBO.roleDesc!}
								</td>
								<td>
									<a href="role_edit.do?tid=${PTRoleBO.tid!}&mid=${PTRoleBO.mid!}" target='_parent'>编辑</a>
									<a href="role_deleterole.do?tid=${PTRoleBO.tid!}&mid=${PTRoleBO.mid!}" target='_blank'>删除</a>
									
									<a href="#" onclick='window.open("/rdp4j/funcgroup/funcgroup_checkboxtree.do?tid=${PTRoleBO.tid!}","_blank","width=400,height=400,left="+screen.width/2+",top="+screen.height/4+",scrollbars=yes")'  >查看编辑权限</a>
								</td>
							</tr>
							</#list>
						</table>
						<@showPageField actionAndMethod="role_list" pageableList=roleList 	pagebleListName="roleList" />
		</form>
	</body>
</html>
</#escape>