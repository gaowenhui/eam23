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
		<td class="td_zxy01">资产名称：</td>
		<td class="td_zxy02"><s:textfield id="zcmc" size="30" /></td>
		<td class="td_zxy01">资产编号：</td>
		<td class="td_zxy02"><s:textfield id="zcbh" size="30" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">资产类别：</td>
		<td class="td_zxy02">
			<select id="zcfl">
				<option value="0">经营性固产</option>
				<option value="1">实体内资产</option>
				<option value="2">委贷抵债物</option>
				<option value="4">自用资产</option>
				<option value="5">待处置类固定资产</option> <!-- 经营 -->
				<option value="6">受托固定资产</option> <!-- 经营 -->
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

<table id=zcList></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>

<script type="text/javascript">
var idStr = new Array();
jQuery("#zcList").jqGrid({
	datatype: "json",
	colNames:['id','资产编号', '资产名称', '资产分类', '处置方式','评估值'],
	colModel:[ 
		{name:'id',index:'id',align:'center',hidden:true},
		{name:'zcbh', index:'zcbh',align:'center'},
		{name:'zcmc', index:'zcmc',align:'center'},
		{name:'zcfl', index:'zcfl',align:'center'},
		{name:'czfs', index:'czfs',align:'center'},
		{name:'pgz', index:'pgz',align:'center'}
  	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '处置资产列表',
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
		var allIds = jQuery("#zcList").jqGrid('getDataIDs');
		for(var i = 0; i < allIds.length; i++){
			var index = idStr.indexOf(allIds[i]);
			if(index != -1){
				idStr.removeAt(index);
				jQuery("#zcList").setSelection(allIds[i]);
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
$("#zcList").setGridWidth($("#topbar").width());
$(window).bind('resize',function(){
	$("#zcList").setGridWidth($("#topbar").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"}]';
	addButtons(jQuery("#gview_zcList > .ui-jqgrid-titlebar"),buttonJSonString);
});

// 查询
function query(){
	var zcmc = document.getElementById('zcmc').value;
	var zcbh = document.getElementById('zcbh').value;
	var zcfl = document.getElementById("zcfl").value;
	jQuery("#zcList").setGridParam({postData:{
		'queryVO.zcmc' : zcmc,
		'queryVO.zcbh' : zcbh,
		'queryVO.zcfl' : zcfl
	},
	url:'<%=basePath%>zccz/noticeQuery_queryZC.do'
	}).trigger("reloadGrid");
}

// 确定
function queding(){
	var gr = idStr;
	if(gr.length == 0 || gr==""){
		alert("请选择一条记录!");
	}else{
		window.opener.addZCBody(gr);
		window.close();
	}
}
</script>
</body>
</html>

