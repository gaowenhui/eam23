<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title> 借用资产查询</title>
		<script type="text/javascript">
			$(function(){
				$("#renewal_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#renewal_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}]';
				window.parent.clearPanelTool();
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
			
			//导出
			function excel(){
				var dataIdArr = jQuery("#renewal_list").getDataIDs();
				if(dataIdArr.length == 0){
					alert("没有可以导出的资产！");
				}else if(dataIdArr.length > 0){
					//var urlStr = jQuery("#renewal_list").getGridParam('url');
					var urlStr = "com.tansun.eam2.zyzc.action.ZCQueryAction&com.tansun.eam2.zyzc.vo.QueryPurchaseVo";
					var yjflbm = document.getElementById("yjflbm").value;
					var ejflbm = document.getElementById("ejflbm").value;
					var sjflbm = document.getElementById("sjflbm").value;
					var sybm = document.getElementById("sybm").value;
					var syr = document.getElementById("syr").value;
					var ghlx = "goodBorrow";
					var zcbh = "borrowQuery";
				    var params = "{\"queryPurVo.yjflbm\":\"" + yjflbm + "\",";
						params += "\"queryPurVo.ejflbm\":\"" + ejflbm + "\",";
						params += "\"queryPurVo.sjflbm\":\"" + sjflbm + "\",";
						params += "\"queryPurVo.sybm\":\"" + sybm + "\",";
						params += "\"queryPurVo.syr\":\"" + syr + "\",";
						params += "\"queryPurVo.ghlx\":\"" + ghlx + "\",";
						params += "\"queryPurVo.zcbh\":\"" + zcbh + "\",";
						params += "\"paginator.currentPage\":\"" + 1 + "\",";
						params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
					exportExcel("renewal_list", urlStr, params, '借用物品清单','rn,cb');
				}
			}
			
			function query(){
				jQuery("#renewal_list").setGridParam({
				url:"<%=basePath%>zyzc/ZCQuery_borrowOrConsumQuery.do?sheettype=borrowQuery",
				postData:{
					'queryPurVo.yjflbm' : $("#yjflbm").val(),
					'queryPurVo.ejflbm' : $("#ejflbm").val(),
					'queryPurVo.sjflbm' : $("#sjflbm").val(),
					'queryPurVo.sybm'	: $("#sybm").val(),
					'queryPurVo.syr'	: $("#syr").val()
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
					<td class="td_zxy01">借用人：</td>
					<td class="td_zxy02"><s:textfield name="queryPurVo.syr" cssClass="input" id="syr"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">借用部门：</td>
					<td class="td_zxy02"><s:textfield name="queryPurVo.sybm" cssClass="input" id="sybm"/></td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" style="text-align:right">
						<input type="button" value="查询" class="buttonface" onclick="query();"/>
						<input type="reset" value="重置" class="buttonface"/>
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
							  '资产编号','借用部门','借用人','数量','单位'],
					colModel:[
						{name:'zcId',index:'zcId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'zcbh',index:'zcbh'},
						{name:'jybmmc',index:'jybmmc'},
						{name:'lyrmc',index:'lyrmc'},
						{name:'cksl',index:'cksl'},
						{name:'jldw',index:'jldw'}
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
					caption: "借用物品清单 ",
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