<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String rework = request.getParameter("rework");
	String stockId = request.getParameter("stockId");
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
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "基本信息", "80px");
		tabbar.addTab("a2", "工作记录", "80px");
		tabbar.addTab("a3", "相关流程信息", "80px");
		tabbar.addTab("a4", "日志信息", "80px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=basePath %>stock/maintain_detailInfo.do?tag="+1+"&stockId=${sinfo.id}");
		tabbar.setContentHref("a2","<%=basePath %>stock/maintain_detailInfo.do?tag="+2+"&stockId=${sinfo.id}");
		tabbar.setContentHref("a3","<%=basePath %>stock/maintain_detailInfo.do?tag="+3+"&stockId=${sinfo.id}");
		tabbar.setContentHref("a4","<%=basePath %>stock/maintain_detailInfo.do?tag="+4+"&zcid=${sinfo.id}");
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

