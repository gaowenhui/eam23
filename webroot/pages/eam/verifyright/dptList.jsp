<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.*"%>
<%
	HashMap map = (HashMap) request
			.getAttribute("map");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/resource/css/maincss.css"
			type="text/css">
		<title>Insert title here</title>
	</head>
	<body class="body1">
		<form name="myForm" method="post" action="<%=request.getContextPath()%>/dept/deptadd.do">
			<table class='tabletitle' cellspacing=1 cellpadding=1>
			<%
				Iterator it = map.keySet().iterator();
				for(Object o : map.keySet()){
					PTDeptBO dept = (PTDeptBO)o;
			%>
				<tr>
					<td colspan="2"><%=dept.getDeptName()%><td>
				</tr>
			<%
					List<PTUserBO> userList = (List<PTUserBO>)map.get(dept);
					for(PTUserBO user:userList){
			%>
				<tr>
					<td class="td_form02">
						<input type="checkbox">
					</td>
					<td class="td_form02">
						<%=user.getUsername()%>
					</td>
				</tr>
			<%
					}
				}
			%>
			</table>
		</form>
	</body>
</html>