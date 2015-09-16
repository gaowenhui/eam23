<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户未读消息列表页面</title>
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
				jQuery("#noread_list").setGridParam({
				url:"<%=basePath%>message/userMessage_queryString_NoRead.do?subSystem=",
				postData:{'taskqueryvo.title': title
				}
				}).trigger("reloadGrid");
			}
		</script>
		
		<table id="noread_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
	<script type="text/javascript">
	
			jQuery("#noread_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#noread_list").setGridWidth($("#table1").width());
		});
		
		jQuery("#noread_list").jqGrid({				
					url:"<%=basePath%>message/userMessage_queryString_NoRead.do?subSystem=",
					datatype: "json",
					mtype:"POST",
				   	colNames:['id','param','headId','url','发送人','发送日期','信息1'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'param',index:'param',editable:true,hidden:true},
				   		{name:'headId',index:'headId',editable:true,hidden:true},
				   		{name:'url',index:'url',editable:true,hidden:true},
				   		{name:'sendUserId',width:'80px',align:'center',index:'sendUserId',editable:true},
				   		{name:'createDate',width:'80px',align:'center',index:'createDate',editable:true},
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
					caption: '未读消息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					gridComplete: function(gr){
						var ids = $("#noread_list").getDataIDs();
						for(var i=0;i<ids.length;i++){
							var gr=ids[i];
							var id = jQuery("#noread_list").getCell(gr,'id');
							var url= jQuery("#noread_list").getCell(gr,'url');
							var taskId=jQuery("#noread_list").getCell(gr,'taskId');
							var headId = jQuery("#noread_list").getCell(gr,'headId');
							var param = jQuery("#noread_list").getCell(gr,'param');
							var message = jQuery("#noread_list").getCell(gr,'message');
							//url=url+"?1=1&"+param;
							be = "<a href='workflow/workflow_readMsg.do?msgId="+id+"' target='_blank'>"+message+"</a>";
							jQuery("#noread_list").jqGrid('setRowData',ids[i],{message:be});
                		}
          	  		}
/**
					ondblClickRow:function(gr){
						show(gr);
					}
**/
				});
				function show(gr){
					var url= jQuery("#noread_list").getCell(gr,'url');
					//alert(url);
					var taskId=jQuery("#noread_list").getCell(gr,'taskId');
					var headId = jQuery("#noread_list").getCell(gr,'headId');
					var param = jQuery("#noread_list").getCell(gr,'param');
					url=url+"?1=1&"+param;
					window.open(url,'_self');
				}
   </script>
	</body>
</html>