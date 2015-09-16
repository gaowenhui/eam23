<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>风险信息查询</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">客户名称：</td>
		<td class="td_zxy02"><s:textfield id="CCustName" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">客户编号： </td>
		<td class="td_zxy02"><s:textfield id="CCustId" cssClass="input" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">起始日期：</td>
		<td class="td_zxy02"><s:textfield id="startRiskDate"  cssClass="input"  /></td>
		<td class="td_zxy01">截止日期：</td>
		<td class="td_zxy02"><s:textfield id="endRiskDate" cssClass="input" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">贷款账号：</td>
		<td class="td_zxy02"><s:textfield id="lnAcctNo" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01"> 审核风险等级： </td>
		<td class="td_zxy02"><span class="td_page">
			<s:select list="{'','一级风险','二级风险','三级风险'}" id="verRiskLeve"></s:select>
		</span></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr>
</table>
</form>

<table id="risklist"></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>
    
<script type="text/javascript">
jQuery("#risklist").jqGrid({
	datatype: "json",
	colNames:['贷款账号','贷款方客户编号','贷款方名称','贷款代理行','委托人名称','预计损失金额','审核预计损失金额','贷款本金余额','风险分类等级'],
	colModel :[ 
	    {name:'lnAcctNo', index:'lnAcctNo',align:'center'}, 
		{name:'CCustId', index:'CCustId',align:'center'},
		{name:'CCustName', index:'CCustName',align:'center'}, 
		{name:'magDpt', index:'magDpt',align:'center'},
		{name:'DAcctNo', index:'DAcctNo',align:'center'}, 
		{name:'lostJe', index:'lostJe',align:'center'}, 
		{name:'verLostJe', index:'verLostJe',align:'center'},
		{name:'loansYE', index:'loansYE',align:'center'},
		{name:'riskLevel', index:'riskLevel',align:'center'}
  	],
	pager:'pgtoolbar1',
	ondblClickRow:function(gr){
		dbClickQuery(gr);
	},
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '风险信息列表',
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
$("#risklist").setGridWidth($("#conditions").width());
$(window).bind('resize',function(){
	$("#risklist").setGridWidth($("#conditions").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"modify","buttonIcon":"icon-edit","buttonText":"修改"},\
							 {"buttonHandler":"remove","buttonIcon":"icon-remove","buttonText":"删除"}\
							]';
	addButtons(jQuery("#gview_risklist > .ui-jqgrid-titlebar"),buttonJSonString);
	window.parent.clearPanelTool();
});

// 日期
$(function(){
	$("#startRiskDate,#endRiskDate").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
});

// 查询
function query(){
	var sd = document.getElementById('startRiskDate').value;
	var ed = document.getElementById('endRiskDate').value;
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
	var CCustName = document.getElementById("CCustName").value;//客户编号
	var startRiskDate = document.getElementById("startRiskDate").value; //开始时间
	var CCustId = document.getElementById("CCustId").value; //客户编号
	var endRiskDate = document.getElementById("endRiskDate").value;//截止日期
	var lnAcctNo = document.getElementById("lnAcctNo").value;//贷款账号
	var verRiskLeve = document.getElementById("verRiskLeve").value;//审核风险等级
	var url1 = "<%=basePath%>wtdk/riskQuery_query.do";
	jQuery("#risklist").setGridParam({postData:{
		'queryVO.CCustName' : CCustName,
		'queryVO.startRiskDate' : startRiskDate,
		'queryVO.CCustId' : CCustId,
		'queryVO.endRiskDate' : endRiskDate,
		'queryVO.lnAcctNo' : lnAcctNo,
		'queryVO.verRiskLeve' : verRiskLeve
	},
	url:'<%=basePath%>wtdk/riskQuery_query.do'
	}).trigger("reloadGrid");
}

//修改
function modify(){
	var gr = jQuery("#risklist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 1 && gr!=""){
		var type = 'height=600, width=1211,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=0';
		window.open('<%=basePath%>wtdk/riskQuery_riskInfo.do?lnNo='+gr+'&flush=true','风险信息修改','type');
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

function dbClickQuery(gr){
	var type = 'height=600, width=1211,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=0';
	window.open('<%=basePath%>wtdk/riskQuery_riskInfo.do?lnNo='+gr+'&flush=true','风险信息修改','type');
}

// 删除
function remove(){
	var gr = jQuery("#risklist").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0 || gr==""){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var delurl = '<%=basePath%>wtdk/riskQuery_deleteRisk.do?lnNo='+gr;
			$.post(delurl,{delBodyIds:"" + gr + ""}, function(data){
				jQuery("#risklist").trigger("reloadGrid");
			});
		}
	}
}

// 刷新表格
function reloadBody(){
	jQuery("#risklist").trigger("reloadGrid");
}

</script>
</body>
</html>
