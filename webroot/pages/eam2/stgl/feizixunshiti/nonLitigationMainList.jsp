<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String stid = (String)request.getAttribute("stid");
	String look = (String)request.getAttribute("look");
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
	</script>
  </head>
  <body>
  
  		<table id="debt_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
              <td class="td_zxy02" colspan="4">
              <div align="right">
			     <input name="sdfg" type="button" value="添加诉讼/被诉" onClick="addssglAss()"/>
              </div>   
			  </td>
            </tr>
        </table>

	<div id="sss">&nbsp;</div>		
	<div align="center"  >
		<table id="ssgl_list" align="center"></table>
		<div id="pgtoolbar1"></div>
	</div>
		<script type="text/javascript">
				jQuery("#ssgl_list").jqGrid({				
					url:"<%=basePath%>stgl/weihu_getLitigationList.do",
					postData:{'litigationType':0,'stid':'<%=stid%>'},    //0起诉
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
	//			   	pager:'pgtoolbar1',
				   	rowNum:20,
				   	prmNames:{rowNum:"paginator.pageSize",page:"paginator.currentPage",rows:"paginator.pageCount"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '诉讼案件',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
				
 //需要加到页面 初始化js中。
			 jQuery("#ssgl_list").setGridWidth($("#sss").width());
			  jQuery("#bsgl_list").setGridWidth($("#sss").width());
		    $(window).bind('resize', function(){
				jQuery("#ssgl_list").setGridWidth($("#sss").width());
				jQuery("#bsgl_list").setGridWidth($("#sss").width());
		       });

		       
	       $(document).ready(function(){	
	       	
	       		<%if("1".equals(look)){%>
	       		 //诉讼管理添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonssglJSonString = '[{"buttonHandler":"lookssglAss","buttonIcon":"icon-search","buttonText":"查看"}]';
				
				addButtons(jQuery("#gview_ssgl_list > .ui-jqgrid-titlebar"),buttonssglJSonString);
		       
			    //被诉管理添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonbsglJSonString = '[{"buttonHandler":"lookbsglAss","buttonIcon":"icon-search","buttonText":"查看"}]';
				
				addButtons(jQuery("#gview_bsgl_list > .ui-jqgrid-titlebar"),buttonbsglJSonString);
	       		<%}else{%>
	       		
	       		
			    //诉讼管理添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonssglJSonString = '[{"buttonHandler":"modssglAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"lookssglAss","buttonIcon":"icon-search","buttonText":"查看"}\
											]';
				
				addButtons(jQuery("#gview_ssgl_list > .ui-jqgrid-titlebar"),buttonssglJSonString);
		       
			    //被诉管理添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonbsglJSonString = '[{"buttonHandler":"modbsglAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"lookbsglAss","buttonIcon":"icon-search","buttonText":"查看"}\
											]';
				
				addButtons(jQuery("#gview_bsgl_list > .ui-jqgrid-titlebar"),buttonbsglJSonString);
		       <%}%>
			});
			
			
			function lookssglAss(){
				var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					alert("请选择要查看的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要查看的记录")
				}else{
					 window.open("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr+'&stgl='+1+'&look='+1);
				}
			}
					
			
			function modssglAss(){
				var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					alert("请选择要修改的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要修改的记录")
				}else{
					 window.open("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr+'&stgl='+1+'&rework='+1);
				}
			}
			
			function addssglAss(){
				var rdBasicWidth = "400px";
				var rdBasicHeight = "300px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				var x=(screen.width-800)/2; 
            	var y=(screen.height-400)/2;
				window.open('<%=basePath%>ssgl/lawsuit_newHead.do?stid='+'<%=stid%>'+'&sslxid='+0+'&sazclbbm='+2+'&stgl='+1,'','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			function reloadGridSsgl(){
				jQuery("#ssgl_list").trigger("reloadGrid");
			}
		</script>






	<div align="center" >
		<table id="bsgl_list" align="center"></table>
	</div>
		<script type="text/javascript">
				jQuery("#bsgl_list").jqGrid({				
					url:"<%=basePath%>stgl/weihu_getLitigationList.do",
					postData:{'litigationType':1,'stid':'<%=stid%>'},    //1  被诉
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
				   	rowNum:20,
				   	prmNames:{rowNum:"paginator.pageSize",page:"paginator.currentPage",rows:"paginator.pageCount"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '被讼案件',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
				
		
			function addbsglAss(){
				var rdBasicWidth = "400px";
				var rdBasicHeight = "300px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				var x=(screen.width-800)/2; 
            	var y=(screen.height-400)/2;
				window.open('<%=basePath%>ssgl/lawsuit_newHead.do?stid='+'<%=stid%>'+'&sslxid='+1+'&sazclbbm='+2+'&stgl='+1,'','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			
			function lookbsglAss(){
				var gr = jQuery("#bsgl_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					alert("请选择要查看的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要查看的记录")
				}else{
					window.open("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr+'&stgl='+1+'&look='+1);
				}
			}
			
			
			function modbsglAss(){
				var gr = jQuery("#bsgl_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					alert("请选择要修改的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要修改的记录")
				}else{
					window.open("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr+'&stgl='+1+'&rework='+1);
				}
			}
			
			function reloadGrid(){
				jQuery("#bsgl_list,#ssgl_list").trigger("reloadGrid");
			}
			
		</script>
  </body>
</html>
