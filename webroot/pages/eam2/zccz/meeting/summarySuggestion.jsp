<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzXmxxLsb"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String headId = (String)request.getAttribute("headId");
	String itemId = (String)request.getAttribute("itemId");
	String myUrl = (String)request.getAttribute("url");
	CzXmxxLsb xmXXVO = (CzXmxxLsb)request.getAttribute("xmXXVO");
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/meeting/summarySuggestion.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>汇总审批意见</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
			<%
				if(isInWorkflow){
			%>
			<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
			<%
				}
			%>
				var expensesStr = '[' +
					'{"buttonHandler":"mainWindow.viewCld","buttonIcon":"icon-search","buttonText":"处理单信息"}' + 
				']';
				window.parent.prependButtonsFromChildren(expensesStr,"");
				
				jQuery("#file_list").setGridWidth($("#myform").width());
				$(window).bind('resize', function(){
					jQuery("#file_list").setGridWidth($("#myform").width());
				});
				
				<e:pc id="fileButton">
					var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
												{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
												{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
												]';
					addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
				</e:pc>		
				<e:pc id="endButton">
					changeSfba();
				</e:pc>		
			});
			
			function saveAsDraft(){
				var url = '<%=basePath%>zccz/xmshAction_saveSummarySuggestions.do';
				myform.action = url+'?saveFlag=AsDraft';
				beforeWorkFlowSubmit("saveDraft","")
				myform.submit();
			}
			
			function viewCld(){
				<%
					if(workflowVO.pdk.equals("zccz_assetdisposal")){//实体整体处置
				%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=3","",winOpenStr);
				<%
					}else
					if(workflowVO.pdk.equals("zccz_persondeal")){//实体人员处置
				%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=4","",winOpenStr);
				<%
					}else
					if(workflowVO.pdk.equals("zccz_assetdeal")){//通用资产处置
				%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=0","",winOpenStr);
				<%
					}else if(workflowVO.pdk.equals("cjtz_shenpi")){//承继投资
				%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=5","",winOpenStr);
				<%}%>
			}
			
			function formSubmit(){
				if(confirm('确定要提交流程办结吗？')){
				
					//更改处置项目的分类。----fenlei值为：7  ---意见汇总完毕
					$.post('<%=basePath%>zccz/xmshAction_updateCzXmxxLsbById.do',
					{"id":"${xmXXVO.id}"},function(data){})
				
					$("#myform").ajaxForm({
						success:overProcess
					});
					document.myform.taskId.value = '<%=workflowVO.taskId%>';
					document.myform.action = '<%=basePath%>zccz/xmshAction_endSummarySuggestions.do';
					beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>")
					document.myform.sheetId.value = "${xmXXVO.bianhao}";
					$("#myform").submit();
				}
			}
			
			function overProcess(responseText,statusText,xhtmlHttpRequest,$form){
				if(responseText == 'SUCCESS_END'){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.taskId.value = '<%=workflowVO.taskId%>';
					document.myform.outCome.value = '提交意见触发会议纪要整理';
					beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>")
					document.myform.submit();
				}
			}
			
			var isAddbuton = false;
			function changeSfba(){
				var expensesStr3 = '[{"id":"endButtonId","buttonHandler":"mainWindow.formSubmit","buttonIcon":"icon-ok","buttonText":"办结"}]';
				if("<%=workflowVO.taskName%>"=="审核汇总意见"){
					if($("#sfbatrue").attr("checked")){
						window.parent.removeById("endButtonId");
						isAddbuton = false;
					}else if($("#sfbafalse").attr("checked") && !isAddbuton){
						window.parent.prependButtonsFromChildren(expensesStr3,"");
						isAddbuton = true;
					}
				}else if("<%=workflowVO.taskName%>"=="业务运营组处理"){
					window.parent.prependButtonsFromChildren(expensesStr3,"");
				}
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
		</script>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	System.out.println(workflowVO.pdk + "**************************");
	if(workflowVO.pdk.equals("zccz_assetdisposal")){
		actionSpaceName = "zcczWorkflow";
		actionPath = "zcczWorkflow";
	}
	if(workflowVO.pdk.equals("zccz_persondeal")){
		actionSpaceName = "zcczperWorkflow";
		actionPath = "zcczperWorkflow";
	}
	if(workflowVO.pdk.equals("zccz_assetdeal")){
		actionSpaceName = "zcczassetWorkflow";
		actionPath = "zcczassetWorkflow";
	}
	if(workflowVO.pdk.equals("cjtz_shenpi")){
		actionSpaceName = "cjtzWorkflow";
		actionPath = "cjtzspWorkflow";
	}
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form id="myform" action="">
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">受理阶段</span>
		</div>
	<!-- 意见域、 依据和文件上传需要表单id -->
	<s:set name="biaodanid" value="xmXXVO.Id" />
	<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<r:depthidden/>
	<!-- 意见域、 依据和文件上传需要表单id -->
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
		<br/>
		<hr color="#6600CC" align="center" width="100%" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<!-- <input type="hidden" id="result"/> -->
<%
	if(workflowVO.pdk.equals("zccz_assetdisposal")){
%>


<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_viewSummarySuggestions.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value=""/>
<input type="hidden" id="draftParticipationUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_hzspyjTodo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_hzspyjDid.do"/>
<input type="hidden" id="draftCommitUrl" value=""/>
<input type="hidden" id="draftCommitTodoUrl" value=""/>
<input type="hidden" id="draftCommitNextTodoUrl" value=""/>
<input type="hidden" id="draftCommitDidUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="hyOutCome" name="hyOutCome" value="整理会议纪要"/>
<input type="hidden" id="hyNextTodoUrl" name="hyNextTodoUrl" value="zcczshWorkflow/zcczshWorkflow_todo.do"/>
<input type="hidden" id="hyDidUrl" name="hyDidUrl" value="zcczshWorkflow/zcczshWorkflow_did.do"/>
<%
	}else if(workflowVO.pdk.equals("zccz_persondeal")){
%>
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_viewSummarySuggestions.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value=""/>
<input type="hidden" id="draftParticipationUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_shTodo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_spDid.do"/>
<input type="hidden" id="draftCommitUrl" value=""/>
<input type="hidden" id="draftCommitTodoUrl" value=""/>
<input type="hidden" id="draftCommitNextTodoUrl" value=""/>
<input type="hidden" id="draftCommitDidUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="hyOutCome" name="hyOutCome" value="整理会议纪要"/>
<input type="hidden" id="hyNextTodoUrl" name="hyNextTodoUrl" value="zcczshWorkflow/zcczshWorkflow_todo.do"/>
<input type="hidden" id="hyDidUrl" name="hyDidUrl" value="zcczshWorkflow/zcczshWorkflow_did.do"/>
<%
	}else if(workflowVO.pdk.equals("zccz_assetdeal")){
%>
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_viewSummarySuggestions.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value=""/>
<input type="hidden" id="draftParticipationUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_shTodo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_spDid.do"/>
<input type="hidden" id="draftCommitUrl" value=""/>
<input type="hidden" id="draftCommitTodoUrl" value=""/>
<input type="hidden" id="draftCommitNextTodoUrl" value=""/>
<input type="hidden" id="draftCommitDidUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="hyOutCome" name="hyOutCome" value="整理会议纪要"/>
<input type="hidden" id="hyNextTodoUrl" name="hyNextTodoUrl" value="zcczshWorkflow/zcczshWorkflow_todo.do"/>
<input type="hidden" id="hyDidUrl" name="hyDidUrl" value="zcczshWorkflow/zcczshWorkflow_did.do"/>
<%
	}else if(workflowVO.pdk.equals("cjtz_shenpi")){
%>
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_viewSummarySuggestions.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value=""/>
<input type="hidden" id="draftParticipationUrl" value=""/>
<input type="hidden" id="saveDraftUrl" value=""/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveSummarySuggestions.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_hzspyjTodo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_hzspyjDid.do"/>
<input type="hidden" id="draftCommitUrl" value=""/>
<input type="hidden" id="draftCommitTodoUrl" value=""/>
<input type="hidden" id="draftCommitNextTodoUrl" value=""/>
<input type="hidden" id="draftCommitDidUrl" value=""/>
<!--<input type="hidden" id="saveDraftUrl" value=""/>-->
<input type="hidden" id="hyOutCome" name="hyOutCome" value="整理会议纪要"/>
<input type="hidden" id="hyNextTodoUrl" name="hyNextTodoUrl" value="zcczshWorkflow/zcczshWorkflow_todo.do"/>
<input type="hidden" id="hyDidUrl" name="hyDidUrl" value="zcczshWorkflow/zcczshWorkflow_did.do"/>
<%
	}
%>
<input type="hidden" id="saveFlag" name="saveFlag" value="saveSummargSuggestion"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="采购会签办理单"/>
<input type="hidden" name="counterSignUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do?headId=<%=headId%>"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/xmshAction_modifyShInfo.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="xmXXVO.cldId" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="xmXXVO.czxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="xmshAction_viewSummarySuggestions"/>
		<!-- 提交按钮menuButton的下拉提交环节名称 start-->
		<div id="addToParent" style="display: none;">
			<div id="flow_first" style="width: 150px;">
				<div onClick="mainWindow.nextStep();" iconCls="icon-redo">组审核</div>
			</div>
		</div>
			<s:hidden name="xmXXVO.id"/>
			<br/>
			<s:textfield label="项目名称" theme="xhtml" name="xmXXVO.czxmmc" size="126" cssClass="input" readonly="true"/>
			<table width="100%" class="ui-jqgrid ui-jqgrid-btable" cellspacing="0" cellpadding="0">	
				<tr class="ui-jqgrid-labels" style="height: 25px;">
 					<td class="ui-state-default  ui-th-ltr" align="center">审批人员</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">姓名</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">同意</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">不同意</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">其他情况</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">审批意见和建议</td>
				</tr>
				<s:iterator value="finalList">
				<tr class="jqgrow ui-widget-content">
					<td  align="center"><s:property value="personType"/>&nbsp;</td>
					<td  align="center"><s:property value="spwyxm"/>&nbsp;</td>
					<td  align="center"><s:property value="agreeStr"/>&nbsp;</td>
					<td  align="center"><s:property value="disagreeStr"/>&nbsp;</td>
					<td  align="center"><s:property value="qtqk"/>&nbsp;</td>
					<td  align="center"><s:property value="spyjjy"/>&nbsp;</td>
				</tr>
				</s:iterator>
				<tr class="jqgrow ui-widget-content">
					<td  align="center">&nbsp;&nbsp;</td>
					<td  align="center">计票统计：</td>
					<td  align="center">
						<s:property value="%{#request.xmXXVO.agreeCount}"/>
						<s:hidden name="xmXXVO.agreeCount" />
					</td>
					<td  align="center">
						<s:property value="%{#request.xmXXVO.disagreeCount}"/>
						<s:hidden name="xmXXVO.disagreeCount"/>
					</td>
					<td  align="center">&nbsp;&nbsp;</td>
					<td class="td_01" align="center">&nbsp;&nbsp;</td>
				</tr>
			</table>
			<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
				<tr>
					<td class="td_zxy01">汇总结论：</td>
					<td class="td_zxy02">
						<%if(StringUtils.equals(workflowVO.pdk,"cjtz_shenpi")){ %>
							<e:select id="spjl" list="#{1:'同意',0:'不同意'}" name="xmXXVO.spjl" disabled="true"/>
						<%}else{ %>
							<e:select id="spjl" list="#{1:'同意',0:'不同意'}" name="xmXXVO.spjl"/>
						<%} %>
					</td>
					<td class="td_zxy01">是否备案：</td>
					<td class="td_zxy02">
						<r:radio name="xmXXVO.sfba" id="sfba" list="#{'true':'是','false':'否'}" onclick="changeSfba()"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">处置时限：</td>
					<td class="td_zxy02">
						<r:textfield id="czsx" name="xmXXVO.czsx" cssClass="input"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
			</table>
			<!-- 汇总意见和建议修改为：审批意见； 汇总意见审核意见修改为：审批意见审核意见-->
			<e:opinion id="test" width="100%">
		        <e:opinionPart id="LEADER" name="LEADER" value="" text="批示意见：" biaodanid="%{#request.biaodanid}"></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见：" biaodanid="%{#request.biaodanid}"></e:opinionPart>
				<e:opinionPart id="APPROVEMENT" biaodanid="%{#request.biaodanid}"  name="APPROVEMENT" value="" text="审批意见审核意见："></e:opinionPart>
		   		<e:opinionPart id="SUMMARY_SUGGEST" biaodanid="%{#request.biaodanid}"  name="SUMMARY_SUGGEST" value="" text="审批意见："></e:opinionPart>
		    </e:opinion>
		    <!--  
		    <table class="newtable" width="100%" border="0" cellpadding="0" cellspacing="0">	
		     	<tr>
		      		<td class="td_zxy01">审批意见：</td>
		      		<td class="td_zxy03">
						<s:textarea id="" name="" rows="4" cssClass="input"/>
		      		</td>
		     	</tr>
		    </table>
		    -->
		    <%@ include file="/inc/file.inc"%>
		</s:form>
	</body>
</html>


		


