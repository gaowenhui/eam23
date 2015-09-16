<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String confirmHeadId = (String)request.getAttribute("confirmHeadId"); 
	String qrrbh = (String)request.getAttribute("qrrbh");
	String dzje = String.valueOf(request.getAttribute("dzje"));
	boolean isQuery = false;
	isQuery = "true".equals((String)request.getAttribute("isQuery"))?true:false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>清算批次信息</title>
<script type="text/javascript">
	//----------------------------------------添加按钮--------------------------------------------
	<%if(!isQuery){%>
	$(document).ready(function(){	
		var buttonJSonString = '[{"buttonHandler":"confirmThis","buttonIcon":"icon-save","buttonText":"确认"},\
								 {"buttonHandler":"deleteRelate","buttonIcon":"icon-remove","buttonText":"删除"}]';
		addButtons(jQuery("#gview_qingsuan_list > .ui-jqgrid-titlebar"),buttonJSonString);
		var buttonJSonString1 = '[{"buttonHandler":"saveThis","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonJSonString1);
	});
	<%}%>
	//----------------------------------------设置宽度--------------------------------------------
	$("#qingsuan_list").setGridWidth($("#commonWidth").width());
	$("#purchase_list").setGridWidth($("#commonWidth").width());
	$(window).bind('resize',function(){
		$("#qingsuan_list").setGridWidth($("#commonWidth").width());
		$("#purchase_list").setGridWidth($("#commonWidth").width());
	});
	//----------------------------------------日期转换--------------------------------------------
	$(function(){
		$("#qsrq1,#qsrq2").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
	}); 
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!----------------------------------------查询条件-------------------------------------------->
<table id="commonWidth" width="100%" border="0" class="newtable" align="center" cellpadding="0" cellspacing="0">
  	<tr>
	    <td   class="td_ylp01">清算批次：</td>
	    <td class="td_ylp02"><s:textfield id="qspc"/></td>
	    <td class="td_ylp01">合同类型：</td>
	    <td class="td_ylp03"><s:select list="#{'':'','2':'租赁合同','1':'委管合同'}"  id="htlx" /></td>
	    <td class="td_ylp01">交易对象：</td>
	    <td class="td_ylp02"><s:select list="#{'':'','1':'建行','2':'非建行'}"  id="jydx" /></td>
  	</tr>
  	<tr>
	    <td class="td_ylp01">拟稿日期： </td>
	    <td class="td_ylp02"  colspan="3"> 从<s:textfield id="qsrq1" />到： <s:textfield id="qsrq2" /></td>
	    <td class="td_form01">&nbsp; </td>
	    <td class="td_form02"  colspan="3">&nbsp;</td>
  	</tr>
	<tr>
		<td class="td_form01" colspan="6" ><input type="button"  value="查询" onclick="query();"/></td>
  	</tr>
</table>
<!----------------------------------------清算列表-------------------------------------------->
<table id="purchase_list"></table>
<div id="pgtoolbar1"></div>
<!----------------------------------------表体列表-------------------------------------------->
<table id="qingsuan_list"></table>

<script type="text/javascript">
	var confirmHeadId = '<%=confirmHeadId%>';
	var qrrbh = '<%=qrrbh%>';
	var idStr = new Array();
	jQuery("#purchase_list").jqGrid({
		datatype: "json",
	    colNames: ['id','清算批次','交易对象','清算类型','拟稿日期','总金额','调整总金额','调整后总金额','合同数量'],			
	    colModel: [
	    	{ name: 'id', index: 'qspc', align: "center",hidden:true},
		    { name: 'qspc', index: 'qspc', align: "center",width:100},
		    { name: 'jydx', index: 'jydx', align: "center",width:100},
		    { name: 'qslx', index: 'qslx', align: "center",width:100},
		    { name: 'ngrq', index: 'ngrq',align: "center",width:100},
		    { name: 'yszj', index: 'yszj', align: "center",width:100},
		    { name: 'tzzj',index: 'tzzj', align: "center",width:100},	
		    { name: 'xghyszj',index: 'xghyszj', align: "center",width:100},	
		    { name: 'counts',index: 'counts',align: "center",width:100}	
    	],
	    pager:'pgtoolbar1',
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '清算查询',
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  	rowList:[10,20,30],
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	function query(){
		var qspc = document.getElementById("qspc").value;
		var htlx = document.getElementById("htlx").value;
		var jydx = document.getElementById("jydx").value;
		var qsrq1 = document.getElementById("qsrq1").value;
		var qsrq2 = document.getElementById("qsrq2").value;
		jQuery("#purchase_list").setGridParam({
			 url:'<%=basePath%>qs/liquidateQuery_query.do',
			 postData:{
			'queryVO.qspc' : qspc,
			'queryVO.htlx' : htlx,
			'queryVO.jydx' : jydx,
			'queryVO.qsrq1' : qsrq1,
			'queryVO.qsrq2' : qsrq2
		}}).trigger("reloadGrid");
	}
	
	jQuery("#qingsuan_list").jqGrid({
		url:'<%=basePath%>hkgl/backConfirm_findConfirmBodyByConfirmHeadId.do?confirmHeadId='+confirmHeadId+'&type=2'+'&qrrbh='+qrrbh,
		datatype: "json",
		mtype:"POST",
		multiselect:true,
		colNames:['id','清算批次','应收总金额','是否已确认'],
		colModel :[
		    {name:'id', index:'id',align:'center',hidden:true}, 
			{name:'qsPc', index:'qsPc',align:'center'},
			{name:'thysyfzje', index:'thysyfzje',align:'center'}, 
			{name:'sfybc', index:'sfybc',align:'center'}
	 	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '清算信息列表',
		toolbar: [true,"top"],
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	// 将查询结果显示到下面表体里面	
	function saveThis() {
		var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(gr.length==0 || gr==null){
			alert('请先选择信息记录');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_saveQStoConfirmBody.do";
		$.post(url,{"ids":""+gr+"","confirmHeadId":""+confirmHeadId+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#qingsuan_list").trigger("reloadGrid");
			}
		});
	};
	
	// 修改
	function editRelate(){
	}
	
	// 删除
	function deleteRelate(){
		var gr = jQuery("#qingsuan_list").jqGrid('getGridParam','selarrrow');
		var url = "<%=basePath%>hkgl/backConfirm_deleteConfirmBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#qingsuan_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
	// 确认保存
	function confirmThis(){
		var gr = jQuery("#qingsuan_list").jqGrid('getGridParam','selarrrow');
		if(gr.length==0||gr==null){
			alert('请先选择要确认的项');
			return false;
		}
		var dzje = '<%=dzje%>';
		var sr = '0';
		for(var i=0;i<gr.length;i++){
			var ysyfzje = jQuery("#qingsuan_list").getCell(gr[i],'thysyfzje');
			if(ysyfzje!=false){
				sr = parseFloat(sr) + parseFloat(ysyfzje);
			}
		}
		if(parseFloat(dzje)>parseFloat(sr)){
			alert('到账金额应该小于或等于应收金额');
			return false;
		}
		var gr = jQuery("#qingsuan_list").jqGrid('getGridParam','selarrrow');
		var url = "<%=basePath%>hkgl/backConfirm_confirmThisBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#qingsuan_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
</script>
</body>
</html>
