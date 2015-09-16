<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
  <%@ taglib prefix="r" uri="/rdp4j-tags"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
  function judgeEmpty(){
     if(document.getElementById("dep.deptName").value=="null"||document.getElementById("dep.deptName").value==""){
       alert("部门名称有为空的");
     }else if(document.getElementById("dep.deptDesc").value=="null"||document.getElementById("dep.deptDesc").value==""){
        alert("部门描述为空的");
     }else{
       myForm.action="<%=request.getContextPath()%>/dept/dept_addChild.do";
       myForm.submit();
     }
  }
</script>
</head>
<body class="body1">
<form name="myForm" id="myForm" action="" method="post">
<input type="hidden" name="dep.parId" value="${dep.parId }"/>
  <table class='tabletitle' cellspacing=1 cellpadding=1 width="357" height="56">
  <tr height=25>
				<td class=formtitle colspan=2>
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					当前位置：添加子部门信息
				</td>
	</tr>
   <tr align="right">
      <td colspan="2" align="left"><input type="button" class="button1" onclick="window.navigate('<%=request.getContextPath()%>/dept/dept_toList.do')" value="返回列表"/>
    </tr>
  </table>
  <table class='tabletitle' cellspacing=1 cellpadding=1>
    
    <tr>
      <td colspan="2" align="center">添加组织机构</td>
    </tr>
     <tr>
		<td>名称</td>
		<td><input type="text" id="dep.deptName" name="dep.deptName"/></td>
		</tr>
		 <tr>
		<td>描述</td>
		<td><input type="text" id="dep.deptDesc" name="dep.deptDesc"/></td>
		</tr>
		<tr>
		<td>机构编码</td>
		<td><input type="text" id="dep.deptCode" name="dep.deptCode"/></td>
		</tr>
		<tr>
		<!-- 要从数据字典里查询  动态的 -->
		<td>机构类别</td>
		<td><r:select name="dept.deptTypeCd" list="#{}" id="dept.deptTypeCd" parRefKey="041"/>
		</td>
		</tr>
		<tr>
		<td>排序</td>
		<td><select name="dep.sortOrder">
			<% for(int i=1;i<100;i++){
			out.println("<option value='"+i+"'>"+i+"</option>");
				} %>
		  </select>
		  </td>
		</tr>
		<tr>
      <td colspan="2" align="center"><input type="button" class="button1" value="确定" onclick="judgeEmpty();"/>
      <input type="button" class="button1" value="返回" onclick="history.back();"/>
    </tr>
  </table>
</form>
</body>
</html>