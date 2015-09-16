<%@ page language="java" pageEncoding="UTF-8"%>
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
          <s:textfield name="slist.fhmc" id="fhmc" readonly="true"/>
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
          <td colspan="3" class="td_zxy02"><s:textarea name="slist.bz" id="bz" rows="3" readonly="true" style="width: 85%;"></s:textarea></td>
        </tr>
	</table> 	
<table id="all_Attachment"></table>
<div id="pgtoolbar1"></div>
<script type="text/javascript">
	jQuery("#all_Attachment").jqGrid({
		url:"<%=basePath%>stock/stock_viewStockInvestList.do",
		postData:{'id':'<%=id%>'},
		datatype: "json",
		rownumbers:true,
		multiselect:true,
		colNames:['id','XM_ID','时点','账面值','减值准备','备注'],
		colModel:[{name:'id',index:'id',hidden:true},
				{name:'xmId',index:'HM',hidden:true},
				{name:'shidian',index:'ZQMC',width:'70%'},
				{name:'zmz',index:'ZQZL',align:'right',formatter:'number',width:'70%'},
				{name:'jzzb',index:'ZQMZ',align:'right',formatter:'number',width:'70%'},
				{name:'beizhu',index:'DQR',editable:true}
				],
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			rowList:[10,20,30],
			caption:'时点账面值（单位：元）',
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
	
	$("#all_Attachment").setGridWidth($("#land_information").width());
	//绑定resize事件
	$(window).bind('resize',function(){
		$("#all_Attachment").setGridWidth($("#land_information").width());
	});
</script>
	</body>
</html>
