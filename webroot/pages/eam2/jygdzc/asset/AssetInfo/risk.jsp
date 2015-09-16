<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>"/>
<title>风险信息</title>
<script type="text/javascript">
		function reloadGrid(){
			$("#risk_list").trigger("reloadGrid");
		}
		function reloadGridSsXx(){
			$("#ssgl_list").trigger("reloadGrid");
		}
</script>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<table width="100%" border="0" cellspacing="0" id="table" cellpadding="0" align="center">
       <tr>
         <td  align="right">
                <table id="risk_list"> </table>
				<div id="pgtoolbar2"></div>
				<table id="ssgl_list" align="center"></table>
				<div id="pgtoolbar1"></div>
       </td>
     </tr>
</table>
</body>
</html>
<script type="text/javascript">
				jQuery("#risk_list").jqGrid({
					url:"<%=basePath%>fxxx/AssetRisk_query4View.do?zcId=${zcId}&spzt=pass",
					datatype: "json",
					mtype:"POST",
					colNames:['id','风险类型','风险状态','风险描述','风险控制','录入日期','录入人'],
					colModel:[	
						{name:'id',index:'id',hidden:true},
						{name:'CFxlx',index:'CFxlx',width:'60'},
						{name:'fxzt',index:'fxzt',width:'40'},
						{name:'fxms',index:'fxms'},
						{name:'fxkz',index:'fxkz'},
						{name:'lrrq',index:'lrrq',width:'60'},
						{name:'lrr',index:'lrr',width:'40'}								
					],
					rownumbers:true,
					autowidth:true,
					height:'auto',
					pager:'pgtoolbar2',
					viewrecords:true,
					caption:'风险列表',
					rowNum:10,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					rowList:[10,20,30],
					jsonReader:{
						root:"rows",
						page:"page",
						total:"total",
						records:"records",
						repeatitems:false,
						id:"0"
					}
				});
				jQuery("#risk_list").setGridWidth($("#table").width());
				 	  $(window).bind('resize', function(){
						jQuery("#risk_list").setGridWidth($("#table").width());
		       });
</script>
<script type="text/javascript">
				jQuery("#ssgl_list").jqGrid({			
					url:"<%=basePath%>ssgl/lawsuit_queryString.do?spzt=pass&zcId=${zcId}",
					datatype: "json",
					mtype:"POST",
					//所属省份 资产类型 收案日期  被告 第三人  
				   	colNames:['id','序号','省份名称','资产类型','收案日期','原告','被告','第三人','诉讼类型','案件类别'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'ajbh',index:'ajbh',editable:true,hidden:true},
				   		{name:'sfmc',index:'sfid',editable:true},
				   		{name:'sazclbmc',index:'sazclbmc',editable:true},
				   		{name:'sarq',index:'sarq',editable:true},
				   		{name:'yg',index:'yg',editable:true},
				   		{name:'bg',index:'bg',editable:true},
				   		{name:'dsr',index:'dsr',editable:true},
				   		{name:'sslxmc',index:'sslxmc',editable:true},
				   		{name:'ajlbmc',index:'ajlbmc',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				 	rowNum:10,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					rowList:[10,20,30],
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '诉讼信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
				
	
			 jQuery("#ssgl_list").setGridWidth($("#table").width());
		   	 $(window).bind('resize', function(){
					jQuery("#ssgl_list").setGridWidth($("#table").width());
		       });
		       
			
		</script>	