<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	$(function(){
	jQuery("#all_Attachment").setGridWidth($("#upperTable").width());
 	  $(window).bind('resize', function(){
			jQuery("#all_Attachment").setGridWidth($("#upperTable").width())
       });
	
		//在列表的标题右端添加按钮，最后一个按钮距右端20px
		$("#gview_all_Attachment> .ui-jqgrid-titlebar").append("\
			<a href='#' id='add_xm' target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>项目更名</a>\
			<a href='#' id='delete_xm'  class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>项目删除</a>\
            <a href='#' id='update_yd'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>要点更改</a>\
            <a href='#' id='delete_yd'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>要点删除</a>\
		    <a href='#' id='remove_yj'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>意见迁移</a>\
		");
		$('#add_xm,#delete_xm,#update_yd,#delete_yd,#remove_yj').linkbutton({
                   duration: 9999999999,
				plain:true
	    });
	});

    function sub(){
	  var dataType = document.getElementById("dataType").value;
	  var cldId = document.getElementById("cldId").value;
	  var scxm = document.getElementById("scxm").value;	
	  var scyd = document.getElementById("scyd").value;
	  var jtyj = document.getElementById("jtyj").value;
		jQuery("#all_Attachment").setGridParam({
			postData:{
			'dataType':dataType,
			'cldId':cldId,
			'lsb.scxm':scxm,
			'lsb.scyd':scyd,
			'lsb.jtyj':jtyj
			},
			url:"<%=basePath%>zccz/sczskLsbAction_query4View.do"
		}).trigger("reloadGrid") ;
	}
	function call(){
	  window.opener.reloadGrid();
	}
	function dd(){
	  window.close();
	}
</SCRIPT>
</head>
<body>
<form name="myForm" method="post" action=""  >
<input type="hidden" name="cldId" id="cldId" value="${cldId}" />
<input type="hidden" name="dataType" id="dataType" value="1" />
<tr>
<td  class="td_page">审查项目:<input type="text" name="lsb.scxm"  id="scxm"  value='<s:property value="lsb.scxm"/>'>审查要点：<input type="text" name="lsb.scyd" id="scyd" value='<s:property value="lsb.scyd"/>'>具提意见：<input type="text"  name="lsb.jtyj"  id="jtyj"   value='<s:property value="lsb.jtyj"/>'>
</td>
</tr>
<tr><td><input type="button" value="查询" onclick="sub();" /></td><td><input type="button" value="关闭" onclick="dd();"/></td></tr>
<div id="upperTable" >&nbsp;</div>
<table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
	<tr>
       <td  align="right">
		   <table id="all_Attachment" ></table>
		   <script type="text/javascript">
		   	//新增卡片列表
			jQuery("#all_Attachment").jqGrid({
				//url:"<%=basePath%>zccz/sczskLsbAction_query4View.do",
				datatype: "json",
			   	colNames:['id','审查项目编号','审查项目', '审查要点编号', '具体意见编号','具体意见'],
			   	colModel:[
			   		{name:'id',index:'id',editable:true,hidden:false},
			   		{name:'scxmbh',index:'scxmbh'},
			   		{name:'scxm',index:'scxm'},
			   		{name:'scydbh',index:'scydbh'},
			   		{name:'jtyjbh',index:'jtyjbh'},
			   		{name:'jtyj',index:'jtyj'}	
			   	],
			   	rownumbers:true,
			   	height: 'auto',
                autowidth: true,
                multiselect: true,
                caption: '新增资产列表',
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
		</td>
	    </tr>
</table>
</form>
</body>
</html>
<script type="text/javascript">
			$(function(){	
				$("#add_xm").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择一条记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{	
						window.open('<%=basePath%>zccz/sczskLsbAction_xmmc.do?bussiness=xmmc&id='+gr,'','height=200, width=200, top=100, left=100, resizable=yes');
					}
					return false;
				});
				$("#delete_xm").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择一条记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{	
						window.open('<%=basePath%>zccz/sczskLsbAction_xmmc.do?bussiness=xmsc&id='+gr,'','height=200, width=200, top=100, left=100, resizable=yes');
					}
				    return false;
				});
				$("#update_yd").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择一条记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{
						window.open('<%=basePath%>zccz/sczskLsbAction_xmmc.do?bussiness=ydgg&id='+gr,'','height=200, width=200, top=100, left=100, resizable=yes');
					}
					 return false;
				});
				$("#delete_yd").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择一条记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{
						window.open('<%=basePath%>zccz/sczskLsbAction_xmmc.do?bussiness=removeyd&id='+gr,'','height=200, width=200, top=100, left=100, resizable=yes');
					}
					 return false;
				});
				$("#remove_yj").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择一条记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{
						window.open('<%=basePath%>zccz/sczskLsbAction_xmmc.do?bussiness=yjqy&id='+gr,'','height=200, width=200, top=10, left=10, resizable=yes');
					}
					return false;
				});
			});
			</script>
