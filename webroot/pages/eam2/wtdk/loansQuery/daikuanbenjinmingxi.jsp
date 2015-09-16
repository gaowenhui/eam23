<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="benjinlist"></table>
<script type="text/javascript">
	var mingxiJSON = '<%=(String)request.getAttribute("mingxiJSON")%>';
	jQuery("#benjinlist").jqGrid({
		datatype: 'jsonstring',
		datastr:mingxiJSON,
		multiselect:true,
		colNames:['客户名称','科目','科目名称','本次还款日期','本次还款金额', '还款后本金余额','委托单位名称'],
		colModel :[ 
			{name:'khmc', index:'khmc', align:'center'}, 
			{name:'kmbh', index:'kmbh', align:'center'},
			{name:'kmmc', index:'kmmc', align:'center'}, 
			{name:'bchkrq', index:'bchkrq', width:80, align:'center'}, 
			{name:'bchkje', index:'bchkje', align:'center'}, 
			{name:'hkhbjye', index:'hkhbjye', align:'center'},
			{name:'wtdwmc', index:'wtdwmc', align:'center'}
		],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '贷款本金明细',
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	// 设置宽度
	$("#benjinlist").setGridWidth($("#conditions").width());
	$(window).bind('resize',function(){
		$("#benjinlist").setGridWidth($("#conditions").width());
	});
	
</script>
</body>
</html>