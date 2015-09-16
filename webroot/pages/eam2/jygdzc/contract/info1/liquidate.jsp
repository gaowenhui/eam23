<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清算信息</title>
</head>
<body>
<s:hidden name="htId"  value="%{#request.htId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
            <div id="table" width="100%"></div>
			 	<table id="consuming_list2" width="100%"></table>
</body>
</html>
<script type="text/javascript">	
					jQuery("#consuming_list2").setGridWidth($("#table").width());
					$(window).bind('resize', function(){
						jQuery("#consuming_list2").setGridWidth($("#table").width());
					});
					jQuery("#consuming_list2").jqGrid({
						url:"<%=basePath%>htqs/ContractManageBody_query4History.do?sheettype=liquidate&htId=${htId}",
						datatype: "json",
						mtype:"POST", 
						colNames:['id','清算起始日期','清算截止日期','应收资金','实收资金','清算调整金额','调整原因'],
						colModel:[
							{name:'id',index:'id',hidden:true},
							{name:'qsksrq',index:'qsksrq'},
							{name:'qsjzrq',index:'qsjzrq'},
							{name:'yszj',index:'yszj'},
							{name:'sszj',index:'sszj'},		
							{name:'qstzje',index:'qstzje'},  		
							{name:'tzyy',index:'tzyy'}
						],
					   	height: 'auto',
                        autowidth: true,
                        caption: '清算信息列表',
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