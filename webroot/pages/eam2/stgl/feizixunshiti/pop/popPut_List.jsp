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

		<title>安置人员</title>

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
			   		window.opener.reloadGrid("put");
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
			}else if('<%=newAdd%>' != 1){
				document.getElementById("fazzt").disabled="true";
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
<s:hidden name="sf.stnzcfl" id="pop" value="15"></s:hidden>
<s:hidden name="sf.fcRylb" id="pop" value="15"></s:hidden>
<table id="anzhiPerson_information" class="newtable" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">
              <font color="#FF0000"><strong>*</strong></font>
            	  姓名：</td>
              <td class="td_zxy02"><s:textfield name="sf.fxingming" id="fxingming" style="width: 60%;"/></td>
              <td class="td_zxy01">移动电话： </td>
              <td class="td_zxy02"><s:textfield name="sf.fyddh" id="fyddh" style="width: 60%;"/></td>
            </tr>	
            <tr>
              <td class="td_zxy01">固定电话：</td>
              <td class="td_zxy02"><s:textfield name="sf.fgddh" id="fgddh" style="width: 60%;"/></td>
              <td class="td_zxy01">安置方式：</td>
              <td class="td_zxy02"><s:textfield name="sf.fazfs" id="fazfs" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">安置费用(元)：</td>
              <td class="td_zxy02"><s:textfield name="sf.fazfy" id="fazfy" style="width: 60%;"  onblur="checkFloat(this);"/></td>
              <td class="td_zxy01">安置状态：</td>
              <td class="td_zxy02"><s:select list="#{0:'未安置',3:'已安置'}" name="sf.fazzt" id="fazzt" value="%{#request.sf.fazzt}"></s:select></td>
            </tr>	 
            <tr>
              <td class="td_zxy01">是否有收条：</td>
              <td class="td_zxy02"><s:select list="#{1:'是',2:'否'}" name="sf.fsfyst" id="fsfyst" value="%{#request.sf.fsfyst}"></s:select></td>
              <td class="td_zxy01">是否有安置协议：</td>
              <td class="td_zxy02"><s:select name="sf.fsfyazxy" id="fsfyazxy" list="#{1:'是',2:'否'}" value="%{#request.sf.fsfyazxy}"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">备注：</td>
              <td class="td_zxy02" colspan="3"><s:textarea name="sf.gdsjbz" id="gdsjbz" rows="3" style="width: 85%;"/></td>
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
