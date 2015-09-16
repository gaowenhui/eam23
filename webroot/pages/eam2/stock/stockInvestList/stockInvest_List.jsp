<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String zixunType = (String) request.getAttribute("zixunType");
	zixunType = zixunType == null ? "" : zixunType;
	String jyfl = (String) request.getAttribute("jyfl");
	jyfl = jyfl == null ? "" : jyfl;
	String option = (String) request.getParameter("option");//资产处置option="zccz" 实体管理option="stgl"
	String zcczStid = (String) request.getParameter("zcczStid");
	zcczStid = zcczStid == null ? "" : zcczStid;
	String zcczHeadId = (String) request.getParameter("zcczHeadId");
	zcczHeadId = zcczHeadId == null ? "" : zcczHeadId;

	//实体相关
	String stglStid = (String) request.getParameter("stglStid");
	stglStid = stglStid == null ? "" : stglStid;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath%>"/>
<title>实体查询</title>
<script type="text/javascript">

	// 添加按钮
	$(document).ready(function(){
	//清空调上的按钮
	   if(window.parent.clearPanelTool){
					window.parent.clearPanelTool();
				}	
		var buttonJSonString = '[{"buttonHandler":"lookStockAss","buttonIcon":"icon-search","buttonText":"查看"},\
								 {"buttonHandler":"lookStockDetailAss","buttonIcon":"icon-search","buttonText":"查看明细"},\
								 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
								]';
		addButtons(jQuery("#gview_all_Attachment > .ui-jqgrid-titlebar"),buttonJSonString);
	});
	
	
	function lookStockAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0 ){
			alert("请选择要查看的记录");
		}else if (gr.length > 1){
			alert("只能选择一条要查看的记录");
		}else{
			window.open('stock/stock_viewStockInvest.do?id='+gr);
		}
	}
	
	function lookStockDetailAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0 ){
			alert("请选择要查看的记录");
		}else if (gr.length > 1){
			alert("只能选择一条要查看的记录");
		}else{
			window.open('stock/stock_viewStockInvestDetail.do?id='+gr);
		}
	}
	
	function excel(){
	    var urlStr = jQuery("#all_Attachment").getGridParam('url');
		var itemName = document.getElementById("itemName").value;
		var branch = document.getElementById("branch").value ;
//		var debtValue = document.getElementById("debtValue").value ;
//		var originalValue = document.getElementById("originalValue").value;
		
	    var cp = jQuery("#all_Attachment").getGridParam('page');
	    var ps = jQuery("#all_Attachment").getGridParam('rowNum');
	    var params = "{\"queryVO.itemName\":\"" + itemName + "\",";
			params += "\"queryVO.branch\":\"" + branch + "\",";
//			params += "\"queryVO.debtValue\":\"" + debtValue + "\",";
//			params += "\"queryVO.originalValue\":\"" + originalValue + "\",";
			params += "\"stVO.sign\":" + 1 + ",";
			params += "\"paginator.currentPage\":\"" + 1 + "\",";
			 params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("all_Attachment", urlStr, params, '对公客户列表','rn,cb');
	}

	function query(){
		var itemName = document.getElementById("itemName").value;
		var branch = document.getElementById("branch").value ;
//		var debtValue = document.getElementById("debtValue").value ;
//		var originalValue = document.getElementById("originalValue").value;
			jQuery("#all_Attachment").setGridParam({postData:{
				'stVO.itemName':'' + itemName,
				'stVO.branch':'' + branch
//				'stVO.debtValue':'' + debtValue,
//				'stVO.originalValue':'' + originalValue
			},
	  url:"<%=basePath%>stock/stock_viewListStockInvest.do"		
			}).trigger("reloadGrid");
		}
	function reloadGrid(){
		jQuery("#all_Attachment").setGridParam({
		}).trigger("reloadGrid");
	}
	

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="">
<table  width="100%" id="financialTable" class="newtable" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01">项目名称：</td>
		<td class="td_zxy02"><s:textfield name="stVO.itemName" id="itemName" /></td>
		<td class="td_zxy01">分行：</td>
		<td class="td_zxy02"><s:textfield name="stVO.branch" id="branch" /></td>	
	</tr>
	<!-- 
	<tr>
		<td class="td_zxy01">2009年6月30日账面值(元)：</td>
		<td class="td_zxy02"><s:textfield name="stVO.debtValue" id="debtValue" /></td>
		<td class="td_zxy01">原值(元)：</td>
		<td class="td_zxy02"><s:textfield name="stVO.originalValue" id="originalValue" /></td>
	</tr>
-->
	<tr>
	  <td class="td_zxy01" colspan="4">
	  	<div align="right">
			<input type="button" value="查询" onClick="query();" />
			<input type="reset" value="重置" />
		</div>
	  </td>
	 </tr>
</table>
<table id="all_Attachment"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">
    	jQuery("#all_Attachment").jqGrid({
		
		postData:{'stVO.sign':1},
		datatype: "json",
		rownumbers:true,
		multiselect:true,
		sortName:'序号',
		sortOrder:'desc',
		colNames:['id','分行','项目名称','2006年原值','2006年减值准备','项目名称确认','备注'],
		colModel:[
			{name:'id',index:'HM',hidden:true},
			{name:'fhmc',index:'fhmc',align:'center'},
			{name:'xmmc',index:'xmmc',align:'center'},
			{name:'zmz',index:'ZQMZ',align:'center'},
			{name:'jzzb',index:'DQR',align:'center'},
			{name:'xmmcqr',index:'xmmcqr',align:'center'},
			{name:'beizhu',index:'DQR',align:'center'}
		],		
		   
		   loadComplete:function(data){
				if(data && data.rows.length>0){
					jQuery("#all_Attachment").setGridHeight(data.rows.length * 22 + 18);
				}else{
					jQuery("#all_Attachment").setGridHeight(0);
				}
			},
			shrinkToFit:false,
			pager:'pgtoolbar1',
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			rowList:[10,20,30],
			caption:'债券投资清单（单位：元）',
			toolbar:[false,"top"],
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}
	});
	
	$("#all_Attachment").setGridWidth($("#financialTable").width());
	//绑定resize事件
	$(window).bind('resize',function(){
		$("#all_Attachment").setGridWidth($("#financialTable").width());
	});
</script>
</form>
<%@ include file="/inc/exportExcel.inc"%>

</body>
</html>
				