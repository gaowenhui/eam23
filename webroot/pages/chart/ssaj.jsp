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
<title>诉讼案件信息统计</title>
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
				$.post("<%=basePath%>char/CharAction_querySsaj.do",{
						"address" : $(obj).attr("name")
					},function(data){
						$("#fancybox-outer").css("background","");
						var dataArr = data.split("|*|");
						$("#cityName").html(dataArr[0]);
						$("#ybyzSpan").html(dataArr[1]);
						$("#fkjeSpan").html(dataArr[2]);
						$("#zchkSpan").html(dataArr[3]);
						
						
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
     <div class="wrap">
          <div class="bar_open"> 
          <a href="<%=basePath%>tj/MapTjAction_susongCount.do" class="openicon">诉讼案件信息统计</a>
          </div>
          <div class="outline">

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
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=230" class="various1" name="230" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="498,62,545,81" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=220" class="various1" name="220" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="499,111,534,127" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=210" class="various1" name="210" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="467,140,504,158" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=110" class="various1" name="110" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="411,164,443,181" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=120" class="various1" name="120" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="434,180,466,197" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=130" class="various1" name="130" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="403,196,436,212" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=150" class="various1" name="150" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="336,161,382,178" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=140" class="various1" name="140" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="373,207,404,223" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=370" class="various1" name="370" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="433,213,463,230" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=640" class="various1" name="640" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="315,211,347,228" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=650" class="various1" name="650" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="106,155,140,173" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=630" class="various1" name="630" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="208,226,240,242" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=620" class="various1" name="620" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="298,239,330,256" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=610" class="various1" name="610" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="342,251,372,267" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=410" class="various1" name="410" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="392,248,425,265" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=320" class="various1" name="320" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="453,248,487,264" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=310" class="various1" name="310" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="493,274,524,291" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=330" class="various1" name="330" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="469,302,502,319" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=340" class="various1" name="340" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="432,275,466,292" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=420" class="various1" name="420" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="382,286,414,301" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=510" class="various1" name="510" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="278,297,310,314" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=540" class="various1" name="540" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="114,262,146,279" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=500" class="various1" name="500" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="332,307,366,324" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=530" class="various1" name="530" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="262,372,294,389" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=520" class="various1" name="520" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="327,344,357,361" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=430" class="various1" name="430" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="379,328,413,345" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=360" class="various1" name="360" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="421,325,453,341" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=350" class="various1" name="350" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="453,345,485,361" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=440" class="various1" name="440" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="404,378,436,395" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=450" class="various1" name="450" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="349,385,383,402" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=460" class="various1" name="460" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="362,437,395,454" href="javascript:void(0)" />

 <area href="<%=basePath%>char/CharAction_susongLine.do?address=010" class="various1" name="010" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="415,154,429,164" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=011" class="various1" name="011" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="440,161,450,171" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=212" class="various1" name="212" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="475,169,489,184" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=371" class="various1" name="371" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="467,211,482,225" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=322" class="various1" name="322" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="480,261,494,273" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=331" class="various1" name="331" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="489,293,503,303" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=422" class="various1" name="422" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="411,301,426,315" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=351" class="various1" name="351" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="470,361,486,372" href="javascript:void(0)" />
 <area href="<%=basePath%>char/CharAction_susongLine.do?address=442" class="various1" name="442" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()" onclick="showWin2(this);" coords="421,394,435,404" href="javascript:void(0)" />

</map>
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
     <!-- 未展开 委托贷款信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <a href="<%=basePath%>char/CharAction_wtdkCount.do" class="closedicon">委托贷款信息统计</a>
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
	        <p><span class="item">原币原值总值</span><br><span class="datas_first" id="ybyzSpan"></span>万元</p>
	        <p><span class="item">付款金额总值</span><br><span class="datas_first" id="fkjeSpan"></span>万元</p>
	        <p><span class="item">执行回款总值</span><br><span class="datas_first" id="zchkSpan"></span>万元</p>
	     </div>
	   </div>
   </div>
</div>

</body>
</html>



