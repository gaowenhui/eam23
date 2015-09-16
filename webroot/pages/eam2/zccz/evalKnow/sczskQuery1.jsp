<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ taglib uri="/eam2-tags" prefix="e"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function sub(){
	 myForm.action="<%=request.getContextPath() %>/zccz/sczskAction_query.do";
	 myForm.submit();
	}
</SCRIPT>

</head>

<body>
<form name="myForm" method="post" action=""  >
 <br>
 <br>
<table width="95%" border="0" id="upperTable"  cellspacing="0" cellpadding="0"  align="center">
<tr>
<td  class="td_page">审查项目:<input type="text" name="sczsk.scxm" value='<s:property value="sczsk.scxm"/>' >审查要点：<input type="text" name="sczsk.scyd" value='<s:property value="sczsk.scyd"/>'>具提意见：<input type="text"  name="sczsk.jtyj" value='<s:property value="sczsk.jtyj"/>'>
删除标志：<select name="sczsk.delflag">
  <option selected="selected">0</option>
 <option selected="selected">1</option>
</select>
</td>
</tr>
<tr><td><input type="button" value="查询" onclick="reloadGrid();" /></td></tr>
</table> 
<table width="95%" border="0" id="upperTable"  cellspacing="0" cellpadding="0"  align="center">
	<tr>
       <td  align="right">
		   <table id="all_Attachment" ></table>
			<div id="pgtoolbar1"></div>
		</td>
	    </tr>
	    <tr><td><input type="button" name="关闭" onclick="history.back();"/></td></tr> 
</table>
</form>
</body>
</html>
<script type="text/javascript">
            function reloadGrid(){
					$("#all_Attachment").setGridParam({
						postData:{
							headId: "${headId}"
						},
						url:"<%=basePath%>zccz/sczskAction_query4View.do"
					}).trigger("reloadGrid");
			}
			
			$(function(){	
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				$("#gview_all_Attachment> .ui-jqgrid-titlebar").append("\
					<a href='#' id='add_asset' target='blank' class='easyui-linkbutton' iconCls='icon-add'>增加</a>\
					<a href='#' id='delete_asset'  class='easyui-linkbutton' iconCls='icon-remove'>删除</a>\
		            <a href='#' id='update_asset'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>修改</a>\
				");
				$('#add_asset,#delete_asset,#update_asset').linkbutton({
	                    duration: 9999999999,
						plain:true
			    });
				$("#delete_asset").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要删除的记录!");
					}else{	
						if(confirm("确认删除？")){
							var sheettype = "${sheettype}";
							var delblyjurl ="<%=request.getContextPath()%>/jygdzc/AssetManageBody_deleteBody.do?";
							$.post(delblyjurl,{zcId:"" + gr + "",sheettype:"" + sheettype + ""}, function(data){
								jQuery("#all_Attachment").trigger("reloadGrid");
							});
						}
					}
					return false;
				});
				$("#add_asset").click(function(){
					window.open('<%=basePath%>jygdzc/AssetManageBody_newBody.do?sheettype=addInfo&headId=${headId}','','height=600, width=1000, top=100, left=100, resizable=yes');
					return false;
				});
				$("#update_asset").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要修改的资产!");
					}else if(gr.length > 1){
						alert("只能选择一个资产!");
					}else{	
							var sheettype = "${sheettype}";
							window.open('<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?headId=${headId}&sheettype=addInfo&zcId='+gr,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					}
					return false;
				});
			});
			
					//新增卡片列表
										jQuery("#all_Attachment").jqGrid({
											url:"<%=basePath%>zccz/sczskAction_query4View.do",
											datatype: "json",
											mtype:"POST",  
										   	colNames:['id','审查项目编号','审查项目', '审查要点编号', '具体意见编号','具体意见','删除标志'],
										   	colModel:[
										   		{name:'id',index:'id',editable:true,hidden:true},
										   		{name:'scxmbh',index:'scxmbh'},
										   		{name:'scxm',index:'scxm'},
										   		{name:'scydbh',index:'scydbh'},
										   		{name:'jtyjbh',index:'jtyjbh'},
										   		{name:'jtyj',index:'jtyj'},		
										   		{name:'delflag',index:'delflag'}		
										   	],
										   	rownumbers:true,
										   	height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
                                            caption: '新增资产列表',
											viewrecords:true,
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											}
										});
										 jQuery("#all_Attachment").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#all_Attachment").setGridWidth($("#table").width())
									       });
								</script>
