<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.eam2.zccz.ZcczCommon"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String itemId = (String)request.getAttribute("itemId");	
 	String itemType = (String)request.getAttribute("itemType");	
 	String cldId = (String)request.getAttribute("cldId");
 	String zclb = (String)request.getAttribute("zclb");
 	String bufenjiean = (String)request.getAttribute("bufenjiean");
 	String flag = (String)request.getAttribute("flag");
 	String headId = (String)request.getAttribute("headId");
 	String assetUrl = "";
 	String itemUrl = "";
 	if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY,itemType)){
 		//实体整体处置
 		assetUrl = basePath + "zccz/entityDealHead_showStczZc.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		itemUrl = basePath + "zccz/entityDealHead_showStczCld.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 	}else if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY_PERSON,itemType)){
 		//实体人员安置
 		assetUrl = basePath + "zccz/personDealHead_showPersonZc.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		itemUrl = basePath + "zccz/personDealHead_showPersonCld.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 	}else {
 		assetUrl = basePath + "zccz/assetDealHead_showZcxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType+"&bufenjiean=" + bufenjiean + "&headId1=" + headId;
 		itemUrl = basePath + "zccz/assetDealHead_showCldxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 	}
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
		tabbar.addTab("a1", "处置资产信息", "100px");
		tabbar.addTab("a2", "项目信息", "80px");
		tabbar.addTab("a3", "上会信息", "80px");
		tabbar.addTab("a4", "汇总信息", "80px");
		tabbar.addTab("a5", "收入费用", "80px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=assetUrl %>");
		tabbar.setContentHref("a2","<%=itemUrl %>");
		tabbar.setContentHref("a3","<%=basePath %>zccz/dealTrace1Head_viewMeetingInfo.do?flag=<%=flag%>&itemId=<%=itemId%>");
		tabbar.setContentHref("a4","<%=basePath %>zccz/dealTrace1Head_viewSummaryInfo.do?flag=<%=flag%>&itemId=<%=itemId%>");
		tabbar.setContentHref("a5","<%=basePath %>zccz/dealTrace1Head_viewItemFeiyongInfo.do?flag=<%=flag%>&itemId=<%=itemId%>&headId=<%=cldId%>&itemType=<%=itemType%>");
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

