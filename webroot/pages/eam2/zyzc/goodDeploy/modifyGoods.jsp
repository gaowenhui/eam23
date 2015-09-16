<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String displayOrNot = (String)request.getParameter("displayOrNot");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>物品维修属性信息修改</title>
		<script type="text/javascript">
			$(function(){
				if($("#bodyIds").val() == null || $("#bodyIds").val() == ""){
					$("#myform").attr("action","<%=basePath%>zyzc/ZCManageBody_updateBody.do");
				}else{
					$("#myform").attr("action","<%=basePath%>zyzc/ZCManageBody_batUpdateBody.do");
				}
				
				if($("#saveSuccess").val() == "saveSuccess"){
					window.opener.refreshGrid();
					window.close();
				}
				
				$("#cbrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				if("<%=displayOrNot%>" == "No"){
					$("#bxfws,#cbrq,#wxfy").attr("disabled","true");
				}
				
			});
		
			function refresh(data){
				if(data==1){
					document.getElementById("ejflbm").value="";
				}
				myform.action="<%=request.getContextPath()%>/zyzc/ZCManageBody_findFl.do";
				myform.submit();
			}
			
			function saveBody(){
				if("<%=displayOrNot%>" == "Yes"){
					if(valueValidate()){
						document.myform.submit();
					}
				}else{
					document.myform.submit();
				}
			}
			
			function valueValidate(){
				var bxfws = $("#bxfws").val();
				var cbrq = $("#cbrq").val();
				var wxfy = $("#wxfy").val();
				if(bxfws == ""){
					alert("保修服务商不能为空！");
					return false;
				}else if(cbrq == ""){
					alert("维修后的保修期不能为空！");
					return false;
				}else if(wxfy == ""){
					alert("物品的维修费用不能为空！");
					return false;
				}
				return true;
			}
		</script>
	</head>

	<body>
		<s:form action="zyzc/ZCManageBody_updateBody.do" name="myform" id="myform">
			<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
			<s:hidden name="head.sheetType"></s:hidden>
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<s:hidden name="bodyIds" id="bodyIds"/>
			<s:hidden name="body.sbodyId" id="bodyId"/>
			<s:hidden name="saveSuccess" id="saveSuccess"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="body.yjflbm" list="%{#session.yjMap}" id="yjflbm"
						 value="%{#request.body.yjflbm}" onchange="refresh(1)" disabled="true"/>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="body.ejflbm" list="%{#session.ejMap}"id="ejflbm"
						 value="%{#request.body.ejflbm}" onchange="refresh(2)" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="body.sjflbm" list="%{#session.sjMap}" id="sjflbm"
							value="%{#request.body.sjflbm}" disabled="true"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.zcmc" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">规 格：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gg" disabled="true"/>
					</td>
					<td class="td_zxy01">单 价：</td>
					<td class="td_zxy02">
						<s:textfield name="body.dj" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">供 应 商：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gys" disabled="true"/>
					</td>
					<td class="td_zxy01">
						保修服务商：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.bxfws" id='bxfws'/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						维修后的保修期：
					</td>
					<td class="td_zxy02">
						<s:date name="body.cbrq" var="cbrq" format="yyyy-MM-dd"/>
						<s:textfield name="body.cbrq" id="cbrq" value="%{#cbrq}"/>
					</td>
					<td class="td_zxy01">
						维修费用：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.wxfy" id='wxfy' disabled=""/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" class="td_zxy01" style="text-align:right">
						<input type="button" value="提交" onclick="saveBody()" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>