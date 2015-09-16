<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户已读消息列表页面</title>
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
				jQuery("#read_list").setGridParam({
				url:"<%=basePath%>message/userMessage_queryString_Read.do?subSystem=",
				postData:{'taskqueryvo.title': title
				}
				}).trigger("reloadGrid");
			}
		</script>
			
		<table id="read_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
		<script type="text/javascript">
		
		
			jQuery("#read_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#read_list").setGridWidth($("#table1").width());
		});
				jQuery("#read_list").jqGrid({				
					url:"<%=basePath%>message/userMessage_queryString_Read.do?subSystem=",
					datatype: "json",
					mtype:"POST",
				   	colNames:['id','序号','headId','url','param','发送人','发送日期','信息'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'',index:'',editable:true,hidden:true},
				   		{name:'headId',index:'headId',editable:true,hidden:true},
				   		{name:'url',index:'url',editable:true,hidden:true},
				   		{name:'param',index:'param',editable:true,hidden:true},
				   		{name:'sendUserId',align:'center',width:'80px',index:'sendUserId',editable:true},
				   		{name:'createDate',align:'center',width:'80px',index:'createDate',editable:true},
				   		{name:'message',width:'400px',index:'message',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:15,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '已读消息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					gridComplete: function(gr){
						var ids = $("#read_list").getDataIDs();
						for(var i=0;i<ids.length;i++){
							var gr=ids[i];
							var id = jQuery("#read_list").getCell(gr,'id');
							var url= jQuery("#read_list").getCell(gr,'url');
							var taskId=jQuery("#read_list").getCell(gr,'taskId');
							var headId = jQuery("#read_list").getCell(gr,'headId');
							var param = jQuery("#read_list").getCell(gr,'param');
							var message = jQuery("#read_list").getCell(gr,'message');
							url=url+"?1=1&headId="+headId;
							be = "<a  href='workflow/workflow_readMsg.do?msgId="+id+"' target='_blank'>"+message+"</a>"; 
							jQuery("#read_list").jqGrid('setRowData',ids[i],{message:be});
						}
          	  		}
/**
					ondblClickRow:function(gr){
							show(gr);
					}
**/
				});
				function show(gr){
						var url= jQuery("#read_list").getCell(gr,'url');
						alert(url);
						var taskId=jQuery("#read_list").getCell(gr,'taskId');
						var headId = jQuery("#read_list").getCell(gr,'headId');
						var param = jQuery("#read_list").getCell(gr,'param');
						url=url+"?1=1&"+param;
						window.open(url,'_self');
				}
   </script>
	</body>
</html>