<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String look = (String)request.getAttribute("look");
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>高管人员信息</title>

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
			   		window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
			$("#frzsj,#flzsj").datebox({
				formatter:function(date){
					return formatDate(date);
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
<s:hidden name="sf.stnzcfl" id="pop" value="2"></s:hidden>
<table id="exectives_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_form01">
              <font color="#FF0000"><strong>*</strong></font>
                姓名：</td>
              <td class="td_form02"><s:textfield name="sf.fxingming" id="fxingming" /></td>
              <td class="td_form01">职务：</td>
              <td class="td_form02"><s:textfield name="sf.fcZhiwu" id="fcZhiwu" /></td>
            </tr>	
            <tr>
              <td class="td_form01">聘任时间：</td>
              <td class="td_form02">
              	 <!-- <s:textfield name="sf.frzsj" id="frzsj" readonly="true"/> --> 
	              <s:date name="%{#request.sf.frzsj}" format="yyyy-MM-dd" var="pinrenDate"/>
				  <s:textfield  name="sf.frzsj"  id="frzsj"  value="%{#pinrenDate}"  readonly="true" />
			 </td>
              <td class="td_form01">离职时间：</td>
              <td class="td_form02">
	              <s:date name="%{#request.sf.flzsj}" format="yyyy-MM-dd" var="lizhiDate"/>
				  <s:textfield name="sf.flzsj" id="flzsj"  value="%{#lizhiDate}"  readonly="true" /> 
              </td>
            </tr>
            <tr>
              <td class="td_form02" colspan="4" align="right" align="right">
              <div align="right">
              <%if(!"1".equals(look)){ %>
			     <input name="ddr" type="button" value="确定" onClick="save()"/>
                 <input name="reset" type="reset" value="重置" />
             <%} %>
              </div>
			  </td>
            </tr>
       </table>
</s:form>

	</body>
</html>
