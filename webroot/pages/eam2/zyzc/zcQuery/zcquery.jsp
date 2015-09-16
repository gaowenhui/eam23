<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	// 卡片新增挂接资产查询 add by chenyuxiao
	boolean isForCard = false;
	isForCard = "true".equals((String)request.getAttribute("isForCard"))?true:false;
	// 资产处置挂接资产查询 add by muzhanqiang
	boolean isForZccz = false;
	isForZccz = "true".equals((String)request.getAttribute("isForZccz"))?true:false;
	boolean isForPgsc = false;
	isForPgsc = "true".equals((String)request.getAttribute("isForPgsc"))?true:false;
	String cldId = (String) request.getParameter("cldId");
	String option = request.getParameter("option");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>自用资产查询</title>
		<script type="text/javascript">
			$(function(){
				$("#stocks_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#stocks_list").setGridWidth($("#gridTable").width());
				});
				
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonJSonString = '[\
				<% if(isForZccz) {	%>\
							{"buttonHandler":"forZccz","buttonIcon":"icon-ok","buttonText":"确定"},\
				<%	}   %>\
				<% if(isForCard) {	%>\
							{"buttonHandler":"forCard","buttonIcon":"icon-ok","buttonText":"确定"},\
				<%	}   %>\
				<% if(isForPgsc) {	%>\
							{"buttonHandler":"forPgsc","buttonIcon":"icon-ok","buttonText":"确定"},\
				<%	}   %>\
				<% if(StringUtils.equals(option,"CJTZ")) {	%>\
							{"buttonHandler":"getZyzcIds","buttonIcon":"icon-ok","buttonText":"确定"},\
				<%	}   %>\
							{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
							{"buttonHandler":"findResult","buttonIcon":"icon-search","buttonText":"查询"}\
				]';
				addButtons(jQuery("#gview_stocks_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype=zcBook_swtz_view",
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
						
			// 导出excel add by 陈煜霄
			function excel(){
				var urlStr = jQuery("#stocks_list").getGridParam('url');
			  	var yjflbm = document.getElementById("yjflbm").value;
				var ejflbm = document.getElementById("ejflbm").value;
				var sjflbm = document.getElementById("sjflbm").value;
				var zcmc = document.getElementById("zcmc").value;
				var gg = document.getElementById("gg").value;
				var qscgrq = document.getElementById("qscgrq").value;
				var jscgrq = document.getElementById("jscgrq").value;
				var zdjg = document.getElementById("zdjg").value;
				var zgjg = document.getElementById("zgjg").value;
			    
			    var params = "{\"queryPurVo.yjflbm\":\"" + yjflbm + "\",";
					params += "\"queryPurVo.ejflbm\":\"" + ejflbm + "\",";
					params += "\"queryPurVo.sjflbm\":\"" + sjflbm + "\",";
					params += "\"queryPurVo.zcmc\":\"" + zcmc + "\",";
					params += "\"queryPurVo.gg\":\"" + gg + "\",";
					params += "\"queryPurVo.qscgrq\":\"" + qscgrq + "\",";
					params += "\"queryPurVo.jscgrq\":\"" + jscgrq + "\",";
					params += "\"queryPurVo.zdjg\":\"" + zdjg + "\",";
					params += "\"queryPurVo.zgjg\":\"" + zgjg + "\"}";
				exportExcel("stocks_list", urlStr, params, '资产库存清单','rn,cb');
			}
			
			// 普通查询
			function findResult(){
				var yjflbm = document.getElementById("yjflbm").value;
				var ejflbm = document.getElementById("ejflbm").value;
				var sjflbm = document.getElementById("sjflbm").value;
				var zcmc = document.getElementById("zcmc").value;
				var gg = document.getElementById("gg").value;
				var zdjg = document.getElementById("zdjg").value;
				var zgjg = document.getElementById("zgjg").value;
				var url1 = "<%=basePath%>zyzc/ZCQuery_query4ZcManage.do";
				jQuery("#stocks_list").setGridParam({url:url1,postData:{
					'queryPurVo.yjflbm' : yjflbm,
					'queryPurVo.ejflbm' : ejflbm,
					'queryPurVo.sjflbm' : sjflbm,
					'queryPurVo.zcmc' 	: zcmc,
					'queryPurVo.gg' 	: gg,
					'queryPurVo.zdjg' 	: zdjg,
					'queryPurVo.zgjg' 	: zgjg,
					'queryCondition'	: <%if(!isForZccz && !isForPgsc){%>"zcQuery4Card"<%}else{%>""<%}%>
				}}).trigger("reloadGrid");
			}

			//当一级分类改变时触发此方法，显示出二级分类供选择
			function ejflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_ejflRefresh.do",{
					"zyZc.yjflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.ejfls.length>=1){
						for(var i=0; i<returnObj.ejfls.length; i++){
							$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
				$("#ejflbm").html("<option value='0'>--请选择--</option>");
			}
			
			//当二级分类改变时触发此方法，显示出三级分类供选择（如果有三级分类）
			function sjflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_sjflRefresh.do",{
					"zyZc.ejflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.sjfls.length>=1){
						for(var i=0; i<returnObj.sjfls.length; i++){
							$("#sjflbm").append("<option value='" + returnObj.sjfls[i].sjflbm + "'>" + returnObj.sjfls[i].sjflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
			}
			
			// 点击确定卡片新增回调方法 add by chenyuxiao
			function forCard(){
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if(gr.length > 1){
					alert('只能选择一条记录');
				}else if( gr.length == 1 ){
					window.opener.zyzcinfo(gr);
					window.close();
				}else{
					alert('请选择一条记录');
				}
			}
			// 点击确定给资产处置 add by muzhanqiang
			function forZccz(){
				//选中tid 将值带到下个页面 并且添加jyXx处理表
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if(gr == ''){
					alert("请选择资产!");
				}else{
					//自用资产处置
					actionUrl="<%=basePath%>zccz/assetDealBody_addBody.do";
					$.post(actionUrl,{
						"zcIds"	: "" + gr,
						"assetType" : "4",
						"cldId"		: "<%=cldId%>"
					},function(returnStr){
						if(returnStr=="success"){
							window.opener.reloadAssetGrid("4");
							window.close();
						}else{
							alert(returnStr);
						}
					});
				}	
			}
			
			function forPgsc(){
				//选中tid 将值带到下个页面 并且添加jyXx处理表
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if(gr == ''){
					alert("请选择资产!");
				}else{
					//自用资产评估审查
					actionUrl="<%=basePath%>zccz/dealEvalBody_addBodys.do";
					$.post(actionUrl,{
						"assetIds"	: "" + gr,
						"assetType" : "5",
						"cldId"		: "<%=cldId%>"
					},function(returnStr){
						if(returnStr=="success"){
							window.opener.reloadMessage("5");
							window.close();
						}else{
							alert(returnStr);
						}
					});
				}					
			}
			
			function getZyzcIds(){
				if("<%=option%>" == "CJTZ"){//承继投资
					var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
					if(gr == ''){
						alert("请选择资产!");
					}else{
						window.parent.addZyzc(gr);
						window.close();
					}
				}
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="" name="myform">
			<s:hidden name="sheettype" id="sheettype" value="init"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0"
				align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.yjflbm" list="#{1:'计算机类固定资产',5:'非计算机类固定资产'}"
							headerKey="0" headerValue="--请选择--"  id="yjflbm"
							onchange="ejflRefresh(this)"></s:select>
					</td>
					<td class="td_zxy01">二级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.ejflbm" list="%{#session.ejMap}"
							headerKey="0" value="%{#request.queryPurVo.ejflbm}" id="ejflbm"
							headerValue="--请选择--" onchange="sjflRefresh(this)"></s:select>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" list="%{#session.sjMap}"
							headerKey="0" value="%{#request.queryPurVo.sjflbm}" id="sjflbm"
							headerValue="--请选择--"></s:select>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<input type="text" class="input" name="queryPurVo.zcmc" id="zcmc" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">金额范围 从：</td>
					<td class="td_zxy02">
						<input type="text" name="queryPurVo.zdjg" id="zdjg" />&nbsp;至：<input type="text" name="queryPurVo.zgjg" id="zgjg" />
					</td>
					<td class="td_zxy01">品牌/规格型号：</td>
					<td class="td_zxy02">
						<input type="text" class="input" name="queryPurVo.gg" id="gg" />
					</td>
				</tr>
			</table>
			<table id="stocks_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			jQuery("#stocks_list").jqGrid({
				datatype:"json",
			   	colNames:['id','一级分类','二级分类','三级分类',
			   			  '资产名称','品牌/规格型号','资产编号','数量','单位'],
			   	colModel:[
			   		{name:'zcId',index:'zcId',hidden:true},
					{name:'yjflmc',index:'yjflmc'},
			   		{name:'ejflmc',index:'ejflmc'},
			   		{name:'sjflmc',index:'sjflmc'},
			   		{name:'zcmc',index:'zcmc'},
			   		{name:'gg',index:'gg'},
			   		{name:'zcbh',index:'zcbh'},
			   		{name:'sl',index:'sl'},
					{name:'jldw',index:'jldw',align:'center'}
			   	],
			   	pager:'pgtoolbar',
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:20,
				rowList:[10,20,30],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname",sord:"paginator.sorttype"},
				caption: "资产清单",
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
		</s:form>
		<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>
<script language="JavaScript">
	if('<%=request.getAttribute("savebody")%>' != "null") {
		gridrefresh();
		window.close();
	}
</script>