<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String headId = request.getParameter("headId");headId = headId==null?"":headId;
	String authority = request.getParameter("authority");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<title>添加费用信息</title>
<script type="text/javascript">
	var ids;
	$(function(){
		<%if(StringUtils.equals("w",authority)){%>
			var buttonJSonString_anzhiPerson = '[{"buttonHandler":"addFeiyong","buttonIcon":"icon-add","buttonText":"增加"},\
					{"id":"edit","buttonHandler":"editMessage","buttonIcon":"icon-edit","buttonText":"编辑"},\
					{"id":"save","buttonHandler":"saveMessage","buttonIcon":"icon-ok","buttonText":"保存"},\
					{"id":"cancel","buttonHandler":"cancelMessage","buttonIcon":"icon-no","buttonText":"取消"},\
					{"id":"del","buttonHandler":"delFeiyong","buttonIcon":"icon-remove","buttonText":"删除"},\
					{"id":"ok","buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"关闭"}]';
			addButtons($("#gview_anzhiFeiyong > .ui-jqgrid-titlebar"),buttonJSonString_anzhiPerson);
		<%}%>
		$(window).bind('resize', function() {  
			jQuery("#anzhiFeiyong").setGridWidth($("#relur").width()); 
		});	
	});	
	
	function edit(){
		jQuery("#anzhiFeiyong").jqGrid('editRow',"8a8189412e284ea3012e291af0fb001a");
	}
	
	function ok(){
		//先保存
	 	window.close();
	}
	
	function add(){
		$.post("<%=basePath %>zccz/personDealBody_saveOrUpdataFeiyong.do",{
			"body.cldId" : "<%=headId %>",
			"oper" : "add"
		},function(returnStr){
			if("success" == returnStr){
			}
		});
		$("#anzhiFeiyong").trigger("reloadGrid");
	}
	
	function addFeiyong(){
		$.post("<%=basePath %>zccz/personDealBody_saveOrUpdataFeiyong.do",{
			"oper" : "add",
			"body.cldId" : "<%=headId %>",
			"fyzl" : "",
			"yjhf" : "0",
			"beizhu" : ""
		},function(returnStr){
			var returnObj = eval('(' + returnStr + ')');
			if("SUCCESS" == returnObj.STATU){
				$("#anzhiFeiyong").addRowData(returnObj.ID,"[{fyzl:'',yjhf:'0',beizhu:''}]");
				jQuery("#anzhiFeiyong").jqGrid('editRow',returnObj.ID);
				jQuery("#anzhiFeiyong").jqGrid('setSelection',returnObj.ID);
				window.opener.setRenyuanInfo();
			}
		});
		/**
		$("#anzhiFeiyong").editGridRow("new",{
			url : "<%=basePath %>zccz/personDealBody_saveOrUpdataFeiyong.do",
			addCaption : "添加安置费用",
			editData : {
				"body.cldId" : "<%=headId %>"
			},
			closeAfterAdd : true,
			afterComplete : function(returnObj, postData){
				if(returnObj.status == 200){
					window.opener.setRenyuanInfo();
					return true;
				}else{
					alert("添加失败,请联系管理员!");
					return false;
				}
			}
		});
		**/ 
	}
	
	//===============================================================
	function editMessage(){
		ids = jQuery("#anzhiFeiyong").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		$(ids).each(function(i,id){
			jQuery("#anzhiFeiyong").jqGrid('editRow',id);
		});
	}
	
	function saveMessage(){
		ids = jQuery("#anzhiFeiyong").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		$(ids).each(function(i,id){
			if(!checkNumber($('#' + id + '_yjhf').val())){
				alert("预计花费项请输入数字");
				return false;
			}
			jQuery("#anzhiFeiyong").jqGrid('saveRow',id,function(returnObj){
				if(returnObj.status == 200){
					return true;
				}else{
					alert("保存失败,请联系管理员!");
					return false;
				}
			},'<%=basePath %>zccz/personDealBody_saveOrUpdataFeiyong.do',{
				"body.cldId" : "<%=headId %>"
			},function(){
				window.opener.setRenyuanInfo();
			});
		});	
	}
	
	function cancelMessage(){
		if(ids && ids.length == 0)
			return false;
		$(ids).each(function(i,id){
			jQuery("#anzhiFeiyong").jqGrid('restoreRow',id);
		});	
	}
	//===============================================================
	/**
	function editFeiyong(){
		var id = jQuery("#anzhiFeiyong").jqGrid('getGridParam','selarrrow');
		if(isSingle(id)){
			$("#anzhiFeiyong").editGridRow(id,{
				url : "<%=basePath %>zccz/personDealBody_saveOrUpdataFeiyong.do",
				editData : {
					"body.cldId" : "<%=headId %>"
				},
				editCaption : "修改安置费用",
				afterSubmit : function(returnObj, postData){
					if(returnObj.status == 200){
						window.opener.setRenyuanInfo();
						$("#editmodanzhiFeiyong").remove();
						return true;
					}else{
						alert("修改失败,请联系管理员!");
						return false;
					}
				}
			});
		}
	}
	**/
	function delFeiyong(){
		ids = jQuery("#anzhiFeiyong").jqGrid('getGridParam','selarrrow');
		if(isNotNull(ids)){
			jQuery("#anzhiFeiyong").delGridRow( ids, {
				caption : "删除费用",
				url : "<%=basePath %>zccz/personDealBody_delFeiyong.do",
				afterSubmit : function(returnObj, postData){
						if(returnObj.status == 200){
							window.opener.setRenyuanInfo();
							$("#delmodanzhiFeiyong").remove();
							return true;
						}else{
							alert("删除失败,请联系管理员!");
							return false;
						}
					}
			});
		}
	}
	
	function isNotNull(ids){
		if(ids.length < 1 || ids==""){
			alert("请选择记录");
			return false;
		}
		return true;
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
	
	function checkNumber(thisNum){
		var patrn=/^((([-\+]?\d+)(\.\d+))|(\.\d+)|(\d*))?$/; 
		if (!patrn.exec(thisNum)){
			alert(thisNum);
			return false;
		}
		return true;
	}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="relur" style="width: 100%;display: none;"></div>
<table id="anzhiFeiyong"></table>
<script type="text/javascript">
	jQuery("#anzhiFeiyong").jqGrid({
		url:"<%=basePath %>zccz/personDealBody_anzhiFeiyong.do",
		datatype: "json",
		postData:{
			"body.cldId" : "<%=headId %>"
		},	
		colNames:['id','费用种类','预计花费(元)', '备注'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'fyzl',index:'fyzl',editable:true},
			{name:'yjhf',index:'yjhf',editable:true},
			{name:'beizhu',index:'beizhu',editable:true}						
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '费用明细列表',
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
		