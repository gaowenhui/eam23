<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String message = request.getParameter("");
	String xmId = request.getParameter("xmId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>选择人员</title>
<script type="text/javascript">
</script>
</head>
<body>
<form method="post" action="">
<s:hidden name="isZcrOrSpwy" value="%{#request.isZcrOrSpwy}"/>
	<table id="purchaselist"></table>
		<div id="pgtoolbar1"></div>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:"<%=basePath %>zccz/dealToDo_getZcrOrSpwyByRole.do",//后台未实现，因为需求改变，不需要实现
	postData:{
		'isZcrOrSpwy' : '${isZcrOrSpwy}',
		'hylx'		  : '${hylx}',
		'xmId'		  : '<%=xmId%>',
		'pdk'		  : '${pdk}'
	},
	datatype: "json",
	mtype:"POST",
   	colNames:['id','人员名称'],
	colModel:[
		{name:'spzcrId',index:'id',hidden:true},
		{name:'spzcr',index:'tache'}],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '选择人员',
	
	gridComplete:function(){
		//var dates = jQuery("#purchaselist").getDataIDs();
		init_spwy();//初始化审批委员
	},
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
$(window).bind('resize', function(){
	jQuery("#purchaselist").setGridWidth($("#items").width());
});
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-add","buttonText":"确定"}]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
});

function init_spwy(){
	var selectP = window.opener.getSelectP();
	var dates = jQuery("#purchaselist").getDataIDs();
	var count1 = dates.length;
	var selectPData = selectP.split(",");
	var count2 = selectPData.length;
	for(var i = 0; i < count1; i++){
		var rowData = $("#purchaselist").jqGrid("getRowData", dates[i]);
		var pName1 = rowData.spzcr;
		for(var j =0;j < count2;j++){
			var pName2 = selectPData[j];
			if(pName1 == pName2){
				jQuery("#purchaselist").setSelection(dates[i]);
			}
		}
	}
}
function queding(){

	var gr = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	var isZcrOrSpwy = document.getElementById("isZcrOrSpwy").value;
	var mess = "<%=message%>";
	if(mess == "message"){
		//发送消息
		window.close();
	}else{
		if(isZcrOrSpwy == "true"){
			if(gr.length==1&&gr[0]==""){
				alert("没有可以选择的人员！");
			}else if(gr.length==1){
				var zcr = jQuery("#purchaselist").getCell(gr,'spzcr');
				window.opener.callBack4Zcr(gr);
				window.close();
			}else {
				alert("只能选择一个主持人!");
			}
		}else{
			if(gr.length==1&&gr[0]==""){
				alert("没有可以选择的人员！");
			}else if(gr.length>0){
				var zcr = "";
				for(var j=0;j<gr.length;j++){
					if("undefined"!=gr[j]&&(gr[j]!=null&&gr[j].length>0)){
						zcr = zcr + jQuery("#purchaselist").getCell(gr[j],'spzcr');
						if(j==gr.length-1){
						}else{
							zcr = zcr + ",";
						}
					}
				}
				window.opener.callBack4Spwy(gr,zcr);
				window.close();
			}else{
				alert("请选择人员!");
			}
		}
	}
	
}
function reloadJqGrid(){// 刷新
	jQuery("#purchaselist").trigger("reloadGrid");
}				
//*****************************************************
</script>
</form>
</body>
</html>

