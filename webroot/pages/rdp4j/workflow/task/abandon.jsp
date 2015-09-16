<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户作废事宜列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script>
			if(parent.clearPanelTool!=null)
			parent.clearPanelTool();
		</script>
	</head>
	<body class='body1'>
	<%@ include file="searchform.jsp"%>
		<script type="text/javascript">
			function querystring(){
			var title = document.getElementById("title").value;
				jQuery("#abandon_list").setGridParam({
				url:"<%=basePath%>abandon/userAbandon_queryString.do?subSystem",
				postData:{'taskqueryvo.title': title
				}
				}).trigger("reloadGrid");
			}
		</script>
		<table id="abandon_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
	<script type="text/javascript">
		jQuery("#abandon_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#abandon_list").setGridWidth($("#table1").width());
		});
				jQuery("#abandon_list").jqGrid({				
					url:"<%=basePath%>abandon/userAbandon_queryString.do?subSystem",
					datatype: "json",
					mtype:"POST",
				   	colNames:['序号','url','headId','taskId','作废人','拟稿人','拟稿日期','标题','编号','报废日期','流程名称','报废环节'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'url',index:'headId',editable:true,hidden:true},
				   		{name:'headId',index:'headId',editable:true,hidden:true},
				   		{name:'taskId',index:'taskId',editable:true,hidden:true},
				   		{name:'userId',align:'center',width:'100px',index:'userId',editable:true},
				   		{name:'draftUserId',align:'center',width:'100px',index:'draftUserId',editable:true},
				   		{name:'draftDate',align:'center',width:'80px',index:'yg',editable:true},
				   		{name:'title',index:'bg',width:'400px',editable:true},
				   		{name:'sheetId',align:'center',width:'60px',index:'sheetId',editable:true},
				   		{name:'abandonDate',align:'center',width:'80px',index:'abandonDate',editable:true},
				   		{name:'headType',align:'center',width:'120px',index:'headType',editable:true},
				   		{name:'taskName',align:'center',width:'80px',index:'taskName',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:15,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					rowList:[15,30,45],
					caption: '作废事宜',
					forceFit : true,
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					gridComplete: function(gr){
							var ids = $("#abandon_list").getDataIDs();
							for(var i=0;i<ids.length;i++){
								var gr=ids[i];
								var id= jQuery("#abandon_list").getCell(gr,'id');
								var url= jQuery("#abandon_list").getCell(gr,'url');
								var headId = jQuery("#abandon_list").getCell(gr,'headId');
								var taskId= jQuery("#abandon_list").getCell(gr,'taskId');
								var title= jQuery("#abandon_list").getCell(gr,'title');
								var sheetId = jQuery("#abandon_list").getCell(gr,'sheetId');
									if(sheetId==''){
										jQuery("#abandon_list").jqGrid('setRowData',ids[i],{sheetId:'无'});
									}
							url=url+"?taskId="+taskId+"&id="+id;
								be = "<a  href='"+url+"' target='_self'>"+title+"</a>"; 
								jQuery("#abandon_list").jqGrid('setRowData',ids[i],{title:be});
	                		}
          	  		}
				});
				function show(gr){
						var url= jQuery("#abandon_list").getCell(gr,'url');
						var headId = jQuery("#abandon_list").getCell(gr,'headId');
						var taskId= jQuery("#abandon_list").getCell(gr,'taskId');
						url='<%=basePath%>'+url+"?taskId="+taskId+"&headId="+headId;
						window.open(url,'_self');
				}
</script>
</body>
</html>