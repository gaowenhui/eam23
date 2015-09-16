<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>选择部门</title>
   <script language="javascript" src="<%=request.getContextPath() %>/resource/js/dtreenew/dtree.js"></script>
</head>
<body class="body1">
   <script type="text/javascript">
	function showDepDetail(depId,name){
		opener.getOne(depId,name);
		window.close();
	}
    var d = new dTree('d');	
	d.add('1','-1','组织机构',"showDepDetail('1001','');");
	${buffer};
	d.draw();
	</script>

</body>
   

</html>