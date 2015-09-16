<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
boolean ishuiqian = false;
String isHUIQIAN = (String)request.getAttribute("isHUIQIAN");
if("true".equals(isHUIQIAN)){
	ishuiqian = true;
}
String nodeValue = (String)request.getAttribute("nodeValue");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>部门</title>
<SCRIPT type=text/JavaScript>
function queding(){
	var type4Jygdzc = '${type4Jygdzc}';
	var id 		  = tree4JygdzcTree.getSelectedItemId();
	var value 	  = tree4JygdzcTree.getSelectedItemText();
	var aa = tree4JygdzcTree.hasChildren(id);
	if(aa>0||id==''){
		alert("请选择一种类别！");
	}else{
		window.opener.getCallBack4Tree(type4Jygdzc,id,value);
		window.close();
	}
}
function queding1(){
	var type4Jygdzc = '<%=request.getAttribute("type4Jygdzc") %>';
	var id 		  = tree4JygdzcTree.getAllChecked();
	var ids = id.split(",");
	var returnValue = "";
	var aa = 0;
	for(var i=0;i<ids.length;i++){
		returnValue = returnValue+tree4JygdzcTree.getItemText(ids[i]);
		if(i !=ids.length-1){
			returnValue += ",";
		}
		aa = tree4JygdzcTree.hasChildren(ids[i]);
		if(aa>0||ids[0]==''){
			break;
		}
	}
	if(aa>0){
		alert("请选择一个或多个部门，不能选择大类！");
	}else{
		window.opener.getCallBack4Tree(type4Jygdzc,id,returnValue);
		window.close();
	}
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table>
		<tr>
			<td valign="top">
			<%if(ishuiqian){ %>
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="true" threeState="false"  treetype="%{#request.type4Jygdzc}" id="tree4Jygdzc" skin="csh_vista" style="width:200;height:360"></e:itree>
			<%}else if("01".equals(nodeValue)||"02".equals(nodeValue)||"03".equals(nodeValue)){ %>
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" 
				multipe="false" threeState="true"  treetype="%{#request.type4Jygdzc}" 
				nodevalue="%{#request.nodeValue}" id="tree4Jygdzc" skin="csh_vista" style="width:200;height:360"></e:itree>
			<%}else{ %>
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="false" threeState="false"  treetype="%{#request.type4Jygdzc}" id="tree4Jygdzc" skin="csh_vista" style="width:200;height:360"></e:itree>
			<%} %>	
			</td>
		</tr>
		<tr>

			<td>
				<%if(ishuiqian){ %>
					<s:submit value="确定" onclick="queding1();"></s:submit>
				<%}else{ %>
					<s:submit value="确定" onclick="queding();"></s:submit>
				<%} %>
				<s:submit value="取消" onclick="javaScript:window.close()"></s:submit>
			</td>
		</tr>
	</table>	
</body>
</html>



