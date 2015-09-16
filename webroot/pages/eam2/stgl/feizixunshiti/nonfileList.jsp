<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
	String stid = (String)request.getAttribute("stid");
	String zixunType = (String)request.getAttribute("zixunType");
	String look = (String)request.getAttribute("look");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>相关附件</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		$(document).ready(function(){
			if('1' != '<%=look%>'){
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			}
			
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			});
		});
		</script>
	</head>
	<base target="_self"/>
<body>
<s:form action="" method="post" id="myform">
<s:hidden name="st.id" id="stid"></s:hidden>
<s:set name="biaodanid" value="st.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" />
<%@ include file="/inc/file.inc"%>	
</s:form>
</body>
</html>
