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
String loansId = (String)request.getAttribute("loansId");
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>现金</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
		function save(){
			if(checkPageInput()){
				$("input").removeAttr("disabled"); 
				$("textarea").removeAttr("disabled"); 
				$("select").removeAttr("disabled"); 
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
		    	$("#myform").submit();
		    }	
		}
		function checkPageInput(){
			var hzhanghu = document.getElementById("hzhanghu");
			if(hzhanghu.value == null || hzhanghu.value.length == 0){
				alert("账户不能为空！");
				hzhanghu.focus();
		      return false;
		    }
		    return true;
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid("cash");
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		});
		
		function vewDisabled(){
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
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
<s:hidden name="sf.stnzcfl" id="pop" value="6"></s:hidden>
<s:hidden name="sf.cdkzh"></s:hidden>
<table id="cash_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">现金编号(自动生成)： </td>
              <td class="td_zxy02"><s:textfield name="sf.hxjbh" id="hxjbh" disabled="true"/></td>
              <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>账户： </td>
              <td class="td_zxy02"><s:textfield name="sf.hzhanghu" id="hzhanghu" /></td>
            </tr>	
            <tr>
             <td class="td_zxy01">账户名称：</td>
              <td class="td_zxy02"><s:textfield name="sf.hzhmc" id="hzhmc" /></td>
              <td class="td_zxy01">金额(元)：</td>
              <td class="td_zxy02"><s:textfield name="sf.hjine" id="hjine" onblur="checkFloat(this);"/></td>
            </tr>
            <tr>
              <td class="td_zxy02" colspan="4">
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
