<%@page contentType="text/html;charset=UTF-8"%>

<#escape x as ((x!)?html)!>
<#include "/pages/rdp4j/common/paginator.html"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>rolelist.html</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../resource/css/maincss.css" type="text/css">
  <SCRIPT LANGUAGE="JavaScript">
function setvalue() {
	var deptid = "";
	var deptname = "";

	var checkIdObj = document.getElementsByName("func");
	if(checkIdObj.length==0){
		return false;
	}else{
	
		for (var i = 0; i < checkIdObj.length; i++) {
		if (checkIdObj(i).checked) {
			var value = checkIdObj(i).value;
			
			var value1 = value.substring(0, value.lastIndexOf("@"));
			var names = value.substring(value.lastIndexOf("@") + 1,value.length);
			
			
			window.opener.document.all.form1.functionId.value = value1;
			window.opener.document.all.form1.url.value = names;
			//alert(value);
			window.close();
		}
	}
	}

	
	
}

</SCRIPT>
  
  </head>
  <body class='body1'>
  <form action="">
   <input type='button' class='button1' onclick='setvalue()' value='确定'>
  <table align="center" class="table1" cellSpacing="1"
            cellPadding="1">
            <tr>
                <th>选择</th>
                <th>模块名称</th>
                <th>Action名称</th>
                <th>方法名称</th>
                <th>功能名称</th>
            </tr>
	<#list list.results! as PTFunctionResBO>
		<tr>
			<td ><input type='radio' name='func'   value='${PTFunctionResBO.tid!}@${PTFunctionResBO.moduleName!}/${PTFunctionResBO.actionName!}.do'></td>
			<td>${PTFunctionResBO.moduleName!}</td>
			<td>${PTFunctionResBO.actionName!}</td>
			<td>${PTFunctionResBO.methodName!}</td>
			<td>${PTFunctionResBO.functionName!}</td>
		</tr>
	</#list>
  </table>
  
  
<!-- 分页开始 -->
<@showPageField actionAndMethod="functionreslist" pageableList=functionreslist pagebleListName="functionreslist" />
<!-- 分页结束 -->
</form>
  </body>
</html>
</#escape>
