<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function sub(){
	alert("hh");
	 myForm.action="<%=request.getContextPath() %>/zccz/sczskAction_query.do";
	 alert("--------"+myForm.action);
	 myForm.submit();
	 alert("jjj");
	}
</SCRIPT>

</head>

<body>
<form id="myForm" name="myForm" method="post" action="" >
 <br>
 <br>
<table width="95%" border="0" id="upperTable"  cellspacing="0" cellpadding="0"  align="center">
<tr>
<td  class="td_page">审查项目:<input type="text" name="sczsk.scxm" value="" >审查要点：<input type="text" name="sczsk.scyd" >具提意见：<input type="text"  name="sczsk.jtyj">删除标志：<select name="sczsk.delflag"><option>0</option><option>1</option> </select> </td>
</tr>
<tr><td><input type="button" value="查询" onclick="sub();" /></td></tr>
</table> 
<table width="95%" border="0" id="upperTable"  cellspacing="0" cellpadding="0"  align="center">
	<tr>
	  <td>审查项目编号</td>
	  <td>审查项目</td>
	  <td>审查要点编号</td>
	  <td>具体意见编号</td>
	  <td>具体意见</td>
	  <td>删除标志</td>
	</tr>
	<s:iterator value="czSczsk">
	 <tr>
	  <td><s:property value="scxmbh"/></td>
	  <td><s:property value="scxm"/></td>
	  <td><s:property value="scydbh"/></td>
	  <td><s:property value="scyd"/></td>
	  <td><s:property value="jtyjbh"/></td>
	  <td><s:property value="jtyj"/></td>
	  <td><s:property value="delflag"/></td>
	</tr>
	</s:iterator>
</table>
</form>
</body>
</html>
