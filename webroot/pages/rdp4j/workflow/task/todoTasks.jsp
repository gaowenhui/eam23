<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户待办事宜列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
	</head>

	<body class='body1'>
		<table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr height="25">
					<th>当前位置：待办事宜</th>
				</tr>
				<tr>
					<td valign="top">
						<table class="table1" cellSpacing="1" cellPadding="1">
							<tr>
								<td>
									<span>标题</span>
									<span><input class="text1" type="text" name="query_condition"/></span>
									<span><input class="button1" type="submit" value="查询"/></span>
								</td>									
							</tr>
						</table>
						
						<table class="table1" cellSpacing="1" cellPadding="1">
							<tr>
								<th width='5%'>序号</th>
								<th width='10%'>审批单号</th>
								<th width='10%'>拟稿人</th>
								<th width='15%'>拟稿日期</th>
								<th>标题</th>
								<th width='15%'>当前环节</th>
							</tr>
							
							<s:iterator value="Tasks" status="status">
								<tr>
									<td>
										<s:property value="#status.count"/>
									</td>
									<td>
										<s:property value="approvalNumber"/>
									</td>
									<td>${draftUserId}
									</td>
									<td>
										<s:date name="draftDate" format="yyyy-MM-dd hh:mm:ss" />
									</td>
									<td>
										<a href="<s:url value="%{url}" />"><s:property value="title" /></a>
									</td>
									<td>
										<s:property value="outcome"/>
									</td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>