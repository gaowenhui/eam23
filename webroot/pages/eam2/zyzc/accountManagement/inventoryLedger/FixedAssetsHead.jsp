<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>库存台账</title>
		<script type="text/javascript">
			$(function(){
				$("#stocks_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#stocks_list").setGridWidth($("#gridTable").width());
				});
				
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonJSonString = '[{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
										 {"buttonHandler":"exportExcelFixed","buttonIcon":"icon-redo","buttonText":"导出"}\
				]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_stocks_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			function exportExcelFixed(){
				var dataIdArr = jQuery("#stocks_list").getDataIDs();
				if(dataIdArr.length == 0){
					alert("没有可以导出的资产！");
				}else if(dataIdArr.length > 0){
					 var urlStr = "com.tansun.eam2.zyzc.action.ZCBookQueryAction&com.tansun.eam2.zyzc.vo.QueryPurchaseVo";
				     //var urlStr = jQuery("#stocks_list").getGridParam('url');
				     var ghlx = "inventoryFixedAsset";
				     var param = "{\"queryPurVo.yjflbm\":\"" + $("#yjflbm").val() + "\",";
						param += "\"queryPurVo.ejflbm\":\"" + $("#ejflbm").val() + "\",";
						param += "\"queryPurVo.sjflbm\":\"" + $("#sjflbm").val() + "\",";
						param += "\"queryPurVo.zcmc\":\"" + $("#zcmc").val() + "\",";
						param += "\"queryPurVo.gg\":\"" + $("#gg").val() + "\",";
						param += "\"queryPurVo.zdjg\":\"" + $("#zdjg").val() + "\",";
						param += "\"queryPurVo.zgjg\":\"" + $("#zgjg").val() + "\",";
						param += "\"queryPurVo.tzlx\":\"" + $("#tzlx").val() + "\",";
						param += "\"queryPurVo.zclx\":\"" + $("#zclx").val() + "\",";
						param += "\"queryPurVo.ghlx\":\"" + ghlx + "\",";
						param += "\"paginator.currentPage\":\"" + 1 + "\",";
						param += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
	                 exportExcel("stocks_list", urlStr, param, '库存台账','rn,cb,zcid');
	            }
			}
			
			function refresh(){
				$("#myform").attr("action","<%=request.getContextPath()%>/zyzc/ZCBookQuery_queryBySelectCondition.do?zctzlx=kcgdzc");
				$("#myform").submit();
			}
			
			function addBook(){
				window.open('<%=basePath%>zyzc/ZCBookManage_addBody.do',
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				
			}
			
			function modifyRecord(){
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要修改的记录!");
				}else if(gr.length > 1){
					alert("一次只能修改一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCBookManage_modifyRecord.do',
					'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheettype").val()+"_view",
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
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
				var url1 = "<%=basePath %>zyzc/ZCBookQuery_queryKCTZ.do";
				jQuery("#stocks_list").setGridParam({
						url:url1,
						postData:{
							"queryPurVo.yjflbm"		:	$("#yjflbm").val(),
							"queryPurVo.ejflbm"		:	$("#ejflbm").val(),
							"queryPurVo.sjflbm"		:	$("#sjflbm").val(),
							"queryPurVo.zcmc"		:	$("#zcmc").val(),
							"queryPurVo.gg"			:	$("#gg").val(),
							"queryPurVo.zdjg"		:	$("#zdjg").val(),
							"queryPurVo.zgjg"		:	$("#zgjg").val(),
							"queryPurVo.tzlx"		:	$("#tzlx").val(),
							"queryPurVo.zclx"		:	$("#zclx").val()
						}
					}).trigger("reloadGrid");
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform" id="myform">
			<s:hidden name="queryPurVo.tzlx" id="tzlx" value="kctz"></s:hidden>
			<s:hidden name="queryPurVo.zclx" id="zclx" value="gdzc"></s:hidden>
			<s:hidden name="sheettype" id="sheettype" value="zcBook_kctz"></s:hidden>
			<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0"align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类：</td>
					<td class="td_zxy02">
						<s:select  name="queryPurVo.yjflbm" id="yjflbm" headerKey="0" 
						headerValue="--请选择--" list="%{#session.yjMap}" onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">二级分类：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.ejflbm" id="ejflbm" headerKey="0" 
						headerValue="--请选择--"  list="%{#session.ejMap}" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类： </td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" headerKey="0" 
						headerValue="--请选择--"  list="%{#session.sjMap}" id="sjflbm"/>
					</td>
					<td class="td_zxy01"> 资产名称： </td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.zcmc" cssClass="input" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">品牌/规格型号：</td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.gg" cssClass="input" id="gg"/>
					</td>
					<td class="td_zxy01">金额 从：</td>
					<td class="td_zxy02" nowrap="nowrap">
						<s:textfield name="queryPurVo.zdjg" id="zdjg"/>
						&nbsp;至：
						<s:textfield name="queryPurVo.zgjg" id="zgjg"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" style="text-align:right">
						<input type="button" value="查询" class="buttonface" onclick="query();"/>
						<input type="reset" value="重置" class="buttonface"/>
					</td>
				</tr>	
			</table>
			<table id="stocks_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			//去除了 金额  ,'金额' + {name:'je',index:'je'}
			jQuery("#stocks_list").jqGrid({
				datatype:"json",
			   	colNames:['id','一级分类','二级分类','三级分类','资产名称','资产编号',
			   			  '品牌/规格型号','数量','单位','单价'],
			   	colModel:[
			   		{name:'zcId',index:'zcId',hidden:true},
					{name:'yjflmc',index:'yjflmc'},
			   		{name:'ejflmc',index:'ejflmc'},
			   		{name:'sjflmc',index:'sjflmc'},
			   		{name:'zcmc',index:'zcmc'},
			   		{name:'zcbh',index:'zcbh'},
			   		{name:'gg',index:'gg'},
			   		{name:'sl',index:'sl',align:"center"},
			   		{name:'jldw',index:'jldw',align:"center"},
			   		{name:'dj',index:'dj'},
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
				caption:"自用资产库存台账",
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