<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String rework = request.getParameter("rework");
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
		tabbar.addTab("a2", "实体人员信息", "80px");
		tabbar.addTab("a3", "高管人员信息", "80px");
		tabbar.addTab("a4", "实体股权结构", "80px");
		tabbar.addTab("a5", "实体大事记", "80px");
		tabbar.addTab("a6", "实体财务报表信息", "80px");
		tabbar.addTab("a7", "实体资产信息", "80px");
		tabbar.addTab("a8", "流程信息", "80px");
		tabbar.addTab("a9", "处置信息", "80px");
		tabbar.addTab("a0", "日志信息", "80px");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=basePath %>stgl/weihu_newEntity.do?fslx=0&stid=${st.id}&rework="+<%=rework%>);
		tabbar.setContentHref("a2","<%=basePath %>stgl/weihu_newEntity.do?fslx=1&stid=${st.id}");
		tabbar.setContentHref("a3","<%=basePath %>stgl/weihu_newEntity.do?fslx=9&stid=${st.id}");
		tabbar.setContentHref("a4","<%=basePath %>stgl/weihu_newEntity.do?fslx=10&stid=${st.id}");
		tabbar.setContentHref("a5","<%=basePath %>stgl/weihu_newEntity.do?fslx=11&stid=${st.id}");
		tabbar.setContentHref("a6","<%=basePath %>stgl/weihu_newEntity.do?fslx=12&stid=${st.id}");
		tabbar.setContentHref("a7","<%=basePath %>stgl/weihu_newEntity.do?fslx=3&stid=${st.id}");
		tabbar.setContentHref("a8","<%=basePath %>stgl/weihu_newEntity.do?fslx=7&stid=${st.id}");
		tabbar.setContentHref("a9","<%=basePath %>stgl/weihu_newEntity.do?fslx=8&stid=${st.id}");
		tabbar.setContentHref("a0","<%=basePath %>stgl/weihu_newEntity.do?fslx=6&stid=${st.id}");
		tabbar.setTabActive("a1");
		tabbar.attachEvent("onSelect", function(id) {
		    if (tabbar.cells(id)._frame);
		    //alert(tabbar.cells(id)._frame.contentWindow.location);
		    return true;
		});
	</script>
  </body>
  
</html>

