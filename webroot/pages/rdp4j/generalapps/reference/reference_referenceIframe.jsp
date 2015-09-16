<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title></title>
	 <script type="text/javascript" src="/rdp4j/resource/js/jquery/layout/complex.js"></script>
     <script type="text/javascript" src="/rdp4j/resource/js/jquery/jquery.js"></script>
     <script type="text/javascript" src="/rdp4j/resource/js/jquery/layout/jquery.layout.js"></script>
     <script type="text/javascript" src="/rdp4j/resource/js/jquery/jqueryui/jquery-ui.custom.min.js"></script>
     <link type="text/css" rel="stylesheet" href="/rdp4j/resource/js/jquery/jqueryui/css/cupertino/jquery-ui.custom.css">
<script type="text/javascript"> 
	var outerLayout, innerLayout;
	$(document).ready( function() {
		outerLayout = $("body").layout( layoutSettings_Outer );
		var westSelector = "body > .ui-layout-west"; // outer-west pane
 
		$("<span></span>").addClass("pin-button").prependTo( westSelector );
		outerLayout.addPinBtn( westSelector +" .pin-button", "west");
		$("<span></span>").attr("id", "west-closer" ).prependTo( westSelector );
		$("a").each(function () {
			var path = document.location.href;
			if (path.substr(path.length-1)=="#") path = path.substr(0,path.length-1);
			if (this.href.substr(this.href.length-1) == "#") this.href = path +"#";
		});
 
	});
	var layoutSettings_Outer = {
		name: "outerLayout" // NO FUNCTIONAL USE, but could be used by custom code to 'identify' a layout
		// options.defaults apply to ALL PANES - but overridden by pane-specific settings
	,	defaults: {
			size:					"auto"
		,	minSize:				20
		,	paneClass:				"pane" 		// default = 'ui-layout-pane'
		,	resizerClass:			"resizer"	// default = 'ui-layout-resizer'
		,	togglerClass:			"toggler"	// default = 'ui-layout-toggler'
		,	buttonClass:			"button"	// default = 'ui-layout-button'
		,	contentSelector:		".content"	// inner div to auto-size so only it scrolls, not the entire pane!
		,	contentIgnoreSelector:	"span"		// 'paneSelector' for content to 'ignore' when measuring room for content
		,	togglerLength_open:		35			// WIDTH of toggler on north/south edges - HEIGHT on east/west edges
		,	togglerLength_closed:	35			// "100%" OR -1 = full height
		,	hideTogglerOnSlide:		true		// hide the toggler when pane is 'slid open'
		,	togglerTip_open:		"Close This Pane"
		,	togglerTip_closed:		"Open This Pane"
		,	resizerTip:				"Resize This Pane"
		//	effect defaults - overridden on some panes
		,	fxName:					"none"		// none, slide, drop, scale
		,	fxSpeed_open:			750
		,	fxSpeed_close:			1500
		,	fxSettings_open:		{ easing: "easeInQuint" }
		,	fxSettings_close:		{ easing: "easeOutQuint" }
	}
	,	north: {
				spacing_closed:			0			// wider space when closed
			,	initClosed:				true
		}
	,	south: {
				spacing_closed:			0			// wider space when closed
			,	initClosed:				true
		}
	,	west: {
			size:					200
		,	slidable:				true
		,	togglerLength_open:		0			// HIDE the toggler button
		,	togglerLength_closed:	-1			// "100%" OR -1 = full width of pane
		}
	,	east: {
				spacing_closed:			0			// wider space when closed
			,	initClosed:				true
		}
	,	center: {
			paneSelector:			"#mainContent" 			// sample: use an ID to select pane instead of a class
		,	onresize:				"innerLayout.resizeAll"	// resize INNER LAYOUT when center pane resizes
		,	minWidth:				200
		,	minHeight:				200
		}
	};
</script>
</head>
<body>
<style> 
body {
	color:			black;
	font-size:12px;
	background:		#8BB9EB;	/* color page so it can be seen */
}
.pane{
	OVERFLOW: visible;
}
/* CSS Rule - give iframe-mask shading */
.ui-layout-mask {
	background:	#C00 !important;
	opacity:	.20 !important;
	filter:		alpha(opacity=20) !important;
}
 
.Blue2{font-family: "宋体";font-size: 12px;font-weight: normal;color: #1851AC;text-decoration: none;}
.footline {
	background-image: url(images/cms_foot_line.jpg);
	background-repeat: no-repeat;
	background-position: left center;
}
</style>
<div class="ui-layout-west" style="padding: 0 0 0 0;margin: 0 0 0 0;background-color1: blue;height:100%">
	<iframe id="contentLeft" name="contentLeft" src="<%=request.getContextPath()%>/reference/reference_toTree.do" width="100%" height="100%" style="padding: 0 0 0 0;margin: 0 0 0 0;width:100%;height:100%" frameborder="0" scrolling="auto"></iframe>
</div>
<div class="ui-layout-east">
</div>
<div class="ui-layout-north">
</div>
<div class="ui-layout-south">
</div>
<div id="mainContent" style="padding: 0 0 0 0;background-color1: red">
	<div class="ui-layout-center" style="padding1: 0 0 0 0;background-color1: black;width:100%;height:100%;">
	<iframe id="contentRight" name="contentRight" src="" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
	</div>
</div>
</body>
</html> 

    
