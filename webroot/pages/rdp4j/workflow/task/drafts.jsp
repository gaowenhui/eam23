
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户草稿箱列表页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script>
			$(function(){
				$("#queryButton").attr("title","可根据 拟稿人 拟稿日期 标题 表单类型 等关键字查询");
			});
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
				jQuery("#draft_list").setGridParam({
					url:"<%=basePath%>draft/userDraft_queryString.do?subSystem=",
					postData:{'taskqueryvo.title': tranTitle
				}
				}).trigger("reloadGrid");
			}
		</script>
	
		<table id="draft_list" align="center" ></table>
	<div id="pgtoolbar1"></div>
	<script type="text/javascript">
	
		
			jQuery("#draft_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#draft_list").setGridWidth($("#table1").width());
		});
		
				jQuery("#draft_list").jqGrid({				
					url:"<%=basePath%>draft/userDraft_queryString.do?subSystem=",
					datatype: "json",
					mtype:"POST",
				   	colNames:['id','url','processDefinitionKey','headId','拟稿人','拟稿日期','标题','表单类型'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'url',index:'url',editable:true,hidden:true},
				   		{name:'processDefinitionKey',index:'processDefinitionKey',editable:true,hidden:true},
				   		{name:'headId',index:'headId',editable:true,hidden:true},
				   		{name:'userId',width:'80px',align:'center',index:'userId',editable:true},
				   		{name:'draftDate',width:'80px',align:'center',align:'center',index:'draftDate',editable:true},
				   		{name:'title',width:'400px',index:'title',editable:true},
				   		{name:'headType',width:'80px',align:'center',index:'headType',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:15,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					rowList:[15,30,45],
					caption: '草稿箱',
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
							var ids = $("#draft_list").getDataIDs();
							for(var i=0;i<ids.length;i++){
								var gr=ids[i];
								var url= jQuery("#draft_list").getCell(gr,'url');
								var processDefinitionKey=jQuery("#draft_list").getCell(gr,'processDefinitionKey');
								var headId = jQuery("#draft_list").getCell(gr,'headId');
								var title = jQuery("#draft_list").getCell(gr,'title');
								url="<%=basePath%>"+url+"?pdk="+processDefinitionKey+"&headId="+headId;
								if(title==null||title==''){
									be = "<a  href='"+url+"' target='_self'>　　</a>"; 
								}else{
									be = "<a  href='"+url+"' target='_self'>"+title+"</a>"; 
								}
									jQuery("#draft_list").jqGrid('setRowData',ids[i],{title:be});
	                		}
          	  		}
				});
				function show(gr){
					var url= jQuery("#draft_list").getCell(gr,'url');
					var processDefinitionKey=jQuery("#draft_list").getCell(gr,'processDefinitionKey');
					var headId = jQuery("#draft_list").getCell(gr,'headId');
					url="<%=basePath%>"+url+"?pdk="+processDefinitionKey+"&headId="+headId;
					window.open(url,'_self');
				}
				function isSingle(ids){
					if(ids.length < 1){
						alert("请选择一条记录");
						return false;
					}else if(ids.length > 1){
						alert("只能选择一条记录");
						return false;
					}else{
						return true;
					}
				}				
				function delDraft() {
					var gr = jQuery("#draft_list").jqGrid('getGridParam','selarrrow');
					if(gr!=''){
						if(confirm("确定删除选择的记录?")){
							var delblyjurl ="<%=basePath%>draft/userDraft_deleteDraft.do";
							//alert(delblyjurl);
							$.post(delblyjurl,{draftId:"" + gr + ""}, function(data){
								jQuery("#draft_list").trigger("reloadGrid");
							});
						}
					}else{
						alert("请选择需要删除的记录！");
					}
				}
	var buttonFileJSonString = '[{"buttonHandler":"delDraft","buttonIcon":"icon-cut","buttonText":"删除"}]';
	addButtons(jQuery("#gview_draft_list > .ui-jqgrid-titlebar"),buttonFileJSonString);

   </script>
	</body>
</html>