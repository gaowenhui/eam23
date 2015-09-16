<%@page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
		<SCRIPT language=JavaScript type=text/JavaScript>
       function disposationTraceMain(){
       		zcId = "zxqk";
			var xmId = '${xmIds}';
			var zcCzfs = "zxqk";
			iframe1.style.display = "block";
			var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?zcIds="+zcId+"&xmIds="+xmId+"&zcCzfs="+zcCzfs;
			iframeSrc.window.location = url;
		}	
</SCRIPT>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="disposationTraceMain()">
<s:form id="myform" name="myform" action="">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"  >
 	<tr id="iframe1">
 		<td>
 			<iframe id="iframeSrc" frameBorder=0 height="400" width="100%" scrolling="no" src=""></iframe>
 		</td>
 	</tr>
 </table>
</s:form>
</body>
</html>
<script type="text/javascript">
</script>
