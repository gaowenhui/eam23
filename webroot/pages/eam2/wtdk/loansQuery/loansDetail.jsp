<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>贷款账户详细信息</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="tt" class="easyui-tabs" style="height:750px;">

<!-- ==============================基本信息=============================== -->
<div title="基本信息" closable="false">
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">系统贷款帐号：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnLnAcctNo" cssClass="input" readonly="true" /></td>
        <td class="td_zxy01">贷款总额：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnTotlLnAmtHypoAmt" cssClass="input" readonly="true" /></td>
    </tr>
    <tr>
        <td class="td_zxy01"> 客户贷款账号： </td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnCAcctNo" cssClass="input" readonly="true" /></td>
        <td class="td_zxy01">贷款余额：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnLnBal" cssClass="input" readonly="true" /></td>
    </tr>
    <tr>
        <td class="td_zxy01">客户编号：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnCustNo" cssClass="input" readonly="true" /></td>
        <td class="td_zxy01">累计收手续费：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnAccumRecvSvc" cssClass="input" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01"> 客户名称： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnCustName" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">本年累计回收：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnCrntYrRevAccum" cssClass="input" readonly="true" /></td>
	</tr>
    <tr>
        <td class="td_zxy01">机构名称： </td>
        <td class="td_zxy02"><s:textfield name="queryVO.branchName" cssClass="input" readonly="true" /></td>
        <td class="td_zxy01">本年已收贷款利息：</td>
        <td class="td_zxy02"><s:textfield name="queryVO.lnCrntYrColledInt" cssClass="input" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01"> 贷款种类名称： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnLnTyp" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">累计收息：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnAccumColi" cssClass="input" readonly="true" /></td>
	</tr>
    <tr>
		<td class="td_zxy01">科目号： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.kmbh" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">本年累计发放：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnCrntYrLnAccum" cssClass="input" readonly="true" /></td>
    </tr>
    <tr>
		<td class="td_zxy01"> 科目名称： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.kmmc" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">本期还款金额：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnCrntYrLnAccum" cssClass="input" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01">帐户状态： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnAcctSts" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">催收应收利息：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnOvdlnIntrbl" cssClass="input" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">存款帐号： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.saSysAcctNo" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">省行管理人：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.rymc" cssClass="input" readonly="true" /></td>
	</tr>
    <tr>
		<td class="td_zxy01">清算日期： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnDueDt" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">管理人电话：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lxfs" cssClass="input" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01">一级机构名称： </td>
		<td class="td_zxy02"><s:textfield name="queryVO.firstBranch" cssClass="input" readonly="true" /></td>
		<td class="td_zxy01">利息：</td>
		<td class="td_zxy02"><s:textfield name="queryVO.lnArfnSchdInt" cssClass="input" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01">担险状态： </td>
	    <td class="td_zxy02"><s:textfield name="queryVO.riskState" cssClass="input" readonly="true" /></td>
	    <td class="td_zxy01">委托方是否已转资本金：</td>
	    <td class="td_zxy02"><s:textfield name="" cssClass="input" readonly="true" /></td>
	</tr>
</table>
</div>

<!-- ==============================贷款本金明细列表=============================== -->
<div title="贷款本金明细" closable="false">
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
</div>

<!-- ==============================关联基金帐户列表=============================== -->
<div title="关联基金帐户信息" closable="false">
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">系统基金帐号：</td>
		<td class="td_zxy02"><s:textfield name="funcVO.saAcctNo" readonly="true" /></td>
		<td class="td_zxy01">客户基金账号：</td>
		<td class="td_zxy02"><s:textfield name="funcVO.saCustAcctNo" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">客户编号：</td>
		<td class="td_zxy02"><s:textfield name="funcVO.saCustNo" readonly="true" /></td>
		<td class="td_zxy01">开户机构号：</td>
        <td class="td_zxy02"><s:textfield name="funcVO.saOpacInstnNo" readonly="true" /></td>
	</tr>
    <tr>
        <td class="td_zxy01"> 客户名称： </td>
        <td class="td_zxy02"><s:textfield name="funcVO.saCustName" readonly="true" /></td>
        <td class="td_zxy01"> 开户机构名称： </td>
        <td class="td_zxy02"><s:textfield name="funcVO.saOpacInstnName" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01"> 币种： </td>
		<td class="td_zxy02"><s:textfield name="funcVO.saCurrCod" readonly="true" /></td>
		<td class="td_zxy01">科目号： </td>
		<td class="td_zxy02"><s:textfield name="funcVO.saAclg" readonly="true" /></td>
	</tr>
    <tr>
		<td class="td_zxy01"> 帐户余额： </td>
		<td class="td_zxy02"><s:textfield name="funcVO.saAcctBal" readonly="true" /></td>
		<td class="td_zxy01"> 科目名称： </td>
		<td class="td_zxy02"><s:textfield name="funcVO.saAclgName" readonly="true" /></td>
    </tr>
	<tr>
		<td class="td_zxy01"> 可用余额： </td>
		<td class="td_zxy02"><s:textfield name="funcVO.saAvlBal" readonly="true" /></td>
		<td class="td_zxy01">销户日期：</td>
		<td class="td_zxy02"><s:textfield name="funcVO.saCacctDt" readonly="true" /></td>
	</tr>
</table>
</div>

<!-- =================================抵质押物信息======================================== 
<div title="抵质押物信息" closable="false">
</div>
-->

</div>
</body>
</html>
