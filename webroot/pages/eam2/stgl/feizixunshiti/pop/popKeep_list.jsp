<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
String sheadId = request.getParameter("sheadId");
String look = (String)request.getAttribute("look");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>文件及公章存放情况</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			function refresh(){

//				document.getElementById("sheadId").value = <%=sheadId%>;
//				document.myform.sheadId.value='<%=sheadId%>';
				document.forms[0].sheadId.value ='<%=sheadId%>';

				$("#myform").attr("action","<%=basePath%>stgl/outStorageBody_addBody.do");
				$("#myform").submit();

			}
			
			function onload(){
//				document.myform.sheadId.value = <%=sheadId%>;
			}
			
		function save(){
			$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
	    	$("#myform").submit();
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		});
		
		function vewDisabled(){
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			   var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}				
			}	
		}	
		</script>
	</head>
	<base target="_self"/>
<body onload="vewDisabled();">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="myform">
<s:hidden name="sf.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<s:hidden name="sf.leixing" id="leixing"></s:hidden>
<s:hidden name="sf.stnzcfl" id="stnzcfl" value="16"></s:hidden>
<table id="filter_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            
            <tr>
              <td class="td_form01">存放内容：</td>
              <td class="td_form02"><s:textfield name="sf.acfnr" id="acfnr" /></td>
              <td class="td_form01">&nbsp;</td>
              <td class="td_form02">&nbsp;</td>
            </tr>	 
            <tr>
              <td class="td_form01">保管机构：</td>
              <td class="td_form02"><s:textfield name="sf.abgjg" id="abgjg" /></td>
              <td class="td_form01">存放地点：</td>
              <td class="td_form02"><s:textfield name="sf.acfdd" id="acfdd" /></td>
            </tr>	
            <tr>
              <td class="td_form01">主要联系人：</td>
              <td class="td_form02"><s:textfield name="sf.azylxr" id="azylxr" /></td>
              <td class="td_form01">联系方式：</td>
              <td class="td_form02"><s:textfield name="sf.alxfs" id="alxfs" /></td>
            </tr>
           
            <tr>
              <td class="td_form02" colspan="4">
              <div align="right">
              <%if(!"1".equals(look)) {%>
			     <input name="sdfg" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
                 <%} %>
              </div>   
			  </td>
            </tr>
</table> 	
</s:form>

	</body>
</html>
