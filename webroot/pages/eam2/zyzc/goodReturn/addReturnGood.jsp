<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title>自用资产查询</title>
		<script type="text/javascript">
			$(function(){
				$("#return_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#return_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				addButtons(jQuery("#gview_return_list > .ui-jqgrid-titlebar"),buttonJSonString);
				
				$("#syrqc,#syrqz").datebox({
					formatter:function(date){
						return formatDate(date);
					}
				});
				
			});
			
			//当一级分类改变时触发此方法，显示出二级分类供选择
			function ejflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_ejflRefresh.do",{
					"zyZc.yjflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.ejfls.length>=1){
						for(var i=0; i<returnObj.ejfls.length; i++){
							$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
				$("#ejflbm").html("<option value='0'>--请选择--</option>");
			}
			
			//当二级分类改变时触发此方法，显示出三级分类供选择（如果有三级分类）
			function sjflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_sjflRefresh.do",{
					"zyZc.ejflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.sjfls.length>=1){
						for(var i=0; i<returnObj.sjfls.length; i++){
							$("#sjflbm").append("<option value='" + returnObj.sjfls[i].sjflbm + "'>" + returnObj.sjfls[i].sjflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
			}
			
			function query(){
				jQuery("#return_list").setGridParam({
				url:"<%=basePath%>zyzc/goodReturn_queryReturn.do",
				postData:{
					'queryPurVo.yjflbm' : $("#yjflbm").val(),
					'queryPurVo.ejflbm' : $("#ejflbm").val(),
					'queryPurVo.sjflbm' : $("#sjflbm").val(),
					'queryPurVo.zcmc' 	: $("#zcmc").val(),
					'queryPurVo.gg' 	: $("#gg").val(),
					'queryPurVo.ghlx' : $("#ghlx").val(),
					'queryPurVo.sybmmc' : $("#sybmmc").val(),
					'queryPurVo.syrmc' : $("#syrmc").val(),
					'queryPurVo.syrqc' 	: $("#syrqc").val(),
					'queryPurVo.syrqz' 	: $("#syrqz").val(),
					'queryPurVo.sytsc' 	: $("#sytsc").val(),
					'queryPurVo.sytsz' 	: $("#sytsz").val()
				}}).trigger("reloadGrid");
				return false;
			}
			
			function ok(){
				var gr = jQuery("#return_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					confirm("请选择要添加的资产");
				}else {
					var ghlx = document.getElementById('ghlx').value;
					window.opener.myform.delBodyIds.value=gr;
					window.opener.saveZcListToBody(ghlx);
					window.close();
				}
			}
			
			//打开树，根据类型打开类型
			function openTreeByType(type4Card){
				var nodeValue = null;
				isSYBMorGLBM = type4Card;
				type4Card = 'department'
				var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card+"&nodeValue="+nodeValue;
				var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
				window.open(url,'',_g_privateDialogFeatures);
			}
			
			function getCallBack4Tree(type4Card,id,value){
				if(type4Card=='department'){
					type4Card = isSYBMorGLBM;
				}
				document.getElementById('sybmmc').value = value;
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform">
			<s:hidden name="bodyIds" id="bodyIds"></s:hidden>
			<s:hidden name="head.sheettype" id="sheettype"></s:hidden>
			<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.yjflbm" id="yjflbm" list="%{#session.yjMap}"
							headerKey="0" headerValue="---请选择---" cssClass="input" value="%{#request.queryPurVo.yjflbm}" onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.ejflbm" id="ejflbm" list="%{#session.ejMap}"
							headerKey="0" headerValue="---请选择---" cssClass="input" value="%{#request.queryPurVo.ejflbm}" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" id="sjflbm" list="%{#session.sjMap}"
							headerKey="0" headerValue="---请选择---" cssClass="input" value="%{#request.queryPurVo.sjflbm}"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<input type="text" class="input" cssClass="input" name="queryPurVo.zcmc" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">品牌/规格型号：</td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.gg" cssClass="input" id="gg"/>
					</td>
					<td class="td_zxy01">归还类型：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.ghlx" id="ghlx" cssClass="input" list="#{'0':'领用物品归还','1':'借用物品归还'}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">借用天数：</td>
					<td class="td_zxy02">
						<input type="text" id="sytsc"/>&nbsp;至：<input type="text" id="sytsz" />
					</td>
					<td class="td_zxy01">领用借用部门：</td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.sybmmc" cssClass="input" id="sybmmc"/>
						<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('lybm');" width="21" height="20" align="absmiddle"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用借用日期从：</td>
					<td class="td_zxy02">
						<input type="text" id="syrqc" />&nbsp;至：<input type="text" id="syrqz" />
					</td>
					<td class="td_zxy01">领用借用人：</td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.syrmc" cssClass="input" id="syrmc" />
					</td>
				</tr>
				<tr>
					<td class="td_form01" colspan="6">
						<input type="button" value="查询" class="buttonface" onclick="query();">
					</td>
				</tr>
			</table>
			<table id="return_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
				//{name:'ejflmc',index:'ejflmc'},
				//{name:'sjflmc',index:'sjflmc'},
				//{name:'sl',index:'sl'},
				//{name:'zczt',index:'zczt'}
				jQuery("#return_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['id','一级分类','资产编号','资产名称','品牌/规格型号','单位','领用借用部门','领用借用人','领用借用日期','领用借用天数'],
					colModel:[
						{name:'zcid',index:'zcid',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'zcbh',index:'zcbh'},
						{name:'zcmc',index:'zcmc'},
						{name:'gg',index:'gg'},
						{name:'jldw',index:'jldw'},
						{name:'sybmmc',index:'sybmmc'},
						{name:'syrmc',index:'syrmc'},
						{name:'syrq',index:'syrq'},
						{name:'syts',index:'syts'},
					],
					pager:'pgtoolbar',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowNum:20,
					rowList:[10,20,30],
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					caption: "归还物品清单 ",
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			</script>
		</s:form>
	</body>
</html>