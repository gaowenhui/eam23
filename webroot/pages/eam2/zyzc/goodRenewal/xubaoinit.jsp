<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	// 卡片新增挂接资产查询 add by chenyuxiao
	boolean isForCard = false;
	isForCard = "true".equals((String)request.getAttribute("isForCard"))?true:false;
	// 资产处置挂接资产查询 add by muzhanqiang
	boolean isForZccz = false;
	isForZccz = "true".equals((String)request.getAttribute("isForZccz"))?true:false;
	String cldId = (String) request.getParameter("cldId");
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
							{"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				addButtons(jQuery("#gview_stocks_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			
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
			    var bxfws = document.getElementById("bxfws").value;
				var qscbrq = document.getElementById("qscbrq").value;	
				var jscbrq = document.getElementById("jscbrq").value;
			    
			    var params = "{\"queryPurVo.yjflbm\":\"" + yjflbm + "\",";
					params += "\"queryPurVo.ejflbm\":\"" + ejflbm + "\",";
					params += "\"queryPurVo.sjflbm\":\"" + sjflbm + "\",";
					params += "\"queryPurVo.zcmc\":\"" + zcmc + "\",";
					params += "\"queryPurVo.gg\":\"" + gg + "\",";
					params += "\"queryPurVo.qscgrq\":\"" + qscgrq + "\",";
					params += "\"queryPurVo.jscgrq\":\"" + jscgrq + "\",";
					params += "\"queryPurVo.zdjg\":\"" + zdjg + "\",";
					params += "\"queryPurVo.bxfws\":\"" + bxfws + "\",";
					params += "\"queryPurVo.qscbrq\":\"" + qscbrq + "\",";
					params += "\"queryPurVo.jscbrq\":\"" + jscbrq + "\",";
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
				var bxfws = document.getElementById("bxfws").value;
				var qscbrq = document.getElementById("qscbrq").value;	
				var jscbrq = document.getElementById("jscbrq").value;
				jQuery("#stocks_list").setGridParam({postData:{
					'queryPurVo.yjflbm' : yjflbm,
					'queryPurVo.ejflbm' : ejflbm,
					'queryPurVo.sjflbm' : sjflbm,
					'queryPurVo.zcmc' 	: zcmc,
					'queryPurVo.gg' 	: gg,
					'queryPurVo.zdjg' 	: zdjg,
					'queryPurVo.bxfws'  : bxfws,
					'queryPurVo.qscbrq' : qscbrq,
					'queryPurVo.jscbrq' : jscbrq,
					'queryPurVo.zgjg' 	: zgjg
				},
				url:"<%=basePath%>zyzc/ZCQuery_query4xubao.do"
				}).trigger("reloadGrid");
			}
			
			function ok(){
				var gr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow');
				if(gr.length == 0){
					confirm("请选择要添加的资产");
				}else {
					window.opener.myform.delBodyIds.value=gr;
					window.opener.saveZcListToBody();
					window.close();
				}
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
			
			// 日期转换
			$(function(){
				$("#qscbrq,#jscbrq").datebox({
					formatter:function(date){
						return formatDate(date);
					}
				});
			});
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
						<s:select name="queryPurVo.yjflbm" list="%{#session.yjMap}"
							headerKey="0" value="%{#request.queryPurVo.yjflbm}" id="yjflbm"
							headerValue="--请选择--" onchange="ejflRefresh(this)"></s:select>
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
				<tr>
					<td class="td_zxy01">出保日期 从：</td>
					<td class="td_zxy02">
						<input type="text" name="queryPurVo.qscbrq" id="qscbrq" />&nbsp;至：<input type="text" name="queryPurVo.jscbrq" id="jscbrq" />
					</td>
					<td class="td_zxy01">保修机构：</td>
					<td class="td_zxy02">
						<input type="text" class="input" name="queryPurVo.bxfws" id="bxfws" />
					</td>
				</tr>
				<tr>
					<td class="td_form01" colspan="6">
						<input type="button" value="查询" class="buttonface" onclick="findResult()">
					</td>
				</tr>
			</table>
			<table id="stocks_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			jQuery("#stocks_list").jqGrid({
				//url:"<%=basePath%>zyzc/ZCQuery_query4ZcManage.do",
				datatype:"json",
				mtype:"POST",
			   	colNames:['id','一级分类','二级分类','三级分类',
			   			  '资产名称','品牌/规格型号','数量','单位','出保日期','保修机构'],
			   	colModel:[
			   		{name:'zcId',index:'zcId',hidden:true},
					{name:'yjflmc',index:'yjflmc',align:'center'},
			   		{name:'ejflmc',index:'ejflmc',align:'center'},
			   		{name:'sjflmc',index:'sjflmc',align:'center'},
			   		{name:'zcmc',index:'zcmc',align:'center'},
			   		{name:'gg',index:'gg',align:'center'},
			   		{name:'sl',index:'sl',align:'center'},
					{name:'jldw',index:'jldw',align:'center'},
					{name:'cbrq',index:'bxjg',align:'center'},
					{name:'bxfws',index:'bxfws',align:'center'}
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