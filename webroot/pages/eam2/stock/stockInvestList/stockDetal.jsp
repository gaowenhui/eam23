<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String id = (String) request.getAttribute("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
		</script>
	</head>
	<base target="_self"/>
	<body>
	<table id="land_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">项目名称： </td>
              <td class="td_zxy02"><s:textfield name="slist.xmmc" id="xmmc" readonly="true" style="width: 70%;"/></td>
           	  <td class="td_zxy01">分行：</td>
              <td class="td_zxy02">
              <s:textfield name="slist.fhmc" id="fhmc" readonly="true" style="width: 70%;"/>
              </td>
            </tr>	
            <tr>	
              <td class="td_zxy01">项目名称确认：</td>
              <td class="td_zxy02"><s:textfield name="slist.xmmcqr" id="xmmcqr" readonly="true" style="width: 70%;"/></td>
              <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
            </tr>
            <tr>
              <td class="td_zxy01" >备注：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="slist.bz" id="bz" rows="3" readonly="true" style="width: 90%;"></s:textarea></td>
            </tr>
</table> 	
	
	
<div id="widthRule_work">&nbsp;</div>
<table id="work_list"></table>
<script type="text/javascript">
		function lookDetailAss(){
			var gr = jQuery("#work_list").jqGrid('getGridParam','selarrrow');
			if(gr.length == 0){
				alert("请选择要查看的记录");
			}else if (gr.length > 1){
				alert("只能选择一条要查看的记录");
			}else{
				window.open('stock/maintain_viewWorkDetail.do?swid='+gr+'&look='+1);
			}
		} 

		jQuery("#work_list").jqGrid({
			url:"<%=basePath%>stock/stock_viewStockDetailInvestList.do",
			postData:{'id':'<%=id%>'},
			datatype:"json",
			colNames:['id','债券种类','债券名称','债券面值核算科目','金额','应收利息核算科目','金额','到期日'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'zqzlmc',index:'zqzlmc',width:'70%'},
				{name:'zqmc',index:'zqmc'},
				{name:'zqmzhskm',index:'zqmzhskm',width:'90%'},
				{name:'je1',index:'je1',align:'right',formatter:'number',width:'70%'},
				{name:'yslxhskm',index:'yslxhskm',width:'90%'},
				{name:'je2',index:'je2',align:'right',formatter:'number',width:'70%'},
				{name:'dqr',index:'dqr',width:'50%'}
			],
			editurl:"entity-info-alter.html",
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'债券信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			jQuery("#work_list").setGridWidth($("#widthRule_work").width());
			$(window).bind('resize', function() {  
				jQuery("#work_list").setGridWidth($("#widthRule_work").width()); 
			});  
</script>
	</body>
</html>
