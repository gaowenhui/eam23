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
String newAdd = (String)request.getAttribute("newAdd");
DebtInfo di = (DebtInfo)request.getAttribute("di");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>债权</title>

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
		
		function checkPageInput(){
			var zwrmc = document.getElementById("zwrmc");
			/*
			
			if(zwrmc.value == null || zwrmc.value.length == 0){
				alert("债务人名称不能为空！");
				zwrmc.focus();
		      return false;
		    }*/
		    return true;
		}
		
			
		function save(){
			if(checkPageInput()){
				if(1 == '<%=newAdd%>' ){
					$("#myform").attr("action","<%=basePath%>stgl/weihu_saveDebtInfo.do?newAdd="+1+'&stid='+'<%=stid%>');
		    	}else{
		    		$("#myform").attr("action","<%=basePath%>stgl/weihu_saveDebtInfo.do?stid="+'<%=stid%>');
		    	}
		    	$("#myform").submit();
			}
		}
		
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid("claims");
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		     
		<%
			if(di!=null&&di.getZqje()!=null&&!"".equals(di.getZqje())){
		%>	
				$("#zqje").val(${di.zqje}.toFixed(2));
		<%	
			}
		%>	
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
<s:hidden name="di.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<s:hidden name="di.leixing" id="leixing"></s:hidden>
<table id="claims_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">
              	债务人名称：</td>
              <td class="td_zxy02"><s:textfield name="di.zwrmc" id="zwrmc" style="width: 60%;"/></td>
              <td class="td_zxy01">合同编号：</td>
              <td class="td_zxy02"><s:textfield name="di.htbh" id="htbh" style="width: 60%;"/></td>
            </tr>	
            <tr>
              <td class="td_zxy01">担保方式：</td>
              <td class="td_zxy02"><s:textfield name="di.dbfs" id="dbfs" style="width: 60%;"/></td>
             <td class="td_zxy01">债权金额(元)：</td>
              <td class="td_zxy02"><s:textfield name="di.zqje" id="zqje" value="%{#request.di.zqje}" style="width: 60%;"/></td>
            </tr>
            <tr>	
              <td class="td_zxy01">诉讼时效：</td>
              <td class="td_zxy02"><s:textfield name="di.sssx" id="sssx" style="width: 60%;"/></td>
             <td class="td_zxy01">是否提起诉讼：</td>
              <td class="td_zxy02"><s:radio list="{'是','否'}" name="di.sfss" id="sfss"></s:radio>
          </td>
            </tr>
             <tr>
              <td class="td_zxy01">债权期限(天)：</td>
              <td class="td_zxy02"><s:textfield name="di.zqqx" id="zqqx" style="width: 60%;"/></td>
             <td class="td_zxy01">抵押财产：</td>
              <td class="td_zxy02"><s:textfield name="di.dyzycc" id="dyzycc" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">保证人等说明：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="di.bzrdsm" id="bzrdsm" rows="3" style="width: 85%;"></s:textarea></td>
            </tr>
             <tr>
              <td class="td_zxy01">债务人情况介绍：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="di.zwrqkjs" id="zwrqkjs" rows="3" style="width: 85%;"></s:textarea></td>
            </tr>
            <tr>
              <td class="td_zxy01">备注：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="di.beizhu" id="beizhu" rows="3" style="width: 85%;"></s:textarea></td>
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
