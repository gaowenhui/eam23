<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String stockId = (String)request.getAttribute("stockId");
String sign = request.getParameter("sign");
String headId = request.getParameter("headId");
String option= request.getParameter("option");
option = option == null ? "" : option;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath%>"/>
<title>债权</title>
<script type="text/javascript">
	


	$(document).ready(function(){
	       if(window.parent.clearPanelTool){
					window.parent.clearPanelTool();
				}
			//添加按钮
			var buttonJSonString;
			if("<%=option%>"=="czpg"){
				 buttonJSonString = '[{"buttonHandler":"confirmZq2","buttonIcon":"icon-ok","buttonText":"确定"}]';
			}else if("<%=option%>"=="ssgl"){
				buttonJSonString = '[{"buttonHandler":"confirmZq","buttonIcon":"icon-ok","buttonText":"确定"}]';
			}else{
				buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									 {"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"添加"},\
									 {"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									 {"buttonHandler":"excelAss","buttonIcon":"icon-redo","buttonText":"导出"},\
									 {"buttonHandler":"addtranscatyAss","buttonIcon":"icon-add","buttonText":"添加催收办理记录"},\
									 {"buttonHandler":"lookLogInfoAss","buttonIcon":"icon-add","buttonText":"查看日志"}\
									]';
			}
			
			addButtons(jQuery("#gview_all_Attachment> .ui-jqgrid-titlebar"),buttonJSonString);
			
			$("#htdqBegin,#htdqEnd").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		    });
//		    $("#queryButton").click();
		});		
		
	function confirmZq(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		//诉讼管理选择债权，返回id 和名称 xuecj 2011-01-05 20:27
		if(isSingle(gr)){
		var zwrmc = jQuery("#all_Attachment").getCell(gr,'zwrmc');
		window.opener.addValue(gr,zwrmc)
		window.close();
		}
	}
	
	function confirmZq2(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		window.opener.addValue(gr);
		window.close();
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
		
	function confirmAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0 ){
			alert("请选择要添加的记录");
		}else if (gr.length > 1){
			alert("只能选择一条要添加的记录");
		}else{
			window.opener.reloadGrid(gr);
			window.close();
		}
	}
		
	//---------查询200906清单信息	
		var winVar = "height=300, width=900, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		function lookAss(){
			var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0 ){
				alert("请选择要查看的记录");
			}else if (gr.length > 1){
				alert("只能选择一条要查看的记录");
			}else{
				window.open('zqgl/debt_newDebtInfo.do?diid='+gr+'&look='+1);
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
				window.showModalDialog("<%=basePath%>log/logView.do?zcid="+gr+"&tableName=DebtInfo&colName=id&zcmc=zwrmc&subSys=5","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			}
		}
		
		
		
		function addAss(){
			window.open('zqgl/debt_newDebtInfo.do?newAdd='+1);
			return false;
		}
			
			
		function addtranscatyAss(){
			var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0 ){
				alert("请选择要添加办理依据的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要添加办理依据的记录")
			}else{
				
				window.open('zqgl/debt_debtWorklogList.do?newAdd='+1+'&diid='+gr);
				return false;
			}
		}	
			
		function modifyAss(){
			var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0){
				alert("请选择要修改的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要修改的记录")
			}else{
				window.open('zqgl/debt_newDebtInfo.do?rework='+1+'&diid='+gr);
			return false;
			}
		}
			
		function delAss(){
			var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
			if( gr.length > 0 ) {
				if(confirm("确认删除！")){
					$.post("<%=request.getContextPath()%>/zqgl/debt_deleteDebtInfo.do",{
						"DebtInfoId":"" + gr
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
		$("#all_Attachment").setGridParam({}).trigger("reloadGrid");
	}

	function query(){
	   
		var zwrbh = document.getElementById("zwrbh").value;
		var bz = document.getElementById("bz").value ;
		var fshx = document.getElementById("fshx").value ;
		var zwrmc = document.getElementById("zwrmc").value;
		var zqyedy = document.getElementById("zqyedy").value ;
		var zqyexy = document.getElementById("zqyexy").value ;
		var htdqBegin = document.getElementById("htdqBegin").value;
		var htdqEnd = document.getElementById("htdqEnd").value ;
		var djzrfydy = document.getElementById("djzrfydy").value ;
		var djzrfyxy = document.getElementById("djzrfyxy").value;
		var dbhtjedy = document.getElementById("dbhtjedy").value ;
		var dbhtjexy = document.getElementById("dbhtjexy").value ;
//		var shengfen = document.getElementById("shengfen").value ;
		var zqzl = document.getElementById("zqzl").value ;
			jQuery("#all_Attachment").setGridParam({postData:{
				'cqVO.zwrid':'' + zwrbh,
				'cqVO.bz':'' + bz,
				'cqVO.fshx':'' + fshx,
				'cqVO.zwrmc':'' + zwrmc,
				'cqVO.zqyedy':'' + zqyedy,
				'cqVO.zqyexy':'' + zqyexy,			
				'cqVO.htdqBegin':'' + htdqBegin,
				'cqVO.htdqEnd':'' + htdqEnd,
				'cqVO.djzrfydy':'' + djzrfydy,
				'cqVO.djzrfyxy':'' + djzrfyxy,			
				'cqVO.dbhtjedy':'' + dbhtjedy,
				'cqVO.dbhtjexy':'' + dbhtjexy,
//				'cqVO.sf':'' + shengfen,
				'cqVO.zqzl':'' + zqzl
			},
			url:"<%=basePath%>zqgl/debt_debtList.do"
			}).trigger("reloadGrid");
	}
	
	// excel导出 add by  陈煜霄
	function excelAss(){
	 	var urlStr = jQuery("#all_Attachment").getGridParam('url');
	 	
	 	var zwrbh = document.getElementById("zwrbh").value;
		var bz = document.getElementById("bz").value ;
		var fshx = document.getElementById("fshx").value ;
		var zwrmc = document.getElementById("zwrmc").value;
		var zqyedy = document.getElementById("zqyedy").value ;
		
		var zqyexy = document.getElementById("zqyexy").value ;
		var htdqBegin = document.getElementById("htdqBegin").value;
		var htdqEnd = document.getElementById("htdqEnd").value ;
		var djzrfydy = document.getElementById("djzrfydy").value ;
		var djzrfyxy = document.getElementById("djzrfyxy").value;
		
		var dbhtjedy = document.getElementById("dbhtjedy").value ;
		var dbhtjexy = document.getElementById("dbhtjexy").value ;
		//var shengfen = document.getElementById("shengfen").value ;
		var zqzl = document.getElementById("zqzl").value ;
	   
	    var cp = jQuery("#all_Attachment").getGridParam('page');
	    var ps = jQuery("#all_Attachment").getGridParam('rowNum');
	    var params = "{\"cqVO.zwrid\":\"" + zwrbh + "\",";
			params += "\"cqVO.bz\":\"" + bz + "\",";
			params += "\"cqVO.fshx\":\"" + fshx + "\",";
			params += "\"cqVO.zwrmc\":\"" + zwrmc + "\",";
			params += "\"cqVO.zqyedy\":\"" + zqyedy + "\",";
			
			params += "\"cqVO.zqyexy\":\"" + zqyexy + "\",";
			params += "\"cqVO.htdqBegin\":\"" + htdqBegin + "\",";
			params += "\"cqVO.htdqEnd\":\"" + htdqEnd + "\",";
			params += "\"cqVO.djzrfydy\":\"" + djzrfydy + "\",";
			params += "\"cqVO.djzrfyxy\":\"" + djzrfyxy + "\",";
			
			params += "\"cqVO.dbhtjedy\":\"" + dbhtjedy + "\",";
			params += "\"cqVO.dbhtjexy\":\"" + dbhtjexy + "\",";
			params += "\"cqVO.zqzl\":\"" + zqzl + "\",";
			//params += "\"cqVO.shengfen\":\"" + shengfen + "\",";
			params += "\"refershSign\":" + 1 + ",";
			params += "\"cqVO.sign\":" + 10 + ",";
			
			params += "\"paginator.currentPage\":\"" + 1 + "\",";
					params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("all_Attachment", urlStr, params, '对公客户列表','rn,cb');
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
      <td class="td_zxy01">资产编号： </td>
      <td class="td_zxy02"><s:textfield name="cqVO.zwrid" id="zwrbh" /></td>
      <td class="td_zxy01">合同金额币种：</td>
      <td class="td_zxy02">
      <s:select list="#{'':'请选择','0':'人民币','1':'美元','2':'港元','3':'欧元'}"  name="cqVO.bz" id="bz"></s:select>
</td>
    </tr>
    <tr>
      <td class="td_zxy01">是否核销：</td>
      <td class="td_zxy02">
      <%if(StringUtils.equals("czpg",option)){%>
      	<s:hidden name="cqVO.fshx" id="fshx" value="否"/>
      	<input value="否" disabled="disabled"/>
      <%} else{%>
      	<s:select name="cqVO.fshx" id="fshx" list="#{'':'请选择','是':'是','否':'否'}"/>
      <%} %>
      </td>
        <td width="17%" class="td_zxy01">债务人名称： </td>
        <td width="31%" class="td_zxy02"><s:textfield name="cqVO.zwrmc" id="zwrmc" /></td>
    </tr>
    <tr>
      <td class="td_zxy01">购入债权余额(元) > =：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.zqyedy" id="zqyedy" /></td>
      <td class="td_zxy01">购入债权余额(元) < =：</td>
      <td align="right" class="td_zxy02"><s:textfield name="cqVO.zqyexy" id="zqyexy" /></td>
    </tr>
    <tr>
      <td class="td_zxy01">合同终止日期 从：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.htdqBegin" id="htdqBegin" readonly="true"/></td>
      <td class="td_zxy01">合同终止日期 到：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.htdqEnd" id="htdqEnd" readonly="true"/></td>
    </tr>
    <tr>
      <td class="td_zxy01">转让对价金额(元) > =：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.djzrfydy" id="djzrfydy" /></td>
      <td class="td_zxy01">转让对价金额(元) < =：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.djzrfyxy" id="djzrfyxy" /></td>
    </tr>
    <tr>
      <td class="td_zxy01">担保合同金额(元) > =：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.dbhtjedy" id="dbhtjedy" /></td>
      <td class="td_zxy01">担保合同金额(元) < =：</td>
      <td class="td_zxy02"><s:textfield name="cqVO.dbhtjexy" id="dbhtjexy" /></td>
    </tr>
    <tr>
      <td class="td_zxy01">债权种类：</td>
      <td class="td_zxy02">
	      <s:select name="cqVO.zqzl" id="zqzl" list="#{'':'请选择','0':'全部',1:'信达转让',2:'建设银行转让',3:'其他'}"/>
      </td>
   	  <td class="td_zxy01">&nbsp;</td>
      <td class="td_zxy02">&nbsp;</td>
   	  <!-- 
   	  
   	  <td class="td_zxy01">省份：</td>
      <td class="td_zxy02"><e:select parRefKey="PROVIENCE" name="di.shengfen" list="#{}" id="shengfen"  /></td>
      -->
    </tr>
	<tr>
	  <td class="td_zxy01" colspan="4">
	  <div align="right">
			<input type="button" id="queryButton" value="查询" onClick="query();" />
			<input type="reset" value="重置" />
	  </div>
	  </td>
	 </tr>
</table>
<table id="all_Attachment"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">
	jQuery("#all_Attachment").jqGrid({
		postData:{
			'refershSign':1,
			'cqVO.sign':10,
			'cqVO.zwrid' : $("#zwrbh").val(),
			'cqVO.bz' : $("#bz").val(),
			'cqVO.fshx' : $("#fshx").val(),
			'cqVO.zwrmc' : $("#zwrmc").val(),
			'cqVO.zqyedy' : $("#zqyedy").val(),
			'cqVO.zqyexy' : $("#zqyexy").val(),
			'cqVO.htdqBegin' : $("#htdqBegin").val(),
			'cqVO.htdqEnd' : $("#htdqEnd").val(),
			'cqVO.djzrfydy' : $("#djzrfydy").val(),
			'cqVO.djzrfyxy' : $("#djzrfyxy").val(),
			'cqVO.dbhtjedy' : $("#dbhtjedy").val(),
			'cqVO.dbhtjexy' : $("#dbhtjexy").val(),
			'cqVO.zqzl' : $("#zqzl").val()
		},
		datatype: "json",
		rownumbers:true,
		multiselect:true,
		colNames:['id','资产编号','债务人名称','债权种类','购入债权余额','合同金额币种','合同金额','担保类型','担保合同金额','合同终止日期','是否核销','是否转让','转让对价金额'],
		colModel:[
			{name:'id',index:'id',editable:true,hidden:true},
			{name:'zwrbh',index:'zwrbh',editable:true},
			{name:'zwrmc',index:'zwrmc',editable:true},
			{name:'zqzl',index:'zqzl',editable:true},
			{name:'grzye',index:'grzye',editable:true},
			{name:'bzmc',index:'bzmc',editable:true},
			{name:'htje',index:'htje',editable:true},
			{name:'dblxmc',index:'dblxmc',editable:true},
			{name:'dbhtje',index:'dbhtje',editable:true},
			{name:'htzzrq',index:'htzzrq',editable:true},
			{name:'fshx',index:'fshx',editable:true,width:102},
			{name:'djzr',index:'djzr',editable:true,width:102},
			{name:'djzrje',index:'djzrje',editable:true},
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
			caption:'债权列表',
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
				