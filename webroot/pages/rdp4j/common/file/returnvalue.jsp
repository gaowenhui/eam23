<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<script language="javascript">
	//window.opener.location.reload();
	var urldown="<%=request.getAttribute("urldown")%>";
	var urldelete="<%=request.getAttribute("urldelete")%>";
	var title="<%=request.getAttribute("title")%>";
	var uuid="<%=request.getAttribute("uuid")%>";
	var filetype ="<%=request.getAttribute("filetype")%>";
	//alert(filetype);
	if(window.opener!=null){
		window.opener.setUrlValue_<%=request.getAttribute("filetype")%>(urldown,urldelete,title,uuid);
	}
	if(filetype=='single'||filetype=='aaa'){  
		 window.opener.removebt_<%=request.getAttribute("filetype")%>();
	}
	window.close();
</script> 