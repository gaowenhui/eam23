<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>" />
		<title>批次新增</title>
		<script type="text/javascript">
			var allIds = new Array();
			var pclx = "";
			$(function(){
				$("#bat_good_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#bat_good_list").setGridWidth($("#gridTable").width());
				});
				
				$("#pdrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonJSonString = '[{"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"增加"},\
										 {"buttonHandler":"del","buttonIcon":"icon-remove","buttonText":"删除"},\
										 {"buttonHandler":"ok","buttonIcon":"icon-ok","buttonText":"确定"}\
				]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_bat_good_list > .ui-jqgrid-titlebar"),buttonJSonString);
				
				jQuery("#bat_good_list").setGridParam({url:'<%=basePath %>zyzc/BatchAdd_deletePdxxWithoutPdpc.do'}).trigger("reloadGrid");
				
				jQuery("#bat_good_list").setGridParam({url:'<%=basePath %>zyzc/BatchAdd_findPdxxWithPdpc.do'}).trigger("reloadGrid");
			});
			
			function add(){
				if($("#pclx").val() == "0"){
					alert("请您先选择批次类型!");
					return false;
				}
				if(pclx == "盘点"){
					pclx = "1";
				}else if(pclx == "盘库"){
					pclx = "0";
				}
				window.open('<%=basePath%>zyzc/BatchSelect_findFL.do?pclx='+pclx,
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			//子页面点击OK按钮时调用
			function query(zcIds){
				$.post("<%=basePath %>zyzc/BatchAdd_query.do",
						{
							"zcIds"		: 	""+zcIds,
							"pdxx.pdpc"	:	$("#pdpc").val()
						},function(data){
							jQuery("#bat_good_list").trigger("reloadGrid");
						}
				);
			}
			
			function del(){
				var gr = jQuery("#bat_good_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var delUrl ="<%=request.getContextPath()%>/zyzc/BatchAdd_deleteBody.do";
						$.post(delUrl,{delIds:"" + gr + ""}, function(data){
							jQuery("#bat_good_list").trigger("reloadGrid");
						});
					}
				}
			}
			
			function ok(){
				jQuery("#bat_good_list").setGridParam({url:'<%=basePath %>zyzc/BatchAdd_Ok.do',
						postData:{
							"pdxx.pdpc"	:	$("#pdpc").val(),
							"pdxx.pdrq"	:	$("#pdrq").val(),
							"pclx"		:	$("#pclx").val()
						}
					}).trigger("reloadGrid");
				window.location.reload();
			}
			
			function generPdpcWithPclx(){
				pclx = $("#pclx").val();
				$("#pclx").attr("disabled","true");
				if(pclx != "0"){
					$.post(
						"<%=basePath%>zyzc/BatchAdd_generPdpcWithPclx.do",
						{"pclx"	:	""+pclx},
						function(resultFromBackOffice){
							$("#pdpc").val(resultFromBackOffice);
						}
					);
				}
			}
			
			// excel导出 add by 陈煜霄
			function excel(){
				var urlStr = "<%=basePath %>zyzc/BatchAdd_displayDataWithoutPdpc.do";
				var params = "{1:" + 1 + "}";
				exportExcel("bat_good_list", urlStr, params, '物品清单','cb');
			}
			
			function findPdxxWithPdpc(){
				var pdpc = $("#pdpc").val();
				jQuery("#bat_good_list").setGridParam({url:'<%=basePath %>zyzc/BatchAdd_findPdxxWithPdpc.do',
						postData:{"pdpc"	:	""+pdpc}
				}).trigger("reloadGrid");
				
				//jQuery("#bat_good_list").setGridParam({url:'<%=basePath%>zyzc/BatchAdd_displayDataWithoutPdpc.do'});
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<script type="text/javascript">
			$.ajaxSetup({
				async : false
			});
		</script>
		<s:form name="myform" id="myform">
			<s:hidden name="zcIds" id="zcIds"></s:hidden>
			<s:hidden name="Ids" id="Ids"></s:hidden>
			<table id='gridTable' class="newtable" width="100%" border="0"align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_ylp01">批次类型：</td>
					<td class="td_ylp02">
						<s:select name="pdxx.pclx" id="pclx" headerKey="0"
							headerValue="-----请选择-----" list="#{'盘库':'盘库','盘点':'盘点'}" onchange="generPdpcWithPclx()"></s:select>
					</td>
					<td class="td_ylp01">批次号：</td>
					<td class="td_ylp02">
						<s:textfield name="pdxx.pdpc" id="pdpc" onchange="findPdxxWithPdpc()" />
					</td>
				</tr>
			</table>

			<table id="bat_good_list"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
			jQuery("#bat_good_list").jqGrid({
				url:"<%=basePath%>zyzc/BatchAdd_findPdxxWithPdpc.do",
				datatype:"json",
			   	colNames:['id','一级分类','二级分类','三级分类',
			   			  '资产名称','资产编号','品牌/规格型号','数量','单位',
			   			  '使用人','使用部门','存放地点'],
			   	colModel:[
			   		{name:'id',index:'id',hidden:true},
					{name:'yjflmc',index:'yjflmc'},
			   		{name:'ejflmc',index:'ejflmc'},
			   		{name:'sjflmc',index:'sjflmc'},
			   		{name:'zcmc',index:'zcmc'},
			   		{name:'zcbh',index:'zcbh'},
			   		{name:'gg',index:'gg'},
			   		{name:'sl',index:'sl'},
			   		{name:'jldw',index:'jldw',align:'center'},
			   		{name:'syrmc',index:'syrmc',align:"center"},
					{name:'sybmbmc',index:'sybmbmc',align:"center"},
					{name:'cfdd',index:'cfdd'}
			   	],
				pager:'pgtoolbar',
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:20,
				rowList:[10,20,30],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption:"本次盘点/盘库物品清单",
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