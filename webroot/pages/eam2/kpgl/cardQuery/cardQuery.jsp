<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%
	String cardTypeFlag = (String)request.getAttribute("cardTypeFlag");
	boolean isbatch = false;
	String batch = "";
	isbatch = "true".equals((String)request.getAttribute("batch"))?true:false;
	if(isbatch){
		batch = "1";
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片查询</title>
<script type="text/javascript">
$(function(){
	if(window.parent.clearPanelTool){
	window.parent.clearPanelTool();
}
});
var idStr = new Array();
function openTreeByType(type4Card){
	var cardType = '<%=request.getParameter("cardType")%>';
	var nodeValue = null;
	if(type4Card =='glbm'||type4Card =='sybm'){
		isSYBMorGLBM = type4Card;
		type4Card = 'department'
	}
	var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card+"&nodeValue="+nodeValue;
	var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
	window.open(url,'',_g_privateDialogFeatures);
}
var isSYBMorGLBM = null;//弹出树是否为管理部门或使用部门
function getCallBack4Tree(type4Card,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
	if(type4Card=='department'){
		type4Card = isSYBMorGLBM;
	}
	document.getElementById(type4Card+"hiddenid").value = id;
	document.getElementById(type4Card+"value").value 	= value;
}
function alerts(){
	var s = document.getElementById("s").value;
	alert(s);
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form>
<table id="conditions" width="100%" border="0" align="center"
	cellpadding="0" class="newtable" cellspacing="0">
	<tr>
		<td class="td_form01">卡片编号：</td>
		<td class="td_form02">
			<s:textfield name="card.cardcode" id="cardcode" ></s:textfield>
		</td>
		<td class="td_form01">卡片名称：</td>
		<td class="td_form02">
			<s:textfield name="card.zcname" id="zcname" ></s:textfield>
		</td>
		<td class="td_form01">卡片类型</td>
		<td class="td_form02">
			<%if(cardTypeFlag != null && cardTypeFlag != ""){%>
			<s:select name="card.parentid" id='parentid' list ="cardTypeList"
					listKey ="categoryid" listValue ="categoryname" headerKey="" headerValue ="" />
			<%}else{%>			
			<e:select parRefKey="CARD_TYPE" list="#{}" name="card.parentid" headerKey="" headerValue ="" id="parentid"/>
			<%} %>	
		</td>
	</tr>
	<tr>
		<td class="td_form01">是否承继：</td>
		<td class="td_form02">
			<s:select id="ifjc" list="#{'':'',1:'否',0:'是'}" name="card.ifjc"></s:select>
		</td>
		<td class="td_form01">管理部门：</td>
		<td class="td_form02">
			<s:textfield name="glbmvalue" id="glbmvalue" size="30" readonly="true"/>
      		<s:hidden name='card.glbm' id='glbmhiddenid'></s:hidden>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('glbm');" width="21" height="20" align="absmiddle">
		</td>
		<td class="td_form01">使用部门：</td>
		<td class="td_form02">
			<s:textfield name="sybmvalue" id="sybmvalue" size="30" readonly="true"/>
      		<s:hidden name='card.usepartment' id='sybmhiddenid'></s:hidden>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('sybm');" width="21" height="20" align="absmiddle">
		</td>
	</tr>
	<tr>
		<td class="td_form01">卡片状态：</td>
		<td class="td_form02">
			<s:select id="state" list="#{'':'','01':'正在使用','02':'空闲状态','03':'退役'}" name="card.state"></s:select>
		</td>
		<td class="td_form01">资产编号：</td>
		<td class="td_form02">
			<s:textfield name="zcbh" id="zcbh"></s:textfield>
		</td>
		<td class="td_form01">资产名称：</td>
		<td class="td_form02">
			<s:textfield name="zcmc" id="zcmc"></s:textfield>
		</td>
	</tr>
	<tr>
		<td class="td_form01">一级分行：</td>
		<td class="td_form02">
			<!-- <e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="card.firstbranch" id="firstbranch"/> -->
			<s:textfield id="firstText" readonly="true" ></s:textfield>
			<s:hidden name='firstbranch' id="firstbranch"></s:hidden>
			<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openFirst();" width="21" height="20" >
		</td>
		<td class="td_form01">是否自用：</td>
		<td class="td_form02">
			<s:select id="sfzy" list="#{'':'','0':'否','1':'是'}" name="card.sfzy"></s:select>
		</td>
		<td class="td_form01">&nbsp;</td>
		<td class="td_form02">&nbsp;
		</td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查 询" onclick="ptQuery();">
			<s:reset value="重 置" ></s:reset>
			<!-- <input type="button" value="高级查询" class="buttonface" onclick="advancedQuery();"> -->
		</td>
	</tr>
</table>

<table class="newtable" align="center" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td align="right">
			<table id="reason_list"></table>
			<div id="pgtoolbar1"></div>
		</td>
	</tr>
</table>

<s:hidden name="startQYTime" id="startQYTime" ></s:hidden>
<s:hidden name="endQYTime" id="endQYTime" ></s:hidden>
<s:hidden name="startLRTime" id="startLRTime" ></s:hidden>
<s:hidden name="endLRTime" id="endLRTime" ></s:hidden>
<s:hidden name="card.yxtlry" id="yxtlry" ></s:hidden>
<s:hidden name="card.saveadsress" id="saveadsress"></s:hidden>
<s:hidden name="card.rzkm" id="rzkm"></s:hidden>
</s:form>
<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>

<script type="text/javascript">
// 打开高级查询页面
function advancedQuery(){
	window.open('<%=basePath%>/kpgl/cardQuery_advancedInit.do','','height=500, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
}

// excel导出
function excel(){
	var urlStr = '<%=basePath%>kpgl/cardQuery_query.do';
	
	var cardcode = document.getElementById("cardcode").value;
	var zcname = document.getElementById("zcname").value;
	var kplx = document.getElementById("parentid").value;
	var ifjc = document.getElementById("ifjc").value;
	var glbm = document.getElementById("glbmhiddenid").value;
	var usepartment = document.getElementById("sybmhiddenid").value;
	
	var state = document.getElementById("state").value;
	var zcbh = document.getElementById("zcbh").value;
	var zcmc = document.getElementById("zcmc").value;
	var firstbranch = document.getElementById("firstbranch").value;
	var sfzy = document.getElementById("sfzy").value;
	var startQYTime = document.getElementById("startQYTime").value;
	
	var endQYTime = document.getElementById("endQYTime").value;
	var startLRTime = document.getElementById("startLRTime").value;
	var endLRTime = document.getElementById("endLRTime").value;
	var yxtlry = document.getElementById("yxtlry").value;
	var saveadsress = document.getElementById("saveadsress").value;
	var rzkm = document.getElementById("rzkm").value;
    
    var cp = jQuery("#reason_list").getGridParam('page');
    var ps = jQuery("#reason_list").getGridParam('rowNum');
    var params = "{\"queryVO.cardcode\":\"" + cardcode + "\",";
		params += "\"queryVO.zcname\":\"" + zcname + "\",";
		params += "\"queryVO.kplx\":\"" + kplx + "\",";
		params += "\"queryVO.ifjc\":\"" + ifjc + "\",";
		params += "\"queryVO.glbm\":\"" + glbm + "\",";
		params = "{\"queryVO.usepartment\":\"" + usepartment + "\",";
		
		params += "\"queryVO.state\":\"" + state + "\",";
		params += "\"queryVO.zcbh\":\"" + zcbh + "\",";
		params += "\"queryVO.zcmc\":\"" + zcmc + "\",";
		params += "\"queryVO.firstbranch\":\"" + firstbranch + "\",";
		params += "\"queryVO.sfzy\":\"" + sfzy + "\",";
		params += "\"queryVO.startQYTime\":\"" + startQYTime + "\",";
		
		params += "\"queryVO.endQYTime\":\"" + endQYTime + "\",";
		params += "\"queryVO.startLRTime\":\"" + startLRTime + "\",";
		params += "\"queryVO.endLRTime\":\"" + endLRTime + "\",";
		params += "\"queryVO.yxtlry\":\"" + yxtlry + "\",";
		params += "\"queryVO.saveadsress\":\"" + saveadsress + "\",";
		params += "\"queryVO.rzkm\":\"" + rzkm + "\",";
		
		params += "\"paginator.currentPage\":\"" + cp + "\",";
		params += "\"paginator.pageSize\":\"" + ps + "\"}";
	exportExcel("reason_list", urlStr, params, '卡片信息列表','rn,cb');
}

// 普通查询
function ptQuery(){
	var cardcode = document.getElementById("cardcode").value;
	var zcname = document.getElementById("zcname").value;
	var kplx = document.getElementById("parentid").value;
	var ifjc = document.getElementById("ifjc").value;
	var glbm = document.getElementById("glbmhiddenid").value;
	var usepartment = document.getElementById("sybmhiddenid").value;
	
	var state = document.getElementById("state").value;
	var zcbh = document.getElementById("zcbh").value;
	var zcmc = document.getElementById("zcmc").value;
	var firstbranch = document.getElementById("firstbranch").value;
	var sfzy = document.getElementById("sfzy").value;
	var startQYTime = document.getElementById("startQYTime").value;
	
	var endQYTime = document.getElementById("endQYTime").value;
	var startLRTime = document.getElementById("startLRTime").value;
	var endLRTime = document.getElementById("endLRTime").value;
	var yxtlry = document.getElementById("yxtlry").value;
	var saveadsress = document.getElementById("saveadsress").value;
	var rzkm = document.getElementById("rzkm").value;
	jQuery("#reason_list").setGridParam({postData:{
		'queryVO.cardcode' : cardcode,'queryVO.zcname' : zcname,'queryVO.kplx' : kplx,
		'queryVO.ifjc' : ifjc,'queryVO.glbm' : glbm,'queryVO.usepartment' : usepartment,
		'queryVO.state' : state,'queryVO.zcbh' : zcbh,'queryVO.zcmc' : zcmc,
		'queryVO.firstbranch' : firstbranch,'queryVO.sfzy' : sfzy,'queryVO.startQYTime' : startQYTime,
		'queryVO.endQYTime' : endQYTime,'queryVO.startLRTime' : startLRTime,'queryVO.endLRTime' : endLRTime,
		'queryVO.yxtlry' : yxtlry,'queryVO.saveadsress' : saveadsress,'queryVO.rzkm' : rzkm
	},
	url:"<%=basePath%>kpgl/cardQuery_query.do"
	}).trigger("reloadGrid");
}

</script>

<script type="text/javascript">
jQuery("#reason_list").jqGrid({				
	datatype: "json",
   	colNames:['id','卡片编号','卡片名称','卡片类型','卡片状态','资产编号','资产名称','存放地点','使用部门','管理部门','一级分行','是否承继','是否自用'],
	colModel:[
		{name:'id',index:'id',editable:true,editoptions:{size:61},hidden:true},
		{name:'cardcode',index:'cardcode',editable:true,editoptions:{size:61},sortable:false},					
		{name:'zcname',index:'zcname',editable:true,editoptions:{size:61},sortable:false},
		{name:'kplx',index:'glbm',editable:true,editoptions:{size:61},sortable:false},
		{name:'state',index:'glbm',editable:true,editoptions:{size:61},sortable:false},
		{name:'zcbh',index:'zcbh',editable:true,editoptions:{size:61},sortable:false},
		{name:'zcmc',index:'zcmc',editable:true,editoptions:{size:61},sortable:false},
		{name:'saveadsress',index:'saveadsress',editable:true,editoptions:{size:61},sortable:false},
		{name:'usepartment',index:'usepartment',editable:true,editoptions:{size:61},sortable:false},
		{name:'glbm',index:'glbm',editable:true,editoptions:{size:61},sortable:false},
		{name:'firstbranch',index:'firstbranch',editable:true,editoptions:{size:61},sortable:false},
		{name:'ifjc',index:'glbm',editable:true,editoptions:{size:61},sortable:false},
		{name:'sfzy',index:'glbm',editable:true,editoptions:{size:61},sortable:false}
	],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '卡片列表',
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
		var allIds = jQuery("#reason_list").jqGrid('getDataIDs');
		for(var i = 0; i < allIds.length; i++){
			var index = idStr.indexOf(allIds[i]);
			if(index != -1){
				idStr.removeAt(index);
				jQuery("#reason_list").setSelection(allIds[i]);
			}
		}
	},
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#reason_list").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#reason_list").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
jQuery("#reason_list").setGridWidth($("#conditions").width());
$(window).bind('resize', function(){
	jQuery("#reason_list").setGridWidth($("#conditions").width());
});

$(document).ready(function(){	
    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
    var isQuery = '${isQuery}';
    if(isQuery=='true'){
   		var buttonJSonString = '[ {"buttonHandler":"chakan","buttonIcon":"icon-add","buttonText":"查看详情"},\
   								  {"buttonHandler":"excelCheck","buttonIcon":"icon-redo","buttonText":"导出"}\
   								]';
    }else if('<%=batch%>' == '1'){
    	var buttonJSonString = '[{"buttonHandler":"quedingbatch","buttonIcon":"icon-ok","buttonText":"确定"},\
							 	 {"buttonHandler":"chakan","buttonIcon":"icon-add","buttonText":"查看详情"},\
							 	 {"buttonHandler":"excelCheck","buttonIcon":"icon-redo","buttonText":"导出"}\
								]';
    }else{
		var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-add","buttonText":"确定"},\
							 	 {"buttonHandler":"chakan","buttonIcon":"icon-add","buttonText":"查看详情"},\
							 	 {"buttonHandler":"excelCheck","buttonIcon":"icon-redo","buttonText":"导出"}\
								]';
	}
	addButtons(jQuery("#gview_reason_list > .ui-jqgrid-titlebar"),buttonJSonString);
});

//勾选导出
function excelCheck(){
	var urlStr = '<%=basePath%>kpgl/cardQuery_excelCheck.do';
	var params = "{\"idStr\":\"" + idStr + "\"}";
	if(idStr!=''&&idStr!=null&&idStr.length>0){
		exportExcel("reason_list", urlStr, params, '资产列表','rn,cb');
	}else{
		alert('请先选择一条或多条记录！');
		return false;
	}
}

function queding(){
	var gr = jQuery("#reason_list").jqGrid('getGridParam','selarrrow');
	if(gr==""){
		alert("请选择卡片！");
		return false;
	}
	if(gr.length == 1){
		var state = jQuery("#reason_list").getCell(gr,"state");
		if(state=="退役"){
			alert("退役的卡片不能选择");
			return;
		}
		window.opener.getBodyInfo(gr);
		window.close();	
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 批量选择
function quedingbatch(){
	var gr = idStr;
	if(gr.length<1){
		alert("请选择卡片！");
		return false;
	}
	window.opener.callBackBatch(gr);
	window.close();
}

// 查看详细信息
function chakan(){
	var gr = jQuery("#reason_list").jqGrid('getGridParam','selarrrow');
	if(gr==""){
		alert("请选择卡片！");
		return false;
	}
	if(gr.length == 1){
		var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
		window.open('<%=basePath%>kpgl/cardQuery_cardInfo.do?cardId='+gr+"&cardInfoType=cardInfo", '详情',_g_privateDialogFeatures);
		//window.open('<%=basePath%>kpgl/cardQuery_cardInfo.do?cardId='+gr+"&cardInfoType=cardInfo");
	}else{ 
		alert("请选择一条记录");
		return false;
	}
}

// 打开一级分行选择页面
function openFirst(){
	var url = "<%=request.getContextPath()%>/kpgl/cardQuery_openFirst.do";
	var _g_privateDialogFeatures = 'height=500, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=500,top=10';
	window.open(url,'',_g_privateDialogFeatures);
}

function fuzhi(intvalue,text){
	document.getElementById('firstbranch').value=intvalue;
	document.getElementById('firstText').value=text;
}
</script>