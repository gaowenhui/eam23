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
				
				if($("#zczt").val()=="zk"){
					$("#zczt").val("1");
				}else if($("#zczt").val()=="jly"){
					$("#zczt").val("2");
				}
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
					'exvo.yjflbm' : $("#yjflbm").val(),
					'exvo.ejflbm' : $("#ejflbm").val(),
					'exvo.sjflbm' : $("#sjflbm").val(),
					'exvo.syr' : $("#syr").val(), 
					'exvo.sybm' : $("#sybm").val()
				}}).trigger("reloadGrid");
				return false;
			}
			
			function ok(){
				var gr = jQuery("#renewal_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					confirm("请选择要添加的资产");
				}else {
					if($("#sheettype").val() == "goodchange_before"){
						window.opener.saveZcListToBodyBefore(gr);
					}else{
						window.opener.saveZcListToBodyAfter(gr);
					}
					window.close();
				}
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform">
			<s:hidden name="bodyIds" id="bodyIds"></s:hidden>
			<s:hidden name="syzt" id="syzt"></s:hidden>
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<s:hidden name="sheadId" id="sheadId"></s:hidden>
			<s:hidden name="queryPurVo.zczt" id="zczt"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="exvo.yjflbm" id="yjflbm" list="#{1:'计算机类固定资产',5:'非计算机类固定资产',2:'计算机类低值品',9:'非计算机类低值品'}"
							headerKey="0" headerValue="---请选择---" value="%{#request.queryPurVo.yjflbm}" onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="exvo.ejflbm" id="ejflbm" list="%{#session.ejMap}"
							headerKey="0" headerValue="---请选择---" value="%{#request.queryPurVo.ejflbm}" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="exvo.sjflbm" id="sjflbm" list="%{#session.sjMap}"
							headerKey="0" headerValue="---请选择---" value="%{#request.queryPurVo.sjflbm}"/>
					</td>
					<td class="td_zxy01">使用人：</td>
					<td class="td_zxy02"><s:textfield name="exvo.syr" id="syr" size="30" /></td>
				</tr>
				<tr>
					<td class="td_zxy01">使用部门：</td>
					<td class="td_zxy02"><s:textfield name="exvo.sybm" id="sybm" size="30" /></td>
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
					colNames:['zcId','一级分类','二级分类','三级分类','资产编号','序列号','数量','单位','使用部门','使用人'],
					colModel:[
						{name:'zcId',index:'zcId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'zcbh',index:'zcbh'},
						{name:'xlh',index:'xlh'},
						{name:'sl',index:'sl'},
						{name:'jldw',index:'jldw'},
						{name:'sybm',index:'sybm'},
						{name:'syr',index:'syr'}
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
					caption: "物品清单 ",
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