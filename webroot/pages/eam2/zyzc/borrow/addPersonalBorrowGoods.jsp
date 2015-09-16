<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<% 
	String ngbmbh = request.getParameter("ngbmbh");
	String sheettype = request.getParameter("sheettype");
	String grsqdBodyId = request.getParameter("grsqdBodyId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title>增加部门内个人领用物品</title>
		<script type="text/javascript">
			$(function(){
				$("#renewal_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#renewal_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"query","buttonIcon":"icon-search","buttonText":"查询"},\
										 {"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				addButtons(jQuery("#gview_renewal_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			function query(){
				var ngbmbh = "<%=ngbmbh%>";
				var sheettype = "<%=sheettype%>";
				var grsqdBodyId = "<%=grsqdBodyId%>";
				jQuery("#renewal_list").setGridParam({
				url:"<%=basePath%>zyzc/ZCManageBody_displayPersonalConsumingOrBorrow.do",
				postData:{
					'ngbmbh' 		: ""+ngbmbh,
					'grsqdBodyId'	: ""+grsqdBodyId,
					'sheettype'		: ""+sheettype
				}}).trigger("reloadGrid");
			}
			
			function ok(){
				var gr = jQuery("#renewal_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					confirm("请选择要添加的资产");
				}else {
					window.opener.copyPersonalApplyToBody(gr);
					window.close();
				}
			}
        </script>
	</head>
	
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="100%" id="gridTable" style="display:none;">&nbsp;</table>
		<s:form name="myform">
			<table id="renewal_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
				jQuery("#renewal_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['bodyId','一级分类','二级分类','三级分类',
							  '数量','单位','借用人','借用部门','借用日期','备注'],
					colModel:[
						{name:'sbodyId',index:'sbodyId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'sl',index:'sl',align:'center'},
						{name:'jldw',index:'jldw'},
						{name:'sqrmc',index:'sqrmc'},
						{name:'sqbmmc',index:'sqbmmc'},
						{name:'jylyrq',index:'jylyrq'},
						{name:'bz2',index:'bz2'}
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
					caption: "部门内领用物品清单",
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