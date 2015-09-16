<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String stid = (String)request.getAttribute("stid");
	String id = (String)request.getAttribute("id");
	String stockId = (String)request.getAttribute("stockId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加资产</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		$(document).ready(function(){
				//添加按钮
				var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
				addButtons(jQuery("#gview_mutualityFlow_list> .ui-jqgrid-titlebar"),buttonJSonString);
				});
			function lookAss(){
				
				var gr = jQuery("#mutualityFlow_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0 ){
					alert("请选择要查看的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要查看的记录")
				}else{
					window.open('maintain_viewFlow.do?sheadId='+gr+'&look='+1,'',winVar);
				}
			}
	
			function reloadGrid(){
				jQuery("#shareholder_list").setGridParam({
				
				}).trigger("reloadGrid");
		    }
	
	</script>
  </head>
  <body>
    <s:hidden id="id" name="sf.id"></s:hidden>
  	<s:hidden id="stid" name="sf.stid"></s:hidden>
	<div width="100%" id="widthRule_shareholder">&nbsp;</div>
<table id="mutualityFlow_list"> </table>

	<script type="text/javascript">
	
				jQuery("#mutualityFlow_list").jqGrid({
					url:"<%=basePath%>stock/maintain_viewMutualityflow.do",
					postData:{'stockId':'<%=stockId%>'},
					datatype:"json",
					colNames:['id','标题','拟稿人','拟稿部门','拟稿日期','联系电话','表单状态'],
					colModel:[	
						{name:'sheadId',index:'shareHolder',width:'320',hidden:true},
						{name:'title',index:'shareHolder',width:'320'},
						{name:'ngrmc',index:'type',width:'300'},
						{name:'ngbmmc',index:'share_ratio',align:"center",width:'230'},
						{name:'ngrq',index:'date',width:'230'},
						{name:'ldxh',index:'hold_ratio',width:'230'},
						{name:'bdzt',index:'hold_ratio',width:'230'}	
					],
						editurl:"entity-info-alter.html",
						pager:'#pgtoolbar21',
						multiselect:true,
						rownumbers:true,
						autowidth:true,
						height:'auto',
						viewrecords:true,
						prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
						rowList:[10,20,30],
						caption: '流程信息列表',
						toolbar:[false,"top"],
						jsonReader : {
							root:"rows",
							page: "page",
							total: "total",
							records: "records",
							repeatitems: false,
							id: "0"
						}
					});
			
				jQuery("#mutualityFlow_list").setGridWidth($("#widthRule_shareholder").width()); 
				$(window).bind('resize', function() {  
						jQuery("#mutualityFlow_list").setGridWidth($("#widthRule_shareholder").width()); 
				}); 
					
 </script>		
  </body>
</html>
