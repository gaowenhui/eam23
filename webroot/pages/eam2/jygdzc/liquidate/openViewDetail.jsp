<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>清算</title>
<SCRIPT language=JavaScript type=text/JavaScript>
$(function(){	
	jQuery("#liquidatelist").setGridWidth($("#gridTable").width());
	$(window).bind('resize', function(){
		jQuery("#liquidatelist").setGridWidth($("#gridTable").width());
	});
});
</SCRIPT>
</head>
<body >
<table id="gridTable" width="100%" border="0" class="newtable" align="center" cellpadding="0" cellspacing="0">
<tr><td></td></tr>
</table>
<table id="liquidatelist"></table>
</body>
</html>
<script type="text/javascript">
	jQuery("#liquidatelist").jqGrid({
 	url:"<%=basePath%>qs/liquidateQuery_viewDetail.do?headId=${headId}",
    datatype:"json",
	colNames: ['id','合同编号','合同类型','资产编号', '资产名称',
				'清算开始日期','清算截止日期','租金(元)','调整金额(元)','调整后租金(元)','调整原因'],
    colModel: [{ name: 'id', index: 'id',align: "center",hidden:true},
    			{ name: 'htbh', index: 'htbh',align: "center"},
    			{name: 'CHtlx',index: 'CHtlx',align: "center"},
    			{name: 'zcbh',index: 'zcbh',align: "center"},
    			{name: 'zcmc',index: 'zcmc',align: "center"},
    			{name: 'qsksrq',index: 'qsksrq',align: "center"},
    			{name: 'qsjzrq',index: 'qsjzrq',align: "center"},
    			{name: 'yszj',index: 'yszj',align: "center"},
    			{name: 'qstzje',index: 'qstzje',align: "center"},
    			{name: 'xghyszj',index: 'xghyszj',align: "center"},
    			{name: 'tzyy',index: 'tzyy',align: "center"}
            	],
			   	rownumbers:true,
			   	autowidth:true,
			 	rowNum:10,
				height:'auto',
				caption: '列表',
	            autowidth: false,
            	jsonReader : {
					root:"rows",
					repeatitems: false,
					id: "0"
				}
            });
	            
</script>


