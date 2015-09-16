<%@page language="java"  contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype2 = (String) request.getParameter("sheettype2");
	boolean isdisable = false;
	isdisable = "true".equals((String) request
		.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>"/>
<title>风险信息</title>
<script type="text/javascript">
		$(document).ready(function(){	
			if("true"!="<%=isdisable%>"){
				    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
					var buttonriskJSonString = '[{"buttonHandler":"add_risk","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delete_risk","buttonIcon":"icon-remove","buttonText":"删除"},\
												{"buttonHandler":"update_risk","buttonIcon":"icon-edit","buttonText":"修改"}\
					]';
					addButtons(jQuery("#gview_risk_list > .ui-jqgrid-titlebar"),buttonriskJSonString);
			}
			if("true"!="<%=isdisable%>"){
	         	var sheettype2="${sheettype2}"
	         	if("change"!=sheettype2){
				    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
					var buttonssglJSonString = '[{"buttonHandler":"addssglAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delssglAss","buttonIcon":"icon-remove","buttonText":"删除"},\
												{"buttonHandler":"modssglAss","buttonIcon":"icon-edit","buttonText":"修改"}\
					]';
					addButtons(jQuery("#gview_ssgl_list > .ui-jqgrid-titlebar"),buttonssglJSonString);
				}
			}
		 	jQuery("#ssgl_list").setGridWidth($("#table").width());
	   		$(window).bind('resize', function(){
				jQuery("#ssgl_list").setGridWidth($("#table").width());
	        });
			jQuery("#risk_list").setGridWidth($("#table").width());
			 	  $(window).bind('resize', function(){
					jQuery("#risk_list").setGridWidth($("#table").width());
	        });
		});
				function add_risk(){
					var	url ="<%=basePath%>fxxx/AssetRisk_init.do?sheettype=addRisk&zcId=${zcId}&headId=${headId}";
					//window.open(''+url+'','','height=250, width=800, top=200, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					var vReturnValue=window.showModalDialog(url,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:250px;center:yes');
					if("ok"==vReturnValue){
						reloadGrid();
					}
					return false;
				};
				function delete_risk(){
					var gr = jQuery("#risk_list").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要删除的记录!");
					}else{	
						if(confirm("确认删除？")){
							var sheettype = "${sheettype}";
							var delblyjurl ="<%=basePath%>fxxx/AssetRisk_delete.do?";
							$.post(delblyjurl,{riskId:"" + gr + "",sheettype:"" + sheettype + ""}, function(data){
								jQuery("#risk_list").trigger("reloadGrid");
							});
						}
						return false;
					}
				}
		       function update_risk(){
					var gr = jQuery("#risk_list").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要修改的记录!");
					}else if(gr.length>1){
						alert("一次只能修改一条记录!");
					}else{	
						var url="";
						var sheettype2= "${sheettype2}";
						if("change"==sheettype2){
							var vReturnValue=window.showModalDialog('<%=basePath%>fxxx/AssetRisk_modify.do?sheettype=addRisk&zcId=${zcId}&headId=${headId}&sheettype2=change&riskId='+gr,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:250px;center:yes');
							//window.open('<%=basePath%>fxxx/AssetRisk_modify.do?sheettype=addRisk&zcId=${zcId}&headId=${headId}&sheettype2=change&riskId='+gr,'','height=250, width=800, top=200, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
						}else{
							//window.open('<%=basePath%>fxxx/AssetRisk_modify.do?sheettype=addRisk&zcId=${zcId}&headId=${headId}&riskId='+gr,'','height=250, width=800, top=200, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
							var vReturnValue=window.showModalDialog('<%=basePath%>fxxx/AssetRisk_modify.do?sheettype=addRisk&zcId=${zcId}&headId=${headId}&riskId='+gr,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:250px;center:yes');
						}
						if("ok"==vReturnValue){
							reloadGrid();
						}
					}
					return false;
				}
		
			function delssglAss(){
				var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
				
				if(gr.length==0){
					alert("请选择要删除的记录!"); 		
				}else if(confirm("确认删除！")){
					var delblyjurl ="<%=basePath%>ssgl/lawsuit_delete.do?id="+gr;
					$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
						jQuery("#ssgl_list").trigger("reloadGrid");
					});
				}
			}
			function modssglAss(){
			var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr != '' &&gr.length == 1 ){
					window.open('<%=basePath%>ssgl/lawsuit_modifySs.do?zcgl=asset&id='+gr,'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}else if(gr == ''||gr ==null) {
					alert("请选择要修改的记录");
				}else{
					alert("请选择要修改的记录");
				}
			}
			function addssglAss(){
				var rdBasicWidth = "400px";
				var rdBasicHeight = "300px";
				//var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				var x=(screen.width-800)/2; 
            	var y=(screen.height-400)/2;
				window.open('<%=basePath%>ssgl/lawsuit_newHead.do?zcId=${zcId}&zcgl=asset','','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				//var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_newHead.do?zcId=${zcId}","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			
				jQuery("#ssgl_list").trigger("reloadGrid");
				
			}
			function reloadGrid(){
				$("#risk_list").trigger("reloadGrid");
			}
			function reloadGridSsXx(){
				$("#ssgl_list").trigger("reloadGrid");
			}
			function lookRisk(gr){
				var vReturnValue=window.showModalDialog('<%=basePath%>fxxx/AssetRisk_modify.do?sheettype=addRisk&view=true&zcId=${zcId}&headId=${headId}&sheettype2=change&riskId='+gr,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:250px;center:yes');
			}
</script>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<table width="100%" border="0" cellspacing="0" id="table" cellpadding="0" align="center">
       <tr>
         <td  align="right">
                <table id="risk_list"> </table>
				<div id="pgtoolbar2"></div>
				<table id="ssgl_list" ></table>
				<div id="pgtoolbar1"></div>
       </td>
     </tr>
</table>
<br>
	
</body>
</html>
<script type="text/javascript">
				jQuery("#risk_list").jqGrid({
					url:"<%=basePath%>fxxx/AssetRisk_query4View.do?zcId=${zcId}",
					datatype: "json",
					colNames:['id','风险类型','风险状态','风险描述','风险控制','录入日期','录入人'],
					colModel:[	
						{name:'id',index:'id',hidden:true},
						{name:'CFxlx',index:'CFxlx',sortable:false,width:'60'},
						{name:'fxzt',index:'fxzt',sortable:false,width:'40'},
						{name:'fxms',sortable:false,index:'fxms'},
						{name:'fxkz',sortable:false,index:'fxkz'},
						{name:'lrrq',sortable:false,index:'lrrq',width:'60'},
						{name:'lrr',sortable:false,index:'lrr',width:'40'}								
					],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					pager:'pgtoolbar2',
					ondblClickRow:function(gr){
						lookRisk(gr);
					},
					viewrecords:true,
					caption:'风险列表',
					rowNum:10,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					rowList:[10,20,30],
					jsonReader:{
						root:"rows",
						page:"page",
						total:"total",
						records:"records",
						repeatitems:false,
						id:"0"
					}
				});
</script>
<script type="text/javascript">
				jQuery("#ssgl_list").jqGrid({	
				<%if("change".equals(sheettype2)){%>	
					url:"<%=basePath%>ssgl/lawsuit_queryString.do?sheettype2=change&spzt=pass&zcId=${zcId}",
				<%}else{%>
					url:"<%=basePath%>ssgl/lawsuit_queryString.do?spzt=asset&zcId=${zcId}",
				<%}%>			
					datatype: "json",
					mtype:"POST",
					//所属省份 资产类型 收案日期  被告 第三人  
				   	colNames:['id','序号','省份名称','资产类型','收案日期','原告','被告','第三人','诉讼类型','案件类别'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'ajbh',index:'ajbh',editable:true,hidden:true},
				   		{name:'sfmc',index:'sfid',editable:true},
				   		{name:'sazclbmc',index:'sazclbmc',editable:true},
				   		{name:'sarq',index:'sarq',editable:true},
				   		{name:'yg',index:'yg',editable:true},
				   		{name:'bg',index:'bg',editable:true},
				   		{name:'dsr',index:'dsr',editable:true},
				   		{name:'sslxmc',index:'sslxmc',editable:true},
				   		{name:'ajlbmc',index:'ajlbmc',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				  	rowNum:10,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					rowList:[10,20,30],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '诉讼信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
		</script>	