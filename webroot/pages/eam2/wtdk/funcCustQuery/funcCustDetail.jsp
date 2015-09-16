<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>基金账户详细信息</title>
<script type="text/javascript">
$(function(){
	// 附件添加按钮
	var buttonJSonString = '[{"buttonHandler":"addAss","buttonIcon":"icon-redo","buttonText":"下载附件"}]';
	addButtons(jQuery("#t_fujianList"), buttonJSonString);
	
	// 基金添加按钮
	var buttonJSonString = '[{"buttonHandler":"funcxiangxi","buttonIcon":"icon-search","buttonText":"详细"}]'
	addButtons(jQuery("#gview_funcList > .ui-jqgrid-titlebar"),buttonJSonString);
	
	// 贷款添加按钮
	var buttonJSonString = '[{"buttonHandler":"daikuanxiangxi","buttonIcon":"icon-search","buttonText":"详细"}]'
	addButtons(jQuery("#gview_loansList > .ui-jqgrid-titlebar"),buttonJSonString);
});
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="tt" class="easyui-tabs" style="height:750px;">

<div title="基本信息" closable="false">
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">客户编号：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciCustNo" id="ciCustNo" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">客户名称：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciChnName" id="ciChnName" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">单位中文名称：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciUnitChnInil" id="ciUnitChnInil" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">建档日期：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciFlstDt" id="ciFlstDt" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">法人客户编号：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciLgprRepCust" id="ciLgprRepCust" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">营业执照号：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciGovnCertNo" id="ciGovnCertNo" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">税务登记编号：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciTabsRegNo" id="ciTabsRegNo" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">注册资金：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciRegCap" id="ciRegCap" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">行业分类：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciBusntp" id="ciBusntp" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">企业规模：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciEntpScal" id="ciEntpScal" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">经营种类：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciAdmnTyp" id="ciAdmnTyp" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">经济性质：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciEconChar" id="ciEconChar" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">上级主管部门：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciMangDept" id="ciMangDept" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">财务联系人：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciFinConntr" id="ciFinConntr" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">最近往来银行1：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciLtstAwbk0" id="ciLtstAwbk0" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">最近往来银行2：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciLtstAwbk1" id="ciLtstAwbk1" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">贷款证号：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciLnCertNo" id="ciLnCertNo" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">批准贷款额度：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciAprvLnCrlmt" id="ciAprvLnCrlmt" readonly="true" cssClass="input" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">批准年度：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciAprvYr" id="ciAprvYr" readonly="true" cssClass="input" size="30" /></td>
		<td class="td_zxy01">批准文号：</td>
		<td class="td_zxy02"><s:textfield name="cust.ciAprvFileNo" id="ciAprvFileNo" readonly="true" cssClass="input" size="30" /></td>
	</tr>
</table>
</div>

<!-- ======================基金账户信息=============================== -->

<div title="基金账户信息" closable="false">
<table id="funcList"></table>
<div id="funWidth" style="width:100%;"></div>
<script type="text/javascript">
	var fundJSON = '<%=(String)request.getAttribute("fundJSON")%>';
	jQuery("#funcList").jqGrid({
		datatype: 'jsonstring',
		datastr:fundJSON,
		multiselect:true,
		colNames:['系统基金帐号','客户编号','客户名称','币种', '账户余额'],
		colModel :[
		    {name:'saAcctNo',index:'saAcctNo',center:"true"},
			{name:'saCustNo', index:'saCustNo',center:"true"},
			{name:'saCustName', index:'saCustName',center:"true"},
			{name:'saCurrCode', index:'saCurrCode',center:"true"},
			{name:'saAvlBal', index:'saAvlBal',center:"true"},
	 	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '基金账户信息',
		toolbar: [true,"top"],
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	// 设置宽度
	$("#funcList").setGridWidth($("#funWidth").width());
	$(window).bind('resize',function(){
		$("#funcList").setGridWidth($("#funWidth").width());
	});
	
	// 查看基金详细信息
	function funcxiangxi(){
		var gr = jQuery("#funcList").jqGrid('getGridParam','selarrrow');
		if(gr.length==1 && gr!=""){
			var url = '<%=basePath%>wtdk/funcQuery_funcInfo.do?funcNo='+gr;
			window.open(url,'基金详细信息','height=600, width=1211,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=0');
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
