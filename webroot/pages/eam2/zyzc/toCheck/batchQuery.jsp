<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>批次查询</title>
		<script type="text/javascript">
			$(function(){
				$("#bat_good_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#bat_good_list").setGridWidth($("#gridTable").width());
				});
				
				$("#zzpdrq,#zwpdrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonJSonString = '[{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_bat_good_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			// excel导出 add by 陈煜霄
			function excel(){
				var dataIdArr = jQuery("#bat_good_list").getDataIDs();
				if(dataIdArr.length == 0){
					alert("没有可以导出的资产！");
				}else if(dataIdArr.length > 0){
					//var urlStr = jQuery("#bat_good_list").getGridParam('url');
					var urlStr = "com.tansun.eam2.zyzc.action.BatchQueryAction&com.tansun.eam2.zyzc.vo.PdxxVO";
					var pdpc = document.getElementById("pdpc").value;
			 		var params = "{\"pdxxVo.pdpc\":\"" + pdpc + "\",";
			 			params += "\"pdxxVo.type\":\"" + "batchQuery" + "\",";
			 			params += "\"paginator.currentPage\":\"" + 1 + "\",";
						params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
					exportExcel("bat_good_list", urlStr, params, '本次盘点盘库物品清单','rn,cb');
				}
			}
			
			function query(){
				/**
				var zzpdrq = $("#zzpdrq").val();
				var zwpdrq = $("#zwpdrq").val();
				if(checkDataValidate(zzpdrq,zwpdrq) == true){
					jQuery("#bat_good_list").setGridParam({
							postData:{
								"pdxxVo.pdpc"		:	$("#pdpc").val(),
								"pdxxVo.zzpdrq"		:	$("#zzpdrq").val(),
								"pdxxVo.zwpdrq"		:	$("#zwpdrq").val()
							}
					}).trigger("reloadGrid");
				}
				*/
				
				jQuery("#bat_good_list").setGridParam({
						postData:{
							"pdxxVo.pdpc"		:	$("#pdpc").val(),
							"pdxxVo.zzpdrq"		:	$("#zzpdrq").val(),
							"pdxxVo.zwpdrq"		:	$("#zwpdrq").val(),
							"pdxxVo.type"		:	"batchQuery"
						}
				}).trigger("reloadGrid");
			}
			
			//日期验证
			/**
			function checkDataValidate(startDate, endDate){
				if(startDate.length > 0 && endDate.length > 0){
					if(isDate(startDate) > isDate(endDate)){
						alert("开始日期应小于结束日期，请重新输入！");
						return false;
					}
					return true;
				}
				return true;
			}*/
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform" id="myform">
			<table id='gridTable' class="newtable" width="100%" border="0"align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">选择批次：</td>
					<td class="td_zxy02">
						<s:select name="pdxxVo.pdpc" id="pdpc" headerKey="0" headerValue="--请选择--" list="%{#request.pdpcMap}"/>
					</td>
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
			<table id="bat_good_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			jQuery("#bat_good_list").jqGrid({
				url:"<%=basePath %>zyzc/BatchQuery_query.do",
				datatype:"json",
				mtype:"POST",
			   	colNames:['id','一级分类','二级分类','三级分类',
			   			  '批次','资产名称','品牌/规格型号','资产编号',
			   			  '存放地点','使用人','使用部门','单位','数量','盘点数量','盘点结果'],
			   	colModel:[
			   		{name:'id',index:'id',hidden:false},
					{name:'yjflmc',index:'yjflmc'},
			   		{name:'ejflmc',index:'ejflmc'},
			   		{name:'sjflmc',index:'sjflmc'},
			   		{name:'pdpc',index:'pdpc'},
			   		{name:'zcmc',index:'zcmc'},
			   		{name:'gg',index:'gg'},
			   		{name:'zcbh',index:'zcbh'},
					{name:'cfdd',index:'cfdd'},
			   		{name:'syrmc',index:'syrmc',align:"center"},
					{name:'sybmbmc',index:'sybmbmc',align:"center"},
			   		{name:'jldw',index:'jldw',align:'center'},
			   		{name:'sl',index:'sl'},
			   		{name:'pdsl',index:'pdsl'},
					{name:'pdjg',index:'pdjg'}
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
				caption:"本次盘点/盘库物品清单",
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