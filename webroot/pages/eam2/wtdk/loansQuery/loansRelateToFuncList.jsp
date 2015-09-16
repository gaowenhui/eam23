<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String loansId = (String)request.getAttribute("loansId"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>基金账户详细信息</title>
<script type="text/javascript">
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="funcList"></table>
<div id="funWidth" style="width:100%;"></div>
<script type="text/javascript">
	var relateJSON = '<%=(String)request.getAttribute("json")%>';
	var loansId = '<%=loansId%>';
	jQuery("#funcList").jqGrid({
		//datatype: 'jsonstring',
		//datastr:relateJSON,
		url:'<%=basePath%>wtdk/loansQuery_queryRelate.do?loansId='+loansId,
		datatype: "json",
		mtype:"POST",
		multiselect:true,
		colNames:['id','贷款系统帐号','贷款客户账号','基金系统账号','基金客户账号','基金账户审批人','基金情况'],
		colModel :[
		    {name:'xulie', index:'xulie',align:'center',hidden:true}, 
			{name:'loansId', index:'loansId',align:'center'},
			{name:'loansCustNo', index:'loansCustNo',align:'center'}, 
			{name:'funcId', index:'funcId',align:'center'}, 
			{name:'funcCustId', index:'funcCustId',align:'center'},
			{name:'funcSP', index:'funcSP',align:'center'}, 
			{name:'funcQK', index:'funcQK',align:'center'}
	 	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '基金账户信息',
		toolbar: [true,"top"],
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	// 设置宽度
	$("#funcList").setGridWidth($("#funWidth").width());
	$(window).bind('resize',function(){
		$("#funcList").setGridWidth($("#funWidth").width());
	});
	
	// 添加按钮
	$(document).ready(function(){	
		var buttonJSonString = '[{"buttonHandler":"addRelate","buttonIcon":"icon-add","buttonText":"添加"},\
								 {"buttonHandler":"editRelate","buttonIcon":"icon-edit","buttonText":"修改"},\
								 {"buttonHandler":"deleteRelate","buttonIcon":"icon-remove","buttonText":"删除"}\
								]';
		addButtons(jQuery("#gview_funcList > .ui-jqgrid-titlebar"),buttonJSonString);
	});
	
	function reloadGridaaa(){
		jQuery("#funcList").trigger("reloadGrid");
	}
	
	// 添加
	function addRelate(){
		var loansId = '<%=loansId%>';
		var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
		window.open('<%=basePath%>wtdk/loansQuery_loansRelateToFuncAdd.do?loansId='+loansId,'',type)
		return false;
	}
	
	// 修改
	function editRelate(){
		var gr = jQuery("#funcList").jqGrid('getGridParam','selarrrow');
		if (gr.length == 0){
			alert("请选择要修改的记录！");
		}else{
			var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
			window.open('<%=basePath%>wtdk/loansQuery_loansRelateToFuncEdit.do?xulie='+gr,'',type)
		}
	}
	
	// 删除
	function deleteRelate(){
		var gr = jQuery("#funcList").jqGrid('getGridParam','selarrrow');
		if (gr.length == 0){
			alert("请选择要删除的记录！");
		}else{
			var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
			var url = '<%=basePath%>wtdk/loansQuery_loansRelateToFuncDelete.do';
			$.post(url,{xulie:"" + gr + ""}, function(data){
				if(data!=null && data!=''){
					alert(data);
					jQuery("#funcList").trigger("reloadGrid");
				}
			});
		}
	}
	
</script>
</body>
</html>
