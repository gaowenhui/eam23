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
		<td class="td_zxy01">债券种类：</td>
		<td class="td_zxy02"><s:textfield id="zqzlmc" size="30" /></td>
		<td class="td_zxy01">债券名称：</td>
		<td class="td_zxy02"><s:textfield id="zqmc" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">行名：</td>
		<td class="td_zxy02"><s:textfield id="hm" size="30" /></td>
		<td class="td_zxy01">项目名称</td>
		<td class="td_zxy02"><s:textfield id="xmmc" size="30" /></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr> 
</table>
</form>

<table id=zqList></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>

<script type="text/javascript">
var idStr = new Array();
jQuery("#zqList").jqGrid({
	datatype: "json",
	colNames:['id','项目名称', '债券种类', '债券名称', '行名','到期日','处置方式'],
	colModel:[ 
		{name:'id',index:'id',align:'center',hidden:true},
		{name:'xmmc', index:'xmmc',align:'center'},
		{name:'zqzlmc', index:'zqzlmc',align:'center'},
		{name:'zqmc', index:'zqmc',align:'center'},
		{name:'hm', index:'hm',align:'center'},
		{name:'dqr', index:'dqr',align:'center'},
		{name:'czfs', index:'czfs',align:'center'}
  	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '处置债券列表',
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
		var allIds = jQuery("#zqList").jqGrid('getDataIDs');
		for(var i = 0; i < allIds.length; i++){
			var index = idStr.indexOf(allIds[i]);
			if(index != -1){
				idStr.removeAt(index);
				jQuery("#zqList").setSelection(allIds[i]);
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
$("#zqList").setGridWidth($("#topbar").width());
$(window).bind('resize',function(){
	$("#zqList").setGridWidth($("#topbar").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"}]';
	addButtons(jQuery("#gview_zqList > .ui-jqgrid-titlebar"),buttonJSonString);
});

// 查询
function query(){
	var zqzlmc = document.getElementById('zqzlmc').value;
	var zqmc = document.getElementById('zqmc').value;
	var hm = document.getElementById("hm").value;
	var xmmc = document.getElementById("xmmc").value;
	jQuery("#zqList").setGridParam({postData:{
		'queryVO.zqzlmc' : zqzlmc,
		'queryVO.zqmc' : zqmc,
		'queryVO.hm' : hm,
		'queryVO.xmmc' : xmmc
	},
	url:'<%=basePath%>zccz/noticeQuery_queryZQ.do'
	}).trigger("reloadGrid");
}

// 确定
function queding(){
	//var gr = jQuery("#zqList").jqGrid('getGridParam','selarrrow');
	var gr = idStr;
	if(gr.length == 0 || gr==""){
		alert("请选择一条记录!");
	}else{
		window.opener.addZQBody(gr);
		window.close();
	}
}
</script>
</body>
</html>

