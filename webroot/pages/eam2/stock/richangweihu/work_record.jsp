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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>实体人员信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<script type="text/javascript">
		function save(){
			$("#weihu_saveStFsxxform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do");
	    	$("#weihu_saveStFsxxform").submit();
		}

	var addStr;
	$(function(){
		$("input[name='fzsj']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    addStr = $("#TableBox").html();
		if("1" != "<%=newAdd %>"){
			if($.trim("<%=zyzgqk%>") !="" && "<%=zyzgqk %>" != null){
				$("#TableBox").html("<%=zyzgqk %>");
			}
		};
	   $("#weihu_saveStFsxxform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid();
			   		alert("保存成功!"); 
		   			window.close();
			   	}
		   });
			$("#frzsj,#flzsj,#fcsny").datebox({
				formatter:function(date){
					return formatDate(date);				
				}
			});
	});

	function AddEntityTable(tableId){
		$("#TableBox").append(addStr);
		$("input[name='fzsj']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	}	
	
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		var nextRow = $(rowObj).next();
		$(rowObj).remove();
		$(nextRow).remove();
	}
	
 	function addYearValue(yearsort){
 		var windowYear = 'height=200, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
 		if(yearsort = 'yearBegin'){
 			window.open();
 		}else{
 			window.open();
 		}
 	}	
 	
 	
</script>
</head>
<base target="_self"/>
<body>
<s:form action="stock/maintain_detailInfo.do" method="post" id="weihu_saveStFsxxform">
<s:hidden name="sf.id" id="id"></s:hidden>

<div width="100%" id="widthRule_work">&nbsp;</div>
<table id="work_list"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">

		$(document).ready(function(){
			//添加按钮
				var buttonJSonString = '[{"buttonHandler":"lookDetailAss","buttonIcon":"icon-search","buttonText":"查看"}]';
			addButtons(jQuery("#gview_work_list> .ui-jqgrid-titlebar"),buttonJSonString);
			
		});	


		function lookDetailAss(){
			var gr = jQuery("#work_list").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0){
				alert("请选择要查看的记录");
			}else if (gr.length > 1){
				alert("只能选择一条要查看的记录");
			}else{
				window.open('stock/maintain_viewWorkDetail.do?swid='+gr+'&look='+1);
			}
		} 

		jQuery("#work_list").jqGrid({
			url:"<%=basePath%>stock/maintain_viewList.do",
			postData:{'tag':2,'stockId':'<%=stockId%>'},
			datatype:"json",
			colNames:['id','催办人','催办时间','催办方式','债务负责人','债务负责人电话'],
			colModel:[	
				{name:'logid',index:'id',width:200,hidden:true},
				{name:'cbrmc',index:'personNo',width:200},
				{name:'cbrq',index:'Name',width:200},
				{name:'cbfsmc',index:'tel',align:"center",width:320},
				{name:'zwfzr',index:'duties',width:320},
				{name:'zwfzrdh',index:'duties',width:320}						
			],	
			pager:'pgtoolbar1',
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption: '催办记录',
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
			jQuery("#work_list").setGridWidth($("#widthRule_work").width());
			$(window).bind('resize', function() {  
				jQuery("#work_list").setGridWidth($("#widthRule_work").width()); 
			});  
</script>

</s:form>
</body>
</html>

