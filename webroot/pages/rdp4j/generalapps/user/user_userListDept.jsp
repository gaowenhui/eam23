<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<body class='body1'>
	<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
		<tr height="25">
			<td class="formtitle" colspan='2'>
				&nbsp;
				<img src="<%=path%>/resource/images/dots1.gif">	&nbsp;当前位置:&nbsp;用户部门列表
			</td>
		</tr>
		<tr><td valign=top >
				<table class='table1' cellspacing="1" cellpadding="1">
				<tr>
				<td valign="top" align='left' width="20%">
			       用户名称:&nbsp; ${userName}
			</td>
			
			<td valign="top" width="30%">
				<table  class='table1' cellspacing="1" cellpadding="1">
					<tr>
						<th>
							部门名称
						</th>
						<th>
							部门编码
						</th>
					</tr>
					<s:iterator value="deptList" status="ll" id="dept">
						<tr>
							<td>
								<s:property value="deptName" />
							</td>
							<td>
								<s:property value="deptCode" />
							</td>
						</tr>
					</s:iterator>
					<tr>
					<td  colspan="2">
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