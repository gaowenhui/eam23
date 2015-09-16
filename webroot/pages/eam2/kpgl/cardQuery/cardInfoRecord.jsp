<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>卡片信息</title>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String cardId = (String)request.getAttribute("cardId"); %>
<SCRIPT language=JavaScript type=text/JavaScript>
jQuery("#biandonglishi").setGridWidth($("#common_tableWidth").width());
$(window).bind('resize', function(){
	jQuery("#biandonglishi").setGridWidth($("#common_tableWidth").width());
});
</SCRIPT>
</head>
<body  >
<!-- *******************************变动记录********************************** -->
	<table id="common_tableWidth"  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
            <td align="right">
				<table id="biandonglishi"></table>
	            <div id="pgtoolbar1"></div>
				<table id="xiugailishi"></table>
	            <div id="pgtoolbar2"></div>
				<table id="bencibiandong"></table>
	            <div id="pgtoolbar3"></div>
				<table id="bencixiugai"></table>
	            <div id="pgtoolbar4"></div>
			</td>
		</tr>
	</table>
<!-- *******************************变动历史JS********************************** -->
<script type="text/javascript">
jQuery("#biandonglishi").jqGrid({
    url:"<%=basePath %>kpgl/cardQuery_findRecordhistorys.do?cardId=<%=cardId%>",
	datatype: "json",
	mtype:"POST",
    colNames: ['id','变动方式','变动原因','改变前值','改变后值','变动时间','录入人'],
    colModel: [
   		 {name: 'id',index: 'bdfs',hidden:true}, 
	    {name: 'changeway',index: 'bdfs'}, 
	    {name: 'changereason',index: 'bdyy'},
	    {name: 'beforeValue',index: 'gbqz'},  
	    {name: 'afterValue',index: 'gbhz'},
	    {name: 'bdrq',index: 'bdzj'},
	    {name: 'lrr',index: 'lrr'}
	],
   	pager:'pgtoolbar1',
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	caption: '变动历史信息',
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id:'0'
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#biandonglishi").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#biandonglishi").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
										
</script>
<!-- *******************************本次变动JS********************************** 					 		
<script type="text/javascript">
                                        jQuery("#bencibiandong").jqGrid({
	datatype: "json",
	mtype:"POST",
                                            colNames: ['变动方式','变动原因','改变前值','改变后值','变动时间','录入人'],
                                            colModel: [
                                            {
                                                name: 'bdfs',
                                                index: 'bdfs'
                                            }, {
                                                name: 'bdyy',
                                                index: 'bdyy'
                                            },{
                                                name: 'gbqz',
                                                index: 'gbqz'
                                            },  {
                                                name: 'gbhz',
                                                index: 'gbhz'
                                            },{
                                                name: 'bdzj',
                                                index: 'bdzj'
                                            },{
                                                name: 'lrr',
                                                index: 'lrr'
                                            }],
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
											pager: '#pgtoolbar3',
											caption: '本次变动信息',
                                            toolbar: [true, "top"]
                                        });
                                   //  var mydata = [{
                                     //   }];
                                      //  for (var i = 0; i <= mydata.length; i++) 
                                        //    jQuery("#biandonglishi").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#bencibiandong").jqGrid('navGrid', '#pgtoolbar3', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
</script>-->	
