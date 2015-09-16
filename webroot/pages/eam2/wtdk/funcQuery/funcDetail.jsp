<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基金账户详细信息</title>
<script type="text/javascript">
	$(function(){
		// 贷款信息添加按钮
		var buttonJSonString = '[{"buttonHandler":"daikuanxiangxi","buttonIcon":"icon-search","buttonText":"详细"}]'
		addButtons(jQuery("#gview_loansLista > .ui-jqgrid-titlebar"),buttonJSonString);
	});
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="tt" class="easyui-tabs" style="height:750px;">

<!-- ===============================基本信息=============================== -->

<div title="基本信息" closable="false">
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">系统基金帐号：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.saAcctNo" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">客户基金账号：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.saCustAcctNo" cssClass="input" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">客户编号：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.saCustNo" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">开户机构号：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.saOpacInstnNo" cssClass="input" readonly="true" /></td>
	</tr>
    <tr>
        <td class="td_zxy01"> 客户名称： </td>
        <td class="td_zxy02"><s:textfield name="queryVO.saCustName" cssClass="input" readonly="true" /></td>
        <td class="td_zxy01"> 开户机构名称： </td>
        <td class="td_zxy02"><s:textfield name="queryVO.saOpacInstnName" cssClass="input" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01"> 币种： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.saCurrCod" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">科目号： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.subCod" cssClass="input" readonly="true" /></td>
	</tr>
    <tr>
		<td class="td_zxy01"> 帐户余额： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.saAcctBal" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01"> 科目名称： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.subName" cssClass="input" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01"> 可用余额： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.saAvlBal" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">销户日期：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.saCacctDt" cssClass="input" readonly="true" /></td>
	</tr>
</table>
</div>

<!-- ===============================交易明细=============================== -->
	
<div title="交易明细" closable="false">
<table id="jiaoyilist"></table>
<script type="text/javascript">
	var mingxiJSON = '<%=(String)request.getAttribute("mingxiJSON")%>';
	jQuery("#jiaoyilist").jqGrid({
		datatype: 'jsonstring',
		datastr:mingxiJSON,
		multiselect:true,
		colNames:['交易金额(元)','账户余额','手续费','交易机构','机构名称', '交易日期','交易时间','账号'],
		colModel :[ 
			{name:'saTxAmt', index:'saTxAmt',align:'center'}, 
			{name:'saDdpAcctBal', index:'saDdpAcctBal',align:'center'},
			{name:'saSvc', index:'saSvc', width:90}, 
			{name:'saOpunCod', index:'saOpunCod', align:'center'}, 
			{name:'saOpunName', index:'tax', align:'center'},
			{name:'saTxDt', index:'dept', align:'center'}, 
			{name:'saTxTm', index:'total', align:'center'},
			{name:'saAcctNo', index:'name', align:'center'}
		],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '基金交易明细列表',
		jsonReader:{
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	$("#jiaoyilist").setGridWidth($("#conditions").width());
	$(window).bind('resize',function(){
		$("#jiaoyilist").setGridWidth($("#conditions").width());
	});
</script>
</div>

<!-- =============================关联贷款帐户列表=============================== -->
    
<div title="关联贷款帐户信息" closable="false">
<table id="loansLista"></table>
<script type="text/javascript">
	var lnJSON = '<%=(String)request.getAttribute("lnJSON")%>';
	jQuery("#loansLista").jqGrid({
		datatype: 'jsonstring',
		datastr:lnJSON,
		multiselect:true,
		colNames:['系统贷款账号','客户编号','客户名称','币种', '贷款总额','贷款余额'],
		colModel :[
			{name:'lnLnAcctNo', index:'lnLnAcctNo', align:'center'}, 
			{name:'lnCustNo', index:'lnCustNo', align:'center'},
			{name:'saCustName', index:'saCustName', align:'center'}, 
			{name:'lnCurrCod', index:'lnCurrCod', width:80, align:'center'}, 
			{name:'lnTotlLnAmtHypoAmt', index:'lnTotlLnAmtHypoAmt', align:'center'}, 
			{name:'lnLnBal', index:'lnLnBal', align:'center'}
	  	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '关联贷款账户列表',
		jsonReader:{
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	}); 
	
	// 设置宽度
	$("#loansLista").setGridWidth($("#conditions").width());
	$(window).bind('resize',function(){
		$("#loansLista").setGridWidth($("#conditions").width());
	});
	
	// 贷款详细
	function daikuanxiangxi(){
		var gr = jQuery("#loansLista").jqGrid('getGridParam','selarrrow');
		if(gr.length == 1 && gr!=""){
			var url = '<%=basePath%>wtdk/loansQuery_loansInfo.do?lnNo='+gr;
			window.open(url,'贷款详细信息','height=600, width=1211,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=0');
		}else{ 
			alert("请选择一条记录");
			return false;
		}
	}
	
</script>
</div>

</div>

</body>
</html>
