<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
			var winWidth=0;
			var winHeight=0;
			$(document).ready(function() {
				document.onclick=hideWin;
			});
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
			
			
			function showWin2(obj){
				$("#fancybox-outer").css("background","#fff");
				$("#fancybox-outer").css("position","absolute");
				$("#fancybox-outer").css("top",winWidth/2);
				$("#fancybox-outer").css("left",winHeight/2);
				$(".various1").fancybox({
					//	'width'			: 700,
						'height'			: 420,
						'showCloseButton'	: true,
						'padding'			: 0,
						'margin'			: 10,
						'type'				: 'iframe',
						onComplete			: function(){
							//resizeFancybox();
						}
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

	function resizeFancybox(w,h){
		$("#fancybox-frame").height(h);
		$("#fancybox-content").height(h);
		$("#fancybox-frame").width(w);
		$("#fancybox-content").width(w);
	}
</script>