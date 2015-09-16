<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>机构管理</title>
<%@include file="dtree.jsp" %>  
</head>
<body  class="body1">
<form action="" method="post" name="myForm" >
<script type="text/javascript">
function showDepDetail(depTid,name){
	  parent.contentRight.location.href="<%=request.getContextPath()%>/dept/dept_getSelf.do?dep.tid="+depTid;
	}
	var d = new dTree('d');	
	d.add('1','-1','组织机构',"showDepDetail('1','');");
	${buffer};
	d.draw();
	</script>
</form>
</body>
</html>