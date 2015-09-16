<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath %>">
    <title>跟踪信息</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="STYLESHEET" type="text/css" href="resource/js/DHtmlTab/dhtmlxtabbar.css"/>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxtabbar.js"></script>
  </head>
  <body>
	<div id="a_tabbar" style="width:100%; height:100%;"/>
	<script>
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=request.getContextPath() %>/resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "签署协议", "100px");
		tabbar.addTab("a2", "回款回收", "100px");
		tabbar.addTab("a3", "权属变更", "100px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=request.getContextPath() %>/zccz/disposeTrack_modifyChildTrack.do?zcIds=${zcIds}&xmIds=${xmIds}&zcCzfs=${zcCzfs}&czgzhj=disposeGqzrQsxy&cache="+new Date());
		tabbar.setContentHref("a2","<%=request.getContextPath() %>/zccz/disposeTrack_modifyChildTrack.do?zcIds=${zcIds}&xmIds=${xmIds}&zcCzfs=${zcCzfs}&czgzhj=disposeGqzrHkhs&cache="+new Date());
		tabbar.setContentHref("a3","<%=request.getContextPath() %>/zccz/disposeTrack_modifyChildTrack.do?zcIds=${zcIds}&xmIds=${xmIds}&zcCzfs=${zcCzfs}&czgzhj=disposeGqzrGqbg&cache="+new Date());
		tabbar.setTabActive("a1");
		tabbar.attachEvent("onSelect", function(id) {
		    if (tabbar.cells(id)._frame);
		    return true;
		});
		tabbar.enableAutoReSize("enable")
		tabbar.enableAutoSize("enable","enable");
	</script>
  </body>
  
</html>

