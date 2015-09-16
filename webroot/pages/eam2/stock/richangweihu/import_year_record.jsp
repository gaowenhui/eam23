<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");
String look = (String)request.getAttribute("look");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String yearData = request.getParameter("yearData");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>债券日常维护</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
		function save(){
			$("#myform").attr("action","<%=basePath%>stock/maintain_saveBookValue.do?yearData="+'<%=yearData%>');
	    	$("#myform").submit();
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   	 var nf = document.getElementById("nf");
			   		window.opener.location.reload();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		});
		</script>
	</head>
	<base target="_self"/>
	<body>
<s:form action="" method="post" id="myform">
<s:hidden name="sinfo.id" id="sinfoid" ></s:hidden>
<table id="machine_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td class="td_zxy01">债券名称：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.zqmc" id="zqmc" readonly="true"/></td>
              <td class="td_zxy01">行名:</td>
              <td class="td_zxy02"><s:textfield name="sinfo.jhfhmc" id="jhfhmc" readonly="true"/></td>
            </tr>	
            <tr>
              <td class="td_zxy01">时间(年) ：</td>
              <td class="td_zxy02"><s:textfield name="sb.nf" id="nf" /></td>
              <td class="td_zxy01">债券面值：</td>
              <td class="td_zxy02">
              <%if("1".equals(yearData)){ %>
              <s:textfield name="sb.zqmz" id="zqmz" />
              <%}else{ %>
              <s:textfield name="sb.zqmz2" id="zqmz2" />
              <%} %>
              </td>
            </tr>
            <tr>	
              <td class="td_zxy01">债券投资净额 ：</td>
              <td class="td_zxy02">
              <%if("1".equals(yearData)){ %>
              <s:textfield name="sb.zqtzje" id="zqtzje" />
              <%}else{ %>
              <s:textfield name="sb.zqtzje2" id="zqtzje2" />
              <%} %>
              </td>
             <td class="td_zxy01">债券投资减值准备：</td>
              <td class="td_zxy02">
              <%if("1".equals(yearData)){ %>
               <s:textfield name="sb.tzjczb" id="tzjczb" />
              <%}else{ %>
               <s:textfield name="sb.tzjczb2" id="tzjczb2" />
              <% }%>
              </td>
            </tr>
             <tr>
              <td class="td_zxy01">应收利息：</td>
              <td class="td_zxy02">
              <%if("1".equals(yearData)){ %>
              <s:textfield name="sb.yslx" id="yslx" />
              <%}else{ %>
              <s:textfield name="sb.yslx2" id="yslx2" />
              <%} %>
              </td>
             <td class="td_zxy01">应收利息坏账准备：</td>
              <td class="td_zxy02">
              <%if("1".equals(yearData)){ %>
              <s:textfield name="sb.yslxhzzb" id="yslxhzzb" />
              <%}else{ %>
              <s:textfield name="sb.yslxhzzb2" id="yslxhzzb2" />
              <%} %>
              </td>
             </tr>
             <tr>
              <td class="td_zxy01">应收利息净额：</td>
              <td class="td_zxy02">
               <%if("1".equals(yearData)){ %>
              <s:textfield name="sb.yslxje" id="yslxje" />
              <%}else{ %>
              <s:textfield name="sb.yslxje2" id="yslxje2" />
              <%} %>
              </td>
              <td class="td_zxy01">债券投资损益：</td>
              <td class="td_zxy02">
               <%if("1".equals(yearData)){ %>
              <s:textfield name="sb.tzsync" id="sb.tzsync" /></td>
              <%}else{ %>
               <s:textfield name="sb.tzsynm" id="tzsynm" />
              <%} %>
             </tr>
            <tr>
              <td class="td_zxy02" colspan="4">
              <div align="right">
			     <input name="sdfg" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
              </div>   
			  </td>
            </tr>
</table> 	
</s:form>

	</body>
</html>
