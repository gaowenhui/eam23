<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String fenlei = request.getParameter("fenlei");
	String quanshu = request.getParameter("quanshu");
	String assetType = request.getParameter("assetType");
	String option = request.getParameter("option");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>资产查询</title>
		<script type=text/JavaScript>
			var idStr = new Array();
			$(function(){	
				var buttonaddJSonString = '[{"buttonHandler":"view","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
				]';
				addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonaddJSonString);
			});
			// excel导出
			function excel(){
				 var urlStr = jQuery("#purchase_list").getGridParam('url');
				var sheettype = document.getElementById("sheettype").value;
				var zcbh = document.getElementById("zcbh").value;
				var zcmc = document.getElementById("zcmc").value;
				var zclx = document.getElementById("zclx").value;         
				var zczt = document.getElementById("zczt").value;
				var dq = document.getElementById("dq").value;
				var glbm = document.getElementById("glbmvalue").value;
				var sybm = document.getElementById("sybmvalue").value;
				var zlzt = document.getElementById("zlzt").value;
				var ejdq = document.getElementById("ejdq").value;
				var yjwtgljg = document.getElementById("yjwtgljgvalue").value;
				var ejwtgljg = document.getElementById("ejwtgljgvalue").value;
			    var cp = jQuery("#purchase_list").getGridParam('page');
			    var ps = jQuery("#purchase_list").getGridParam('rowNum');
			    
			    var params = "{\"queryBO.sheettype\":\"" + sheettype + "\",";
			    	params += "\"queryBO.quanshu\":\"<%=quanshu %>\",";
			    	params += "\"queryBO.fenlei\":\"<%=fenlei %>\",";
					params += "\"queryBO.zcbh\":\"" + zcbh + "\",";
					params += "\"queryBO.zcmc\":\"" + zcmc + "\",";
					params += "\"queryBO.zclx\":\"" + zclx + "\",";
					params = "{\"queryBO.zczt\":\"" + zczt + "\",";
					params += "\"queryBO.dq\":\"" + dq + "\",";
					params += "\"queryBO.glbm\":\"" + glbm + "\",";
					params += "\"queryBO.sybm\":\"" + sybm + "\",";
					params += "\"queryBO.zlzt\":\"" + zlzt + "\",";
					params += "\"queryBO.ejdq\":\"" + ejdq + "\",";
					params += "\"queryBO.yjwtgljg\":\"" + yjwtgljg + "\",";
					params += "\"queryBO.ejwtgljg\":\"" + ejwtgljg + "\",";
					params += "\"paginator.currentPage\":\"" + cp + "\",";
					params += "\"paginator.pageSize\":\"" + ps + "\"}";
				exportExcel("purchase_list", urlStr, params, '资产列表','rn,cb');
			}
			
			function view() {
				var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){	
					alert("一次只能查看一条资产")
				}else{
					window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				return false;
			};
			
			function query(){
				var sheettype = document.getElementById("sheettype").value;
				var zcbh = document.getElementById("zcbh").value;
				var zcmc = document.getElementById("zcmc").value;
				var zclx = document.getElementById("zclx").value;         
				var zczt = document.getElementById("zczt").value;
				var dq = document.getElementById("dq").value;
				var cardcode = document.getElementById("cardcode").value;
				var zcname = document.getElementById("zcname").value;
				var parentid = document.getElementById("parentid").value;
				var glbm = document.getElementById("glbmhiddenid").value;
				var sybm = document.getElementById("sybmhiddenid").value;
				var zlzt = document.getElementById("zlzt").value;
				var ejdq = document.getElementById("ejdq").value;
				var yjwtgljg = document.getElementById("yjwtgljghiddenid").value;
				var ejwtgljg = document.getElementById("ejwtgljghiddenid").value;
				jQuery("#purchase_list").setGridParam({
					postData:{
					'sheettype':sheettype,
					'queryBO.zcbh':zcbh,
					'queryBO.zcmc':zcmc,
					'queryBO.zclx':zclx,
					'queryBO.zczt':zczt,
					'queryBO.dq':dq,
					'queryBO.cardcode':cardcode,
					'queryBO.zcname':zcname,
					'queryBO.parentid':parentid,
					'queryBO.glbm':glbm,
					'queryBO.sybm':sybm,
					'queryBO.zlzt':zlzt,
					'queryBO.ejdq':ejdq,
					'queryBO.yjwtgljg':yjwtgljg,
					'queryBO.ejwtgljg':ejwtgljg,
					'queryBO.quanshu' : "<%=StringUtils.isEmpty(quanshu)?"":quanshu %>",
					'queryBO.fenlei' : "<%=fenlei %>"
					},
					url:"<%=basePath%>jygdzc/AssetQuery_query.do"
				}).trigger("reloadGrid");
			}
				
			function getValue(){
				var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
				if("<%=option%>" == "CJTZ"){
					window.parent.insertAsset(gr,"<%=quanshu %>","<%=fenlei %>","<%=assetType %>");
				}else{
					window.opener.insertAsset(gr,"<%=quanshu %>","<%=fenlei %>","<%=assetType %>");
				}
				window.close();
			}
			
			function openTreeByType(type4jygdzc){//打开树，根据类型打开类型  
				if(type4jygdzc =='glbm'||type4jygdzc =='sybm'||type4jygdzc =='yjwtgljg'||type4jygdzc =='ejwtgljg'){
					isSYBMorGLBM = type4jygdzc;
					type4jygdzc = 'department';
				}
				var url = "<%=request.getContextPath()%>/jygdzc/AssetQuery_toTree.do?type4Jygdzc="+type4jygdzc;
				var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
				window.open(url,'',_g_privateDialogFeatures);
			}
			   
			var isSYBMorGLBM = null;//弹出树是否为管理部门或使用部门
			function getCallBack4Tree(type4Jygdzc,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
				if(type4Jygdzc=='department'){
					type4Jygdzc = isSYBMorGLBM;
				}
				document.getElementById(type4Jygdzc+"hiddenid").value = id;
				document.getElementById(type4Jygdzc+"value").value 	= value;
			}
			
			//chenyuxiao添加 卡片挂接资产
			function forCard(){
				var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
				if(gr.length > 1){
					alert('只能选择一条记录');
				}else if( gr.length == 1 ){
					window.opener.jyzcinfo(gr);
					window.close();
				}else{
					alert('请选择一条记录');
				}
			}
			
			function lookAsset(gr){
				window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
	</script>
	<style>
		.STYLE1 {
			font-size: 20px;
			font-family: "simsun";
			font-weight: bold;
			color: #0000ff;
		}
	</style>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:hidden name="sheettype" id="sheettype" value="%{#request.sheettype}" />
		<s:hidden name="quanshu" id="queryBO.quanshu"/>
		<s:hidden name="fenlei" id="queryBO.fenlei"/>
		<table id="table" width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">
					资产编号：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.zcbh" id="zcbh" />
				</td>
				<td class="td_zxy01">
					资产名称：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.zcmc" cssClass="input" id="zcmc" />
				</td>
			</tr><tr>
				<td class="td_zxy01">
					资产类型：
				</td>
				<td class="td_zxy02">
					<e:select cssClass="input" parRefKey="ASSET_TYPE" headerKey="" headerValue="" list="#{}" name="queryBO.zclx" id="zclx" value="" />
				</td>
				<td class="td_zxy01">
					资产状态：
				</td>
				<td class="td_zxy02">
					<e:select cssClass="input" parRefKey="ASSET_STATUS" headerKey="" headerValue=""
						list="#{}" name="queryBO.zczt" id="zczt" value="0" />
				</td>
			</tr><tr>				
				<td class="td_zxy01">
					地区：
				</td>
				<td class="td_zxy02">
					<e:select cssClass="input" parRefKey="PROVIENCE" headerKey="" headerValue=""
						 list="#{}" name="queryBO.dq" id="dq" />
				</td>
				<td class="td_zxy01">
					卡片编号：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.cardcode" cssClass="input" id="cardcode" />
				</td>
			</tr><tr>
				<td class="td_zxy01">
					卡片名称：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.zcname" cssClass="input" id="zcname" />
				</td>
				<td class="td_zxy01">
					卡片类型：
				</td>
				<td class="td_zxy02">
					<e:select cssClass="input" parRefKey="CARD_TYPE" list="#{}" headerKey=""
						headerValue="" value="" id="parentid" name="queryBO.parentid" />
				</td>
			</tr><tr>
				<td class="td_zxy01">
					管理部门：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.glbm" id="glbmvalue" size="30"
						readonly="true" />
					<s:hidden name='queryBO.glbm' id='glbmhiddenid'></s:hidden>
					<img src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType('glbm');" width="21" height="20" align="absmiddle" />
				</td>

				<td class="td_zxy01">
					使用部门：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.sybm" id="sybmvalue" size="30"
						readonly="true" />
					<s:hidden name='queryBO.sybm' id='sybmhiddenid'></s:hidden>
					<img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType('sybm');" width="21" height="20"
						align="absmiddle" />
				</td>
			</tr><tr>
				<td class="td_zxy01">
					当前租赁状态：
				</td>
				<td class="td_zxy02">
					<e:select cssClass="input" parRefKey="ASSET_RENT_STATE" headerKey="" headerValue=""
						list="#{}" name="queryBO.zlzt" id="zlzt" value="0" />
				</td>
				<td class="td_zxy01">
					一级分行：
				</td>
				<td class="td_zxy02">
					<e:select cssClass="input" parRefKey="department" headerKey="" headerValue=""
						parentId="438" list="#{}" id="ejdq" name="queryBO.ejdq" />
				</td>
			</tr><tr>
				<td class="td_zxy01">
					一级委托管理机构：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.yjwtgljg" id="yjwtgljgvalue" size="30"
						readonly="true" />
					<s:hidden name='queryBO.yjwtgljg' id='yjwtgljghiddenid'></s:hidden>
					<img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType('yjwtgljg');" width="21" height="20"
						align="absmiddle" />
				</td>
				<td class="td_zxy01">
					二级委托管理机构：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" name="queryBO.ejwtgljg" id="ejwtgljgvalue" size="30"
						readonly="true" />
					<s:hidden name='queryBO.ejwtgljg' id='ejwtgljghiddenid'></s:hidden>
					<img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType('ejwtgljg');" width="21" height="20"
						align="absmiddle" />
				</td>
			</tr>
			<tr>
				<td colspan="4" class="td_zxy01">
					<input name="Submit1" type="button"  value="确定" onclick="getValue();return false;" />
					<input name="Submit2" type="button"  value="查询" onclick="query()" />
					<input name="Submit3" type="button"  value="重置"
						onclick="javascript:window.location.reload();" />
				</td>
			</tr>
		</table>
		<table id="purchase_list"></table>
		<div id="pgtoolbar1"></div>
		<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>
<script type="text/javascript">
	var idStr = new Array();
	jQuery("#purchase_list").jqGrid({
	    url:"<%=basePath %>jygdzc/AssetQuery_query.do",
		datatype:"json",
		postData:{
			'queryBO.quanshu' : "<%=StringUtils.isEmpty(quanshu)?"":quanshu %>",
			'queryBO.fenlei' : "<%=StringUtils.isEmpty(fenlei)?"":fenlei %>"			
		},
		mtype:"POST",
		colNames:['id','资产编号','资产名称','卡片编号','卡片名称','资产类型','经营分类','资产状态','地区','管理部门','使用部门','当前租赁状态','二级地区','一级委托管理机构','二级委托管理机构'],
		colModel:[
		    {name:'id',index:'id',align:"center",hidden:true},
			{name:'zcbh',index:'zcbh',align:"center"},
			{name:'zcmc',index:'zcmc',align:"center"},
			
			{name:'cardcode',index:'cardcode',align:"center"},
			{name:'zcname',index:'zcname',align:"center"},
			
			{name:'CZclx',index:'CZclx',align:"center"},
			{name:'CJyfl',index:'CJyfl',align:"center"},
			{name:'CZczc',index:'CZczc',align:"center"},
			{name:'CZcdq',index:'CZcdq',align:"center"},
			{name:'glbm',index:'glbm',align:"center"},
			{name:'sybm',index:'sybm',align:"center"},
			{name:'zlzt',index:'zlzt',align:"center"},
			{name:'ejdq',index:'ejdq',align:"center"},
			{name:'CYjwtjg',index:'CYjwtjg',align:"center"},
			{name:'CErwtjg',index:'CErwtjg',align:"center"}
		],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		pager:'pgtoolbar1',
		viewrecords:true,
		caption:'资产列表',
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  	rowList:[10,20,30],
	  	ondblClickRow:function(gr){
			lookAsset(gr);
		},
		onSelectRow: function(rowid, status){
			if(status){
				idStr.insert(idStr.length, rowid);
			}else{
				idStr.remove(rowid);
			}
		},
		onSelectAll:function(ids, status){
			if(status){
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index == -1){
							idStr.insert(idStr.length, ids[i]);
						}
					}
				}
			}else{
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index != -1){
							idStr.removeAt(index);
						}
					}
				}
			}
		},
		gridComplete:function(){
			var allIds = jQuery("#purchase_list").jqGrid('getDataIDs');
			for(var i = 0; i < allIds.length; i++){
				var index = idStr.indexOf(allIds[i]);
				if(index != -1){
					idStr.removeAt(index);
					jQuery("#purchase_list").setSelection(allIds[i]);
				}
			}
		},
		jsonReader:{
			root:"rows",
			page:"page",
			total:"total",
			records:"records",
			repeatitems:false,
			id:"0"
		},
		loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#purchase_list").setGridHeight(0);
			}		
		},			
		shrinkToFit:false	
	});                 
     jQuery("#purchase_list").setGridWidth($("#table").width());
	 	  $(window).bind('resize', function(){
				jQuery("#purchase_list").setGridWidth($("#table").width());
	});
</script>