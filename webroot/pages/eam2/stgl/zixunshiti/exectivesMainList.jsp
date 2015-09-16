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
									{"buttonHandler":"exectivesAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"exectivesModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"exectivesDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
									]';
		<%}%>
			addButtons(jQuery("#gview_exectives_list> .ui-jqgrid-titlebar"),buttonJSonString);
	});
		
			function lookAss(){
				var gr = jQuery("#exectives_list").jqGrid('getGridParam','selarrrow');
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
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+9+'&stid='+stid+'&pop='+2+'&look='+1,'',winVar);
				}
			}
			function exectivesAddAss(){
	//			exectives_information.style.display=exectives_information.style.display=='none'?'block':'none';
		
				var id = document.getElementById("id").value;
//				var stid = document.getElementById("stid").value;
				var stid = '<%=stid%>';
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+id+'&fslx='+9+'&stid='+stid+'&pop='+2+'&newAdd='+ 1,'',winVar);
			}
	
			function exectivesModifyAss(){
				var gr = jQuery("#exectives_list").jqGrid('getGridParam','selarrrow');
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
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+9+'&stid='+stid+'&pop='+2,'',winVar);
				}
			}
			
			function exectivesDelAss(){
			
				var gr = jQuery("#exectives_list").jqGrid('getGridParam','selarrrow');
				if( gr.length > 0 ) {
					if(confirm("确认删除！")){
						$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
							"fsxxIds":"" + gr
						},function(returnStr){
							alert(returnStr);
							$("#exectives_list").trigger("reloadGrid");
						});
					}
				}
				
				else{
					alert("请选择要删除的记录!"); 		
					}
			}

			function reloadGrid(){
				jQuery("#exectives_list").setGridParam({
				
				}).trigger("reloadGrid");
		    }
	
	</script>
  </head>
  <body >
<div width="100%" id="widthRule_exectives">&nbsp;</div>
  <s:hidden id="id" name="sf.id"></s:hidden>
  <s:hidden id="stid" name="sf.stid"></s:hidden>
<table id="exectives_list"> </table>
<script type="text/javascript">

				jQuery("#exectives_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':9,'stid':'<%=stid%>','id':'<%=id%>'},
					datatype: "json",
					colNames:['id','姓名','职务', '聘任时间','离职时间'],
					colModel:[	
						{name:'id',index:'name',width:310,editable: false,hidden:true},
						{name:'fxingming',index:'name',width:310,editable: false},
						{name:'fcZhiwu',index:'duties',width:330,editable: false},
						{name:'frzsj',index:'engageTime',width:340,editable: false},
						{name:'flzsj',index:'leaveTime',width:325,editable: false}						
						],
					editurl:"entity-info-alter.html",
							pager:'#pgtoolbar51',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'高管人员信息',
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
				jQuery("#exectives_list").setGridWidth($("#widthRule_exectives").width()); 
				$(window).bind('resize', function() {  
						jQuery("#exectives_list").setGridWidth($("#widthRule_exectives").width()); 
					}); 
	</script>
  </body>
</html>
