<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	boolean isFuLn = false;
	isFuLn = "true".equals((String)request.getAttribute("isFuLn"))?true:false;
	boolean isEndInfo = false;
	isEndInfo = "true".equals((String)request.getAttribute("isEndInfo"))?true:false;
	String loansId = (String)request.getAttribute("loansId");
	String isfu = "";
	String isend = "";
	if(isFuLn){
		isfu = "1";
	}else if(isEndInfo){
		isend = "1";
	}
	boolean isbatch = false;
	isbatch = "true".equals((String)request.getAttribute("batch"))?true:false;
	String batch="";
	if(isbatch){
		batch="1";
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基金账户信息查询</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">系统基金账号：</td>
		<td class="td_zxy02"><s:textfield id="saAcctNo" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01"> 机构编号：</td>
        <td class="td_zxy02"><s:textfield id="saOpacInstnNo" cssClass="input" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01"> 客户名称：</td>
		<td class="td_zxy02"><s:textfield id="saCustName" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">币    种：</td>
		<td class="td_zxy02"><s:select list="#{'01':'人民币','13':'港币','14':'美元'}" cssClass="input" headerValue="" headerKey="" id="saCurrCod"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">客户编号：</td>
 		<td class="td_zxy02"><s:textfield id="saCustNo" cssClass="input" /></td>
        <td class="td_zxy01"> 一级分行：</td>
        <td class="td_zxy02"><e:select parRefKey="ENTITY_TRADE" cssClass="input" headerKey="" headerValue="" parentId="438" list="#{}" id="firstBranch"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">科目号：</td>
		<td class="td_zxy02"><s:textfield id="subCod" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">科目名称：</td>
		<td class="td_zxy02"><s:textfield id="subName" cssClass="input" onblur="isString(this);" /></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">
		</td>
	</tr> 
</table>
</form>
<table id="funcList"></table>
<div id="pgtoolbar1"></div>
<div id="topbar" style="width:100%;"></div>
<%@ include file="/inc/exportExcel.inc"%>    
<script type="text/javascript">
var idStr = new Array();
jQuery("#funcList").jqGrid({
	datatype: "json",
  	colNames:['系统基金帐号','客户基金账号','客户名称','客户编号','一级分行','币种', '可用余额','帐户余额','科目号','科目名称','经办行'],
  	colModel :[ 
	    {name:'saAcctNo', index:'saAcctNo',align:'center'},
	    {name:'saCustAcctNo', index:'saCustAcctNo',align:'center'},
		{name:'saCustName', index:'saCustName',align:'center'}, 
	    {name:'saCustNo', index:'saCustNo',align:'center'},
		{name:'firstBranch', index:'firstBranch',align:'center'}, 
	    {name:'saCurrCod', index:'saCurrCod',align:'center'}, 
	    {name:'saAvlBal', index:'saAvlBal',align:'center'}, 
	    {name:'saAcctBal', index:'saAcctBal',align:'center'},
	    {name:'subCod', index:'subCod',align:'center'}, 
	    {name:'subName', index:'subName',align:'center'}, 
	    {name:'saOpacInstnName', index:'saOpacInstnName',align:'center'}
  	],
  	pager:'pgtoolbar1',
  	ondblClickRow:function(gr){
		dbClickQuery(gr);
	},
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '基金账户信息',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
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
		var allIds = jQuery("#funcList").jqGrid('getDataIDs');
		for(var i = 0; i < allIds.length; i++){
			var index = idStr.indexOf(allIds[i]);
			if(index != -1){
				idStr.removeAt(index);
				jQuery("#funcList").setSelection(allIds[i]);
			}
		}
	},
	loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#funcList").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#funcList").setGridHeight(0);
			}		
		},			
	shrinkToFit:false,
	toolbar: [false,"top"],
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
}); 
		
// 设置宽度
$("#funcList").setGridWidth($("#topbar").width());
$(window).bind('resize',function(){
	$("#funcList").setGridWidth($("#topbar").width());
});

// 添加按钮
$(document).ready(function(){
	if('<%=isfu%>'=='1'){
		var buttonJSonString = '[{"buttonHandler":"guanlian","buttonIcon":"icon-ok","buttonText":"关联"},\
								 {"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
								 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出excel"}\
								]'; 
  	}else if('<%=isend%>'=='1'){
  		var buttonJSonString = '[{"buttonHandler":"chooseFunc","buttonIcon":"icon-ok","buttonText":"关联"},\
								 {"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
								 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出excel"}\
							  	]';
  	}else if('<%=batch%>'==1){
  		var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-ok","buttonText":"确定"},\
								 {"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
								 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出excel"}\
							  	]';
  	}else{
  		var buttonJSonString = '[{"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
								 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出excel"}\
								]';
		window.parent.clearPanelTool();
  	}
	addButtons(jQuery("#gview_funcList > .ui-jqgrid-titlebar"),buttonJSonString);
});

// 查询
function query(){
	var saOpacInstnNo = document.getElementById("saOpacInstnNo").value;//机构名称
	var firstBranch = document.getElementById("firstBranch").value; //一级机构
	var saCustName = document.getElementById("saCustName").value; //客户名称
	var saCurrCod = document.getElementById("saCurrCod").value;//币种
	var saCustNo = document.getElementById("saCustNo").value;//客户编号
	var subName = document.getElementById("subName").value;//科目名称
	var subCod = document.getElementById("subCod").value; // 科目号
	var saAcctNo = document.getElementById("saAcctNo").value;//系统基金号
	var url1 = "<%=basePath%>wtdk/funcQuery_query.do";
	jQuery("#funcList").setGridParam({postData:{
		'queryVO.saOpacInstnNo' : saOpacInstnNo,
		'queryVO.firstBranch' : firstBranch,
		'queryVO.saCustName' : saCustName,
		'queryVO.saCurrCod' : saCurrCod,
		'queryVO.saCustNo' : saCustNo,
		'queryVO.subName' : subName,
		'queryVO.subCod' : subCod,
		'queryVO.saAcctNo' : saAcctNo
	},
	url:'<%=basePath%>wtdk/funcQuery_query.do'
	}).trigger("reloadGrid");
}

// 详细
function queryMore(){
	var gr = idStr;
	if(gr.length==1 && gr!=""){
		var type = 'height=600, width=1211,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=0';
		var url = '<%=basePath%>wtdk/funcQuery_funcInfo.do?funcNo='+gr;
		window.open(url,'基金详细信息',type);
	}else{
		alert("请选择一条记录");
		return false;
	}
}

function dbClickQuery(gr){
	var type = 'height=600, width=1211,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=0';
	var url = '<%=basePath%>wtdk/funcQuery_funcInfo.do?funcNo='+gr;
	window.open(url,'基金详细信息',type);
}


function excelAll(){
//	var urlStr = '<%=basePath%>wtdk/funcQuery_query.do';
	var urlStr = 'com.tansun.eam2.wtdk.action.FuncQueryAction&com.tansun.eam2.wtdk.vo.FuncQueryVO';
	var saOpacInstnNo = document.getElementById("saOpacInstnNo").value;//机构名称
	var firstBranch = document.getElementById("firstBranch").value; //一级机构
	var saCustName = document.getElementById("saCustName").value; //客户名称
	var saCurrCod = document.getElementById("saCurrCod").value;//币种
	var saCustNo = document.getElementById("saCustNo").value;//客户编号
	var subName = document.getElementById("subName").value;//科目号
	var saAcctNo = document.getElementById("saAcctNo").value;//系统基金号
	var subCod = document.getElementById("subCod").value;
    //var cp = jQuery("#funcList").getGridParam('page');
    //var ps = jQuery("#funcList").getGridParam('rowNum');
    var params = "{\"queryVO.saOpacInstnNo\":\"" + saOpacInstnNo + "\",";
		params += "\"queryVO.firstBranch\":\"" + firstBranch + "\",";
		params += "\"queryVO.saCustName\":\"" + saCustName + "\",";
		params += "\"queryVO.saCurrCod\":\"" + saCurrCod + "\",";
		params += "\"queryVO.saCustNo\":\"" + saCustNo + "\",";
		params += "\"queryVO.subName\":\"" + subName + "\",";
		params += "\"queryVO.subCod\":\"" + subCod + "\",";
		params += "\"queryVO.saAcctNo\":\"" + saAcctNo + "\",";
		params += "\"paginator.currentPage\":\"" + 1 + "\",";
		params += "\"paginator.pageSize\":\"" + 1000000 + "\"}";
	exportExcel("funcList", urlStr, params, '基金信息列表','rn,cb');
}
// 导出excel
function excel(){
	var zs = jQuery("#funcList").getGridParam('records');
	if(zs>8000){
		if(confirm("导出数据过多，导出可能会导致死机，是否继续")){
			excelAll();
		}
	}else{
		excelAll();
	}
}

//勾选导出
function excelCheck(){
	var urlStr = '<%=basePath%>wtdk/funcQuery_excelCheck.do';
	var params = "{\"idStr\":\"" + idStr + "\"}";
	exportExcel("funcList", urlStr, params, '资产列表','rn,cb');
}

// 关联贷款账户
function guanlian(){
	var gr = idStr;
	if(gr.length == 1){
		window.opener.callBackRelate(gr);
		window.close();
	}else{ 
		alert("请选择一条记录！");
		return false;
	}
}

// 终止委托贷款查询
function chooseFunc(){
	var gr = idStr;
	if(gr.length == 1){
		window.opener.callBack(gr);
		window.close();
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 批量选择
function queding(){
	var gr = idStr;
	if(gr.length==0){
		alert('请至少选择一条记录');
		return false;
	}else{
		window.opener.callBackBatch(gr);
		window.close();
	}
}

</script>
</body>
</html>
