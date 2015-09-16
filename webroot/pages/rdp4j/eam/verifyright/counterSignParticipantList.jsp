<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam.verifyright.model.*"%>
<%@ page language="java" import="com.tansun.eam.verifyright.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%
	String deptName = (String)request.getAttribute("deptName");
	List unParticipantList = (List)request.getAttribute("unParticipantList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache,must-revalidate"/> 

<title>会签办理单</title>
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.multiselect.css" />
<link rel="stylesheet" type="text/css" href="../JQuery/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="../JQuery/themes/icon.css">
<script type="text/javascript" src="../js/openWin.js"></script>
<script src="../JQuery/js/jquery.js" type="text/javascript"></script>
<script src="../JQuery/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../JQuery/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="../JQuery/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/oper_table.js"></script>
<script type="text/javascript" src="../js/custom/tools.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/win_center.js"></script>
<script type= "text/javascript" src= "../js/tab.js"> </script>
<script language="JavaScript" type="text/javascript" src="../js/tree-card.js"></script>
<script language="JavaScript" type="text/javascript"  src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
<link href="<%=path %>/resource/css/maincss.css" rel="stylesheet" type="text/css"/>
<script>
	function choiceUser(){
		checkList = document.form1.userId;
		var value = '';
		for(var i=0;i<checkList.length;i++){
			if(checkList[i].checked==true){
				if(value==''){
					value+=checkList[i].value;
				}else{
					value+=','+checkList[i].value;
				}
			}
		}
		if(value!=''){
			window.returnValue=value;
	  		window.close();
	  	}
	}
</script>
</head>
<body>
<form name="form1">
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th colspan="2"><%=deptName%></th>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>人员名称</th>
	</tr>
<%
	for(int i=0;i<unParticipantList.size();i++){
		PTUserBO userBO = (PTUserBO)unParticipantList.get(i);
%>
	<tr>
		<td><input type="checkbox" name="userId" id="userId" value="<%=userBO.getTid()%>"/></td>
		<td><%=userBO.getUsername()%></td>
	</tr>
<%
	}
%>
	<tr>
		<td colspan="3" align="center">
			<input type="button" value="确定" onclick="choiceUser()"/>&nbsp;&nbsp;
			<input type="button" value="取消" onclick="window.self.close()"/>
		</td>
	</tr>
</table>
</form>
  </body>
</html>
