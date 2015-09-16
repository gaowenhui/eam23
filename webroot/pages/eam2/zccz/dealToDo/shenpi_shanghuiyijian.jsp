<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>上会意见提交情况</title>
<script type="text/javascript">
</script>
</head>
<body >
<s:form action="" theme="simple" name="myform">
<s:textfield name="hyxx.id"/>
<table id="tableWidth" width="100%" border="0" align="center" cellspacing="0">
  	<tr>
    	<td>
    	
<div align="center">
	<span class="STYLE7 STYLE1">上会意见提交情况</span>
</div>
<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
 	<tr>
		<td align="left" class="td_zxy01">审批时间：</td>
		<td class="td_zxy02"><s:textfield name="hyxx.spsj" theme="simple" cssClass="input" /></td>
	</tr>
	<tr>
		<td align="left"  class="td_zxy01">会议次数：</td>
		<td class="td_zxy02"><s:textfield name="hyxx.hycs" theme="simple" cssClass="input" /></td>
	</tr>
	<table id="purchaselist"> </table>
		<div id="pgtoolbar1"></div>
</table>
</td>
</tr>
</table>
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:"<%=basePath %>zccz/dealToDo_getCzxm4Shyj.do?hyId=${hyId}&spwyId=${spwyId}",
	datatype: "json",
	mtype:"POST",
   	colNames:['id','项目名称','项目状态','审批委员','未提交ids','未提交意见委员','主持人','主持人是否提交意见'],
	colModel:[
		{name:'id',index:'id',align:"center"},
		{name:'czxmmc',index:'theme'},
		{name:'zhuangtai',index:'theme'},
		{name:'spwys',index:'theme'},
		{name:'wtjyjwyIds',index:'theme'},
		{name:'wtjyjwys',index:'theme'},
		{name:'spzcr',index:'theme'},
		{name:'sftjspyj',index:'tache'}
		],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '项目信息',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
$(document).ready(function(){	
	var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-add","buttonText":"提交"}]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
});
$(window).bind('resize', function(){
	jQuery("#purchaselist").setGridWidth($("#items").width());
});
</script>
