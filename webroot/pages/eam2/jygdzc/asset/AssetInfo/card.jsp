<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>卡片信息</title>

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
                                            url:"<%=basePath%>jygdzc/AssetManageBody_query4View.do?sheettype=card&zcId=${zcId}&spzt=pass",
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
											ondblClickRow:function(gr){
                                           		var cardcode  = jQuery("#card_list").getCell(gr,'cardcode');
												lookCard(cardcode);
											},
										  	rowNum:10,
											prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
											rowList:[10,20,30],
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
						 		jQuery("#purchase_list").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#purchase_list").setGridWidth($("#table").width());
									       });
       function lookCard(gr){
			var _g_privateDialogFeatures = 'height=500, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
			window.open('<%=basePath%>kpgl/cardQuery_cardInfo.do?cardcode='+gr+"&cardInfoType=cardInfo", '详情',_g_privateDialogFeatures);
				//window.open('<%=basePath%>kpgl/cardQuery_cardInfo.do?cardId='+gr+"&cardInfoType=cardInfo");
		}
 </script>