<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringUtils,com.tansun.rdp4j.common.util.*"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%@ include file="/inc/word.inc"%>

<%@page import="com.tansun.eam2.common.model.orm.bo.CzCztzfaXx"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/assetDeal/zichan_nigao.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<%
	String headId = request.getAttribute("disposeHead.id").toString();
	String userTid = (String) request.getAttribute("userTid");
	CzCztzfaXx disposeHead = (CzCztzfaXx)request.getAttribute("disposeHead");
	String zclb = disposeHead.getZclb();
    Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<head>
    	<base href="<%=basePath %>" />
		<title>资产处置方案审批</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zcczassetWorkflow";
	actionPath = "zcczassetWorkflow";
%>
<script>
	function commitWorkflow(taskId,outCome){
		<%
			if(workflowVO.taskName.equals("拟稿部门综合处理")){
		%>
			if(outCome=="项目受理"){
				var urlpush = encodeURI(document.getElementById("participationUrl").value+"?taskId="+taskId+"&outCome="+outCome+"&multiple=false");
				var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
				if(typeof(result)!='undefined'){
					document.myform.result.value = 'commitToXmsl';
					document.myform.action = document.getElementById("commitUrl").value;
					document.myform.nextTodoUrl.value = document.getElementById("commitNextTodoUrl").value;
					document.myform.didUrl.value = document.getElementById("commitDidUrl").value;
					document.myform.taskId.value = taskId;
					document.myform.outCome.value = outCome;
					document.myform.assignId.value = result;
					if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
			            if(beforeWorkFlowSubmit instanceof Function){
			                var result = beforeWorkFlowSubmit(taskId,outCome);
			                if(!result) return;
			            }
		        	}
					document.myform.submit();
				}
				return false;
			}
		<%
			}else if(workflowVO.taskName.equals("项目受理")){
		%>
				if(outCome=="合规审查"){
					document.getElementById("commitNextTodoUrl").value = "zcczassetWorkflow/zcczassetWorkflow_xmslTodo.do";
				}
		<%
			}
		%>
		return true;
	}

</script>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
<style type="text/css">
.container {
	width: 100px;
}

.container div {
	width: 100px;
	background: #CCCCCC;
	line-height: 30px;
	border: 1px solid #000000;
}

.on {
	font-weight: bold;
}

.container2 {
	width: 100px;
	text-align: center;
}

.container2 div {
	width: 100px;
	line-height: 30px;
}

.container2 a {
	text-decoration: none;
	display: block;
	border: 1px solid #d4d4d3;
	background: #e6e6e6;
	color: #000000;
}

.DRAFT_DEPT .on a {
	background: #ffebac;
	color: #982e00;
	border-color: #ffb200;
}

#idMenu2 {
	clear: both;
	width: auto;
}

#idMenu2 div {
	float: left;
}

#idMenu2_6 a {
	background-color: red;
	border-color: red;
	color: #ffb200;
}
</style>
		<script type="text/javascript" language="JavaScript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			var isQiChaoCzbg = false;
			$(function(){
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
				//设置资产grid宽度
				jQuery("#jygdzcList").setGridWidth($("#form").width());
				jQuery("#dczzcList").setGridWidth($("#form").width());
				jQuery("#stzcList").setGridWidth($("#form").width());
				jQuery("#entity_asset_list").setGridWidth($("#form").width());
				jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
				jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
				jQuery("#zqList").setGridWidth($("#form").width());
				jQuery("#file_list").setGridWidth($("#form").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#form").width());
				jQuery("#blyj_reason_list").setGridWidth($("#form").width());
				$(window).bind('resize', function(){
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#dczzcList").setGridWidth($("#form").width());
					jQuery("#stzcList").setGridWidth($("#form").width());
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#entity_asset_list").setGridWidth($("#form").width());
					jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zqList").setGridWidth($("#form").width());
					jQuery("#file_list").setGridWidth($("#form").width());
					jQuery("#file_hgsc_endlist").setGridWidth($("#form").width());
					jQuery("#blyj_reason_list").setGridWidth($("#form").width());
				});
				//添加资产信息列表按钮
				<e:pc id="asset_listButton">
					var buttonsString = '[\
							{"buttonHandler":"addJyxgdZc(&quot;1&quot;,&quot;1&quot;,&quot;0&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
							{"buttonHandler":"delAsset(&quot;1&quot;,&quot;1&quot;,&quot;0&quot;)","buttonIcon":"icon-remove","buttonText":"删除"},\
							{"buttonHandler":"excel(&quot;0&quot;)","buttonIcon":"icon-redo","buttonText":"导出"}\
						]';
					addButtons(jQuery("#gview_jygdzcList > .ui-jqgrid-titlebar"),buttonsString);
				</e:pc>
				<e:pc id="dczzcListButton">
					var dczzcListButtonStr = '[\
							{"buttonHandler":"addJyxgdZc(&quot;1&quot;,&quot;-1&quot;,&quot;5&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
							{"buttonHandler":"delAsset(&quot;1&quot;,&quot;-1&quot;,&quot;5&quot;)","buttonIcon":"icon-remove","buttonText":"删除"},\
							{"buttonHandler":"excel(&quot;5&quot;)","buttonIcon":"icon-redo","buttonText":"导出"}\
						]';
					addButtons(jQuery("#gview_dczzcList > .ui-jqgrid-titlebar"),dczzcListButtonStr);
				</e:pc>
				<e:pc id="stzcListButton">
					var stzcListButtonStr = '[\
							{"buttonHandler":"addJyxgdZc(&quot;2&quot;,&quot;&quot;,&quot;6&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
							{"buttonHandler":"delAsset(&quot;2&quot;,&quot;&quot;,&quot;6&quot;)","buttonIcon":"icon-remove","buttonText":"删除"},\
							{"buttonHandler":"excel(&quot;6&quot;)","buttonIcon":"icon-redo","buttonText":"导出"}\
						]';
					addButtons(jQuery("#gview_stzcList > .ui-jqgrid-titlebar"),stzcListButtonStr);
				</e:pc>				
				<e:pc id="entity_asset_listButton">
				var buttonsString2 ='[\
						{"buttonIcon":"icon-add","buttonText":"选择实体","buttonMenuId":"chooseEntity"},\
						{"buttonHandler":"delEntityAsset","buttonIcon":"icon-remove","buttonText":"删除"},\
						{"buttonHandler":"exportEntityAsset","buttonIcon":"icon-redo","buttonText":"导出"}\
					]';
				addButtons(jQuery("#gview_entity_asset_list > .ui-jqgrid-titlebar"),buttonsString2);
				</e:pc>
				<e:pc id="loan_pledge_asset_listButton">
				var buttonsString3 ='[\
						{"buttonHandler":"addAsset(&quot;2&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
						{"buttonHandler":"delLoanPledgeAsset","buttonIcon":"icon-remove","buttonText":"删除"},\
						{"buttonHandler":"exportLoanAsset","buttonIcon":"icon-redo","buttonText":"导出"}\
					]';
				addButtons(jQuery("#gview_loan_pledge_asset_list > .ui-jqgrid-titlebar"),buttonsString3);				
				</e:pc>
				//添加自用资产
				<e:pc id="zyzc_asset_listButton">
				var buttonsString4 ='[\
						{"buttonHandler":"addAsset(&quot;4&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
						{"buttonHandler":"delZyzcAsset","buttonIcon":"icon-remove","buttonText":"删除"},\
						{"buttonHandler":"exportZyzc","buttonIcon":"icon-redo","buttonText":"导出"}\
					]';
				addButtons(jQuery("#gview_zyzc_asset_list > .ui-jqgrid-titlebar"),buttonsString4);
				</e:pc>
				//添加债券按钮
				<e:pc id="zqListButton">
				var zqListButtonStr ='[\
						{"buttonHandler":"addAsset(&quot;7&quot;)","buttonIcon":"icon-add","buttonText":"增加"},\
						{"buttonHandler":"delAsset(&quot;&quot;,&quot;&quot;,&quot;7&quot;)","buttonIcon":"icon-remove","buttonText":"删除"},\
						{"buttonHandler":"excel(&quot;7&quot;)","buttonIcon":"icon-redo","buttonText":"导出"}\
					]';
				addButtons(jQuery("#gview_zqList > .ui-jqgrid-titlebar"),zqListButtonStr);
				</e:pc>
				<%
					if(disposeHead != null && StringUtils.isNotEmpty(disposeHead.getScczfaxxid())){
				%>
					var expensesStr = '[{"buttonHandler":"mainWindow.viewHistoryYj(&quot;<%=disposeHead.getScczfaxxid() %>&quot;)","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
					if(window.parent.prependButtonsFromChildren != undefined){
						window.parent.prependButtonsFromChildren(expensesStr,"");
					}
				<%}%>
				
				//新建正文按钮
				<e:pc id="xinjianzhengwen">
					var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-<%=status.equals("0") ? "createFile" : "dealFile" %>","buttonText":"<%=status.equals("0") ? "起草处置报告" : "编辑处置报告" %>"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
				</e:pc>
				//查看正文按钮
				<e:pc id="chakanzhengwen">
					var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen()","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
					if(window.parent.prependButtonsFromChildren != undefined){
						window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
					}
				</e:pc>
				
				//评估报告有效期截止日期
				$("#reportDeadline").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				<e:pc id="blyjAndFileButton">
					var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
												]';
					addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
					
					var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
												{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
												{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
												]';
					addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
				</e:pc>
				<e:pc id="disableCheck">
					$(":checkbox").attr("disabled","disabled");
				</e:pc>
				
			//生成编号 合成处置报告
			var headBHGen = document.getElementById("bianhao").value;	  
			if(headBHGen == null || headBHGen.length == 0){
			 <e:pc id="bianhao_button">
			 	var generatorBianhaoButtonStr = 
							'[{"id":"generatorBianhaoButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				window.parent.prependButtonsFromChildren(generatorBianhaoButtonStr,"");
			 </e:pc>
			}else{
			  <e:pc id="hczw">
			   <%
			    if(!status.equals("2")){
			   %>
				var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成处置报告"}]';
				window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			<%
			   }
			%>
			</e:pc>
			}			  
			  <e:pc id="slxh_button">
				<s:if test="%{disposeHead.slxh == null}">
					var generatorSlxhButtonStr = 
						'[{"id":"generatorSlxh","buttonHandler":"mainWindow.createBianhao1","buttonIcon":"icon-bianhao","buttonText":"生成受理序号"}]';
					window.parent.prependButtonsFromChildren(generatorSlxhButtonStr,"");
				</s:if>
			  </e:pc>
		  	var hsitoryButtonStr = '[{"buttonHandler":"openAdvice","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
			addButtons($("#blButtons"),hsitoryButtonStr);
			});
			
			function openAdvice(){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
				+ "head.id=<%=disposeHead.getId()%>"
				+ "&zcczlb=zccz"
				+ "&authority=r"
				,"",winOpenStr);
			}
			
			function viewHistoryYj(id){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
					+ "head.id=" + id
					+ "&authority=r"
					+ "&zcczlb=zccz"
					,"",winOpenStr);
			}
			
			//打开word控件
			function draftDisposeReport(){
				openGzlxd();
			}
		     function openGzlxd(){
		         //wordTempKey,form,readOnly,isOpenFile, wordFileName
		       wordTemplate('bank_Template', document.getElementById("myform"),false,true, "处置报告"); 
		    }
				
			function fillExpensesDetail(){
				window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do?headId=<%=disposeHead.getId()%>&authority=w','',winOpenStr);
			}
			function deleteRIQI(){
				document.getElementById("reportDeadline").value="";
				
			}
			
			
			//验证标题为空
			function checkEAMFormTitle(){
				var cztzxmmc = document.getElementById("cztzxmmc");
				if(cztzxmmc.value == null || cztzxmmc.value.trim().length == 0){
					alert("标题不能为空！");
					cztzxmmc.focus();
      				return false;
    				}
    		 	return true;
			}  
			
			//导出经营性固定资产
			function excel(assetType){
				//var urlStr = "<%=basePath %>zccz/assetDealBody_vidwBody.do";
				var urlStr ="com.tansun.eam2.zccz.action.AssetExcelAction&com.tansun.eam2.zccz.vo.CzExcelVo";
				var parms = "{\"czExcelVo.cldId\":\"" + '<%=disposeHead.getId()%>' + "\",";
					parms += "\"czExcelVo.cscldid\":\"" + '<%=disposeHead.getCscldid()%>' + "\",";
					parms += "\"czExcelVo.assetType\":\"" + assetType + "\"}";
				if(assetType == "7"){
					exportExcel("zqList", urlStr, parms, '处置资产信息列表','cb');
				}else{
					exportExcel("jygdzcList", urlStr, parms, '处置资产信息列表','cb');
				}
			}
			//导出实体内资产
			function exportEntityAsset(){
				//var urlStr = "<%=basePath %>zccz/assetDealBody_vidwBody.do";
				var urlStr ="com.tansun.eam2.zccz.action.AssetExcelAction&com.tansun.eam2.zccz.vo.CzExcelVo";
				var parms = "{\"czExcelVo.cldId\":\"" + '<%=disposeHead.getId()%>' + "\",";
					parms += "\"czExcelVo.cscldid\":\"" + '<%=disposeHead.getCscldid()%>' + "\",";
					parms += "\"czExcelVo.assetType\":\"" + 1 + "\"}";
				exportExcel("entity_asset_list", urlStr, parms, '处置资产信息列表','cb');
			}
			//导出委托贷款抵债物
			function exportLoanAsset(){
				//var urlStr = "<%=basePath %>zccz/assetDealBody_vidwBody.do";
				var urlStr ="com.tansun.eam2.zccz.action.AssetExcelAction&com.tansun.eam2.zccz.vo.CzExcelVo";
				var parms = "{\"czExcelVo.cldId\":\"" + '<%=disposeHead.getId()%>' + "\",";
					parms += "\"czExcelVo.cscldid\":\"" + '<%=disposeHead.getCscldid()%>' + "\",";
					parms += "\"czExcelVo.assetType\":\"" + 2 + "\"}";
				exportExcel("loan_pledge_asset_list", urlStr, parms, '处置资产信息列表','cb');
			}
			function exportZyzc(){
				var urlStr ="com.tansun.eam2.zccz.action.AssetExcelAction&com.tansun.eam2.zccz.vo.CzExcelVo";
				var parms = "{\"czExcelVo.cldId\":\"" + '<%=disposeHead.getId()%>' + "\",";
					parms += "\"czExcelVo.cscldid\":\"" + '<%=disposeHead.getCscldid()%>' + "\",";
					parms += "\"czExcelVo.assetType\":\"" + 4 + "\"}";
				exportExcel("zyzc_asset_list", urlStr, parms, '处置资产信息列表','cb');
			}
			//双击查看资产
			function lookAsset(gr){
				//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
			}
			function addJyxgdZc(quanshu,fenlei,assetType){
				//经营性固定资产
				  	window.open("<%=basePath %>jygdzc/AssetQuery_initForZccz.do" 
				  	//	+ "?quanshu=" + quanshu
				  		+ "?assetType=" + assetType
				  		+ "&fenlei=" + fenlei,'',winOpenStr);
			}
			
			function insertAsset(ids,quanshu,fenlei,assetType){
				var assetType = assetType;
				$.post("<%=basePath %>zccz/assetDealBody_addBody.do",{
					"assetIds" : "" + ids,
					"cldId" : "" + $("#headId").val(),
					"assetType" : "" + assetType
				},function(returnStr){
					if("success" == returnStr){
						if(assetType == "0"){
							jQuery("#jygdzcList").trigger("reloadGrid");
						}else if(assetType == "5"){
							jQuery("#dczzcList").trigger("reloadGrid");
						}else if(assetType == "6"){
							jQuery("#stzcList").trigger("reloadGrid");
						}else if(assetType="7"){
							jQuery("#zqList").trigger("reloadGrid");
						}
					}
				});
				loseRate();
			}
			
			//添加处置资产
			function addAsset(zclb){
				//委托贷款抵债物
				if(zclb == "2"){
					window.open("<%=basePath %>wtdk/loansQuery_init.do?ctlButton=show&assetType=2&cldId=<%=disposeHead.getId()%>",'',winOpenStr);
				}else if(zclb == "4"){
					//自用资产
					window.open("<%=basePath %>zyzc/ZCQuery_init.do?isForZccz=true&cldId=<%=disposeHead.getId()%>",'',winOpenStr);
				}else if(zclb == "7"){
					//债券
					window.open("<%=basePath %>stock/maintain_listStockMaintain.do"
						+ "?assetType=" + zclb
						+ "&sign=1"
						+ "&option=zccz" ,'',winOpenStr);
				}
			}
			
			//删除处置资产
			function delAsset(quanshu,fenlei,assetType){
				if(assetType == "0"){
					var selectedAsset = jQuery("#jygdzcList").jqGrid('getGridParam','selarrrow');
				}else if(assetType == "5"){
					var selectedAsset = jQuery("#dczzcList").jqGrid('getGridParam','selarrrow');				
				}else if(assetType == "6"){
					var selectedAsset = jQuery("#stzcList").jqGrid('getGridParam','selarrrow');				
				}else if(assetType == "7"){
					var selectedAsset = jQuery("#zqList").jqGrid('getGridParam','selarrrow');
				}
				if(selectedAsset == null || selectedAsset.length == 0){
					alert("请选择要删除的资产!");
				}else{
					if(confirm("确认删除？")){
						//删除资产评估信息
						var url = "";
						<%
							if(workflowVO.taskName.equals("拟稿")){
						%>
						url ="<%=basePath%>/zccz/assetDealBody_deleteBody.do";
						<%
							}else {
						%>
						url ="<%=basePath%>/zccz/assetDealBody_deleteBody.do?isModifyState=true";
						<%
							}
						%>
						$.post(url,{
							"delBodyIds":"" + selectedAsset,
							"assetType":"" + assetType
						}, function(data){
							if(assetType == "0"){
								jQuery("#jygdzcList").trigger("reloadGrid");
							}else if(assetType == "5"){
								jQuery("#dczzcList").trigger("reloadGrid");
							}else if(assetType == "6"){
								jQuery("#stzcList").trigger("reloadGrid");
							}else if(assetType == "7"){
								jQuery("#zqList").trigger("reloadGrid");
							}
						});
					}
				}
				loseRate();
			}

			function delEntityAsset(){
				var selectedAsset = jQuery("#entity_asset_list").jqGrid('getGridParam','selarrrow');
				if(selectedAsset == null || selectedAsset.length == 0){
					alert("请选择要删除的资产!");
				}else{
					if(confirm("确认删除？")){
						//删除资产评估信息
						var url ="<%=basePath%>/zccz/assetDealBody_deleteBody.do";
						$.post(url,{delBodyIds:"" + selectedAsset + ""}, function(data){
							jQuery("#entity_asset_list").trigger("reloadGrid");
						});
					}
				}			
			}

			function delLoanPledgeAsset(){
				var selectedAsset = jQuery("#loan_pledge_asset_list").jqGrid('getGridParam','selarrrow');
				if(selectedAsset == null || selectedAsset.length == 0){
					alert("请选择要删除的资产!");
				}else{
					if(confirm("确认删除？")){
						//删除资产评估信息
						var url ="<%=basePath%>/zccz/assetDealBody_deleteBody.do";
						$.post(url,{delBodyIds:"" + selectedAsset + ""}, function(data){
							jQuery("#loan_pledge_asset_list").trigger("reloadGrid");
						});
					}
				}			
			}
			// 删除自用记录
			function delZyzcAsset(){
				var selectedAsset = jQuery("#zyzc_asset_list").jqGrid('getGridParam','selarrrow');
				if(selectedAsset == null || selectedAsset.length == 0){
					alert("请选择要删除的资产!");
				}else{
					if(confirm("确认删除？")){
						//删除资产评估信息
						var url ="<%=basePath%>/zccz/assetDealBody_deleteBody.do";
						$.post(url,{delBodyIds:"" + selectedAsset + ""}, function(data){
							jQuery("#zyzc_asset_list").trigger("reloadGrid");
						});
					}
				}
			}
			
			function reloadAssetGrid(assetType){
				if(assetType == "0"){
					jQuery("#jygdzcList").setGridParam({
						postData:{
							"cldId":"<%=disposeHead.getId() %>",
							"cscldid":"<%=disposeHead.getCscldid() %>"
						}
					}).trigger("reloadGrid");
					//刷新预计损失率
					loseRate();
				}
				if(assetType == "1"){
					jQuery("#entity_asset_list").setGridParam({
						postData:{	
							"cldId":"<%=disposeHead.getId() %>",
							"cscldid":"<%=disposeHead.getCscldid() %>"
						}
					}).trigger("reloadGrid");
				}
				if(assetType == "2"){
					jQuery("#loan_pledge_asset_list").setGridParam({
						postData:{	
							"cldId":"<%=disposeHead.getId() %>",
							"cscldid":"<%=disposeHead.getCscldid() %>"
						}
					}).trigger("reloadGrid");
				}	
				if(assetType == "4"){
					jQuery("#zyzc_asset_list").setGridParam({
						postData:{	
							"cldId":"<%=disposeHead.getId() %>",
							"cscldid":"<%=disposeHead.getCscldid() %>"
						}
					}).trigger("reloadGrid");
				}	
			}
			
			//计算预计损失率=预计损失金额/账面净值之和
			function loseRate(){  
				//预计损失金额
				var yjssje1 = document.getElementById("yjssje").value; 
				var shu = 0;
				//经营性固产账面净值
				var azmjz1 = jQuery("#jygdzcList").getUserDataItem("zmjz");
				//待处置固定资产
				var azmjz2 = jQuery("#dczzcList").getUserDataItem("zmjz");
				//受托固定资产
				var azmjz3 = jQuery("#stzcList").getUserDataItem("zmjz");
				//账面净值之和
				var azmjz = 0;
				if(!isNaN(azmjz1)){
					azmjz = azmjz + parseFloat(azmjz1);
				}
				if(!isNaN(azmjz2)){
					azmjz = azmjz + parseFloat(azmjz2);
				}
				if(!isNaN(azmjz3)){
					azmjz = azmjz + parseFloat(azmjz3);
				}
				if(azmjz == 0){
					document.getElementById("yjssl").value = "∞";
					return;
				}
				//预计损失金额
				if(azmjz == yjssje1){
					document.getElementById("yjssl").value = "100%";
					return;
				}
				var loseRate = String(yjssje1/azmjz);
				if(loseRate!=0){
					var f= loseRate;
					var i = f.indexOf(".");
					var before = parseInt(f.substr(0,i));//小数点前的
					var after1 = parseInt(f.charAt(i+1)==""?"0":f.charAt(i+1)); //小数点后1位
					var after2 = parseInt(f.charAt(i+2)==""?"0":f.charAt(i+2)); //小数点后第2位
					var after3 = parseInt(f.charAt(i+3)==""?"0":f.charAt(i+3));//小数点后第3位
					var after4 = parseInt(f.charAt(i+4)==""?"0":f.charAt(i+4));//小数点后第4位
					var after5 = parseInt(f.charAt(i+5)==""?"0":f.charAt(i+5));//小数点后第5位
					if(after5 < 5){
						after4 = after4;
					} else {
						if(after4<9){
							after4 = String(parseInt(after4)+1);
						}else {
							if(after3<9){
								after4 = 0;
								after3 = after3+1;
							}else{
								if(after2<9){
									after4 = 0;
									after3 = 0;
									after2 = after2+1;
								}else{
									if(after2<9){
										after4 = 0;
										after3 = 0;
										after2 = after2+1;
									}else{
										if(after1<9){
											after4 = 0;
											after3 = 0;
											after2 = 0;
											after1 = after1+1;
										}else{
											after4 = 0;
											after3 = 0;
											after2 = 0;
											after1 = 0;
											before = before +1;
										}
									}
								}
							}
						}
					}
					if(before>0){
						shu = String(before)+String(after1)+String(after2)+"."+String(after3)+String(after4);
					}else if(before==0){
						if(after1==0&&after2!=0){
							shu = String(after2)+"."+String(after3)+String(after4);
						}else if(after1==0&&after2==0){
							shu = String(after2)+"."+String(after3)+String(after4);
						}else{
							shu = String(after1)+String(after2)+"."+String(after3)+String(after4);
						}
					}
				}
				document.getElementById("yjssl").value = shu + "%";
			}
			
			//在点击类型时候，记忆当前是什么类型
			var oldZclb = "0";
			function remberValue(zclb){
				oldZclb = document.getElementById("zclb").value;
			}
			
			//改变列表
			function changeAssetList(zclb){
				if(zclb.value == "0"){
					if(zclb.checked){
						$("#jygdzcListDiv").show();
					}else {
						if($("#jygdzcList").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#jygdzcListDiv").hide();
						}
					}
				}else if(zclb.value == "1"){
					if(zclb.checked){
						$("#entity_asset").show();
					}else {
						if($("#entity_asset_list").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#entity_asset").hide();
						}
					}
				}else if(zclb.value == "2"){
					if(zclb.checked){
						$("#loan_pledge_asset").show();
					}else {
						if($("#loan_pledge_asset_list").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#loan_pledge_asset").hide();
						}
					}
				}else if(zclb.value == "4"){
					if(zclb.checked){
						$("#zyzc_asset").show();
					}else {
						if($("#zyzc_asset_list").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#zyzc_asset").hide();
						}
					}
				}else if(zclb.value == "5"){
					if(zclb.checked){
						$("#dczzcListDiv").show();
					}else {
						if($("#dczzcList").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#dczzcListDiv").hide();
						}
					}
				}else if(zclb.value == "6"){
					if(zclb.checked){
						$("#stzcListDiv").show();
					}else {
						if($("#stzcList").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#stzcListDiv").hide();
						}
					}
				}else if(zclb.value == "7"){
					if(zclb.checked){
						$("#zqListDiv").show();
					}else {
						if($("#zqList").getDataIDs().length>0){
							alert("请先删除处置资产列表内的数据！");
							zclb.checked = true;
						}else{
							$("#zqListDiv").hide();
						}
					}
				}
			}
			
			//处置费用信息
			function setRenyuanInfo(){
				//自动合计处置费用总信息
				$.post("<%=basePath %>zccz/assetDealHead_fillDisposeExpense.do?",{
					"cldId":"<%=disposeHead.getId() %>"
				},function(disposeExpense){
					var feiyong = parseFloat(disposeExpense);
					document.getElementById("yjczfy").value = feiyong.toFixed(2);
				});
			}
			
			function selectCom(zixunType){
				window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
				 + '&ctlButton=show'
				 + '&zixunType=' + zixunType 
				 + '&cldId=<%=disposeHead.getId() %>','',winOpenStr);
			}
			
			function lookdblclickAss(gr){
				var fsxxId = jQuery("#entity_asset_list").getCell(gr,"bstid");
				var zixunType = jQuery("#entity_asset_list").getCell(gr,"stlx");
				if("0" == zixunType || "3" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid='+fsxxId+'&stlx='+0+'&rework='+1+'&look='+1);
				}else if("1" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+fsxxId+'&stlx='+1+'&look='+1);
				}
			}
			function createBianhao(){
				if(document.getElementById("bianhao").value!=""){
					alert("已生成编号！");
					return false;
				}
				$.post("<%=basePath %>zccz/assetDealHead_createBianhao.do?",{
					"cldId":"<%=disposeHead.getId() %>"
				},function(data){
					document.getElementById("bianhao").value = data;
					window.parent.removeObj("#generatorBianhaoButton");
					//显示合成处置报告按钮
					var buttonStr_hechengchuzhibaogao = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成处置报告"}]';
					window.parent.prependButtonsFromChildren(buttonStr_hechengchuzhibaogao,"");
				});
			}
			function createBianhao1(){
				if(document.getElementById("slxh").value!=""){
					alert("已生成受理序号！");
					return false;
				}
				$.post("<%=basePath %>zccz/assetDealHead_createBianhao1.do?",{
					"cldId":"<%=disposeHead.getId() %>"
				},function(data){
					var strs = data.split(",");
					document.getElementById("slxh").value = strs[0];
					document.getElementById("sbrq").value = strs[1];
					window.parent.removeObj("#generatorSlxh");
				});
			}
			
		function checkEAMFormJSMethod(){
			var jygdzcCheck = document.getElementById("disposeHead.zclb-1");
			if(jygdzcCheck.checked){
				if($("#jygdzcList").getDataIDs().length>0){
				}else{
					alert("请输入经营性固定资产信息");
					return false;
				}
			}
			var dczzcCheck = document.getElementById("disposeHead.zclb-2");
			if(dczzcCheck.checked){
				if($("#dczzcList").getDataIDs().length>0){
				}else{
					alert("请输入待处置固定资产信息");
					return false;
				}
			}
			var entityCheck = document.getElementById("disposeHead.zclb-3");
			if(entityCheck.checked){
				if($("#entity_asset_list").getDataIDs().length>0){
				}else{
					alert("请输入实体内资产信息");
					return false;
				}
			}
			var loanCheck =  document.getElementById("disposeHead.zclb-4");
			if(loanCheck.checked){
				if($("#loan_pledge_asset_list").getDataIDs().length>0){
				}else{
					alert("请输入委代抵债物信息");
					return false;
				}
			}
			var zyzcCheck = document.getElementById("disposeHead.zclb-5");
			if(zyzcCheck.checked){
				if($("#zyzc_asset_list").getDataIDs().length>0){
				}else{
					alert("请输入自用资产信息");
					return false;
				}
			}
			var zqCheck = document.getElementById("disposeHead.zclb-6");
			if(zqCheck.checked){
				if($("#zqList").getDataIDs().length>0){
				}else{
					alert("请输入债券信息");
					return false;
				}
			}
			
			if($.trim($("#cztzxmmc").val()) == ""){
				alert("请输入处置项目名称!");
				return false;
			}
			if($.trim($("#lxdh").val()) == ""){
				alert("请输入联系电话!");
				return false;
			}
			if($.trim($("#zcszwz").val()) == ""){
				alert("请输入资产所处位置!");
				return false;
			}
			var yjczhsje = $.trim($("#yjczhsje").val());
			//if(yjczhsje == "" || parseFloat(yjczhsje) == 0){
			if(yjczhsje == ""){
				alert("请输入建议处置回收金额!");
				return false;
			}else{
				if(parseFloat(yjczhsje) == NaN){
					alert("建议处置回收金额请输入数字!");
					return false;
				}
			}
			var yjczfy = $.trim($("#yjczfy").val());
			//if(yjczfy == "" || parseFloat(yjczfy) == 0){
			if(yjczfy == ""){
				alert("请填写预计处置费用!");
				return false;
			}else{
				if(parseFloat(yjczfy) == NaN){
					alert("预计处置费用请输入数字!");
					return false;
				}
			}
			var yjssje = $.trim($("#yjssje").val());
			//if(yjssje == "" || parseFloat(yjssje) == 0){
			//	alert("请输入预计损失金额!");
			//	
			//}else{
				if(parseFloat(yjssje) == NaN){
					alert("预计损失金额请输入数字!");
					return false;
				}
			//}
			if($.trim($("#czsbfs").val()) == ""){
				alert("请选择处置申报方式!");
				return false;
			}
			var cbcs = $.trim($("#cbcs").val());
			if(cbcs != ""){
				if(!isNumber(cbcs)){
					alert("重报次数请输入次数!");
					return false;
				}
			}
			return true;
		}
		
		/**
		checkEAMFormJSMethod2(arg1, arg2)
									arg1								arg2
		提交							taskId								outCome			
		拟稿提交						processDefinitionKey				outCome
		保存待办						"saveTodo"							""	
		**/
		function checkEAMFormJSMethod2(arg1, arg2){
			if(arg2 == "项目受理" || arg2 == "业务运营组确认方案"){
				if($.trim($("#bianhao").val()) == ""){
					alert("请先生成编号");
					return false;		
				}
			}
			if(arg2 == "合规审查"){
				if($.trim($("#slxh").val()) == ""){
					alert("请先生成受理序号");
					return false;
				}
			}
			<%if(StringUtils.equals("draft",workflowVO.step)){%>
				if("<%=status%>"=="0" && !isQiChaoCzbg){
					alert("请先起草处置报告");
					return false;
				}
			<%}%>
			return true;
		}
		//（编辑）起草处置报告
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "资产处置报告"); 
			//修改按钮名称为“编辑处置报告”
			window.parent.setHtml("#xjzwButton .l-btn-text","编辑处置报告");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看处置报告
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"资产处置报告"); 
		}
		
		//合成处置报告
		function hechengzhengwen(){
			var cztzxmmc = document.getElementById("cztzxmmc");
			if(cztzxmmc.value == null || cztzxmmc.value.length == 0){
				alert("处置项目名称不能为空！");
				cztzxmmc.focus();
		      	return false;
		    }
			MergeWordStart('manager_czbght','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "资产处置报告正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			isMerge = true;
			wordStatus = 2;
		}
		function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
		}	
		function afterWordSubmit(){
		  isQiChaoCzbg = true;
		}
		
		function beforeWordSubmit(){
		//  wordStatus = 2;
		}
			
		function hechengHead(){
		    //处置项目名称
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("cztzxmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥BIANHAO",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
		}
		
		function hechengBottom(){
		 	var strDate = "<%=strDate%>";
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeBottom.find.execute("￥￥HCRQ",false,false,false,false,false,true,false,false,strDate,2,false,false,false,false);
			var headId=$("#headId").val();
			$.post("<%=basePath %>file/file_getFileList.do",{
				"bdid":headId
			},function(data){
			   if(data != null && data.length != 0){
	           	  MyRangeBottom.find.execute("￥￥F_J",false,false,false,false,false,true,false,false, "附件：",2,false,false,false,false);
		       }else{
		    	  MyRangeBottom.find.execute("￥￥F_J",false,false,false,false,false,true,false,false, "",2,false,false,false,false);
		       }
				  MyRangeBottom.find.execute("￥￥FJBTLIST",false,false,false,false,false,true,false,false, data,2,false,false,false,false);
			});
		}
		/**
		beforeWorkFlowSubmit(arg1,arg2)
									arg1								arg2
		拟稿提交						processDefinitionKey 				outCome
		拟稿保存						"saveDraft"							""
		提交							taskId								outCome
		保存							"saveTodo"							""
		传阅							"circulation"						""
		**/
		function beforeWorkFlowSubmit(arg1,arg2){
			$("select").removeAttr("disabled");
			$("input").removeAttr("disabled");
			$("textarea").removeAttr("disabled");
			return true;
		}
		
		function changeCzxmmc(){
			$("#circulationTitle").val("[传阅] " + $("#cztzxmmc").val());
		}
     	</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<script type="text/javascript">
			$.ajaxSetup({
				async : false
			});
		</script>
		<!-- 提交按钮menuButton的下拉提交环节名称 start-->
		<div id="addToParent" style="display: none;">
			<div id="flow_first" style="width: 150px;">
				<div onClick="mainWindow.nextStep('0');" iconCls="icon-redo">组审核</div>
				<div onClick="mainWindow.nextStep('0');" iconCls="icon-redo">部门领导审核</div>
				<div onClick="mainWindow.nextStep('0');" iconCls="icon-redo">内控组审核</div>
			</div>
		</div>
		
		<!-- 提交按钮menuButton的下拉提交环节名称 end-->
		<div id="chooseEntity" style="width: 150px;display: none;" >
			<div onClick="selectCom('0');return false;" >咨询类实体</div>
			<div onClick="selectCom('1');return false;" >非咨询处置类实体</div>
			<div onClick="selectCom('3');return false;" >非咨询持续经营类实体</div>
		</div>
				
		<br />

	<s:form id="myform">
		<s:set name="biaodanid" value="%{#request.disposeHead.id}" />	 
		<s:hidden name="biaodanid" value="%{#request.disposeHead.id}" />
		<s:hidden name="userid" value="%{#request.disposeHead.ngr}" />
		<s:hidden name="deptid" value="%{#request.disposeHead.ngbm}" />
		<s:hidden name="disposeHead.id" id="headId" value="%{#request.disposeHead.id}"></s:hidden>
		<s:hidden name="disposeHead.lcmc"></s:hidden>
		<!--起草处置报告需要的 -->
		<r:userhidden id="userid" />
		<r:depthidden view="N" name="deptnameshow" />
		<r:depthidden view="N" name="deptid"  /> 
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/assetDealHead_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/assetDealHead_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/assetDealHead_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/assetDealHead_saveHead.do"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/assetDealHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="disposeHead.id" />"/>
<input type="hidden" name="circulationTitle" id="circulationTitle" value="[传阅] <s:property value="disposeHead.cztzxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="assetDealHead_modifyHead"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_did.do"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<input type="hidden" id="saveDraftUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<!-- =========================================================================== -->
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司资产处置方案审批处理单</span>
		</div>
<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
		<hr/>
		<s:hidden name="disposeHead.lcid" ></s:hidden>
		<s:hidden name="disposeHead.scczfaxxid" ></s:hidden>
		<s:hidden name="disposeHead.cldzt" ></s:hidden>
		<s:hidden name="disposeHead.fafl" value="0"></s:hidden>
		<s:hidden name="disposeHead.cscldid"></s:hidden>
		<table width="100%" class="newtable" border="0" cellspacing="0" cellpadding="0" id="form">
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield name="disposeHead.cztzxmmc" onchange="changeCzxmmc()" id="cztzxmmc" cssClass="input2"/></td>						
			</tr>
			<tr>
			  <td   class="td_zxy01" align="center">编号：</td>
			  <td class="td_zxy02">
			  	<r:textfield name="disposeHead.bianhao" id="bianhao" cssClass="input" readonly="true"/>
			  </td>
			  <td class="td_zxy01"> 急缓程度：</td>
			  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="disposeHead.jhcd" id="jhcd"/></td>
		  	</tr>
			<tr>
				<td  class="td_zxy01" align="center">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="disposeHead.ngrq" format="yyyy-MM-dd" var="ngrq"/>
					<r:textfield id="ngrq" name="disposeHead.ngrq" value="%{#ngrq}" cssClass="input" readonly="true"/></td>
				<td  align="center" class="td_zxy01">拟稿部门：</td>
				<td  class="td_zxy02">
					<s:hidden  name="disposeHead.ngbmmc"  id="ngbmmc" />
    				<e:dept userTid="<%=userTid%>" list="#{}"  name="disposeHead.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
				</td>
			</tr>
			<tr>
				<td  class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden name="disposeHead.ngr"/>
					<r:textfield name="disposeHead.ngrxm" id="ngrxm" readonly="true" cssClass="input"/>
				</td>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<r:textfield name="disposeHead.lxdh" id="lxdh" cssClass="input"/></td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>资产所在位置：</td>
				<td colspan="3"  class="td_zxy02">
					<r:textfield name="disposeHead.zcszwz" id="zcszwz" cssClass="input2"/></td>
			</tr>
<!--  //固定资产的资产权属修改为：自用、受托。此信息项废弃。
			<tr>
				<td class="td_zxy01" >资产权属：</td>
			    <td class="td_zxy02"><r:textfield name="disposeHead.zcqs" id="zcqs" cssClass="input"/></td>  
				<td class="td_zxy01">
				<font color="#FF0000">&nbsp;</td>
			    <td class="td_zxy02">&nbsp;</td>
			</tr>
-->
			<tr>
				<td class="td_zxy01" >
					<font color="#FF0000"><strong>*</strong></font>处置资产类别：
				</td>
			    <td class="td_zxy02" colspan="3">
			    	<s:checkboxlist name="disposeHead.zclb" value="%{#request.zclbList}" id="zclb" list="#{0:'经营性固产','5':'待处置固定资产',1:'实体内资产',2:'委贷抵债物',4:'自用资产','7':'债券'}" onclick="changeAssetList(this)"/>
			    </td>
			</tr>
			<tr>
				<td class="td_zxy01" >评估机构名称：</td>
			    <td class="td_zxy02" colspan="3"><r:textfield name="disposeHead.pgjgmc" id="pgjgmc" cssClass="input2"/></td>  
			</tr>
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>建议处置回收金额（元）：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjczhsjewy" id="yjczhsje" cssClass="input"/></td>
				<td class="td_zxy01" ><font color="#FF0000"><strong>*</strong></font>预计处置费用（元）：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjczfyStr" readonly="true" style="width:55%" id="yjczfy"/>
					<e:pc id="expensesDetail_button">
				    	<input type="button" id="expensesDetail" style="width:25%" value="费用明细" onclick="fillExpensesDetail()" />
					</e:pc>
			    </td>  
			</tr>	
			<tr>
				<td class="td_zxy01" >预计损失金额（元）：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjssjewy" cssClass="input" onblur="loseRate();" id="yjssje"/>
			    </td>  	
				<td class="td_zxy01">预计损失率：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjssl"  readonly="true" cssClass="input" id="yjssl"/>
			    </td>			    
			</tr>
			<tr>
				<td class="td_zxy01" >是否经过评估审查：</td>
			    <td class="td_zxy02">
			    <r:radio name="disposeHead.sfjpgsc" id="sfjpgsc" list="#{0:'否',1:'是'}" value="%{#request.disposeHead.sfjpgsc}"></r:radio>
			    </td>  
				<td class="td_zxy01">评估报告失效期截止日期：</td>
		        <td class="td_zxy02">
		        	<s:date name="disposeHead.pgbgsxqjzrq" format="yyyy-MM-dd" var="reportDeadline" />
					<r:textfield name="disposeHead.pgbgsxqjzrq"  style="width:55%" value="%{#reportDeadline}" id="reportDeadline" cssClass="input" readonly="true"/>
					<e:pc id="delete_button">
				    	<input type="button" id="delete" style="width:25%" value="清除" onclick="deleteRIQI()" />
					</e:pc>
		        </td>
			</tr>
			<tr>
			 <td class="td_zxy01" >申报材料清单：</td>
			    <td colspan="3" class="td_zxy02">  
			     <table>
	               <tbody>					  
	                  <tr>   
	                     <td><s:checkbox name="disposeHead.sfysbd"  id="sfysbd"/>资产处置申报单</td>
	                     <td><s:checkbox name="disposeHead.sfyczfa" id="sfyczfa"/>资产处置方案</td>
	                     <td><s:checkbox name="disposeHead.sfysjqk" id="sfysjqk"/>财务审计情况</td>
	                     <td><s:checkbox name="disposeHead.sfypgbg" id="sfypgbg"/>资产评估报告</td>
	                  </tr>   
	            	</tbody>
			     </table>
			    </td>
		    </tr> 
		    <tr> 
			   <td class="td_zxy01">其他申报材料：</td>
			   <td class="td_zxy02" colspan="3"><r:textfield name="disposeHead.qtsbcl" id="qtsbcl" cssClass="input2"/></td>
			</tr>
			<tr>
			    <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置申报方式：</td>
	            <td class="td_zxy02"><r:select list="#{'':'--请选择--',0:'首次',1:'变更',2:'重报'}" name="disposeHead.czsbfs" id="czsbfs"></r:select></td>
				<td class="td_zxy01" >重报次数：</td>
			    <td class="td_zxy02"><r:textfield name="disposeHead.cbcs" cssClass="input" id="cbcs"></r:textfield>
			    </td>
			</tr>
			<tr>
				<td class="td_zxy01">申报日期：
				</td>	
				<td class="td_zxy02">
					<s:date name="disposeHead.sbrq" var="mySbrq" format="yyyy-MM-dd"/>					
					<r:textfield name="disposeHead.sbrq" readonly="true" cssClass="input" id="sbrq" value="%{#mySbrq}"/>
				</td>
				<td class="td_zxy01">受理序号：
				</td>	
				<td class="td_zxy02">
					<r:textfield name="disposeHead.slxh" readonly="true" cssClass="input" id="slxh"/>
				</td>
			</tr>
			</table>
			<%
				if(disposeHead.getZclb() != null){
			%>			
			<!--	经验性固定资产		-->
			<div style="display:<%=disposeHead.getZclb().contains("0")?"block":"none" %>" id="jygdzcListDiv"><table id="jygdzcList"></table><div id="jygdzcListPager"></div></div>
			<!--	待处置固定资产		-->
			<div style="display:<%=disposeHead.getZclb().contains("5")?"block":"none" %>" id="dczzcListDiv"><table id="dczzcList"></table><div id="jygdzcListPager"></div></div>
			<!--	受托资产		-->		
			<div style="display:<%=disposeHead.getZclb().contains("6")?"block":"none" %>" id="stzcListDiv"><table id="stzcList"></table></div>
			<!--	实体内资产			-->
			<div style="display:<%=disposeHead.getZclb().contains("1")?"block":"none" %>" id="entity_asset"><table id="entity_asset_list"></table></div>
			<!--	委贷抵债物			-->
			<div style="display:<%=disposeHead.getZclb().contains("2")?"block":"none" %>" id="loan_pledge_asset"><table id="loan_pledge_asset_list"></table></div>
			<!--	自用资产				-->
			<div style="display:<%=disposeHead.getZclb().contains("4")?"block":"none" %>" id="zyzc_asset"><table id="zyzc_asset_list"></table></div>
			<!--	债券					-->
			<div style="display:<%=disposeHead.getZclb().contains("7")?"block":"none" %>" id="zqListDiv"><table id="zqList"></table></div>
			<%
				}
			%>
			<%@ include file="/inc/according.inc"%>
			<br>
			<e:opinion id="test" width="100%">
				<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			</e:opinion>
			<table class="newtable" width="100%" border="0" cellpadding="0" cellspacing="0">
		    	<tr>
		    		<td colspan="4" class="td_zxy01" id="blButtons"></td>
		    	</tr>
		    </table>
		    <e:opinion id="test2" width="100%">
		    	<e:opinionPart id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
		    </e:opinion>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_heguishencha_end.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
			<br>
		</s:form>
		<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>
<script type="text/javascript" language="javascript">
//--------------------------------------------------经营性固定资产------------------------------------------------------
		jQuery("#jygdzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"0"
			},
			colNames:['id','资产id','资产名称','资产权属','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:true},
				{name:'zcqs',index:'zcqs',sortable:true},
				{name:'azkpbh',index:'azkpbh',sortable:true},
				{name:'azkpmc',index:'azkpmc',sortable:true},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:true},
				{name:'zmjz',index:'zmjz',formatter:'number',sortable:true},
				{name:'apgjz',index:'apgjz',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}
			],
			forceFit:true,
			rowNum:0,
			height:"auto",
			autowidth:true,
			viewrecords:true,
			ondblClickRow:function(gr){
				var id  = jQuery("#jygdzcList").getCell(gr,'azcid');
				lookAsset(id);
			},
	<e:pc id="isEdit">
			onSelectRow: function(id){
				if($("#jqg_jygdzcList_" + id).attr("checked")){
					jQuery('#jygdzcList').jqGrid('editRow',id,true);
					$("#" + id + "_CCzfs").change(function(){
						jQuery('#jygdzcList').jqGrid('saveRow',id);
					});
				}else{
						jQuery('#jygdzcList').jqGrid('restoreRow',id);
				}
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
	</e:pc>
			multiselect: true,
			caption: '经营性固定资产（单位：元）11',
			footerrow : true, 
			userDataOnFooter : true, 
			toolbar: [false,"top"],
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		  	rowList:[10,20,30],
			pager:"#jygdzcListPager",
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#jygdzcList").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#jygdzcList").setGridHeight(0);
				}		
			},			
			shrinkToFit:false			
		});
//--------------------------------------------------待处置固定资产------------------------------------------------------
		jQuery("#dczzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"5"
			},
			colNames:['id','资产id','资产名称','资产权属','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:true},
				{name:'zcqs',index:'zcqs',sortable:true},
				{name:'azkpbh',index:'azkpbh',sortable:true},
				{name:'azkpmc',index:'azkpmc',sortable:true},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:true},
				{name:'zmjz',index:'zmjz',formatter:'number',sortable:true},
				{name:'apgjz',index:'apgjz',formatter:'number',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}								
			],
			ondblClickRow:function(gr){
				var id  = jQuery("#dczzcList").getCell(gr,'azcid');
				lookAsset(id);
			},
<e:pc id="isEdit">
			onSelectRow: function(id){
				if($("#jqg_dczzcList_" + id).attr("checked")){
					jQuery('#dczzcList').jqGrid('editRow',id,true);
					$("#" + id + "_CCzfs").change(function(){
						jQuery('#dczzcList').jqGrid('saveRow',id);
					});
				}else{
					jQuery('#dczzcList').jqGrid('restoreRow',id);
				}
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
</e:pc>
			autowidth:true,
			height:"auto",
			rowNum:0,
			multiselect: true,
			caption: '待处置固定资产（单位：元）',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#dczzcList").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#dczzcList").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------实体内资产------------------------------------------------------
		jQuery("#entity_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"1"
			},
			colNames:['id','实体Id','实体类型','实体名称','资产编号','资产名称','资产类型', '实际占有人', '评估价值','存放位置','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'bstid',index:'bstid',hidden:true},
				{name:'stlx',index:'stlx',hidden:true},
				{name:'bstmc',index:'bstmc',sortable:true},
				{name:'bzcbh',index:'bzcbh',sortable:true},
				{name:'bzcmc',index:'bzcmc',sortable:true},
				{name:'entityAssetType',index:'entityAssetType',sortable:true},
				{name:'bsjzyr',index:'bsjzyr',sortable:true},
				{name:'entityPgjz',index:'entityPgjz',formatter:'number',sortable:true},
				{name:'bcfwz',index:'bcfwz',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
<e:pc id="isEdit">			
			onSelectRow: function(id){
				if($("#jqg_entity_asset_list_" + id).attr("checked")){
					jQuery('#entity_asset_list').jqGrid('editRow',id,true);
					$("#" + id + "_CCzfs").change(function(){
						jQuery('#entity_asset_list').jqGrid('saveRow',id);
					});
				}else{
					jQuery('#entity_asset_list').jqGrid('restoreRow',id);
				}
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
</e:pc>			
			multiselect: true,
			caption: '实体内资产（单位：元）',
			toolbar: [false,"top"],
			ondblClickRow:function(rowid){
				lookdblclickAss(rowid);
			},
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#entity_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#entity_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false				
		});
//--------------------------------------------------委托贷款抵债物资产------------------------------------------------------
		jQuery("#loan_pledge_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"2"
			},
			colNames:['id','资产编号','资产名称','资产类型', '实际占有人', '评估价值','存放位置','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'czcbh',index:'czcbh',sortable:true},
				{name:'czcmc',index:'czcmc',sortable:true},
				{name:'czclx',index:'czclx',sortable:true},
				{name:'csjzyr',index:'csjzyr',sortable:true},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',formatter:'number',sortable:true},
				{name:'ccfwz',index:'ccfwz',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}
			],
			height:"auto",
			autowidth:true,
			rowNum:0,
			multiselect: true,
<e:pc id="isEdit">
			onSelectRow: function(id){
				if($("#jqg_loan_pledge_asset_list_" + id).attr("checked")){
					jQuery('#loan_pledge_asset_list').jqGrid('editRow',id,true);
					$("#" + id + "_CCzfs").change(function(){
						jQuery('#loan_pledge_asset_list').jqGrid('saveRow',id);
					});
				}else{
					jQuery('#loan_pledge_asset_list').jqGrid('restoreRow',id);
				}
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
</e:pc>
			caption: '委贷抵债物（单位：元）',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#loan_pledge_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#loan_pledge_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------自用资产------------------------------------------------------
		jQuery("#zyzc_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"4"
			},
			colNames:['id','资产编号','资产名称','卡片编号','卡片名称','财产原值','保管地点', '上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'zyzcbh',index:'zyzcbh',sortable:true},
				{name:'zyzcmc',index:'zyzcmc',sortable:true},
				{name:'zykpbh',index:'zykpbh',sortable:true},
				{name:'zykpmc',index:'zykpmc',sortable:true},
				{name:'zyccyzWy',index:'zyccyzWy',sortable:true},
				{name:'zybgdd',index:'zybgdd',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}							
			],
			height:"auto",
			autowidth:true,
			multiselect: true,
			caption: '自用资产（单位：元）',
<e:pc id="isEdit">			
			onSelectRow: function(id){
				if($("#jqg_zyzc_asset_list_" + id).attr("checked")){
					jQuery('#zyzc_asset_list').jqGrid('editRow',id,true);
					$("#" + id + "_CCzfs").change(function(){
						jQuery('#zyzc_asset_list').jqGrid('saveRow',id);
					});
				}else{
					jQuery('#zyzc_asset_list').jqGrid('restoreRow',id);
				}
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
</e:pc>
			rowNum:0,
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#zyzc_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#zyzc_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------债券------------------------------------------------------		
	jQuery("#zqList").jqGrid({
		url:"<%=basePath%>zccz/assetDealBody_vidwBody.do",
		postData:{
			cldId:"<%=disposeHead.getId() %>",
			cscldid:"<%=disposeHead.getCscldid() %>",
			assetType:"7"
		},
		datatype: "json",
		multiselect:true,
		colNames:['id','项目名称','债券种类','债券名称','行名','到期日','处置方式'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'fzqxmmc',index:'fzqxmmc',sortable:true},
			{name:'zqzlmc',index:'zqzlmc',sortable:true},
			{name:'zqmc',index:'zqmc',sortable:true},
			{name:'jhfhmc',index:'jhfhmc',sortable:true},
			{name:'dqr',index:'DQR',sortable:true},
			{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
					value:"${czfsJson}"
				},sortable:true
			}
		],
		height:"auto",
		autowidth:true,
<e:pc id="isEdit">
		onSelectRow: function(id){
			if($("#jqg_zqList_" + id).attr("checked")){
				jQuery('#zqList').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#zqList').jqGrid('saveRow',id);
				});
			}else{
				jQuery('#zqList').jqGrid('restoreRow',id);
			}
		},
		editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
</e:pc>
		rowNum:0,
		caption:'债券',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		},
		loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#zqList").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#zqList").setGridHeight(0);
			}		
		},			
		shrinkToFit:false	
	});
</script>
