<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
 <%@ taglib prefix="r" uri="/rdp4j-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
     function lookDep(){
	 window.open("<%=request.getContextPath()%>/dept/dept_getOneDep.do",'','width=400,height=400');
	}
	function getOne(depId,name){
	 document.all("b").value=name;
	 document.all("a").value=depId;
	}
</script>
</head>
<body class="body1">
<form name="myForm" method="post" action="<%=request.getContextPath()%>/dept/dept_add.do">
<input type="hidden" id="a" name="dep.parId" value="dep.parId">
<table class='tabletitle' cellspacing=1 cellpadding=1>
<tr height=25>
				<td class=formtitle colspan="2">
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					当前位置：添加子机构
				</td>
	</tr>
        <tr>
        <td colspan="2" align="center">部门新增</td>
        </tr>
        <tr>
		<td>名称</td>
		<td><input type="text" name="dep.deptName"/></td>
		</tr>
		 <tr>
		<td>描述</td>
		<td><input type="text" name="dep.deptDesc"/></td>
		</tr>
		<tr>
		<td>机构编码</td>
		<td><input type="text" name="dep.deptCode"/></td>
		</tr>
		<tr>
		<!-- 要从数据字典里查询  动态的 -->
		<td>部门机构类别</td>
		<td> 
		   <r:select name="dept.deptTypeCd" list="#{}" id="dept.deptTypeCd" parRefKey="041"/>
		</td>
		</tr>
		<tr>
		<td>排序</td>
		<td>
		  <select name="dep.sortOrder">
			<% for(int i=1;i<100;i++){
			out.println("<option value='"+i+"'>"+i+"</option>");
				} %>
		  </select>
		</td>
		</tr>
		<tr>
		<td>上级部门</td>
		<td><input type="text" id="b"/>
		<input type="button" value="浏览.." class="button1" onclick="lookDep();"/>
		</td>
		</tr>
		<tr>
		<td colspan="2" align="center"><input type="submit"  class="button1" value="新增">
		<input type="button"  class="button1" value="返回" onclick="history.back();"/></td>
		</tr>
</table>
</form>
</body>
</html>
