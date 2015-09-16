<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>变动信息</title>
</head>
<body>
<s:hidden name="htId"  value="%{#request.htId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
 <table  class="newtable" width="100%" border="0" align="center" id="table" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right">
			  <table id="changeHistory"></table>
			   <table id="xiugailishi"></table>
			  </td>
		</tr>
    </table>
</body>
</html>
<script type="text/javascript">
		$(function(){
			jQuery("#changeHistory").setGridWidth($("#table").width());
			$(window).bind('resize', function(){
				jQuery("#changeHistory").setGridWidth($("#table").width());
	       });
		})
                                        jQuery("#changeHistory").jqGrid({
                                          	url:"<%=basePath %>htqs/ContractManageBody_query4History.do?spzt=pass&htId=${htId}&sheettype=${sheettype}&type=change",
											datatype: "json",                                      
											mtype:"POST", 
                                            colNames: ['改变的属性','改变前值','改变后值','变动时间','录入人'],
                                            colModel: [
                                            {
                                                name: 'name',
                                                index: 'name'
                                            },{
                                                name: 'before',
                                                index: 'before'
                                            },  {
                                                name: 'after',
                                                index: 'after'
                                            },{
                                                name: 'changedate',
                                                index: 'changedate'
                                            },{
                                                name: 'changeperson',
                                                index: 'changeperson'
                                            }],
										    height: 'auto',
										    rownumbers:true,
                                            autowidth: true,
                                           // pager:'pgtoolbar2',
                                            caption: '变动历史信息',
											viewrecords:true,
											rowNum:0,
											//prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
										  //	rowList:[10,20,30],
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
                             </script>
<script type="text/javascript">
		$(function(){
			jQuery("#xiugailishi").setGridWidth($("#table").width());
		    $(window).bind('resize', function(){
				jQuery("#xiugailishi").setGridWidth($("#table").width());
			});
		})
                                        jQuery("#xiugailishi").jqGrid({
                                          	url:"<%=basePath%>htqs/ContractManageBody_query4History.do?headId=${headId}&htId=${htId}&sheettype=${sheettype}",
											datatype: "json",
											mtype:"POST", 
                                            colNames: ['改变的属性','改变前值','改变后值','录入人'],
                                            colModel: [{
                                                name: 'name',
                                                index: 'name'
                                            },{
                                                name: 'before',
                                                index: 'before'
                                            },  {
                                                name: 'after',
                                                index: 'after'
                                            },{
                                                name: 'changeperson',
                                                index: 'changeperson'
                                            }],
										    height: 'auto',
										    rownumbers:true,
                                            autowidth: true,
                                           // pager:'pgtoolbar1',
                                            caption: '本次变动信息',
											viewrecords:true,
										//	rowNum:10,
											//prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
									  //	rowList:[10,20,30],
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											}
										});	
                             </script>