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
</body>
</html>