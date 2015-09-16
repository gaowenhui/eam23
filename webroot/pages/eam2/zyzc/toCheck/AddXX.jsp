<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String pici = (String)request.getAttribute("pici");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>选择资产</title>
		<script type="text/javascript">
			var idStr = new Array();
			$(function(){
				$("#stocks_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#stocks_list").setGridWidth($("#gridTable").width());
				});
				
				var buttonJSonString = '[{"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"},\
										 {"buttonHandler":"allok","buttonIcon":"icon-ok","buttonText":"添加全部"}\
				]';
				addButtons(jQuery("#gview_stocks_list > .ui-jqgrid-titlebar"),buttonJSonString);
			});
			
			//当一级分类改变时触发此方法，显示出二级分类供选择
			function ejflRefresh(fl){
				$.post("<%=basePath%>zyzc/BatchSelect_ejflRefresh.do",{
						"zyPdxx.yjflbm"		:	$("#yjflbm").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.ejfls.length>=1){
						for(var i=0; i<returnObj.ejfls.length; i++){
							$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
						}
					}
				});
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
			
			function query(){
				jQuery("#stocks_list").setGridParam({url:'<%=basePath %>zyzc/BatchSelect_subPageQuery.do',
						postData:{
							"zyPdxx.yjflbm"		:	$("#yjflbm").val(),
							"zyPdxx.ejflbm"		:	$("#ejflbm").val(),
							"zyPdxx.sjflbm"		:	$("#sjflbm").val(),
							"zyPdxx.sybmbmc"	:	$("#sybmbmc").val(),
							"zyPdxx.cfdd"		:	$("#cfdd").val(),
							"pclx"				:	"1",
							"zyPdxx.id"			:   '<%=pici%>' //借用id字段，用来区分是什么批次
						}
					}).trigger("reloadGrid");
			}
			
			function ok(){
				var idArr = jQuery("#stocks_list").jqGrid('getGridParam','selarrrow')
				if(idArr.length == 0){
					alert("请选择您要添加到盘点批次中的资产！");
					return false;
				}else{
					window.opener.query(idStr);
					window.close();
				}
			}
			
			function allok(){
				var idArr = jQuery("#stocks_list").getDataIDs();
				if(idArr.length == 0){
					alert("请您先查询您要添加到盘点批次中的资产！");
					return false;
				}else{
					var url = "<%=basePath %>zyzc/BatchSelect_subPageQuery.do?type=allQuery";
					$.post(url,{"zyPdxx.yjflbm":$("#yjflbm").val(),
								"zyPdxx.ejflbm":$("#ejflbm").val(),
								"zyPdxx.sjflbm":$("#sjflbm").val(),
								"zyPdxx.sybmbmc":$("#sybmbmc").val(),
								"zyPdxx.cfdd":$("#cfdd").val(),
								"pclx":"1",
								"zyPdxx.id":'<%=pici%>'},function(data){
						if(data!=null && data!=''){
							window.opener.query(data);
							window.close();
						}
					});
				}
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form name="myform" id="myform">
			<s:hidden name="zcIds" id="zcIds"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0"align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类：</td>
					<td class="td_zxy02">
						<s:select name="zyPdxx.yjflbm" id="yjflbm" headerKey="0" headerValue="--请选择--" list="#{1:'计算机类固定资产',5:'非计算机类固定资产'}" onchange="ejflRefresh(this);"/>
					</td>
					<td class="td_zxy01">二级分类：</td>
					<td class="td_zxy02">
						<s:select name="zyPdxx.ejflbm" id="ejflbm"  headerKey="0" headerValue="--请选择--" list="%{#request.yjMap}" list="%{#request.ejMap}" onchange="sjflRefresh(this);"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" id="sjflbm"  headerKey="0" headerValue="--请选择--" list="%{#request.yjMap}" list="%{#request.sjMap}"/>
					</td>
					<td class="td_zxy01">使用部门：</td>
					<td class="td_zxy02">
						<s:textfield name="zyPdxx.sybmbmc" cssClass="input" id="sybmbmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">存放地点：</td>
					<td class="td_zxy02">
						<s:textfield name="zyPdxx.cfdd" cssClass="input" id="cfdd"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_form01" colspan="6">
						<input type="button" value="查询" class="buttonface" onclick="query();">
					</td>
				</tr>
			</table>

			<table id="stocks_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			jQuery("#stocks_list").jqGrid({
				url:"",
				datatype:"json",
			   	colNames:['id','一级分类','二级分类','三级分类',
			   			  '资产名称','资产编号','品牌/规格型号','单位',
			   			  '使用人','使用部门','存放地点'],
			   	colModel:[
			   		{name:'zcId',index:'zcId',hidden:true},
					{name:'yjflmc',index:'yjflmc'},
			   		{name:'ejflmc',index:'ejflmc'},
			   		{name:'sjflmc',index:'sjflmc'},
			   		{name:'zcmc',index:'zcmc'},
			   		{name:'zcbh',index:'zcbh'},
			   		{name:'gg',index:'gg'},
			   		{name:'jldw',index:'jldw',align:'center'},
			   		{name:'syrmc',index:'syrmc',align:'center'},
			   		{name:'sybmbmc',index:'sybmbmc',align:'center'},
			   		{name:'cfdd',index:'cfdd',align:'center'}
			   	],
			   	pager:'pgtoolbar',
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:20,
				rowList:[20,50,100,200],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption:"资产清单",
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
					var allIds = jQuery("#stocks_list").jqGrid('getDataIDs');
					for(var i = 0; i < allIds.length; i++){
						var index = idStr.indexOf(allIds[i]);
						if(index != -1){
							idStr.removeAt(index);
							jQuery("#stocks_list").setSelection(allIds[i]);
						}
					}
				},
				loadComplete:function(data){
					if(data && data.rows.length>0){
						jQuery("#stocks_list").setGridHeight(data.rows.length * 22 + 18);
					}else{
						jQuery("#stocks_list").setGridHeight(0);
					}
				},
				shrinkToFit:false,
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
	</body>
</html>
