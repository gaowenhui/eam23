<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String id = (String)request.getAttribute("id");
	String stid = (String)request.getAttribute("stid");
	String look = (String)request.getAttribute("look");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>债权债务情况</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function reloadGrid(id){
		if(id == "claims"){
			jQuery("#claims_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "debt"){
			jQuery("#debt_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "tax"){
			jQuery("#taxPayment_list").setGridParam({
			}).trigger("reloadGrid");
		}
	}
	
	</script>
  </head>
  <body>
			
<div  style="display:none;width: 98%" id="widthRule_claims">&nbsp;</div>	
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="claims_list"> </table>
				<div id="pgtoolbarclaims"></div>
       </td>
     </tr>
</table>
<script type="text/javascript">
		$(document).ready(function(){
	
				<%if("1".equals(look)){%>
					//债权添加按钮
					var buttonJSonString = '[{"buttonHandler":"claimsLookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_claims_list> .ui-jqgrid-titlebar"),buttonJSonString);
					//债务添加按钮
					var buttonJSonString = '[{"buttonHandler":"debtLookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_debt_list > .ui-jqgrid-titlebar"),buttonJSonString);
					//税款添加按钮
					var buttonJSonString = '[{"buttonHandler":"taxPaymentLookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_taxPayment_list > .ui-jqgrid-titlebar"),buttonJSonString);
				<%}else{%>
					//债权添加按钮
					var buttonJSonString = '[{"buttonHandler":"claimsAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"claimsModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"claimsLookAss","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"claimsDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_claims_list> .ui-jqgrid-titlebar"),buttonJSonString);
					//债务添加按钮
					var buttonJSonString = '[{"buttonHandler":"debtAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"debtModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"debtLookAss","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"debtDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_debt_list > .ui-jqgrid-titlebar"),buttonJSonString);
					//税款添加按钮
					var buttonJSonString = '[{"buttonHandler":"taxPaymentAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"taxPaymentModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											 {"buttonHandler":"taxPaymentLookAss","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"taxPaymentDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_taxPayment_list > .ui-jqgrid-titlebar"),buttonJSonString);
				<%}%>
					
			});
				
				
				
				
					function claimsAddAss(){
						var stid = '<%=stid%>';
						window.open('weihu_newDebtInfo.do?stid='+stid+'&newAdd='+1);
					}
			
					function claimsModifyAss(){
						var gr = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
						if(gr.length == 0){
							alert("请选择要修改的记录!");
						}else if(gr.length > 1){
							alert("请选择一条要修改的记录!");
						}else{
							window.open('weihu_newDebtInfo.do?id='+gr+'&rework='+1+'&stid='+'<%=stid%>');
						}
					}
					
					
					function claimsLookAss(){
						var gr = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
						if(gr.length == 0){
							alert("请选择要查看的记录!");
						}else if(gr.length > 1){
							alert("请选择一条要查看的记录!");
						}else{
							window.open('weihu_newDebtInfo.do?id='+gr+'&look='+1+'&stid='+'<%=stid%>');
						}
					}
					
				function claimsDelAss(){
					
					var gr = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
					if( gr.length > 0 ){
						if(confirm("确定删除！")){
							$.post("<%=request.getContextPath()%>/stgl/weihu_claimsdeleList.do?debtInfo=1",{
							"clsimsIds":"" + gr
							},function(returnStr){
								$("#claims_list").trigger("reloadGrid")
							});
						}
					}else {
						alert("请选择删除记录!");
					}
				}
				
				jQuery("#claims_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_debtList.do",
					postData:{'refershSign':1,'stid':'<%=stid%>'},
					datatype: "json",
					colNames:['id','债务人名称','担保方式','债权金额','诉讼时效','是否提起诉讼','债权期限（天）','合同编号','抵押财产、质押财产、保证人等说明','债务人情况介绍','备注'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'zwrmc',index:'name', editable: false},
						{name:'dbfs',index:'security', editable: false,edittype:'select',editoptions:{value:"1:无;2:保证;3:抵押;4:质押;5:其他（见备注）"},hidden:true},
					    {name:'zqje',index:'claimsaccount', editable: false},
						{name:'sssx',index:'actulHolder', editable: false,edittype:"select",editoptions:{value:"1:超过;2:未超过"},hidden:true},
						{name:'sfss',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;2:否"},hidden:true},	
				        {name:'zqqx',index:'claimsaccount', editable: false},					
						{name:'htbh',index:'name', editable: false},
					    {name:'pledgeDes',index:'', editable: false,hidden:true},	
						{name:'zwrqkjs',index:'assessedValue', editable: false,hidden:true},							
					    {name:'beizhu',index:'cashAmount', editable: false,hidden:true}
					],
					editurl:"entity-info-alter.html",
//							pager:'#pgtoolbar31',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'主要债权',
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
				jQuery("#claims_list").setGridWidth($("#widthRule_claims").width());
				$(window).bind('resize', function() {  
						jQuery("#claims_list").setGridWidth($("#widthRule_claims").width()); 
					}); 
</script>

<br/>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="debt_list"> </table>
				<div id="pgtoolbardebt"></div>
       </td>
     </tr>
</table>


<script type="text/javascript">
				
				function debtAddAss(){
					var stid = '<%=stid%>';
					window.open('weihu_newDebtInfo.do?stid='+stid+'&newAdd='+1+'&debtInfo='+1);		
				}
		
				function debtModifyAss(){
					var gr = jQuery("#debt_list").jqGrid('getGridParam','selarrrow');
					if(gr.length == 0){
						alert("请选择要修改的记录!");
					}else if(gr.length > 1){
						alert("请选择一条要修改的记录!");
					}else{
						window.open('weihu_newDebtInfo.do?id='+gr+'&rework='+1+'&stid='+'<%=stid%>'+'&debtInfo='+1);
					}
				}
				
				function debtLookAss(){
					var gr = jQuery("#debt_list").jqGrid('getGridParam','selarrrow');
					if(gr.length == 0){
						alert("请选择要查看的记录!");
					}else if(gr.length > 1){
						alert("请选择一条要查看的记录!");
					}else{
						window.open('weihu_newDebtInfo.do?id='+gr+'&look='+1+'&stid='+'<%=stid%>'+'&debtInfo='+1);
					}
				}
					
				function debtDelAss(){
					var gr = jQuery("#debt_list").jqGrid('getGridParam','selarrrow');
					if( gr.length > 0 ){
						if(confirm("确定删除！")){
							$.post("<%=request.getContextPath()%>/stgl/weihu_claimsdeleList.do?debtInfo=1",{
							"clsimsIds":"" + gr
							},function(returnStr){
								$("#debt_list").trigger("reloadGrid")
							});
						}
					}else {
						alert("请选择删除记录!");
					}
				}
				

				jQuery("#debt_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_debtList.do",
					postData:{'refershSign':2,'stid':'<%=stid%>'},
					datatype: "json",
					colNames:['id','债权人名称','担保方式','债权金额','诉讼时效','是否提起诉讼','债权期限（天）','合同编号','抵押财产、质押财产、保证人等说明','或有负债介绍','备注'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'zqrmc',index:'name', editable: false},
						{name:'dbfs',index:'security', editable: false,edittype:'select',editoptions:{value:"1:无;2:保证;3:抵押;4:质押;5:其他（见备注）"},hidden:true},
						{name:'zqje',index:'claimsaccount', editable: false},
						{name:'sssx',index:'actulHolder', editable: false,edittype:"select",editoptions:{value:"1:超过;2:未超过"},hidden:true},
						{name:'sfss',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;2:否"},hidden:true},	
						{name:'zqqx',index:'claimsaccount', editable: false},
						{name:'htbh',index:'name', editable: false},																		
						{name:'dyzycc',index:'', editable: false,hidden:true,hidden:true},	
						{name:'fzjs',index:'assessedValue', editable: false,hidden:true},							
					    {name:'beizhu',index:'cashAmount', editable: false,hidden:true}
					],
					editurl:"entity-info-alter.html",
//							pager:'pgtoolbardebt',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'主要债务',
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
				jQuery("#debt_list").setGridWidth($("#widthRule_claims").width());
				$(window).bind('resize', function() {  
						jQuery("#debt_list").setGridWidth($("#widthRule_claims").width()); 
					}); 
</script>
 
<br/>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="taxPayment_list"> </table>
				<div id="pgtoolbartaxPayment"></div>
       </td>
     </tr>
</table>

<script type="text/javascript">

					function taxPaymentAddAss(){
		//				taxPayment_information.style.display=taxPayment_information.style.display=='none'?'block':'none';
						var stid = '<%=stid%>';
						window.open('weihu_newTaxInfo.do?stid='+stid+'&newAdd='+1);
					}
			
			
			
					function taxPaymentModifyAss(){
						var gr = jQuery("#taxPayment_list").jqGrid('getGridParam','selarrrow');
						if(gr.length == 0){
							alert("请选择要修改的记录!");
						}else if(gr.length > 1){
							alert("请选择一条要修改的记录!");
						}else{
							window.open('weihu_newTaxInfo.do?id='+gr+'&rework='+1+'&stid='+'<%=stid%>');
						}
					}
					
					
					
					function taxPaymentLookAss(){
						var gr = jQuery("#taxPayment_list").jqGrid('getGridParam','selarrrow');
						if(gr.length == 0){
							alert("请选择要查看的记录!");
						}else if(gr.length > 1){
							alert("请选择一条要查看的记录!");
						}else{
							window.open('weihu_newTaxInfo.do?id='+gr+'&look='+1+'&stid='+'<%=stid%>');
						}
					}
					
					
					
					function taxPaymentDelAss(){
					
						var gr = jQuery("#taxPayment_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleTaxPayment.do",{
									"taxPaymentIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#taxPayment_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					}

				jQuery("#taxPayment_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_debtList.do",
					postData:{'refershSign':3,'stid':'<%=stid%>'},
					datatype: "json",
					colNames:['id','税款名称','是否按时缴纳','拖欠税款数额（元）','拖欠时间','税务机关是否可以减免'],
					colModel:[	
						{name:'id',index:'taxName', editable: false,hidden:true},
					    {name:'skmc',index:'taxName', editable: false},
						{name:'sfasjn',index:'name', editable: false,edittype:"select",editoptions:{value:"1:是;0:否"}},
						{name:'tqskse',index:'security', editable: false},
						{name:'tqsj',index:'claimsaccount', editable: false},
						{name:'swjgsfkjm',index:'actulHolder', editable: false,edittype:"select",editoptions:{value:"1:是;0:否"}}						
					],
					editurl:"entity-info-alter.html",
			//				pager:'pgtoolbartaxPayment',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'税款缴纳',
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}		
						});
				jQuery("#taxPayment_list").setGridWidth($("#widthRule_claims").width()); 
				$(window).bind('resize', function() {  
						jQuery("#taxPayment_list").setGridWidth($("#widthRule_claims").width()); 
					}); 
</script>

  </body>
</html>
