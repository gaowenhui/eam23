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
									{"buttonHandler":"affairAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"affairModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"affairDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
									]';						
		<%}%>							
			addButtons(jQuery("#gview_greatAffair_list> .ui-jqgrid-titlebar"),buttonJSonString);
	});
		
			function lookAss(){
			
				var gr = jQuery("#greatAffair_list").jqGrid('getGridParam','selarrrow');
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
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+11+'&stid='+stid+'&pop='+4+'&look='+1,'',winVar);
				}
			}
		
		
			function affairAddAss(){
	//			greatAffair_information.style.display=greatAffair_information.style.display=='none'?'block':'none';
				
				var id = document.getElementById("id").value;
				var stid = '<%=stid%>';
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+id+'&fslx='+11+'&stid='+stid+'&pop='+4+'&newAdd='+ 1,'',winVar);
			}
	
			function affairModifyAss(){
			
				var gr = jQuery("#greatAffair_list").jqGrid('getGridParam','selarrrow');
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
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+11+'&stid='+stid+'&pop='+4,'',winVar);
				}
			}
			
			function affairDelAss(){
			
				var gr = jQuery("#greatAffair_list").jqGrid('getGridParam','selarrrow');
				if( gr.length > 0 ) {
					if(confirm("确认删除！")){
						$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
							"fsxxIds":"" + gr
						},function(returnStr){
							alert(returnStr);
							$("#greatAffair_list").trigger("reloadGrid");
						});
					}
				}
				
				else{
					alert("请选择要删除的记录!"); 		
					}
			}
			
			
			function reloadGrid(){
				jQuery("#greatAffair_list").setGridParam({
				
				}).trigger("reloadGrid");
		    }
	
	</script>
  </head>
  <body>
	<s:hidden id="id" name="sf.id"></s:hidden>
	<s:hidden id="stid" name="sf.stid"></s:hidden>
<div width="100%" id="widthRule_affair">&nbsp;</div>				
 <table id="greatAffair_list"> </table>
     
    <script type="text/javascript">
			jQuery("#greatAffair_list").jqGrid({
			url:"<%=basePath%>stgl/weihu_viewEntity.do",
				postData:{'fslx':11,'stid':'<%=stid%>','id':'<%=id%>'},
				datatype: "json",
				mtype:"POST",
				colNames:['id','大事记编号','大事发生日期','事件类型','大事内容','备注'],
				colModel:[	
					{name:'id',index:'greatAffairNo',width:200,editable: false,hidden:true},
					{name:'gdsjbh',index:'greatAffairNo',width:200,editable: true},
					{name:'gdsfsrq',index:'date',width:300, editable: true},
					{name:'gcSjlx',index:'type', editable: false,edittype:"select",editoptions:{value:"1:改制;2:重组;3:涉诉;4:关闭停产;5:高管更换;6:外部融资;7:增资减资;8:对外担保;9:对外捐赠;10:对外投资;11:其他"}},
					{name:'gdsnr',index:'text',width:330, editable: false,edittype:"textarea"},
					{name:'gdsjbz',index:'introduction',width:330, editable: false,edittype:"textarea"}						
				],
					editurl:"entity-info-alter.html",
					pager:'#pgtoolbar31',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'大事记信息列表',
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
				jQuery("#greatAffair_list").setGridWidth($("#widthRule_affair").width());
				$(window).bind('resize', function() {  
					jQuery("#greatAffair_list").setGridWidth($("#widthRule_affair").width()); 
				}); 
	</script>		
  </body>
</html>
