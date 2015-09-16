<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheetType = (String)request.getAttribute("sheetType");
	String headId = (String)request.getAttribute("headId");
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改卡片</title>
<SCRIPT language=JavaScript type=text/JavaScript>
function formSubmit(){
	myform.action = '<%=basePath%>kpgl/cardBody_saveBody.do?sheetType=sheetType'+<%=sheetType%>;
	myform.submit();
	window.opener.reloadJqGrid();
	window.close();
}
function reloadJqGrid(){
	window.opener.reloadJqGrid();
	window.close();
}
function choose(){
	var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.open('<%=request.getContextPath()%>/kpgl/cardQuery_init.do','选择',_g_privateDialogFeatures);
}
function getBodyInfo(cardId){
	var sheetType = '<%=sheetType%>';
	var headId = '<%=headId%>';
	var url = "<%=request.getContextPath()%>/kpgl/cardBody_cardType.do?&sheetType=<%=sheetType%>&headId=<%=headId %>&cardId="+cardId;
	cardModify.window.location = url ;
}
</SCRIPT>
</head>
<body>
<table width="100%" border="0" cellpadding="2" cellspacing="0"  class="newtable" align="center"  >
	<tr>
      	<td class="td_top" align="center" >修改卡片</td>
    </tr>
    <tr>
      	<td class="td_form01" align="center" >
      		<input type="button" class="buttonface" value="选择卡片" onclick="choose()"/>
      	</td>
    </tr>
    <tr>
		<td>
			<iframe id="cardModify" frameBorder=0 height="800" width="100%" scrolling="no"
				src="">
			</iframe>
		</td>
	</tr>
</table>
    
</body>
</html>
