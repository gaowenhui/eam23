<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>维修物品查询</title>
		<script type="text/javascript">
			$(function(){
				$("#discard_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#discard_list").setGridWidth($("#gridTable").width());
				});
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonJSonString = '[{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
				]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_discard_list > .ui-jqgrid-titlebar"),buttonJSonString);
				$("#zzbfrq,#zwbfrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
			});
			
			function query(){
				jQuery("#discard_list").setGridParam({
				url:"<%=basePath%>zyzc/ZCQuery_query4GoodDeploy.do",
				postData:{
					'queryPurVo.yjflbm' 	: $("#yjflbm").val(),
					'queryPurVo.ejflbm' 	: $("#ejflbm").val(),
					'queryPurVo.sjflbm' 	: $("#sjflbm").val(),
					'queryPurVo.zcmc' 		: $("#zcmc").val(), 
					'queryPurVo.gg' 		: $("#gg").val()
				}}).trigger("reloadGrid");
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
			
			// excel导出 陈煜霄
			function excel(){
				var dataIdArr = jQuery("#discard_list").getDataIDs();
				if(dataIdArr.length == 0){
					alert("没有可以导出的资产！");
				}else if(dataIdArr.length > 0){
					//var urlStr = jQuery("#discard_list").getGridParam('url');
					var urlStr = "com.tansun.eam2.zyzc.action.ZCQueryAction&com.tansun.eam2.zyzc.vo.QueryPurchaseVo";
					var yjflbm = document.getElementById("yjflbm").value;
					var ejflbm = document.getElementById("ejflbm").value;
					var sjflbm = document.getElementById("sjflbm").value;
					var zcmc = document.getElementById("zcmc").value;
					var gg = document.getElementById("gg").value;
					var ghlx = "goodDeploy";
				    var params = "{\"queryPurVo.yjflbm\":\"" + yjflbm + "\",";
						params += "\"queryPurVo.ejflbm\":\"" + ejflbm + "\",";
						params += "\"queryPurVo.sjflbm\":\"" + sjflbm + "\",";
						params += "\"queryPurVo.zcmc\":\"" + zcmc + "\",";
						params += "\"queryPurVo.gg\":\"" + gg + "\",";
						params += "\"queryPurVo.ghlx\":\"" + ghlx + "\",";
						params += "\"paginator.currentPage\":\"" + 1 + "\",";
						params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
					exportExcel("discard_list", urlStr, params, '资产库存清单','rn,cb');
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
		<s:form  name="myform">
			<s:hidden name="bodyIds" id="bodyIds"></s:hidden>
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.yjflbm" list="%{#session.yjMap}" headerKey="0" id="yjflbm"
							value="%{#request.queryPurVo.yjflbm}" headerValue="--请选择--" onchange="ejflRefresh(this)"></s:select>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.ejflbm" list="%{#session.ejMap}" headerKey="0" id="ejflbm"
							value="%{#request.queryPurVo.ejflbm}" headerValue="--请选择--" onchange="sjflRefresh(this)"></s:select>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" list="%{#session.sjMap}" headerKey="0" id="sjflbm"
							value="%{#request.queryPurVo.sjflbm}" headerValue="--请选择--"></s:select>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<input type="text" class="input" name="queryPurVo.zcmc" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">品牌/规格型号：</td>
					<td class="td_zxy02">
						<s:textfield name="queryPurVo.gg" cssClass="input" id="gg" value="%{#session.queryPurVo.ggxh}"/>
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
			<table id="discard_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
				jQuery("#discard_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['id','一级分类','二级分类','三级分类',
							  '资产名称','品牌/规格型号','资产编号','序列号',
							  '计量单位','单价','金额',
							  '维修费用','维修后的保修期'],
					colModel:[	
						{name:'zcId',index:'zcId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'zcmc',index:'zcmc'},
						{name:'gg',index:'gg'},
						{name:'zcbh',index:'zcbh'},
						{name:'xlh',index:'xlh'},
						{name:'jldw',index:'jldw'},
						{name:'dzyhdj',index:'dzyhdj'},
						{name:'dzyhjg',index:'dzyhjg'},
						{name:'wxfy',index:'wxfy'},
						{name:'cbrq',index:'cbrq'}
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
					caption: "维修物品清单 ",
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