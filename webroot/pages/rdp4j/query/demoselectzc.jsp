<%@page language="java" pageEncoding="UTF-8"%>
<html>
<body class='body1'>
<link rel="stylesheet" href="../resource/css/maincss.css" type="text/css">
<script language="javascript"> 
	function openwin(){
		var ids=form1.idvalues.value;
		window.open('selectzc.do?bid=selectzc&idvalues='+ids,'_blank','width=800,height=600');
	}
	//具体回调方法，可以根据返回的id值，使用ajax 执行插入数据库等的操作
	function querycallback(callbackvalue){
		document.form1.idvalues.value=callbackvalue;
	}
</script>
<form name='form1' method='post' action='query.do'>
	<input type='button' value='弹出页面选择资产' class='button1' algin=center onclick='openwin()'>
	<input type='button' value='测试函数'  class='button1'  onclick=querycallback("callback") >
回调返回值	
	<textarea name='idvalues' ></textarea>
</form>
</body>
</html>