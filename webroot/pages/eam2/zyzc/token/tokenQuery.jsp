<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title>令牌查询</title>
		<script type="text/javascript">
			$(function(){
				$("#token_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#token_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"exportTokenExcel","buttonIcon":"icon-redo","buttonText":"导出"}]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_token_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			function query(){
				jQuery("#token_list").setGridParam({
				url:"<%=basePath%>zyzc/ZCManageBody_tokenQuery.do",
				postData:{
					'queryPurVo.lph' 	: $("#lph").val(),
					'queryPurVo.lpdlm' : $("#lpdlm").val()
				}}).trigger("reloadGrid");
				return false;
			}
			
			function exportTokenExcel(){
				var dataIdArr = jQuery("#token_list").getDataIDs();
				if(dataIdArr.length == 0){
					alert("没有可以导出的资产！");
				}else if(dataIdArr.length > 0){
					//var urlStr = jQuery("#token_list").getGridParam('url');
					var urlStr = "com.tansun.eam2.zyzc.action.ZCManageBodyAction&com.tansun.eam2.zyzc.vo.QueryPurchaseVo";
					var params = "{\"queryPurVo.lpdlm\":\"" + $("#lpdlm").val() + "\",";
						params += "\"queryPurVo.lph\":\"" + $("#lph").val() + "\",";
						params += "\"paginator.currentPage\":\"" + 1 + "\",";
						params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
					exportExcel("token_list", urlStr, params, '令牌清单','rn,cb');
				}
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform">
			<s:hidden name="bodyIds" id="bodyIds"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">登录名：</td>
					<td class="td_zxy02">
						<s:textfield name="body.lpdlm" id="lpdlm" cssClass="input"/>
					</td>
					<td class="td_zxy01">令牌号：</td>
					<td class="td_zxy02">
						<s:textfield name="body.lph" id="lph" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" style="text-align:right">
						<input type="button" value="查询" class="buttonface" onclick="query();"/>
						<input type="reset" value="重置" class="buttonface"/>
					</td>
				</tr>
			</table>
			<table id="token_list"></table>
			<div id="pgtoolbar" style="display: none"></div>
			<script type="text/javascript">
				jQuery("#token_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['zcId','姓名','登录名','令牌号','权限','使用状态','令牌时限'],
					colModel:[
						{name:'zcId',index:'zcId',hidden:true},
						{name:'lyrmc',index:'lyrmc'},
						{name:'lpdlm',index:'lpdlm'},
						{name:'lph',index:'lph'},
						{name:'lpqx',index:'lpqx'},
						{name:'zczt',index:'zczt'},
						{name:'lpsx',index:'lpsx'}
					],
					pager:'pgtoolbar',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowNum:100000,
					rowList:[10,20,30],
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					caption: "令牌清单",
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