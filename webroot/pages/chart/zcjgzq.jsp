<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.math.BigDecimal"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String cityColor =  (String)request.getAttribute("cityColor");
	HashMap map=(HashMap)request.getAttribute("map");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资产结构信息统计-债权</title>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js"></script>
    <%@ include file="/inc/floatingBox_big.inc"%>
	<script type="text/javascript">
			
			function showWin(obj)
			{
				$.post("<%=basePath%>char/CharAction_queryZqData.do",{
						"address" : $(obj).attr("name")
					},function(data){
						$("#fancybox-outer").css("background","");
						var dataArr = data.split("|*|");
					    $("#cityName").html(dataArr[0]);
						$("#zqSpan").html(dataArr[1]);
						/**$.fancybox($("#test").html(),{
			    			'autoDimensions'	: false,
							'width'     		: 'auto',
							'height'    		: 'auto',
							'transitionIn'		: 'none',
							'overlayShow'		: false,
							'padding'			: 0, 
							'margin'			: 0,
							'top'				: 200,
							'showCloseButton'	: false,
							'transitionOut'		: 'none'
						});*/
						
						}
				);
			
				
			     var ev = ev || window.event;
				var mp = mousePosition(ev);
				 document.getElementById('test').style.left = mp.x-$("#test").width()/2+"px";
				document.getElementById('test').style.top = mp.y-$("#test").height()-3+"px";
				document.getElementById('test').style.display = 'block';
				
			}
			
			function hideWin(){
				//$.fancybox.close();
		  	    document.getElementById('test').style.display = 'none';
			}
			
			function mousePosition(ev){
        		if(ev.pageX || ev.pageY){
                	return {x:ev.pageX, y:ev.pageY};
        		}
        		return {
                	x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
                	y:ev.clientY + document.body.scrollTop - document.body.clientTop
        		};
			}
	

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script type="text/javascript">
$.ajaxSetup({
	async : false
});
</script>
<div id="content">
<!-- 展开 资产结构信息统计begin -->
     <div class="wrap">
     <div class="bar_open">
     <a href="<%=basePath%>char/CharAction_zcjgCount.do" class="openicon">资产结构信息统计</a>
     </div>
        <div class="outline">
             <div class="title">
	          <ul>
	          <li>债权统计</li>
	          </ul>
	        </div>
         <div class="graphic_bar">
                    <ul>
                    <%
                     int mapSize = map.size();
						String[] s = (String[]) map.get(String.valueOf(0));
						BigDecimal d1 = new BigDecimal(s[0]);
						BigDecimal d2 = new BigDecimal(s[1]);
						
						String[] s2 = (String[]) map.get(String.valueOf(1));
						BigDecimal d3 = new BigDecimal(s2[0]);
						BigDecimal d4 = new BigDecimal(s2[1]);
						
						String[] s3 = (String[]) map.get(String.valueOf(2));
						BigDecimal d5 = new BigDecimal(s3[0]);
						BigDecimal d6 = new BigDecimal(s3[1]);
						
						String[] s4 = (String[]) map.get(String.valueOf(3));
						BigDecimal d7 = new BigDecimal(s4[0]);
					//	BigDecimal d8 = new BigDecimal(s4[1]);
						
                     %>
                    <li class="green"></li>
                    <li class="text"><%=d1%>-<%=d2%></li>
                    <li class="yellow"></li>
                    <li class="text"><%=d3%>-<%=d4%></li>
                    <li class="orange"></li>
                    <li class="text"><%=d5%>-<%=d6%></li>
                    <li class="red"></li>
                    <li class="text">><%=d7%></li>
                    
                    <li class="text">单位：万元</li>
                    </ul>
           </div> 
         <div class="graphic">
      
    	<%
   	Random ran = new Random();
   	int len = com.tansun.eam2.jfreeChart.map.ProvincePicture.PROVINCE_CN.length;
    String val = "";
   	for(int i = 0; i < len; i++){
   		val += "" + Math.abs(ran.nextInt()%4);
   		if(i != len - 1){
   			val += ",";
   		}
   	}
   	String a = "map.jspa?ints=" + cityColor + "&filename=test.jpg";
   	
   	%>
   	
<img src="<%=basePath + a%>" border="0" usemap="#Map" />
<map name="Map" id="Map">
 <area  class="various1" name="230" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="498,62,545,81" href="javascript:void(0)" />
 <area  class="various1" name="220" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="499,111,534,127" href="javascript:void(0)" />
 <area  class="various1" name="210" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="467,140,504,158" href="javascript:void(0)" />
 <area  class="various1" name="110" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="411,164,443,181" href="javascript:void(0)" />
 <area  class="various1" name="120" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="434,180,466,197" href="javascript:void(0)" />
 <area  class="various1" name="130" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="403,196,436,212" href="javascript:void(0)" />
 <area  class="various1" name="150" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="336,161,382,178" href="javascript:void(0)" />
 <area  class="various1" name="140" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="373,207,404,223" href="javascript:void(0)" />
 <area  class="various1" name="370" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="433,213,463,230" href="javascript:void(0)" />
 <area  class="various1" name="640" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="315,211,347,228" href="javascript:void(0)" />
 <area  class="various1" name="650" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="106,155,140,173" href="javascript:void(0)" />
 <area  class="various1" name="630" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="208,226,240,242" href="javascript:void(0)" />
 <area  class="various1" name="620" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="298,239,330,256" href="javascript:void(0)" />
 <area  class="various1" name="610" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="342,251,372,267" href="javascript:void(0)" />
 <area  class="various1" name="410" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="392,248,425,265" href="javascript:void(0)" />
 <area  class="various1" name="320" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="453,248,487,264" href="javascript:void(0)" />
 <area  class="various1" name="310" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="493,274,524,291" href="javascript:void(0)" />
 <area  class="various1" name="330" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="469,302,502,319" href="javascript:void(0)" />
 <area  class="various1" name="340" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="432,275,466,292" href="javascript:void(0)" />
 <area  class="various1" name="420" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="382,286,414,301" href="javascript:void(0)" />
 <area  class="various1" name="510" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="278,297,310,314" href="javascript:void(0)" />
 <area  class="various1" name="540" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="114,262,146,279" href="javascript:void(0)" />
 <area  class="various1" name="500" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="332,307,366,324" href="javascript:void(0)" />
 <area  class="various1" name="530" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="262,372,294,389" href="javascript:void(0)" />
 <area  class="various1" name="520" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="327,344,357,361" href="javascript:void(0)" />
 <area  class="various1" name="430" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="379,328,413,345" href="javascript:void(0)" />
 <area  class="various1" name="360" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="421,325,453,341" href="javascript:void(0)" />
 <area  class="various1" name="350" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="453,345,485,361" href="javascript:void(0)" />
 <area  class="various1" name="440" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="404,378,436,395" href="javascript:void(0)" />
 <area  class="various1" name="450" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="349,385,383,402" href="javascript:void(0)" />
 <area  class="various1" name="460" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="362,437,395,454" href="javascript:void(0)" />

 <area class="various1" name="010" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="415,154,429,164" href="javascript:void(0)" />
 <area class="various1" name="011" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="440,161,450,171" href="javascript:void(0)" />
 <area class="various1" name="212" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="475,169,489,184" href="javascript:void(0)" />
 <area class="various1" name="371" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="467,211,482,225" href="javascript:void(0)" />
 <area class="various1" name="322" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="480,261,494,273" href="javascript:void(0)" />
 <area class="various1" name="331" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="489,293,503,303" href="javascript:void(0)" />
 <area class="various1" name="422" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="411,301,426,315" href="javascript:void(0)" />
 <area class="various1" name="351" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="470,361,486,372" href="javascript:void(0)" />
 <area class="various1" name="442" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="421,394,435,404" href="javascript:void(0)" />
 
</map>
</div>
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
   <!-- 未展开 委托贷款信息统计begin -->
   <div class="wrap">
     <div class="bar_closed"> 
     <a href="<%=basePath%>char/CharAction_wtdkCount.do" class="closedicon">委托贷款信息统计</a>
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
   <div id="test" style="position:absolute;display:none;">
	   <div class="dialog_s">
	     <div class="top_bg"></div>
	     <div class="btm_bg">
	     <h1 id="cityName"></h1>
	        <div class="cleardiv"></div>
	        <p><span class="item">债权</span> <span class="datas" id="zqSpan"></span>万元</p>
	     </div>
	   </div>
   </div>
</div>


</body>
</html>