<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息列表</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">客户名称：</td>
		<td class="td_zxy02"><s:textfield name="customer.ciChnName" id="ciChnName" size="30" /></td>
		<td class="td_zxy01">客户编号：</td>
		<td class="td_zxy02"><s:textfield name="customer.ciCustNo" id="ciCustNo" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">建档日期&nbsp;从：</td>
		<td class="td_zxy02"><s:textfield id="startCiFlstDt" name="startCiFlstDt"  cssClass="input" value="%{#draftDate}" /></td>
		<td class="td_zxy01">到：</td>
		<td class="td_zxy02"><s:textfield id="endCiFlstDt" name="startCiFlstDt" cssClass="input" value="%{#draftDate}" /></td>
	</tr>	
	<tr>
		<td class="td_zxy01">单位中文名称：</td>
		<td class="td_zxy02"><s:textfield id="ciUnitChnInil" onblur="checkChar(this);"  size="30" /></td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr> 
</table>
</form>
<table id=customer_list></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>
<%@ include file="/inc/exportExcel.inc"%>
<script type="text/javascript">
jQuery("#customer_list").jqGrid({
	url:'<%=basePath%>wtdk/customersQuery_query.do',
	datatype: "json",
	mtype:"POST",
	colNames:['客户编号','客户名称','营业执照号','单位中文名称','建档日期'],
	colModel:[ 
		{name:'ciCustNo',index:'ciCustNo',align:'center'},
		{name:'ciChnName', index:'ciChnName',align:'center'},
		{name:'ciGovnCertNo', index:'ciGovnCertNo',align:'center'},
		{name:'ciUnitChnInil', index:'ciUnitChnInil',align:'center'},
		{name:'ciFlstDt', index:'ciFlstDt',align:'center'}
  	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '客户信息列表',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});

// 设置宽度
$("#customer_list").setGridWidth($("#topbar").width());
$(window).bind('resize',function(){
	$("#customer_list").setGridWidth($("#topbar").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
							 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出excel"}\
							]';
	addButtons(jQuery("#gview_customer_list > .ui-jqgrid-titlebar"),buttonJSonString);
});

// 日期转换
$(function(){
	$("#startCiFlstDt,#endCiFlstDt").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
});

// 查询
function query(){
	var sd = document.getElementById('startCiFlstDt').value;
	var ed = document.getElementById('endCiFlstDt').value;
	var flags = true;
	var flage = true;
	if(sd!=''&&sd!=null){
		flags = isDate(sd);
	}
	if(ed!=''&&ed!=null){
		flage = isDate(ed);
	}
	if(flags==false||flage==false){
		alert('请输入正确的日期格式，例如：2010-01-01');
		return false;
	}
	if(sd!='' && ed!='' && sd > ed){
		alert("开始日期不应该大于结束日期，请重新输入！");
		return false;
	}
	var ciChnName = document.getElementById("ciChnName").value;
	var ciCustNo = document.getElementById("ciCustNo").value;
	var startCiFlstDt = document.getElementById("startCiFlstDt").value;
	var endCiFlstDt = document.getElementById("endCiFlstDt").value;
	var ciUnitChnInil = document.getElementById("ciUnitChnInil").value;
	jQuery("#customer_list").setGridParam({postData:{
		'queryVO.ciChnName' : ciChnName,
		'queryVO.ciCustNo' : ciCustNo,
		'queryVO.startCiFlstDt' : startCiFlstDt,
		'queryVO.endCiFlstDt' : endCiFlstDt,
		'queryVO.ciUnitChnInil' : ciUnitChnInil
	}}).trigger("reloadGrid");
}

// 详细
function queryMore(){
	var gr = jQuery("#customer_list").jqGrid('getGridParam','selarrrow');
	if(gr.length==1 && gr!=""){
		var id = (gr+"").replace("#","DGL"); // 因为gr里面带有#传action传不过去所以先替换成DGL 到后台再替换回来
		var url = '<%=basePath%>wtdk/customersQuery_customerInfo.do?ciCustNo='+id;
		var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0';
		window.open(url,'客户详细信息',type);
	}else{
		alert('请选择一条记录！');
		return false;
	}
}

// excel导出
function excel(){
    var urlStr = jQuery("#customer_list").getGridParam('url');
	var ciChnName = document.getElementById("ciChnName").value;
	var ciCustNo = document.getElementById("ciCustNo").value;
	var startCiFlstDt = document.getElementById("startCiFlstDt").value;
	var endCiFlstDt = document.getElementById("endCiFlstDt").value;
	var ciUnitChnInil = document.getElementById("ciUnitChnInil").value;
    var cp = jQuery("#customer_list").getGridParam('page');
    var ps = jQuery("#customer_list").getGridParam('rowNum');
    var params = "{\"queryVO.ciChnName\":\"" + ciChnName + "\",";
		params += "\"queryVO.ciCustNo\":\"" + ciCustNo + "\",";
		params += "\"queryVO.startCiFlstDt\":\"" + startCiFlstDt + "\",";
		params += "\"queryVO.endCiFlstDt\":\"" + endCiFlstDt + "\",";
		params += "\"queryVO.ciUnitChnInil\":\"" + ciUnitChnInil + "\",";
		params += "\"paginator.currentPage\":\"" + cp + "\",";
		params += "\"paginator.pageSize\":\"" + ps + "\"}";
	exportExcel("customer_list", urlStr, params, '对公客户列表','rn,cb');
}
</script>
</body>
</html>

