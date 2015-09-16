<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>

<html>
<head>
<title>统计</title>

</head>
<body>
  <jsp:useBean id="data1"     class="com.tansun.eam2.jfreeChart.chartmain.ChartEam2"/>
     <cewolf:chart 
                     id="pieChart" 
                     title="饼图" 
                     type="pie" >
                     <cewolf:data>
                            <cewolf:producer id="data1" />
                     </cewolf:data>
              </cewolf:chart>
 
              <cewolf:img 
                     chartid="pieChart" 
                     renderer="/adChart" 
                     width="500" 
                     height="375"/>
    </body>
    </html>




