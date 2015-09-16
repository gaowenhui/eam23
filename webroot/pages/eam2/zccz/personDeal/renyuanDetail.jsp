<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String stid = request.getParameter("stid");stid = stid==null?"":stid;
	String headId = request.getParameter("headId");headId = headId==null?"":headId;
	String authority = request.getParameter("authority");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
	<base href="<%=basePath %>"/>
	<title>人员安置明细</title>
	<script type="text/javascript">
		$(function(){
			jQuery("#allPerson,#anzhiPerson").setGridWidth($("#ruler").width());
			$(window).bind('resize', function() {  
				jQuery("#allPerson,#anzhiPerson").setGridWidth($("#ruler").width()); 
			}); 
		<%if(StringUtils.equals("w",authority)){%>
			var buttonJSonString_allPerson = '[{"buttonHandler":"addRenyuan","buttonIcon":"icon-add","buttonText":"安置"}]';			
			addButtons($("#gview_allPerson > .ui-jqgrid-titlebar"),buttonJSonString_allPerson);
			var buttonJSonString_anzhiPerson = '[{"id":"edit","buttonHandler":"editRenyuan","buttonIcon":"icon-edit","buttonText":"编辑"},\
				{"id":"save","buttonHandler":"saveRenyuan","buttonIcon":"icon-ok","buttonText":"保存"},\
				{"id":"cancel","buttonHandler":"cancelRenyuan","buttonIcon":"icon-no","buttonText":"取消"},\
				{"id":"del","buttonHandler":"delRenyuan","buttonIcon":"icon-remove","buttonText":"删除"}]';
			addButtons($("#gview_anzhiPerson > .ui-jqgrid-titlebar"),buttonJSonString_anzhiPerson);
			$('#save').attr("disabled",true);
			$('#cancel').attr("disabled",true);
		<%}%>			
		});
		
		var ids;
		function editRenyuan(){
			ids = jQuery("#anzhiPerson").jqGrid('getGridParam','selarrrow');
			$(ids).each(function(i,id){
				jQuery("#anzhiPerson").jqGrid('editRow',id);
			});
			$('#edit').attr("disabled",true);
			$('#save').attr("disabled",false);
			$('#cancel').attr("disabled",false);
		}
		
		function saveRenyuan(){
			$('#edit').attr("disabled",false);
			$('#save').attr("disabled",true);
			$('#cancel').attr("disabled",true);
			$(ids).each(function(i,id){
				//saveRow (rowid, succesfunc, url, extraparam, aftersavefunc, onerrorfunc) 
				jQuery("#anzhiPerson").jqGrid('saveRow',id,function(returnObj){
					//alert(returnObj.status);
					if(returnObj.status == 200){
						window.opener.setRenyuanInfo();
						return true;
					}else{
						alert("保存失败,请联系管理员!");
						return false;
					}
				},'<%=basePath %>zccz/personDealBody_setPersonAnZhiInfo.do',{"body.cldId":"<%=headId %>"});
			});	
		}
		
		function cancelRenyuan(){
			$(ids).each(function(i,id){
				jQuery("#anzhiPerson").jqGrid('restoreRow',id);
			});	
			$('#edit').attr("disabled",false);
			$('#save').attr("disabled",true);
			$('#cancel').attr("disabled",true);			
		}
		
		function addRenyuan(){
			var ids = jQuery("#allPerson").jqGrid('getGridParam','selarrrow');
			$.post("<%=basePath %>zccz/personDealBody_addAnZhiPerson.do",{
				"ids" : '' + ids,
				"body.stId" : "<%=stid %>",
				"body.cldId" : "<%=headId %>"
			},function(returnStr){
				if(returnStr == 'success'){
					jQuery("#anzhiPerson").trigger("reloadGrid");
					window.opener.setRenyuanInfo();
				}else{
					alert(returnStr);
				}
			});
		}
		
		function delRenyuan(){
			var ids = jQuery("#anzhiPerson").jqGrid('getGridParam','selarrrow');
			$.post("<%=basePath %>zccz/personDealBody_delAnZhiPerson.do",{
				"ids" : '' + ids,
				"body.cldId" : "<%=headId %>"
			},function(returnStr){
				if("success" == returnStr){
					jQuery("#anzhiPerson").trigger("reloadGrid");
					window.opener.setRenyuanInfo();
				}else{
					alert(returnStr);
				}
			});
		}
		
		function isSingle(ids){
			if(ids.length < 1){
				alert("请选择一条记录");
				return false;
			}else if(ids.length > 1){
				alert("只能选择一条记录");
				return false;
			}else{
				return true;
			}
		}
	</script>
</head>
<body>
	<div style="width: 100%;" id="ruler"></div>
	<table id="allPerson"></table>
	<script type="text/javascript">
		jQuery("#allPerson").jqGrid({
			datatype: "json",
			url:"<%=basePath %>zccz/personDealBody_allPerson.do",
			postData:{
				"body.stId" : "<%=stid %>"
			},
			colNames:['id','姓名','移动电话','固定电话'],
			colModel:[
				{name:'id',index:'id',hidden:true},	
				{name:'fxingming',index:'fxingming'},
				{name:'fyddh',index:'fyddh'},
				{name:'fgddh',index:'fgddh'}
			],
			autowidth:true,
			height:'auto',
			rownumbers:true,
			multiselect: true,
			caption: '待安置人员',
			rowNum:150,
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
	
	<table id="anzhiPerson"></table>
	<script type="text/javascript">
		jQuery("#anzhiPerson").jqGrid({
			url:"<%=basePath %>zccz/personDealBody_anzhiPerson.do",
			postData:{
				"body.cldId" : "<%=headId %>"
			},
			datatype: "json",
			colNames:['id','姓名','移动电话','固定电话','安置方式','安置费用'],
			colModel:[
				{name:'id',index:'id',hidden:true},	
				{name:'xingming',index:'xingming'},
				{name:'fyddh',index:'fyddh'},
				{name:'fgddh',index:'fgddh'},
				{name:'fazfs',index:'fazfs',editable:true},
				{name:'fazfy',index:'fazfy',editable:true}
			],
			autowidth:true,
			height:'auto',
			rownumbers:true,
			rowNum:150,
			multiselect: true,
			caption: '本次安置人员',
//			prmNames:{
//				page:"paginator.currentPage",
//				rows:"paginator.pageCount"
//			},
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
</body>
</html>
