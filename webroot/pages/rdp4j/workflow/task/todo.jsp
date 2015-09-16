<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户待办事宜列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script>
			if(parent.clearPanelTool!=null)
			parent.clearPanelTool();
			
			$(document).ready(function(){
				jQuery("#todo_list").setGridWidth($("#table1").width());
					$(window).bind('resize', function(){
						jQuery("#todo_list").setGridWidth($("#table1").width());
					});
			});
	
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
				jQuery("#todo_list").setGridParam({
				url:"<%=basePath%>workflow/userTask_queryString.do",
				postData:{'taskqueryvo.title': tranTitle
				}
				}).trigger("reloadGrid");
			}
		</script>


		<table id="todo_list" align="center"></table>
		<div id="pgtoolbar1"></div>
		<script type="text/javascript">
				jQuery("#todo_list").jqGrid({				
					url:"<%=basePath%>workflow/userTask_queryString.do",
					datatype: "json",
					mtype:"POST",
				   	colNames:['序号','url','taskId','','状态','isRead','param','拟稿人','拟稿日期','标题','编号','流程名称','环节名称','发送人','已办会签','未办会签','未读会签'],
				   	colModel:[
				   		{name:'id',index:'id',hidden:true},
				   		{name:'taskId',index:'taskId',hidden:true},
				   		{name:'procInstId',index:'procInstId',hidden:true},
				   		{name:'url',index:'url',hidden:true},
				   		{name:'statu',index:'statu',hidden:true},
				   		{name:'isRead',index:'isRead',hidden:true},
				   		{name:'param',index:'param',hidden:true},
				   		{name:'draftUserId',width:'120px',align:'center',index:'draftUserId'},
				   		{name:'draftDate',width:'100px',index:'yg',align:'center'},
				   		{name:'title',width:'400px',index:'title',edittype:'select'},
				   		{name:'sheetId',align:'center',width:'60px',index:'sheetId'},
				   		{name:'headType',align:'center',width:'130px',index:'headType'},
				   		{name:'taskName',align:'center',index:'taskName'},
				   		{name:'sendUserId',width:'120px',align:'center',index:'sendUserId'},
				   		{name:'finishedCounterSignCounr',width:'120px',align:'center',index:'finishedCounterSignCounr',hidden:true},
				   		{name:'unFinishCounterSignCounr',width:'120px',align:'center',index:'unFinishCounterSignCounr',hidden:true},
				   		{name:'hasUnreadCounterSign',width:'120px',align:'center',index:'hasUnreadCounterSign',hidden:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:15,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					rownumbers:true,
					forceFit : true,
					
					height:'auto',
					width:'100%',
					viewrecords:true,
					caption: '待办事宜',
					rowList:[15,30,45],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					 gridComplete: function(gr){
							var ids = $("#todo_list").getDataIDs();
							for(var i=0;i<ids.length;i++){
								var gr=ids[i];
								var isRead = jQuery("#todo_list").getCell(gr,'isRead');
								var url= jQuery("#todo_list").getCell(gr,'url');
								var taskId=jQuery("#todo_list").getCell(gr,'taskId');
								var procInstId = jQuery("#todo_list").getCell(gr,'procInstId');
								var param = jQuery("#todo_list").getCell(gr,'param');
								var finishedCounterSignCounr= jQuery("#todo_list").getCell(gr,'finishedCounterSignCounr');
								var unFinishCounterSignCounr= jQuery("#todo_list").getCell(gr,'unFinishCounterSignCounr');
								var hasUnreadCounterSign= jQuery("#todo_list").getCell(gr,'hasUnreadCounterSign');
								if(hasUnreadCounterSign==''){
								hasUnreadCounterSign=0;
								}
								
								url="<%=basePath%>"+url+"?taskId="+taskId+"&pkId="+procInstId+"&"+param;
								var title=jQuery("#todo_list").getCell(gr,'title');
									var sheetId = jQuery("#todo_list").getCell(gr,'sheetId');
									if(sheetId==''){
										jQuery("#todo_list").jqGrid('setRowData',ids[i],{sheetId:sheetId});
									}
								if(isRead=="1"){
									if(unFinishCounterSignCounr==0&&hasUnreadCounterSign==0){
										be = "<a  href='"+url+"' target='_self'>"+title+"</a>";
									}else{
										be = "<a  href='"+url+"' target='_self'>"+title+"&nbsp;&nbsp; [ 已办( <font color='red'>"+finishedCounterSignCounr+"</font> ) , 未办( <font color='red'>"+unFinishCounterSignCounr+"</font> ) , 未读( <font color='red'>"+hasUnreadCounterSign+"</font> ) ] </a>";
									}
								
								}else{
									if(unFinishCounterSignCounr==0&&hasUnreadCounterSign==0){
										be = "<a  href='"+url+"' target='_self'><font color='red'>"+title+"</font></a>";
									}else{
										be = "<a  href='"+url+"' target='_self'><font color='red'>"+title+"  [ 已办( "+finishedCounterSignCounr+" ) , 未办( "+unFinishCounterSignCounr+" ) , 未读( "+hasUnreadCounterSign+"  ) ]</font></a>";
									}
								}
								jQuery("#todo_list").jqGrid('setRowData',ids[i],{title:be});
	                		}
          	  		}
/**
					ondblClickRow:function(gr){
							show(gr);
					}
**/
				});
				function show(gr){
						var url= jQuery("#todo_list").getCell(gr,'url');
						var taskId=jQuery("#todo_list").getCell(gr,'taskId');
						var procInstId = jQuery("#todo_list").getCell(gr,'procInstId');
						url="<%=basePath%>"+url+"?taskId="+taskId+"&pkId="+procInstId;
						window.open(url,'_self');
				}
   </script>
	</body>
</html>