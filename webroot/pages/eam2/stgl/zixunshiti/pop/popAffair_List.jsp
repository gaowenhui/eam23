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
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>实体大事记信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
		function checkPageInput(){
			var gdsjbh = document.getElementById("gdsjbh");
			if(gdsjbh.value == null || gdsjbh.value.length == 0){
				alert("大事编号不能为空！");
				gdsjbh.focus();
		      return false;
		    }
		    return true;
		}		
	
			
		function save(){
	//		if(checkPageInput()){
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
		    	$("#myform").submit();
	//		}
		}
		
		
		$(function(){
			$("#myform").ajaxForm({
			   		success: function(responseText){
			   		window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		$("#gdsfsrq").datebox({
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
<s:hidden name="sf.stnzcfl" id="pop" value="4"></s:hidden>
<table id="greatAffair_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_form01">大事记编号(自动生成)：</td>
              <td class="td_form02"><s:textfield name="sf.gdsjbh" id="gdsjbh" disabled="true"/></td>
              <td class="td_form01">大事发生日期：</td>
              <td class="td_form02">
              	<s:date name="%{#request.sf.gdsfsrq}" format="yyyy-MM-dd" var="dashiDate"/>
				<s:textfield name="sf.gdsfsrq" id="gdsfsrq"  value="%{#dashiDate}" readonly="true" />
				
              </td>
            </tr>	
            <tr>
              <td class="td_form01">事件类型：</td>
              <td class="td_form02">
              <e:select parRefKey="EVENT_TYPE"  list="#{}" name="sf.gcSjlx"  id="gcSjlx"  />
              </td>
              <td class="td_form01">&nbsp;</td>
              <td class="td_form02">&nbsp;</td>
            </tr>
            <tr>
              <td class="td_form01">大事内容：</td>
              <td class="td_form02" colspan="3"><s:textarea name="sf.gdsnr" id="gdsnr" cols="100"/></td>
            </tr>
            <tr>
              <td class="td_form01">备注：</td>
              <td class="td_form02" colspan="3"><s:textarea name="sf.gdsjbz" id="gdsjbz" cols="100"/></td>
            </tr>	
            <tr>
              <td class="td_form02" colspan="4" align="right">
              <div align="right">
              <%if(!"1".equals(look)){ %>
			     <input name="3333" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
             <% }%>
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
