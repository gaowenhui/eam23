<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title>采购单查询</title>
		<script type="text/javascript">
			$(function(){
				$("#renewal_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#renewal_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				addButtons(jQuery("#gview_renewal_list > .ui-jqgrid-titlebar"),buttonJSonString);
				$("#zzngrq,#zwngrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
			});
			
			function query(){
				if(($("#title").val()==null || $("#title").val()=="")&& 
				   ($("#ngrmc").val()==null || $("#ngrmc").val()=="")&&
				   ($("#ngbmmc").val()==null || $("#ngbmmc").val()=="") && 
				   ($("#zzngrq").val()==null || $("#zzngrq").val()=="") &&
				   ($("#zwngrq").val()==null || $("#zwngrq").val()=="")){
				   	alert("至少要有一项查询条件！");
				   	return false;
				}
				var zzcgrq = $("#zzngrq").val();
				var zwcgrq = $("#zwngrq").val();
				if(checkDataValidate(zzcgrq,zwcgrq) == true){
					jQuery("#renewal_list").setGridParam({
					url:"<%=basePath%>zyzc/ZCManageHead_queryForHeadList.do",
					postData:{
						"headVO.title"		: $("#title").val(),
						"headVO.ngrmc" 		: $("#ngrmc").val(),
						"headVO.ngbmmc" 	: $("#ngbmmc").val(),
						"headVO.zzngrq" 	: $("#zzngrq").val(),
						"headVO.zwngrq" 	: $("#zwngrq").val()
					}}).trigger("reloadGrid");
					return false;
				}
			}
			
			function ok(){
				var gr = jQuery("#renewal_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					confirm("请选择要添加的资产");
				}else {
					window.opener.myform.allHeadIds.value=gr;
					window.opener.saveWPToBody(gr);
					window.close();
				}
			}
			
			function checkDataValidate(startDate, endDate){
				if(startDate.length > 0 && endDate.length > 0){
					if(isDate(startDate) > isDate(endDate)){
						alert("开始日期应小于结束日期，请重新输入！");
						return false;
					}
					return true;
				}
				return true;
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform">
			<s:hidden name="bodyIds" id="bodyIds"></s:hidden>
			<s:hidden name="head.sheettype" id="sheettype"></s:hidden>
			<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">采购单标题：</td>
					<td class="td_zxy02" colspan="3">
						<s:textfield name="headVO.title" cssClass="input" id="title"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">拟稿人：</td>
					<td class="td_zxy02">
						<s:textfield name="headVO.ngrmc" cssClass="input" id="ngrmc"/>
					</td>
					<td class="td_zxy01">拟稿部门：</td>
					<td class="td_zxy02">
						<s:textfield name="headVO.ngbmmc" cssClass="input" id="ngbmmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">拟稿日期：</td>
					<td class="td_zxy02">
						<s:textfield name="headVO.zzngrq" cssClass="input" id="zzngrq"/>
					<td class="td_zxy01">至：</td>
					<td class="td_zxy02">
						<s:textfield name="headVO.zwngrq"  cssClass="input"  id="zwngrq"/>
					</td>
				</tr>
				<tr>
					<td class="td_form01" colspan="6">
						<input type="button" value="查询" class="buttonface" onclick="query();">
					</td>
				</tr> 
			</table>
			<table id="renewal_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
				jQuery("#renewal_list").jqGrid({
					url:"",
					datatype:"json",
					colNames:['sheadId','表单标题','拟稿人','拟稿部门','拟稿日期'],
					colModel:[
						{name:'sheadId',index:'sheadId',hidden:true},
						{name:'title',index:'title'},
						{name:'ngrmc',index:'ngrmc'},
						{name:'ngbmmc',index:'ngbmmc'},
						{name:'ngrq',index:'ngrq'}
					],
					rownumbers:true,
				   	autowidth:true,
				   	page:"pgtoolbar",
				  	rowNum:20,
				   	rowList:[10,20,30],
					height:'auto',
				   	multiselect:true,
				   	caption: "采购单",
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
		</s:form>
	</body>
</html>