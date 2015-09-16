<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>

<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资产结构信息统计-首页</title>
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
				$.post("<%=basePath%>char/CharAction_queryJyzc.do",{
						"address" : $(obj).attr("name"),
						"type":'1'
					},function(data){
						$("#fancybox-outer").css("background","");
						var dataArr = data.split("|*|");
						$("#cityName").html(dataArr[0]);
						$("#czlSpan").html(dataArr[1]);
						$("#cbsylSpan").html(dataArr[2]);
						
						
						$.fancybox($("#test").html(),{
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
						});
						
					}
				);
				$("#fancybox-outer").css("left",getElementViewLeft(obj)-300);
				$("#fancybox-outer").css("top",getElementViewTop(obj)-146);
			}
			
			function hideWin(){
				$.fancybox.close();
			}
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="content">
<!-- 展开 资产结构信息统计begin -->
   <div class="wrap">
     <div class="bar_open">
     <a href="<%=basePath%>char/CharAction_zcjgCount.do" class="openicon">资产结构信息统计</a>
     </div>
       
               
<div class="outline" >
   	<div class="graphic">
   		<jsp:useBean id="legendItems" class="com.tansun.eam2.jfreeChart.chartmain.PieProcessor" />
		<cewolf:chart id="pieChart" title="" type="pie3D"  showlegend="false">
			<cewolf:data>
				<cewolf:producer id="zcjg" />
			</cewolf:data>
			 <cewolf:chartpostprocessor id="legendItems">
		    </cewolf:chartpostprocessor>
		</cewolf:chart>
 
		<cewolf:img chartid="pieChart" renderer="/adChart" width="500" height="375">
			<cewolf:map linkgeneratorid="zcjg" tooltipgeneratorid="zcjg" />
		</cewolf:img>
		<br>
		
                     
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
   <div id="test" style="">
	 <!-- dialog 悬浮框begin -->
     <div class="dialog"  style="display: none;">
          <div class="top_bg"></div>
          <div class="btm_bg">
               <div class="itemname">经营类资产统计 </div>
               <div class="btn_s"><a href="#">全资产</a></div>
               <div class="cleardiv"></div>
               <p><span class="item">出租率</span>  <span class="datas">61%</span></p>
               <p><span class="item">成本收益率</span>      <span class="datas">33%</span></p>
               <p class="line"></p>
               <p><span class="item">申请费用</span>        <span class="datas">158</span>万元 </p>
               <p><span class="item">报销费用</span>        <span class="datas">112</span>万元</p>
               <p class="line"></p>
               <p><span class="item">合同租金收入</span>    <span class="datas">108</span>万元</p>
          </div>
     </div>
   </div>
</div>

</body>
</html>