<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'mywork.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<table width="95%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td height="25">
				<img src="../../资产管理/images/main_28.gif" width="9" height="9"
					align="absmiddle">
				<strong>待办事宜</strong>
			</td>
			<td height="25" align="right">
				<input type="button" class="buttonface02" value="作废流程">
			</td>
		</tr>
		<tr>
			<td height="1" class="td05">
				<img src="../../资产管理/images/spacer.gif" width="1" height="1">
			</td>
		</tr>


	</table>

	<table width="95%" border="0" cellspacing="0" cellpadding="0"
		align="center" id="daiban">
		<tr>
			<td class="td_top">
				<input type="checkbox"
					onClick="setCheckBoxInTable('daiban',this.checked)" />
			</td>
			<td class="td_top" align="center">
				审批单号
			</td>
			<td class="td_top" align="center">
				标题
			</td>
			<td class="td_top" align="center">
				拟稿人
			</td>
			<td class="td_top" align="center">
				申请日期
			</td>
			<td class="td_top" align="center">
				流程名称
			</td>

		</tr>
		<tr>
			<td class="td_01">
				<input type="checkbox">
			</td>
			<td class="td_01" align="center">
				<A onClick="javascript:window.location='main/card-add-3.html';"
					href="#" style="color: #FF0000">2110030100002374</A>
			</td>
			<td class="td_01" align="center">
				卡片新增审批
			</td>
			<td class="td_01" align="center">
				王芊
			</td>
			<td class="td_01" align="center">
				2010-08-17
			</td>
			<td class="td_01" align="center">
				卡片新增
			</td>

		</tr>
		<tr>
			<td class="td_01">
				<input type="checkbox">
			</td>
			<td class="td_01" align="center">
				<A onClick="javascript:window.location='main/card-add-3.html';"
					href="#" style="color: #FF0000">2110030100002374</A>
			</td>
			<td class="td_01" align="center">
				卡片新增审批
			</td>
			<td class="td_01" align="center">
				王芊
			</td>
			<td class="td_01" align="center">
				2010-08-17
			</td>
			<td class="td_01" align="center">
				卡片新增
			</td>

		</tr>
		<tr>
			<td class="td_01">
				<input type="checkbox">
			</td>
			<td class="td_01" align="center">
				<A onClick="javascript:window.location='main/card-add-3.html';"
					href="#" style="color: #FF0000">2110030100002374</A>
			</td>
			<td class="td_01" align="center">
				卡片新增审批
			</td>
			<td class="td_01" align="center">
				王芊
			</td>
			<td class="td_01" align="center">
				2010-08-17
			</td>
			<td class="td_01" align="center">
				卡片新增
			</td>

		</tr>
		<tr>
			<td class="td_01">
				<input type="checkbox">
			</td>
			<td class="td_01" align="center">
				<A onClick="javascript:window.location='main/card-add-3.html';"
					href="#" style="color: #FF0000">2110030100002374</A>
			</td>
			<td class="td_01" align="center">
				卡片新增审批
			</td>
			<td class="td_01" align="center">
				王芊
			</td>
			<td class="td_01" align="center">
				2010-08-17
			</td>
			<td class="td_01" align="center">
				卡片新增
			</td>

		</tr>
		<tr>
			<td class="td_01">
				<input type="checkbox">
			</td>
			<td class="td_01" align="center">
				<A onClick="javascript:window.location='main/card-add-3.html';"
					href="#" style="color: #FF0000">2110030100002374</A>
			</td>
			<td class="td_01" align="center">
				卡片新增审批
			</td>
			<td class="td_01" align="center">
				王芊
			</td>
			<td class="td_01" align="center">
				2010-08-17
			</td>
			<td class="td_01" align="center">
				卡片新增
			</td>

		</tr>
		<tr>
			<td class="td_01">
				<input type="checkbox">
			</td>
			<td class="td_01" align="center">
				<A onClick="javascript:window.location='main/card-add-3.html';"
					href="#" style="color: #FF0000">2110030100002374</A>
			</td>
			<td class="td_01" align="center">
				卡片新增审批
			</td>
			<td class="td_01" align="center">
				王芊
			</td>
			<td class="td_01" align="center">
				2010-08-17
			</td>
			<td class="td_01" align="center">
				卡片新增
			</td>

		</tr>
	</table>
	<table width="95%" border="0" cellpadding="0" cellspacing="0"
		class="table02" align="center">
		<tr>
			<td height="30" align="right">
				<img src="../../资产管理/images/1.gif" width="4" height="5"
					align="absmiddle">
				首页
				<img src="../../资产管理/images/2.gif" width="3" height="5"
					align="absmiddle">
				上一页
				<img src="../../资产管理/images/2-2.gif" width="3" height="5"
					align="absmiddle">
				下一页
				<img src="../../资产管理/images/3.gif" width="4" height="5"
					align="absmiddle">
				末页 共 1000 条记录 本页显示第1~10条 第1页/共100页 跳转到
				<input name="pageNum" type="text" style="width: 20px">
				页
			</td>
		</tr>
	</table>
</html>
