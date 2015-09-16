<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户已办事宜列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
	</head>

	<body class='body1'>
		<table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr height="25">
					<th>当前位置：已办事宜</th>
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
								<th width='10%'>编号</th>
								<th>标题</th>
								<th width='10%'>拟稿人</th>
								<th width='15%'>拟稿日期</th>
								<th width='15%'>流程名称</th>								
								<th width='15%'>创建时间</th>
								<th width='10%'>状态</th>	
								<th width='10%'>收回</th>
							</tr>
							
							<s:iterator value="%{#request.didList}" var="myDid" status="status">
								<tr>
									<td>
										<s:property value="#status.count" />
									</td>
									<td>
										<a href="#" onclick="window.open('<s:property value="#myDid.headId" />')"></a>
									</td>
									<td>
										<s:property value="#myDid.title"/>
									</td>
									<td>
										<r:user userId="${myDid.draftUserId}"/>
									</td>
									<td>
										<s:date name="#myDid.draftDate" format="yyyy-MM-dd" />
									</td>
									<td>
										<s:property value="#myDid.procInstName"/>
									</td>
									<td>
										<s:date name="#myDid.createDate" format="yyyy-MM-dd hh:mm:ss" />
									</td>
									<td>
										<s:property value="#myDid.procNodeName"/>
									</td>
									<td>
										<a href='#' onclick="window.open('xx');return false;">收回</a>
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