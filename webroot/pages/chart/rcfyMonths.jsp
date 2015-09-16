<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>	
<%@ page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String cityName=(String)request.getAttribute("cityName");
String address = (String)request.getParameter("address");
String year = (String) request.getParameter("year");
List   list = (List) request.getAttribute("yearList");

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<SCRIPT language=JavaScript type=text/JavaScript>
			 function query(){
						  var year = document.getElementById("year").value;
					      var url="<%=basePath%>char/CharAction_rcfyCountByMonths.do?year="+year+"&address=<%=address%>";
			              window.location.href(url); 
						}
		   //按年统计
			 function queryByYears(){
		      var url="<%=basePath%>char/CharAction_rcfyCountByYear.do?&address=<%=address%>";
              window.location.href(url); 
			 }
			//统计近期
			  function queryByLastMonths(){
		      var url="<%=basePath%>char/CharAction_rcfyCountByLastMonth.do?"+"address=<%=address%>";
              window.location.href(url); 
		     }
</SCRIPT>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=cityName%>资产日常费用统计</title>
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
           <h1><%=cityName%><%=year%>资产日常费用统计</h1>
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
                        <img src="resource/images/search_btn.gif" width="38" height="19" onClick="query()" />
                      </div>
                 </div>
			

    <div id="lightbox">
	       <div class="chart_frame">
	         <jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.LineProcessor" />
			 <cewolf:chart id="line" title="" 
	           type="line" xaxislabel="月份" yaxislabel="资产日常费用统计(万元)"> 
		      <cewolf:data>      
		       <cewolf:producer id="rcfyMonths"/> 
		      </cewolf:data>
		       <cewolf:chartpostprocessor id="legendItems">
		       </cewolf:chartpostprocessor>
		     </cewolf:chart>
	      <cewolf:img chartid="line" renderer="/adChart"  width="500" height="300"/>
          </div>
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