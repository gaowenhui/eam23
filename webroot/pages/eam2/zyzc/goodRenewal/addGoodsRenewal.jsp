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
				$("#renewal_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#renewal_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				addButtons(jQuery("#gview_renewal_list > .ui-jqgrid-titlebar"),buttonJSonString);
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
				jQuery("#renewal_list").setGridParam({
				url:"<%=basePath%>zyzc/ZCQuery_queryForZCBodyListAndPager.do",
				postData:{
					'queryPurVo.yjflbm' : $("#yjflbm").val(),
					'queryPurVo.ejflbm' : $("#ejflbm").val(),
					'queryPurVo.sjflbm' : $("#sjflbm").val(),
					'queryPurVo.zcmc' 	: $("#zcmc").val(), 
					'queryPurVo.gg' 	: $("#gg").val()
				}}).trigger("reloadGrid");
				return false;
			}
			
			function ok(){
				var gr = jQuery("#renewal_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					confirm("请选择要添加的资产");
				}else {
					window.opener.myform.delBodyIds.value=gr;
					window.opener.saveZcListToBody();
					window.close();
				}
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
							headerKey="0" headerValue="---请选择---" value="%{#request.queryPurVo.yjflbm}" onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.ejflbm" id="ejflbm" list="%{#session.ejMap}"
							headerKey="0" headerValue="---请选择---" value="%{#request.queryPurVo.ejflbm}" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" id="sjflbm" list="%{#session.sjMap}"
							headerKey="0" headerValue="---请选择---" value="%{#request.queryPurVo.sjflbm}"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<input type="text" class="input" name="queryPurVo.zcmc" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">品牌/规格型号：</td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.gg" id="gg"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_form01" colspan="6">
						<input type="button" value="查询" class="buttonface" onclick="query();">
					</td>
				</tr>
			</table>
			<table id="renewal_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
				jQuery("#renewal_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['zcId','一级分类','二级分类','三级分类',
							  '资产名称','资产编号','品牌/规格型号','数量','单位','资产状态'],
					colModel:[
						{name:'zcId',index:'zcId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'zcmc',index:'zcmc'},
						{name:'zcbh',index:'zcbh'},
						{name:'gg',index:'gg'},
						{name:'sl',index:'sl'},
						{name:'jldw',index:'jldw'},
						{name:'zczt',index:'zczt'}
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
					caption: "续保物品清单 ",
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