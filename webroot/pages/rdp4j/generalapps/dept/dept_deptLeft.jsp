<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript" src="/rdp4j/resource/js/jquery/layout/complex.js"></script>
<script type="text/javascript" src="/rdp4j/resource/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/rdp4j/resource/js/jquery/layout/jquery.layout.js"></script>
<script type="text/javascript" src="/rdp4j/resource/js/jquery/jqueryui/jquery-ui.custom.min.js"></script>
<link type="text/css" rel="stylesheet" href="/rdp4j/resource/js/jquery/jqueryui/css/cupertino/jquery-ui.custom.css">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" class='body1'>
<table border="0" width="100%" height="100%" cellspacing="1">
	<tr>
		<td width="20%">
		<iframe id="contentLeft" name="contentLeft" src="<%=request.getContextPath()%>/dept/dept_toTreeDept.do" width="100%" height="100%" style="padding: 0;margin: 0;width:100%;height:100%" frameborder="0" scrolling="auto" marginwidth="1" marginheight="1"></iframe></td>
		<td>
		<iframe id="contentRight" name="contentRight" src width="100%" height="100%" frameborder="0" scrolling="auto" marginwidth="1" marginheight="1"></iframe></td>
	</tr>
</table></body>
</html>
