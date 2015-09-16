<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加资产</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="STYLESHEET" type="text/css" href="resource/js/DHtmlTab/dhtmlxtabbar.css">
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxtabbar.js"></script>
	<script type="text/javascript">
	function initVar(zcId, zclx){
	if(zcId != null && zcId != ""){
		if(zclx==1){
			zclx = "buildingInfo";
		}else if(zclx==2){
			zclx = "vehicleInfo";
		}else{
			zclx = "elseInfo";
		}
		tabbar.setContentHref("a2","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?headId=${headId}&sheettype=" + zclx + "&zcId=" + zcId);
		tabbar.setContentHref("a3","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=riskInfo&zcId=" + zcId);
		tabbar.setContentHref("a4","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=changeHistoryInfo&zcId=" + zcId);
		tabbar.setContentHref("a5","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=cardInfo&zcId=" + zcId);
		tabbar.setContentHref("a6","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=rentInfo&zcId=" + zcId);
		tabbar.setContentHref("a7","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=entrustInfo&zcId=" + zcId);
		tabbar.setContentHref("a8","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=flowInfo&zcId=" + zcId);
		tabbar.setContentHref("a9","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=attachmentInfo&zcId=" + zcId);
		tabbar.setContentHref("a0","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=costInfo&zcId=" + zcId);
		tabbar.setContentHref("a10","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?sheettype=dealInfo&zcId=" + zcId);
		tabbar.setContentHref("a11","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=investment&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a12","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?isdisable=${isdisable}&sheettype=examineInfo&zcId=" + zcId + "&zclx=" + zclx);
		tabbar.enableTab("a2");
		tabbar.enableTab("a3");
		tabbar.enableTab("a4");
		tabbar.enableTab("a5");
		tabbar.enableTab("a6");
		tabbar.enableTab("a7");
		tabbar.enableTab("a8");
		tabbar.enableTab("a9");
		tabbar.enableTab("a0");
		tabbar.enableTab("a10");
		tabbar.enableTab("a11");
		tabbar.enableTab("a12");
		}
	}
	</script>
  </head>
  <body>
	<div id="a_tabbar" style="width:1100; height:100%;"/>
	<script>
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "主信息", "80px");
		tabbar.addTab("a2", "基本信息", "80px");tabbar.disableTab("a2");
		tabbar.addTab("a3", "风险信息", "80px");tabbar.disableTab("a3");
		tabbar.addTab("a4", "变动信息", "80px");tabbar.disableTab("a4");
		tabbar.addTab("a5", "卡片信息", "80px");tabbar.disableTab("a5");
		tabbar.addTab("a6", "租赁合同", "80px");tabbar.disableTab("a6");
		tabbar.addTab("a7", "委管合同", "80px");tabbar.disableTab("a7");
		tabbar.addTab("a8", "流程信息", "80px");tabbar.disableTab("a8");
		tabbar.addTab("a9", "附件信息", "80px");tabbar.disableTab("a9");
		tabbar.addTab("a0", "费用信息", "80px");tabbar.disableTab("a0");
		tabbar.addTab("a10", "处置信息", "80px");tabbar.disableTab("a10");
		tabbar.addTab("a11", "投资历史", "80px");tabbar.disableTab("a11");
		tabbar.addTab("a12", "核查评估", "80px");tabbar.disableTab("a12");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?headId=${headId}&zcId=${zcId}&sheettype=mainInfo");
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

