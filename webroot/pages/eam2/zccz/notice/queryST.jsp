<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实体处置信息列表</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">实体名称：</td>
		<td class="td_zxy02"><s:textfield id="stmc" size="30" /></td>
		<td class="td_zxy01">资产编号：</td>
		<td class="td_zxy02"><s:textfield id="stbh" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">实体类型：</td>
		<td class="td_zxy02">
			<select id="stlx">
				<option></option>
				<option value="0">咨询类实体</option>
				<option value="1">非咨询类实体</option>
				<option value="2">外部实体</option>
			</select>
		</td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr> 
</table>
</form>

<table id=stList></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>

<script type="text/javascript">
var idStr = new Array();
jQuery("#stList").jqGrid({
	datatype: "json",
	colNames:['id','实体名称', '资产编号', '实体类型', '实体现状','实体所处省份'],
	colModel:[ 
		{name:'id',index:'id',align:'center',hidden:true},
		{name:'stmc', index:'stmc',align:'center'},
		{name:'stbh', index:'stbh',align:'center'},
		{name:'stlx', index:'stlx',align:'center'},
		{name:'stxz', index:'stxz',align:'center'},
		{name:'stscsf', index:'stscsf',align:'center'}
  	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '处置实体列表',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
  	onSelectRow: function(rowid, status){
		if(status){
			idStr.insert(idStr.length, rowid);
		}else{
			idStr.remove(rowid);
		}
	},
	onSelectAll:function(ids, status){
		if(status){
			for(var i = 0; i < ids.length; i++){
				if(ids[i] != null && ids[i].length != 0){
					var index = idStr.indexOf(ids[i]);
					if(index == -1){
						idStr.insert(idStr.length, ids[i]);
					}
				}
			}
		}else{
			for(var i = 0; i < ids.length; i++){
				if(ids[i] != null && ids[i].length != 0){
					var index = idStr.indexOf(ids[i]);
					if(index != -1){
						idStr.removeAt(index);
					}
				}
			}
		}
	},
	gridComplete:function(){
		var allIds = jQuery("#stList").jqGrid('getDataIDs');
		for(var i = 0; i < allIds.length; i++){
			var index = idStr.indexOf(allIds[i]);
			if(index != -1){
				idStr.removeAt(index);
				jQuery("#stList").setSelection(allIds[i]);
			}
		}
	},
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});

// 设置宽度
$("#stList").setGridWidth($("#topbar").width());
$(window).bind('resize',function(){
	$("#stList").setGridWidth($("#topbar").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"}]';
	addButtons(jQuery("#gview_stList > .ui-jqgrid-titlebar"),buttonJSonString);
});

// 查询
function query(){
	var stmc = document.getElementById('stmc').value;
	var stbh = document.getElementById('stbh').value;
	var stlx = document.getElementById("stlx").value;
	jQuery("#stList").setGridParam({postData:{
		'queryVO.stmc' : stmc,
		'queryVO.stbh' : stbh,
		'queryVO.stlx' : stlx
	},
	url:'<%=basePath%>zccz/noticeQuery_queryST.do'
	}).trigger("reloadGrid");
}

// 确定
function queding(){
	//var gr = jQuery("#stList").jqGrid('getGridParam','selarrrow');
	var gr = idStr;
	if(gr.length == 0 || gr==""){
		alert("请选择一条记录!");
	}else{
		window.opener.addSTBody(gr);
		window.close();
	}
}
</script>
</body>
</html>

