<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.eam2.zccz.ZcczCommon"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	
	String itemId = request.getParameter("itemId");
	String itemType = request.getParameter("itemType");
	String cldId = request.getParameter("cldId");

 	String assetUrl = "";
 	String itemUrl = "";
 	if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY,itemType)){
 		//实体整体处置
 		assetUrl = basePath + "zccz/entityDealHead_showStczZc.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		//itemUrl = basePath + "zccz/entityDealHead_showStczCld.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		itemUrl = basePath + "zccz/entityDealHead_showStczCld.do?headId=" + cldId + "&xmId=" + itemId;
 	}else if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY_PERSON,itemType)){
 		//实体人员安置
 		assetUrl = basePath + "zccz/personDealHead_showPersonZc.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		//itemUrl = basePath + "zccz/personDealHead_showPersonCld.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		itemUrl = basePath + "zccz/personDealHead_showPersonCld.do?headId=" + cldId + "&xmId=" + itemId;
 	}else if(StringUtils.equals(ZcczCommon.ITEM_FOR_FIXED_ASSET,itemType)){
 		//通用资产处置
 		assetUrl = basePath + "zccz/assetDealHead_showZcxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		//itemUrl = basePath + "zccz/assetDealHead_showCldxx.do?headId=" + cldId + "&xmId=" + itemId;
 		itemUrl = basePath + "zccz/assetDealHead_showCldxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 	}else if(StringUtils.equals(ZcczCommon.ITEM_FOR_INVESTMENT,itemType)){
 		//承继投资
 		assetUrl = basePath + "cjtz/czCztzfaXxAction_showZcxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		//itemUrl = basePath + "cjtz/czCztzfaXxAction_showCldxx.do?headId=" + cldId + "&xmId=" + itemId + "&fenlei=" + itemType;
 		itemUrl = basePath + "cjtz/czCztzfaXxAction_showCldxx.do?headId=" + cldId + "&xmId=" + itemId;
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
		tabbar.addTab("a1", "资产信息", "100px");
		tabbar.addTab("a2", "项目信息", "80px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=assetUrl %>");
		tabbar.setContentHref("a2","<%=itemUrl %>");
		tabbar.setTabActive("a2");
		tabbar.attachEvent("onSelect", function(id) {   
		    if (tabbar.cells(id)._frame);
		    return true;
		});
		tabbar.enableAutoReSize("enable");
		tabbar.enableAutoSize("enable","enable");
	</script>
  </body>
</html>

