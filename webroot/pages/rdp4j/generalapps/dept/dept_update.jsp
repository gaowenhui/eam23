<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="r" uri="/rdp4j-tags"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>Insert title here</title>
<%@include file="dtree.jsp" %> 
<script type="text/javascript">
    function lookDep(){
	 window.open("<%=request.getContextPath()%>/dept/dept_getOneDep.do",'','top=60,left=150,width=700,height=450,fullscreen=no,statusbar=no,titlebar=no,resizable=no,scrollbars=yes');
	}
	function getOne(depId,name){
	 document.getElementById("b").value=name;
	 document.getElementById("a").value=depId;
	}
</script>
</head>
<body class="body1">
<form name="myForm" method="post" action="<%=request.getContextPath()%>/dept/dept_update.do">
<input type="hidden" id="a" name="dep.parId" value="${dep.parId}">
<input type="hidden"  name="dep.tid" value="<s:property value="dep.tid"/>">
<table class='tabletitle' cellspacing=1 cellpadding=1>
  <tr height=25>
				<td colspan="2" class=formtitle>
	                &nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					&nbsp;当前位置：修改部门信息
				</td>
	</tr>
        <tr>
        <td colspan="2" align="center">部门信息修改</td>
        </tr>
        <tr>
		<td>名称</td>
		<td><input type="text" name="dep.deptName" value='<s:property value="dep.deptName"/>'/></td>
		</tr>
		 <tr>
		<td>描述</td>
		<td><input type="text" name="dep.deptDesc" value='<s:property value="dep.deptDesc"/>'/></td>
		</tr>
		 <tr>
		 <td>部门机构类别</td>
		<td>
		   <r:select name="dep.deptTypeCd" list="#{}" id="dep.deptTypeCd" parRefKey="041"/>
		</td>
		</tr>
		<tr>
		<td>排序</td>
		<td>
		<select name="dep.sortOrder">
		  <option value='${dep.sortOrder}'>${dep.sortOrder}</option>
										<% for(int i=1;i<100;i++){
										out.println("<option value='"+i+"'>"+i+"</option>");
										} %>
		</select>
		</td>
		</tr>
		
        <tr>
		<td>上级部门编号</td>
		<td><input type="text" id="b" value="${depName}"/>
		<input type="button" class="button1" value="浏览.." onclick="lookDep();"/>
		</td>
		</tr>
	
		
		<tr>
		<td colspan="2" align="center"><input type="submit"  class="button1" value="修改">
		<input type="button" class="button1" value="返回" onclick="history.back();"/></td>
		</tr>
		
</table>
</form>
</body>
</html>
