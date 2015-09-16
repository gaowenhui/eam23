<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.rdp4j.workflow.common.model.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	PTMessage msg = (PTMessage)request.getAttribute("msg");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>消息页面</title>
		<%@ include file="/inc/header-standard.inc"%>
	</head>
	<body class='body1'>
<% 
	if(msg.getType().equals("2")){
		//传阅
		//在目标地址上添加门户地址
		String url = msg.getUrl()+"?"+msg.getParam();
		url = URLEncoder.encode(url);
%>
		<script>
			window.location="<%=basePath%>index.do?urlPortal=<%=url%>";
		</script>
<%
	}else if(msg.getType().equals("3")){
		//办结
%>
		<script>
			window.location="<%=msg.getUrl()%>?<%=msg.getParam()%>";
		</script>
<%
	}else{
		//文字消息
%>
		<table width="100%" border="0" class="newtable" id='table1' align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_form01en" colspan="2" align="center">
					消息明细
				</td>
			</tr>
			<tr>
				<td class="td_form01">
					发送人
				</td>
				<td class="td_form02">
					<r:user userId="<%=msg.getSendUserId().toString()%>"/>
				</td>
			</tr>
			<tr>
				<td class="td_form01">
					发送时间
				</td>
				<td class="td_form02">
					<%=msg.getCreateDate()%>
				</td>
			</tr>
			<tr>
				<td class="td_form01">
					消息内容
				</td>
				<td class="td_form02">
					<%=msg.getMessage()%>
				</td>
			</tr>
		</table>
<%
	}
%>
	</body>
</html>