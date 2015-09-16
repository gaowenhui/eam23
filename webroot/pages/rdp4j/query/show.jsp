<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="query" uri="/query"%>
<html>
	<head>
		<title>通用查询<%=request.getParameter("actionsBeanID")%></title>
		<link rel="stylesheet" href="../resource/css/maincss.css" type="text/css">
	</head>
	<body align='center' class='body1' >
		<table align="center" cellspacing="1" cellpadding="1" class="tabletitle">
	<tr height="25">
		<td class="formtitle">&nbsp;&nbsp;当前位置：通用查询</td>
	</tr>
	<tr>
		<td valign="top" align="center">
		<br><!--  PopCalendar Start (frame name and id must match)--->
		<IFRAME id=popFrame style="BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; Z-INDEX: 65535; VISIBILITY: hidden; BORDER-LEFT: 2px ridge; BORDER-BOTTOM: 2px ridge; POSITION: absolute"  name=popFrame src="../pages/query/date.html" frameBorder=0 scrolling=no width="162" height="202"></IFRAME>
		<SCRIPT>document.onclick=function() {document.getElementById("popFrame").style.visibility="hidden";}</SCRIPT>
		<!--  PopCalendar End --->
		<form action="query.do" method='post' name="testform" theme="xhtml">
		paginator.currentPage:<input type='text' value='${paginator.currentPage}'  name='paginator.currentPage'>
			
			${paginator.pageCount}
			${paginator.currentPage}
			${paginator.currentPage}
			
			<input type='hidden' name='actionsBeanID' 	value='<%=request.getParameter("actionsBeanID")%>'>
			<input type='hidden' name='agentid' value='agent'>
			<input type='hidden' name='PAGE' value='1'>
			<input type='hidden' name='Birthday' onclick="popFrame.fPopCalendar('Birthday','Birthday',event);" readOnly>
			<query:table name="x" leixing='text' bianhao="xx" actionbeanid="<%=request.getParameter("actionsBeanID")%>" />
			<input type="submit" class='button1'  value="提交查询"  /> 
			<input type='button' class='button1' onclick='window.open("excel.do")' value='导出EXCEL' >
		</form>
		<query:querytable bid="<%=request.getParameter("actionsBeanID")%>" sql="${pagesql}" 	ipage="${iPage}"	ipagesize="${iPageSize}" />
</td></tr></table>
</body>
</html>