<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String option = (String) request.getParameter("option");
	String cldId = (String) request.getParameter("cldId");
	String jzr = (String) request.getParameter("jzr");
	String ywlx = "null".equals((String) request.getParameter("ywlx"))?"":(String) request.getParameter("ywlx");
	String ejbmbh = "";
	String ejbm = (String)request.getAttribute("ejbm");
	ejbmbh = ejbm;
	String erwtgljg = (String)request.getAttribute("erwtgljg");
	String yjwtgljg = (String)request.getAttribute("yjwtgljg");
	String erwtgljgName = (String)request.getAttribute("erwtgljgName");
	boolean isForCard = false;
	boolean returnValue = false;
	boolean mulSelect = true;
	boolean isModal=false;
	isModal = "true".equals((String)request
			.getAttribute("isModal"))? true : false;
	returnValue = "true".equals((String) request
			.getAttribute("returnValue")) ? true : false;
	isForCard = "true".equals((String) request
			.getAttribute("isForCard")) ? true : false;
	mulSelect = "false".equals((String) request
			.getAttribute("mulSelect")) ? false : true;
	String headId = (String)request.getAttribute("headId");		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>资产查询</title>
		<script type=text/JavaScript>
			var idStr = new Array();
			$(function(){	
				if(window.parent.clearPanelTool){
					window.parent.clearPanelTool();
				}
				var buttonaddJSonString = '[{"buttonHandler":"view","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"条件导出"}\
				]';
				//{"buttonHandler":"excel4Elect","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
				addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonaddJSonString);
				jQuery("#purchase_list").setGridWidth($("#table").width());
	 	 		$(window).bind('resize', function(){
					jQuery("#purchase_list").setGridWidth($("#table").width());
				});
				//代理机构登录，一级委托管理机构，不让选，二级委托管理机构值固定
				<%
					if("11262".equals(yjwtgljg)){	
				%>
						document.getElementById("ejwtgljghiddenid").value = "<%=erwtgljg%>";
						document.getElementById("ejwtgljgvalue").value = "<%=erwtgljgName%>";
				<%
					}else if("113".equals(yjwtgljg)){	
				%>
				//建银实业登录，一级委托管理机构，值固定，不让选，二级委托管理机构可选
						document.getElementById("yjwtgljghiddenid").value = "<%=yjwtgljg%>";
				<%
					}
				%>				
			});
			// excel导出
			function excel(){
				//var urlStr ="<%=basePath%>jygdzc/AssetQuery_query.do";
				//var ejbmbh = '<%=ejbmbh%>';
				var urlStr = "com.tansun.eam2.jygdzc.action.AssetQueryAction&com.tansun.eam2.jygdzc.vo.QueryBO";
				//var urlStr = jQuery("#purchase_list").getGridParam('url');
				var sheettype = document.getElementById("sheettype").value;
				var zcbh = document.getElementById("zcbh").value;
				var zcmc = document.getElementById("zcmc").value;
				var zclx = document.getElementById("zclx").value;  
				var jyfl = document.getElementById("jyfl").value;
				var zczt = document.getElementById("zczt").value;
				var dq = document.getElementById("dq").value;
				var cardcode = document.getElementById("cardcode").value;
				var zcname = document.getElementById("zcname").value;
				var parentid = document.getElementById("parentid").value;
				var glbm = document.getElementById("glbmvalue").value;
				var sybm = document.getElementById("sybmvalue").value;
				var zlzt = document.getElementById("zlzt").value;
				var ejdq = document.getElementById("ejdq").value;
				var yjwtgljg = document.getElementById("yjwtgljghiddenid").value;
				var ejwtgljg = document.getElementById("ejwtgljghiddenid").value;
			    var cp = jQuery("#purchase_list").getGridParam('page');
			    var ps = jQuery("#purchase_list").getGridParam('rowNum');
			    var params = "{\"queryBO.sheettype\":\"" + sheettype + "\",";
					params += "\"queryBO.zcbh\":\"" + zcbh + "\",";
					params += "\"queryBO.zcmc\":\"" + zcmc + "\",";
					params += "\"queryBO.zclx\":\"" + zclx + "\",";
					params += "\"queryBO.jyfl\":\"" + jyfl + "\",";
					params += "\"queryBO.zczt\":\"" + zczt + "\",";
					params += "\"queryBO.dq\":\"" + dq + "\",";
					params += "\"queryBO.parentid\":\"" + parentid + "\",";
					params += "\"queryBO.cardcode\":\"" + cardcode + "\",";
					params += "\"queryBO.zcname\":\"" + zcname + "\",";
					params += "\"queryBO.glbm\":\"" + glbm + "\",";
					params += "\"queryBO.sybm\":\"" + sybm + "\",";
					params += "\"queryBO.zlzt\":\"" + zlzt + "\",";
					params += "\"queryBO.ejdq\":\"" + ejdq + "\",";
					params += "\"queryBO.yjwtgljg\":\"" + yjwtgljg + "\",";
					params += "\"queryBO.ejwtgljg\":\"" + ejwtgljg + "\",";
					params += "\"paginator.currentPage\":\"" + 1 + "\",";
					params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
				exportExcel("purchase_list", urlStr, params, '资产列表','rn,cb');
			}
			function excel4Elect(){
				var urlStr = "<%=basePath%>jygdzc/AssetQuery_query4Elect.do&com.tansun.eam2.jygdzc.vo.QueryBO";
				if(idStr!=null && idStr.length >= 1&&""!=idStr){
					var params = "{\"idStr\":\"" + idStr + "\"}";
					exportExcel("purchase_list", urlStr, params, '资产列表','rn,cb');
				}else{
					alert("请选择资产");
				}
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
				idStr = new Array();
				//var ejbmbh = '<%=ejbmbh%>';
				var sheettype = document.getElementById("sheettype").value;
				var zcbh = document.getElementById("zcbh").value;
				var zcmc = document.getElementById("zcmc").value;
				var zclx = document.getElementById("zclx").value;         
				var jyfl = document.getElementById("jyfl").value;
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
					'queryBO.jyfl':jyfl,
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
					'queryBO.ejwtgljg':ejwtgljg
					},
					url:"<%=basePath%>jygdzc/AssetQuery_query.do"
				}).trigger("reloadGrid") ;
			}
				
			function getValue(){
				
				//选中tid 将值带到下个页面 并且添加jyXx处理表
			//	var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
				//modified by gengxiao
				if(idStr == ''){
					alert("请选择资产!");
				}else{	
					//赵贤义修改＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
					var optionStr = "<%=option%>";
					var actionUrl;
					if(optionStr=="zccz"){
						//处置评估审查
						actionUrl="<%=basePath%>zccz/dealEvalBody_addBodys.do";
					}
					if(optionStr=="jyzccz"){
						//经营性固定资产处置
						actionUrl="<%=basePath%>zccz/assetDealBody_addBody.do";
					}
					if(optionStr=="jyzccjtz"){
						//经营性固定承继投资
						actionUrl="<%=basePath%>zccz/assetDealBody_addBody.do";
					}
					if(optionStr=="zccz"||optionStr=="jyzccz"||optionStr=="jyzccjtz"){
						$.post(actionUrl,{
							"assetIds"	: "" + idStr,
							"assetType" : "0",
							<%if(StringUtils.isNotEmpty(jzr)){ %>
							"jzr"		: "<%=jzr%>",
							<%}%>
							"cldId"		: "<%=cldId%>"
						},function(returnStr){
							if(returnStr=="success"){
								window.opener.reloadAssetGrid("0");
								window.close();
							}else{
								alert(returnStr);
							}
						});
						return false;
					}
					//赵贤义修改＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
					if(idStr.length >= 1){
					    var zcbhs  = jQuery("#purchase_list").getCell(idStr,'zcbh');
						//走判断重复的方法
						$.post("<%=basePath%>jygdzc/AssetQuery_queryForSingle.do",{
						"zcIds" : ""+zcbhs,
						"headId" :"<%=headId%>"
					  },function(data){ 
						if(data!=null&&data!=""){
							alert("编号为"+data+"的资产已添加！");
							return false;
						}else{
						 	if(<%=mulSelect%>){
							<%
							//从诉讼页面进入选择资产页面，返回资产名称和资产ID， xuecj 修改
							if("susong".equals(request.getParameter("fromurl"))){
							%>
							    var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
							    if(gr.length > 1){
								  alert("只能选择一条记录！");
								}else if(gr.length == 1){
								var zcmc  = jQuery("#purchase_list").getCell(gr,'zcmc');
								  window.opener.addValue(gr,zcmc);
								  window.close();
								}
							<%
							}else{
							//正常调用方式
							%>
								if("null"!="<%=ywlx%>"){
									url = "<%=basePath%>jygdzc/AssetManageBody_addAsset.do";
									$.post(url,{
									"zcId":""+idStr,
									"ywlx":"<%=ywlx%>"
									},function(result){
										if("添加成功"==result){
										<%if(isModal){%>
											window.returnValue=idStr;
										<%}else{%>
											window.opener.addValue(idStr);
										<%}%>
										    window.close();
										}else{
											alert(result);
										}
									});
								}else{
								<%if(isModal){%>
									window.returnValue=idStr;
								<%}else{%>
									//经营性固定资产评估审查调用
									window.opener.addValue(idStr);
								<%}%>
								    window.close();
								}
							<%
							}
						%>
							
						}else{
							if(idStr.length > 1){
								alert("只能选择一个资产");
							}else{
								if("null"!="<%=ywlx%>"){
									url = "<%=basePath%>jygdzc/AssetManageBody_addAsset.do";
									$.post(url,{
									"zcId":""+idStr,
									"ywlx":"<%=ywlx%>"
									},function(result){
										if("添加成功"==result){
										<%if(isModal){%>
											window.returnValue=idStr;
										<%}else{%>
											window.opener.addValue(idStr);
										<%}%>
										    window.close();
										}else{
											alert(result);
										}
									});
								}else{
								<%if(isModal){%>
									window.returnValue=idStr;
								<%}else{%>
									window.opener.addValue(idStr);
								<%}%>
								    window.close();
								}
							}
						}
						}
					 });
					}else{ 
						alert("请选择一条记录");
					}			
				}	
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
			
			//一级委托管理机构，二级委托管理机构
			function openOrgiTree(idName,idValue){
	  			window.open("<%=request.getContextPath()%>/dept/dept_toTree.do?source=jyxgdzc&idName="+idName+"&idValue="+idValue,'','top=60,left=150,width=700,height=450,fullscreen=no,statusbar=no,titlebar=no,resizable=no,scrollbars=yes');
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
				window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
				//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
			}
	</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"   >
		<s:hidden name="sheettype" id="sheettype" value="%{#request.sheettype}" />
		<table id="table" width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_ylp01">
					资产编号：
				</td>
				<td class="td_ylp02">
					<s:textfield cssClass="input" name="queryBO.zcbh" id="zcbh" />
				</td>
				<td class="td_ylp01">
					资产名称：
				</td>
				<td class="td_ylp03">
					<s:textfield name="queryBO.zcmc" cssClass="input" id="zcmc" />
				</td>
				<td class="td_ylp01">
					资产类型：
				</td>
				<td class="td_ylp02">
					<% if("chexian".equals(ywlx)){ %>
						<s:select list="#{'2':'交通工具'}" name="queryBO.zclx" id="zclx"/>
					<%}else if("feichexian".equals(ywlx)){ %>
						<s:select list="#{'1':'不动产'}" name="queryBO.zclx" id="zclx"/>
					<%}else{%>
						<e:select parRefKey="ASSET_TYPE" headerKey="" headerValue=""
							list="#{}" name="queryBO.zclx" id="zclx" value="" />
					<%} %>
				</td>
			</tr>

			<tr>
				<td class="td_ylp01">
					经营分类：
				</td>
				<td class="td_ylp02">
					<e:select parRefKey="ASSET_MANAGE_TYPE" headerKey="" headerValue=""
						list="#{}" name="queryBO.jyfl" id="jyfl" value="0" />
				</td>

				<td class="td_ylp01">
					资产状态：
				</td>
				<td class="td_ylp03">
					<e:select parRefKey="ASSET_STATUS" headerKey="" headerValue=""
						list="#{}" name="queryBO.zczt" id="zczt" value="0" />
				</td>
				<td class="td_ylp01">
					地区：
				</td>
				<td class="td_ylp02">
					<e:select parRefKey="PROVIENCE" headerKey="" headerValue=""
						 list="#{}" name="queryBO.dq" id="dq" />
				</td>
			</tr>
			<tr>
				<td class="td_ylp01">
					卡片编号：
				</td>
				<td class="td_ylp02">
					<s:textfield name="queryBO.cardcode" cssClass="input" id="cardcode" />
				</td>
				<td class="td_ylp01">
					卡片名称：
				</td>
				<td class="td_ylp03">
					<s:textfield name="queryBO.zcname" cssClass="input" id="zcname" />
				</td>
				<td class="td_ylp01">
					卡片类型：
				</td>
				<td class="td_ylp02">
					<e:select parRefKey="CARD_TYPE" list="#{}" headerKey=""
						headerValue="" value="" id="parentid" name="queryBO.parentid" />
				</td>
			</tr>
			<tr>
				<td class="td_ylp01">
					管理部门：
				</td>
				<td class="td_ylp02">
					<s:textfield name="queryBO.glbm" id="glbmvalue" cssClass="input"
						readonly="true" />
					<s:hidden name='queryBO.glbm' id='glbmhiddenid'></s:hidden>
					<img src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType('glbm');" width="21" height="20" align="absmiddle" />
				</td>

				<td class="td_ylp01">
					使用部门：
				</td>
				<td class="td_ylp03">
					<s:textfield name="queryBO.sybm" id="sybmvalue" cssClass="input"
						readonly="true" />
					<s:hidden name='queryBO.sybm' id='sybmhiddenid'></s:hidden>
					<img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType('sybm');" width="21" height="20"
						align="absmiddle" />
				</td>
				<td class="td_ylp01">
					当前租赁状态：
				</td>
				<td class="td_ylp02">
					<e:select parRefKey="ASSET_RENT_STATE" headerKey="" headerValue=""
						list="#{}" name="queryBO.zlzt" id="zlzt" value="0" />
				</td>
			</tr>
			<tr>
				<td class="td_ylp01">
					一级分行：
				</td>
				<td class="td_ylp02">
					<e:select parRefKey="department" headerKey=""  headerValue=""
						parentId="438" list="#{}" id="ejdq" name="queryBO.ejdq" />
				</td>
				<td class="td_ylp01">
					一级委托管理机构：
				</td>
				<td class="td_ylp03">
					<%if("113".equals(yjwtgljg) || "11262".equals(yjwtgljg)){ %>
						<s:textfield name="queryBO.yjwtgljg" id="yjwtgljgvalue" cssClass="input"
							readonly="true" />
						<s:hidden name='queryBO.yjwtgljg' id='yjwtgljghiddenid'></s:hidden>
					<%} else {%>
						<s:textfield name="queryBO.yjwtgljg" id="yjwtgljgvalue" cssClass="input"
							readonly="true" />
						<s:hidden name='queryBO.yjwtgljg' id='yjwtgljghiddenid'></s:hidden>
						<img
							src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
							onclick="openOrgiTree('yjwtgljghiddenid','yjwtgljgvalue');" width="21" height="20"
							align="absmiddle" />					
					<%}%>
				</td>
				<td class="td_ylp01">
					二级委托管理机构：
				</td>
				<td class="td_ylp02">
					<%if(!"11262".equals(yjwtgljg)){ %>
						<s:textfield name="queryBO.ejwtgljg" id="ejwtgljgvalue" cssClass="input"
						readonly="true" />
						<s:hidden name='queryBO.ejwtgljg' id='ejwtgljghiddenid'></s:hidden>
						<img
							src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
							onclick="openOrgiTree('ejwtgljghiddenid','ejwtgljgvalue');" width="21" height="20"
							align="absmiddle" />
					<%} else {%>
					<s:textfield name="queryBO.ejwtgljg" id="ejwtgljgvalue" cssClass="input"
						readonly="true"/>
						<s:hidden name='queryBO.ejwtgljg' id='ejwtgljghiddenid'></s:hidden>
					<%}%>	
				</td>
			</tr>
			<tr>
				<td colspan="6" class="td_form01">
					<%
						if (returnValue) {
					%>
					<%
						if (isForCard) {
					%>
					<input name="Submit1" type="button"   value="确定"
						onclick="forCard();return" />
					<%
						} else {
					%>
					<input name="Submit1" type="button"  value="确定" onclick="getValue();return false;" />
					<%
						}
						}
					%>
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
	jQuery("#purchase_list").jqGrid({
		datatype:"json",
		colNames:['id','资产编号','资产名称','资产类型','经营分类','资产状态','地区','管理部门','使用部门','当前租赁状态','一级分行','一级委托管理机构','二级委托管理机构'],
		colModel:[
		    {name:'id',index:'id',align:"center",hidden:true},
			{name:'zcbh',index:'zcbh',align:"center"},
			{name:'zcmc',index:'zcmc',align:"center"},
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
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#purchase_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
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
		}
	});                 
</script>