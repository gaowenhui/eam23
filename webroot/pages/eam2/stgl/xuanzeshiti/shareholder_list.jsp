<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript">
	$(document).ready(function(){
			//添加按钮
			var buttonJSonString = '[{"buttonHandler":"okStock","buttonIcon":"icon-ok","buttonText":"关闭"}\
									]';
			addButtons(jQuery("#gview_shareholder_list> .ui-jqgrid-titlebar"),buttonJSonString);
			});

	function okStock(){
		window.close();
	}
</script>
  <head>
    <base href="<%=basePath%>">
    <title>查看实体股权信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <input  name="stId" id="stId" value=<%=request.getParameter("stId") %>/>
	<div width="100%" id="widthRule_shareholder">&nbsp;</div>
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	         <tr>
               <td align="right">
                <table id="shareholder_list"> </table>
			  </td>
			</tr>
	</table>
	<script type="text/javascript">
				jQuery("#shareholder_list").jqGrid({
					url:"<%=basePath%>stgl/xuanshiti_viewStock.do?stId=<%=request.getParameter("stId") %>",
					datatype:"json",
					colNames:['id','股东名称','股东性质','持股比例（%）','报告日期','持股数量（万元）','本部是否控股'],
					colModel:[	
						{name:'id',index:'id',width:'320',hidden:true},
						{name:'egdmc',index:'egdmc'},
						{name:'egdxz',index:'egdxz'},
						{name:'ecgbl',index:'ecgbl'},
						{name:'ebgrq',index:'ebgrq'},
						{name:'ecgsl',index:'ecgsl'},	
						{name:'ebbsfkg',index:'ebbsfkg'}						
					],
						multiselect:false,
						rownumbers:true,
						autowidth:true,
						height:'auto',
						viewrecords:true,
						prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
						caption: '股东信息列表',
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
			
				jQuery("#shareholder_list").setGridWidth($("#widthRule_shareholder").width()); 
				$(window).bind('resize', function() {  
						jQuery("#shareholder_list").setGridWidth($("#widthRule_shareholder").width()); 
				}); 
					
 </script>		
  </body>
</html>
