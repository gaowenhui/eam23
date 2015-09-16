<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String zcId = (String)request.getAttribute("zcId");
	boolean view = false;
	view = "true".equals((String)request.getAttribute("view"))? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>风险信息</title>
<base href="<%=basePath%>"/>
<script type="text/javascript">
		$(window).bind('unload', function(){
	   			var riskId ="${riskId}";
		   		if(riskId==null||""==riskId||"null"==riskId){
		   			resetFxbh();
		   		}
		});
		$(function(){
			if("true"=="<%=view%>"){
				$("select,input,textarea").attr("disabled","disabled");
				$("#close").attr("disabled",false);
			}
		})
		function resetFxbh(){
			var fxbh = $("#fxbh").val();
			if(""!=fxbh&&fxbh!=null&&"null"!=fxbh){
				$.post("<%=basePath %>fxxx/AssetRisk_regainNum.do",{
					"zcId":"${zcId}",
					"code":fxbh
				},function(str){
					if("成功"!=str){
						alert("风险编号未收回成功");
					}
				})
			}
		}
		$("#myform").ajaxForm({
			beforeSubmit:  checkEAMFormJSMethod,
	 		success:function(){
	 			window.returnValue="ok";
	 			alert("保存成功");
				window.close();
	 		}
	 	});
		function bodyclose(){
		 window.close();
		}
		<!-- 必填项控制  -->
		 function checkEAMFormJSMethod(){
			var fxbh = document.getElementById("fxbh");
			if(fxbh.value == null || fxbh.value.length == 0){
				alert("风险编号不能为空！");
				fxbh.focus();
		      return false;
		    }
			var fxms = document.getElementById("fxms");
			if(fxms.value == null || fxms.value.length == 0){
				alert("风险描述不能为空！");
				fxms.focus();
		      return false;
			}
		    return true;
		}
		
		 //生成编号
	function createBianhao(){
		if(document.getElementById("fxbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath %>fxxx/AssetRisk_createNum.do",{
			"code":"fxbh"
		},function(data){
			document.getElementById("fxbh").value = data;
		});
	}		
	</script>
	
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form action="fxxx/AssetRisk_save.do" method="post" id="myform">
<s:hidden name="jyzcRiskLsb.zcId"  value="%{#request.zcId}"/>
<s:hidden name="headId"  value="%{#request.headId}"/>
<s:hidden name="zcId"   value="%{#request.zcId}"/>
<s:hidden name="riskId"  value="%{#request.riskId}"/>
<s:hidden name="jyzcRiskLsb.id"  value="%{#request.riskId}"/>	
<s:hidden name="jyzcRiskLsb.cldId"  value="%{#request.headId}"/>	
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<s:hidden name="sheettype2" value="%{#request.sheettype2}"/>
 <table width="100%" border="0" class="newtable" cellpadding="2" cellspacing="0" align="center">
  	
	  <tr>
		<!-- <td class="td_zxy01" >资产编号：</td>
		<td class="td_zxy02"><s:textfield name="jyzcRiskLsb.zcbh" id="zcbh" cssClass="input" /></td>
		 -->
		<td class="td_zxy01" >风险类型：</td>
		<td class="td_zxy02" colspan="3">
			<e:select parRefKey="ASSET_RISK_TYPE" list="#{}" name="jyzcRiskLsb.CFxlx" id="CFxlx" />
		</td>
	  </tr>	
	  <tr>
	   <td  class="td_zxy01" ><font color="red">*</font>风险编号：</td>
	    <td class="td_zxy02"><s:textfield name="jyzcRiskLsb.fxbh" id="fxbh" readonly="true"/><input type="button" value="生成编号"   onclick="createBianhao();"/> </td>
	    <td  class="td_zxy01" >风险状态：</td>
	    <td class="td_zxy02" >
	   		 <e:select parRefKey="ASSET_RISK_STATE" list="#{}" name="jyzcRiskLsb.fxzt" id="fxzt"  />
	    </td>
	  </tr>	
	  <tr>
	  <td class="td_zxy01" ><font color="red">*</font>风险描述：</td>
		<td class="td_zxy03" colspan="3"><s:textarea name="jyzcRiskLsb.fxms" cssClass="area" id="fxms" /></td>
	  </tr>
	   <tr>
		<td class="td_zxy01" >风险控制：</td>
		<td class="td_zxy03" colspan="3"><s:textarea name="jyzcRiskLsb.fxkz" cssClass="area" id="fxkz"  /></td>
	  </tr>	
	  <tr>
		<td class="td_zxy01" >录入日期：</td>
		<td class="td_zxy02">
		 <s:date name="%{#request.jyzcRiskLsb.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
		<s:textfield id="lrrq" name="jyzcRiskLsb.lrrq" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
	  	<td class="td_zxy01" >录入人：</td>
		<td class="td_zxy02"><s:textfield name="jyzcRiskLsb.lrr" id="lrr" cssClass="input" readonly="true" /></td>
	  </tr>	
	</table>
	<div align="right">
 	<s:submit value="提交" />
	 <s:submit value="关闭" type="button" id="close" onclick="bodyclose();return false ;"/>
	 </div>
	</s:form>
</body>
</html>
