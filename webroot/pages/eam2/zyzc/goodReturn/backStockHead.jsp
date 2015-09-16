<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
		<title>自用固定资产归还</title>
		<script type="text/javascript">
			$(function(){
				jQuery("#return_goods_list").setGridWidth($("#gridTable").width());
		        $(window).bind('resize',function(){
					jQuery("#return_goods_list").setGridWidth($("#gridTable").width());
		        });
				
				//{"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
			 	//{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
				var buttonJSonString = '[{"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"增加"},\
										 {"buttonHandler":"deleteBody","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_return_goods_list > .ui-jqgrid-titlebar"),buttonJSonString);
				
				var parentButtonStr = '[{"buttonHandler":"mainWindow.saveToTZ","buttonIcon":"icon-save","buttonText":"办结"}]';		
				window.parent.addButtonsFromChildren(parentButtonStr,"");
			});
		
			//添加资产信息
			function add(){
				var sheadId = $("#sheadId").val();
				var sheettype = $("#sheetType").val();
				window.open('<%=basePath%>zyzc/goodReturn_init.do?sheettype='+sheettype+'&headId='+sheadId,
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			function deleteBody(){
				var gr = jQuery("#return_goods_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
						$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
							jQuery("#return_goods_list").trigger("reloadGrid");
						});
					}
				}
			}
			
			function modifyBody(){
				var gr=jQuery("#return_goods_list").jqGrid('getGridParam','selarrrow');
				var sheettype = $("#sheetType").val();
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr.length == 1 ){
					var bodyId = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype='+sheettype+'&bodyId='+bodyId,
						'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#return_goods_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_view",
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function saveZcListToBody1(ghlx){
				var url = "<%=basePath%>zyzc/goodReturn_findZCListById.do";
				$.post(url,{"zcIds":$("#delBodyIds").val()},function(data){
						jQuery("#return_goods_list").trigger("reloadGrid");
					}
				);
			}
			
			function saveZcListToBody(){
				$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
						{
							"delBodyIds"	:	$("#delBodyIds").val(),
							"head.sheadId"	:	$("#sheadId").val()
						},function(data){
							jQuery("#return_goods_list").trigger("reloadGrid");
						}
				);
			}
			
			//修改的情况下用此函数刷新grid
			function refreshGrid(){
				jQuery("#return_goods_list").trigger("reloadGrid");
				return true;
			}
			
			//保存到台账
			function saveToTZ(){
				if(!confirm('确定要办结处理单吗？')){
					return false;
				}
				var ids = $("#return_goods_list").getDataIDs();
				var ghrbm = document.getElementById('ghrbm').value;
				var ghrxm = document.getElementById('ghrxm').value;
				var ghrbmbm = document.getElementById('ghrbmbm').value;
				var ghrbmmc = document.getElementById('ghrbmmc').value;
				var ghsj = document.getElementById('ghsj').value;
				var url = "<%=basePath%>zyzc/goodReturn_saveInfoToKCtz.do";
				$.post(url,{"ids":""+ids+"","ghrbm":""+ghrbm+"","ghrxm":""+ghrxm+"","ghrbmbm":""+ghrbmbm+"","ghrbmmc":""+ghrbmmc+"","ghsj":""+ghsj+""},function(data){
						if(refreshGrid()){
							alert('归还成功！');
						}
					}
				);
			}
			
			function beforeWorkFlowSubmit(){
				$("input").removeAttr("disabled");	
				$("textarea").removeAttr("disabled");	
				$("select").removeAttr("disabled");	
				return true;
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form action="zyzc/ZCManageHead_goodReturn.do" name="myform" id="myform">
		<br/><br/><br/>
		<div align="center"><span class="STYLE1">中国建银投资有限责任公司自用资产归还</span></div>
		<br/>
		<hr color="#6600CC" width="100%" />
		
		<s:hidden name="head.sheadId" id="sheadId"/>
		<s:hidden name="head.sheetType" id="sheetType"/>
		<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
		<table id="gridTable" class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">归还人：</td>
				<td class="td_zxy02">
					<s:hidden name="returnVO.ghrbm" id="ghrbm"></s:hidden>
					<s:textfield name="returnVO.ghrxm" disabled="true" cssClass="input" id="ghrxm" />
				</td>
				<td class="td_zxy01">归还部门：</td>
				<td class="td_zxy02">
					<s:hidden name="returnVO.ghrbmbm" id="ghrbmbm"></s:hidden>
					<s:textfield name="returnVO.ghrbmmc" disabled="true" cssClass="input" id="ghrbmmc" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">归还日期：</td>
				<td class="td_zxy02">
					<s:textfield name="returnVO.ghsj" disabled="true" cssClass="input" id="ghsj" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
		</table>

		<table id="return_goods_list"></table>
		<div id="pgtoolbar" style="display: none"></div>
		<script type="text/javascript">
			jQuery("#return_goods_list").jqGrid({
				url:'<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do',
				postData:{"head.sheadId" : $("#sheadId").val()},
				datatype:"json",
				colNames:['id','一级分类','二级分类','三级分类',
						  '资产名称','资产编号','品牌/规格型号',
						  '序列号','数量','单位'],
				colModel:[
					{name:'sbodyId',index:'sbodyId',hidden:true},
					{name:'yjflmc',index:'yjflmc',align:"center"},
					{name:'ejflmc',index:'ejflmc',align:"center"},
					{name:'sjflmc',index:'sjflmc',align:"center"},
					{name:'zcmc',index:'zcmc'},
					{name:'zcbh',index:'zcbh'},
					{name:'gg',index:'gg'},
					{name:'xlh',index:'xlh'},
					{name:'sl',index:'sl'},
					{name:'jldw',index:'jldw'}		
				],
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:1000000,
				rowList:[10,20,30],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption:"归还物品清单 ",
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