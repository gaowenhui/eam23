<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String stid = (String)request.getAttribute("stid");
	String id = (String)request.getAttribute("id");
	String look = (String)request.getAttribute("look");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件及公章存放情况</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
			$(document).ready(function(){
				<%if("1".equals(look)){%>
				
					//添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_filter_list> .ui-jqgrid-titlebar"),buttonJSonString);
				<%}else{%>	
					//添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"filterAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"filterModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"filterDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_filter_list> .ui-jqgrid-titlebar"),buttonJSonString);
				<%}%>	
					});
				
					function lookAss(){
						var gr = jQuery("#filter_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{		
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+gr+'&fslx='+2+'&stid='+stid+'&pop='+16+'&look='+1,'',winVar);
						}
					}
				
					function filterAddAss(){
					
						var id = document.getElementById("id").value;
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+id+'&fslx='+2+'&stid='+stid+'&pop='+16+'&newAdd='+ 1,'',winVar);
					}
			
					function filterModifyAss(){
						var gr = jQuery("#filter_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{		
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+gr+'&fslx='+2+'&stid='+stid+'&pop='+16,'',winVar);
						}
					}
					
					function filterDelAss(){
						var gr = jQuery("#filter_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#filter_list").trigger("reloadGrid");
								});
							}
						}
						else{
							alert("请选择要删除的记录!"); 		
							}
 					 }
	
		function reloadGrid(){
			jQuery("#filter_list").setGridParam({
					}).trigger("reloadGrid");
		}
		
		

	</script>
  </head>
  <body>
<div  width="100%" id="widthRule_filter">&nbsp;</div>
<s:hidden id="stid" name="sf.stid"></s:hidden>	
<s:hidden id="id" name="sf.id"></s:hidden>	
 <table id="filter_list"> </table>
<script type="text/javascript">

				jQuery("#filter_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':2,'stid':'<%=stid%>','id':'<%=id%>','pop':16},
					datatype: "json",
					colNames:['id','存放内容','保管机构','存放地点','主要联系人','联系方式'],
					colModel:[	
						{name:'id',index:'adress', editable: false,hidden:true},
						{name:'acfnr',index:'storeContent',  editable: false,edittype:"select",editoptions:{value:"1:文件;2:公章;3:权证;4:账务账簿"}},
						{name:'abgjg',index:'organization', editable: false},
						{name:'acfdd',index:'adress', editable: false},
						{name:'azylxr',index:'person', editable: false},
						{name:'alxfs',index:'contractWay', editable: false}
					],
					editurl:"entity-info-alter.html",
							pager:'pgtoolbar4',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'文件及公章存放情况',
							toolbar:[true,"top"],
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
				jQuery("#filter_list").setGridWidth($("#widthRule_filter").width());		
				$(window).bind('resize', function() {  
						jQuery("#filter_list").setGridWidth($("#widthRule_filter").width()); 
					}); 
</script>
  </body>
</html>
