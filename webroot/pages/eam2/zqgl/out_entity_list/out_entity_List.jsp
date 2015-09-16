<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String stockId = (String)request.getAttribute("stockId");
String sign = request.getParameter("sign");
String headId = request.getParameter("headId");
String zixunType = (String)request.getAttribute("zixunType");
String debtSign = (String)request.getAttribute("debtSign");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath%>"/>
<title>实体查询</title>
<script type="text/javascript">
	$(document).ready(function(){
	if(window.parent.clearPanelTool){
		window.parent.clearPanelTool();
	}
	if('1' == '<%=debtSign%>'){
			var buttonJSonString = '[{"buttonHandler":"conFirmAss","buttonIcon":"icon-ok","buttonText":"确定"}\
									]';
	}else{
			//添加按钮
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									 {"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
									 {"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									 {"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"},\
									 {"buttonHandler":"excelAss","buttonIcon":"icon-redo","buttonText":"导出"},\
									 {"buttonHandler":"lookLogInfoAss","buttonIcon":"icon-add","buttonText":"查看日志"}\
									]';
	}								
			addButtons(jQuery("#gview_all_Attachment> .ui-jqgrid-titlebar"),buttonJSonString);
			
		});		
		
	//--------债权管理	
		function conFirmAss(){
			var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
			if(gr.length < 1){
				alert("请选择实体");
			}else if(gr.length > 1){
				alert("只能选择一个实体");
			}else{
				window.opener.reloadGrid(gr);
				window.close();
			}
		}
	//-----------	
		
	//---------查询200906清单信息	
	var winVar = "height=300, width=900, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
	function lookAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0){
			alert("请选择要查看的记录");
		}else if (gr.length > 1){
			alert("只能选择一条要查看的记录");
		}else{
			window.open('zqgl/outEntity_newEntity.do?stid='+gr+'&stlx='+10+'&look='+1,'',winVar);
		}
	}
	
	
	//------------查看日志管理----------
		function lookLogInfoAss(){
			var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0 ){
				alert("请选择要查看的记录");
			}else if (gr.length > 1){
				alert("只能选择一条要查看的记录");
			}else{
				window.showModalDialog("<%=basePath%>log/logView.do?zcid="+gr+"&tableName=StJbxx&colName=id&zcmc=stzwmc&subSys=5","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			}
		}
	
	
	function addAss(){
		window.open('zqgl/outEntity_newEntity.do?newAdd='+1);
		return false;
	}
	String.prototype.startWith=function(str){
	 if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	 if(this.substr(0,str.length)==str)
	  return true;
	 else
	  return false;
	 return true;
	}	
	
	
	function modifyAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr != '' && gr.length == 1){
			window.open('zqgl/outEntity_newEntity.do?rework='+1+'&stid='+gr+'&stlx='+10);
			return false;
		}else if(gr.length == 0){
			alert("请选择要修改的记录")
		}else if (gr.length > 1){
			alert("只能选择一条要修改的记录")
		}
	}
		
	function delAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if( gr.length > 0 ) {
			if(confirm("确认删除！")){
				$.post("<%=request.getContextPath()%>/zqgl/outEntity_deleteEntity.do",{
					"StJbxxId":"" + gr
				},function(returnStr){
					alert(returnStr);
					$("#all_Attachment").trigger("reloadGrid");
				});
			}
		}
		else{
			alert("请选择要删除的记录!"); 		
			}
	}
	
	function reloadGrid(){
		jQuery("#all_Attachment").setGridParam({}).trigger("reloadGrid");
	}
	
	// excel导出 add by 陈煜霄
	function excelAss(){
		var urlStr = jQuery("#all_Attachment").getGridParam('url');
		var entityNumber = document.getElementById("entityNumber").value;
		var entityName = document.getElementById("entityName").value ;
		var corporation = document.getElementById("corporation").value ;
	    var cp = jQuery("#all_Attachment").getGridParam('page');
	    var ps = jQuery("#all_Attachment").getGridParam('rowNum');
	    var params = "{\"oeVO.entityNumber\":\"" + entityNumber + "\",";
			params += "\"oeVO.entityName\":\"" + entityName + "\",";
			params += "\"oeVO.corporation\":\"" + corporation + "\",";
			params += "\"zixunType\":" + 10 + ",";
			params += "\"refershSign\":" + 1 + ",";
			params += "\"oeVO.stlx\":" + 10 + ",";
			params += "\"sebtSign\":" + 1 + ",";
			params += "\"paginator.currentPage\":\"" + 1 + "\",";
		    params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("all_Attachment", urlStr, params, '外部实体列表','rn,cb');
	}
	
	function query(){
	  
		var entityNumber = document.getElementById("entityNumber").value;
		var entityName = document.getElementById("entityName").value ;
		var corporation = document.getElementById("corporation").value ;
			jQuery("#all_Attachment").setGridParam({postData:{
				'oeVO.entityNumber':'' + entityNumber,
				'oeVO.entityName':'' + entityName,
				'oeVO.corporation':'' + corporation
			},
			url:"<%=basePath%>zqgl/outEntity_outEntityList.do"
			}).trigger("reloadGrid");
	}

</script>
	
</head>
<base target="_self"/>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="">
<s:hidden name="sinfo.id" id="stockId"/>
<input type="hidden" name="headId"  id="headId" value="<%=headId %>" readonly="true" size="40" />
	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newTable" id="financialTable">
         <tr>
           <td class="td_zxy01">实体编号：</td>
           <td class="td_zxy02"><s:textfield name="oeVO.entityNumber" id="entityNumber" /></td>
           <td class="td_zxy01">实体名称：</td>
           <td align="right" class="td_zxy02"><s:textfield name="oeVO.entityName" id="entityName" /></td>
         </tr>
         <tr>
             <td class="td_zxy01">法人代表：</td>
             <td class="td_zxy02"><s:textfield name="oeVO.corporation" id="corporation" /></td>
             <td class="td_zxy01">&nbsp;</td>
             <td align="right" class="td_zxy02">&nbsp;</td>
         </tr>

		<tr>
		  <td class="td_zxy01" colspan="4">
		   <div align="right">
				<input type="button" value="查询" onClick="query();" />
				<input type="reset" value="重置"  />
		  </div >
		  </td>
		</tr>
</table>
<table id="all_Attachment"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">
	jQuery("#all_Attachment").jqGrid({
		postData:{"zixunType":10,'refershSign':1,'oeVO.stlx':10,'sebtSign':1},
		datatype: "json",
		rownumbers:true,
		multiselect:true,
		colNames:['id','实体编号','实体名称', '法人代表','办公地址','联系人','联系人电话'],
		colModel:[
			{name:'id',index:'id',editable:true,hidden:true},
			{name:'zcbh',index:'HM',editable:true},
			{name:'stzwmc',index:'ZQMC',editable:true},
			{name:'frdb',index:'ZQZL',editable:true},
			{name:'bgdz',index:'ZQMZ',editable:true},
			{name:'lxr',index:'DQR',editable:true},
			{name:'lxdh',index:'DQR',editable:true}
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
			caption:'外部实体',
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
				