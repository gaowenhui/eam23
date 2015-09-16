<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String rework = request.getParameter("rework");
	String look = request.getParameter("look");
	String newAdd = request.getParameter("newAdd");	
	String assetType = (String)request.getAttribute("assetType");//add by lantianbo
	String ctlButton = request.getParameter("ctlButton");
	String zcczpg = (String)request.getAttribute("zcczpg");     //资产评估处置
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
	function initVar(zcbh){
		if(zcbh == null || zcbh == ""){
			tabbar.disableTab("a2");
			tabbar.disableTab("a3");
			tabbar.disableTab("a4");
			tabbar.disableTab("a5");
			tabbar.disableTab("a6");
			tabbar.disableTab("a7");
		}else{
			tabbar.enableTab("a2");
			tabbar.enableTab("a3");
			tabbar.enableTab("a4");
			tabbar.enableTab("a5");
			tabbar.enableTab("a6");
			tabbar.enableTab("a7");
		}
	}
	
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "基本信息", "80px");
		tabbar.addTab("a2", "实体人员信息", "90px");
		tabbar.addTab("a3", "文件及公章存放情况", "130px");
		tabbar.addTab("a4", "实体资产情况", "90px");
		tabbar.addTab("a5", "债权债务情况", "90px");
		tabbar.addTab("a6", "诉讼情况", "80px");
		tabbar.addTab("a10", "费用收入信息", "110px");
		tabbar.addTab("a11", "相关附件", "80px");
		tabbar.addTab("a7", "日志信息", "80px");
		tabbar.addTab("a8", "流程信息", "80px");
		tabbar.addTab("a9", "处置信息", "80px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=basePath %>stgl/weihu_newNonEntity.do?fslx=0&stid=${st.id}&rework="+<%=rework%>+'&look='+<%=look%>+'&newAdd='+'<%=newAdd%>');
		tabbar.setContentHref("a2","<%=basePath %>stgl/weihu_newNonEntity.do?fslx=1&stid=${st.id}&look=<%=look%>");
		tabbar.setContentHref("a3","<%=basePath %>stgl/weihu_newNonEntity.do?fslx=2&stid=${st.id}&look=<%=look%>");
		tabbar.setContentHref("a4","<%=basePath %>stgl/weihu_newNonEntity.do?optionType=<%=optionType%>&assetType=<%=assetType%>&fslx=3&stid=${st.id}&ctlButton=<%=ctlButton%>&zcczpg=<%=zcczpg%>&look=<%=look%>&option=<%=option%>&ispgsc=<%=ispgsc%>"); //modify by lantianbo
		tabbar.setContentHref("a5","<%=basePath %>stgl/weihu_debtList.do?stid=${st.id}&look=<%=look%>");
		tabbar.setContentHref("a6","<%=basePath %>stgl/weihu_getLitigationList.do?stid=${st.id}&stmc=${st.stzwmc}&look=<%=look%>");
		tabbar.setContentHref("a7","<%=basePath %>stgl/weihu_newNonEntity.do?fslx=6&stid=${st.id}&look=<%=look%>");
		tabbar.setContentHref("a8","<%=basePath %>stgl/weihu_newNonEntity.do?fslx=7&stid=${st.id}&look=<%=look%>");
		tabbar.setContentHref("a9","<%=basePath %>stgl/weihu_newNonEntity.do?fslx=8&stid=${st.id}&look=<%=look%>");
		tabbar.setContentHref("a10","<%=basePath %>stgl/weihu_newEntity.do?fslx=13&stid=${st.id}&look=<%=look%>&zixunType=${zixunType}");
		tabbar.setContentHref("a11","<%=basePath %>stgl/weihu_newEntity.do?fslx=14&stid=${st.id}&look=<%=look%>");
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

