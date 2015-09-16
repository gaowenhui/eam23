<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@page language="java" import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String personType = request.getParameter("personType");
	String notPerson = request.getParameter("notPerson");
	if(StringUtils.isEmpty(notPerson)){
		notPerson = "false";
	}
%>
<html>
<head>
<title>部门人员信息</title>
<SCRIPT type="text/JavaScript">
function queding(){
	var id 		  = tree4ZcczTree.getSelectedItemId();
	id = id.split("_")[0];
	var value 	  = tree4ZcczTree.getSelectedItemText();
	var isUser = tree4ZcczTree.getUserData(id, "isUser");
	var parentId = tree4ZcczTree.getParentId(id);
	var parentName = tree4ZcczTree.getItemText(parentId);
	if(isUser == "1"){
		var personType = <%=personType%>;
		//alert(personType);
		window.opener.getCallBack4Tree(id,value,personType,parentId,parentName);
		window.close();
	}else{
		alert("请选择人员！");
	}
}
</SCRIPT>
</head>
<body>
	<table>
		<tr>
			<td>
				<s:submit value="确定" onclick="queding();"></s:submit>
				<s:submit value="取消" onclick="javaScript:window.close()"></s:submit>
			</td>
		</tr>	
		<tr>
			<td valign="top">
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs/csh_dhx_skyblue" width="100%" height="100%" multipe="false" threeState="true" 
					dataUrl="/deptData.jspa?tid=1&parid=0" id="tree4Zccz" skin="csh_dhx_skyblue" style="width:400;height:500"></e:itree>
			</td>
		</tr>

	</table>	
</body>
</html>



