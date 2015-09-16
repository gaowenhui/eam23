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
<s:hidden name="body.headId" id="headId"></s:hidden>
<s:hidden name="body.id" id="bodyId"></s:hidden>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
    <tr>
        <td class="td_zxy01">基金系统账号</td>
        <td class="td_zxy02"><s:textfield name="body.fundAccount" readonly="true" /></td>
        <td class="td_zxy01">客户编号：</td>
        <td class="td_zxy02"><s:textfield name="body.khbh" readonly="true" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">客户名称： </td>
		<td class="td_zxy02"><s:textfield name="body.khmc" readonly="true" /></td>
		<td class="td_zxy01">审批结果： </td>
		<td class="td_zxy02"><s:textfield name="body.spjg" readonly="true" onblur="isString(this);" /></td>
	</tr>
    <tr>
		<td class="td_zxy01">备注：</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea name="body.bz" cssClass="area" readonly="true" rows="4"></s:textarea>
		</td>
    </tr>
</table>
</s:form>

<script type="text/javascript">
function baocun(){
	var bodyId = document.getElementById('bodyId').value;
	if(bodyId==null||bodyId==''){
		myform.action='<%=basePath%>wtdk/endInfo_saveBody.do';
	}else{
		myform.action='<%=basePath%>wtdk/endInfo_updateBody.do'
	}
}

function choose(){
	var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
	window.open('<%=basePath%>wtdk/endInfo_findFuInfo.do','基金信息',type);
}

// 选择基金以后的回调方法
function callBack(gr){
	var headId = document.getElementById('headId').value;
	myform.action = "<%=basePath%>wtdk/endInfo_fuToBody.do?fuNo="+gr;
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