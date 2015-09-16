<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String pop = request.getParameter("pop");
String newAdd = request.getParameter("newAdd");
String zyzgqk = (String)request.getAttribute("zyzgqk");
String look = (String)request.getAttribute("look");
String stockId = (String)request.getAttribute("stockId");
String diid = (String)request.getAttribute("diid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
	<base href="<%=basePath%>">

	<title>催收办理列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript">
 	
</script>
</head>
<base target="_self"/>
<body>
<s:form action="stock/maintain_detailInfo.do" method="post" id="weihu_saveStFsxxform">
<s:hidden name="sf.id" id="id"></s:hidden>

<div width="100%" id="widthRule_work">&nbsp;</div>
<table id="work_list"></table>
<script type="text/javascript">

		$(document).ready(function(){
			//添加按钮
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									 {"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"添加"},\
									 {"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"}\
									]';
			addButtons(jQuery("#gview_work_list> .ui-jqgrid-titlebar"),buttonJSonString);
			
		});	


		var winVar = "height=300, width=900, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		function lookAss(){
			var gr = jQuery("#work_list").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0 ){
				alert("请选择要查看的记录");
			}else if (gr.length > 1){
				alert("只能选择一条要查看的记录");
			}else{
				window.open('zqgl/debt_newDebtWorklog.do?dkid='+gr+'&look='+1,'',winVar);
			}
		}


		function addAss(){
			window.open('zqgl/debt_newDebtWorklog.do?newAdd='+1+'&diid='+'<%=diid%>');
			return false;
		}
			
		function modifyAss(){
			var gr = jQuery("#work_list").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0 ){
				alert("请选择要修改的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要修改的记录")
			}else{
				window.open('zqgl/debt_newDebtWorklog.do?rework='+1+'&dkid='+gr);
			return false;
			}
		}

	function reloadGrid(){
		$("#work_list").setGridParam({}).trigger("reloadGrid");
	}
	
		jQuery("#work_list").jqGrid({
			url:"<%=basePath%>zqgl/debt_viewList.do",
			postData:{'diid':'<%=diid%>'},
			datatype:"json",
			colNames:['id','催收人','催收时间','催收方式','债务负责人','债务负责人电话'],
			colModel:[	
				{name:'id',index:'id',width:200,hidden:true},
				{name:'csrmc',index:'personNo',width:200},
				{name:'cssj',index:'Name',width:200},
				{name:'csfs',index:'tel',align:"center",width:320},
				{name:'zwfzr',index:'duties',width:320},
				{name:'zwfzrdh',index:'duties',width:320}						
			],	
			editurl:"entity-info-alter.html",
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'催收办理记录列表',
					toolbar:[true,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			jQuery("#work_list").setGridWidth($("#widthRule_work").width());
			$(window).bind('resize', function() {  
				jQuery("#work_list").setGridWidth($("#widthRule_work").width()); 
			});  
</script>

</s:form>
</body>
</html>

