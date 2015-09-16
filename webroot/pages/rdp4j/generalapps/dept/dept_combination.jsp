<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<script type="text/javascript">
  function combination(){
    myForm.action="<%=request.getContextPath()%>/dept/dept_combination.do";
    myForm.submit();
  }
</script>
</head>
<body onload="body1">
<form name="myForm" action="">
<input type="hidden" name="dep.parId" value="${depId}"/>
<input type="hidden" name="tids"  value='${tids}'/>
  <table border="1" align="center">
    <tr><td colspan="2" align="center">合并后的部门${depId}</td></tr>
    <tr>
    <td>新部门名称:<input type="text" name="dep.depName"/></td>
    <td>新部门描述:<input type="text" name="dep.deptDesc"/></td>
    </tr>
    <tr>
    <td colspan="2">
      <input type="button" value="保存合并" class="button1"   onClick="combination();" />
      <input type="button" value="返回" class="button1" onClick="javascript:history.go(-1);" />
    </td>
    </tr>
  </table>
</form>
</body>
</html>