<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tansun.rdp4j.common.model.orm.bo.PTUserBO"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form id="myform">
	<s:hidden name="pgvo.scxmId" id="scxmId" cssClass="input" />
	<s:hidden name="pgvo.scydId" id="scydId" cssClass="input" />
	<s:hidden name="pgvo.jtyjId" id="jtyjId" cssClass="input" />
	<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="endWhith">
		<tr>
			<td class="td_zxy01">审查项目：</td>
			<td class="td_zxy02"><s:textfield name="pgvo.scxmText" id="scxmText" cssClass="input" /></td>
			<td class="td_zxy01">审查要点：</td>
			<td class="td_zxy02"><s:textfield name="pgvo.scydText" id="scydText" cssClass="input" ></s:textfield></td>
		</tr>
		<tr> 
	        <td  class="td_zxy01" >具体意见：</td>
	        <td class="td_zxy03" colspan="3">
	            <s:textarea name="pgvo.jtyjText" id="jtyjText" cssClass="area" style="width:92.5%;" rows="4"></s:textarea>
	        </td>
		</tr>
		<tr>
			<td class="td_zxy01" colspan="4">
				<input type="button" value="确定" onclick="queding();" class="buttonface" >
				<s:reset value="重置" cssClass="buttonface" ></s:reset> 
			</td>
		</tr>
	</table>
</s:form>
</body>
<script type="text/javascript">
function queding(){
	/*var scxmId = document.getElementById("scxmId").value;
	var scxmText = document.getElementById("scxmText").value;
	var scydId = document.getElementById("scydId").value;
	var scydText = document.getElementById("scydText").value;
	var jtyjId = document.getElementById("jtyjId").value;
	var jtyjText = document.getElementById("jtyjText").value;
	var url = "<%=basePath %>zccz/dealEvalHead_updatePgsc.do";
	$.post(url,{"scxmId":scxmId,"headId":headId,"ngbmbh":ngbmbh},function(data){
		$('#bianhao').val(data);
		window.parent.removeObj("#shengchenButton");
		var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
	});
	*/
	//myform.action = "<%=basePath %>zccz/dealEvalHead_updatePgsc.do";
	//myform.submit();
	var scxmId = document.getElementById("scxmId").value;
	var scxmText = document.getElementById("scxmText").value;
	var scydId = document.getElementById("scydId").value;
	var scydText = document.getElementById("scydText").value;
	var jtyjId = document.getElementById("jtyjId").value;
	var jtyjText = document.getElementById("jtyjText").value;
	var url = "<%=basePath %>zccz/dealEvalHead_updatePgsc.do?xmText="+scxmText+"&ydText="+scydText+"&yjText="+jtyjText;
	url = encodeURI(url);
	$.post(url,{"xmId":scxmId,"ydId":scydId,"yjId":jtyjId},function(data){
		if(data!=null || data!=""){
			alert(data);
			window.opener.reloadPGSC();
			window.close();
		}
	});
}

if('<%=request.getAttribute("message")%>' != "null") {
	alert("<%=request.getAttribute("message")%>！");
	window.opener.reloadPGSC();
	window.close();
}
</script>
</html>