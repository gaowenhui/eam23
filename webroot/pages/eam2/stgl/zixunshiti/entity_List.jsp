<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String zixunType = (String) request.getAttribute("zixunType");
	zixunType = zixunType == null ? "" : zixunType;
	String jyfl = (String) request.getAttribute("jyfl");
	jyfl = jyfl == null ? "" : jyfl;
	String option = (String) request.getParameter("option");
	//资产处置option="zccz" 实体管理option="stgl" 评估审查（股权）option＝"pgsc_gq" 承继投资option=CJTZ
	String zcczStid = (String) request.getParameter("zcczStid");
	zcczStid = zcczStid == null ? "" : zcczStid;
	String zcczHeadId = (String) request.getParameter("zcczHeadId");
	zcczHeadId = zcczHeadId == null ? "" : zcczHeadId;
	String debtSign = (String) request.getAttribute("debtSign"); //债权管理
	//实体相关
	String stglStid = (String) request.getParameter("stglStid");
	stglStid = stglStid == null ? "" : stglStid;
	String zichanweihu = (String) request.getParameter("zichanweihu");
	zichanweihu = zichanweihu == null ? "" : zichanweihu;
	String zcczpg = (String) request.getAttribute("zcczpg"); //资产评估处置
	String ctlButton = (String) request.getAttribute("ctlButton");
	String ispgsc = (String)request.getAttribute("ispgsc");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<base href="<%=basePath%>" />
<title>实体查询</title>
<script type="text/javascript">
	var idStr = new Array();
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
	
	$(document).ready(function(){	
		if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
		//添加按钮
		if("zccz" == "<%=option%>" || "stgl" == "<%=option%>" || "pgsc_gq" == "<%=option%>"){
			var buttonJSonString = '[{"buttonHandler":"okAss","buttonIcon":"icon-ok","buttonText":"确定"}]';
		}else if("CJTZ" == "<%=option%>"){
			var buttonJSonString = '[{"buttonHandler":"okAssForCjtz","buttonIcon":"icon-ok","buttonText":"确定"}]';			
		}else if("<%=zichanweihu%>" != "" ){
			var buttonJSonString = '[{"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"}]';
		}else if("<%=debtSign%>" == "1" ){
			var buttonJSonString = '[{"buttonHandler":"conFirmZqglAss","buttonIcon":"icon-ok","buttonText":"确定"}\
									]';
		}else{
			var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									 {"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
									 {"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									 {"buttonHandler":"excel","buttonIcon":"icon-save","buttonText":"导出"}\
									]';
		}		
		if("hidden" != "<%=ctlButton%>"){
			addButtons(jQuery("#gview_entity_list > .ui-jqgrid-titlebar"),buttonJSonString);
		}					
		jQuery("#entity_list").setGridWidth($("#tableWidth").width());
	    $(window).bind('resize', function(){
			jQuery("#entity_list").setGridWidth($("#tableWidth").width());
	    });
	});

	function okAssForCjtz(){
		var stIds = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
		if(stIds == ''){
			alert('请选择实体!');
		}else{
			window.parent.addSt(stIds);
		}
	}

	function okAss(){
		if("zccz" == "<%=option%>"){
	//资产处置（选择实体，单选）
			var stId = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
			if(stId.length < 1){
				alert("请选择实体");
			}else if(stId.length > 1){
				alert("只能选择一个实体");
			}else{
				window.opener.setComMessage(stId);
				window.close();
			}
		}else if("pgsc_gq" == "<%=option%>"){
	//评估审查（选择股权，可多选）
			//var stId = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
			var stId = idStr;
			if(stId.length < 1){
				alert("请选择实体");
			}else{
				window.opener.setComMessage(stId,"3");
				window.close();
			}
		}else if("stgl" == "<%=option%>"){
		//===========耿晓丽,实体管理用===================
			//var stId = jQuery("#entity_list").jqGrid('getGridParam','selrow');
			var stId = idStr;
			if(stId.length < 1){
				alert("请选择实体");
			}else if(stId.length > 1){
			    alert("只能选择一家实体");
			}else{
				$.post("<%=basePath%>stgl/xuanshiti_linkEntitiesRel.do",{
					"stGlbt.stid" : '' + stId,
					"oldStid" : "<%=stglStid%>"
				},function(returnStr){
					window.opener.setLinkEntitiesRel(returnStr);
					window.close();
				});
			}
		}
		//===========耿晓丽,实体管理用===================		
		
	}
	//-------------债权管理 begin------------------
	function conFirmZqglAss(){
		var gr = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
		if(gr.length < 1){
			alert("请选择实体");
		}else if(gr.length > 1){
			alert("只能选择一个实体");
		}else{
			window.opener.getEntity(gr);
			window.close();
		}
	}
	//-------------债权管理 end------------------
	function lookAss(){
		var gr = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
		if(gr.length == 0 ){
			alert("请选择要查看的记录")
		}else if (gr.length > 1){
			alert("只能选择一条要查看的记录")
		}else{
		if("0" == <%=zixunType%> || "3" == <%=zixunType%>){
			window.open('<%=basePath%>stgl/weihu_newEntity.do?stid='+gr+'&stlx='+0+'&rework='+1+'&look='+1);
		}else if("1" == <%=zixunType%>){
			window.open('<%=basePath%>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+gr+'&stlx='+1+'&look='+1);
		}
		return false;
		}
	}
	
	function lookdblclickAss(gr){
		if('1' != '<%=debtSign%>'){
			var ctlButton = document.getElementById("ctlButton").value;
			var stid = gr;
			if(gr.length == 0  ){
				alert("请选择要查看的记录")
			}else if (gr.length > 32){
				alert("只能选择一条要查看的记录")
			}else{
				if("0" == <%=zixunType%> || "3" == <%=zixunType%>){
					window.open('<%=basePath%>stgl/weihu_newEntity.do?optionType=${optionType}&option=<%=option%>&stid='+gr+'&stlx='+0+'&rework='+1+'&ctlButton='+ctlButton+'&assetType=1'+'&zcczpg='+'<%=zcczpg%>'+'&zixunType='+'<%=zixunType%>'+'&ispgsc='+'<%=ispgsc%>');
				}else if("1" == <%=zixunType%>){
					var zixunType = <%=zixunType%>;
					window.open('<%=basePath%>stgl/weihu_newNonEntity.do?optionType=${optionType}&option=<%=option%>&rework='+1+'&stid='+gr+'&stlx='+1+'&ctlButton='+ctlButton+'&assetType=1'+'&zcczpg='+'<%=zcczpg%>'+'&zixunType='+'<%=zixunType%>'+'&ispgsc='+'<%=ispgsc%>');
				}
				return false;
			}
		}
	}
	
	function addAss(){
		var rdBasicWidth = "1000px";
		var rdBasicHeight = "800px";
		var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
		if("0" == <%=zixunType%> || "3" == <%=zixunType%>){
//		var returnValue = window.showModalDialog('<%=basePath%>stgl/weihu_newEntity.do', window, _g_privateDialogFeatures);
		window.open('<%=basePath%>stgl/weihu_newEntity.do?newAdd='+1+'&zcczpg='+'<%=zcczpg%>');
		}else if("1" == <%=zixunType%>){
			//var returnValue = window.showModalDialog('<%=basePath%>stgl/weihu_newNonEntity.do', window, _g_privateDialogFeatures);
			window.open('<%=basePath%>stgl/weihu_newNonEntity.do?newAdd='+1+'&zcczpg='+'<%=zcczpg%>','',winVar);
		}
		return false;
	}
		
	function modifyAss(){
		var gr = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
		var stid = gr;
		var rdBasicWidth = "1000px";
		var rdBasicHeight = "800px";
		var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
		if(gr.length == 0 ){
			alert("请选择要修改的记录")
		}else if (gr.length > 1){
			alert("只能选择一条要修改的记录")
		}else {
			if("0" == <%=zixunType%> || "3" == <%=zixunType%>){
				window.open('<%=basePath%>stgl/weihu_newEntity.do?stid='+gr+'&stlx='+0+'&rework='+1+'&zcczpg='+'<%=zcczpg%>','',winVar);
			}else if("1" == <%=zixunType%>){
				window.open('<%=basePath%>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+gr+'&stlx='+1+'&zcczpg='+'<%=zcczpg%>','',winVar);
			}
			return false;
		}
	}
		
	function delAss(){
		var gr = jQuery("#entity_list").jqGrid('getGridParam','selarrrow');
		if( gr.length > 0 ) {
			if(confirm("确认删除！")){
				$.post("<%=request.getContextPath()%>/stgl/weihu_deleteStJbxx.do",{
					"fsxxIds":"" + gr
				},function(returnStr){
					alert(returnStr);
					$("#entity_list").trigger("reloadGrid");
				});
			}
				
		}
		else{
			alert("请选择要删除的记录!"); 		
		}
	}
	
	
	
	 function modssglAss(){
		var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
		alert("|"+gr+"|");
		if(gr.length > 1){
			alert('只能修改一条记录');
		}else if( gr != '' &&gr.length == 1 ){
			var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			if(typeof(result)!='undefined'){
				jQuery("#ssgl_list").trigger("reloadGrid");
			}else{
				jQuery("#ssgl_list").trigger("reloadGrid");
			}
		}else if(gr == ''||gr ==null) {
			alert("请选择要修改的记录1");
		}else{
			alert("请选择要修改的记录2");
		}
	}
	
	// ===================================excel导出==================================
	function excel(){
		var entityvoassertNumber = document.getElementById("assertNumber").value;
		var entityvoentityName = document.getElementById("entityName").value ;
		var CGlbm = document.getElementById("CGlbm").value ;
		var CWtgljg = document.getElementById("CWtgljg").value;
		var CStzt = document.getElementById("CStzt").value;
		var province = document.getElementById("province").value;
		var c_czfs = document.getElementById("c_czfs").value;
		if(<%=zixunType%> == 0 ){
			var jyfl = document.getElementById("jyfl").value;
			//var urlStr = jQuery("#entity_list").getGridParam('url');
			var urlStr = 'com.tansun.eam2.stgl.actions.CEMEntityMaintainAction0&com.tansun.eam2.stgl.vo.EntityQueryVO';
 		  	var cp = jQuery("#entity_list").getGridParam('page');
 			var ps = jQuery("#entity_list").getGridParam('rowNum');
	 		var params = "{\"entityvo.entityvoassertNumber\":\"" + entityvoassertNumber + "\",";
				params += "\"entityvo.entityvoentityName\":\"" + entityvoentityName + "\",";
				params += "\"entityvo.CGlbm\":\"" + CGlbm + "\",";
				params += "\"entityvo.CWtgljg\":\"" + CWtgljg + "\",";
				params += "\"entityvo.province\":\"" + province + "\",";
				params += "\"entityvo.jyfl\":\"" + jyfl + "\",";
				params += "\"entityvo.CStzt\":\"" + CStzt + "\",";
				params += "\"entityvo.c_czfs\":\"" + c_czfs + "\",";
			//	params += "\"zixunType\":\"" + <%=zixunType%> + "\",";
				//params += "\"debtSign\":\"" + <%=debtSign%> + "\",";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 1000000 + "\"}";
			   exportExcel("entity_list", urlStr, params, '实体列表','rn,cb');
		}else if(<%=zixunType%> == 1){
		//	var urlStr = jQuery("#entity_list").getGridParam('url');
		var urlStr = 'com.tansun.eam2.stgl.actions.CEMEntityMaintainAction1&com.tansun.eam2.stgl.vo.EntityQueryVO';
		  	var cp = jQuery("#entity_list").getGridParam('page');
 			var ps = jQuery("#entity_list").getGridParam('rowNum');
			var params = "{\"entityvo.entityvoassertNumber\":\"" + entityvoassertNumber + "\",";
				params += "\"entityvo.entityvoentityName\":\"" + entityvoentityName + "\",";
				params += "\"entityvo.CGlbm\":\"" + CGlbm + "\",";
				params += "\"entityvo.CWtgljg\":\"" + CWtgljg + "\",";
				params += "\"entityvo.province\":\"" + province + "\",";
				params += "\"entityvo.CStzt\":\"" + CStzt + "\",";
				params += "\"entityvo.c_czfs\":\"" + c_czfs + "\",";
				//params += "\"zixunType\":\"" + <%=zixunType%> + "\",";
				params += "\"paginator.currentPage\":\"" + cp + "\",";
				params += "\"paginator.pageSize\":\"" + 100000 + "\"}";
			exportExcel("entity_list", urlStr, params, '实体列表','rn,cb');
		}else if (<%=zixunType%> == 3){
			//var urlStr = jQuery("#entity_list").getGridParam('url');
			var urlStr = 'com.tansun.eam2.stgl.actions.CEMEntityMaintainAction&com.tansun.eam2.stgl.vo.EntityQueryVO';
		  	var cp = jQuery("#entity_list").getGridParam('page');
 			var ps = jQuery("#entity_list").getGridParam('rowNum');
			var params = "{\"entityvo.entityvoassertNumber\":\"" + entityvoassertNumber + "\",";
				params += "\"entityvo.entityvoentityName\":\"" + entityvoentityName + "\",";
				params += "\"entityvo.CGlbm\":\"" + CGlbm + "\",";
				params += "\"entityvo.CWtgljg\":\"" + CWtgljg + "\",";
				params += "\"entityvo.province\":\"" + province + "\",";
				params += "\"entityvo.CStzt\":\"" + CStzt + "\",";
				params += "\"entityvo.c_czfs\":\"" + c_czfs + "\",";
				//params += "\"zixunType\":\"" + <%=zixunType%> + "\",";
				//params += "\"debtSign\":\"" + <%=debtSign%> + "\",";
				params += "\"paginator.currentPage\":\"" + cp + "\",";
				params += "\"paginator.pageSize\":\"" + 100000 + "\"}";
			exportExcel("entity_list", urlStr, params, '实体列表','rn,cb');
		}
	}
		

	function query(){
		var entityvoassertNumber = document.getElementById("assertNumber").value;
		var entityvoentityName = document.getElementById("entityName").value ;
		var CGlbm = document.getElementById("CGlbm").value ;
		var CWtgljg = document.getElementById("CWtgljg").value;
		var province = document.getElementById("province").value;
		var CStzt = document.getElementById("CStzt").value;
		var c_czfs = document.getElementById("c_czfs").value;
		if(<%=zixunType%> == 0 ){
			var jyfl = document.getElementById("jyfl").value;
			jQuery("#entity_list").setGridParam({postData:{
				'entityvo.assertNumber':'' + entityvoassertNumber,
				'entityvo.entityName':'' + entityvoentityName,
				'entityvo.jyfl':'' + jyfl,
				'entityvo.CGlbm':'' + CGlbm,
				'entityvo.CWtgljg':'' + CWtgljg,
				'entityvo.province':''+ province,
				'entityvo.CStzt':''+ CStzt,
				'entityvo.c_czfs':''+ c_czfs
			},
			url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=" + <%=zixunType%> + "&ispgsc=" + <%=ispgsc%>
			}).trigger("reloadGrid");
		}else if(<%=zixunType%> == 1){
			jQuery("#entity_list").setGridParam({postData:{
				'entityvo.assertNumber':'' + entityvoassertNumber,
				'entityvo.entityName':'' + entityvoentityName,
				'entityvo.CGlbm':'' + CGlbm,
				'entityvo.CWtgljg':'' + CWtgljg,
				'entityvo.province':''+ province,
				'entityvo.CStzt':''+ CStzt,
				'entityvo.c_czfs':''+ c_czfs
			},
			url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=" + <%=zixunType%> + "&ispgsc=" + <%=ispgsc%>
			}).trigger("reloadGrid");
		}else if (<%=zixunType%> == 3){
			jQuery("#entity_list").setGridParam({postData:{
				'entityvo.assertNumber':'' + entityvoassertNumber,
				'entityvo.entityName':'' + entityvoentityName,
				'entityvo.CGlbm':'' + CGlbm,
				'entityvo.CWtgljg':'' + CWtgljg,
				'entityvo.province':''+ province,
				'entityvo.CStzt':''+ CStzt,
				'entityvo.c_czfs':''+ c_czfs
			},
			url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=" + <%=zixunType%> + "&ispgsc=" + <%=ispgsc%>
			}).trigger("reloadGrid");
		}
	}

	function reloadGrid(){
		jQuery("#entity_list").setGridParam({
		}).trigger("reloadGrid");
	}
</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="" method="post" id="myform">
			<s:hidden value="%{#request.ctlButton}" id="ctlButton" />
			<s:hidden name="entityvo.zixunType" id="zixunType" value="%{#request.zixunType}"></s:hidden>
			<table id="tableWidth" width="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td height="25" align="center" valign="bottom" class="td06">

						<table width="100%" border="0" cellspacing="3" cellpadding="0">
							<tr>
								<td width="15">
									<img src="resource/ProjectImages/index_32.gif" width="9"
										height="9">
								</td>
								<td valign="bottom" class="title">
									<div align="left" colspan="6">
										实体查询
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table class="newtable" width="100%" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td width="11%" class="td_zxy01">
						资产编号：
					</td>
					<td width="22%" class="td_zxy02">
						<s:textfield name="entityvo.assertNumber" id="assertNumber" />
					</td>
					<td width="11%" class="td_zxy01">
						实体中文名称：
					</td>
					<td width="22%" class="td_zxy02">
						<s:textfield name="entityvo.entityName" id="entityName" />
					</td>

					<td width="11%" nowrap class="td_zxy01">
						<%
							if ("0".equals(zixunType)) {
						%>
						经营分类：
						<%
							} else if ("1".equals(zixunType) || "3".equals(zixunType)) {
						%>
						地区：
						<%
							}
						%>
					</td>
					<td width="22%" class="td_zxy02">
						<%
							if ("0".equals(zixunType)) {
						%>
						<s:select list="#{'':'请选择',0:'持续经营类',1:'处置类'}"
							name="entityvo.jyfl" id="jyfl"></s:select>
						<%
							} else if ("1".equals(zixunType) || "3".equals(zixunType)) {
						%>
						<e:select parRefKey="PROVIENCE" list="#{}" headerKey=""
							headerValue="请选择" name="entityvo.province" id="province" value="" />
						<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01" width="11%">
						管理部门：
					</td>
					<td class="td_zxy02" width="22%">
						<s:select list="#{'':'请选择',1:'委托代理业务部',2:'资产管理处置部'}"
							name="entityvo.CGlbm" id="CGlbm"></s:select>
					</td>
					<td class="td_zxy01" width="11%">
						委托管理机构：
					</td>
					<td class="td_zxy02" width="22%">
						<s:textfield name="entityvo.CWtgljg" id="CWtgljg" />
					</td>
					<%
						if ("0".equals(zixunType)) {
					%>
					<td class="td_zxy01" nowrap width="11%">
						地区：
					</td>
					<td class="td_zxy02" width="22%">
						<e:select parRefKey="PROVIENCE" headerKey="" headerValue="请选择"
							list="#{}" name="entityvo.province" id="province" value="" />
					</td>
					<%
						} else if ("1".equals(zixunType) || "3".equals(zixunType)) {
					%>
					<td class="td_zxy01" nowrap width="11%">
						实体状态：
					</td>
					<td class="td_zxy02" width="22%">
						<e:select headerKey="" headerValue="请选择" parRefKey="ENTITY_STATUS"
							list="#{}" name="entityvo.CStzt" id="CStzt" value="" />
						<%
							}
						%>
					
				</tr>
				<%
					if ("0".equals(zixunType)) {
				%>
				<tr>
					<td class="td_zxy01" width="11%">
						实体状态：
					</td>
					<td class="td_zxy02" width="22%">
						<e:select headerKey="" headerValue="请选择" parRefKey="ENTITY_STATUS"
							list="#{}" name="entityvo.CStzt" id="CStzt" value="" />
					<td width="11%" class="td_zxy01">
						实体处置方式：
					</td>
					<td class="td_zxy02" width="22%">
						<e:select parRefKey="ENTITY_DISPOSE_METHOD" headerKey=""
							headerValue="请选择" list="#{}" name="st.c_czfs" id="c_czfs"
							value="%{#request.st.c_czfs }" />
					</td>
					<td width="11%" class="td_zxy01">
						&nbsp;
					</td>
					<td class="td_zxy02" width="22%">
						&nbsp;
					</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td class="td_zxy01" width="11%">
						实体处置方式：
					</td>
					<td class="td_zxy02" width="22%">
						<e:select parRefKey="ENTITY_DISPOSE_METHOD" headerKey=""
							headerValue="请选择" list="#{}" name="st.c_czfs" id="c_czfs"
							value="%{#request.st.c_czfs }" />
					</td>
					<td class="td_zxy01" width="11%">
						&nbsp;
					</td>
					<td class="td_zxy02" width="22%">
						&nbsp;
					</td>
					<td class="td_zxy01" width="11%">
						&nbsp;
					</td>
					<td class="td_zxy02" width="22%">
						&nbsp;
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td class="td_zxy02" colspan="6">
						<div align="right">
							<input type='button' value='查询' onClick="query()"
								style='height: 20px; font-size: -3' />
							<input type="reset" name="ggg" value='重置'
								style='height: 20px; font-size: -3' />
						</div>
					</td>
				</tr>
			</table>
			<br />
			<table width="98%" border="0" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td height="5" align="right">
						<table id="entity_list">
						</table>
						<div id="pgtoolbar1"></div>
					</td>
				</tr>
			</table>

			<script type="text/javascript">
	   <%if("0".equals(zixunType) || "3".equals(zixunType)) {%>
				jQuery("#entity_list").jqGrid({
					url:"#",
					datatype: "json",
					postData:{
						"entityvo.jyfl":"<%=jyfl%>",
						"zixunType":"<%=zixunType%>",
						"debtSign":"<%=debtSign%>"
					},
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
					pager:'pgtoolbar1',
					<% if(request.getParameter("multiselect") == null){ %>
						multiselect:true,
					<%}%>
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					rowList:[10,20,30],
					caption:'实体查询',
					toolbar:[false,"top"],
					ondblClickRow:function(rowid){
						lookdblclickAss(rowid);
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
						var allIds = jQuery("#entity_list").jqGrid('getDataIDs');
						for(var i = 0; i < allIds.length; i++){
							var index = idStr.indexOf(allIds[i]);
							if(index != -1){
								idStr.removeAt(index);
								jQuery("#entity_list").setSelection(allIds[i]);
							}
						}
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

		<%} else if ("1".equals(zixunType)){%>
				jQuery("#entity_list").jqGrid({
				//url:"<%=basePath%>stgl/weihu_listEntities.do?zixunType=" + <%=zixunType%>,
					datatype: "json",
					postData:{
						"entityvo.jyfl":"<%=jyfl%>",
						"zixunType":"<%=zixunType%>"
					},					
					mtype:"POST",
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
					<% if(request.getParameter("multiselect") == null){ %>
						multiselect:true,
					<%}%>
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  				rowList:[10,20,30],
					caption:'实体查询',
					toolbar:[false,"top"],
					ondblClickRow:function(rowid){
						lookdblclickAss(rowid);
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
						var allIds = jQuery("#entity_list").jqGrid('getDataIDs');
						for(var i = 0; i < allIds.length; i++){
							var index = idStr.indexOf(allIds[i]);
							if(index != -1){
								idStr.removeAt(index);
								jQuery("#entity_list").setSelection(allIds[i]);
							}
						}
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
		<%} %>
		</script>
		</s:form>
		<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>
