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
<title>经营类资产统计</title>
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
	<script type="text/javascript">
    </script>
</head>

<body>

   	<jsp:useBean id="data"  class="com.tansun.eam2.jfreeChart.chartmain.ZcjgPie"/>
     		<cewolf:chart 
                     id="pieChart" 
                     title="资产结构信息统计" 
                     type="pie" >
                     <cewolf:data>
                            <cewolf:producer id="data" />
                            <cewolf:chartpostprocessor id="data">
                            </cewolf:chartpostprocessor>
                     </cewolf:data>
                    
              </cewolf:chart>
 
              <cewolf:img 
                     chartid="pieChart" 
                     renderer="/adChart" 
                     width="500" 
                     height="375">
           </cewolf:img>
</body>
</html>