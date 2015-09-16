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
		<td class="td_zxy01">贷款账号：</td>
		<td class="td_zxy02"><s:textfield id="dkzh" onblur="isString(this);" /></td>
		<td class="td_zxy01">还款单位：</td>
		<td class="td_zxy02"><s:textfield id="hkdw" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">基金账号：</td>
		<td class="td_zxy02"><s:textfield id="jjzh" onblur="isString(this);" /></td>
		<td class="td_zxy01">基金客户：</td>
		<td class="td_zxy02"><s:textfield id="jjkh" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">还款时间从：</td>
		<td class="td_zxy02"><s:textfield id="startDate" cssClass="input" /></td>
		<td class="td_zxy01">到：</td>
		<td class="td_zxy02"><s:textfield id="endDate" cssClass="input" /></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr> 
</table>
</form>
<table id="hkList"></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>
    
<script type="text/javascript">
jQuery("#hkList").jqGrid({
	datatype: "json",
	colNames:['基金账号','委托人名称','基金账户余额','借款人名称','贷款账号', '年初余额', '本次还款日期', '本次还款金额','本年累计还款金额','还款后本金余额'],
	colModel :[ 
	    {name:'jjzh', index:'jjzh',align:'center'},
		{name:'jjkh', index:'jjkh',align:'center'},
		{name:'jjzhye', index:'jjzhye',align:'center'},
		{name:'hkdw', index:'hkdw',align:'center'},
	    {name:'dkzh', index:'lnAcctNo',align:'center'}, 
		{name:'ncye', index:'ncye',align:'center'},
		{name:'bjhkrq', index:'bjhkrq',align:'center'}, 
		{name:'bchkje', index:'bchkje',align:'center'}, 
		{name:'bnljhkje', index:'bnljhkje',align:'center'},
		{name:'hkhbjye', index:'hkhbjye',align:'center'}
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
	loadComplete:function(data){
		if(data && data.rows.length>0){
			jQuery("#hkList").setGridHeight(data.rows.length * 22 + 18);
		}else{
			jQuery("#hkList").setGridHeight(0);
		}
	},
	shrinkToFit:false,
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
$("#hkList").setGridWidth($("#conditions").width());
$(window).bind('resize',function(){
	$("#hkList").setGridWidth($("#conditions").width());
});

// 添加按钮
$(document).ready(function(){
	if('<%=batch%>' == '1'){
		var buttonJSonString = '[{"buttonHandler":"batchQueding","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_hkList > .ui-jqgrid-titlebar"),buttonJSonString);
	}else{
		var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_hkList > .ui-jqgrid-titlebar"),buttonJSonString);
	}
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
	var sd = document.getElementById('startDate').value;
	var ed = document.getElementById('endDate').value;
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

	var startDate = document.getElementById("startDate").value; //开始时间
	var endDate = document.getElementById("endDate").value;//截止时间
	var hkdw = document.getElementById('hkdw').value;// 还款单位
	var dkzh = document.getElementById('dkzh').value;// 贷款账号
	var jjzh = document.getElementById('jjzh').value;//基金账号
	var jjkh = document.getElementById('jjkh').value;//基金客户
	var url1 = "<%=basePath%>wtdk/funcBack_query.do";
	jQuery("#hkList").setGridParam({postData:{
		'backVO.hkdw' : hkdw,
		'backVO.dkzh' : dkzh,
		'backVO.startDate' : startDate,
		'backVO.jjzh' : jjzh,
		'backVO.jjkh' : jjkh,
		'backVO.endDate' : endDate
	},
	url:'<%=basePath%>wtdk/funcBack_query.do'
	}).trigger("reloadGrid");
}

// 点击确定回调函数
function queding(){
	var gr = jQuery("#hkList").jqGrid('getGridParam','selarrrow');
	var hkrq = jQuery("#hkList").getCell(gr,'bjhkrq');
	var lnNo = jQuery("#hkList").getCell(gr,'dkzh')
	if(gr.length == 1 && gr!=""){
		window.opener.callBack(hkrq,lnNo);
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
