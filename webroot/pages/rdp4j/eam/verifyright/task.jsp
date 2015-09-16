<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="org.jbpm.api.task.Task"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="workflow_attribute_include.jsp"%>
<%
boolean isFork = false;
if(taskName.equals("等待会签结果")
	||taskName.equals("领导会签")
	||taskName.equals("经办会签")
	||taskName.equals("结束会签")){
	isFork = true;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/resource/css/maincss.css"
			type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
		<title>Insert title here</title>
		<script type="text/javascript">
			var isFork = '';
		<%
			if(!isFork){
		%>
				isFork='false';
		<%
			}
		%>
</script>
<%@ include file="workflow_javascript_include.jsp"%>
<style type="text/css">
.container {
	width: 100px;
}

.container div {
	width: 100px;
	background: #CCCCCC;
	line-height: 30px;
	border: 1px solid #000000;
}

.on {
	font-weight: bold;
}

.container2 {
	width: 100px;
	text-align: center;
}

.container2 div {
	width: 100px;
	line-height: 30px;
}

.container2 a {
	text-decoration: none;
	display: block;
	border: 1px solid #d4d4d3;
	background: #e6e6e6;
	color: #000000;
}

.container2 .on a {
	background: #ffebac;
	color: #982e00;
	border-color: #ffb200;
}

#idMenu2 {
	clear: both;
	width: auto;
}

#idMenu2 div {
	float: left;
}

#idMenu2_6 a {
	background-color: red;
	border-color: red;
	color: #ffb200;
}
</style>
	</head>
	<body class="body1">
		<form name="myForm" method="post" action="/rdp4j/verifyjoin/verifyjoin_completeTask.do">
			<%@ include file="workflow_header_include.jsp"%>
			<table class='tabletitle' cellspacing=1 cellpadding=1>
				<tr><td colspan="2">
				<!-- 
				<iframe src="/rdp4j/quequan/quequan_next.do?tid=<%=uperTid%>&taskId=<%=uperTaskID%>"
				frameBorder=0 width="100%" height="100%"
				frameborder="0" scrolling="yes" style="visibility: inherit;"></iframe>
				-->
				</td></tr>
				<tr>
					<td height="63">意见:</td>
					<td>
						<textarea name="content" cols="150" rows="4"
							style="background-color: #CCCCCC"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>