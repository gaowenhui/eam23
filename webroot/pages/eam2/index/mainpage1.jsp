<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<html>
	<head>
		<base href="<%=basePath%>">
		<title>欢迎使用RDP快速开发平台系统</title>
		<%@ include file="/inc/header-standard.inc"%>
		<%@ include file="/inc/header-jquery.inc"%>

		<script type="text/javascript">
	var outerLayout, innerLayout;
	$(document).ready( function() {
		outerLayout = $("body").layout(layoutSettings_Outer);
		var westSelector = "body > .ui-layout-west"; // outer-west pane
			var eastSelector = "body > .ui-layout-east"; // outer-east pane
			$("<span></span>").addClass("pin-button").prependTo(westSelector);
			$("<span></span>").addClass("pin-button").prependTo(eastSelector);
			outerLayout.addPinBtn(westSelector + " .pin-button", "west");
			outerLayout.addPinBtn(eastSelector + " .pin-button", "east");
			$("<span></span>").attr("id", "west-closer")
					.prependTo(westSelector);
			$("<span></span>").attr("id", "east-closer")
					.prependTo(eastSelector);
			outerLayout.addCloseBtn("#west-closer", "west");
			outerLayout.addCloseBtn("#east-closer", "east");
			$("a").each( function() {
				var path = document.location.href;
				if (path.substr(path.length - 1) == "#")
					path = path.substr(0, path.length - 1);
				if (this.href.substr(this.href.length - 1) == "#")
					this.href = path + "#";
			});
		});
	layoutSettings_Inner = {
		applyDefaultStyles :true // basic styling for testing & demo purposes
		,
		minSize :20 // TESTING ONLY
		,
		spacing_closed :14,
		north__spacing_closed :8,
		south__spacing_closed :8,
		north__togglerLength_closed :-1 // = 100% - so cannot 'slide open'
		,
		south__togglerLength_closed :-1,
		fxName :"slide" // do not confuse with "slidable" option!
		,
		fxSpeed_open :1000,
		fxSpeed_close :2500,
		fxSettings_open : {
			easing :"easeInQuint"
		},
		fxSettings_close : {
			easing :"easeOutQuint"
		},
		north__fxName :"none",
		south__fxName :"drop",
		south__fxSpeed_open :500,
		south__fxSpeed_close :1000
		//,	initClosed:						true
		,
		center__minWidth :200,
		center__minHeight :200
	};
	var layoutSettings_Outer = {
		name :"outerLayout" // NO FUNCTIONAL USE, but could be used by custom code to 'identify' a layout
		,
		defaults : {
			size :"auto",
			minSize :20,
			paneClass :"pane" // default = 'ui-layout-pane'
			,
			resizerClass :"resizer" // default = 'ui-layout-resizer'
			,
			togglerClass :"toggler" // default = 'ui-layout-toggler'
			,
			buttonClass :"button" // default = 'ui-layout-button'
			,
			contentSelector :".content" // inner div to auto-size so only it scrolls, not the entire pane!
			,
			contentIgnoreSelector :"span" // 'paneSelector' for content to 'ignore' when measuring room for content
			,
			togglerLength_open :35 // WIDTH of toggler on north/south edges - HEIGHT on east/west edges
			,
			togglerLength_closed :35 // "100%" OR -1 = full height
			,
			hideTogglerOnSlide :true // hide the toggler when pane is 'slid open'
			,
			togglerTip_open :"Close This Pane",
			togglerTip_closed :"Open This Pane",
			resizerTip :"Resize This Pane",
			fxName :"slide" // none, slide, drop, scale
			,
			fxSpeed_open :750,
			fxSpeed_close :1500,
			fxSettings_open : {
				easing :"easeInQuint"
			},
			fxSettings_close : {
				easing :"easeOutQuint"
			}
		},
		north : {
			spacing_open :2 // cosmetic spacing
			,
			size :57,
			togglerLength_open :0 // HIDE the toggler button
			,
			togglerLength_closed :-1 // "100%" OR -1 = full width of pane
			,
			resizable :false,
			slidable :true,
			fxName :"none"
		},
		south : {
			spacing_open :2 // cosmetic spacing
			,
			size :24,
			togglerLength_open :0 // HIDE the toggler button
			,
			togglerLength_closed :-1 // "100%" OR -1 = full width of pane
			,
			resizable :false,
			fxName :"none",
			spacing_closed :0 // HIDE resizer & toggler when 'closed'
			,
			slidable :true // REFERENCE - cannot slide if spacing_closed = 0
			,
			initClosed :false,
			onhide_start : function() {
				return confirm("START South pane hide \n\n onhide_start callback \n\n Allow pane to hide?");
			},
			onhide_end : function() {
				alert("END South pane hide \n\n onhide_end callback");
			},
			onshow_start : function() {
				return confirm("START South pane show \n\n onshow_start callback \n\n Allow pane to show?");
			},
			onshow_end : function() {
				alert("END South pane show \n\n onshow_end callback");
			},
			onopen_start : function() {
				return confirm("START South pane open \n\n onopen_start callback \n\n Allow pane to open?");
			},
			onopen_end : function() {
				alert("END South pane open \n\n onopen_end callback");
			},
			onclose_start : function() {
				return confirm("START South pane close \n\n onclose_start callback \n\n Allow pane to close?");
			},
			onclose_end : function() {
				alert("END South pane close \n\n onclose_end callback");
			},
			onresize_end : function() {
				alert("END South pane resize \n\n onresize_end callback \n\n NOTE: onresize_start event was skipped.");
			}
		},
		west : {
			size :180,
			spacing_closed :21 // wider space when closed
			,
			togglerLength_closed :21 // make toggler 'square' - 21x21
			,
			togglerAlign_closed :"top" // align to top of resizer
			,
			togglerLength_open :0 // NONE - using custom togglers INSIDE west-pane
			,
			togglerTip_open :"Close West Pane",
			togglerTip_closed :"Open West Pane",
			resizerTip_open :"Resize West Pane",
			slideTrigger_open :"click" // default
		},
		east : {
			size :250,
			spacing_closed :0 // wider space when closed
			,
			togglerLength_closed :21 // make toggler 'square' - 21x21
			,
			togglerAlign_closed :"top" // align to top of resizer
			,
			togglerLength_open :0 // NONE - using custom togglers INSIDE east-pane
			,
			togglerTip_open :"Close East Pane",
			togglerTip_closed :"Open East Pane",
			resizerTip_open :"Resize East Pane",
			slideTrigger_open :"mouseover",
			initClosed :true,
			fxName :"drop",
			fxSpeed :"normal",
			fxSettings : {
				easing :""
			}
		// nullify default easing
		},
		center : {
			paneSelector :"#mainContent" // sample: use an ID to select pane instead of a class
			,
			onresize :"innerLayout.resizeAll" // resize INNER LAYOUT when center pane resizes
			,
			minWidth :200,
			minHeight :200
		}
	};
</script>
		<style>
body {
	color: black;
	font-size: 12px;
	background: #8BB9EB; /* color page so it can be seen */
}

.pane {
	OVERFLOW: visible;
}

.ui-layout-mask {
	background: #C00 !important;
	opacity: .20 !important;
	filter: alpha(opacity = 20) !important;
}

.Blue2 {
	font-family: "宋体";
	font-size: 12px;
	font-weight: normal;
	color: #1851AC;
	text-decoration: none;
}

.footline {
	background-image: url(<s:url value="/resources/images/cms_foot_line.jpg" />);
	background-repeat: no-repeat;
	background-position: left center;
}
</style>
	</head>
	<body>
		<div class="ui-layout-west"
			style="padding: 0 0 0 0; margin: 0 0 0 0; background-color1: blue; height: 100%">
			<div class="header">
				操作菜单
			</div>
			<div class="content"
				style="padding: 0 0 0 0; margin: 0 0 0 0; background-color1: red; height: 100%">
				<iframe src="<s:url value="/pages/eam2/index/tree_a.xml" />"
					width="100%" height="100%"
					style="padding: 0 0 0 0; margin: 0 0 0 0; width: 100%; height: 100%"
					frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
		<div class="ui-layout-east">
			<div class="header">
				Outer - East
			</div>
			<div class="subhead">
				I'm a subheader
			</div>
			<div class="content">
				<h3>
					<b>Inner Layout</b>
				</h3>
			</div>
			<div class="footer">
				I'm a footer
			</div>
			<div class="footer">
				I'm another footer
			</div>
			<div class="footer">
				Unlimited headers &amp; footers
			</div>
		</div>
		<div class="ui-layout-north">
			<iframe src="<s:url value="/pages/rdp4j/common/user/top.jsp" />"
				frameBorder=0 name=topFrm id="topFrm" width="100%" height="100%"
				frameborder="0" scrolling="no" style="visibility: inherit;"></iframe>
		</div>
		<div class="ui-layout-south">
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				background="<s:url value="/resource/images/cms_foot_bg.jpg" />">
				<tr
					style="background-image1: url(<s:url value="/resource/images/bottombg.gif" />); background-repeat: repeat-x;">
					<td width="1" align="left" valign="top" style="padding: 0">

					</td>
					<td width="100%" align="left" valign="top">
						<table width="100%" border="0" align="left" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
								</td>
								<td width="200" align="left" class="Blue2 footline">

								</td>
								<td width="200" align="left" class="Blue2 footline">
									当前操作员：<s:property value="#session.user.username" />
								</td>
								<td width="200" align="left" class="Blue2 footline">
									当前日期：<s:property value="#session.user.loginDate" />
								</td>
							</tr>
						</table>
					</td>
					<td width="1" align="right" style="padding: 0">
						<img src="<s:url value="/resource/images/cms_foot_tu2.jpg" />"
							width="18" height="23">
					</td>
				</tr>
			</table>
		</div>
		<div id="mainContent" style="padding: 0 0 0 0; background-color1: red">
			<div class="ui-layout-center"
				style="padding1: 0 0 0 0; background-color1: black; width: 100%; height: 100%;">
				<iframe id="mainFrm" name="mainFrm" src="<s:url value="/workflow/userTask_findMyTodo.do" />"
					width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
	</body>
</html>
