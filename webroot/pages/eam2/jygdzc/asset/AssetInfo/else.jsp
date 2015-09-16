<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>其他</title>
		<base href="<%=basePath%>" />
		<script type="text/javascript">
	$(function(){
		$("select,input").attr("disabled","disabled");
	});
	function closebody(){
		window.parent.close();
	}
</script>
	</head>
	<body>
		<s:form id="else" method="post">
			<s:hidden name="zcId" value="%{#request.zcId}" />
			<s:hidden name="headId" value="%{#request.headId}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<table width="100%" border="0" cellpadding="2" class="newtable"
				cellspacing="0" align="center">

				<tr>
					<td width="120" class="td_form01">
						设备名称：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxElse.sbmc" id="sbmc" 
							value="%{#request.jyzcXxElse.sbmc}" />
					</td>
					<td width="120" class="td_form01">
						规格型号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxElse.ggxh" id="ggxh" 
							value="%{#request.jyzcXxElse.ggxh}" />
					</td>
					<td width="120" class="td_form01">
						生产厂家：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxElse.sccj" id="sccj" 
							value="%{#request.jyzcXxElse.sccj}" />
					</td>

				</tr>
				<tr>
					<td class="td_form01">
						数量：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxElse.sbsl" id="sbsl" 
							value="%{#request.jyzcXxElse.sbsl}" />
					</td>
					<td class="td_form01">
						计量单位：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxElse.CJldw" id="CJldw" 
							value="%{#request.jyzcXxElse.CJldw}" />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
			</table>
			<s:submit value="关闭" type="button" onclick="closebody();return false;"/>
		</s:form>
	</body>
</html>