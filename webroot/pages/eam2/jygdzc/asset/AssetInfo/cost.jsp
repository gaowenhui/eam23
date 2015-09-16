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
<title>费用信息</title>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
  <table width="100%" id="feiyongList"></table>
  <div id="pgtoolbar1"></div>
</body>
</html>
<script type="text/javascript">
jQuery("#feiyongList").jqGrid({
	url:"<%=basePath %>jygdzc/AssetManageBody_getJyzcHeadByZcId.do?zcId=${zcId}",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','费用种类','业务类型', '申请总金额', '审定总金额', '实际花费总金额','标题','编号','拟稿人','拟稿日期'],
	colModel: [
		{name: 'id',index: 'id',align: "center" ,hidden:true},
		{name: 'cfyzl',index:'cfyzl',align:'center'},
		{name: 'ywlx',index: 'ywlx',align: "center"},
		{name: 'sqje',index: 'applyMoney',align: "center"},
		{name: 'sdje',index: 'approveMoney',align: "center"},
		{name: 'sjhf',index: 'sjhf',editable: true,align: "center"},
		{name: 'biaoti',index: 'biaoti',align: "center"},
		{name: 'bianhao',index: 'bianhao',align: "center"},
		{name: 'ngrmc',index: 'ngrmc',align: "center"},
		{name: 'ngrq',index: 'ngrq',align: "center"}
	],
	rownumbers:true,
	autowidth:true,
	height:'auto',
	onSelectRow: function(id){
		jQuery('#feiyongList').jqGrid('editRow',id,true);
		$("#" + id + "_sjhf").change(function(){
			var sjhf  = $("#" + id + "_sjhf").val();
			if(checkFloat(sjhf)){
				jQuery('#feiyongList').jqGrid('saveRow',id);
			}
		});
	},
	rownumbers:true,
	autowidth:true,
	height:'auto',
	pager:'pgtoolbar1',
  	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	rowList:[10,20,30],
	caption: '费用信息列表',
	editurl:'<%=basePath %>jygdzc/AssetManageBody_updateSjhf.do',
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});
function checkFloat(thisFloat){
	var flag = isFloat(thisFloat);
	var value= "false";
	if(flag==false||thisFloat==null||thisFloat==""){
		alert('请输入正确的金额');
		return false;
	}else{
		for(var i = 0; i < thisFloat.length;i++){
			var ch=thisFloat.charAt(i);
			if(ch=='.'){
				if(thisFloat.length - i > 3){
					alert('小数点后面最多只能有两位');
					return false;
				}else{
					value= "true";
				}
			}else{
				value= "true";
			}
		}
	}
	return value;
}
</script>
