<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String stid = String.valueOf(request.getAttribute("stId"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>实体对建投债务信息</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				jQuery("#claims_list").setGridWidth($("#widthRule").width());
				$(window).bind('resize', function(){
					jQuery("#claims_list").setGridWidth($("#widthRule").width());
				});
				
				var buttonsString0 = '[' + 
					'{"buttonHandler":"selectDept","buttonIcon":"icon-ok","buttonText":"确定"}' +
				']';
				addButtons(jQuery("#gview_claims_list > .ui-jqgrid-titlebar"),buttonsString0);
			});
			
			function selectDept(){
				var ids = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0)
					return false;
				window.opener.selectDept(ids);
				window.close();
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div id="widthRule" style="width: 100%;">&nbsp;</div>
		<table id="claims_list"></table>
		<div id="pgtoolbarclaims"></div>
		<script type="text/javascript">
			var stid = '<%=stid %>';
			jQuery("#claims_list").jqGrid({
				url:"<%=basePath %>zccz/entityDealHead_showDebtList.do",
				postData:{
					"stId" : "<%=stid %>"
				},
				datatype: "json",
				colNames:['id','债务人名称','起始日期','终止日期','合同金额(元)','购入债权余额','本金(元)','利息(元)','担保类型','担保合同金额(元)','担保物类别'],
				colModel:[
					{name:'id',index:'id',hidden:true},	
					{name:'zwrmc',index:'zwrmc'},
					{name:'htqsrq',index:'htqsrq'},
					{name:'htzzrq',index:'htzzrq'},
					{name:'htje',index:'htje'},
					{name:'grzye',index:'grzye'},
					{name:'bj',index:'bj'},
					{name:'lx',index:'lx'},
					{name:'dblxmc',index:'dblxmc'},
					{name:'dbhtje',index:'dbhtje'},
				    {name:'dbwzlbmc',index:'dbwzlbmc'}
				],
				rownumbers:true,
				autowidth:true,
				rowNum:0,
				height:'auto',
				//pager: '#pgtoolbarclaims',
				multiselect: true,
				caption: '对建投债务',
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