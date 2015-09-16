<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>合同信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="STYLESHEET" type="text/css" href="resource/js/DHtmlTab/dhtmlxtabbar.css">
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxtabbar.js"></script>
  </head>
  <body>
	<div id="a_tabbar" style="width:100%; height:100%;"/>
	<script>
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "合同信息", "80px");
		tabbar.addTab("a2", "变动信息", "80px");
		tabbar.addTab("a3", "清算信息", "80px");
		tabbar.addTab("a4", "流程信息", "80px");
		
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=basePath %>htqs/ContractManageBody_modifyBody.do?htlx=${htlx}&view=${view}&headId=${headId}&sheettype=biandong&htId=${htId}&operate=change");
		tabbar.setContentHref("a2","<%=basePath %>htqs/ContractManageBody_modifyBody.do?headId=${headId}&sheettype=changeHistory&htId=${htId}");
		tabbar.setContentHref("a3","<%=basePath %>htqs/ContractManageBody_modifyBody.do?sheettype=liquidate&htId=${htId}");
		tabbar.setContentHref("a4","<%=basePath %>htqs/ContractQuery_flow.do?sheettype2=change&htId=${htId}");
		
		tabbar.setTabActive("a1");
		tabbar.attachEvent("onSelect", function(id) {
		    if (tabbar.cells(id)._frame);
		    //alert(tabbar.cells(id)._frame.contentWindow.location);
		    return true;
		});
		tabbar.enableAutoReSize("enable")
		tabbar.enableAutoSize("enable","enable");
	</script>
  </body>
  
</html>

