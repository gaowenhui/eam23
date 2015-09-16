<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>请选择要参与会签的部门</title>
		<Script>
		function checkAll(value){
			var roleids=document.getElementsByName("tids");
			for(i=0;i<roleids.length;i++){
				roleids[i].checked=value;
			}
		}
</Script>
	</head>
	<body>
	<body class='body1'>
		<form id="myForm" name="myForm" method="post"
			action="<%=request.getContextPath()%>/countersign/startcountersign_start.do">
			<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
						&nbsp;当前位置：会签选择部门列表
					</td>
				</tr>
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
						&nbsp;父流程编号:
						<s:property value="bIZ_PIID" />
						单据类型:
						<s:property value="sHEET_TYPE" />
						单据ID:
						<s:property value="sHEETID" />
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
						<table cellpadding=1 cellspacing=1 class="table1" align=center>
							<tr>
								<td width='25%' colspan=2>
								</td>
							</tr>
						</table>

						<table cellpadding=1 cellspacing=1 class="table1" align=center>
							<tr>
								<td align="center">
									<input type="checkbox" name="cheeck"
										onclick="checkAll(this.checked);" />
									全选
								</td>
								<td align="center">
									序号
								</td>
								<td align="center">
									部门ID
								</td>
								<td>
									部门名称
								</td>
								<td>
									综合员ID
								</td>
								<td>
									综合员姓名
								</td>

							</tr>
							<s:iterator value="selectList" status="st" id="list">
								<tr>
									<td align="center">
										<input type="checkBox" name="tids"
											value="<s:property value='#list.get("selectvalue")' />"
											<s:property value='#list.get("isselected")' />
											 />
									</td>
									<td align="center">
										<s:property value="#st.count" />
									</td>
									<td align="center">
										<s:property value='#list.get("deptid")' />
									</td>
									<td align="center">
										<s:property value='#list.get("deptname")' />
									</td>
									<td align="center">
										<s:property value='#list.get("userid")' />
									</td>
									<td align="center">
										<s:property value='#list.get("username")' />
									</td>
								</tr>

							</s:iterator>
							<tr>
								<td colspan="6" align="center">
									<input type="submit" class="button1" value="启动会签" />

								</td>
							</tr>
						</table>
					</td>
			</table>
		</form>
	</body>
</html>
