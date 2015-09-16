<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>数据字典管理</title>
   <script language="javascript" src="<%=request.getContextPath() %>/resource/js/dtreenew/dtree.js"></script>
</head>
<body  class="body1">
<form action="" method="post" name="myForm" target="contentRight">
<input type="hidden" name="checkDepId" value="${checkDepId}"/>
<script type="text/javascript">
	function showDepDetail(tid,name){
	myForm.action="<%=request.getContextPath() %>/reference/reference_getSelf.do?refBo.tid="+tid;
	myForm.submit();
	}
	var d = new dTree('d');	
	d.add('1','-1','数据字典',"showDepDetail('1001','');");
	${buffer};
	d.draw();
	</script>
</form>
</body>
</html>