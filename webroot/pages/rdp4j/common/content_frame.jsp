<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>

<%
	String strLeft=request.getParameter("left");//ParaUtil.getString(request,"left","about:blank");
	String strRight=request.getParameter("right");//ParaUtil.getString(request,"right","about:blank");
	String strTitle=request.getParameter("title");//ParaUtil.getString(request,"title");
	strLeft=(strLeft.startsWith("/")?request.getContextPath()+strLeft:strLeft);
	strRight="";//(strRight.startsWith("/")?request.getContextPath()+strRight:strRight);
	if(!strLeft.equals("about:blank")){
		String strURI=request.getRequestURI();
		if(!request.getContextPath().equals("")){
			strURI=strURI.replaceAll(request.getContextPath(),"");
		}
		strURI=strURI.substring(1,strURI.length());
		String strCheckURL=strURI+"?"+strLeft;
		java.util.List list=(java.util.List)session.getAttribute("fsm.menu.all.list");
		if(list!=null&&list.contains(strURI)&&session.getAttribute(strURI)==null){
			out.print("<script language=\"javascript\">alert('您未被授权访问此页面！');</script>");
			return;
		}
	}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- uncomment 'base' to view this page without external files
	<base href="http://jquery-border-layout.googlecode.com/svn/trunk/" />
	-->
 
	<title></title>
 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/complex.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/tools/jquery/jquery-ui.custom.css">

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery/layout/complex.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery/jquery.layout.js"></script>

<script type="text/javascript"> 
/*
 * complex.html
 *
 * This is a demonstration page for the jQuery layout widget
 *
 *	NOTE: For best code readability, view this with a fixed-space font and tabs equal to 4-chars
 */
 
	var outerLayout, innerLayout;
 
	/*
	*#######################
	*     ON PAGE LOAD
	*#######################
	*/
	$(document).ready( function() {
		// create the OUTER LAYOUT
		outerLayout = $("body").layout( layoutSettings_Outer );
 
		/*******************************
		 ***  CUSTOM LAYOUT BUTTONS  ***
		 *******************************
		 *
		 * Add SPANs to the east/west panes for customer "close" and "pin" buttons
		 *
		 * COULD have hard-coded span, div, button, image, or any element to use as a 'button'...
		 * ... but instead am adding SPANs via script - THEN attaching the layout-events to them
		 *
		 * CSS will size and position the spans, as well as set the background-images
		 */
 
		// BIND events to hard-coded buttons in the NORTH toolbar
		//outerLayout.addToggleBtn( "#tbarToggleNorth", "north" );
		//outerLayout.addOpenBtn( "#tbarOpenSouth", "south" );
		//outerLayout.addCloseBtn( "#tbarCloseSouth", "south" );
		//outerLayout.addPinBtn( "#tbarPinWest", "west" );
		//outerLayout.addPinBtn( "#tbarPinEast", "east" );
 
		// save selector strings to vars so we don't have to repeat it
		// must prefix paneClass with "body > " to target ONLY the outerLayout panes
		var westSelector = "body > .ui-layout-west"; // outer-west pane
		//var eastSelector = "body > .ui-layout-east"; // outer-east pane
 
		 // CREATE SPANs for pin-buttons - using a generic class as identifiers
		$("<span></span>").addClass("pin-button").prependTo( westSelector );
		//$("<span></span>").addClass("pin-button").prependTo( eastSelector );
		// BIND events to pin-buttons to make them functional
		outerLayout.addPinBtn( westSelector +" .pin-button", "west");
		//outerLayout.addPinBtn( eastSelector +" .pin-button", "east" );
 
		 // CREATE SPANs for close-buttons - using unique IDs as identifiers
		$("<span></span>").attr("id", "west-closer" ).prependTo( westSelector );
		//$("<span></span>").attr("id", "east-closer").prependTo( eastSelector );
		// BIND layout events to close-buttons to make them functional
		//outerLayout.addCloseBtn("#west-closer", "west");
		//outerLayout.addCloseBtn("#east-closer", "east");
 
		// DEMO HELPER: prevent hyperlinks from reloading page when a 'base.href' is set
		$("a").each(function () {
			var path = document.location.href;
			if (path.substr(path.length-1)=="#") path = path.substr(0,path.length-1);
			if (this.href.substr(this.href.length-1) == "#") this.href = path +"#";
		});

	});
 
 

 
	/*
	*#######################
	* OUTER LAYOUT SETTINGS
	*#######################
	*
	* This configuration illustrates how extensively the layout can be customized
	* ALL SETTINGS ARE OPTIONAL - and there are more available than shown below
	*
	* These settings are set in 'sub-key format' - ALL data must be in a nested data-structures
	* All default settings (applied to all panes) go inside the defaults:{} key
	* Pane-specific settings go inside their keys: north:{}, south:{}, center:{}, etc
	*/
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
			size:					180
		,	slidable:				true
		,	togglerLength_open:		0			// HIDE the toggler button
		,	togglerLength_closed:	-1			// "100%" OR -1 = full width of pane
		//,	spacing_closed:			21			// wider space when closed
		//,	togglerLength_closed:	21			// make toggler 'square' - 21x21
		//,	togglerAlign_closed:	"bottom"		// align to top of resizer
		//,	togglerLength_open:		0			// NONE - using custom togglers INSIDE west-pane
		//,	togglerTip_open:		"Close West Pane"
		//,	togglerTip_closed:		"Open West Pane"
		//,	resizerTip_open:		"Resize West Pane"
		//,	slideTrigger_open:		"click" 	// default
		//,	initClosed:				true
		//	add 'bounce' option to default 'slide' effect
		//,	fxSettings_open:		{ easing: "easeOutBounce" }
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
	<iframe id="contentLeft" name="contentLeft" src="<%=strLeft %>" width1="100%" height1="100%" style="padding: 0 0 0 0;margin: 0 0 0 0;width:100%;height:100%" frameborder="0" scrolling="auto"></iframe>
</div>
<div class="ui-layout-east">
</div>
<div class="ui-layout-north">
</div>
<div class="ui-layout-south">
</div>
<div id="mainContent" style="padding: 0 0 0 0;background-color1: red">
	<div class="ui-layout-center" style="padding1: 0 0 0 0;background-color1: black;width:100%;height:100%;">
	<iframe id="contentRight" name="contentRight" src="<%=strRight %>" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
	</div>
</div>
</body>
</html> 
