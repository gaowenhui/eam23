<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>物品属性信息</title>
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
			});
		
			function refresh(data){
				if(data==1){
					document.getElementById("ejflbm").value="";
				}
				myform.action="<%=request.getContextPath()%>/zyzc/ZCManageBody_findFl.do";
				myform.submit();
			}
			
			function saveBody(){
				document.myform.submit();
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
						<s:textfield name="body.yjflmc" id="yjflmc" readonly="true"/>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.ejflmc" id="ejflmc" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.sjflmc" id="sjflmc" readonly="true"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.zcmc" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">规 格：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gg" readonly="true"/>
					</td>
					<td class="td_zxy01">单 价：</td>
					<td class="td_zxy02">
						<s:textfield name="body.dj" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">供 应 商：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gys" readonly="true"/>
					</td>
					<td class="td_zxy01">保修服务商：</td>
					<td class="td_zxy02">
						<s:textfield name="body.bxfws" readonly="true"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">维修后的保修期：</td>
					<td class="td_zxy02">
						<s:date name="body.cbrq" var="cbrq" format="yyyy-MM-dd"/>
						<s:textfield name="body.cbrq" id="cbrq" value="%{#cbrq}" readonly="true"/>
					</td>
					<td class="td_zxy01">维修费用：</td>
					<td class="td_zxy02">
						<s:textfield name="body.wxfy" readonly="true"/>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>