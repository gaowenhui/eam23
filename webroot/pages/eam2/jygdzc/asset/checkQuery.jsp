<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>盘点卡片查询</title>
<script type="text/javascript">
$(document).ready(function(){	
	var buttonaddJSonString = '[{"buttonHandler":"addCardLSB","buttonIcon":"icon-ok","buttonText":"确定"}\
	]';
	addButtons(jQuery("#gview_card_list> .ui-jqgrid-titlebar"),buttonaddJSonString);	
});
	function querystring(){
	var cardcode = document.getElementById("cardcode").value;
	var cardname = document.getElementById("cardname").value;
	var headId ="${headId}";
		jQuery("#card_list").setGridParam({
			url:"<%=basePath%>jygdzc/AssetManageBody_queryCardLSB2.do",
			postData:{
			'cardcode': cardcode,
			'headId':headId,
			'cardname':cardname
			}
		}).trigger("reloadGrid");
	}
	function addCardLSB(){
		var gr = jQuery("#card_list").jqGrid('getGridParam','selarrrow');
		if(gr==''||gr.length==0){
			alert('请选择一条记录');
			return false;
		}else{
			var delUrl = "<%=basePath%>jygdzc/AssetManageBody_addCardLSB.do";
			$.post(delUrl,{kpids:"" + gr + ""},function(data){
				if(data!=null || data!=''){
					window.opener.reloadGrid4Card();
					jQuery("#card_list").trigger("reloadGrid");
				}
			});
		}
	}
</script>
</head>
<body>
<form action='' name='form1' style='margin:0px; '>
<s:hidden name="headId" value="%{#request.headId}"/>

		<table width="100%" border="0" align="center" id="table" cellpadding="0" class="newtable" cellspacing="0">
				<tr>
					<td class="td_page">卡片编号 :</td>
					<td class="td_page"> <input type='text' id='cardcode'  size='30'></td>
					<td class="td_page">卡片名称 :</td>
					<td class="td_page"> <input type='text' id='cardname' size='30'></td>	
					<td class="td_page">
						<input name="" type="button" value=" 查询 " onclick='querystring()'>
						<input name="" type="button" value=" 重置 " onclick='form1.reset();querystring()' >
					</td>
						</tr>
			</table>
</form>			
<table id="card_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
<script type="text/javascript">
				$(function(){
					jQuery("#card_list").setGridWidth($("#table").width());
					$(window).bind('resize', function(){
						jQuery("#card_list").setGridWidth($("#table").width());
					});
				})
				jQuery("#card_list").jqGrid({				
					url:'<%=basePath%>jygdzc/AssetManageBody_queryCardLSB1.do?headId=${headId}',
					datatype: "json",
					mtype:"POST",
				   	colNames:['id','资产编号','资产名称','卡片编号','卡片名称','使用部门','管理部门','一级分行','原币原值'],
					colModel:[
						{name:'id',index:'id',editable:true,editoptions:{size:61},hidden:true},
						{name:'zcbh',index:'zcbh',editable:true,editoptions:{size:61}},					
						{name:'zcmc',index:'zcmc',editable:true,editoptions:{size:61}},
						{name:'cardcode',index:'cardcode',editable:true,editoptions:{size:61}},
						{name:'zcname',index:'zcname',editable:true,editoptions:{size:61}},
						{name:'usepartment',index:'usepartment',editable:true,editoptions:{size:61}},
						{name:'glbm',index:'glbm',editable:true,editoptions:{size:61}},
						{name:'firstbranch',index:'firstbranch',editable:true,editoptions:{size:61}},
						{name:'ybyz',index:'ybyz',editable:true,editoptions:{size:61}}
					],
					rowNum:0,
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '卡片列表',
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