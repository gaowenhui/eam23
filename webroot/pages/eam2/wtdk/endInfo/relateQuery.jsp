<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	boolean isbatch = false;
	isbatch = "true".equals((String)request.getAttribute("batch"))?true:false;
	String batch="";
	if(isbatch){
		batch="1";
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>基金账户信息查询</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">系统基金账号：</td>
		<td class="td_zxy02"><s:textfield id="saAcctNo" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">系统贷款账号：</td>
        <td class="td_zxy02"><s:textfield id="lnAcctNo" cssClass="input" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01"> 客户名称：</td>
		<td class="td_zxy02"><s:textfield id="saCustName" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">客户编号：</td>
 		<td class="td_zxy02"><s:textfield id="saCustNo" cssClass="input" /></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr> 
</table>
</form>
<table id="relateList"></table>
<div id="pgtoolbar1"></div>
    
<script type="text/javascript">
jQuery("#relateList").jqGrid({
	datatype: "json",
	colNames:['id','系统基金账号','基金客户编号','基金客户名称','基金账户余额','贷款账户余额','基金结余'],
	colModel :[ 
	    {name: 'id',index: 'id',align: "center",hidden:true },
		{name: 'saAcctNo',index: 'saAcctNo',align: "center" },
		{name: 'saCustNo',index:'saCustNo',align:'center'},
		{name: 'saCustName',index: 'saCustName',align: "center"},
		{name: 'sazhye',index: 'sazhye',align: "center"},
		{name: 'lnzhye',index: 'lnzhye',align: "center"},
		{name: 'sajy',index: 'sajy',align: "center"}
  	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '贷款还款列表',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: ["0","5"]
	}
});

//设置宽度
$("#relateList").setGridWidth($("#conditions").width());
$(window).bind('resize',function(){
	$("#relateList").setGridWidth($("#conditions").width());
});

// 添加按钮
$(document).ready(function(){
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"}]';
	addButtons(jQuery("#gview_relateList > .ui-jqgrid-titlebar"),buttonJSonString);
});

// 日期
$(function(){
	$("#startDate,#endDate").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
});

// 查询
function query(){
	var saAcctNo = document.getElementById("saAcctNo").value;//机构名称
	var lnAcctNo = document.getElementById("lnAcctNo").value; //一级机构
	var saCustName = document.getElementById("saCustName").value; //客户名称
	var saCustNo = document.getElementById("saCustNo").value;//币种
	jQuery("#relateList").setGridParam({postData:{
		'queryVO.lnAcctNo' : lnAcctNo,
		'queryVO.saCustNo' : saCustNo,
		'queryVO.saCustName' : saCustName,
		'queryVO.saAcctNo' : saAcctNo
	},
	url:'<%=basePath%>wtdk/endInfo_queryRelate.do'
	}).trigger("reloadGrid");
}

// 点击确定回调函数
function queding(){
	var xulies = jQuery("#relateList").jqGrid('getGridParam','selarrrow');
	if(xulies.length > 0 && xulies!=""){
		window.opener.callBack(xulies);
		window.close();
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 批量选择
function batchQueding(){
	var gr = jQuery("#hkList").jqGrid('getGridParam','selarrrow');
	var hkrq = "";
	var lnNo = "";
	if(gr.length==0){
		alert('请至少选择一条记录');
	}else{
		for(var i = 0; i < gr.length;i++){
			if(gr[i]!=''&&gr[i]!=null&&gr[i]!=false){
				hkrq = hkrq + jQuery("#hkList").getCell(gr[i],'bjhkrq') + ",";
				lnNo = lnNo + jQuery("#hkList").getCell(gr[i],'dkzh') + ",";
			}
		}
		window.opener.callBackBatch(hkrq,lnNo);
		window.close();
	}
}

</script>
</body>
</html>
