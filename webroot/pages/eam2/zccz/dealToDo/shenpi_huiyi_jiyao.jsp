<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>会议纪要</title>
<script type="text/javascript">
</script>
</head>
<body>
<form method="post" action="">
<table id="purchase_list"> </table>
<script type="text/javascript">
jQuery("#purchase_list").jqGrid({				
	url:"<%=basePath %>zccz/dealToDo_findZCXMs.do?fenlei=${fenlei}",
	datatype: "json",
	mtype:"POST",
   	colNames:['id','表单id','编号','标题','拟稿人','拟稿日期','流程名称', '来源'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'bdid',index:'bdid',editable:true,hidden:true},
				   		{name:'bh',index:'bh',editable:true},
				   		{name:'bt',index:'bt',editable:true},
						{name:'ngr',index:'ngr',editable:true},
				   		{name:'ngrq',index:'ngrq',editable:true},
				   		{name:'lcmc',index:'price', align:"right",editable:true},
				   		{name:'source',index:'source', align:"right",editable:true}
				   	],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '会议纪要',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
$(window).bind('resize', function(){
	jQuery("#purchase_list").setGridWidth($("#items").width());
});
$(document).ready(function(){	
});
//*****************************************************
</script>
</form>
</body>
</html>

