<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<script type="text/javascript">
	function query(a){
		//var url ="<%=basePath%>/wnb/wnbList_query.do"  
		//$.post(url,{zcId:"" + a + "",xmId:"" + b + "",zcCode:"" + c + ""})
		document.getElementById(a).style.display="block";
	}
	function afreshPage(){
		window.location.reload();
	}
	function aa(){
		var zcId = "${zcId}";
		var xmId = "${xmId}";
		document.getElementById("PMJGB").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=PMJGB";
		document.getElementById("PMGG").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=PMGG";
		document.getElementById("XCPM").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=XCPM";
		document.getElementById("GHXX").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=GHXX";
		document.getElementById("SKJN").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=SKJN";
		document.getElementById("FYJN").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=FYJN";
		document.getElementById("HKHS").src="<%=basePath%>/wnb/wnbList_query.do?zcId="+zcId+"&xmId=" + xmId + "&zcCode=HKHS";
		
	}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="aa();">

阶段一：拍卖机构
  <iframe id="PMJGB" name="contentRight" width="100%" frameborder="0" scrolling="auto"></iframe>
阶段二：拍卖公告 
  <iframe id="PMGG" name="contentRight"  width="100%"  frameborder="0" scrolling="auto"></iframe>
阶段三：公开拍卖  
  <iframe id="XCPM" name="contentRight"  width="100%" frameborder="0" scrolling="auto"></iframe>
阶段四：过户 
  <iframe id="GHXX" name="contentRight"  width="100%"  frameborder="0" scrolling="auto"></iframe>
  <iframe id="SKJN" name="contentRight"  width="100%"  frameborder="0" scrolling="auto"></iframe>
  <iframe id="FYJN" name="contentRight"  width="100%"  frameborder="0" scrolling="auto"></iframe>
阶段五：回款回收   
  <iframe id="HKHS" name="contentRight"  width="100%" frameborder="0" scrolling="auto"></iframe>
</body>
</html>
 		