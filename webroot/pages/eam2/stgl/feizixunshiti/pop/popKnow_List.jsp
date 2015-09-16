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
String pop = request.getParameter("pop");
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>知情人员</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		
		
		function checkPageInput(){
			var fxingming = document.getElementById("fxingming");
			if(fxingming.value == null || fxingming.value.length == 0){
				alert("姓名不能为空！");
				fxingming.focus();
		      return false;
		    }
		    return true;
		}
		
			
		function save(){
			if(checkPageInput()){
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
		    	$("#myform").submit();
			}
		}
		
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid("know");
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
<s:hidden name="sf.stnzcfl" id="pop" value="14"></s:hidden>
<s:hidden name="sf.fcRylb" id="pop" value="14"></s:hidden>
<table id="insider_information" class="newtable" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_form01">
              <font color="#FF0000"><strong>*</strong></font>
              	姓名: </td>
              <td class="td_form02"><s:textfield name="sf.fxingming" id="fxingming" /></td>
              <td class="td_form01">移动电话： </td>
              <td class="td_form02"><s:textfield name="sf.fyddh" id="fyddh" /></td>
            </tr>	
            <tr>
              <td class="td_form01">固定电话：</td>
              <td class="td_form02"><s:textfield name="sf.fgddh" id="fgddh" /></td>
              <td class="td_form01">工作单位：</td>
              <td class="td_form02"><s:textfield name="sf.fgzffdw" id="fgzffdw" /></td>
            </tr>
            <tr>
              <td class="td_form02" colspan="4">
              <div align="right">
              <%if(!"1".equals(look)){ %>
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
