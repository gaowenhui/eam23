<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>续保物品属性更改</title>
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
					 value="%{#request.body.yjflbm}" onchange="refresh(1)" disabled="true" />
				</td>
				<td class="td_zxy01">二级分类名称：</td>
				<td class="td_zxy02">
					<s:select name="body.ejflbm" list="%{#session.ejMap}"id="ejflbm"
					 value="%{#request.body.ejflbm}" onchange="refresh(2)"  disabled="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">三级分类名称：</td>
				<td class="td_zxy02">
					<s:select name="body.sjflbm" list="%{#session.sjMap}" id="sjflbm"
						value="%{#request.body.sjflbm}"  disabled="true"/>
				</td>
				<td class="td_zxy01">资产名称：</td>
				<td class="td_zxy02">
					<s:textfield name="body.zcmc" readonly="true"/>
				</td>
			</tr>
			
			<tr>
				<td class="td_zxy01">资产编号：</td>
				<td class="td_zxy02">
					<s:textfield name="body.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">序 列 号：</td>
				<td class="td_zxy02">
					<s:textfield name="body.xlh" readonly="true"/>
				</td>
			</tr>
			
			<tr>
				<td class="td_zxy01">规 格：</td>
				<td class="td_zxy02">
					<s:textfield name="body.gg" readonly="true"/>
				</td>
				<td class="td_zxy01">供 应 商：</td>
				<td class="td_zxy02">
					<s:textfield name="body.gys" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">保修机构：</td>
				<td class="td_zxy02">
					<s:textfield name="body.bxjg" readonly="true" value="%{#request.body.bxjg}" />
				</td>
				<td class="td_zxy01">出保日期：</td>
				<td class="td_zxy02">
					<s:date name="%{#request.body.cbrq}" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield name="body.cbrq" id="cbrq" readonly="true" value="%{#draftDate}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">单 位：</td>
				<td class="td_zxy02">
						<s:select name="body.jldw" headerValue="" readonly="true" value="%{#request.body.jldw}"
						list="#{'本':'本','包':'包','根':'根','打':'打','件':'件','个':'个',
						'台':'台','车':'车','辆':'辆','令':'令','把':'把','张':'张','支':'支','瓶':'瓶',
						'套':'套','只':'只','盒':'盒','桶':'桶','箱':'箱','块':'块','节':'节',
						'组':'组','50个/包':'50个/包','10个/包':'10个/包'}"/>
				</td>
				<td class="td_zxy01"> 数 量：</td>
				<td class="td_zxy02">
					<s:textfield name="body.sl" readonly="true" value="%{#request.body.sl}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">单 价：</td>
				<td class="td_zxy02">
					<s:textfield label="" name="body.dj" readonly="true" value="%{#request.body.dj}" />
				</td>
				<td class="td_zxy01">金 额：</td>
				<td class="td_zxy02">
					<s:textfield name="body.je" readonly="true" value="%{#request.body.je}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">新出保日期：</td>
				<td class="td_zxy02">
					<s:date name="%{#request.body.xxbrq}" format="yyyy-MM-dd" var="draftDate1"/>
					<s:textfield label="" name="body.xxbrq" readonly="true" value="%{#draftDate1}" />
				</td>
				<td class="td_zxy01">所属账管：</td>
				<td class="td_zxy02">
					<s:textfield name="body.sszg" readonly="true" />
				</td>
			</tr>
		</table>
	</body>
</html>