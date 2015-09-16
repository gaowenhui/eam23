<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户已办事宜列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script>
			if(parent.clearPanelTool!=null)
			parent.clearPanelTool();
		</script>
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
								<th width='15%'>发送日期</th>
								<th width="10%">发送人</th>
								<th>信息</th>
							</tr>
							
							<s:iterator value="%{#request.messageList}" var="myMessage" status="status">
								<tr>
									<td>
										<s:property value="#status.count" />
									</td>
									<td>
										<s:date name="#myMessage.createDate" format="yyyy-MM-dd" />
									</td>
									<td>
										<r:user userId="${myMessage.sendUserId }" />
									</td>
									<td>
										<a href="<s:property value="url"/>?<s:property value="param"/>"><s:property value="message" /></a>
										<a href="#" onclick="window.open('<s:property value="url"/>?<s:property value="param"/>'); return false;">
											<s:property value="#myMessage.message" />
										</a>
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