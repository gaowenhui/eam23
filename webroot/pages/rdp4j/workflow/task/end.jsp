<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户办结事宜列表页面</title>
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
				if(title.length>0){
					var tranTitle="";
					var arr = new Array(title.length);
					for(var i=0;i<title.length;i++){
						if(title.charCodeAt(i)>=65&&title.charCodeAt(i)<=97){
							 arr[i]=title.charAt(i).toLowerCase();
						}else{
							arr[i]=title.charAt(i);
						}		
					}
					tranTitle=arr.join("");
				}						
				jQuery("#endtask_list").setGridParam({
				url:"<%=basePath%>end/userEnd_queryString.do?subSystem",
				postData:{'taskqueryvo.title': tranTitle
				}
				}).trigger("reloadGrid");
			}
		</script>


			
		<table id="endtask_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
		<script type="text/javascript">
		
			jQuery("#endtask_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#endtask_list").setGridWidth($("#table1").width());
		});
		
				jQuery("#endtask_list").jqGrid({				
					url:"<%=basePath%>end/userEnd_queryString.do?subSystem",
					datatype: "json",
					mtype:"POST",
				   	colNames:['序号','url','headId','param','办结人','拟稿人','拟稿日期','标题','编号','办结日期','流程名称'],
				   	colModel:[
				   		{name:'id',align:'center',index:'id',editable:true,hidden:true},
				   		{name:'url',align:'center',index:'url',editable:true,hidden:true},
				   		{name:'headId',align:'center',index:'headId',editable:true,hidden:true},
				   		{name:'param',align:'center',index:'param',editable:true,hidden:true},		
				   		{name:'userId',align:'center',width:'120px',align:'center',index:'userId',editable:true,hidden:true},
				   		{name:'draftUserId',align:'center',width:'120px',align:'center',index:'draftUserId',editable:true},
				   		{name:'draftDate',align:'center',width:'100px',index:'draftDate',editable:true},
				   		{name:'title',index:'title',width:'400px',editable:true},
				   		{name:'sheetId',align:'center',width:'60px',index:'sheetId',editable:true},
				   		{name:'createDate',align:'center',width:'100px',index:'createDate',editable:true},
				   		{name:'headType',align:'center',width:'120px',index:'headType',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:15,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '办结事宜',
					rowList:[15,30,45],	
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
							var ids = $("#endtask_list").getDataIDs();
							for(var i=0;i<ids.length;i++){
								var gr=ids[i];
									var id= jQuery("#endtask_list").getCell(gr,'id');
									var url= jQuery("#endtask_list").getCell(gr,'url');
									var headId = jQuery("#endtask_list").getCell(gr,'headId');
									var title = jQuery("#endtask_list").getCell(gr,'title');
									var sheetId = jQuery("#endtask_list").getCell(gr,'sheetId');
									var param = jQuery("#endtask_list").getCell(gr,'param');
									if(sheetId==''){
										jQuery("#endtask_list").jqGrid('setRowData',ids[i],{sheetId:'无'});
									}
									
									
									//url=url+"?id="+id+"&"+param;
								be = "<a  href='"+url+"' target='_self'>"+title+"</a>"; 
								jQuery("#endtask_list").jqGrid('setRowData',ids[i],{title:be});
	                		}
	                			 
          	  		}
/**
					ondblClickRow:function(gr){
							show(gr);
					}
**/
				});
				function show(gr){
						var url= jQuery("#endtask_list").getCell(gr,'url');
						var headId = jQuery("#endtask_list").getCell(gr,'headId');
						url=url+"?headId="+headId;
						window.open(url,'_self');
				}
				
   </script>
		</body>
</html>