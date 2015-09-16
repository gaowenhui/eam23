<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String type4Card = (String)request.getAttribute("type4Card"); 
boolean isAsstType = false;
if("assetType".equals(type4Card)){
	isAsstType = true;
}
String isCardType4Change1 = (String)request.getAttribute("isCardType4Change"); 
boolean isCardType4Change = false;
if("true".equals(isCardType4Change1)){
	isCardType4Change = true;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>选择</title>
<SCRIPT type=text/JavaScript>
function queding(){
	var type4Card = '<%=request.getAttribute("type4Card") %>';
	var id 		  = tree4CardTree.getSelectedItemId();
	var value 	  = tree4CardTree.getSelectedItemText();
	var aa = tree4CardTree.hasChildren(id);
	if(aa>0||id==''){
		alert("请选择一种类别！");
	}else{
		window.opener.getCallBack4Tree(type4Card,id,value);
		window.close();
	}
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table>
		<tr>
			<td valign="top">
			<%if(isAsstType&&!isCardType4Change){ %>
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="false" threeState="true"  treetype="%{#request.type4Card}" nodevalue="%{#request.nodeValue}" id="tree4Card" skin="csh_vista" style="width:200;height:360"></e:itree>
			<%}else{ %>
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="false" threeState="false"  treetype="%{#request.type4Card}" id="tree4Card" skin="csh_vista" style="width:200;height:360"></e:itree>
			<%} %>
			</td>
		</tr>
		<tr>
			<td>
				<s:submit value="确定" onclick="queding();"></s:submit>
				<s:submit value="取消" onclick="javaScript:window.close()"></s:submit>
			</td>
		</tr>
	</table>	
</body>
</html>



