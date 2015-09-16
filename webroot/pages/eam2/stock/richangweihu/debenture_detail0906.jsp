<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String id = (String) request.getAttribute("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
		</script>
	</head>
	<base target="_self"/>
	<body>
<table id="land_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">项目名称： </td>
              <td class="td_zxy02"><s:textfield name="slist.xmmc" id="xmmc" readonly="true" style="width: 60%;"/></td>
              <td class="td_zxy01">2009年6月30号账面值： </td>
              <td class="td_zxy02"><s:textfield name="slist.y2009m6d30zmz" id="y2009m6d30zmz" readonly="true" style="width: 60%;"/></td>
            </tr>	
            <tr>
             <td class="td_zxy01">分行：</td>
              <td class="td_zxy02">
              <s:textfield name="slist.fhmc" id="fhmc" readonly="true" style="width: 60%;"/>
             </td>
           	  <td class="td_zxy01">2006年12月30日账面值 原值</td>
              <td class="td_zxy02"><s:textfield name="slist.y2006m12d31zmzyz" id="y2006m12d31zmzyz" readonly="true" style="width: 60%;"/></td>
            </tr>
            <tr>	
              <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
              <td class="td_zxy01">2006年12月30日账面值 减值准备</td>
              <td class="td_zxy02"><s:textfield name="slist.y2006m12d31zmzjzzb" id="y2006m12d31zmzjzzb" readonly="true" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01" >备注：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="slist.bz" id="bz" rows="3" style="width: 85%;" readonly="true"></s:textarea></td>
            </tr>
</table> 	
	</body>
</html>
