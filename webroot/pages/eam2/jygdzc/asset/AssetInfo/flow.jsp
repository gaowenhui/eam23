<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程信息</title>
<script type="text/javascript">
		function reloadGrida(){
			$("#xiugailishi").trigger("reloadGrid");
		}
</script>

		<script type="text/javascript">

			function querystring(){
			var title = document.getElementById("title").value;
				jQuery("#endtask_list").setGridParam({
				url:"<%=basePath%>jygdzc/AssetManageBody_queryWorkFlow.do?zcId=${zcId}",
				postData:{'title': title
				}
				}).trigger("reloadGrid");
			}
		</script>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_page" width='600px'>
					<form action='' name='form1' style='margin:0px; '>
						标 题     ：   <input type='text' id='title' size='40'>
						<input name="" type="button" value="  查询  " onclick='querystring()'><input name="" type="button" value="  重置  " onclick='form1.reset();querystring()' >
				
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
					url:"<%=basePath%>jygdzc/AssetManageBody_queryWorkFlow.do?zcId=${zcId}&sheettype=${sheettype}",
					//url:"<%=basePath%>end/userEnd_queryString.do?subSystem",
					datatype: "json",
					mtype:"POST",
				   	colNames:['序号','url','headId','param','办结人','拟稿日期','标题','编号','办结日期','流程名称'],
				   	colModel:[
				   		{name:'id',align:'center',index:'id',editable:true,hidden:true},
				   		{name:'url',align:'center',index:'url',editable:true,hidden:true},
				   		{name:'headId',align:'center',index:'headId',editable:true,hidden:true},
				   		{name:'param',align:'center',index:'param',editable:true,hidden:true},		
				   		{name:'userId',align:'center',width:'120px',align:'center',index:'userId',editable:true},
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
								var id= jQuery("#endtask_list").getCell(gr,'id');
								var url= jQuery("#endtask_list").getCell(gr,'url');
								var headId = jQuery("#endtask_list").getCell(gr,'headId');
								var title = jQuery("#endtask_list").getCell(gr,'title');
								var sheetId = jQuery("#endtask_list").getCell(gr,'sheetId');
								var param = jQuery("#endtask_list").getCell(gr,'param');
								if(sheetId==''){
									jQuery("#endtask_list").jqGrid('setRowData',ids[i],{sheetId:'无'});
								}
								var url1 = url.split("/eam2/");
								url = url1[1];
								url=url+"?id="+id+"&"+param;
								url = encodeURIComponent(url);
								url = basePathJs + 'index.do?urlPortal=' + url;
								be = "<a  href='#' onclick='show(\""+url+"\");return false;' > "+title+" </a>";
								jQuery("#endtask_list").jqGrid('setRowData',ids[i],{title:be});
                		}
	                			 
          	  		},
					ondblClickRow:function(gr){
							look(gr);
					}
				});
				function show(gr){
						window.open(gr,'_blank','height=600, width=1100, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				function look(gr){
						var url= jQuery("#endtask_list").getCell(gr,'url');
						var id= jQuery("#endtask_list").getCell(gr,'id');
						var param = jQuery("#endtask_list").getCell(gr,'param');
						var url1 = url.split("/eam2/");
						url = url1[1];
						url=url+"?id="+id+"&"+param;
						url = encodeURIComponent(url);
						url = basePathJs + 'index.do?urlPortal=' + url;
						window.open(url,'_blank','height=600, width=1100, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
   </script>