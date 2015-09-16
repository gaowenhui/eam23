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
String newAdd = (String)request.getAttribute("newAdd");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>税款</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		
		
		function checkPageInput(){
		/*
			var skmc = document.getElementById("skmc");
			if(skmc.value == null || skmc.value.length == 0){
				alert("税款名称不能为空！");
				skmc.focus();
		      return false;
		    }*/
		    return true;
		    
		}
		
		
		function save(){
			if(checkPageInput()){
				if(1 == '<%=newAdd%>' ){
					$("#myform").attr("action","<%=basePath%>stgl/weihu_saveTaxInfo.do?newAdd="+1+'&stid='+'<%=stid%>');
		    	}else{
		    		$("#myform").attr("action","<%=basePath%>stgl/weihu_saveTaxInfo.do?stid="+'<%=stid%>');
		    	}
		    	$("#myform").submit();
			}
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid("tax");
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
<s:form action="" method="post" id="myform">
<s:hidden name="sk.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<table id="taxPayment_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">
              	税款名称：</td>
              <td class="td_zxy02"><s:textfield name="sk.skmc" id="skmc" /></td>
              <td class="td_zxy01">是否按时交纳：</td>
              <td class="td_zxy02"><s:radio list="#{1:'是',0:'否'}" name="sk.sfasjn" id="sfasjn"/></td>
            </tr>	
            <tr>
              <td class="td_zxy01">拖欠税款数额(元)：</td>
              <td class="td_zxy02"><s:textfield name="sk.tqskse" id="tqskse" onblur="checkFloat(this);"/></td>
              <td class="td_zxy01">拖欠时间（天）：</td>
              <td class="td_zxy02"><s:textfield name="sk.tqsj" id="tqsj" /></td>
            </tr>
            <tr>	
              <td class="td_zxy01">税务机关是否可以减免：</td>
              <td class="td_zxy02"><s:radio list="#{1:'是',0:'否'}" name="sk.swjgsfkjm" id="swjgsfkjm"></s:radio></td>
              <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
            </tr>
            
	            <tr>
	              <td class="td_zxy01">备注：</td>
	              <td colspan="3" class="td_zxy02">
	              	<s:textarea name="sk.beizhu" cols="100" rows="3" id="beizhu"></s:textarea>
	              </td>
	            </tr>
             
            <tr>
              <td class="td_zxy02" colspan="4">
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
<SCRIPT LANGUAGE="JavaScript">

 	if('<%=request.getAttribute("msg")%>' !="null"){
		alert('<%=request.getAttribute("msg")%>');
		window.close();
 	}
 
</SCRIPT>
