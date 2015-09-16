<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <script type="text/javascript">
  function t(){
   	 var _form = document.createElement("form");
	 _form.action =  basePathJs + "zyzc/index.do";
	 _form.method="post";
	 var _urlPortal = document.createElement("input");
	 _urlPortal.type="text";
	 _urlPortal.name="urlPortal";
	 var enurl = window.opener.document.getElementById("ypl").value;
	 _urlPortal.value=enurl;
	 _form.appendChild(_urlPortal);
	 document.body.appendChild(_form);
	 _form.submit();
	 _form.removeChild(_urlPortal);
  }
  </script>
  <body onload="t();"></body>
</html>
