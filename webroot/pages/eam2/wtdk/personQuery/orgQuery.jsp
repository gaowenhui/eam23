<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>机构人员信息查询</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">机构编号：</td>
		<td class="td_zxy02"><s:textfield id="cmOpunCod" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">机构名称：</td>
		<td class="td_zxy02"><s:textfield id="cmOpunFlmnChn" cssClass="input" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr>
</table>
</form>
<table id="orglist"></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>
    
<script type="text/javascript">
jQuery("#orglist").jqGrid({
	datatype: "json",
	colNames:['机构编号','机构名称','上级机构编号','地区简称'],
	colModel :[ 
	    {name:'cmOpunCod', index:'cmOpunCod',align:'center'}, 
		{name:'cmOpunFlmnChn', index:'cmOpunFlmnChn',align:'center'},
		{name:'cmOfcCtbrh', index:'cmOfcCtbrh',align:'center'}, 
		{name:'cmAreaInil', index:'cmAreaInil',align:'center'}
  	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '机构人员信息',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	toolbar: [false,"top"],
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});

//设置宽度
$("#orglist").setGridWidth($("#conditions").width());
$(window).bind('resize',function(){
	$("#orglist").setGridWidth($("#conditions").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"}]';
	addButtons(jQuery("#gview_orglist > .ui-jqgrid-titlebar"),buttonJSonString);
	window.parent.clearPanelTool();
});

// 查询
function query(){
	var cmOpunCod = document.getElementById("cmOpunCod").value;//机构编号
	var cmOpunFlmnChn = document.getElementById("cmOpunFlmnChn").value; //机构名称
	var url1 = "<%=basePath%>wtdk/personQuery_orgQuery.do";
	jQuery("#orglist").setGridParam({postData:{
		'orgVO.cmOpunCod' : cmOpunCod,
		'orgVO.cmOpunFlmnChn' : cmOpunFlmnChn
	},
	url:'<%=basePath%>wtdk/personQuery_orgQuery.do'
	}).trigger("reloadGrid");
}

// 点击确定回调
function queding(){
	var gr = jQuery("#orglist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 1 && gr!=""){
		window.opener.callBack(gr);
		window.close();
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}
</script>
</body>
</html>
