<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf"%>
<%@ page import="java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String cityName = (String) request.getAttribute("cityName");
	String type = (String) request.getParameter("type");
	String address = (String) request.getParameter("address");
	List list = (List) request.getAttribute("yearList");
%>
<%try{ %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=cityName%>省经营性固定资产信息统计-出租率</title>
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
			
		 function query(){
			  var year = document.getElementById("year").value;
		      var type = document.getElementById("type").value;
		      var url="<%=basePath%>char/CharAction_czlByMonth.do?year="+year+"&type="+type+"&address=<%=address%>";
              window.location.href(url); 
              //window.parent.resizeFancybox();
			}
		     //按年统计
			 function queryByYears(){
		      var url="<%=basePath%>char/CharAction_czlByYear.do?&address=<%=address%>&type=<%=type%>";
              window.location.href(url); 
              //window.parent.resizeFancybox();
			 }
        </script>
	</head>

	<body>
       <div id="lightbox" style="width: 100%;height: 100%;">
       <h1><%=cityName%>近期经营性固定资产信息统计-出租率</h1>
            <div class="chart_wrap">
                 <div class="top_bar">
                      <div class="searchbar">
                      <input type="hidden" name="address" value="<%=address %>"/>
                         按年统计：
                     <select id="year" >
                     <%
                      for(int i=0;i<list.size();i++){
                        int year=(Integer)list.get(i);
                      %>
                       	<option value=<%=year%> ><%=year%></option>
                        <%} %>
                          </select>
                        <span>按资产类型统计：</span><select id="type">
							<option value="1">经营类资产</option>
							<option value="2">全资产</option>
						</select>
                        <img src="resource/images/search_btn.gif" width="38" height="19" onClick="query()" />
                      </div>
                    <!--   <div class="chart_icon">
                           <ul>
                           <li class="blueicon">&nbsp;</li>
                           <li>出租率</li>
                           <li class="pinkicon">&nbsp;</li>
                           <li>房地产企业平均值</li>
                           </ul>
                      </div> -->
                 </div>
		
        <div class="chart_frame">
        <jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.BarProcessor" />
		<cewolf:chart id="verticalBar" title="" type="verticalBar3D" xaxislabel="时间" yaxislabel="出租率(%)">
			<cewolf:data>
				<cewolf:producer id="lastMonthsCountResult" />
			</cewolf:data>
			 <cewolf:chartpostprocessor id="legendItems">
		    </cewolf:chartpostprocessor>
		</cewolf:chart>

		<cewolf:img chartid="verticalBar" renderer="/adChart" width="400" height="300" />

        </div>
        <div class="submit_btn">
        <img src="resource/images/years_data_btn.gif" width="104" height="37" onClick="queryByYears()" />
        </div>
           </div>
           </div>
	</body>
</html>
<%}catch(Exception e){
e.printStackTrace();}%>