<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String stid = (String)request.getAttribute("stid");
	String id = (String)request.getAttribute("id");
	String look = (String)request.getAttribute("look");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>人员信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		$(document).ready(function(){
			//添加按钮
			<%if("1".equals(look)){%>
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
			<%}else{%>
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									 {"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
									 {"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									 {"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"}\
									]';
			<%}%>						
			addButtons(jQuery("#gview_person_list> .ui-jqgrid-titlebar"),buttonJSonString);
			
		});		
		
		function lookAss(){
				var gr = jQuery("#person_list").jqGrid('getGridParam','selrow');
				var id = '<%=id%>';
				document.getElementById('id').value = gr ;
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
//				if(gr.length == 0){
//					alert("请选择要查看的记录")
//				}else if (gr.length > 1){
//					alert("只能选择一条要查看的记录")
//				}else{
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				if(gr == null){
					alert("请选择要查看的记录!");
				}else{
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+1+'&stid='+stid+'&pop='+1+'&look='+1,'',winVar);
				}
			}	
		
			function addAss(){
				var id = document.getElementById("id").value;
				var stid = '<%=stid%>';
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+id+'&fslx='+1+'&stid='+stid+'&pop='+1+'&newAdd='+1,'',winVar);
			}
	
			function modifyAss(){
				
				var gr = jQuery("#person_list").jqGrid('getGridParam','selrow');
				var id = '<%=id%>';
				document.getElementById('id').value = gr ;
//				if(gr.length == 0){
//					alert("请选择要修改的记录")
//				}else if (gr.length > 1){
//					alert("只能选择一条要修改的记录")
//				}else{
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				if(gr == null){
					alert("请选择要修改的记录!");
				}else{
					window.open('weihu_newPopList.do?id='+gr+'&fslx='+1+'&stid='+stid+'&pop='+1,'',winVar);
				}
			}	
			
			function delAss(){
				var gr = jQuery("#person_list").jqGrid('getGridParam','selarrrow');
				if( gr.length > 0 ) {
					if(confirm("确认删除！")){
						$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
							"fsxxIds":"" + gr
						},function(returnStr){
							alert(returnStr);
							$("#person_list").trigger("reloadGrid");
						});
					}
				}
				else{
					alert("请选择要删除的记录!"); 		
					}
			}
			
			function reloadGrid(){
				jQuery("#person_list").setGridParam({}).trigger("reloadGrid");
		    }
	</script>
  </head>
  <body>
  <div  width="100%" id="widthRule_person">&nbsp;</div>
  <s:hidden id="id" name="sf.id"></s:hidden>
  <s:hidden id="stid" name="sf.stid"></s:hidden>
 <table id="person_list"></table>
	<script type="text/javascript">
		jQuery("#person_list").jqGrid({
			url:"<%=basePath%>stgl/weihu_viewEntity.do",
			postData:{'fslx':1,'stid':'<%=stid%>','id':'<%=id%>','pop':1},
			datatype:"json",
			colNames:['id','人员编号','姓名','单位电话','职务'],
			colModel:[	
				{name:'id',index:'id',width:200,hidden:true},
				{name:'frybh',index:'personNo',width:200},
				{name:'fxingming',index:'Name',width:200},
				{name:'fdianhua',index:'tel',align:"center",width:320},
				{name:'fcZhiwu',index:'duties',width:320}						
			],	
			editurl:"entity-info-alter.html",
					multiselect:false,
					rownumbers:true,
					rowNum:100,
					autowidth:true,
					multiselect:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'实体人员信息列表',
					toolbar:[false,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "id"
					}
				});
			jQuery("#person_list").setGridWidth($("#widthRule_person").width());
			$(window).bind('resize', function() {  
				jQuery("#person_list").setGridWidth($("#widthRule_person").width()); 
			});  
	</script>
  </body>
</html>
