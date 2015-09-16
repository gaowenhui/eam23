<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String bodyIds = (String)request.getAttribute("bodyIds");
	String ids = "";
	if(!"".equals(bodyIds)&&bodyIds!=null){
		ids = bodyIds;
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form id="myform">
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
    <tr>
        <td class="td_zxy01">本次拟划付金额：</td>
        <td class="td_zxy02"><s:textfield id="nhfje" onblur="checkFloat(this);" /></td>
		<td class="td_zxy01">审批划付金额： </td>
		<td class="td_zxy02"><s:textfield id="spje" onblur="checkFloat(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">审批结果： </td>
		<td class="td_zxy02"><s:textfield id="spjg"  onblur="isString(this);" /></td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
    <tr>
		<td class="td_zxy01">备注：</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea cssClass="area" id="bz" onblur="isString(this);" rows="4"></s:textarea>
		</td>
    </tr>
	<tr>
		<td class="td_form01" colspan="4">
			<s:submit value="保存" cssClass="buttonface" onclick="baocun();"></s:submit>
			<s:reset value="重置" cssClass="buttonface" ></s:reset>
		</td>
	</tr>
</table>
</s:form>

<script type="text/javascript">
// 保存
function baocun(){
	var nhfje = document.getElementById('nhfje').value;
	var spje = document.getElementById('spje').value;
	var spjg = document.getElementById('spjg').value;
	var bz = document.getElementById('bz').value;
	var bodyIds = '<%=ids%>';
	window.opener.callBackOperate(bodyIds,nhfje,spje,spjg,bz);
	window.close();
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