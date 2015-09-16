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
jQuery("#gjkpxx").setGridWidth($("#common_tableWidth").width());
$(window).bind('resize', function(){
	jQuery("#gjkpxx").setGridWidth($("#common_tableWidth").width());
});
function lookAsset(gr){
	var zjtype = jQuery("#gjkpxx").getCell(gr,'zjtype');
	if(zjtype=='1'){
		window.open('<%=basePath%>zyzc/ZCQuery_viewGoodDetail.do?zcId=' + gr,
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');

	}else{
		window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
	}
}
</SCRIPT>
</head>


<!-- *******************************资产信息********************************** -->
<body>
	<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right">
				<table width="100%" id="gjkpxx"></table>
			  	<div id="pgtoolbar5"></div>
			</td>
		</tr>
	</table>
</body>
</html>
<!-- *******************************资产信息JS********************************** -->
<script type="text/javascript">
jQuery("#gjkpxx").jqGrid({
    url:"<%=basePath %>kpgl/cardQuery_findAsset.do?cardId=<%=cardId%>",
	datatype: "json",
	mtype:"POST",
    colNames: ['id','资产编号','资产名称','zjtype','存放地点','使用部门'],
    colModel: [
    {name: 'id',index: 'zcbh',hidden:true},
    {name: 'zcbh',index: 'zcbh'},
    {name: 'zcmc',index: 'zcmc'},  
    {name: 'zjtype',index: 'zcbh',hidden:true},
    {name: 'saveadsress',index: 'saveadsress'},
    {name: 'usepartment',index: 'usepartment'}
    ],
    ondblClickRow:function(gr){
			lookAsset(gr);
		},
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '该卡片挂接资产信息',
	jsonReader : {
		records: "records",
		repeatitems: false,
		id:'0'
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#gjkpxx").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#gjkpxx").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
</script>
							 