<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>	
<%@ page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String cityName=(String)request.getAttribute("cityName");
String address = (String)request.getParameter("address");
String type = (String) request.getParameter("type");
String year = (String) request.getParameter("year");
List list = (List) request.getAttribute("yearList");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=cityName%>经营性固定资产信息统计-合同租金收入</title>
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
 	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
    <SCRIPT language=JavaScript type=text/JavaScript>
			$(function(){
				$("body").width($(".chart_frame img").width() + 50);
				$("#lightbox").width($(".chart_frame img").width() + 50);
				window.parent.resizeFancybox(
					$(".chart_frame img").width() + 50,
					$(".chart_frame img").height() + 150
				);
			});
			 function query(){
						  var year = document.getElementById("year").value;
					     // var type = document.getElementById("type").value;
					      var url="<%=basePath%>char/CharAction_czlByMonth.do?year="+year+"&address=<%=address%>";
			              window.location.href(url); 
						}
		  //按年统计
			 function queryByYears(){
		      var url="<%=basePath%>char/CharAction_czlByYear.do?&address=<%=address%>&type=<%=type%>";
              window.location.href(url); 
			 }
			//统计近期
			  function queryByLastMonths(){
		      var url="<%=basePath%>char/CharAction_czlCountLastMonths.do?type=<%=type%>"+"&address=<%=address%>";
              window.location.href(url); 
		     }
</SCRIPT>
</head>

<body >
           <div id="lightbox">
           <h1><%=cityName%><%=year%>年省经营性固定资产信息统计-合同租金收入</h1>
           <div class="chart_wrap">
           
			<div class="top_bar">
                      <div class="searchbar">
                      <input type="hidden" name="address" value="<%=address %>"/>
                       按年统计：<select id="year" >
	                     <%
	                        for(int i=0;i<list.size();i++){
	                        int years=(Integer)list.get(i);
	                      %>
                       	<option value=<%=years%> ><%=years%></option>
                        <%} %>
                          </select>
                        <!--  
                        <span>按资产类型统计：</span>
                        <select id="type">
							<option value="1">经营类资产</option>
							<option value="2">全资产</option>
						</select>-->
                        <img src="resource/images/search_btn.gif" width="38" height="19" onClick="query()" />
                      </div>
                 </div>
			

 <div class="chart_frame">
     <jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.BarProcessor" />
     <cewolf:chart 
                     id="verticalBar" 
                     title="" 
                     type="verticalBar3D" 
                     xaxislabel="月份" 
                     yaxislabel="合同租金收入(万元)">
                     <cewolf:data>
                            <cewolf:producer id="htzjsrMonths" />
                     </cewolf:data>
                      <cewolf:chartpostprocessor id="legendItems">
		              </cewolf:chartpostprocessor>
              </cewolf:chart>
 
              <cewolf:img 
                     chartid="verticalBar" 
                     renderer="/adChart" 
                     width="600" 
                     height="375"/>
                     </div>
                     
              <div class="submit_btn">
              <img src="resource/images/years_data_btn.gif" width="104" height="37" onclick="queryByYears()" />
                      &nbsp; 
                    <img src="resource/images/jinqi_data_btn.gif" width="104" height="37" onclick="queryByLastMonths()" />
                    </div>
               </div>
        </div>  
</body>
</html>