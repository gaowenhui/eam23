<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>租赁合同</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function view(gr) {
		window.open('<%=basePath%>htqs/ContractQuery_viewBody.do?sheettype=contractInfo5&htlx=2&htId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
</SCRIPT>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
 <table width="100%" border="0" cellspacing="0" id="table" cellpadding="0" align="center">
          <tr>
            <td align="right">
			 	<table id="consuming_list" width="100%"></table>
			</td>
          </tr>
</table>
</body>

</html>
<script type="text/javascript">
					jQuery("#consuming_list").jqGrid({
						url:"<%=basePath%>htqs/ContractQuery_query4Asset.do?zcId=${zcId}&contractType=2",
						datatype: "json",
						mtype:"POST", 
						colNames:['id','合同编号','承租人','承租数量','合同起始日期','合同到期日期','月租金','合同状态'],
						colModel:[
							{name:'id',index:'id',hidden:true},
							{name:'htbh',index:'htbh'},
							{name:'czr',index:'czr'},
							{name:'czsl',index:'czsl'},
							{name:'htqsrq',index:'htqsrq'},  		
							{name:'htdqrq',index:'htdqrq'}, 		
							{name:'yzj',index:'yzj'},
							{name:'CHtzt',index:'CHtzt'}
						],
						height: 'auto',
                        autowidth: true,
                        caption: '该资产相关的租赁合同列表',
                        ondblClickRow:function(gr){
							view(gr);
						},
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
					jQuery("#consuming_list").setGridWidth($("#table").width());
						 	  $(window).bind('resize', function(){
									jQuery("#consuming_list").setGridWidth($("#table").width());
				       });
</script>