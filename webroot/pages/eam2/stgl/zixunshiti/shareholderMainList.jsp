<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String look = (String)request.getAttribute("look"); 			//查看标志
	String stid = (String)request.getAttribute("stid");
	String id = (String)request.getAttribute("id");
	String bili = (String)request.getAttribute("bili");
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
										{"buttonHandler":"shareholderAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"shareholderModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
										{"buttonHandler":"shareholderDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
										]';
			<%}%>
				addButtons(jQuery("#gview_shareholder_list> .ui-jqgrid-titlebar"),buttonJSonString);
			});		
			function lookAss(){
				var gr = jQuery("#shareholder_list").jqGrid('getGridParam','selarrrow');
				var id = '<%=id%>';
				document.getElementById('id').value = gr ;
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				if(gr.length == 0){
					alert("请选择要查看的记录")
				}else if (gr.length > 1 && gr.length != 2){
					alert("只能选择一条要查看的记录")
				}else if(gr.length == 2){
					if(gr[0] == 'undefined'||gr[0] == '' || gr[0] == null){
						gr = gr[1];
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+10+'&stid='+stid+'&pop='+3+'&look='+1,'',winVar);
					}else{
						alert("请选择一条记录");
						return false;
					}
				}else {
					if(gr.length == 1 && gr!=""){
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+10+'&stid='+stid+'&pop='+3+'&look='+1,'',winVar);
					}else{
						alert("请选择一条记录");
					}
				}
			}
		
		
			function shareholderAddAss(){
				var obj = jQuery("#shareholder_list").getDataIDs();
				var rid = 0;
				var bili = 0;
				for(rid = 0; rid < obj.length; rid++){
					bili += Number(jQuery("#shareholder_list").getCell(obj[rid],'ecgbl'));
				}
	//			person_information.style.display=person_information.style.display=='none'?'block':'none';
				var id = document.getElementById("id").value;
				var stid = '<%=stid%>';
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+id+'&fslx='+10+'&stid='+stid+'&pop='+3+'&newAdd='+ 1+'&bili='+ bili,'',winVar);
			}
	
			function shareholderModifyAss(){

				var gr = jQuery("#shareholder_list").jqGrid('getGridParam','selarrrow');
				var id = '<%=id%>';
				document.getElementById('id').value = gr ;
				var obj = jQuery("#shareholder_list").getDataIDs();
				var rid = 0;
				var bili = 0;
				for(rid = 0; rid < obj.length; rid++){
					bili += Number(jQuery("#shareholder_list").getCell(obj[rid],'ecgbl'));
				}
				bili -= Number(jQuery("#shareholder_list").getCell(gr,'ecgbl'));
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				if(gr.length == 0){
					alert("请选择要修改的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要修改的记录")
				}else{
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newPopList.do?id='+gr+'&fslx='+10+'&stid='+stid+'&pop='+3+'&bili=' + bili,'',winVar);
				}
			}
			
			function shareholderDelAss(){
				var gr = jQuery("#shareholder_list").jqGrid('getGridParam','selarrrow');
				if( gr.length > 0 ) {
					if(confirm("确认删除！")){
						$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
							"fsxxIds":"" + gr
						},function(returnStr){
							alert(returnStr);
							$("#shareholder_list").trigger("reloadGrid");
						});
					}
				}
				
				else{
					alert("请选择要删除的记录!"); 		
					}
			}
	
			function reloadGrid(){
				jQuery("#shareholder_list").setGridParam({
				
				}).trigger("reloadGrid");
		    }
	
	</script>
  </head>
  <body>
    <s:hidden id="id" name="sf.id"></s:hidden>
  	<s:hidden id="stid" name="sf.stid"></s:hidden>
	<div width="100%" id="widthRule_shareholder">&nbsp;</div>
<table id="shareholder_list"> </table>

	<script type="text/javascript">
	
				jQuery("#shareholder_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':10,'stid':'<%=stid%>','id':'<%=id%>'},
					datatype:"json",
					colNames:['id','股东名称','股东性质','持股比例（%）','报告日期','持股数量（万股）','本部是否控股'],
					colModel:[	
						{name:'id',index:'shareHolder',width:'320',hidden:true},
						{name:'egdmc',index:'shareHolder',width:'320'},
						{name:'egdxz',index:'type',width:'300'},
						{name:'ecgbl',index:'share_ratio',align:"center",width:'230'},
						{name:'ebgrq',index:'date',width:'230'},
						{name:'ecgsl',index:'hold_ratio',width:'230'},	
						{name:'ebbsfkg',index:'is_hold',width:'230',edittype:"select",editoptions:{value:"1:未知;2:是;3:否"},hidden:true}						
					],
						editurl:"entity-info-alter.html",
						pager:'#pgtoolbar21',
						multiselect:true,
						rownumbers:true,
						autowidth:true,
						height:'auto',
						viewrecords:true,
						prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
						caption: '股东信息列表',
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
			
				jQuery("#shareholder_list").setGridWidth($("#widthRule_shareholder").width()); 
				$(window).bind('resize', function() {  
						jQuery("#shareholder_list").setGridWidth($("#widthRule_shareholder").width()); 
				}); 
					
 </script>		
  </body>
</html>
