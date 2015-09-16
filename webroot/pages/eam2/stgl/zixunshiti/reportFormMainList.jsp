<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String stid = (String)request.getAttribute("stid");
	String id = (String)request.getAttribute("id");
	String look = (String)request.getAttribute("look"); 			//查看标志
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
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
	$(document).ready(function(){
		<%if("1".equals(look)){%>
			//添加按钮
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
		<%}else{%>			
			//添加按钮
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									{"buttonHandler":"reportAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"reportModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"reportDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
									]';	
		<%}%>							
			addButtons(jQuery("#gview_reportForm_list> .ui-jqgrid-titlebar"),buttonJSonString);
			});
		
			function lookAss(){
				var gr = jQuery("#reportForm_list").jqGrid('getGridParam','selarrrow');
				document.getElementById('id').value = gr ;
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				if(gr.length == 0){
					alert("请选择要查看的记录");
				}else if (gr.length > 1){
					alert("只能选择一条要查看的记录");
				}else{
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+12+'&stid='+stid+'&pop='+5+'&look='+1,'',winVar);
				}
			}
		
			function reportAddAss(){
				var id = document.getElementById("id").value;
//				var stid = document.getElementById("stid").value;
				var stid = '<%=stid%>';
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+id+'&fslx='+12+'&stid='+stid+'&pop='+5+'&newAdd='+ 1,'',winVar);
			}
	
			function reportModifyAss(){
				var gr = jQuery("#reportForm_list").jqGrid('getGridParam','selarrrow');
				var id = '<%=id%>';
				document.getElementById('id').value = gr ;
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				if(gr.length == 0){
					alert("请选择要修改的记录");
				}else if (gr.length > 1){
					alert("只能选择一条要修改的记录");
				}else{
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+12+'&stid='+stid+'&pop='+5,'',winVar);
				}
			}
			
			function reportDelAss(){
			
				var gr = jQuery("#reportForm_list").jqGrid('getGridParam','selarrrow');
				if( gr.length > 0 ) {
					if(confirm("确认删除！")){
						$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
							"fsxxIds":"" + gr
						},function(returnStr){
							alert(returnStr);
							$("#reportForm_list").trigger("reloadGrid");
						});
					}
				}
				
				else{
					alert("请选择要删除的记录!"); 		
					}
			}
	
	
		function reloadGrid(){
				jQuery("#reportForm_list").setGridParam({
				
				}).trigger("reloadGrid");
		    }
	</script>
  </head>
  <body>
	
<div width="100%" id="widthRule_report">&nbsp;</div>	
<s:hidden id="id" name="sf.id"></s:hidden>
<s:hidden id="stid" name="sf.stid"></s:hidden>
<table id="reportForm_list"> </table>
<script type="text/javascript">
		  
				jQuery("#reportForm_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do?",
					postData:{'fslx':12,'stid':'<%=stid%>','id':'<%=id%>'},
					datatype: "json",
					colNames:['id','报表分类','报表类型','行业类型','报表日期','报表上传日期'],
					colModel:[	
						{name:'id',index:'uploadingDate',hidden:true},
						{name:'dcBbfl',index:'classifacation',width:230,editable: false,edittype:"select",editoptions:{value:"1:资产负债表;2:现金流量表;3:利润表;4:其他"}},
						{name:'dcBblx',index:'type',width:310,editable: false,edittype:"select",editoptions:{value:"1:年报;2:中报;3:季报;4:月报;5:其他"}},
						{name:'dhylx',index:'professionType',width:315,editable: false},
						{name:'dbbrq',index:'date',editable: false},
						{name:'dbbscrq',index:'uploadingDate'}
					],
						editurl:"entity-info-alter.html",
							pager:'#pgtoolbar41',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'报表信息列表',
							toolbar:[false,"top"],
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
				
				jQuery("#reportForm_list").setGridWidth($("#widthRule_report").width()); 
				$(window).bind('resize', function() {  
					jQuery("#reportForm_list").setGridWidth($("#widthRule_report").width()); 
				}); 
</script>		
  </body>
</html>
