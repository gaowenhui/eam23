<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<title>文件上传</title>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<s:set name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<%@ include file="/inc/file.inc"%>
<e:filebutton fjlx="single" biaodanId="111" isview="Y" />
</body>
</html>



