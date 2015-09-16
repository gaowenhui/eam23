<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>Insert title here</title>
<script language="javascript">
	function addRow(parentId){
	 
		var obj = document.getElementById("myTable");
		//创建行
		var tr = obj.insertRow();
		
		//插入三个单元格
		var td1 = tr.insertCell(0);
		//部门的名称
		td1.innerHTML = "部门名称：<input type='text'  name='dep.deptName'>";
		//部门的描述
		var td2 = tr.insertCell(1);
		td2.innerHTML = "部门描述：<input type='text' name='dep.deptDesc'>";
		//删除这行
		var td3 = tr.insertCell(2);
		//需要删除 就把本行的都给删掉
		td3.innerHTML = "<input type='button' value='删除' class='button1' onclick='myDelRow();'>";
		var td4 = tr.insertCell(3);
		//需要删除 就把本行的都给删掉
		td4.innerHTML = "<input type='hidden' name='dep.parId' value='"+parentId+"'>";
		//2：把这个行对象加入到table中
		//把原来的大部门删除掉
	}	
	
	function myDelRow(){
		//1:找到每行的行表索引值
		var k = event.srcElement.parentElement.parentElement.rowIndex;
		//2：真的删除
		var obj = document.getElementById("myTable");
		obj.deleteRow(k);
		}
</script>
</head>
<body class="body1">
<form action="<%=request.getContextPath()%>/dept/dept_splitAdd.do" name="myForm" method="post">
<input type="hidden" name="depId" value="${depId}"/>
<table id="myTable" class='tabletitle' cellspacing=1 cellpadding=1>
   <tr height=25 >
				<td colspan="3" class=formtitle>
				&nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					 &nbsp;当前位置：部门拆分
				</td>
	</tr>
   <tr>
   <td colspan="3" align="center">拆分${parentId}部门</td>
   </tr>	
</table>
<table>
	<tr>
	<td>
	<input type="button" class="button1" value="增加${parentId}" onclick="addRow(${parentId});">
	<input type="submit" class="button1" value="点击添加"/>
	</td>
	</tr>
</table>
</form>
</body>
</html>