<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<body class='body1'>
	<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
		<tr height="25">
			<td class="formtitle" colspan='2'>
				&nbsp;
				<img src="<%=path%>/resource/images/dots1.gif">	&nbsp;当前位置：[${roleVo.description}]角色用户列表
			</td>
		</tr>
		<tr><td valign=top>
				<table class='table1' cellspacing="1" cellpadding="1">
				<tr>
				<td valign="top"    align='left' >
			角色名称${roleVo.roleName}<br>
			角色描述${roleVo.description}
			</td>
			<td valign="top" >
				<table>
					<tr>
						<td>
							用户编号
						</td>
						<td>
							用户登录ID
						</td>
						<td>
							用户描述
						</td>
					</tr>
					<s:iterator value="#request.userList" status="ll" id="user">
					
					
						<tr>
							<td>
								<s:property value="#user.tid" />
							</td>
							<td>
								<s:property value="#user.loginId" />
							</td>
							<td>
								<s:property value="#user.username" />
							</td>
						</tr>
					</s:iterator>
					<tr>
					<td >
							<input type='button' class='button1' onclick='window.history.go(-1)' value='返回'>
						</td>
					</tr>
					</table>
						
					</tr>
					
				</table>
				
			</td>
		</tr>
	</table>
</body>