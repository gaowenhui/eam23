<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String cityName =  (String)request.getAttribute("cityName");
%>
<%try{ %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=cityName%>实体人员安置</title>
		<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
		<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
        <link href="resource/css/president.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function(){
				$("body").width($(".chart_frame img").width() + 50);
				$("#lightbox").width($(".chart_frame img").width() + 50);
				window.parent.resizeFancybox(
					$(".chart_frame img").width() + 50,
					$(".chart_frame img").height() + 150
				);
			});
        </script>
	</head>
	<body >
	   <div id="lightbox">
           <h1><%=cityName%>实体人员安置</h1>
	       <div class="chart_frame">
	         <jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.LineProcessor" />
			 <cewolf:chart id="line" title="" 
	           type="line" xaxislabel="年份" yaxislabel="人数(个)"> 
		      <cewolf:data>      
		       <cewolf:producer id="czryaz"/> 
		      </cewolf:data>
		       <cewolf:chartpostprocessor id="legendItems">
		       </cewolf:chartpostprocessor>
		     </cewolf:chart>
	      <cewolf:img chartid="line" renderer="/adChart"  width="400" height="300"/>
          </div>
       </div> 
	</body>
</html>
<%}catch(Exception e){
e.printStackTrace();}%>