<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String saveORupdate = (String)request.getAttribute("saveORupdate");
	boolean isDisable = false;
	isDisable = "true".equals((String)request.getAttribute("isDisable"))?true:false;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form id="myform">
<s:hidden name="body.sheadId" id="headId"></s:hidden>
<s:hidden name="body.id" id="bodyId"></s:hidden>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">还款单位：</td>
        <td class="td_zxy02"><s:textfield name="body.hkdw" readonly="true" /></td>
        <td class="td_zxy01">贷款账号：</td>
        <td class="td_zxy02"><s:textfield name="body.dkzh" readonly="true" /></td>
    </tr>
    <tr>
        <td class="td_zxy01">核算科目：</td>
        <td class="td_zxy02"><s:textfield name="body.hskm" readonly="true" /></td>
        <td class="td_zxy01">年初余额：</td>
        <td class="td_zxy02"><s:textfield name="body.ncye" readonly="true" /></td>
    </tr>
    <tr>
        <td class="td_zxy01">本次还款日期：</td>
        <td class="td_zxy02"><s:textfield name="body.bjhkrq" readonly="true" /></td>
        <td class="td_zxy01">本次还款金额：</td>
        <td class="td_zxy02"><s:textfield name="body.bchkje" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">本年累计还款金额： </td>
		<td class="td_zxy02"><s:textfield name="body.bnljhkje" readonly="true" /></td>
		<td class="td_zxy01">还款后本金余额：</td>
		<td class="td_zxy02"><s:textfield name="body.hkhbjye" readonly="true" /></td>
	</tr>
    <tr>
        <td class="td_zxy01">对应委托单位名称：</td>
        <td class="td_zxy02"><s:textfield name="body.dywtdw" readonly="true" /></td>
        <td class="td_zxy01">本次拟划付金额：</td>
        <td class="td_zxy02"><s:textfield name="body.nhfje" onblur="checkFloat(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">审批结果： </td>
		<td class="td_zxy02"><s:textfield name="body.spjg" onblur="isString(this);" /></td>
		<td class="td_zxy01">审批划付金额： </td>
		<td class="td_zxy02"><s:textfield name="body.spje" onblur="checkFloat(this);" /></td>
	</tr>
    <tr>
		<td class="td_zxy01">备注：</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea name="body.bz" cssClass="area" onblur="isString(this);" rows="4"></s:textarea>
		</td>
    </tr>
	<tr>
		<td class="td_form01" colspan="4">
			<%if(isDisable){ %>
			<input type="button" value="选择贷款信息" class="buttonface" onclick="choose();" >
			<%}else{ %>
			<input type="button" value="选择贷款信息" class="buttonface" onclick="choose();" >
			<s:submit value="保存" cssClass="buttonface" onclick="baocun();"></s:submit>
			<s:reset value="重置" cssClass="buttonface" ></s:reset>
			<%} %>
		</td>
	</tr>
</table>
</s:form>

<script type="text/javascript">
// 保存或修改
function baocun(){
	var bodyId = document.getElementById('bodyId').value;
	if(bodyId==null||bodyId==''){
		myform.action='<%=basePath%>wtdk/funcBack_saveBody.do';
	}else{
		myform.action='<%=basePath%>wtdk/funcBack_updateBody.do'
	}
}

// 打开贷款信息查询页面
function choose(){
	var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
	window.open('<%=basePath%>wtdk/funcBack_findLnInfo.do?','贷款信息',type);
}

// 选择完贷款信息以后的回调方法
function callBack(hkrq,lnNo){
	var headId = document.getElementById('headId').value;
	myform.action = "<%=basePath%>wtdk/funcBack_lnToBody.do?lnNo="+lnNo+"&headId="+headId+"&hkrq="+hkrq;
	myform.submit();
}

// 执行完成后弹出提示框
if('<%=request.getAttribute("message")%>' != "null") {
	alert("<%=request.getAttribute("message")%>！");
	window.opener.reloadBody();
	window.close();
}
</script>
</body>
</html>