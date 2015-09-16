<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String piId = (String)request.getAttribute("piId");
	String pdk = (String)request.getAttribute("pdk");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<title>流程跟踪图</title>
<SCRIPT type=text/JavaScript>
 
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
	if(piId==null||piId.equals("")){
%>
   <e:svg id="testsvg" name="dfdf" width="80%" instanceid="" pdk="<%=pdk%>" />
<%
	}else{
%>
	<e:svg id="testsvg" name="dfdf" width="80%" instanceid="<%=piId%>" pdk="<%=pdk%>" />
<%	
	}
%>
</body>
</html>