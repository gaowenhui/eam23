<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>

<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全资产统计</title>
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="content">
<!-- 展开 委托贷款信息统计begin -->
     <div class="wrap">
          <div class="bar_open"> 
          <a href="<%=basePath%>char/CharAction_wtdkCount.do" class="openicon">委托贷款信息统计</a>
          </div>
          <div class="outline">
               
   <div class="graphic">
   	<jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.PieProcessor" />
     		<cewolf:chart 
                     id="pieChart" 
                     title="委托贷款余额" 
                     type="pie" >
                     <cewolf:data>
                            <cewolf:producer id="wtdk" />
                     </cewolf:data>
                      <cewolf:chartpostprocessor id="legendItems">
		              </cewolf:chartpostprocessor>
                    
              </cewolf:chart>
 
              <cewolf:img 
                     chartid="pieChart" 
                     renderer="/adChart" 
                     width="500" 
                     height="375">
                     <cewolf:map linkgeneratorid="wtdk" tooltipgeneratorid="wtdk" />
                     </cewolf:img>
</div>


 </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
         <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>char/CharAction_zcjgCount.do" class="closedicon">资产结构信息统计</a>
          </div>
     </div>
     <!-- 未展开 经营性固定资产信息统计begin -->
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
     
     <!-- dialog-小 悬浮框begin -->
     <div class="dialog_s"  style="display: none;">
          <div class="top_bg"></div>
          <div class="btm_bg">
               <div class="cleardiv"></div>
               <p><span class="item">委托贷款余额</span></p>
               <p><span class="datas_first">110</span>万元</p>
          </div>
     </div>
</div>
     
</body>
</html>