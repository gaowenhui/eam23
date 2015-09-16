<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String loansId = (String)request.getAttribute("loansId");
	String ctlButton = (String)request.getAttribute("ctlButton");
	String assetType = (String)request.getAttribute("assetType");
	String zcczpg = (String)request.getAttribute("zcczpg");
	String zcczCldId = (String)request.getAttribute("zcczCldId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>基本信息</title>
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
	var loansId = '<%=loansId%>';
	var ctlButton = '<%=ctlButton%>'
	var assetType = '<%=assetType%>'
	var zcczpg = '<%=zcczpg%>'
	var zcczCldId = '<%=zcczCldId%>'

	tabbar = new dhtmlXTabBar("a_tabbar", "top");
	tabbar.setSkin('dhx_skyblue');
	tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
	tabbar.addTab("a1", "抵质押物信息", "100px");
	tabbar.addTab("a2", "处置信息", "100px");
	tabbar.setHrefMode("iframes-on-demand");
	tabbar.setContentHref("a1","<%=basePath%>stgl/weihu_newEntity.do?newAdd=1&fslx=3&loansId="+loansId+"&ctlButton="+ctlButton+"&assetType="+assetType+"&zcczpg="+zcczpg+"&zcczCldId="+zcczCldId);
	tabbar.setContentHref("a2","<%=basePath %>wtdk/loansQuery_chuzhixinxi.do?loansId="+loansId);
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

