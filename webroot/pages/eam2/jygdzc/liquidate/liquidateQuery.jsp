<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>清算查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
    var idStr = new Array();
	jQuery("#purchase_list").setGridWidth($("#gridTable").width());
	$(window).bind('resize', function(){
		jQuery("#purchase_list").setGridWidth($("#gridTable").width());
	});
	$(function(){	
		if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
		var buttonaddJSonString = '[{"buttonHandler":"edit","buttonIcon":"icon-edit","buttonText":"填写实收"},\
									{"buttonHandler":"view","buttonIcon":"icon-search","buttonText":"查看清算信息"},\
									{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"条件导出"},\
									{"buttonHandler":"excel4Select","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
		]';
		addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonaddJSonString);
	});
	function query(){
		var qspc = document.getElementById("qspc").value;
		var htlx = document.getElementById("htlx").value;
		var jydx = document.getElementById("jydx").value;
		var qsrq1 = document.getElementById("qsrq1").value;
		var qsrq2 = document.getElementById("qsrq2").value;
		jQuery("#purchase_list").setGridParam({
			 url:'<%=basePath%>qs/liquidateQuery_query.do',
			 postData:{
			'queryVO.qspc' : qspc,
			'queryVO.htlx' : htlx,
			'queryVO.jydx' : jydx,
			'queryVO.qsrq1' : qsrq1,
			'queryVO.qsrq2' : qsrq2
		}}).trigger("reloadGrid");
	}
	
	// excel导出 add by 陈煜霄
	function excel(){
	  	//var urlStr = "<%=basePath%>qs/liquidateQuery_query.do";
	  	var urlStr ="com.tansun.eam2.jygdzc.action.LiquidateQueryContractAction&com.tansun.eam2.jygdzc.vo.ClearQueryVO";
	  	var qspc = document.getElementById("qspc").value;
		var htlx = document.getElementById("htlx").value;
		var jydx = document.getElementById("jydx").value;
		var qsrq1 = document.getElementById("qsrq1").value;
		var qsrq2 = document.getElementById("qsrq2").value;
	  	var cp = jQuery("#purchase_list").getGridParam('page');
   		var ps = jQuery("#purchase_list").getGridParam('rowNum');
	  	var params = "{\"queryVO.qspc\":\"" + qspc + "\",";
			params += "\"queryVO.htlx\":\"" + htlx + "\",";
			params += "\"queryVO.jydx\":\"" + jydx + "\",";
			params += "\"queryVO.qsrq1\":\"" + qsrq1 + "\",";
			params += "\"queryVO.qsrq2\":\"" + qsrq2 + "\"}";
			//params += "\"paginator.currentPage\":\"" + 1 + "\",";
			//params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("purchase_list", urlStr, params, '清算列表','rn,cb');
	}
	
	function excel4Select(){
	    //var idStr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(idStr!=null && idStr.length >= 1&&""!=idStr){
		    var urlStr ="<%=basePath%>qs/liquidateQuery_excel4Select.do";
			var params = "{\"idStr\":\"" + idStr + "\"}";
			exportExcel("purchase_list", urlStr, params, '清算列表','rn,cb');
		}else{
			alert("请先选择数据");
		}
	}

	function view(){
		var headId = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(headId.length==1&&headId==""){
			alert("请选择记录！");
			return false;
		}else if(headId.length == 1&&headId!=""){
			var qslx = jQuery("#purchase_list").getCell(headId,'qslx');
			if(qslx=="委管合同"){
				var url = '<%=basePath%>htqs/ContractQuery_list1.do?edit=view&headId='+headId+"&qslx=weiguan";
				window.open(url,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				//window.open(url);
				return false;
			}
			var url = '<%=basePath%>htqs/ContractQuery_list1.do?edit=view&headId='+headId;
			window.open(url,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			//window.open(url);
		}else{ 
			alert("请选择一条记录!");
		}
	}
	function edit(){
		var headId = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(headId.length==1&&headId==""){
			alert("请选择记录！");
			return false;
		}else if(headId.length == 1&&headId!=""){
			var qslx = jQuery("#purchase_list").getCell(headId,'qslx');
			if(qslx=="委管合同"){
				alert("委管合同不需要录入实收!");
				return false;
			}
			var url = '<%=basePath%>htqs/ContractQuery_list1.do?edit=edit&headId='+headId;
			window.open(url,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			//window.open(url);
		}else{ 
			alert("请选择一条记录!");
		}
	}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<input type="hidden" name="sheettype" vaue=""  id="sheettype"/>
<table id="gridTable" width="100%" border="0" class="newtable" align="center" cellpadding="0" cellspacing="0">
  	<tr>
	    <td   class="td_ylp01">清算批次：</td>
	    <td class="td_ylp02">
	    	<s:textfield id="qspc"/>
	    </td>
	    <td class="td_ylp01">合同类型：</td>
	    <td class="td_ylp03">
	    	<s:select list="#{'':'','2':'租赁合同','1':'委管合同'}"  id="htlx" />
	   	</td>
	    <td class="td_ylp01">交易对象：</td>
	    <td class="td_ylp02">
	    	<s:select list="#{'':'','1':'建行','2':'非建行'}"  id="jydx" />
	    </td>
  	</tr>
  	<tr>
	    <td class="td_ylp01">拟稿日期： </td>
	    <td class="td_ylp02"  colspan="3"> 从
	      <s:textfield id="qsrq1" />到： <s:textfield id="qsrq2" />  
	     </td>
	     <td class="td_form01">&nbsp; </td>
	    <td class="td_form02"  colspan="3">&nbsp;</td>
  	</tr>
	<tr>
		<td class="td_form01" colspan="6" >
	    <input type="button"  value="查询" onclick="query();"/>
	    <input type="button"  value="重置" onClick="javascript:window.location.reload();"/>    
        </td>
  	</tr>
</table>

<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  	<tr>
		<td align="right">
			<table id="purchase_list"></table>
		  	<div id="pgtoolbar1"></div>
	 	</td>
 	</tr>
</table>
<%@ include file="/inc/exportExcel.inc"%>

</body>
</html>
<script type="text/javascript">
	jQuery("#purchase_list").jqGrid({       
		datatype: "json",
	    colNames: ['id','清算批次','交易对象','清算类型','拟稿日期','应收总金额','调整应收总金额','调整后应收总金额','实收总金额','变动总金额','合同数量'],			
	    colModel: [
	    	{ name: 'id', index: 'qspc', align: "center",hidden:true},
		    { name: 'qspc', index: 'qspc', align: "center",width:100},
		    { name: 'jydx', index: 'jydx', align: "center",width:100},
		    { name: 'qslx', index: 'qslx', align: "center",width:100},
		    { name: 'ngrq', index: 'ngrq',align: "center",width:100},
		    { name: 'yszj', index: 'yszj', align: "center",width:100},
		    { name: 'tzzj',index: 'tzzj', align: "center",width:100},	
		    { name: 'xghyszj',index: 'xghyszj', align: "center",width:120},	
		    { name: 'sszj',index: 'xghyszj', align: "center",width:100},	
		    { name: 'bcbdje',index: 'xghyszj', align: "center",width:100},	
		    { name: 'counts',index: 'counts',align: "center",width:100}	
    	],
    	loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#purchase_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
	    pager:'pgtoolbar1',
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '清算查询',
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		//双击事件查看详细
		ondblClickRow:function(){
			view();
		},
		onSelectRow: function(rowid, status){
			if(status){
				idStr.insert(idStr.length, rowid);
			}else{
				idStr.remove(rowid);
			}
		},
		onSelectAll:function(ids, status){
			if(status){
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index == -1){
							idStr.insert(idStr.length, ids[i]);
						}
					}
				}
			}else{
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index != -1){
							idStr.removeAt(index);
						}
					}
				}
			}
		},
		gridComplete:function(){
			var allIds = jQuery("#purchase_list").jqGrid('getDataIDs');
			for(var i = 0; i < allIds.length; i++){
				var index = idStr.indexOf(allIds[i]);
				if(index != -1){
					idStr.removeAt(index);
					jQuery("#purchase_list").setSelection(allIds[i]);
				}
			}
		},
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
	// 日期转换
$(function(){
	$("#qsrq1,#qsrq2").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
}); 
      // 刷新
function reloadJqGrid(){
	jQuery("#purchase_list").trigger("reloadGrid");
}                        
</script>


