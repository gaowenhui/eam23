<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>	
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
    </script>
</head>

<body>
<div id="content">
<!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>char/CharAction_zcjgCount.do"  class="closedicon">资产结构信息统计</a>
          </div>
     </div>
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>tj/MapTjAction_qzcCount.do?jyl=true" class="closedicon">经营性固定资产信息统计</a>
          </div>
     </div>
     
     <!-- 未展开 资产处置信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>tj/MapTjAction_zqCzCount.do" class="closedicon">资产处置信息统计</a>
          </div>
     </div>
     <!-- 未展开 委托贷款信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>char/CharAction_wtdkCount.do" class="closedicon">委托贷款信息统计</a>
          </div>
     </div>
     <!-- 未展开 诉讼案件信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>tj/MapTjAction_susongCount.do" class="closedicon">诉讼案件信息统计</a>
          </div>
     </div>
     <!-- 未展开 实体日常管理费用统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>tj/MapTjAction_strcglfyCount.do" class="closedicon">实体日常管理费用统计</a>
          </div>
     </div>
</div>
</body>

</html>