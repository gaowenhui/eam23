<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>

<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>实体日常管理费用统计</title>
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
			$(document).ready(function() {});
		    var Url = 'index2.jsp?headid=asd';
			function showWin(obj)
			{
				$.post("<%=basePath%>char/CharAction_queryRcfy.do",{
						"address" : $(obj).attr("name")
					},function(data){
						$.fancybox(data,{
			        		'autoDimensions'	: false,
							'width'         	: 350,
							'height'        	: 'auto',
							'transitionIn'		: 'none',
							'overlayShow'		: false,
							'padding'			: 0, 
							'margin'			: 0,
							'showCloseButton'	: false,
							'transitionOut'		: 'none'	
						});
					}
				);
			}
			
			function hideWin(){
				$.fancybox.close();
			}
			
			function showWin2(obj){
				$.fancybox(
					{
			        	'autoDimensions'	: false,
			        	'href'				: '<%=basePath%>char/CharAction_test.do',
						'width'         	: 'auto',
						'padding'			: 0, 
						'margin'			: 10,
						'height'        	: 'auto',
						'transitionIn'		: 'none',
						'transitionOut'		: 'none'
					}
				);
			}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="content">
     <div class="wrap">
          <div class="bar_open"> 
          <div class="openicon">经营性固定资产信息统计</div>
          </div>
          <div class="outline">
               <div class="tab">
                    <ul>
                    <li class="now_left"></li>
                    <li class="now"><a href="#">出租率与成本收益率</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="#">资产日常费用</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="#">合同租金收入</a></li>
                    </ul>
                    <div class="disline"></div>
               </div>
               <div class="title">
                    <ul>
                    <li class="now"><a href="#">全资产统计</a></li>
                    <li><a href="#">经营类资产统计</a></li>
                    </ul>
               </div>

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
      	String a = "map.jspa?ints=" + val + "&filename=test.jpg";
      	
      	%>
      	
<img src="<%=basePath + a%>" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area  class="various1" name="230" onclick="showWin2(this);return false;" shape="rect" onmouseover="showWin(this)" onmouseout="hideWin()"  coords="498,62,545,81" href="#" />
  <area  class="various1" name="220" shape="rect" coords="499,111,534,127" href="#" />
  <area  class="various1" name="210" shape="rect" coords="467,140,504,158" href="#" />
  <area  class="various1" name="110" shape="rect" coords="411,164,443,181" href="#" />
  <area  class="various1" name="120" shape="rect" coords="434,180,466,197" href="#" />
  <area  class="various1" name="130" shape="rect" coords="403,196,436,212" href="#" />
  <area  class="various1" name="150" shape="rect" coords="336,161,382,178" href="#" />
  <area  class="various1" name="shanxi" shape="rect" coords="373,207,404,223" href="#" />
  <area  class="various1" name="370" shape="rect" coords="433,213,463,230" href="#" />
  <area  class="various1" name="640" shape="rect" coords="315,211,347,228" href="#" />
  <area  class="various1" name="650" shape="rect" coords="106,155,140,173" href="#" />
  <area  class="various1" name="630" shape="rect" coords="208,226,240,242" href="#" />
  <area  class="various1" name="620" shape="rect" coords="298,239,330,256" href="#" />
  <area  class="various1" name="sshanxi" shape="rect" coords="342,251,372,267" href="#" />
  <area  class="various1" name="410" shape="rect" coords="392,248,425,265" href="#" />
  <area  class="various1" name="320" shape="rect" coords="453,248,487,264" href="#" />
  <area  class="various1" name="310" shape="rect" coords="493,274,524,291" href="#" />
  <area  class="various1" name="330" shape="rect" coords="469,302,502,319" href="#" />
  <area  class="various1" name="340" shape="rect" coords="432,275,466,292" href="#" />
  <area  class="various1" name="420" shape="rect" coords="382,286,414,301" href="#" />
  <area  class="various1" name="510" shape="rect" coords="278,297,310,314" href="#" />
  <area  class="various1" name="540" shape="rect" coords="114,262,146,279" href="#" />
  <area  class="various1" name="500" shape="rect" coords="332,307,366,324" href="#" />
  <area  class="various1" name="530" shape="rect" coords="262,372,294,389" href="#" />
  <area  class="various1" name="520" shape="rect" coords="327,344,357,361" href="#" />
  <area  class="various1" name="430" shape="rect" coords="379,328,413,345" href="#" />
  <area  class="various1" name="360" shape="rect" coords="421,325,453,341" href="#" />
  <area  class="various1" name="350" shape="rect" coords="453,345,485,361" href="#" />
  <area  class="various1" name="440" shape="rect" coords="404,378,436,395" href="#" />
  <area  class="various1" name="450" shape="rect" coords="349,385,383,402" href="#" />
  <area  class="various1" name="460" shape="rect" coords="362,437,395,454" href="#" />
</map>
<div style="display: none;">
	sdfsdf
</div>
 </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <div class="closedicon">资产结构信息统计</div>
          </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <div class="closedicon">资产处置信息统计</div>
          </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <div class="closedicon">资产结构信息统计</div>
          </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <div class="closedicon">委托贷款信息统计</div>
          </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <div class="closedicon">诉讼案件信息统计</div>
          </div>
     </div>
     <!-- 未展开 资产结构信息统计begin -->
     <div class="wrap">
          <div class="bar_closed"> 
          <div class="closedicon">实体日常管理费用统计</div>
          </div>
     </div>
     
</body>
</html>



