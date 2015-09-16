<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc"%>

<%
boolean isdisable = false;
isdisable = "true".equals((String) request
		.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>交通工具</title>
		<base href="<%=basePath%>" />
		<script type="text/javascript">
$(function(){
	if("true"=="<%=isdisable%>"){
			$("select,input").attr("disabled","disabled");
	 }
    $("#gzrq,#qyrq").datebox({
		formatter:function(date){
		return formatDate(date);
	}
    });
    if('<%=request.getAttribute("message")%>' != "null") {
			alert("<%=request.getAttribute("message")%>！"); 
	}
});
	function savebody(){
		vehicle.action="<%=basePath%>jygdzc/AssetManageBody_saveBody.do";
		vehicle.submit();
		window.parent.opener.reloadGrid();
	}
	function closebody(){
		window.parent.close();
	}
</script>
	</head>
	<body>
		<s:form id="vehicle" method="post">
			<s:hidden name="zcId" value="%{#request.zcId}" />
			<s:hidden name="headId" value="%{#request.headId}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<s:hidden name="sheettype2" value="%{#request.sheettype2}" />
			<table width="100%" border="0" class="newtable" cellpadding="2"
				cellspacing="0" align="center">
				<tr>
					<td width="120" class="td_form01">
						车辆牌号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxVehicle.clph" id="clph" 
							value="%{#request.jyzcXxVehicle.clph}" />
					</td>
					<td width="120" class="td_form01">
						车辆行驶证所有人：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxVehicle.clxszsyr" id="clxszsyr"
							 value="%{#request.jyzcXxVehicle.clxszsyr}" />
					</td>
					<td width="120" class="td_form01">
						车辆名称及型号规格：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxVehicle.clmcjggxh" id="clmcjggxh"
							 value="%{#request.jyzcXxVehicle.clmcjggxh}" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						购置日期：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxVehicle.gzrq" id="gzrq" 
							value="%{#request.jyzcXxVehicle.gzrq}" />
					</td>
					<td class="td_form01">
						启用日期：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxVehicle.qyrq" id="qyrq" 
							value="%{#request.jyzcXxVehicle.qyrq}" />
					</td>
					<td class="td_form01">
						已行驶里程：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxVehicle.yxslc" onblur="checkNumber2(this)" id="yxslc"
							 value="%{#request.jyzcXxVehicle.yxslc}" />
					</td>
				</tr>
				<tr>
					<td class="td_form01" colspan="6">
						<input value="保存" type="button" onclick="savebody();return false;" />
						<input value="关闭" type="button" onclick="closebody();return false;"/>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>