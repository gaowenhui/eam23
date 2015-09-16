<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="resource/css/president.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- dialog 悬浮框begin -->
     <div class="dialog">
          <div class="top_bg"></div>
          <div class="btm_bg">
               <div class="itemname">经营类资产统计 </div>
               <div class="btn_s"><a href="#">全资产</a></div>
               <div class="cleardiv"></div>
               <p><span class="item">出租率</span>  <span class="datas">61%</span></p>
               <p><span class="item">成本收益率</span>      <span class="datas">33%</span></p>
               <p class="line"></p>
               <p><span class="item">申请费用</span>        <span class="datas">158</span>万元 </p>
               <p><span class="item">报销费用</span>        <span class="datas">112</span>万元</p>
               <p class="line"></p>
               <p><span class="item">合同租金收入</span>    <span class="datas">108</span>万元</p>
          </div>
     </div>
  </body>
</html>
