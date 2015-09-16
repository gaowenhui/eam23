<%@page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>合同信息</title>
		<base href="<%=basePath%>" />

	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:hidden name="headId" id="headId" value="%{#requset.headId}"/>
		<table class="newtable"  id="table" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
				</td>
			</tr>
		</table>
		<table id="tenancy_list"></table>
</html>
<script type="text/javascript">
					$(function(){	
						jQuery("#tenancy_list").setGridWidth($("#table").width());
						$(window).bind('resize', function(){
							jQuery("#tenancy_list").setGridWidth($("#table").width());
						});
							//在列表的标题右端添加按钮，最后一个按钮距右端20px
						    var buttonaddJSonString = '[{"buttonHandler":"confirm_tenancy","buttonIcon":"icon-ok","buttonText":"确定"}\
														]';
							addButtons(jQuery("#gview_tenancy_list > .ui-jqgrid-titlebar"),buttonaddJSonString);
					});
					function confirm_tenancy(){
							//var headId = "${headId}";
							var gr = jQuery("#tenancy_list").jqGrid('getGridParam','selarrrow');
							var url = "<%=basePath%>zltb/IntentionManageBody_isExist.do";
							 if (gr.length == 0){
								alert("请选择一条记录!");
							}else if(gr.length > 1){	
								alert("只能选择一条记录!");		
							}else {
								$.post(url,{"htId":"" + gr + "","headId":"${headId}"},
									function(isExist){
										if("存在"==isExist){
											alert("此条合同在此次处理单中已做过变动");
										}else{
											window.returnValue=gr;
											//window.opener.addtenancy(gr);
												window.close();
										}
								});
							}
							return false;
					};
                    jQuery("#tenancy_list").jqGrid({       
                       // url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?zcId=${zcId}",
					    url:"<%=basePath%>htqs/ContractQuery_query4View.do?zcId=${zcId}&contractType=2",
						datatype: "json",
						mtype:"POST",    
                        colNames: ['id','合同编号','资产编号','资产名称','合同状态','交易对象','合同起始日期', '合同到期日期','承租人','出租用途','录入人','录入日期'],
                        colModel: [
                        	{name:'id',index:'id',editable:true,hidden:true},
                        	{name:'htbh',index:'htbh',editable:true},
                        	{name:'zcbh',index:'zcbh',editable:true},
                        	{name:'zcmc',index:'zcmc',editable:true},
                        	{name:'CHtzt',index:'CHtzt',editable:true},
                        	{name:'jydx',index:'jydx',editable:true},
					   		{name:'htqsrq',index:'htqsrq',editable:true},
							{name:'htdqrq',index:'htdqrq',editable:true},
					   		{name:'czr',index:'czr',editable:true},
					   		{name:'zlyt',index:'zlyt',editable:true},
					   		{name:'lrr',index:'lrr',editable:true},
					   		{name:'lrrq',index:'lrrq',editable:true}
					   	],
					   	rownumbers:true,
					    height: 'auto',
                        autowidth: true,
                        multiselect: true,
                        caption: '出租资产列表',
						viewrecords:true,
						jsonReader : {
							root:"rows",
							page: "page",
							total: "total",
							records: "records",
							repeatitems: false,
							id: "0"
						},
						gridComplete: function(gr){
							var ids = $("#tenancy_list").getDataIDs();
							for(var i=0;i<ids.length;i++){
								var gr=ids[i];
									var jydx= jQuery("#tenancy_list").getCell(gr,'jydx');
									var CHtzt= jQuery("#tenancy_list").getCell(gr,'CHtzt');
									if("1"==jydx){
										jQuery("#tenancy_list").setCell(gr,'jydx','建行');
									}else if("2"==jydx){
										jQuery("#tenancy_list").setCell(gr,'jydx','非建行')
									}else{
										jQuery("#tenancy_list").setCell(gr,'jydx','')
									}
									if("1"==CHtzt){
										jQuery("#tenancy_list").setCell(gr,'CHtzt','执行中');
									}else if("2"==CHtzt){
										jQuery("#tenancy_list").setCell(gr,'CHtzt','待执行');
									}else if("3"==CHtzt){
										jQuery("#tenancy_list").setCell(gr,'CHtzt','执行完毕');
									}else{
										jQuery("#tenancy_list").setCell(gr,'CHtzt','');
									}
	                		}
          	  			}
                    });
</script>