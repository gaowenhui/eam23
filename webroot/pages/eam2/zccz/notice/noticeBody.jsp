<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String bodyIds = (String)request.getAttribute("bodyIds");
	String type = (String)request.getAttribute("type");
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
		<td class="td_zxy01">资产描述：</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea cssClass="area" id="zcms" rows="4"></s:textarea>
		</td>
    </tr>
    <tr>
		<td class="td_zxy01">资产处置意思表示：</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea cssClass="area" id="czysbs" rows="4"></s:textarea>
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
	var zcms = document.getElementById('zcms').value;
	var czysbs = document.getElementById('czysbs').value;
	var bodyIds = '<%=ids%>';
	var type = '<%=type%>';
	var stUrl = '<%=basePath%>zccz/noticeBody_updBody.do';
	$.post(stUrl,{bodyIds:""+bodyIds+"",zcms:""+zcms+"",czysbs:""+czysbs+""}, function(data){
		if(data!=null && data!=''){
			alert(data);
			window.opener.reloadGrid(type);
			window.close();
		}
	});
}
</script>
</body>
</html>