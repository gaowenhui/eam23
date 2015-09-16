<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
		String contractType = (String)request.getAttribute("contractType");
		boolean returnValue = false;
		returnValue = "true".equals((String) request.getAttribute("returnValue")) ? true : false;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>合同查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	var idStr = new Array();
	$(function(){	
		if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
		var buttonaddJSonString = '[{"buttonHandler":"view","buttonIcon":"icon-search","buttonText":"查看"},\
									{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"条件导出"},\
									{"buttonHandler":"excel4Elect","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
		]';
		addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonaddJSonString);
		if($("#sheettype").val() == "liquidate"){
			$("#htlx").val(<%=contractType%>);
			$("#htlx").attr("disabled","true");
		}
	});
	function query(){
	var strurl = "";
	<%if("1".equals(contractType)||"2".equals(contractType)){%>
		strurl = "<%=basePath%>htqs/ContractQuery_query1.do";
	<%}else {%>
		strurl = "<%=basePath%>htqs/ContractQuery_query.do";
	<%}%>
		var htbm = document.getElementById("htbm").value;
		var htzt = document.getElementById("htzt").value;
		var htlx = document.getElementById("htlx").value;
		var htxzngbm = document.getElementById("htxzngbm").value;
		var zcbm = document.getElementById("zcbm").value;
		var zcmc = document.getElementById("zcmc").value;
		var beginTime1 = document.getElementById("beginTime1").value;
		var beginTime2 = document.getElementById("beginTime2").value;
		var endTime1 = document.getElementById("endTime1").value;
		var endTime2 = document.getElementById("endTime2").value;
		jQuery("#purchase_list").setGridParam({
			url:strurl,
			postData:{
				'queryVO.htbm':htbm,
				'queryVO.htzt':htzt,
				'queryVO.htlx':htlx,
				'queryVO.htxzngbm':htxzngbm,
				'queryVO.zcbm':zcbm,
				'queryVO.zcmc':zcmc,
				'queryVO.beginTime1':beginTime1,
				'queryVO.beginTime2':beginTime2,
				'queryVO.endTime1':endTime1,
				'queryVO.endTime2':endTime2
			}}).trigger("reloadGrid") ;
	}
	jQuery("#purchase_list").setGridWidth($("#table").width());
	 	 		$(window).bind('resize', function(){
					jQuery("#purchase_list").setGridWidth($("#table").width());
				});	
	function query1(){
	var strurl = "";
	<%if("1".equals(contractType)||"2".equals(contractType)){%>
		strurl = "<%=basePath%>htqs/ContractQuery_query1.do";
	<%}else {%>
		strurl = "<%=basePath%>htqs/ContractQuery_query.do";
	<%}%>
		var htbm = document.getElementById("htbm").value;
		var htzt = document.getElementById("htzt").value;
		var htlx = document.getElementById("htlx").value;
		var htxzngbm = document.getElementById("htxzngbm").value;
		var zcbm = document.getElementById("zcbm").value;
		var zcmc = document.getElementById("zcmc").value;
		var beginTime1 = document.getElementById("beginTime1").value;
		var beginTime2 = document.getElementById("beginTime2").value;
		var endTime1 = document.getElementById("endTime1").value;
		var endTime2 = document.getElementById("endTime2").value;
		jQuery("#purchase_list").setGridParam({
			url:strurl,
			postData:{
		      	'contractType':'${contractType}',
		     	'queryVO.htbm':htbm,
		     	'queryVO.htzt':htzt,
		     	'queryVO.htlx':htlx,
		     	'queryVO.htxzngbm':htxzngbm,
		     	'queryVO.zcbm':zcbm,
		     	'queryVO.zcmc':zcmc,
		     	'queryVO.zcmc':zcmc,
		     	'queryVO.beginTime1':beginTime1,
		     	'queryVO.beginTime2':beginTime2,
		     	'queryVO.endTime1':endTime1,
		     	'queryVO.endTime2':endTime2
			}}).trigger("reloadGrid");
	}
	
	function excel(){
		var urlStr ="com.tansun.eam2.jygdzc.action.ContractQueryAction&com.tansun.eam2.jygdzc.vo.JjzcHtBxQueryVO";
		//var urlStr = "<%=basePath%>htqs/ContractQuery_query.do";
		var sheettype = document.getElementById("sheettype").value;
		var htbm = document.getElementById("htbm").value;
		var htzt = document.getElementById("htzt").value;
		var htlx = document.getElementById("htlx").value;
		var htxzngbm = document.getElementById("htxzngbm").value;
		var zcbm = document.getElementById("zcbm").value;
		var zcmc = document.getElementById("zcmc").value;
		var beginTime1 = document.getElementById("beginTime1").value;
		if(beginTime1==""||beginTime1==null){
			beginTime1 = "1970-01-01";
		}
		var beginTime2 = document.getElementById("beginTime2").value;
		if(beginTime2==""||beginTime2==null){
			beginTime2 = "2050-12-31";
		}
		var endTime1 = document.getElementById("endTime1").value;
		if(endTime1==""||endTime1==null){
			endTime1 = "1970-01-01";
		}
		var endTime2 = document.getElementById("endTime2").value;
		if(endTime2==""||endTime2==null){
			endTime2 = "2050-12-31";
		}
	  	var params = "{\"queryVO.sheettype\":\"" + sheettype + "\",";
			params += "\"queryVO.htbm\":\"" + htbm + "\",";
			params += "\"queryVO.htzt\":\"" + htzt + "\",";
			params += "\"queryVO.htlx\":\"" + htlx + "\",";
			params += "\"queryVO.htxzngbm\":\"" + htxzngbm + "\",";
			params += "\"queryVO.zcbm\":\"" + zcbm + "\",";
			params += "\"queryVO.zcmc\":\"" + zcmc + "\",";
			params += "\"queryVO.beginTime1\":\"" + beginTime1 + "\",";
			params += "\"queryVO.beginTime2\":\"" + beginTime2 + "\",";
			params += "\"queryVO.endTime1\":\"" + endTime1 + "\",";
			params += "\"queryVO.endTime2\":\"" + endTime2 + "\",";
			params += "\"paginator.currentPage\":\"" + 1 + "\",";
			params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("purchase_list", urlStr, params, '合同列表','rn,cb');
	}
	function excel4Elect(){
		if(idStr!=null && idStr.length >= 1&&""!=idStr){
		    var urlStr ="<%=basePath%>htqs/ContractQuery_query4Elect.do";
			var params = "{\"idStr\":\"" + idStr + "\"}";
			exportExcel("purchase_list", urlStr, params, '合同列表','rn,cb');
		}else{
			alert("请选择合同");
		}
	}
	function view() {
		var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		var htlx = jQuery("#purchase_list").getCell(''+ gr,'htlx');
		if (gr.length == 0){
			alert("请选择要查看的记录!");
		}else if(gr.length > 1){	
			alert("一次只能查看一条记录")
		}else{
			if(htlx!=""&&htlx!=null){
				window.open('<%=basePath%>htqs/ContractQuery_getDetail.do?htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}else{
			  	alert("此条数据为错误数据");
		    }
		}
		return false;
	};	
	
	function lookContract(gr){
	  var htlx = jQuery("#purchase_list").getCell(''+ gr,'htlx');
	  	if(htlx!=""&&htlx!=null){
		  if("1"==htlx||"2"==htlx){
		  	 window.open('<%=basePath%>htqs/ContractQuery_viewBody.do?sheettype=contractInfo5&htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		  }else{
		  	 window.open('<%=basePath%>htqs/ContractQuery_getDetail.do?htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		  }
	  }else{
	  	alert("此条数据为错误数据");
	  }
	  return false;
  }
	function getValue(){
		//选中tid 将值带到下个页面 并且添加jyXx处理表
		//var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(idStr.length >= 1){
			window.opener.addValue(idStr);
			window.close();	
		}else{ 
			alert("请选择一条记录");
		}
	}
	function getValue1(){
		var htlx = document.getElementById("htlx").value;
	//	var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(idStr.length==1&&idStr==""){
			alert("请选择合同！");
			return false;
		}
		var headId = "${headId}";
		if(idStr.length >= 1){
			$.post("<%=basePath %>htqs/ContractQuery_validateHt.do",{
				"htIds" : ""+idStr+"",
				"headId" : headId
			},function(data){ 
				if(data!=null&&data!=""){
					alert("编号为"+data+"的合同已添加！");
				}else{
					var vReturnValue=window.showModalDialog('<%=basePath%>htqs/ContractQuery_list.do?ids='+idStr+'&headId=${headId}'+'&htlx='+htlx,window,'help:yes;scroll:yes;resizable:no;status:1;dialogWidth:1110px;dialogHeight:300px;center:yes');
					//window.open('<%=basePath%>htqs/ContractQuery_list.do?ids='+idStr+"&headId=${headId}"+"&htlx="+htlx);
					if("refresh"==vReturnValue){
						refreshlist()
					}
				}
			});
		}else{ 
			alert("请选择一条记录");
		}
	}	
	function refreshlist(){
		window.opener.refreshlist(); 
		//button4.click();
	}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<input type="hidden" name="sheettype" id="sheettype"   value="${sheettype}"/>
<input type="hidden" name="headId" value="${headId}"/>                                                                              
<table width="100%" id="table"  border="0" align="center" cellpadding="0" class="newtable" cellspacing="0">
  <tr>
    <td  class="td_ylp01" >合同编号：</td>
	<td class="td_ylp02" ><s:textfield name="queryVO.htbm" id="htbm" value="%{#request.queryVO.htbm}"/></td>
	<td class="td_ylp01" > 合同状态： </td>
	<td class="td_ylp03" >
	 <s:select list="#{'0':'','1':'执行中','2':'待执行','3':'执行完毕'}"  id="htzt"  name="queryVO.htzt" value="%{#request.queryVO.htzt}"/>
	   </td>
	<td class="td_ylp01" >合同类型：</td>
	 <td class="td_ylp02" >
	 
	 <%
	 // modified by xuecj 合同变动只查询委管\租赁
	 if("purchase_list_change".equals((String)request.getAttribute("purchaseParam"))||
	 		"purchase_list_end".equals((String)request.getAttribute("purchaseParam"))){
	 %>
	<s:select list="#{'1':'委管合同','2':'租赁合同'}" name="queryBO.htlx" id="htlx" value="1" /> 
	 <% 
	 }else{
	 %>
	   <e:select parRefKey="CONTRACT_TYPE" headerKey=" " headerValue=" " list="#{}" name="queryBO.htlx" id="htlx" value="0"/>
	 <%
	 }
	  %>
	   </td>
	  </tr>
	   <tr>
	  <td class="td_ylp01" >
	  合同新增拟稿部门：
	   </td>
	  <td class="td_ylp02" >
	  <s:select list="#{'0':'','1':'本部','2':'代理机构'}"  id="htxzngbm"  name="queryVO.htxzngbm" value="%{#request.queryVO.htxzngbm}"/>
	  </td>
    <td class="td_ylp01" >
	  资产编号：
	     </td>
	  <td class="td_ylp03" >
	  <s:textfield name="queryVO.zcbm"  id="zcbm"  cssClass="input" value="%{#request.queryVO.zcbm}"/>
	     </td>
	  <td class="td_ylp01" > 
	  资产名称：
	     </td>
	  <td class="td_ylp02" >
	  <s:textfield name="queryVO.zcmc" id="zcmc"  value="%{#request.queryVO.zcmc}"/>
	     </td>
		 </tr>
		 <tr>
	  <td class="td_ylp01" > 合同起始日期：</td>
	  <td class="td_ylp02" colspan="3" >从：
		<s:textfield id="beginTime1" name="queryVO.beginTime1"  value="%{#request.queryVO.beginTime1}" />到： <s:textfield id="beginTime2" name="queryVO.beginTime2"  value="%{#request.queryVO.beginTime2}" />
	</td>
	 <td class="td_ylp01" > 
	  &nbsp;
	     </td>
	  <td class="td_ylp03" >
	   &nbsp;
	     </td>
	</tr>
	<tr>
	  <td class="td_ylp01" > 	
	合同到期日期：
   </td>
	  <td class="td_ylp02" colspan="5" >从：
     <s:textfield id="endTime1" name="queryVO.endTime1"  value="%{#request.queryVO.endTime1}" />到： <s:textfield id="endTime2" name="queryVO.endTime2"  value="%{#request.queryVO.beginTime2}" />
	</td>
  </tr>
 <tr>
	<td colspan="6" class="td_form01">
		<%if("1".equals(contractType)||"2".equals(contractType)){
			 if(returnValue){%>
				<input type="button" id="button1" value="确定"  onclick="getValue1();"/>
			<%} %>
		 	<input type="button" id="button4" value="查询"   onclick="query1();"/>
		<%}else{ 
			if(returnValue){%>
				<input type="button" id="button1" value="确定"  onclick="getValue();"/>
			<%} %>
	    <input type="button" id="button4" value="查询"   onclick="query();"/>
		<%} %>
		<input type="button" id="button3" value="重置"  onclick="javascript:window.location.reload();"/>
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
    colNames: ['id','合同编号','资产编号', '资产名称', '合同起始日期', 
    			'合同到期日期','htzt','htlx','合同状态','合同类型'],
    colModel: [
	    { name: 'id',index: 'id',align: "center",hidden:true},
		{ name: 'htbm',index: 'htbm',align: "center"},
		{ name: 'zcbm',index: 'zcbm',align: "center"},
		{ name: 'zcmc',index: 'zcmc',align: "center"},
		{ name: 'beginTime',index: 'beginTime',align: "center"},
		{ name: 'endTime',index: 'endTime',align: "center"},
		{ name: 'htzt',index: 'htzt',align: "center",hidden:true},    
		{ name: 'htlx',index: 'htlx',align: "center",hidden:true},	
		{ name: 'htztStr',index: 'htztStr',align: "center"},    
		{ name: 'htlxStr',index: 'htlxStr',align: "center"}
		
	],
    pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '资产列表',
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
			var allIds = jQuery("#purchase_list").jqGrid('getDataIDs');
			for(var i = 0; i < allIds.length; i++){
				var index = idStr.indexOf(allIds[i]);
				if(index != -1){
					idStr.removeAt(index);
					jQuery("#purchase_list").setSelection(allIds[i]);
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
	ondblClickRow:function(gr){
			lookContract(gr);
		}
});                 
									    
	$(window).bind('resize', function(){
		jQuery("#purchase_list").setGridWidth($("#table").width());
	});
	$("#beginTime1").datebox({
		formatter:function(date){
		return formatDate(date);
		}
	});
	$("#beginTime2").datebox({
		formatter:function(date){
		return formatDate(date);
		}
	});
	$("#endTime1").datebox({
		formatter:function(date){
		return formatDate(date);
		}
	});
	$("#endTime2").datebox({
		formatter:function(date){
		return formatDate(date);
		}
	});

</script>
							 
