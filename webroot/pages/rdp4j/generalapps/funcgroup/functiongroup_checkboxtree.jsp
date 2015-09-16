<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="inc.jsp"%>
<%
	
	List list = (List)request.getAttribute("funcgrouptreelist");
%>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/resource/css/maincss.css"
			type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/resource/js/checkboxtree.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/resource/css/edittree.css">
		<link rel="stylesheet" type="text/css"
			href="/rdp4j/resource/js/jstree/tree_component.css">
		<script type="text/javascript"> 
function test() {
	alert("操作成功！");
	var deptid = "";
	var deptname = "";
 
	var checkIdObj = document.getElementsByName("node");
	for (var i = 0; i < checkIdObj.length; i++) {
		if (checkIdObj(i).checked) {
			var values = checkIdObj(i).value;
			alert(values);
			var ids = values.substring(0, values.lastIndexOf("@"));
			var names = values.substring(values.lastIndexOf("@") + 1,
					values.length);
			alert(ids + "///" + names);
			deptid = deptid + "," + ids;
			deptname = deptname + "," + names;
		}
	}
}

function checkvalue(){
var checkIdObj = document.getElementsByName("node");
	for (var i = 0; i < checkIdObj.length; i++) {
		if (checkIdObj(i).checked) {
			return true;
			form1.submit();
		}else{
			return false;
		}
	}
}
</script>
		<style>
a {
	font-size: 12px;
	font-family: Verdana;
	text-decoration: none;
	color: red
}
</style>
	</head>
	<body bgcolor="#F7F7F7">
		<form id='form1' name='form1' target='_parent'
			action='funcgroup_roleaddfungroup.do' method='post'>
			角色编号：
			<input type='text' name='tid' size='10' readonly='true'
				value='<%=request.getParameter("tid")%>'>
			<input type="submit" class='button1' value='确定'>
			<!-- <input type="button" onclick='test()' class='button1' value='测试' > -->
			<script language="JavaScript">
<!--
var root = new dTree("root")
root.add("0","-1","","功能树管理","blank.jsp","功能树管理","contentRight",myicon.folder.src,myicon.folderOpen.src);
<%
for (int i = 0; i < list.size(); i++) {
	HashMap hm = (HashMap) list.get(i);
	String strMenuID = hm.get("TID").toString();
	String strMenuName =  (String) hm.get("func_group_name");
	String strUpperID =   hm.get("par_id").toString();
%>
	root.add("<%=strMenuID%>","<%=strUpperID%>","","<%=strMenuName%>","","<%=strMenuName%>","contentRight",myicon.folder.src,myicon.folderOpen.src);
<%}%>
document.write(root)
var NodeStr = "";
-->
</script>
		</form>
	</BODY>
</HTML>
<SCRIPT language="javascript">   	 	
${strjschecktree}
</SCRIPT>
