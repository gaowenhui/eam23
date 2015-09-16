<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String itemId = (String)request.getAttribute("itemId");	
 	String itemType = (String)request.getAttribute("itemType");	
 	String cldId = (String)request.getAttribute("cldId");
 	String assetUrl = basePath + "cjtz/czCztzfaXxAction_showZcxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 	String itemUrl = basePath + "cjtz/czCztzfaXxAction_showCldxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
%>
<html>
  <head>
    <base href="<%=basePath%>" />
    <title>处置项目信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="STYLESHEET" type="text/css" href="resource/js/DHtmlTab/dhtmlxtabbar.css">
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxtabbar.js"></script>
  </head>
  <body>
  	<br />
	<div id="a_tabbar" style="width:100%; height:100%;"/>
	<script>
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "资产信息", "100px");
		tabbar.addTab("a2", "项目信息", "80px");
		tabbar.addTab("a3", "上会信息", "80px");
		tabbar.addTab("a4", "汇总信息", "80px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=assetUrl %>");
		tabbar.setContentHref("a2","<%=itemUrl %>");
		tabbar.setContentHref("a3","<%=basePath %>zccz/dealTrace1Head_viewMeetingInfo.do?itemId=<%=itemId%>");
		tabbar.setContentHref("a4","<%=basePath %>zccz/dealTrace1Head_viewSummaryInfo.do?itemId=<%=itemId%>");
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

