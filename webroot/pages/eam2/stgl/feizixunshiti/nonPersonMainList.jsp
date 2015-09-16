<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String stid = (String)request.getAttribute("stid");
	String id =  (String) request.getAttribute("id");
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
			
		function reloadGrid(id){
			if(id == "know"){
				jQuery("#insider_list").setGridParam({
						}).trigger("reloadGrid");
			}else if (id == "put"){
				jQuery("#anzhiPerson_list").setGridParam({
						}).trigger("reloadGrid");
			}		
		}
	</script>
  </head>
  <body>
  <s:hidden id="id" name="sf.id"></s:hidden>
  <s:hidden id="stid" name="sf.stid"></s:hidden>
<div  width="100%" id="widthRule_insider">&nbsp;</div>	
              <table id="insider_list"> </table>	

<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		 $(document).ready(function(){
				<%if("1".equals(look)){%>
					//知情添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss1","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_insider_list > .ui-jqgrid-titlebar"),buttonJSonString);
					//安置添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_anzhiPerson_list > .ui-jqgrid-titlebar"),buttonJSonString);
				<%}else{%>
					//知情添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss1","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"insiderAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"insiderModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"insiderDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_insider_list > .ui-jqgrid-titlebar"),buttonJSonString);
					
					//安置添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"anzhiPersonAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"anzhiPersonModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"anzhiPersonDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_anzhiPerson_list > .ui-jqgrid-titlebar"),buttonJSonString);
					
				<%}%>
			});
				
					function lookAss1(){
					
						var gr = jQuery("#insider_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById("id").value = gr;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
				//		var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+gr, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+gr+'&fslx='+1+'&pop='+14+'&look='+1,'',winVar);
						}
					}
				
					function insiderAddAss(){
//						insider_information.style.display=insider_information.style.display=='none'?'block':'none';
					
						var id = document.getElementById("id").value;
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+id+'&fslx='+1+'&stid='+stid+'&pop='+14+'&newAdd='+1,'',winVar);
					}
			
					function insiderModifyAss(){
						var gr = jQuery("#insider_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById("id").value = gr;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
				//		var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+gr, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+gr+'&fslx='+1+'&pop='+14,'',winVar);
						}
					}
					
					function insiderDelAss(){
						var gr = jQuery("#insider_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#insider_list").trigger("reloadGrid");
								});
							}
						}
						else{
							alert("请选择要删除的记录!"); 		
						}
					}

				jQuery("#insider_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':1,'stid':'<%=stid%>','id':'<%=id%>','pop':14},
					datatype: "json",
					colNames:['id','姓名','移动电话','固定电话','工作单位'],
					colModel:[	
							{name:'id',index:'name', editable: false,hidden:true},
							{name:'fxingming',index:'name', editable: false},
							{name:'fyddh',index:'entityName', editable: false},
							{name:'fgddh',index:'tel', editable: false},
							{name:'fgzffdw',index:'fgzffdw', editable: false} 
							],
					
					editurl:"entity-info-alter.html",
							pager:'',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							rowNum:100,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'知情人员',
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
						
				jQuery("#insider_list").setGridWidth($("#widthRule_insider").width()); 
				$(window).bind('resize', function() {  
						jQuery("#insider_list").setGridWidth($("#widthRule_insider").width()); 
					}); 
</script>


<br/>


<div width="100%" id="widthRule_anzhiPerson">&nbsp;</div>
                <table id="anzhiPerson_list"></table>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
				
					function lookAss(){
						var gr = jQuery("#anzhiPerson_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById("id").value = gr;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
				//		var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+gr, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+gr+'&fslx='+1+'&pop='+15+'&look='+1,'',winVar);
						}
					}
				
					function anzhiPersonAddAss(){
					
						var id = document.getElementById("id").value;
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+id+'&fslx='+1+'&stid='+stid+'&pop='+15+'&newAdd='+1,'',winVar);
					}
			
					function anzhiPersonModifyAss(){
						var gr = jQuery("#anzhiPerson_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById("id").value = gr;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
				//		var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+gr, window, _g_privateDialogFeatures);
						window.open('weihu_newNonList.do?id='+gr+'&fslx='+1+'&pop='+15,'',winVar);
						}
					}
					
					function anzhiPersonDelAss(){
					
						var gr = jQuery("#anzhiPerson_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#anzhiPerson_list").trigger("reloadGrid");
								});
							}
						}
						else{
							alert("请选择要删除的记录!"); 		
							}
					}

				jQuery("#anzhiPerson_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':1,'stid':'<%=stid%>','id':'<%=id%>','pop':15},
					datatype: "json",
					colNames:['id','姓名','移动电话','固定电话','安置方式','安置费用','安置状态','安置协议','收条','备注'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'fxingming',index:'name', editable: false},
						{name:'fyddh',index:'entityName', editable: false},
						{name:'fgddh',index:'tel', editable: false},
						{name:'fazfs',index:'arrangeWay', editable: false},
						{name:'fazfy',index:'arrangeCost', editable: false},
						{name:'fazzt',index:'arrangeState',  editable: false,edittype:"select",editoptions:{value:"yes:已安置;no:未安置"},hidden:true},
						{name:'fsfyazxy',index:'arrangeTreaty',align:'center',hidden:true},
						{name:'fsfyst',index:'arrangeState' ,align:'center',hidden:true},
						{name:'gdsjbz',index:'arrangeState',  editable: false} 
					],
					editurl:"entity-info-alter.html",
					//		pager:'pgtoolbar3',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							rowNum:100,
					//		prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'安置人员',
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
				jQuery("#anzhiPerson_list").setGridWidth($("#widthRule_insider").width()); 
				$(window).bind('resize', function() {  
						jQuery("#anzhiPerson_list").setGridWidth($("#widthRule_insider").width()); 
					}); 
</script>
	


  </body>
</html>
