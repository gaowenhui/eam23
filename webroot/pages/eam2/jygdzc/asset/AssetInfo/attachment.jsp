<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	boolean isdisable = false;
	isdisable = "true".equals((String) request
		.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>附件信息</title>
<script type="text/javascript">
	$(function(){
		jQuery("#file_list").setGridWidth($("#file_tableWidth").width());
		$(window).bind('resize', function(){
			jQuery("#file_list").setGridWidth($("#file_tableWidth").width());
		});
		// if("true"!="<%=isdisable%>"){
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		// }
	});
</script>
</head>
<body>
<s:set name="biaodanid" value="%{#request.zcId}" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<%@ include file="/inc/file.inc"%>
</body>
</html>