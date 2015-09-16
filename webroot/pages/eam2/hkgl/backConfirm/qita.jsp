<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String confirmHeadId = String.valueOf(request.getAttribute("confirmHeadId"));
	boolean isQuery = false;
	isQuery = "true".equals((String)request.getAttribute("isQuery"))?true:false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	window.opener.reloadConfirm();
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>实体信息</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form id="myform">
	<s:hidden name="confirmBody.id" id="id" />
	<s:hidden name="confirmBody.headid" id="headid" />
	<s:hidden name="confirmBody.sfybc" value="是"></s:hidden>
	<s:hidden name="confirmBody.qrdlx" value="5"></s:hidden>
	<table border="1" cellpadding="0" cellspacing="0" class="table03" width="100%">
		<tr> 
	        <td  class="td_zxy01" >回款性质：</td>
	        <td class="td_zxy03" colspan="3">
	            <r:textarea name="confirmBody.qtHsxz" id="qtHsxz" cssClass="area" style="width:92.5%;" rows="4"/>
	        </td>
		</tr>
        <tr> 
	        <td  class="td_zxy01" >备    注：</td>
	        <td class="td_zxy03" colspan="3">
	            <r:textarea name="confirmBody.qtBz" id="qtBz" cssClass="area" style="width:92.5%;" rows="4"/>
	        </td>
		</tr>
		<tr>
			<td class="td_zxy01" colspan="6">
				<input type="button" value="确定" class="buttonface" onclick="saveThis();">
			</td>
		</tr> 
    </table>
</form>
</body>
<script type="text/javascript">
	function saveThis(){
		var id = document.getElementById('id').value;
		var confirmHeadId = '<%=confirmHeadId%>';
		if(id==''||id==null){
			myform.action = "<%=basePath%>hkgl/backConfirm_saveQTtoConfirmBody.do?confirmHeadId="+confirmHeadId;
			myform.submit();
		}else{
			myform.action = "<%=basePath%>hkgl/backConfirm_updataQTtoConfirmBody.do?confirmHeadId="+confirmHeadId;
			myform.submit();
		}
	}
</script>
</html>
