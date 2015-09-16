<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户已办事宜列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script type="text/javascript">
			if(parent.clearPanelTool!=null)
			parent.clearPanelTool();
			function backto(taskId){
				var result = window.showModalDialog("<%=request.getContextPath()%>/workflow/workflow_backto.do?taskId="+taskId+"&BACK_OPERATION=BACK_OPERATION","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:300px;dialogHeight:150px;center:yes");
				if(typeof(result)!='undefined'){
					document.myForm.submit();
				}
			}
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
				jQuery("#did_list").setGridParam({
				url:"<%=basePath%>did/userDid_queryString.do?subSystem",
				postData:{'taskqueryvo.title': tranTitle
				}
				}).trigger("reloadGrid");
			}
		</script>
	
		<table id="did_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
	
		<script type="text/javascript">
		
			jQuery("#did_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#did_list").setGridWidth($("#table1").width());
		});
		
		
				jQuery("#did_list").jqGrid({				
					url:"<%=basePath%>did/userDid_queryString.do?subSystem",
					datatype: "json",
					mtype:"POST",
				   	colNames:['序号','url','taskId','headId','param','拟稿人','拟稿日期','标题','编号','流程名称','环节名称','接收人','发送时间'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'url',index:'url',editable:true,hidden:true},
				   		{name:'taskId',index:'taskId',editable:true,hidden:true},				   		
				   		{name:'headId',index:'headId',editable:true,hidden:true},
				   		{name:'param',index:'param',editable:true,hidden:true},
				   		{name:'draftUserId',width:'120px',align:'center',index:'draftUserId',editable:true},
				   		{name:'draftDate',width:'100px',align:'center',index:'yg',editable:true},
				   		{name:'title',index:'bg',width:'400px',editable:true},
				   		{name:'sheetId',width:'60px',align:'center',index:'sheetId',editable:true},
				   		{name:'headType',align:'center',index:'headType',editable:true},
				   		{name:'nextTaskName',align:'center',index:'nextTaskName',editable:true},
				   		{name:'userId',width:'120px',align:'center',index:'userId',hidden:true},
				   		{name:'createDate',align:'center',index:'createDate',editable:true}
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
					caption: '已办事宜',
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
							var ids = $("#did_list").getDataIDs();
							for(var i=0;i<ids.length;i++){
								var gr=ids[i];
								var url= jQuery("#did_list").getCell(gr,'url');
								var taskId=jQuery("#did_list").getCell(gr,'taskId');
								var headId = jQuery("#did_list").getCell(gr,'headId');
								var param = jQuery("#did_list").getCell(gr,'param');
								url=url+"?taskId="+taskId+"&headId="+headId+"&"+param;
								var title=jQuery("#did_list").getCell(gr,'title');
								var sheetId = jQuery("#did_list").getCell(gr,'sheetId');
									
									if(sheetId==''){
										jQuery("#did_list").jqGrid('setRowData',ids[i],{sheetId:'无'});
									}
									
								be = "<a  href='"+url+"' target='_self'>"+title+"</a>"; 
								jQuery("#did_list").jqGrid('setRowData',ids[i],{title:be});
	                		}
	                			 
          	  		}
/**
					ondblClickRow:function(gr){
							show(gr);
					}
**/
				});
				function show(gr){
						var url= jQuery("#did_list").getCell(gr,'url');
						var taskId=jQuery("#did_list").getCell(gr,'taskId');
						var headId = jQuery("#did_list").getCell(gr,'headId');
						var param = jQuery("#did_list").getCell(gr,'param');
						url='<%=basePath%>'+url+"?taskId="+taskId+"&headId="+headId+"&"+param;
						window.open(url,'_self');
				}
		
   </script>
	
	
	</body>
</html>