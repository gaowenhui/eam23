<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype2 = (String) request.getParameter("sheettype2");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>委管合同</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function view(gr) {
		window.open('<%=basePath%>htqs/ContractQuery_viewBody.do?sheettype=contractInfo5&htlx=1&htId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
</SCRIPT>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<table width="100%" border="0" cellspacing="0" id="table" cellpadding="0" align="center">
          <tr>
            <td align="right">
			 	<table id="consuming_list2" width="100%"></table>
			</td>
          </tr>
	    </table>
</body>
</html>
<script type="text/javascript">	
					$(function(){
						jQuery("#consuming_list2").setGridWidth($("#table").width());
						$(window).bind('resize', function(){
							jQuery("#consuming_list2").setGridWidth($("#table").width());
						});
					})		
					jQuery("#consuming_list2").jqGrid({
					<%if("change".equals(sheettype2)){%> 
						url:"<%=basePath%>htqs/ContractQuery_query4Asset.do?sheettype2=change&zcId=${zcId}&contractType=1",
					<%}else{%> 
						url:"<%=basePath%>htqs/ContractQuery_query4Asset.do?zcId=${zcId}&contractType=1",
					<%}%>	
						datatype: "json",
						mtype:"POST", 
						colNames:['id','合同编号','委托管理原值','委托管理单位','委托管理数量','合同起始日期','合同到期日期','委托管理期（月）','委托价格','月委托管理费','合同状态'],
						colModel:[
							{name:'id',index:'id',hidden:true},
							{name:'htbh',index:'htbh'},
							{name:'wtglyz',index:'wtglyz'},
							{name:'CWtgldw',index:'CWtgldw'},
							{name:'wtglsl',index:'wtglsl'},		
							{name:'htqsrq',index:'htqsrq'},  		
							{name:'htdqrq',index:'htdqrq'},
							{name:'wtglq',index:'wtglq'},  //算		
							{name:'wtgljg',index:'wtgljg'},
							{name:'ywtglf',index:'ywtglf'},
							{name:'CHtzt',index:'CHtzt'}
						],
					   	height: 'auto',
                        autowidth: true,
                        caption: '该资产相关的委管合同列表',
						viewrecords:true,
						ondblClickRow:function(gr){
							view(gr);
						},
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