<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/WEB-INF/tld/cewolf.tld" prefix="cewolf" %>

<%@ taglib uri="/struts-tags" prefix="s" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资产结构信息统计-经营性固定资产-经营类资产统计</title>
	<link rel="stylesheet" type="text/css" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="resource/ProjectJQuery/jquery.fancybox-1.3.4/style.css" />
	<link href="resource/css/president.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="resource/ProjectJQuery/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js"></script>
	<script type="text/javascript">
			var winWidth=0;
			var winHeight=0;
			$(document).ready(function() {
				document.onclick=hideWin;
				function findDimensions() //函数：获取尺寸
				{
					//获取窗口宽度
					if(window.innerWidth)
						winWidth=window.innerWidth;
					else if((document.body)&&(document.body.clientWidth))
						winWidth=document.body.clientWidth;
					//获取窗口高度
					if(window.innerHeight)
						winHeight=window.innerHeight;
					else if((document.body)&&(document.body.clientHeight))
						winHeight=document.body.clientHeight;
					
					/*nasty hack to deal with doctype swith in IE*/
					//通过深入Document内部对body进行检测，获取窗口大小
					if(document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){
						winHeight=document.documentElement.clientHeight;
						winWidth=document.documentElement.clientWidth;
					}
				}
				init();
			});
			
			function init2(){
				$(".bar_closed,.bar_open").each(function(i,tabHead){
					$(tabHead).click(function(){
						//收起body
						$(".bar_open").next(".outline").slideUp("slow");
						//改变+、－图标
						$(".bar_open").find(".openicon").attr("class","closedicon");
						$(".bar_open").attr("class","bar_closed");
						//循环排列div
						var newObjArr = new Array();
						var j = null;
						$(".wrap").each(function(i,tab){
							if($(tab).attr("id") == $(tabHead).parent(".wrap").attr("id")){
								newObjArr[0] = $(tab).html();
								j = i;
							}else{
								if(j == null){
									newObjArr[i+1] = $(tab).html();
								}else{
									newObjArr[i] = $(tab).html();
								}
							}
						});
						//$(newObjArr).each(function(i,obj){
							//$("#wrap_" + i).html(obj);
						//});
						var headIcon = $(tabHead).find(".closedicon");
						var head_body = $(tabHead).next(".outline");
						//收起body
						$(this).next(".outline").slideDown("slow");
						//改变+、－图标
						$(this).find(".openicon").attr("class","openicon");
						$(this).attr("class","bar_open");
					});
				});
			}
			
			function init(){
				$(".bar_closed,.bar_open").click(function(){
					if($(this).attr("class").indexOf("bar_open") != -1){
						$(this).next(".outline").slideUp("slow");
					}else if($(this).attr("class").indexOf("bar_closed") != -1){
						$(this).next(".outline").slideDown("slow");
					}
					$(this).find(".openicon").toggleClass("closedicon");
					$(this).toggleClass("bar_closed");
					$(this).find(".openicon").toggleClass("openicon");
					$(this).toggleClass("bar_open");
				});
			}
			
			function showWin(obj)
			{
				$.post("<%=basePath%>char/CharAction_queryJyzc.do?address=",{
						"address" : $(obj).attr("name")
					},function(data){
						$("#fancybox-outer").css("background","");
						var dataArr = data.split("|*|");
						$("#czlSpan").html(dataArr[0]);
						$("#cbsylSpan").html(dataArr[1]);
						/**
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
						**/
					}
				);
				$("#fancybox-outer").css("left",getElementViewLeft(obj)-380);
				$("#fancybox-outer").css("top",getElementViewTop(obj)-190);
			}
			
			function hideWin(){
				$.fancybox.close();
			}
			
			function showWin2(obj){
				$("#fancybox-outer").css("background","#fff");
				$("#fancybox-outer").css("position","absolute");
				$("#fancybox-outer").css("top",winWidth/2);
				$("#fancybox-outer").css("left",winHeight/2);
				$(".various1").fancybox({
						'width'				: 500,
						'height'			: 430,
						'showCloseButton'	: true,
						'padding'			: 0,
						'margin'			: 10,
						'type'				: 'iframe'
				});
			}
			
	function getElementLeft(element){
		var actualLeft = element.offsetLeft;
		var current = element.offsetParent;

　　　　	while (current !== null){
			actualLeft += current.offsetLeft;
			current = current.offsetParent;
		}
	　　return actualLeft;
	}

　　function getElementTop(element){
		var actualTop = element.offsetTop;
		var current = element.offsetParent;

　　　　	while (current !== null){
			actualTop += current.offsetTop;
			current = current.offsetParent;
		}
　　　　	return actualTop;
	}


	function getElementViewLeft(element){
		var actualLeft = element.offsetLeft;
		var current = element.offsetParent;
	
	　　while (current !== null){
			actualLeft += current.offsetLeft;
			current = current.offsetParent;
		}
	
	　　if (document.compatMode == "BackCompat"){
			var elementScrollLeft=document.body.scrollLeft;
		} else {
			var elementScrollLeft=document.documentElement.scrollLeft; 
		}
	
	　　return actualLeft-elementScrollLeft;
	}

　　function getElementViewTop(element){
		var actualTop = element.offsetTop;
		var current = element.offsetParent;

	　　while (current !== null){
			actualTop += current. offsetTop;
			current = current.offsetParent;
		}	

　　　　 if (document.compatMode == "BackCompat"){
			var elementScrollTop=document.body.scrollTop;
		} else {
			var elementScrollTop=document.documentElement.scrollTop; 
		}
　　		return actualTop-elementScrollTop;
	}

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="content">
   <div class="wrap" id="wrap_0">
     <div class="bar_open">
     <a href="javascript:void(0)" href="pages/chart/qzctjChart.jsp" class="openicon">资产结构信息统计</a>
     </div>
     <div class="outline">
        <h1>经营性固定资产</h1>
        <div class="tab">
          <ul>
          <li class="now_left"></li>
          <li class="now"><a href="javascript:void(0)" >出租率与成本收益率</a></li>
          <li class="left"></li>
          <li class="right"><a href="javascript:void(0)" >资产日常费用</a></li>
          <li class="left"></li>
          <li class="right"><a href="javascript:void(0)" >合同租金收入</a></li>
          </ul>
          <div class="disline"></div>
        </div>
        <div class="title">
          <ul>
          <li><a href="javascript:void(0)" >全资产统计</a></li>
          <li class="now"><a href="javascript:void(0)" >经营类资产统计</a></li>
          </ul>
        </div>

   	
<img src="<%=basePath + a%>" border="0" usemap="#Map" />
<map name="Map" id="Map">
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=230" class="various1" name="230" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="498,62,545,81" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=220" class="various1" name="220" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="499,111,534,127" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=210" class="various1" name="210" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="467,140,504,158" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=110" class="various1" name="110" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="411,164,443,181" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=120" class="various1" name="120" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="434,180,466,197" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=130" class="various1" name="130" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="403,196,436,212" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=150" class="various1" name="150" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="336,161,382,178" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=140" class="various1" name="140" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="373,207,404,223" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=370" class="various1" name="370" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="433,213,463,230" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=640" class="various1" name="640" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="315,211,347,228" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=650" class="various1" name="650" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="106,155,140,173" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=630" class="various1" name="630" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="208,226,240,242" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=620" class="various1" name="620" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="298,239,330,256" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=610" class="various1" name="610" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="342,251,372,267" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=410" class="various1" name="410" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="392,248,425,265" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=320" class="various1" name="320" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="453,248,487,264" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=310" class="various1" name="310" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="493,274,524,291" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=330" class="various1" name="330" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="469,302,502,319" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=340" class="various1" name="340" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="432,275,466,292" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=420" class="various1" name="420" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="382,286,414,301" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=510" class="various1" name="510" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="278,297,310,314" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=540" class="various1" name="540" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="114,262,146,279" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=500" class="various1" name="500" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="332,307,366,324" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=530" class="various1" name="530" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="262,372,294,389" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=520" class="various1" name="520" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="327,344,357,361" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=430" class="various1" name="430" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="379,328,413,345" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=360" class="various1" name="360" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="421,325,453,341" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=350" class="various1" name="350" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="453,345,485,361" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=440" class="various1" name="440" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="404,378,436,395" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=450" class="various1" name="450" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="349,385,383,402" href="javascript:void(0)" />
 <a onclick="init()" rea href="<%=basePath%>char/CharAction_czlByYear.do?address=460" class="various1" name="460" shape="rect" onmouseover="showWin(this)" onclick="showWin2(this);" coords="362,437,395,454" href="javascript:void(0)" />
</map>
 </div>
   </div>
   <!-- 展开 经营性固定资产信息统计begin -->
   <div class="wrap" id="wrap_1">
          <div class="bar_closed"> 
          <div class="closedicon"><a href="javascript:void(0)" >经营性固定资产信息统计</a></div>
          </div>
          <div class="outline" style="display:none">
               <h1>经营性固定资产</h1>
               <div class="tab">
                    <ul>
                    <li class="now_left"></li>
                    <li class="now"><a href="javascript:void(0)" >出租率与成本收益率</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >资产日常费用</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >合同租金收入</a></li>
                    </ul>
                    <div class="disline"></div>
               </div>
               <div class="title">
                    <ul>
                    <li class="now"><a href="javascript:void(0)" >全资产统计</a></li>
                    <li><a href="javascript:void(0)" >经营类资产统计</a></li>
                    </ul>
               </div>
               <div class="graphic"></div>
          </div>
     </div>
   <!-- 展开 资产处置信息统计begin -->
   <div class="wrap" id="wrap_2">
          <div class="bar_closed">
          <div class="closedicon"><a href="javascript:void(0)" >资产处置信息统计</a></div>
          </div>
          <div class="outline" style="display:none">
               <h1>经营性固定资产</h1>
               <div class="tab">
                    <ul>
                    <li class="now_left"></li>
                    <li class="now"><a href="javascript:void(0)" >出租率与成本收益率</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >资产日常费用</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >合同租金收入</a></li>
                    </ul>
                    <div class="disline"></div>
               </div>
               <div class="title">
                    <ul>
                    <li class="now"><a href="javascript:void(0)" >全资产统计</a></li>
                    <li><a href="javascript:void(0)" >经营类资产统计</a></li>
                    </ul>
               </div>
               <div class="graphic"></div>
          </div>
     </div>
   <!-- 展开 委托贷款信息统计begin -->
   <div class="wrap" id="wrap_3">
          <div class="bar_closed">
          <div class="closedicon"><a href="javascript:void(0)" >委托贷款信息统计</a></div>
          </div>
          <div class="outline" style="display:none">
               <h1>经营性固定资产</h1>
               <div class="tab">
                    <ul>
                    <li class="now_left"></li>
                    <li class="now"><a href="javascript:void(0)" >出租率与成本收益率</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >资产日常费用</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >合同租金收入</a></li>
                    </ul>
                    <div class="disline"></div>
               </div>
               <div class="title">
                    <ul>
                    <li class="now"><a href="javascript:void(0)" >全资产统计</a></li>
                    <li><a href="javascript:void(0)" >经营类资产统计</a></li>
                    </ul>
               </div>
               <div class="graphic"></div>
          </div>
     </div>
   <!-- 展开 诉讼案件信息统计begin -->
   <div class="wrap" id="wrap_4">
          <div class="bar_closed"> 
          <div class="closedicon"><a href="javascript:void(0)" >诉讼案件信息统计</a></div>
          </div>
          <div class="outline" style="display:none" >
               <h1>经营性固定资产</h1>
               <div class="tab">
                    <ul>
                    <li class="now_left"></li>
                    <li class="now"><a href="javascript:void(0)" >出租率与成本收益率</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >资产日常费用</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >合同租金收入</a></li>
                    </ul>
                    <div class="disline"></div>
               </div>
               <div class="title">
                    <ul>
                    <li class="now"><a href="javascript:void(0)" >全资产统计</a></li>
                    <li><a href="javascript:void(0)" >经营类资产统计</a></li>
                    </ul>
               </div>
               <div class="graphic"></div>
          </div>
     </div>
  <!-- 展开实体日常管理费用统计begin -->
   <div class="wrap" id="wrap_5">
          <div class="bar_closed"> 
          <div class="closedicon"><a href="javascript:void(0)" >实体日常管理费用统计</a></div>
          </div>
          <div class="outline" style="display:none" >
               <h1>经营性固定资产</h1>
               <div class="tab">
                    <ul>
                    <li class="now_left"></li>
                    <li class="now"><a href="javascript:void(0)" >出租率与成本收益率</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >资产日常费用</a></li>
                    <li class="left"></li>
                    <li class="right"><a href="javascript:void(0)" >合同租金收入</a></li>
                    </ul>
                    <div class="disline"></div>
               </div>
               <div class="title">
                    <ul>
                    <li class="now"><a href="javascript:void(0)" >全资产统计</a></li>
                    <li><a href="javascript:void(0)" >经营类资产统计</a></li>
                    </ul>
               </div>
               <div class="graphic"></div>
          </div>
     </div>

</div>
<%@ include file="/inc/test.inc"%>
</body>
</html>