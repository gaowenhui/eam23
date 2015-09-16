<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sign = request.getParameter("sign");
String headId = request.getParameter("headId");
String option = request.getParameter("option");
String assetType = request.getParameter("assetType");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath%>"/>
<title>债券查询</title>
<script type="text/javascript">
	$(document).ready(function(){
	     if(window.parent.clearPanelTool){
					window.parent.clearPanelTool();
				}
			//添加按钮
			if("1" == '<%=sign%>'){
				var buttonJSonString = '[{"buttonHandler":"confirmAss","buttonIcon":"icon-ok","buttonText":"确定"},\
				                         {"buttonHandler":"particularInfo","buttonIcon":"icon-search","buttonText":"详细信息"}\
				]';
			}else{
				var buttonJSonString = '[{"buttonHandler":"lookStockListAss","buttonIcon":"icon-search","buttonText":"债券项目信息"},\
										 {"buttonHandler":"particularInfo","buttonIcon":"icon-search","buttonText":"详细信息"},\
										 {"buttonHandler":"addNote","buttonIcon":"icon-add","buttonText":"添加工作记录"},\
										 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
										]';
			}
			addButtons(jQuery("#gview_all_Attachment> .ui-jqgrid-titlebar"),buttonJSonString);
		});		
		
	function confirmAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if("zccz" == "<%=option %>"){
			window.opener.insertAsset(gr,"","","<%=assetType %>");
			window.close();
		}else if("CJTZ" == "<%=option %>"){
			window.parent.addZQuan(gr);
			window.close();
		}else if("ssgl" == "<%=option %>"){
			//诉讼管理选择债券，返回id 和名称 xuecj 2011-01-05 20:27
			if(isSingle(gr)){
				var xmmc = jQuery("#all_Attachment").getCell(gr,'xmmc');
				window.opener.addValue(gr,xmmc);
				window.close();
			}
		}else{
			window.opener.reloadGrid(gr);
			window.close();
		}
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
	//---------查询200906清单信息	
	var winVar = "height=300, width=900, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
	function lookStockListAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		
		//var id = jQuery("#all_Attachment").getCell(gr,'stockid');
		if(gr.length == 0 ){
			alert("请选择要查看的记录");
		}else if (gr.length > 32){
			alert("只能选择一条要查看的记录");
		}else{
			window.open('stock/stock_viewStockInvest.do?id='+gr,'',winVar);
		}
	}
	
	var windowStatus = 'height=300, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
	
	function addNote(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		var id = gr;
		if(gr.length == 0 ){
				alert("请选择要添加的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要添加的记录")
			}else{
			window.open('stock/maintain_newWork.do?saveSign='+1+'&stockId='+ gr,'',windowStatus);
			return false;
		}
	}
	var windowInfo = 'height=700, width=900, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';	
	function particularInfo(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0 ){
				alert("请选择要添加的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要添加的记录")
			}else{
			window.open('stock/maintain_detailInfo.do?saveSign='+1+'&stockId='+ gr,'',windowInfo);
			return false;
		}
	}	
	function delAss(){
		var gr = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
		if( gr.length > 0 ) {
			if(confirm("确认删除！")){
				$.post("<%=request.getContextPath()%>/stgl/weihu_deleteStJbxx.do",{
					"fsxxIds":"" + gr
				},function(returnStr){
					alert(returnStr);
					$("#entity_list").trigger("reloadGrid");
				});
			}
				alert("删除成功！");
		}
		else{
			alert("请选择要删除的记录!"); 		
			}
	}
	
	// excel 导出 add by 陈煜霄
	function excel(){
	   var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		var id = gr;
	//	var urlStr = "<%=basePath%>stock/maintain_viewListStockMaintain.do?id="+gr;
		var urlStr = "com.tansun.eam2.stock.action.StockMaintainAction&com.tansun.eam2.stock.vo.StockQueryVO";
		var bankName = document.getElementById("bankName").value;
		var stockName = document.getElementById("stockName").value ;
		var stockSort = document.getElementById("stockSort").value ;
		var xmmc = document.getElementById("xmmc").value ;
		var cp = jQuery("#all_Attachment").getGridParam('page');
	    var ps = jQuery("#all_Attachment").getGridParam('rowNum');
	 	var params = "{\"stVO.bankName\":\"" + bankName + "\",";
			params += "\"stVO.stockName\":\"" + stockName + "\",";
			params += "\"stVO.stockSort\":\"" + stockSort + "\",";
			params += "\"stVO.xmmc\":\"" + xmmc + "\",";
			params += "\"stVO.sign\":" + 1 + ",";
			params += "\"paginator.currentPage\":\"" + 1 + "\",";
			params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("all_Attachment", urlStr, params, '对公客户列表','rn,cb');
	}

	function query(){
		var bankName = document.getElementById("bankName").value;
		var stockName = document.getElementById("stockName").value ;
		var stockSort = document.getElementById("stockSort").value ;
		var xmmc = document.getElementById("xmmc").value ;
			jQuery("#all_Attachment").setGridParam({postData:{
				'stVO.bankName':'' + bankName,
				'stVO.stockName':'' + stockName,
				'stVO.stockSort':'' + stockSort,
				'stVO.xmmc':'' + xmmc
			},
			url:"<%=basePath%>stock/maintain_viewListStockMaintain.do"
			}).trigger("reloadGrid");
	}


    function lookAsset(gr){
     var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0 ){
				alert("请选择要添加的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要添加的记录")
			}else{
			window.open('stock/maintain_detailInfo.do?saveSign='+1+'&stockId='+ gr,'',windowInfo);
			return false;
		}
    }
</script>
	
</head>
<base target="_self"/>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="">
<s:hidden name="sinfo.id" id="stockId"/>
<input type="hidden" name="headId"  id="headId" value="<%=headId %>" readonly="true" size="40" />
<table  width="100%" id="financialTable" class="newtable" align="center" cellpadding="0" cellspacing="0">
	<tr>
			<td class="td_zxy01">行名：</td>
			<td class="td_zxy02"><s:textfield name="stVO.bankName" id="bankName" /></td>
			<td class="td_zxy01">债券名称：</td>
			<td class="td_zxy02"><s:textfield name="stVO.stockName" id="stockName" /></td>	
	</tr>
	<tr>
			<td class="td_zxy01" >债券种类：</td>
			<td class="td_zxy02"><s:textfield name="stVO.stockSort" id="stockSort" /></td>
			<td class="td_zxy01">项目名称：</td>
			<td class="td_zxy02"><s:textfield name="stVO.xmmc" id="xmmc" /></td>
	</tr>
	<tr>
			<td class="td_zxy01" >债券状态：</td>
			<td class="td_zxy02"><s:textfield name="stVO.zqzt" id="zqzt" /></td>
			<td class="td_zxy01">&nbsp;</td>
			<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr>
	  <td class="td_zxy01" colspan="4">
	  <div align="right">
			<input type="button" value="查询" onClick="query();" />
			<input type="reset" value="重置" />
	  </td>
	 </tr>
</table>
<table id="all_Attachment"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">
	jQuery("#all_Attachment").jqGrid({
		postData:{'stVO.sign':1,id:'<%=headId%>'},
		datatype: "json",
		rownumbers:true,
		multiselect:true,
		colNames:['id','xmId','项目名称','债券种类','债券名称','行名','最新债券面值','到期日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'stockid',index:'stockid',hidden:true},
			{name:'xmmc',index:'xmmc'},
			{name:'zqzlmc',index:'zqzlmc',width:'70%'},
			{name:'zqmc',index:'zqmc'},
			{name:'jhfhmc',index:'jhfhmc',width:'70%'},
			{name:'zqmz',index:'zqmz',align:'right',formatter:'number',width:'70%'},
			{name:'dqr',index:'DQR',width:'50%'}
		],
		pager:'pgtoolbar1',
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		rowList:[10,20,30],
		ondblClickRow:function(gr){
		  lookAsset(gr);
		},
		caption:'债券明细信息',
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
				