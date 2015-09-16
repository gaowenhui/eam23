<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String ispgsc = (String)request.getAttribute("ispgsc");
	String option="";
	if(request.getParameter("option")!=null){
		option=request.getParameter("option");
	}
	String optionType = request.getParameter("optionType");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>贷款账户信息查询</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden value="%{#request.ctlButton}" id="ctlButton"></s:hidden>
<s:hidden value="%{#request.assetType}" id="assetType"></s:hidden>
<s:hidden value="%{#request.zcczCldId}" id="zcczCldId"></s:hidden>
<s:hidden value="%{#request.zcczpg}" id="zcczpg"></s:hidden>
<form>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
	    <td class="td_zxy01"> 系统贷款账号： </td>
	    <td class="td_zxy02"><s:textfield cssClass="input" id="lnLnAcctNo"  /></td>
	    <td class="td_zxy01"> 机构编号：</td>
	    <td class="td_zxy02"><s:textfield id="branchNo" cssClass="input" /></td>
	</tr>
  	<tr>
	    <td class="td_zxy01"> 客户编号：</td>
	    <td class="td_zxy02"><s:textfield cssClass="input" id="lnCustNo" /></td>
	    <td class="td_zxy01"> 币种：</td>
	    <td class="td_zxy02"><s:select list="#{'01':'人民币','13':'港币','14':'美元'}" cssClass="input" headerValue="" headerKey="" id="lnCurrCod"/></td>
  	</tr>
  	<tr>
	    <td class="td_zxy01"> 客户名称： </td>
	    <td class="td_zxy02"><s:textfield cssClass="input" id="lnCustName" /></td>
   	    <td class="td_zxy01"> 一级分行： </td>
	    <td class="td_zxy02"><e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" cssClass="input" id="firstBranch"/></td>
  	</tr>
  	<tr>
	    <td class="td_zxy01">贷款总额范围(元) 从：</td>
	    <td class="td_zxy02"><s:textfield cssClass="input" id="beforeAmt" onblur="checkFloat(this);" /></td>
	    <td class="td_zxy01">到：</td>
	    <td class="td_zxy02"><s:textfield cssClass="input" id="endAmt" onblur="checkFloat(this);" /></td>
  	</tr>
  	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
			<input type="reset" value="重置" class="buttonface">	
		</td>
	</tr>
</table>
</form>
<table id="loanslist"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">
var idStr = new Array();
jQuery("#loanslist").jqGrid({
	datatype: "json",
	colNames:['系统贷款帐号','客户贷款账号','客户名称','一级分行','机构编号','币种', '贷款总额','贷款余额','科目号','经办行'],
	colModel :[ 
		{name:'lnLnAcctNo', index:'lnLnAcctNo',align:'center'}, 
		{name:'lnCAcctNo', index:'lnCAcctNo',align:'center'},
		{name:'lnCustName', index:'lnCustName',align:'center'}, 
		{name:'firstBranch', index:'firstBranch',align:'center'},
		{name:'branchNo', index:'branchNo',align:'center'}, 
		{name:'lnCurrName', index:'lnCurrName',align:'center'}, 
		{name:'lnTotlLnAmtHypoAmt', index:'lnTotlLnAmtHypoAmt',align:'center'},			 
		{name:'lnLnBal', index:'lnLnBal',align:'center'},
		{name:'kmbh', index:'kmbh',align:'center'},	
		{name:'branchName', index:'branchName',align:'center'}
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
	caption: '贷款账户信息',
	rowNum:10,
	onSelectRow: function(rowid, status){
			if(status){
				idStr.insert(idStr.length, rowid);
			}else{
				idStr.remove(rowid);
			}
		},
	gridComplete:function(){
			var allIds = jQuery("#loanslist").jqGrid('getDataIDs');
			for(var i = 0; i < allIds.length; i++){
				var index = idStr.indexOf(allIds[i]);
				if(index != -1){
					idStr.removeAt(index);
					jQuery("#loanslist").setSelection(allIds[i]);
				}
			}
		},
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	toolbar: [false,"top"],
	loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#loanslist").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#loanslist").setGridHeight(0);
			}		
		},			
	shrinkToFit:false,
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
}); 

//设置宽度
$("#loanslist").setGridWidth($("#conditions").width());
$(window).bind('resize',function(){
	$("#loanslist").setGridWidth($("#conditions").width());
});

// 添加按钮
$(document).ready(function(){	

	if("<%=option%>"=="ssgl"){
		var buttonJSonString = '[{"buttonHandler":"confirmWd","buttonIcon":"icon-ok","buttonText":"确定"}]';
	}else{
								 //{"buttonHandler":"dizhi","buttonIcon":"icon-ok","buttonText":"抵质押物信息"},\
		var buttonJSonString = '[{"buttonHandler":"danxian","buttonIcon":"icon-ok","buttonText":"担险信息"},\
								 {"buttonHandler":"guanlian","buttonIcon":"icon-ok","buttonText":"关联基金账户"},\
								 {"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
							 	 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出excel"}\
								]';
		if(window.parent.clearPanelTool)
		window.parent.clearPanelTool();
	}
	addButtons(jQuery("#gview_loanslist > .ui-jqgrid-titlebar"),buttonJSonString);
});


function confirmWd(){
	var gr = jQuery("#loanslist").jqGrid('getGridParam','selarrrow');
	//诉讼管理选择债权，返回id 和名称 xuecj 2011-01-05  
	if(isSingle(gr)){
	var lnCustName = jQuery("#loanslist").getCell(gr,'lnCustName');
	window.opener.addValue(gr,lnCustName)
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
// 查询
function query(){
	var start = parseFloat(document.getElementById('beforeAmt').value);
	var end = parseFloat(document.getElementById('endAmt').value);
	if(start!='' && end!='' && start > end){
		alert('金额范围输入不正确，请重新输入');
		return false;
	}
	var branchNo = document.getElementById("branchNo").value;//机构编号
	var firstBranch = document.getElementById("firstBranch").value; //一级机构
	var lnCustNo = document.getElementById("lnCustNo").value; //客户编号
	var lnCurrCod = document.getElementById("lnCurrCod").value;//币种
	var lnCustName = document.getElementById("lnCustName").value;//客户名称
	var lnLnAcctNo = document.getElementById("lnLnAcctNo").value;//系统贷款账号
	var beforeAmt = document.getElementById("beforeAmt").value;//贷款总额 从
	var endAmt = document.getElementById("endAmt").value;//贷款总额 到
	var url1 = "<%=basePath%>wtdk/loansQuery_query.do";
	jQuery("#loanslist").setGridParam({postData:{
		'queryVO.branchNo' : branchNo,
		'queryVO.firstBranch' : firstBranch,
		'queryVO.lnCustNo' : lnCustNo,
		'queryVO.lnCurrCod' : lnCurrCod,
		'queryVO.lnCustName' : lnCustName,
		'queryVO.lnLnAcctNo' : lnLnAcctNo,
		'queryVO.beforeAmt' : beforeAmt,
		'queryVO.endAmt' : endAmt
	},
	url:'<%=basePath%>wtdk/loansQuery_query.do'
	}).trigger("reloadGrid");
}

// 详细
function queryMore(){
	var ctlButton = document.getElementById("ctlButton").value;
	var assetType = document.getElementById("assetType").value;
	var zcczCldId = document.getElementById("zcczCldId").value;
	var zcczpg = document.getElementById("zcczpg").value;
	var gr = jQuery("#loanslist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 1 && gr!=""){
		var id = (gr+"").replace("#","DGL"); // 因为gr里面带有#传action传不过去所以先替换成DGL 到后台再替换回来
		var url1 = '<%=request.getContextPath()%>/wtdk/loansQuery_loansInfoNew.do?newAdd=1&fslx=3&lnNo='+gr+'&ctlButton='+ctlButton+'&assetType='+assetType+'&zcczpg='+zcczpg+'&zcczCldId='+zcczCldId;
		var url = '<%=basePath%>wtdk/loansQuery_loansInfoNew.do?lnNo='+id;
		window.open(url1,'贷款详细信息','height=600, width=1100,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0');
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 详细
function dbClickQuery(gr){
	var ispgsc = '<%=ispgsc%>';
	var ctlButton = document.getElementById("ctlButton").value;
	var assetType = document.getElementById("assetType").value;
	var zcczCldId = document.getElementById("zcczCldId").value;
	var zcczpg = document.getElementById("zcczpg").value;
	var id = (gr+"").replace("#","DGL"); // 因为gr里面带有#传action传不过去所以先替换成DGL 到后台再替换回来
	var url1 = '<%=request.getContextPath()%>/wtdk/loansQuery_loansInfoNew.do?optionType=<%=optionType%>&option=<%=option %>&newAdd=1&fslx=3&lnNo='+gr+'&ctlButton='+ctlButton+'&assetType='+assetType+'&zcczpg='+zcczpg+'&zcczCldId='+zcczCldId+'&ispgsc='+ispgsc;
	var url = '<%=basePath%>wtdk/loansQuery_loansInfoNew.do?lnNo='+id;
	window.open(url1,'贷款详细信息','height=600, width=1100,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0');
}

function excelAll(){
 	//var urlStr = '<%=basePath%>wtdk/loansQuery_query.do';
	var urlStr = 'com.tansun.eam2.wtdk.action.LoansQueryAction&com.tansun.eam2.wtdk.vo.LoansQueryVO';	
	var branchNo = document.getElementById("branchNo").value;//机构编号
	var firstBranch = document.getElementById("firstBranch").value; //一级机构
	var lnCustNo = document.getElementById("lnCustNo").value; //客户编号
	var lnCurrCod = document.getElementById("lnCurrCod").value;//币种
	var lnCustName = document.getElementById("lnCustName").value;//客户名称
	var lnLnAcctNo = document.getElementById("lnLnAcctNo").value;//系统贷款账号
	var beforeAmt = document.getElementById("beforeAmt").value;//贷款总额 从
	var endAmt = document.getElementById("endAmt").value;//贷款总额 到
    //var cp = jQuery("#loanslist").getGridParam('page');
    //var ps = jQuery("#loanslist").getGridParam('rowNum');
    var params = "{\"queryVO.branchNo\":\"" + branchNo + "\",";
		params += "\"queryVO.firstBranch\":\"" + firstBranch + "\",";
		params += "\"queryVO.lnCustNo\":\"" + lnCustNo + "\",";
		params += "\"queryVO.lnCurrCod\":\"" + lnCurrCod + "\",";
		params += "\"queryVO.lnCustName\":\"" + lnCustName + "\",";
		params += "\"queryVO.lnLnAcctNo\":\"" + lnLnAcctNo + "\",";
		params += "\"queryVO.beforeAmt\":\"" + beforeAmt + "\",";
		params += "\"queryVO.endAmt\":\"" + endAmt + "\",";
		params += "\"paginator.currentPage\":\"" + 1 + "\",";
		params += "\"paginator.pageSize\":\"" + 1000000 + "\"}";
	exportExcel("loanslist", urlStr, params, '贷款信息列表','rn,cb');
}

// 导出excel
function excel(){
   var zs = jQuery("#loanslist").getGridParam('records');
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
	var urlStr = '<%=basePath%>wtdk/loansQuery_excelCheck.do';
	var params = "{\"idStr\":\"" + idStr + "\"}";
	exportExcel("loanslist", urlStr, params, '资产列表','rn,cb');
}

// 担险信息
function danxian(){
	var gr = jQuery("#loanslist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 1  && gr!="" ){
		var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=0';
		var url = '<%=basePath%>wtdk/loansQuery_loansRisk.do?lnNo='+gr;
		window.open(url,'贷款担险信息',type);
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 关联基金账户
function guanlian(){
	var gr = jQuery("#loanslist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 1  && gr!="" ){
		var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
		window.open('<%=basePath%>wtdk/loansQuery_loansRelateToFunc.do?loansId='+gr,'贷款关联基金账户',type);
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 抵质押物信息
function dizhi(){
	var ctlButton = document.getElementById("ctlButton").value;
	var assetType = document.getElementById("assetType").value;
	var zcczCldId = document.getElementById("zcczCldId").value;
	var zcczpg = document.getElementById("zcczpg").value;
	var gr = jQuery("#loanslist").jqGrid('getGridParam','selarrrow');
	if(gr.length == 1  && gr!="" ){
		var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=0';
		//window.open('<%=request.getContextPath()%>/stgl/weihu_newEntity.do?newAdd=1&fslx=3&loansId='+gr+'&ctlButton='+ctlButton+'&assetType='+assetType+'&zcczpg='+zcczpg+'&zcczCldId='+zcczCldId,'抵质押物信息',type);
		window.open('<%=request.getContextPath()%>/wtdk/loansQuery_dizhiyawu.do?newAdd=1&fslx=3&loansId='+gr+'&ctlButton='+ctlButton+'&assetType='+assetType+'&zcczpg='+zcczpg+'&zcczCldId='+zcczCldId,'抵质押物信息',type)
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

</script>
<%@ include file="/inc/exportExcel.inc"%>
</body>
</html>
