<script language="javascript">
	//window.opener.location.reload();
	<%
	String fjlx= (String)request.getAttribute("filetype");
	if("huiqian".equals(fjlx) || "heguishencha".equals(fjlx)){
	%>
	window.opener.reloadFileGrid_huiqian();
	<%
	}else{
	%>
	window.opener.reloadFileGrid();
	<%
	}
	%>
	window.close();
</script>
