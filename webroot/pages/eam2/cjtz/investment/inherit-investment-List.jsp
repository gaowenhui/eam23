<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/cjtz/checkJS.inc" %>
<%
	String headId = request.getAttribute("czstcztz.id").toString();
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean myInCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/cjtz/investment/inherit-investment-List.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>承继投资审批</title>
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myForm";
			actionSpaceName = "cjtzWorkflow";
			actionPath = "cjtzspWorkflow";
		%>
<script>
	function commitWorkflow(taskId,outCome){
		<%
			if(workflowVO.taskName.equals("项目受理")){
		%>
				if(outCome=="会议组织"){
					document.getElementById("commitNextTodoUrl").value = "cjtzWorkflow/cjtzspWorkflow_xmslTodo.do";
					document.myForm.result.value = 'msczhclCommit';
					document.myForm.action = "<%=request.getContextPath()%>/cjtz/czCztzfaXxAction_saveHead.do";
					document.myForm.nextTodoUrl.value = $("#commitNextTodoUrl").val();
					document.myForm.didUrl.value = $("#commitDidUrl").val();
					document.myForm.taskId.value = taskId;
					document.myForm.outCome.value = outCome;
					/**
					if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
			            if(beforeWorkFlowSubmit instanceof Function){
			                var result = beforeWorkFlowSubmit(taskId,outCome);
			                if(!result) return;
			            }
		        	}
		        	**/
					// document.myForm.submit();
					return true;
				} 
		<%
			}
		%>
		return true;
	}
</script>
		<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
		<script type="text/javascript">
		var isQiChaoCzbg = false;
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				window.parent.clearPanelTool();
			<e:pc id="tijiaoButton">				
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
			</e:pc>
				jQuery("#gdzc_list").setGridWidth($("#widthRule").width());
				jQuery("#gdzc1_list").setGridWidth($("#widthRule").width());
				jQuery("#cjst_list").setGridWidth($("#widthRule").width());
				jQuery("#qita_List").setGridWidth($("#widthRule").width());
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				jQuery("#file_huiqian_endlist").setGridWidth($("#widthRule").width());
				jQuery("#file_huiqianlist").setGridWidth($("#widthRule").width());				
				$(window).bind('resize', function(){
					jQuery("#gdzc_list").setGridWidth($("#widthRule").width());
					jQuery("#gdzc1_list").setGridWidth($("#widthRule").width());
					jQuery("#cjst_list").setGridWidth($("#widthRule").width());
					jQuery("#qita_List").setGridWidth($("#widthRule").width());
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
					jQuery("#file_huiqian_endlist").setGridWidth($("#widthRule").width());
					jQuery("#file_huiqianlist").setGridWidth($("#widthRule").width());
				});
				//======================办理依据和附件按钮=========================
			  //添加按钮 "#gview_list > .ui-jqgrid-titlebar
			<e:pc id="blyjButton">			  
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"exportExcelBlyj","buttonIcon":"icon-save","buttonText":"导出"}\
				]';
				addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	
			  //添加按钮 "#gview_list > .ui-jqgrid-titlebar
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			</e:pc>
				//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^办理依据和附件按钮^^^^^^^^^^^^^^^^^^^^^^^^^^^
				//======================本页面JQgrid按钮=========================
			<e:pc id="jygdzcListButton">//经营性固定资产
				var buttonGdzcJSonString = '[{"buttonHandler":"showAddAsset","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete1","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"update1","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_gdzc_list > .ui-jqgrid-titlebar"),buttonGdzcJSonString);
			</e:pc>
			<e:pc id="czzcListButton">//出租资产
				var buttonGdzcJSonString1 = '[{"buttonHandler":"showAddAsset2","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete2","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"update2","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_gdzc1_list > .ui-jqgrid-titlebar"),buttonGdzcJSonString1);
			</e:pc>
			<e:pc id="qitaListButton">//其它资产
				var buttonQitaJSonString = '[{"buttonHandler":"showAddAsset3","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete3","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_qita_List > .ui-jqgrid-titlebar"),buttonQitaJSonString);
			</e:pc>
			//生成编号
			<e:pc id="gbianhao">
				<s:if test="%{czstcztz.bianhao==null}">
						window.parent.removeById("huiqianid");
						var generatorBianhaoButtonStr = '[{"id":"generatorBianhaoButton","buttonHandler":"mainWindow.generateBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
						if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(generatorBianhaoButtonStr,"");
				</s:if>
			</e:pc>
			//生成受理序号
			<e:pc id="gslxh">
   				<s:if test="%{czstcztz.slxh == null}">
					var generatorSlxhButtonStr = '[{"id":"generatorSlxh","buttonHandler":"mainWindow.generatorNum","buttonIcon":"icon-bianhao","buttonText":"生成受理序号"}]';
					if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(generatorSlxhButtonStr,"");
   				</s:if>
   			</e:pc>
   			<e:pc id="viewWordButtons">
				//查看投资方案
				var buttonStr_stztcz = '[{"buttonHandler":"mainWindow.viewClbg()","buttonIcon":"icon-viewFile","buttonText":"查看投资方案"}]';
				if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
			</e:pc>
			<e:pc id="createWordButtons">
				//创建投资方案
				var buttonStr_stztcz = '[{"id":"shitibjczbg","buttonHandler":"mainWindow.qicaoClbg()","buttonIcon":"icon-<%=status.equals("0") ? "createFile" : "dealFile" %>","buttonText":"<%=status.equals("0") ? "起草投资方案" : "编辑投资方案" %>"}]';
				if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
			</e:pc>
			<e:pc id="xzstButton">
				var buttonsString0 = '[' + 
					'{"buttonIcon":"icon-add","buttonText":"选择实体","buttonMenuId":"mm2"}' +
				']';
				addButtons(jQuery("#stInfoButton"),buttonsString0);
			</e:pc>
			var buttonsStringmm = '[\
				{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体信息"}\
			]';
			appendButtons(jQuery("#stInfoButton"),buttonsStringmm);
			//======================本页面JQgrid按钮=========================
			});
			function stView(){
				var stlx = $("#stlx").val();
				var stid = $("#stid").val();
				if(stid == "" || stid == null || stid == undefined){
					alert("请先选择实体");
					return false;
				}
				if(stlx == "1"){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
			}
			
			function generateBianhao(){
				if($("#bianhao").val() != "")return false;
				$.post("<%=basePath %>cjtz/czCztzfaXxAction_generateBianhao.do",{
					"czstcztz.id" : "<%=headId %>"
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.bianhao == null || returnObj.bianhao == undefined || returnObj.bianhao == ''){
						alert("生成编号失败! 请联系管理员。");
						return;
					}
					$("#bianhao").val(returnObj.bianhao);
					if(window.parent.removeObj)
						window.parent.removeObj("#generatorBianhaoButton");
				});
				window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr); //TODO 加会签后，取消注释
			}
			
			function generatorNum(){
				if($("#slxh").val() != "")return false;
				$.post("<%=basePath %>cjtz/czCztzfaXxAction_generatorSlxh.do",{
					"czstcztz.id" : "<%=headId %>"
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#slxh").val(returnObj.slxh);
					$("#sbrq").val(returnObj.sbrq);
					if(window.parent.removeObj)
					window.parent.removeObj("#generatorSlxh");
				});
			}
			
			function viewClbg(){
	       		wordTemplate('bank_Template', document.getElementById("myForm"),true,true, "投资方案"); 
			}
			
			function qicaoClbg(){
	       		wordTemplate('bank_Template', document.getElementById("myForm"),false,true, "投资方案"); 
	       		<%if(status.equals("0")){%>
		       		window.parent.setHtml("#shitibjczbg .l-btn-text","编辑投资方案");
					window.parent.setClass("#shitibjczbg .l-btn-text","l-btn-text icon-dealFile");
				<%}%>
			}
			
			function afterWordSubmit(){
			  isQiChaoCzbg = true;
			}
			function beforeWordSubmit(){
			  wordStatus = 2;
			}			
			
			function showAddAsset3(){
				//var url = "<%=basePath %>jygdzc/AssetQuery_init.do?returnValue=true&sheettype=query";
				var url = "<%=basePath %>pages/eam2/cjtz/investment/queryForOther.jsp?cldId=${czstcztz.id}";
				window.open(url,'',winOpenStr);
				return false;
			}
			function delete3(){
				var gr = jQuery("#qita_List").jqGrid('getGridParam','selarrrow');
				deletes(gr);
			}
			function showAddAsset2(){
				var url = "<%=basePath %>cjtz/CzZcXxAction_showAddAsset.do?headId=${czstcztz.id}&type=zulin";
				window.open(url);
				return false;
			}
			function delete2(){
				var gr = jQuery("#gdzc1_list").jqGrid('getGridParam','selarrrow');
				deletes(gr);
			}
			function deletes(gr){
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					if(confirm("确认删除？")){
						var url ="<%=request.getContextPath()%>/cjtz/CzZcXxAction_deleteBody.do";
						$.post(url,{zcIds:"" + gr + ""}, function(){
							reloadGrid();
						});
					}
				}
			}
			// 修改
			function update2(){
				var gr = jQuery("#gdzc1_list").jqGrid('getGridParam','selarrrow');
				if( gr.length == 1 ||(gr.length==2&&gr[0]==null)){
					var headId = document.getElementById("headId").value;
					var url = '<%=request.getContextPath()%>/cjtz/CzZcXxAction_modifyBody.do?type=zulin&headId='+headId+'&zcIds='+gr;
					url = url + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
					window.open(url);
				}else alert("请选择要修改的记录");
			}
			//=====================GDZC方法====================================
			function showAddAsset(){
				var url = "<%=basePath %>cjtz/CzZcXxAction_showAddAsset.do?headId=${czstcztz.id}&type=quequan";
				//var url = "<%=basePath %>jygdzc/AssetQuery_init.do?returnValue=true&sheettype=query";
				window.open(url);
				return false;
			}
			function delete1(){
				var gr = jQuery("#gdzc_list").jqGrid('getGridParam','selarrrow');
				deletes(gr);
			}
			// 修改
			function update1(){
				var gr = jQuery("#gdzc_list").jqGrid('getGridParam','selarrrow');
				if( gr.length == 1 ||(gr.length==2&&gr[0]==null)){
					var headId = document.getElementById("headId").value;
					var url = '<%=request.getContextPath()%>/cjtz/CzZcXxAction_modifyBody.do?type=quequan&headId='+headId+'&zcIds='+gr;
					url = url + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
					window.open(url);
				}else alert("请选择要修改的记录");
			}
			function addValue(zcIds){
				var url = "<%=basePath %>cjtz/czCztzfaXxAction_saveBody.do";
				$.post(url,{headId:"" + document.getElementById("headId").value + "",zcIds:"" + zcIds + ""},function(){
					reloadGrid();
				});
			}
			function getIndex(obj) {
				var id = obj.id;
				var chooseData = document.getElementById('chooseData').value;
				var dates = 0;
				if(chooseData=="1"||chooseData=="2"||chooseData=="10"){
					dates = jQuery("#gdzc_list").getDataIDs();
					if(dates.length>0){
						alert("已添加数据，不能变更业务类型!");
						document.getElementById("tzywlx").value = chooseData;
						return false;
					}
				}else if(chooseData=='9'||chooseData=="11"){
					dates = jQuery("#qita_List").getDataIDs();
					if(dates.length>0){
						alert("已添加数据，不能变更业务类型!");
						document.getElementById("tzywlx").value = chooseData;
						return false;
					}
				}else {
					if(confirm("确认更换业务类型吗？")){
						var inputs = document.getElementById('cjst').getElementsByTagName('input');
						for(var i=0;i<inputs.length;i++){
							if(inputs[i].type=="text"){
								document.getElementById(inputs[i].id).value="";
							}
						}
						document.getElementById('zzqk').value = "";
						document.getElementById('gqgc').value = "";
					}else {
						document.getElementById("tzywlx").value = chooseData;
						return false;
					}
				}
				check1();
				document.getElementById("czstcztz.tzfs").value = "";
				document.getElementById("czstcztz.tzje").value = "";
				document.getElementById("czstcztz.czfs").value = "";
				document.getElementById("czstcztz.czje").value = "";
 			}
 			function check1(){
 				var y=document.getElementById("tzywlx").value;
				if(y==10){
				 	fangan.style.display="inline-block";
				}else{
				 	fangan.style.display="none";
				 	document.getElementById('CFalb').value = "";
				}
				if(y==2 || y==1 ){
					sqsdje.style.display = "block";
					gdzc.style.display = "block";
					gdzc1.style.display = "none";
					qita.style.display = "none";
					cjst.style.display = "none";
				}else if(y ==10){
					sqsdje.style.display = "none";
					gdzc.style.display = "none";
					gdzc1.style.display = "block";
					qita.style.display = "none";
					cjst.style.display = "none";
				}else{
					gdzc.style.display = "none";
					sqsdje.style.display = "none";
					if(y==9 || y==11 ){
						gdzc.style.display = "none";
						qita.style.display = "block";
						gdzc1.style.display = "none";
						cjst.style.display = "none";
					}else{
						gdzc.style.display = "none";
						qita.style.display = "none";
						cjst.style.display = "block";
						gdzc1.style.display = "none";
						if(y==3 || y==4|| y==5|| y==6|| y==7|| y==8){
							document.getElementById("touzi").style.display="block"
		    			document.getElementById("chezi").style.display="none"
						}else if(y==12){
							document.getElementById("touzi").style.display="none";	
							document.getElementById("chezi").style.display="block";	
						}
					}
				}
 			}
 			$(function(){
				check1();
			});
 			function chickIndex(obj){
 				var id = obj.id;
 				document.getElementById('chooseData').value = document.getElementById(id).value;
 			}
 			function saveHead(){
 				myForm.action = "<%=basePath %>cjtz/czCztzfaXxAction_saveHead.do";
 				myForm.submit();
 			}
 			
 		//输入校验拦截器
		/**
		checkEAMFormJSMethod2(arg1, arg2)
									arg1								arg2
		提交							taskId								outCome			
		拟稿提交						processDefinitionKey				outCome
		保存待办						"saveTodo"							""	
		**/
		function checkEAMFormJSMethod2(arg1, arg2){
			if($.trim($("#czxmmc").val()) == ""){
				alert("请输入标题");
				return false;
			}
			if(arg2 == "项目受理" || arg2 == "业务运营组确认方案"){
				if($.trim($("#bianhao").val()) == ""){
					alert("请先生成编号");
					return false;		
				}
			}
			if(arg2 == "会议组织"){
				if($.trim($("#slxh").val()) == ""){
					alert("请先生成受理序号");
					return false;		
				}
			}
			if($.trim($("#lxdh").val()) == ""){
				alert("请输入联系电话");
				return false;
			}
			<%if(StringUtils.equals("draft",workflowVO.step)){%>
				if("<%=status%>"=="0" && !isQiChaoCzbg){
					alert("请先起草处置报告");
					return false;
				}
			<%}%>			
			return true;
		}
		
		/**
		 	submit拦截器
			beforeWorkFlowSubmit(arg1,arg2)
										arg1								arg2
			拟稿提交						processDefinitionKey 				outCome
			拟稿保存						"saveDraft"							""
			提交							taskId								outCome
			保存							"saveTodo"							""
			传阅							"circulation"						""
		**/
		function beforeWorkFlowSubmit(arg1, arg2){
			$("input").removeAttr("disabled");
			$("textarea").removeAttr("disabled");
			$("select").removeAttr("disabled");
			var zcpgzNum = new Number($("#zcpgzWY").val());
			$("#zcpgz").val(zcpgzNum * 10000);
			var stpgzNum = new Number($("#stpgzWY").val());
			$("#stpgz").val(stpgzNum * 10000);
			return true;
		}
		
		function changeCzxmmc(){
			$("#circulationTitle").val("[传阅] " + $("#czxmmc").val());
		}
		
			function openTreeByType(){//打开树，根据类型打开类型 
			var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + document.getElementById("hqbmids").value;
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		function getCallBack4Tree(ids,value){
			document.getElementById("hqbmvalue").value = value;
			document.getElementById("hqbmids").value = ids;
		}
		
		function selectCom(zixunType){
			var ids = jQuery("#claims_list").getDataIDs();
			if($.trim($("#stid").val()) != "" && ids.length > 0){
				if(confirm("确定更换实体吗?")){
					window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
					 + 'option=zccz' 
					 + '&zixunType=' + zixunType ,'',winOpenStr);
				}
			}else{
				window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
				 + 'option=zccz' 
				 + '&zixunType=' + zixunType ,'',winOpenStr);
			}
		}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<%@ include file="/inc/word.inc"%>
	<s:form action="" id="myForm">
	<!-- =================================正文需要============================= -->
		<r:userhidden id="userid" />
		<r:depthidden view="N" name="deptnameshow" />
		<r:depthidden view="N" name="deptid"  />
	<!-- =========================================================================== -->
		<s:hidden name="chooseData" id="chooseData"/>
		<s:hidden name="czstcztz.stid" id="stid"/>
		<s:hidden id="headId" name="czstcztz.id" />
		<s:hidden name="czstcztz.lcId" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="czstcztz.id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<s:hidden name="czstcztz.fafl" value="1" id="fafl"/>
		<s:hidden id="lcmc" name="czstcztz.lcmc" value="承继投资"/>
		<!-- 意见域、 依据和文件上传需要表单id -->
		<br>
		<br>
		<div align="center">
			<span class="STYLE1">中国建银投资有限责任公司承继业务投资审批处理单</span>
		</div>
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<!-- =========================================================================== -->
		<br>
		<hr color="#6600CC" align="center" width="100%">
		<!-- ==========================定义工作流隐藏域==================================== -->
		<%
			String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
		%>
		<!-- 工作流表单提交URL设置 -->
		<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/cjtz/czCztzfaXxAction_saveHead.do"/>
		<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
		<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
		<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
		<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
		<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
		<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/cjtz/czCztzfaXxAction_saveHead.do"/>
		<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
		<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/cjtz/czCztzfaXxAction_saveHead.do"/>
		<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/cjtz/czCztzfaXxAction_saveHead.do"/>
		<!-- 保存后台的URL -->
		<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
		<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<!-- 传阅 -->
		<input type="hidden" name="circulationUrl" value="cjtz/czCztzfaXxAction_modifyHead.do"/>
		<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
		<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="czstcztz.czxmmc" />"/>
		<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
		<!-- 会签属性 -->
		<input type="hidden" name=counterSignTitle value="<s:property value="czstcztz.czxmmc" /> 会签办理单"/>
		<input type="hidden" name="counterSignUrl" value="cjtz/czCztzfaXxAction_modifyHead"/>
		<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
		<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
		<!-- =========================================================================== -->
		<table id="widthRule" width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="red"><strong>*</strong></font>项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield id="czxmmc" name="czstcztz.czxmmc" cssClass="input2" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="bianhao" name="czstcztz.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select id="jhcd" name="czstcztz.jhcd" cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="czstcztz.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<r:textfield cssClass="input" id="ngrq" name="czstcztz.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="czstcztz.ngbm" />
					<r:textfield cssClass="input" id="ngbmmc" name="czstcztz.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="czstcztz.ngr"/>
					<r:textfield cssClass="input" id="ngrxm" name="czstcztz.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01"><font color="red"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="lxdh" name="czstcztz.lxdh"/>
				</td>
			</tr>
			<tr>
			<td class="td_zxy01">会签部门：</td>
		  	<td class="td_form02" colspan="3" >
		  		<r:textfield name="czstcztz.hqbm" id="hqbmvalue" readonly="true" cssClass="input2"/>
		   	 	<s:hidden name="czstcztz.hqbmid" id="hqbmids"/>
		    	<e:pc id="buttonTd_huiqian">
		    		<%if(!myInCounterSign) {%>
					<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType();" width="21" height="20" align="absmiddle"/> 
	      			<%} %>
	      		</e:pc>
	      		<e:countersign biaodanId="%{#request.biaodanid}" isJianTou="Y" />
			</td>
		 </tr>
			<tr>
				<td class="td_zxy01">业务类型：</td>
				<td class="td_zxy02">
					<e:select cssClass="input" list="#{}" parRefKey="INVESTMENT_TYPE" id="tzywlx" name="czstcztz.tzywlx" onclick="chickIndex(this)" onchange="getIndex(this)"/>
					<span id="fangan" style="display: none">方案类别： 
						<e:select list="#{}" id="CFalb" name="czstcztz.CFalb" headerKey="" headerValue="" parRefKey="RENT_SCHEMA_TYPE" />
					</span>
				</td>
				<td class="td_zxy01">投资申报方式：</td>
				<td class="td_zxy03">
					<r:select cssClass="input" id="czsbfs" name="czstcztz.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr id="sqsdje" style="display:block">
				<td class="td_zxy01" width="120">申请费用总金额(元)：</td>
				<td class="td_zxy02" >
					<r:textfield cssClass="input" name="czstcztz.sqfyzje" readonly="true" id="sqfyzje" />
				</td>
				<td class="td_zxy01" width="120">审批费用总金额(元)：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" name="czstcztz.spfyzje" readonly="true" id="sdfyzje"/>
				</td>
			 </tr>
		</table>
		<div id="cjst" style="display:none;width: 100%;">
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">实体信息</div>
				<div class="panel-tool" id="stInfoButton"></div>
			</div>
			<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr id="touzi" style="display:block">
					<td class="td_zxy01" >投资方式：</td>
					<td class="td_form02">
					  	<r:textfield cssClass="input" name="czstcztz.tzfs" id="czstcztz.tzfs" label="" />
					</td>
					<td class="td_zxy01">投资金额（元）：</td>
					<td class="td_form02">
						<r:textfield cssClass="input" name="czstcztz.tzje" id="czstcztz.tzje" label="" onblur="checkFloat(this);"/>
					</td>
				</tr>	
				<tr id="chezi" style="display:none">
					<td class="td_zxy01">撤资方式：</td>
					<td class="td_form02">
						<r:textfield cssClass="input" name="czstcztz.czfs" id="czstcztz.czfs" label=""/>
					</td>
					<td class="td_zxy01">撤资金额（元）：</td>
					<td class="td_form02">
						<r:textfield cssClass="input" name="czstcztz.czje" id="czstcztz.czje" label="" onblur="checkFloat(this);"/>
					</td>
				  </tr>
			 		<tr>
						<td class="td_zxy01">资产编号：</td>
						<td class="td_form02">
							<s:hidden id="czstcztz.stlx" id="stlx" />
							<r:textfield cssClass="input" name="czstcztz.zcbh" id="zcbh" readonly="true"/>
						</td>
						<td class="td_zxy01">实体名称：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.stmc" id="stmc" readonly="true"/>
						</td>
		    		</tr>
		    		<tr>
						<td class="td_zxy01">股权构成：</td>
						<td class="td_form02">
		     				<s:hidden name="czstcztz.gqgc" id="gqgc" />
		     			<e:pc id="viewGqgcButton">
		     				<input name="gqqk" type="button" onclick="viewGqgc();"  value="查看" />
		     			</e:pc>
		     			</td>
		     			<td class="td_zxy01">资质情况：</td>
		     				<s:hidden cssClass="input" name="czstcztz.zzqk" id="zzqk" />
		     			<td class="td_form02">
		     			<e:pc id="viewZzqkButton">
		     				<input name="zzqk" type="button" onclick="viewZzqk();"  value="查看" />
		     			</e:pc>
		     			</td>
					</tr>
					<tr>
						<td class="td_zxy01">地区：</td>
						<td class="td_form02">
							<s:hidden name="czstcztz.stscsf" id="stscsf"/>
							<r:textfield cssClass="input" name="sfName" id="sfName" readonly="true"/></td>
						<td class="td_zxy01">办公地址：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.bgdz" id="bgdz" readonly="true"/>
						</td>
		    		</tr>
				 	<tr>
						<td  class="td_zxy01">人数：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.strs" id="strs" readonly="true"/>
						</td>
						<td   class="td_zxy01">账面投资（元）：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.zmtz" id="zmtz" readonly="true"/>
						</td>
		    		</tr>
					<tr>
						<td class="td_zxy01">委托管理机构：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.CWtgljg" id="CWtgljg"  readonly="true"/>
						</td>
						<td  class="td_zxy01">&nbsp;</td>
						<td class="td_form02">&nbsp;</td>
					</tr>
					<tr>
						<td class="td_zxy01">出资与工商年审情况：</td>
						<td colspan="3" class="td_form02">
							<r:textfield cssClass="input2" name="czstcztz.czygsnsqk" id="czygsnsqk" readonly="true" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">主营业务：</td>
						<td colspan="3" class="td_form02">
							<r:textfield cssClass="input2" name="czstcztz.zyyw" id="zyyw"  readonly="true" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">最近一期经审计报告：</td>
						<td class="td_form02" colspan="3">
							<e:pc id="sjbg_file_Button_vy">
								<e:filebutton fjlx="single" biaodanId="%{#request.biaodanid}" isview="Y" />
							</e:pc>
							<e:pc id="sjbg_file_Button_vn">
								<e:filebutton fjlx="single" biaodanId="%{#request.biaodanid}" isview="N" />
								<script type="text/javascript">
									$("#deletefilebutton").remove();
								</script>
							</e:pc>
						</td>
					</tr>
					<tr>
						<td colspan="6" height="22" class="td_zxy01">
							<div align="left">最近一个月未经审计的报表的主要数据</div>
						</td>
					</tr>	
				   <tr>
						<td class="td_zxy01">总资产(元)：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.zzc" id="zzc" maxlength="16" onblur="checkFloat(this);"/>
					    </td>
					    <td class="td_zxy01" >负债（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.fuzhai" id="fuzhai" maxlength="16" onblur="checkFloat(this);"/>
					    </td>
	   				</tr>
					<tr>
						<td class="td_zxy01">股本（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.guben"  id="guben" onblur="checkFloat(this);"/>
					    </td>
					    <td class="td_zxy01" >净资产（元）：</td>
					    <td class="td_form02">
					   		<r:textfield  cssClass="input" name="czstcztz.jzc" id="jzc" maxlength="16" onblur="checkFloat(this);"/>
					   	</td>
	   				</tr>
		 			<tr>
		  				<td class="td_zxy01">收入（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.shouru" maxlength="16" id="shouru" onblur="checkFloat(this);"/>
					    </td>
					    <td class="td_zxy01" >净利润（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.jlr" maxlength="16" id="jlr" onblur="checkFloat(this);"/>
					    </td>
	  				</tr>
	  			</table>
		  	</div>
  		<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:date name="czstcztz.sbrq" var="sbrpFormat" format="yyyy-MM-dd"/>
	    			<r:textfield name="czstcztz.sbrq" cssClass="input" id="sbrq" value="%{#sbrpFormat}" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<r:textfield id="slxh" name="czstcztz.slxh" cssClass="input" readonly="true"/>
	    		</td>
	    	</tr>		  			
 		</table>
		<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<div id="gdzc" style="display:block">
						<table id="gdzc_list"></table>
					</div>
					<div id="gdzc1" style="display:none">
						<table id="gdzc1_list"></table>
					</div>
					<div id="qita" style="display:none">
						<table id="qita_List"></table>
					</div>
				</td>
			</tr>
		</table>
		<%@ include file="/inc/according.inc"%> 
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<e:opinion id="test" width="100%">
				<e:opinionPart id="LEADER" biaodanid="%{#request.biaodanid}" name="LEADER" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
				<!-- ==========================工作流信息项======================================= -->
				<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
				<!-- =========================================================================== -->			    
				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			</e:opinion>
		</table>
		<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr> 
	        <td class="td_zxy01">备注：</td>
				<td class="td_zxy03" colspan="5">
					<r:textarea name="czstcztz.beizhu" id="beizhu" cssClass="input" style="width:94%;" rows="4"/>
				</td>
	 		</tr> 
		</table>
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
		<%@ include file="/inc/file.inc"%>		
		<%@ include file="/inc/file_huiqian_end.inc"%>
		<%@ include file="/inc/listMessage.inc"%>
	</s:form>
	<div style="display: none;">
		<div id="mm2" style="width: 150px;">
			<div onClick="selectCom('0');return false;" >咨询类实体</div>
			<div onClick="selectCom('1');return false;" >非咨询处置类实体</div>
			<div onClick="selectCom('3');return false;" >非咨询持续经营类实体</div>
		</div>
	</div>
</body>
<div id="dialogZzqk" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
<div id="dialogGqgc" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
</html>
<script type="text/javascript">
	jQuery("#gdzc_list").jqGrid({
		url:"<%=basePath %>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${czstcztz.id}",
		datatype: "json",
		colNames: ['id','资产编号', '资产名称', '主卡片编号', '主卡片名称','原值(元)','已使用年限','尚可使用年限','申请总金额(元)','审定总金额(元)'],
		colModel:[
			{name:'id',index:'id',hidden:true},	
			{name:'azcbh',index:'name'},
			{name:'azcmc',index:'htqsrq'},
			{name:'azkpbh',index:'htzzrq'},
			{name:'azkpmc',index:'htje'},
			{name:'azmyz',index:'grzye'},
			{name:'aysynx',index:'bj'},	
			{name:'asksynx',index:'lx'},
			{name:'asqje',index:'bj'},	
			{name:'asdje',index:'lx'}
		],
		rownumbers:true,
		autowidth:true,
		height:'auto',
		rowNum:0,
		multiselect: true,
		caption: '资产信息',
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#gdzc_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#gdzc_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		jsonReader : {
			records: "records",
			repeatitems: false,
			id: "0"
		},
		gridComplete:function(){
			compute1();
		}
	});
	
	jQuery("#gdzc1_list").jqGrid({
		url:"<%=basePath %>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${czstcztz.id}",
		datatype: "json",
		mtype:"POST",  
	    colNames: ['id','azcid','资产编号', '资产名称','资产类型', '预估租赁起始日期', '预估租赁到期日期','资产承租（承办）人','意向租期','意向租金总额'],
	    colModel: [
	    	{name:'id',index:'id',editable:true,hidden:true},
	    	{name:'azcid',index:'azcid',editable:true,hidden:true},
			{name:'azcbh',index:'azcbh',editable:true},
	  		{name:'azcmc',index:'azcmc',editable:true},
	  		{name:'zclb',index:'zclb',editable:true},
	  		{name:'zlqsrq',index:'zlqsrq',editable:true},
			{name:'zldqrq',index:'zldqrq',editable:true},
	  		{name:'czr',index:'czr',editable:true},
	  		{name:'yxzq',index:'yxzq',editable:true},
	  		{name:'yxzjzje',index:'yxzjzje',editable:true}
	  	],
	  	loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#gdzc1_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#gdzc1_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
	  	rowNum:0,
	  	rownumbers:true,
	  	height: 'auto',
		autowidth: true,
		multiselect: true,
    	ondblClickRow:function(gr){
		},
    	caption: '出租资产列表',
		viewrecords:true,
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
			
	jQuery("#qita_List").jqGrid({
		url:"<%=basePath %>cjtz/cjtzBodyAction_showOtherBodyJson.do",
		postData:{
			'cldId' : '<%=headId%>'
		},
		datatype: "json",
		colNames:['id','资产分类','资产ID','资产编号','资产名称','管理部门','地址'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'zclb',index:'zclb',hidden:true},
			{name:'tzzcid',index:'tzzcid',hidden:true},
			{name:'zcbh',index:'zcbh'},
			{name:'zcmc',index:'zcmc'},
			{name:'zcglbmmc',index:'zcglbmmc'},
			{name:'shengfen',index:'shengfen'}
		],
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#qita_List").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#qita_List").setGridHeight(0);
			}
		},		
		rownumbers:true,
    	ondblClickRow:function(gr){
    		dbClickOtherList(gr);
		},		
		autowidth:true,
		rowNum:0,
		height:'auto',
		multiselect: true,
		caption: '资产信息',
		jsonReader : {
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	function dbClickOtherList(gr){
		var rowData = $("#qita_List").getRowData(gr);
		var zcid = rowData['tzzcid'];
		if(rowData['zclb']=='0'){//经营性固定资产
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+zcid,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}else if(rowData['zclb']=='1'){//实体内资产_____________________(双击事件未加)
			window.open('<%=basePath %>stgl/weihu_newEntity.do?fslx=3&look=1&stid=' + zcid,'',winOpenStr);
		}else if(rowData['zclb']=='2'){//委贷抵债物_____________________(双击事件未加)
			window.open('<%=basePath %>stgl/weihu_newEntity.do?fslx=3&look=1&loansId=' + zcid,'',winOpenStr);
		}else if(rowData['zclb']=='3'){//实体__________________________(双击事件未加)
			$.post("<%=basePath %>cjtz/cjtzBodyAction_getStlxByStid.do",{
				"stid" : "" + zcid
			},function(stlx){
				if(stlx == "1"){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + zcid  + '&look=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + zcid  + '&look=1','',winOpenStr);
				}
			});
		}else if(rowData['zclb']=='4'){//自用资产
			window.open('<%=basePath%>/zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + zcid+"&sheettype=zcBook_swtz_view",
				'',winOpenStr);
		}else if(rowData['zclb']=='5'){//待处置类资产
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+zcid,'',winOpenStr);
		}else if(rowData['zclb']=='7'){//债券
			window.open('stock/maintain_detailInfo.do?saveSign='+1+'&stockId='+ zcid,'',winOpenStr);
		}
	}
	
	function compute1(){
		var sqvalues=0;
		$("td[aria-describedby='gdzc_list_asqje']").each(function(i,obj){
			var r=$(obj).text();
			sqvalues=sqvalues+parseFloat(r);
		}); 
		document.getElementById("sqfyzje").value=sqvalues;
		var sdvalues=0;
		$("td[aria-describedby='gdzc_list_asdje']").each(function(i,obj){
		    var r=$(obj).text();
		    sdvalues=sdvalues+parseFloat(r);
		}); 
		document.getElementById("sdfyzje").value=sdvalues;
	}
	
	//选择实体	
	function selectEntity(){
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + 'option=stgl&multiselect=true&' 
		 + 'entityStid=' + $("#stid").val() 
		 + '&zixunType=' + "0");
	}
	
	//资质情况
	function viewZzqk(){
		var zzqkViewObj = $("#zzqk").val();
		if(zzqkViewObj != null && zzqkViewObj.length > 1 ){				
			var zzqkarray = zzqkViewObj.split('<#>');
			var i = 0;
			var htmlObj = "<table >";
			htmlObj += '<tr><td width=80>资质名称</td><td width=100>实体资质等级</td><td width=100>发证单位</td><td>资质到期日期</td></tr>';
			for(i = 0; i< zzqkarray.length; i++){
				var row = zzqkarray[i].split("#%#");
				htmlObj += '<tr>';
				htmlObj += "<td>" + row[0] + "</td>";
				htmlObj += "<td>" + row[1] + "</td>";
				htmlObj += "<td>" + row[2] + "</td>";
				htmlObj += "<td>" + row[3] + "</td>";
				htmlObj += '</tr>';
			}
			htmlObj += '</table>'
			$('#dialogZzqk').html(htmlObj);
			$('#dialogZzqk').dialog('open');
		}else{
			alert("没有资质情况信息！");
		}
	}
	
	//股权情况
	function viewGqgc(){
		var gqgcViewObj = $("#gqgc").val();
		if(gqgcViewObj != null && gqgcViewObj.length > 1 ){				
			var gqgcarray = gqgcViewObj.split('<#>');
			var i = 0;
			var htmlObj = "<table >";
			htmlObj += '<tr><td width=80>股东名称</td><td width=100>股东性质</td><td width=100>持股比例（%）</td><td>报告日期</td><td>持股数量</td><td>本部是否控股</td></tr>';
			for(i = 0; i< gqgcarray.length; i++){
				var row = gqgcarray[i].split("#%#");
				htmlObj += '<tr>';
				htmlObj += "<td>" + row[0] + "</td>";
				htmlObj += "<td>" + row[1] + "</td>";
				htmlObj += "<td>" + row[2] + "</td>";
				htmlObj += "<td>" + row[3] + "</td>";
				htmlObj += "<td>" + row[4] + "</td>";
				htmlObj += "<td>" + row[5] + "</td>";
				htmlObj += '</tr>';
			}
			htmlObj += '</table>'
			$('#dialogZzqk').html(htmlObj);
			$('#dialogZzqk').dialog('open');
		}else{
			alert("没有股权构成信息！");
		}
	}
	//选择实体
	
	function selectEntity(){
		var zixunType ='0';
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + 'option=stgl&multiselect=true&' 
		 + 'entityStid=' + $("#stid").val() 
		 + '&zixunType=' + zixunType);
	}
	
	//回调函数
	function setComMessage(stId){
		$.post("<%=basePath%>zccz/personDealHead_setStJbxxToHead.do",{
			"head.stid" : "" + stId,
			"oldStid" : "" + $("#stid").val(),
			"head.id" : "" + $("#id").val(),
			"head.fafl" : "1"
		},function(returnStr){
			var returnObj = eval('(' + returnStr + ')');
			$("#strs").val(returnObj.strs);
			$("#zcbh").val(returnObj.zcbh);
			$("#stmc").val(returnObj.stmc);
			$("#stid").val(returnObj.stid);
			$("#bgdz").val(returnObj.bgdz);
			$("#zmtz").val(returnObj.zmtz);
			$("#CWtgljg").val(returnObj.CWtgljg);
			$("#stscsf").val(returnObj.stscsf);
			$("#sfName").val(returnObj.sfName);
			$("#czygsnsqk").val(returnObj.czygsnsqk);
			$("#zyyw").val(returnObj.zyyw);
			$("#zzqk").val(returnObj.zzqk);
			$("#gqgc").val(returnObj.gqgc);
			$("#stlx").val(returnObj.stlx);
		});
	}
	//日期转换和资质情况
	$(function(){
		$('#dialogZzqk').dialog({title:'资质情况'});
		$('#dialogZzqk').dialog('close');
		$('#dialogGqgc').dialog({title:'股权构成'});
		$('#dialogGqgc').dialog('close');
	});
	function reloadGrid(){
		$("#qita_List").trigger("reloadGrid");
		$("#gdzc_list").trigger("reloadGrid");
		$("#gdzc1_list").trigger("reloadGrid");
	}
	
	function reloadOtherGrid(){
		$("#qita_List").trigger("reloadGrid");
	}
</script>

