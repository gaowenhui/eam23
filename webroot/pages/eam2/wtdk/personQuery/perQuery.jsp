<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>贷款机构人员对应表</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">机构编号：</td>
		<td class="td_zxy02"><s:textfield id="dkjgbm" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">机构名称：</td>
		<td class="td_zxy02"><s:textfield id="dkjgmc" cssClass="input" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">人员名称：</td>
		<td class="td_zxy02"><s:textfield id="rymc" cssClass="input" onblur="isString(this);" /></td>
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
<table id="personlist"></table>
<div id="pgtoolbar1"></div>
<div id="ruler" style="width:100%"></div>

<script type="text/javascript">
jQuery("#personlist").jqGrid({
	datatype: "json",
	colNames:['id','机构编号','机构名称','人员名称','联系方式'],
	colModel :[ 
		{name:'id', index:'id',align:'center',hidden:true}, 
	    {name:'dkjgbm', index:'dkjgbm',align:'center'}, 
		{name:'dkjgmc', index:'dkjgmc',align:'center'},
		{name:'rymc', index:'rymc',align:'center'}, 
		{name:'lxfs', index:'lxfs',align:'center'}
  	],
	pager:'pgtoolbar1',
	ondblClickRow:function(gr){
		dbClickQuery(gr);
	},
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '贷款机构人员对应表',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
  	toolbar: [false,"top"],
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
$("#personlist").setGridWidth($("#ruler").width());
$(window).bind('resize',function(){
	$("#personlist").setGridWidth($("#ruler").width());
});

// 添加按钮
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"添加"},\
							 {"buttonHandler":"remove","buttonIcon":"icon-remove","buttonText":"删除"},\
							 {"buttonHandler":"modify","buttonIcon":"icon-edit","buttonText":"修改"}\
							]';
	addButtons(jQuery("#gview_personlist > .ui-jqgrid-titlebar"),buttonJSonString);
	window.parent.clearPanelTool();
});

// 刷新
function reloadJqGrid(){
	jQuery("#personlist").trigger("reloadGrid");
}

// 查询
function query(){
	var dkjgbm = document.getElementById("dkjgbm").value;//机构编号
	var dkjgmc = document.getElementById("dkjgmc").value; //机构名称
	var rymc = document.getElementById("rymc").value; //人员名称
	var url1 = "<%=basePath%>wtdk/personQuery_perQuery.do";
	jQuery("#personlist").setGridParam({postData:{
		'perVO.dkjgbm' : dkjgbm,
		'perVO.dkjgmc' : dkjgmc,
		'perVO.rymc' : rymc
	},
	url:'<%=basePath%>wtdk/personQuery_perQuery.do'
	}).trigger("reloadGrid");
}

// 添加
function add(){
	var type = 'height=300,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
	window.open('<%=basePath%>wtdk/personQuery_addPerson.do'+'?saveupdate=save','人员机构信息添加',type);
}

// 修改
function modify(){
	var gr = jQuery("#personlist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 2){
		if(gr[0] == 'undefined'||gr[0] == '' || gr[0] == null){
			gr = gr[1];
			var type = 'height=300, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
			window.open('<%=basePath%>wtdk/personQuery_addPerson.do?id='+gr+'&saveupdate=update','人员机构信息修改',type);
		}else{
			alert("请选择一条记录");
			return false;
		}
	}else{
		if(gr.length == 1 && gr!=""){
			var type = 'height=300, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
			window.open('<%=basePath%>wtdk/personQuery_addPerson.do?id='+gr+'&saveupdate=update','人员机构信息修改',type);
		}else{ 
			alert("请选择一条记录");
			return false;
		}
	}
}

function dbClickQuery(gr){
	var type = 'height=300, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
	window.open('<%=basePath%>wtdk/personQuery_addPerson.do?id='+gr+'&saveupdate=update','人员机构信息修改',type);
}

// 删除
function remove(){
	var gr = jQuery("#personlist").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0 || gr==""){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var delurl = '<%=basePath%>wtdk/personQuery_deletePerson.do?id='+gr;
			$.post(delurl,{delBodyIds:"" + gr + ""}, function(data){
				jQuery("#personlist").trigger("reloadGrid");
			});
		}
	}
}
</script>
</body>
</html>
