<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="inc.jsp"%>
<%
	List list = (List)request.getAttribute("functiongrouptreelist");
%>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath() %>/resource/js/edittree.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/edittree.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/js/jstree/tree_component.css" >


<style>
a {
	font-size: 12px;
	font-family: Verdana;
	text-decoration: none;
	color: red
}
</style>
</head>
<body onselectstart="return false" bgcolor="#F7F7F7">
<script language="JavaScript">

var root = new dTree("root")
root.add("0","-1","","功能树管理","<%=request.getContextPath()%>/funcgroup/funcgroup_add.do?pid=0","功能树管理","contentRight",myicon.folder.src,myicon.folderOpen.src);
<%
for (int i = 0; i < list.size(); i++) {
	HashMap hm = (HashMap) list.get(i);
	String strMenuID = hm.get("TID").toString();
	String strMenuName =  (String) hm.get("func_group_name");
	String strUpperID =   hm.get("par_id").toString();
%>
	root.add("<%=strMenuID%>","<%=strUpperID%>","","<%=strMenuName%>","<%=request.getContextPath()%>/funcgroup/funcgroup_edit.do?UpperID=<%=strUpperID%>&tid=<%=strMenuID%>","<%=strMenuName%>","contentRight",myicon.folder.src,myicon.folderOpen.src);
<%}%>
document.write(root)
var NodeStr = "";

</script>
</BODY>
</HTML>
<SCRIPT src="../../js/windowsmenu.js"></SCRIPT>
<SCRIPT language="javascript">   	 	
	function edittreedata(NodeID) {
		var m1=new alai_menu()	 	 	 
		m1.add("增加","url","javascript:window.location.assign('menuadd.jsp?UpperID="+NodeID+"')","contentRight")
		m1.add("删除","js","doDelete("+NodeID+")");   
		m1.show();
	}
//-----------------------------------------------------------------------------
function doDelete(NodeID) {
	if(confirm("你真的要删除该菜单吗？")) {
		window.location.assign('menudelete.jsp?MenuID='+NodeID);
	}
}
</SCRIPT>