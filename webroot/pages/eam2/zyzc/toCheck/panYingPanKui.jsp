<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>盘盈盘亏</title>
		<script type="text/javascript">
			$(function(){
				$("#batModlist").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#batModlist").setGridWidth($("#gridTable").width());
				});
				
				$("#zzpdrq,#zwpdrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				var buttonJSonString = '[{"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_batModlist > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			function query(){
				/**
				var zzpdrq = $("#zzpdrq").val();
				var zwpdrq = $("#zwpdrq").val();
				if(checkDataValidate(zzpdrq,zwpdrq) == true){
				//{"buttonHandler":"modify","buttonIcon":"icon-edit","buttonText":"修改"},\
				//{"buttonHandler":"batMod","buttonIcon":"icon-reload","buttonText":"批量修改"}\
				*/
					jQuery("#batModlist").setGridParam({
						postData:{
							"pdxxVo.pdpc"		:	$("#pdpc").val(),
							"pdxxVo.zzpdrq"		:	$("#zzpdrq").val(),
							"pdxxVo.zwpdrq"		:	$("#zwpdrq").val(),
							"pdxxVo.type"		:	"panYingPanKui"
						}
					}).trigger("reloadGrid");
				/**}*/
			}
			
			//盘盈的情况
			function panYing(){
				window.open('<%=request.getContextPath()%>/zyzc/ToCheck_panYing.do?sheettype=panYing',
						'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			}
			
			function modify(){
				var gr=jQuery("#batModlist").jqGrid('getGridParam','selarrrow');
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr.length == 1 ){
					var bodyId = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ToCheck_modify.do?bodyId='+bodyId,
						'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			function batMod(){
				var gr=jQuery("#batModlist").jqGrid('getGridParam','selarrrow');
				if(gr.length <= 1){
					alert('最少要选择两条需要修改的记录！');
				}else if( gr.length > 1 ){
					var modIds = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ToCheck_modify.do?modIds='+modIds,
						'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			function ok(){
				$.post("<%=request.getContextPath()%>/zyzc/ToCheck_generZcAndTz.do",
					{"pdpc"	:	$("#pdpc").val()},
					function(result){
						if(result != "ok"){
							alert("生成台账和资产出错！");	
						}else{
							alert("生成台账和资产成功！")
							window.location.reload();
						}
					}
				);
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
			}
			*/
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform" id="myform">
			<table id='gridTable' class="newtable" width="100%" border="0"align="center" cellpadding="0" cellspacing="0">
				<tr>
					<!-- <td class="td_zxy01">选择日期：</td>
					<td class="td_zxy02">
					  <s:textfield name="pdxxVo.zzpdrq" readonly="true" id="zzpdrq"/>&nbsp;至：<s:textfield name="pdxxVo.zwpdrq" readonly="true" id="zwpdrq"/>
					</td> -->
					<td class="td_zxy01">选择批次：</td>
					<td class="td_zxy02">
						<s:select name="pdxxVo.pdpc" id="pdpc" headerKey="0" headerValue="--请选择--" list="%{#request.pdpcMap}"/>
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

			<table id="batModlist"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			jQuery("#batModlist").jqGrid({
				url:"<%=basePath %>zyzc/ToCheck_query.do",
				datatype:"json",
				mtype:"POST",
			   	colNames:['id','sheadId','一级分类','二级分类','三级分类',
						  '资产名称','品牌/规格型号','资产编号',
						  '使用人','使用部门','存放地点','数量','盘点数量','单位','盘点结果'],
				 	colModel:[
					{name:'id',index:'id',hidden:true},
					{name:'sheadId',index:'sheadId',hidden:true},
					{name:'yjflmc',index:'yjflmc'},
				    {name:'ejflmc', index:'ejflmc'}, 
				    {name:'sjflmc', index:'sjflmc'},
					{name:'zcmc', index:'zcmc'},
					{name:'gg',index:'gg'}, 
					{name:'zcbh', index:'zcbh'},
					{name:'syrmc', index:'syrmc'},
			 		{name:'sybmbmc',index:'sybmbmc'},
			 		{name:'cfdd',index:'cfdd'},
					{name:'sl', index:'sl'}, 
					{name:'pdsl', index:'pdsl'}, 
				    {name:'jldw', index:'jldw'},
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
				caption:"盘盈盘亏",
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