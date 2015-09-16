<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
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
			function querystring(){
			var title = document.getElementById("title").value;
				jQuery("#endtask_list").setGridParam({
				url:"<%=basePath%>stgl/weihu_queryString.do?id=<%=request.getParameter("stid")%>",
				postData:{'title': title
				}
				}).trigger("reloadGrid");
			}
		</script>
  </head>
  <body style="">

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_page" width='600px'>
					<form action='javascript:querystring()' name='form1' style='margin:0px; '>
						标 题： <input type='text' id='title' size='40'>
						<input name="" type="button" value="  查询  " onclick='querystring()'><input name="" type="button" value="  重置  " onclick='form1.reset();;querystring()' >
				
						</form></tr>
			</table>

		<table id="endtask_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
		<script type="text/javascript">
			jQuery("#endtask_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#endtask_list").setGridWidth($("#table1").width());
		});
		
				jQuery("#endtask_list").jqGrid({				
					url:"<%=basePath%>stgl/weihu_queryString.do?id=<%=request.getParameter("stid")%>",
					//url:"<%=basePath%>end/userEnd_queryString.do?subSystem",
					datatype: "json",
					mtype:"POST",
				   	colNames:['序号','url','headId','param','拟稿日期','标题','编号','办结日期','流程名称'],
				   	colModel:[
				   		{name:'id',align:'center',index:'id',editable:true,hidden:true},
				   		{name:'url',align:'center',index:'url',editable:true,hidden:true},
				   		{name:'headId',align:'center',index:'headId',editable:true,hidden:true},
				   		{name:'param',align:'center',index:'param',editable:true,hidden:true},		
				   		{name:'draftDate',align:'center',width:'60px',index:'draftDate',editable:true},
				   		{name:'title',index:'title',width:'400px',editable:true},
				   		{name:'sheetId',align:'center',width:'60px',index:'sheetId',editable:true},
				   		{name:'createDate',align:'center',width:'60px',index:'createDate',editable:true},
				   		{name:'procInstName',align:'center',width:'120px',index:'procInstName',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:15,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '流程信息',
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
									var url= jQuery("#endtask_list").getCell(gr,'url');
									var headId = jQuery("#endtask_list").getCell(gr,'headId');
									var title = jQuery("#endtask_list").getCell(gr,'title');
									var sheetId = jQuery("#endtask_list").getCell(gr,'sheetId');
									var param = jQuery("#endtask_list").getCell(gr,'param');
									if(sheetId==''){
										jQuery("#endtask_list").jqGrid('setRowData',ids[i],{sheetId:'无'});
									}
									
									
									url=url+"?headId="+headId+"&"+param;
								be = "<a  href='"+url+"' target='_self'>"+title+"</a>"; 
								jQuery("#endtask_list").jqGrid('setRowData',ids[i],{title:be});
	                		}
	                			 
          	  		},
					ondblClickRow:function(gr){
							show(gr);
					}
				});
				function show(gr){
						var url= jQuery("#endtask_list").getCell(gr,'url');
						var headId = jQuery("#endtask_list").getCell(gr,'headId');
						url=url+"?headId="+headId;
						window.open(url,'_self');
				}
				
   </script></body>
</html>
