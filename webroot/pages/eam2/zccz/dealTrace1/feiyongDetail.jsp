<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.tansun.eam2.zccz.ZcczCommon"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String headId = request.getParameter("headId");
	String itemId = request.getParameter("itemId");	
	String itemType = request.getParameter("itemType");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<title>添加费用信息</title>
<script type="text/javascript">
    $(document).ready(function(){	
		jQuery("#xglc_reason_list").setGridWidth($("#relur").width());
		jQuery("#anzhiFeiyong").setGridWidth($("#relur").width());
		jQuery("#chuzhiFeiyong").setGridWidth($("#relur").width());
		jQuery("#genzongFeiyong").setGridWidth($("#relur").width());
		jQuery("#huikuan").setGridWidth($("#relur").width());
		$(window).bind('resize', function(){
			jQuery("#xglc_reason_list").setGridWidth($("#relur").width());
			jQuery("#anzhiFeiyong").setGridWidth($("#relur").width());
			jQuery("#chuzhiFeiyong").setGridWidth($("#relur").width());
			jQuery("#genzongFeiyong").setGridWidth($("#relur").width());
			jQuery("#huikuan").setGridWidth($("#relur").width());
		});
	    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
		var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
		]';
		addButtons(jQuery("#gview_xglc_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	});
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
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="relur" style="width: 100%;display: none;">&nbsp;</div>
<%if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY_PERSON,itemType)){ %>
	<table id="anzhiFeiyong"></table>
	<script type="text/javascript">
		jQuery("#anzhiFeiyong").jqGrid({
			url:"<%=basePath %>zccz/personDealBody_anzhiPerson.do",
			postData:{
				"body.cldId" : "<%=headId %>"
			},
			datatype:"json",
			colNames:['id','姓名','移动电话','固定电话','安置方式','安置费用','实际安置费用'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'xingming',index:'xingming'},
				{name:'fyddh',index:'fyddh'},
				{name:'fgddh',index:'fgddh'},
				{name:'fazfs',index:'fazfs'},
				{name:'fazfy',index:'fazfy'},
				{name:'fsjazfy',index:'fsjazfy'}
			],
			autowidth:true,
			height:'auto',
			multiselect: true,
			caption: '安置费用',
			prmNames:{
				page:"paginator.currentPage",
				rows:"paginator.pageSize"
			},
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
<%} %>
<table id="chuzhiFeiyong"></table>
<script type="text/javascript">
	jQuery("#chuzhiFeiyong").jqGrid({
		url:"<%=basePath %>zccz/personDealBody_anzhiFeiyong.do",
		datatype: "json",
		postData:{
			"body.cldId" : "<%=headId %>"
		},	
		colNames:['id','cldId','费用种类','预计花费(元)','实际支出', '备注'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'cldId',index:'cldId',hidden:true},
			{name:'fyzl',index:'fyzl'},
			{name:'yjhf',index:'yjhf',formatter:'number'},
			{name:'sjzc',index:'sjzc',formatter:'number',editable:true},
			{name:'beizhu',index:'beizhu',formatter:'number'}
		],
		autowidth:true,
		onSelectRow: function(id){
			jQuery('#chuzhiFeiyong').jqGrid('editRow',id,true);
			$("#" + id + "_sjzc").change(function(){
				jQuery('#chuzhiFeiyong').jqGrid('saveRow',id);
			});
		},
		editurl:'<%=basePath %>zccz/dealTrace1Head_updateSjzc.do',
		height:'auto',
		multiselect: true,
		caption: '处置阶段费用',
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

<table id="genzongFeiyong"></table>
<script type="text/javascript">
	jQuery("#genzongFeiyong").jqGrid({
		url:"<%=basePath %>zccz/dealTrace1Head_genzongFeiyong.do",
		datatype: "json",
		postData:{
			"xmId" : "<%=itemId %>"
		},	
		colNames:['id','xmid','过户税类名称','过户税类金额(元)','过户费用名称', '过户费用金额(元)'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'xmId',index:'xmId',hidden:true},
			{name:'fyzl',index:'fyzl'},
			{name:'yjhf',index:'yjhf',formatter:'number'},
			{name:'sjzc',index:'sjzc'},
			{name:'beizhu',index:'beizhu',formatter:'number'}
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '处置跟踪阶段费用',
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

<table id="huikuan"></table>
<script type="text/javascript">
	jQuery("#huikuan").jqGrid({
		url:"<%=basePath %>zccz/dealTrace1Head_huikuan.do",
		datatype: "json",
		postData:{
			"xmId" : "<%=itemId %>"
		},	
		colNames:['id','xmid','付款人','回款时间','回款金额(元)','回款费用(元)', '回款收入(元)'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'xmId',index:'xmId',hidden:true},
			{name:'fkr',index:'fkr'},
			{name:'hksj',index:'hksj'},
			{name:'hkje',index:'hkje',formatter:'number'},
			{name:'hkzfyje',index:'hkzfyje',formatter:'number'},
			{name:'hkzsrje',index:'hkzsrje',formatter:'number'}
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '回款',
		jsonReader : {
			root: "rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
</script>
<br>
<s:set name="biaodanid" value="xmIds" />
<s:set name="fenlei" value="fenlei" />
<%@ include file="/inc/zcczAccording.inc"%>
</body>
</html>
		