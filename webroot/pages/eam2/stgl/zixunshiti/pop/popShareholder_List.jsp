<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
String sheadId = request.getParameter("sheadId");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String look = (String)request.getAttribute("look");
String bili = request.getParameter("bili");
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>实体股权结构</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		function checkPageInput(){
			var egdmc = document.getElementById("egdmc");
			if(egdmc.value == null || egdmc.value.length == 0){
				alert("股东名称不能为空！");
				egdmc.focus();
		      return false;
		    }
		     return true;
		}
			function save(){
				alert("目前股权比例之和："+(Number('<%=bili%>') + Number($("input[name='sf.ecgbl']").val()))+"%");
				if(Number('<%=bili%>') + Number($("input[name='sf.ecgbl']").val()) > 100){
					alert("股权比例之和不能大于100%!");
					return false;
				}else{
					if(checkPageInput()){
						$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
				    	$("#myform").submit();
		    		}
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
			   
			$("#ebgrq").datebox({
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
<s:hidden name="sf.stnzcfl" id="leixing" value="3"></s:hidden>
<table id="tableWidth" class="newtable" align="center" width="100%" cellspacing="0" cellpadding="0">
             <tr>
              <td class="td_form01">
            	  <font color="#FF0000"><strong>*</strong></font>  
             	 股东名称： </td>
              <td class="td_form02"><s:textfield name="sf.egdmc" id="egdmc" /></td>
              <td class="td_form01">股东性质：</td>
              <td class="td_form02"><s:textfield name="sf.egdxz" id="egdxz" /></td>
            </tr>	
            <tr>
              <td class="td_form01">持股比例(%)： </td>
              <td class="td_form02"><s:textfield name="sf.ecgbl" id="ecgbl" onblur="checkPresent(this);"/></td>
              <td class="td_form01">报告日期：</td>
              <td class="td_form02">
              	<s:date name="%{#request.sf.ebgrq}" format="yyyy-MM-dd" var="ebgrq" />
				<s:textfield name="sf.ebgrq" id="ebgrq" readonly="true"   value="%{#ebgrq}"  />
              </td>
            </tr>
            <tr>
              <td class="td_form01">持股数量(万股)： </td>
              <td class="td_form02"><s:textfield name="sf.ecgsl" id="ecgsl" onblur="checkNumber(this);"/></td>
              <td class="td_form01">本部是否控股：</td>
              <td class="td_form02"><s:select list="#{'':'请选择',1:'是',0:'否',2:'未知'}" name="sf.ebbsfkg" id="ebbsfkg" value="%{#request.sf.ebbsfkg }"></s:select></td>
            </tr>	
            <tr>
              <td class="td_form02" colspan="4">
              <div align="right">
              <%if(!"1".equals(look)){ %>
			     <input name="sdfg" type="button" value="确定" onClick="save()"/>
                 <input name="reset" type="reset" value="重置" />
            	<%} %>
              </div>   
			  </td>
            </tr>
    </table>
		</s:form>

	</body>
</html>
