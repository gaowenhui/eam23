<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String lnNo = (String)request.getAttribute("lnNo");
	
	String ctlButton = (String)request.getAttribute("ctlButton");
	String assetType = (String)request.getAttribute("assetType");
	String zcczpg = (String)request.getAttribute("zcczpg");
	String zcczCldId = (String)request.getAttribute("zcczCldId");
	
	String option = request.getParameter("option");
	String optionType = request.getParameter("optionType");
	String ispgsc = (String)request.getAttribute("ispgsc");
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
	var lnNo = '<%=lnNo%>';
	var loansId = '<%=lnNo%>';
	var ctlButton = '<%=ctlButton%>'
	var assetType = '<%=assetType%>'
	var zcczpg = '<%=zcczpg%>'
	var zcczCldId = '<%=zcczCldId%>'
	var ispgsc = '<%=ispgsc%>';
	
	tabbar = new dhtmlXTabBar("a_tabbar", "top");
	tabbar.setSkin('dhx_skyblue');
	tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
	tabbar.addTab("a1", "基本信息", "100px");
	tabbar.addTab("a2", "贷款本金明细", "100px");
	//tabbar.addTab("a3", "关联基金账户信息", "100px");
	tabbar.addTab("a4", "抵质押物信息", "100px");
	tabbar.addTab("a5", "处置信息", "100px");
	tabbar.setHrefMode("iframes-on-demand");
	tabbar.setContentHref("a1","<%=basePath%>wtdk/loansQuery_jibenxinxi.do?lnNo="+lnNo);
	tabbar.setContentHref("a2","<%=basePath %>wtdk/loansQuery_daikuanbenjinmingxi.do?lnNo="+lnNo);
	//tabbar.setContentHref("a3","<%=basePath %>wtdk/loansQuery_guanlianjijin.do?lnNo="+lnNo);
	tabbar.setContentHref("a4","<%=basePath%>stgl/weihu_newEntity.do?optionType=<%=optionType%>&option=<%=option%>&newAdd=1&fslx=3&loansId="+loansId+"&ctlButton="+ctlButton+"&assetType="+assetType+"&zcczpg="+zcczpg+"&zcczCldId="+zcczCldId+"&ispgsc="+ispgsc);
	tabbar.setContentHref("a5","<%=basePath %>wtdk/loansQuery_chuzhixinxi.do?loansId="+loansId);
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

