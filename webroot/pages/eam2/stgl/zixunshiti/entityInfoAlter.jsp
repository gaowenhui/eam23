<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//	String rework = (String)request.getAttribute("rework");
	String rework = request.getParameter("rework");
	String look = request.getParameter("look");
	String ctlButton = request.getParameter("ctlButton");
	String newAdd = request.getParameter("newAdd");
	String sfbc = (String)request.getAttribute("sfbc");
	String assetType = (String)request.getAttribute("assetType");//add by lantianbo
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
  </script>
  </head>
  <body>
	<div id="a_tabbar" style="width:100%; height:100%;"/>
	<script>
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
			tabbar.addTab("a1", "基本信息", "80px");
			tabbar.addTab("a2", "实体人员信息", "100px");
			tabbar.addTab("a3", "高管人员信息", "100px");
			tabbar.addTab("a4", "实体股权结构", "100px");
			tabbar.addTab("a5", "实体大事记", "100px");
			tabbar.addTab("a6", "实体财务报表信息", "120px");
			tabbar.addTab("a7", "实体资产信息", "100px");
			tabbar.addTab("a8", "流程信息", "80px");
			tabbar.addTab("a9", "处置信息", "80px");
			tabbar.addTab("a10", "费用收入信息", "140px");
			tabbar.addTab("a11", "相关附件", "80px");
			tabbar.addTab("a0", "日志信息", "80px");
			tabbar.setHrefMode("iframes-on-demand");
			tabbar.setContentHref("a1","<%=basePath %>stgl/weihu_newEntity.do?fslx=0&stid=${st.id}&rework="+<%=rework%>+'&look='+<%=look%>+'&newAdd='+'<%=newAdd%>');
			tabbar.setContentHref("a2","<%=basePath %>stgl/weihu_newEntity.do?fslx=1&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a3","<%=basePath %>stgl/weihu_newEntity.do?fslx=9&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a4","<%=basePath %>stgl/weihu_newEntity.do?fslx=10&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a5","<%=basePath %>stgl/weihu_newEntity.do?fslx=11&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a6","<%=basePath %>stgl/weihu_newEntity.do?fslx=12&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a7","<%=basePath %>stgl/weihu_newEntity.do?optionType=<%=optionType%>&fslx=3&assetType=<%=assetType%>&ctlButton=<%=ctlButton%>&look=<%=look%>&stid=${st.id}&zcczpg=<%=zcczpg%>&option=<%=option%>&ispgsc=<%=ispgsc%>"); //modify by lantianbo
			tabbar.setContentHref("a8","<%=basePath %>stgl/weihu_newEntity.do?fslx=7&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a9","<%=basePath %>stgl/weihu_newEntity.do?fslx=8&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a10","<%=basePath %>stgl/weihu_newEntity.do?fslx=13&stid=${st.id}&look=<%=look%>&zixunType=${zixunType}");
			tabbar.setContentHref("a11","<%=basePath %>stgl/weihu_newEntity.do?fslx=14&stid=${st.id}&look=<%=look%>");
			tabbar.setContentHref("a0","<%=basePath %>stgl/weihu_newEntity.do?fslx=6&stid=${st.id}&look=<%=look%>");
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

