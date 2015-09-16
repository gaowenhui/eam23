<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tansun.rdp4j.workflow.task.action.*"%>
<%
	String ifCounterSign = (String)request.getAttribute(WorkflowAction.IF_COUNTERSIGN);
	String counterSignId = (String)request.getAttribute(WorkflowAction.COUNTERSIGN_ID);
	String multiple = (String)request.getAttribute(WorkflowAction.MULTIPLE);
	if(ifCounterSign==null){
		ifCounterSign = "";
	}
	if(counterSignId==null){
		counterSignId = "";
	}
%>
<%@include file="dtree.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>机构管理</title>
</head>
<body  class="body1">
<form action="" method="post" name="myForm" target="userTree">
<input type="hidden" name="checkDepId" value="${checkDepId}"/>
<script type="text/javascript">
	function showDepDetail(depTid,name){
	myForm.action="<%=request.getContextPath() %>/dept/dept_getUserByRoleAndDepId.do?dep.tid="+depTid+"&<%=WorkflowAction.IF_COUNTERSIGN%>=<%=ifCounterSign%>"+"&<%=WorkflowAction.COUNTERSIGN_ID%>=<%=counterSignId%>"+"&<%=WorkflowAction.MULTIPLE%>=<%=multiple%>";
	myForm.submit();
	}
	var d = new dTree('d');	
	d.add('1','-1','组织机构',"showDepDetail('1001','');");
	${buffer};
	d.draw();
	</script>
</form>
</body>
</html>