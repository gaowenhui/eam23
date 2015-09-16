<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String confirmHeadId = (String)request.getAttribute("confirmHeadId"); 
	String qrrbh = (String)request.getAttribute("qrrbh");
	String dzje = String.valueOf(request.getAttribute("dzje"));
	boolean isQuery = false;
	isQuery = "true".equals((String)request.getAttribute("isQuery"))?true:false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>实体信息</title>
<script type="text/javascript">
	$(document).ready(function(){	
		//----------------------------------------添加按钮--------------------------------------------
		<%if(!isQuery){%>
		var buttonJSonString = '[{"buttonHandler":"confirmThis","buttonIcon":"icon-save","buttonText":"确认"},\
								 {"buttonHandler":"editRelate","buttonIcon":"icon-edit","buttonText":"修改"},\
								 {"id":"save","buttonHandler":"saveMessage","buttonIcon":"icon-ok","buttonText":"保存"},\
								 {"buttonHandler":"cancelMessage","buttonIcon":"icon-no","buttonText":"取消"},\
								 {"buttonHandler":"deleteRelate","buttonIcon":"icon-remove","buttonText":"删除"}\
								]';
		addButtons(jQuery("#gview_st_list > .ui-jqgrid-titlebar"),buttonJSonString);
		var buttonJSonString1 = '[{"buttonHandler":"saveThis03","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_entity_list03 > .ui-jqgrid-titlebar"),buttonJSonString1);
		var buttonJSonString2 = '[{"buttonHandler":"saveThis1","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_entity_list1 > .ui-jqgrid-titlebar"),buttonJSonString2);
		<%}%>
		//----------------------------------------设置宽度--------------------------------------------
		$("#st_list").setGridWidth($("#commonWidth").width());
		$("#entity_list03").setGridWidth($("#commonWidth").width());
		$("#entity_list1").setGridWidth($("#commonWidth").width());
		$(window).bind('resize',function(){
			$("#st_list").setGridWidth($("#commonWidth").width());
			$("#entity_list03").setGridWidth($("#commonWidth").width());
			$("#entity_list1").setGridWidth($("#commonWidth").width());
		});
		//----------------------------------------设置表格显示------------------------------------------
		var stlx = document.getElementById('stlx').value;
		if(stlx=='0'){
			document.getElementById("div03").style.display="block";
			document.getElementById("div1").style.display="none";
		}else if(stlx=='1'){
			document.getElementById("div03").style.display="none";
			document.getElementById("div1").style.display="block";
		}else if(stlx=='3'){
			document.getElementById("div03").style.display="block";
			document.getElementById("div1").style.display="none";
		}
	});
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!----------------------------------------查询条件-------------------------------------------->
<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01">资产编号：</td>
		<td class="td_zxy02"><s:textfield name="entityvo.assertNumber" id="assertNumber" /></td>
		<td class="td_zxy01">实体中文名称：</td>
		<td class="td_zxy02"><s:textfield name="entityvo.entityName" id="entityName"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">地区：</td>
		<td class="td_zxy02"><e:select parRefKey="PROVIENCE" list="#{}" headerKey=""  headerValue="请选择" name="entityvo.province" id="province" value=""/></td>
		<td class="td_zxy01">管理部门：</td>
        <td class="td_zxy02"><s:select list="#{'':'请选择',1:'委托代理业务部',2:'资产管理处置部'}" name="entityvo.CGlbm" id="CGlbm"></s:select></td>
	</rr>
	<tr>
		<td class="td_zxy01">委托管理机构：</td>
       	<td class="td_zxy02"><s:textfield name="entityvo.CWtgljg" id="CWtgljg"/></td>
       	<td class="td_zxy01">实体类型：</td>
	    <td class="td_zxy02"><s:select list="#{'0':'咨询类实体','1':'非咨询处置类实体','3':'非咨询持续经营类实体'}" onchange="getIndex();" id="stlx"></s:select></td>
	</tr>	
	<tr>
		<td class="td_form01" colspan="6"><input type="button" value="查询" class="buttonface" onclick="query();"></td>
	</tr> 		
</table>
<!----------------------------------------实体列表-------------------------------------------->
<div id="div03">
	<table id="entity_list03"></table>
	<div id="pgtoolbar03"></div>
</div>
<div id="div1">
	<table id="entity_list1"></table>
	<div id="pgtoolbar1"></div>
</div>
<!----------------------------------------表体列表-------------------------------------------->
<table id="st_list"></table>
<div id="commonWidth" style="width:100%;"></div>
<script type="text/javascript">
	var confirmHeadId = '<%=confirmHeadId%>';
	var qrrbh = '<%=qrrbh%>';
	jQuery("#entity_list03").jqGrid({
		datatype: "json",
		colNames:['id','资产编号','实体中文名称','经营分类','管理部门','委托管理机构','地区','行业','注册地址','营业执照号','实体处置方式','实体状态'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'zcbh',index:'assertNumber'},
			{name:'stzwmc',index:'entityName'},
			{name:'jyfl',index:'classification'},
			{name:'CGlbm',index:'CGlbm'},
			{name:'CWtgljg',index:'adress'},
			{name:'CShengfen',index:'area'},	
			{name:'CHangye',index:'industry'},	
			{name:'zcdz',index:'adressRegistration',hidden:true},
			{name:'yezxh',index:'businessLicenseNum',hidden:true},
			{name:'c_czfs',index:'businessLicenseNum'},
			{name:'CStzt',index:'businessLicenseNum'}
		],
		pager:'pgtoolbar03',
		multiselect:true,
		rownumbers:true,
		rowNum:10,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		rowList:[10,20,30],
		caption:'实体查询',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	jQuery("#entity_list1").jqGrid({
		datatype: "json",
		colNames:['id','资产编号','实体名称','地区','管理部门','实体现状','历史遗留问题','尚有人员数','原值（万元）','账面资产总额（万元）','账面资产负债（万元）','实体处置方式','实体状态'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'zcbh',index:'assertNumber'},
			{name:'stzwmc',index:'entityName'},
			{name:'CShengfen',index:'classification'},
			{name:'CGlbm',index:'dept',hidden:true},
			{name:'stxz2',index:'stxz2',hidden:true},
			{name:'ywlsylwt',index:'Ywlsylwt',hidden:true},	
			{name:'syrys',index:'syrys'},	
			{name:'yuanzhi',index:'yuanzhi'},
			{name:'zmzcze',index:'zmzcze',hidden:true},
			{name:'zmzcfz',index:'zmzcfz',hidden:true},
			{name:'c_czfs',index:'businessLicenseNum'},
			{name:'CStzt',index:'businessLicenseNum'}
		],
		pager:'pgtoolbar1',
		multiselect:true,
		rownumbers:true,
		rowNum:10,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		rowList:[10,20,30],
		caption:'实体查询',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	jQuery("#st_list").jqGrid({
		url:"<%=basePath%>hkgl/backConfirm_findConfirmBodyByConfirmHeadId.do?confirmHeadId="+confirmHeadId+'&type=4'+'&qrrbh='+qrrbh,
		datatype: "json",
		mtype:"POST",
		colNames:['id','实体id','实体编号','实体名称','实体省份','回款性质','回收现金金额','实体清理状态','是否已确认'],
		colModel :[
		    {name:'id', index:'id',align:'center',hidden:true}, 
			{name:'gqId', index:'gqId',align:'center'},
			{name:'gqStbh', index:'gqStbh',align:'center'}, 
			{name:'gqStmc', index:'gqStmc',align:'center'}, 
			{name:'gqSf', index:'gqSf',align:'center'},
			{name:'gqHkxz', index:'gqHkxz',align:'center',editable:true,formatter:"select",editable: true,edittype:"select",sortable:false,
				editoptions:{value:"固定资产处置回款:固定资产处置回款;承继债券投资回款:承继债券投资回款;实体债权回款:实体债权回款;承继长期股权投资分红回款:承继长期股权投资分红回款;确认担险委托贷款以及转回、核销回款:确认担险委托贷款以及转回、核销回款"}}, 
			{name:'gqHsxjje', index:'gqHsxjje',align:'center',editable:true},
			{name:'gqQlzt', index:'gqQlzt',align:'center',editable:true,editable:true,formatter:"select",editable: true,edittype:"select",sortable:false,
				editoptions:{value:"正常经营:正常经营;处于清理过程中:处于清理过程中;转让第三方完毕:转让第三方完毕;完成清算并已办理工商注销:完成清算并已办理工商注销;其他状态:其他状态"}},
			{name:'sfybc', index:'sfybc',align:'center'}
	 	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		loadComplete:function(data){
			if(data && data.rows.length>0){
					jQuery("#st_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#st_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		viewrecords:true,
		caption: '实体信息列表',
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	function getIndex(){
		jQuery("#entity_list03").jqGrid('clearGridData');
		jQuery("#entity_list1").jqGrid('clearGridData');
		var index=document.getElementById("stlx").value;
		if(index=="0"){
			document.getElementById("div03").style.display="block";
			document.getElementById("div1").style.display="none";
		}else if(index=="1"){
			document.getElementById("div03").style.display="none";
			document.getElementById("div1").style.display="block";
		}else if(index=="3"){
			document.getElementById("div03").style.display="block";
			document.getElementById("div1").style.display="none";
		}
	}
	
	function query(){
		var stlx = document.getElementById('stlx').value;
		var entityvoassertNumber = document.getElementById("assertNumber").value;
		var entityvoentityName = document.getElementById("entityName").value ;
		var CGlbm = document.getElementById("CGlbm").value ;
		var province = document.getElementById("province").value;
		var CWtgljg = document.getElementById("CWtgljg").value;
		if(stlx == '0'){
			jQuery("#entity_list03").setGridParam({
				postData:{
					'entityvo.assertNumber':'' + entityvoassertNumber,
					'entityvo.entityName':'' + entityvoentityName,
					'entityvo.CGlbm':'' + CGlbm,
					'entityvo.CWtgljg':'' + CWtgljg,
					'entityvo.province':''+ province
				},
				url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=0"
			}).trigger("reloadGrid");
		}else if(stlx == '1'){
			jQuery("#entity_list1").setGridParam({
				postData:{
					'entityvo.assertNumber':'' + entityvoassertNumber,
					'entityvo.entityName':'' + entityvoentityName,
					'entityvo.CGlbm':'' + CGlbm,
					'entityvo.CWtgljg':'' + CWtgljg,
					'entityvo.province':''+ province
				},
				url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=1"
			}).trigger("reloadGrid");
		}else if (stlx == '3'){
			jQuery("#entity_list03").setGridParam({
				postData:{
					'entityvo.assertNumber':'' + entityvoassertNumber,
					'entityvo.entityName':'' + entityvoentityName,
					'entityvo.CGlbm':'' + CGlbm,
					'entityvo.CWtgljg':'' + CWtgljg,
					'entityvo.province':''+ province
				},
				url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=3"
			}).trigger("reloadGrid");
		}
	}
	
	function saveThis03(){
		var gr = jQuery("#entity_list03").jqGrid('getGridParam','selarrrow');
		if(gr.length==0 || gr==null){
			alert('请先选择信息记录');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_saveSTtoConfirmBody.do";
		var stlx = document.getElementById('stlx').value;
		$.post(url,{"ids":""+gr+"","confirmHeadId":""+confirmHeadId+"","stlx":""+stlx+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#st_list").trigger("reloadGrid");
			}
		});
	}
	
	function saveThis1(){
		var gr = jQuery("#entity_list1").jqGrid('getGridParam','selarrrow');
		if(gr.length==0 || gr==null){
			alert('请先选择信息记录');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_saveSTtoConfirmBody.do";
		var stlx = document.getElementById('stlx').value;
		$.post(url,{"ids":""+gr+"","confirmHeadId":""+confirmHeadId+"","stlx":""+stlx+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#st_list").trigger("reloadGrid");
			}
		});
	}
	
	// 删除
	function deleteRelate(){
		var gr = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
		var url = "<%=basePath%>hkgl/backConfirm_deleteConfirmBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#st_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
	// 修改
	function editRelate(){
		ids = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		if(ids.length > 1)
			return false;
		$(ids).each(function(i,id){
			jQuery("#st_list").jqGrid('editRow',id);
		});
	}
	
	// 取消
	function cancelMessage(){
		if(ids && ids.length == 0)
			return false;
		$(ids).each(function(i,id){
			jQuery("#st_list").jqGrid('restoreRow',id);
		});	
	}
	
	// 保存
	function saveMessage(){
		ids = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		if(ids.length > 1)
			return false;
		$(ids).each(function(i,id){
			jQuery("#st_list").jqGrid('saveRow',id,function(returnObj){
				return true;
			},'<%=basePath %>hkgl/backConfirm_updateSTtoConfirmBody.do',{'1':'1'},function(){
				return true;
			});
		});	
	}
	
	// 确认保存
	function confirmThis(){
		var gr = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
		if(gr.length==0||gr==null){
			alert('请先选择要确认的项');
			return false;
		}
		var dzje = '<%=dzje%>';
		var sr = '0';
		for(var i=0;i<gr.length;i++){
			var gqHsxjje = jQuery("#st_list").getCell(gr[i],'gqHsxjje');
			if(gqHsxjje!=false){
				sr = parseFloat(sr) + parseFloat(gqHsxjje);
			}
		}
		if(parseFloat(sr)!=parseFloat(dzje)){
			alert('回收现金金额应与到账金额相等');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_confirmThisBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#st_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
		
</script>
</body>
</html>
