<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
boolean isdisable = false;
isdisable = "true".equals((String) request
		.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片信息</title>
<script type="text/javascript">
			$(function(){	
				if("true"!="<%=isdisable%>"){
					var buttoncardJSonString = '[{"buttonHandler":"add_card","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delete_card","buttonIcon":"icon-remove","buttonText":"删除"},\
												{"buttonHandler":"main_card","buttonIcon":"icon-edit","buttonText":"设为主卡片"}\
					]';
					addButtons(jQuery("#gview_card_list > .ui-jqgrid-titlebar"),buttoncardJSonString);
				}
				jQuery("#purchase_list").setGridWidth($("#table").width());
			 	$(window).bind('resize', function(){
					jQuery("#purchase_list").setGridWidth($("#table").width());
		        });
			});
			function delete_card(){
					var gr = jQuery("#card_list").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要删除的记录!");
					}else{	
						if(confirm("确认删除？")){
							var sheettype = "${sheettype}";
							var delblyjurl ="<%=basePath%>jygdzc/AssetManageBody_deleteCard.do?";
							$.post(delblyjurl,{historyId:"" + gr + "",sheettype:"" + sheettype + ""}, function(data){
								jQuery("#card_list").trigger("reloadGrid");
							});
						}
					}
					return false;
			};
			function add_card(){
					//window.open('<%=basePath%>jygdzc/AssetManageBody_init.do?batch=true','','height=500, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					var vReturnValue=window.showModalDialog('<%=basePath%>jygdzc/AssetManageBody_init.do?batch=true&isModal=true','_blank','help:no;scroll:yes;resizable:no;status:1;dialogWidth:1000px;dialogHeight:500px;center:yes');
					if(typeof(vReturnValue)!='undefined'){
			  			callBackBatch(vReturnValue);
					}
					return false;
			};
			function main_card(){
					var gr = jQuery("#card_list").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要设置的卡片!");
					}else if(gr.length > 1){
						alert("只能选择一张卡片!");
					}else{	
							var sheettype = "${sheettype}";
							var zcId = "${zcId}"
							var delblyjurl ="<%=basePath%>jygdzc/AssetManageBody_setMainCard.do?";
							$.post(delblyjurl,{historyId:"" + gr + "",zcId:""+ zcId +"",sheettype:"" + sheettype + ""}, function(data){
								//alert(data);
								jQuery("#card_list").trigger("reloadGrid");
							});
					}
					return false;				
			};
	function callBackBatch(gr){
			var sheettype = "${sheettype}";
			var zcId = "${zcId}";
			delblyjurl="<%=basePath%>jygdzc/AssetManageBody_setCard.do";
			$.post(delblyjurl,{zcId:"" + zcId + "",cardId:"" + gr + "",sheettype:"" + sheettype + ""}, function(data){
				jQuery("#card_list").trigger("reloadGrid");
			});
	}
	function compute(){				
	var values=0;
	$("td[aria-describedby='card_list_sfwzkp']").each(function(i,obj){
             var r=$(obj).text();
             values=values+parseFloat(r);
             });  
      if(values!=1){
     	
      }       
	}
	function lookCard(gr){
			var _g_privateDialogFeatures = 'height=500, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
			window.open('<%=basePath%>kpgl/cardQuery_cardInfo.do?cardcode='+gr+"&cardInfoType=cardInfo", '详情',_g_privateDialogFeatures);
				//window.open('<%=basePath%>kpgl/cardQuery_cardInfo.do?cardId='+gr+"&cardInfoType=cardInfo");
	}
</script>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
  <table  class="newtable" width="100%" border="0" id="table" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td align="right">
			<table id="card_list"></table>
			  <div id="pgtoolbar1"></div>
			</td>
		  </tr>
</table>
</body>
</html>
<script type="text/javascript">
                                        jQuery("#card_list").jqGrid({       
                                            url:"<%=basePath%>jygdzc/AssetManageBody_query4View.do?sheettype=${sheettype}&zcId=${zcId}",
											datatype: "json",
                                            colNames: ['id','卡片编号', '卡片名称','卡片类型','卡片状态','使用部门','管理部门','一级分行','挂接日期','是否为主卡片'],
                                            colModel: [
                                            	{name:'id',index:'id',hidden:true},
												{name: 'cardcode', index: 'cardcode',align: "center"},
	                                            {name: 'zcname',index: 'zcname',align: "center"}, 
	                                            {name: 'typecode',index: 'typecode',align: "center"},
	                                            {name: 'cardState',index: 'cardState',align: "center"},
	                                            {name: 'usepartment',index: 'usepartment',align: "center"},
	                                            {name: 'glbm',index: 'glbm',align: "center"},
	                                            {name: 'firstbranch',index: 'firstbranch',align: "center"},
	                                            {name: 'gjksrq',index: 'gjksrq',align: "center"},
	                                            {name: 'sfwzkp',index: 'sfwzkp',align: "center"}
                                            ],
										   	rownumbers:true,
										   	height: 'auto',
                                            autowidth: true,
                                           	pager:'pgtoolbar1',
										  	rowNum:10,
											prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
											rowList:[10,20,30],
                                            multiselect: true,
                                           	ondblClickRow:function(gr){
                                           		var cardcode  = jQuery("#card_list").getCell(gr,'cardcode');
												lookCard(cardcode);
											},
                                            caption: '卡片列表',
											viewrecords:true,
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											}
                                        });
                                      
                                        jQuery("#purchase_list").jqGrid('navGrid', '#pgtoolbar11', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
 </script>