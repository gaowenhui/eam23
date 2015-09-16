<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String stid = (String)request.getAttribute("stid");
	String zixunType = (String)request.getAttribute("zixunType");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>业务费用信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	$(function(){
		//页面刚加载时，设置表格的宽度
		jQuery("#cost_list").setGridWidth($("#tableWidth").width());
		jQuery("#income_list").setGridWidth($("#tableWidth").width());
		$(window).bind('resize', function(){
			jQuery("#cost_list").setGridWidth($("#tableWidth").width());
			jQuery("#income_list").setGridWidth($("#tableWidth").width());
		});
	});
		
	function exportCostList(){
		var urlStr = '<%=basePath %>stgl/xuanshiti_viewStIncomeCost.do';
		var stid = "<%=stid%>";
		var zixunType = "<%=zixunType%>";
		var params = "{\"stid\":\"" + stid + "\",";
			params += "\"zixunType\":\"" + zixunType + "\"}";
		exportExcel("cost_list", urlStr, params, '实体相关审批费用信息','rn,cb');
		
	}
	</script>
  </head>
  <body>
  <div  width="100%" id="tableWidth">&nbsp;</div>
 <table id="cost_list"></table>
 <br>
 <table id="income_list"></table>
	<script type="text/javascript">
		jQuery("#cost_list").jqGrid({
			url:"<%=basePath%>stgl/xuanshiti_viewStCost.do?stid=<%=stid%>&zixunType=<%=zixunType%>",
			datatype:"json",
			colNames:['bodyId','实体名称','流程名称','申请事项类型','项目名称','费用种类','申请金额（元）','申定金额（元）'],
			colModel:[	
				{name:'bodyId',index:'bodyId',hidden:true},
				{name:'stzwmc',index:'stzwmc' },
				{name:'lcmc',index:'lcmc'},
				{name:'CSqsxlx',index:'CSqsxlx'},
				{name:'sqxmmc',index:'sqxmmc'},
				{name:'fyzl',index:'fyzl'},
				{name:'sqje',index:'sqje'},
				{name:'sdje',index:'sdje'}						
			],	
			multiselect:false,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption:'实体审批费用信息',
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "id"
			}
	});
	
	jQuery("#income_list").jqGrid({
			url:"<%=basePath%>stgl/xuanshiti_viewStIncome.do?stid=<%=stid%>",
			datatype:"json",
			colNames:['实体名称','流程名称','回款性质','回收确认日期','回收金额（元）'],
			colModel:[	
				{name:'gq_stmc',index:'gq_stmc' },
				{name:'lcmc',index:'lcmc'},
				{name:'gq_hkxz',index:'gq_hkxz'},
				{name:'qrrq',index:'qrrq'},
				{name:'gq_hsxjje',index:'gq_hsxjje'}			
			],	
			multiselect:false,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption:'实体收入信息',
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "id"
			}
	});
	</script>
	<%@ include file="/inc/exportExcel.inc"%>
  </body>
</html>
