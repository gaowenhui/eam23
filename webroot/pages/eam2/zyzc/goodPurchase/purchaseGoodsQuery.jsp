<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title>采购物品查询</title>
		<script type="text/javascript">
			$(function(){
				$("#renewal_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#renewal_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"exportPurchaseExcel","buttonIcon":"icon-redo","buttonText":"导出"}]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_renewal_list > .ui-jqgrid-titlebar"),buttonJSonString);
				
				$("#zzcgrq,#zwcgrq").datebox({
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
				var zzcgrq = $("#zzcgrq").val();
				var zwcgrq = $("#zwcgrq").val();
				if(checkDataValidate(zzcgrq,zwcgrq) == true){
					jQuery("#renewal_list").setGridParam({
					url:"<%=basePath%>zyzc/ZCQuery_queryForPurchaseGoods.do",
					postData:{
						'queryPurVo.yjflbm' 	: $("#yjflbm").val(),
						'queryPurVo.ejflbm' 	: $("#ejflbm").val(),
						'queryPurVo.sjflbm' 	: $("#sjflbm").val(),
						'queryPurVo.zcmc' 	: $("#zcmc").val(), 
						'queryPurVo.gg' 		: $("#gg").val(),
						"queryPurVo.zzcgrq"	: $("#zzcgrq").val(),
						"queryPurVo.zwcgrq"	: $("#zwcgrq").val()
					}}).trigger("reloadGrid");
					return false;
				}
			}
			
			function exportPurchaseExcel(){
				 var dataIdArr = jQuery("#renewal_list").getDataIDs();
				 if(dataIdArr.length == 0){
				 	alert("没有可以导出的资产！");
				 }else if(dataIdArr.length > 0){
				    // var urlStr = jQuery("#renewal_list").getGridParam('url');
			         var urlStr = "com.tansun.eam2.zyzc.action.ZCQueryAction&com.tansun.eam2.zyzc.vo.QueryPurchaseVo";
			         var ghlx = "purchaseGoodExcelExport";
				     var param = "{\"queryPurVo.yjflbm\":\"" + $("#yjflbm").val() + "\",";
						param += "\"queryPurVo.ejflbm\":\"" + $("#ejflbm").val() + "\",";
						param += "\"queryPurVo.sjflbm\":\"" + $("#sjflbm").val() + "\",";
						param += "\"queryPurVo.zcmc\":\"" + $("#zcmc").val() + "\",";
						param += "\"queryPurVo.zzcgrq\":\"" + $("#zzcgrq").val() + "\",";
						param += "\"queryPurVo.zwcgrq\":\"" + $("#zwcgrq").val() + "\",";
						param += "\"queryPurVo.gg\":\"" + $("#gg").val() +  "\",";
						param += "\"queryPurVo.ghlx\":\"" + ghlx +  "\",";
						param += "\"paginator.currentPage\":\"" + 1 + "\",";
						param += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
	                 exportExcel("renewal_list", urlStr, param, '采购物品','rn,cb,zcid');
				 }
			}
			
			function checkDataValidate(startDate, endDate){
				if(startDate.length > 0 && endDate.length > 0){
					if(isDate(startDate) > isDate(endDate)){
						alert("开始日期应小于结束日期，请重新输入！");
						return false;
					}
					return true;
				}
				return true;
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
						<s:select name="pgqv.yjflbm" id="yjflbm" list="%{#session.yjMap}"
							headerKey="0" headerValue="----请选择----" value="%{#request.pgqv.yjflbm}" onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="pgqv.ejflbm" id="ejflbm" list="%{#session.ejMap}"
							headerKey="0" headerValue="----请选择----" value="%{#request.pgqv.ejflbm}" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="pgqv.sjflbm" id="sjflbm" list="%{#session.sjMap}"
							headerKey="0" headerValue="----请选择----" value="%{#request.pgqv.sjflbm}"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield cssClass="input" name="pgqv.zcmc" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">采购日期：</td>
					<td class="td_zxy02">
						<s:textfield readonly="true" id="zzcgrq" name="pgqv.zzcgrq" />&nbsp;至：<s:textfield  readonly="true" id="zwcgrq" name="pgqv.zwcgrq" />
					</td>
					<td class="td_zxy01">品牌/规格型号：</td>
					<td class="td_zxy02">
						<s:textfield name="pgqv.gg" cssClass="input" id="gg"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" style="text-align:right">
						<input type="button" value="查询" class="buttonface" onclick="query();"/>
						<input type="reset" value="重置" class="buttonface"/>
					</td>
				</tr>
			</table>
			<table id="renewal_list"></table>
			<div id="pgtoolbar" style="display: none"></div>
			<script type="text/javascript">
				jQuery("#renewal_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['sbodyId','一级分类','二级分类','三级分类',
							  '资产名称','品牌/规格型号','数量',
							  '单位','单价','金额'],
					colModel:[
						{name:'sbodyId',index:'sbodyId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'zcmc',index:'zcmc'},
						{name:'gg',index:'gg'},
						{name:'sl',index:'sl'},
						{name:'jldw',index:'jldw'},
						{name:'dj',index:'dj'},
						{name:'je',index:'je'}
					],
					pager:'pgtoolbar',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowNum:1000000,
					rowList:[10,20,30],
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					caption: "采购物品清单 ",
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
		<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>