<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String cityName =  (String)request.getAttribute("cityName");
    String address = (String)request.getParameter("address");
%>
<%try{ %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=cityName%>近期委托贷款余额</title>
		<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
		<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
        <link href="resource/css/president.css" rel="stylesheet" type="text/css" />
		<SCRIPT language=JavaScript type=text/JavaScript>
		    //按年统计
			 function queryByYears(){
		      var url="<%=basePath%>char/CharAction_wtdkCountByYear.do?&address=<%=address%>";
              window.location.href(url); 
			 }
         </SCRIPT>
	</head>
	<body >
	   <div id="lightbox">
           <h1><%=cityName%>近期委托贷款余额</h1>
           
	      <div class="chart_frame">
			 <jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.LineProcessor" />
			 <cewolf:chart id="line" title="折线图" 
	           type="line" xaxislabel="Page" yaxislabel="Views"> 
		      <cewolf:data>      
		       <cewolf:producer id="wtdkMonth"/> 
		      </cewolf:data>
		        <cewolf:chartpostprocessor id="legendItems">
		       </cewolf:chartpostprocessor>
		     </cewolf:chart>
	      <cewolf:img chartid="line" renderer="/adChart"  width="500" height="400"/>
          </div>
       
            <div class="submit_btn">
              <img src="resource/images/years_data_btn.gif" width="104" height="37" onclick="queryByYears()" />
            </div>
       </div>  
	</body>
</html>
<%}catch(Exception e){
e.printStackTrace();}%>