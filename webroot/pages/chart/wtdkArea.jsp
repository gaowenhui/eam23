<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>	
<%@page import="de.laures.cewolf.links.XYItemLinkGenerator" %>
<%@page import="de.laures.cewolf.tooltips.XYToolTipGenerator" %>
<%@page import="org.jfree.data.xy.XYDataset" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	// create example link generator for the overlaid chart

	XYToolTipGenerator tooltipGenerator = new XYToolTipGenerator() {
		public String generateToolTip(XYDataset data, int series, int item) {
			//Date d = new Date(((Long)data.getX(series,item)).longValue());
			return "tooltip x="  + ",y="+ data.getY(series,item);
		}
	};

	XYItemLinkGenerator linkGenerator = new XYItemLinkGenerator() {
		 public String generateLink(Object data, int series, int item) {
			XYDataset dataset = (XYDataset) data;
			//Date d = new Date(((Long)dataset.getX(series,item)).longValue());
			return "link x=" +  ",y="+ dataset.getY(series,item);
		 }
	};

	pageContext.setAttribute("tooltipGenerator", tooltipGenerator);
	pageContext.setAttribute("linkGenerator", linkGenerator);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<SCRIPT language=JavaScript type=text/JavaScript>
</SCRIPT>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>委托贷款余额-地区排名</title>
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
 	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	//生成Excel
    function doExcel()
	{
	   var url="<%=basePath%>char/CharAction_toWtdkExcel.do";
		$.post(url,{
			p1 : d1,
			p2 : d2
		});
		//document.ManageForm.action="UserManageAction.do?method=doUserList&messageExcel=excel";
	}
    </script>
</head>

<body >
<div id="content">
           <div class="wrap">
          <div class="bar_open"> 
          <a href="<%=basePath%>char/CharAction_wtdkCount.do" class="openicon">委托贷款信息统计</a>
          </div>
          <div class="outline">
           <div class="title">
          <ul>
          <li><a href="<%=basePath%>tj/MapTjAction_wtdkCount.do">委托贷款余额</a></li>
          <li  class="now"><a href="pages/chart/wtdkArea.jsp">按地区排名</a></li>
          </ul>
        </div>
         <div class="graphic">
         <!-- <span class="button" align="right"><a href="#" onclick="doExcel();">生成地区排名excel</a></span> -->
   <div class="chart_frame">
     <jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.BarProcessor" />
     <cewolf:chart 
                     id="verticalBar" 
                     title="" 
                     type="verticalBar3D" 
                     xaxislabel="省份" 
                     yaxislabel="委托贷款余额(万元)">
                     <cewolf:data>
                            <cewolf:producer id="wtdkArea" />
                     </cewolf:data>
                      <cewolf:chartpostprocessor id="legendItems">
		       </cewolf:chartpostprocessor>
              </cewolf:chart>
 
              <cewolf:img 
                     chartid="verticalBar" 
                     renderer="/adChart" 
                     width="600" 
                     height="375">
                    <cewolf:map linkgeneratorid="linkGenerator"  tooltipgeneratorid="tooltipGenerator" />
                    </cewolf:img>
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
      </div>
</body>
</html>