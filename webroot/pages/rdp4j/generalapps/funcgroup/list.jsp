<%@page contentType="text/html;charset=UTF-8"%>
<#escape x as ((x!)?html)!>
<#include "../common/paginator.html"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>rolelist.html</title>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../resource/css/maincss.css" type="text/css">
  </head>
  <body class='body1'>
  <form action="">
    <a href="role_add.do">新增</a> <p>
  <table>
	<#list list.results! as PtTFunctionGroupBO>
		<tr>
			<td>${PtTFunctionGroupBO.tid!}</td>
			<td><a href="role_edit.do?tid=${PtTFunctionGroupBO.tid!}&mid=${PtTFunctionGroupBO.mid!}">编辑</a></td>
		</tr>
	</#list>
  </table>
<!-- 分页开始 -->
<@showPageField actionAndMethod="role_list" pageableList=functiongrouplist pagebleListName="functiongrouplist" />
<!-- 分页结束 -->
</form>
  </body>
</html>
</#escape>
