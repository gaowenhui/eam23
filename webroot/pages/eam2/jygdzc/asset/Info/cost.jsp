<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype2 = (String) request.getParameter("sheettype2");
	boolean isdisable = false;
	isdisable = "true".equals((String) request
	.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>费用信息</title>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<table width="100%" border="0" align="center" id="table" cellpadding="0" cellspacing="0">
	<tr>
		<td>
		  <table width="100%" id="feiyongList" ></table>
		  <div id="pgtoolbar1"></div>
		</td>
	</tr>
</table>
</body>
</html>
<script type="text/javascript">
		jQuery("#feiyongList").setGridWidth($("#table").width());
		$(window).bind('resize', function(){
			jQuery("#feiyongList").setGridWidth($("#table").width());
		});
jQuery("#feiyongList").jqGrid({
	<%if("change".equals(sheettype2)){%> 
		url:"<%=basePath %>jygdzc/AssetManageBody_getJyzcHeadByZcId.do?sheettype=change&zcId=${zcId}",
	<%}else{%> 
		url:"<%=basePath %>jygdzc/AssetManageBody_getJyzcHeadByZcId.do?zcId=${zcId}",
	<%}%>	
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','费用种类','业务类型', '申请总金额', '审定总金额', '实际花费总金额','标题','编号','拟稿人','拟稿日期'],
	colModel: [
		{name: 'id',index: 'id',align: "center" ,hidden:true},
		{name: 'cfyzl',index:'cfyzl',align:'center'},
		{name: 'ywlx',index: 'ywlx',align: "center"},
		{name: 'sqje',index: 'applyMoney',align: "center"},
		{name: 'sdje',index: 'approveMoney',align: "center"},
		{name: 'sjhf',index: 'sjhf',align: "center"},
		{name: 'biaoti',index: 'biaoti',align: "center"},
		{name: 'bianhao',index: 'bianhao',align: "center"},
		{name: 'ngrmc',index: 'ngrmc',align: "center"},
		{name: 'ngrq',index: 'ngrq',align: "center"}
	],
	rownumbers:true,
	autowidth:true,
	//multiselect: true,
	height:'auto',
	pager:'pgtoolbar1',
  	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	rowList:[10,20,30],
	caption: '列表',
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
