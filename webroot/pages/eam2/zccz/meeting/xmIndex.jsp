<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	//String jibenxinxiType = request.getParameter("jibenxinxiType");
	String itemId = (String)request.getParameter("itemId");
	//String url = "";
	//url = basePath + "zccz/appAdviceAction_showJibenxinxi.do?jibenxinxiType=" + jibenxinxiType + "&itemId=" + itemId;
%>
<%
	String headId = (String)request.getAttribute("headId");
	String fenlei = (String)request.getAttribute("fenlei");
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/meeting/xmIndex.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>上会信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="STYLESHEET" type="text/css" href="resource/js/DHtmlTab/dhtmlxtabbar.css">
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxtabbar.js"></script>
	<script type="text/javascript">
		var winOpenStr = "toolbar=no, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=no";
		$(function(){
			<%
				if(isInWorkflow){
			%>
			<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
			<%}%>
			
			var buttonStr_stztcz = '[{"buttonHandler":"mainWindow.viewCld","buttonIcon":"icon-search","buttonText":"查看项目信息"}]';

			if(window.parent.prependButtonsFromChildren != undefined){
				window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
			}
			
			//查看项目基本信息
			var viewXmInfoStr = '[\
				{"buttonHandler":"viewXmInfo","buttonIcon":"icon-search","buttonText":"查看项目信息"}\
			]';
			//addButtons(jQuery("#jbxx"),viewXmInfoStr);
		});
		
		function viewCld(){
			<%
				if(workflowVO.pdk.equals("zccz_assetdisposal")){//实体整体处置
			%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=3","",winOpenStr);
			<%
				}else if(workflowVO.pdk.equals("zccz_persondeal")){//实体人员处置
			%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=4","",winOpenStr);
			<%
				}else if(workflowVO.pdk.equals("zccz_assetdeal")){//通用资产处置
			%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=0","",winOpenStr);
			<%
				}else if(workflowVO.pdk.equals("cjtz_shenpi")){//承继投资
			%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=5","",winOpenStr);
			<%
				}else{
			%>
					window.open("<%=basePath %>pages/eam2/zccz/meeting/itemAndAsset.jsp?itemId=<%=itemId%>&cldId=<%=headId%>&itemType=<%=fenlei%>","",winOpenStr);
			<%
				}
			%>
		}

		function viewItemAndAsset(){
			<%
				if(workflowVO.pdk.equals("zccz_assetdisposal")){
			%>
				window.open("<%=basePath %>zccz/xmshAction_viewItemAndAsset.do?"
				+ "cldId=<%=headId %>&itemType=3"
				,"",winOpenStr);
			<%
				}else
				if(workflowVO.pdk.equals("zccz_persondeal")){
			%>
				window.open("<%=basePath %>zccz/xmshAction_viewItemAndAsset.do?"
				+ "cldId=<%=headId %>&itemType=4"
				,"",winOpenStr);			
			<%
				}else
				if(workflowVO.pdk.equals("zccz_assetdeal")){
			%>
				window.open("<%=basePath %>zccz/xmshAction_viewItemAndAsset.do?"
				+ "cldId=<%=headId %>&itemType=0"
				,"",winOpenStr);
			<%
				}else if(workflowVO.pdk.equals("cjtz_shenpi")){//承继投资
			%>
				window.open("<%=basePath %>zccz/xmshAction_viewItemAndAsset.do?"
				+ "cldId=<%=headId %>&itemType=5"
				,"",winOpenStr);
			<%}%>
		}
				
		function commitWorkflow(taskId,outCome){
<%
			if(workflowVO.taskName.equals("会议组织")){
%>
				if(outCome=="提交上会"){
					if(confirm('确定要提交上会吗？')){
<%
					if(workflowVO.pdk.equals("zccz_assetdisposal")){
%>
						document.myForm.result.value = '<%=WorkflowAction.TO_COMPLETETASK%>';
						document.myForm.action = "<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do";
						document.myForm.nextTodoUrl.value = "zcczWorkflow/zcczWorkflow_hyzzTodo.do";
						document.myForm.didUrl.value = "zcczWorkflow/zcczWorkflow_hyzzDidResult.do";
						document.myForm.taskId.value = taskId;
						document.myForm.outCome.value = outCome;
						//会议组织，提交上会人--默认为为段志秀
					//	document.myForm.assignId.value = "11342,15405"; 15208
					    document.myForm.assignId.value = "11342,15208";
						//alert(document.myForm.action);
<%
					}
					if(workflowVO.pdk.equals("zccz_persondeal")){
%>
						document.myForm.result.value = '<%=WorkflowAction.TO_COMPLETETASK%>';
						document.myForm.action = "<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do";
						document.myForm.nextTodoUrl.value = "zcczperWorkflow/zcczperWorkflow_hyzzTodo.do";
						document.myForm.didUrl.value = "zcczperWorkflow/zcczperWorkflow_hyzzDidResult.do";
						document.myForm.taskId.value = taskId;
						document.myForm.outCome.value = outCome;
						//会议组织，提交上会人--默认为为段志秀
					//	document.myForm.assignId.value = "11310,15405";  15208
					    document.myForm.assignId.value = "11310,15208";
						//alert(document.myForm.action);
<%
					}
					if(workflowVO.pdk.equals("zccz_assetdeal")){
%>
						document.myForm.result.value = '<%=WorkflowAction.TO_COMPLETETASK%>';
						document.myForm.action = "<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do";
						document.myForm.nextTodoUrl.value = "zcczassetWorkflow/zcczassetWorkflow_hyzzTodo.do";
						document.myForm.didUrl.value = "zcczassetWorkflow/zcczassetWorkflow_hyzzDidResult.do";
						document.myForm.taskId.value = taskId;
						document.myForm.outCome.value = outCome;
						//会议组织，提交上会人--默认为为段志秀
					//	document.myForm.assignId.value = "11342,15405";  15208
					    document.myForm.assignId.value = "11342,15208";
						//alert(document.myForm.action);
<%
					}
					if(workflowVO.pdk.equals("cjtz_shenpi")){
%>
						document.myForm.result.value = '<%=WorkflowAction.TO_COMPLETETASK%>';
						document.myForm.action = "<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do";
						document.myForm.nextTodoUrl.value = "cjtzWorkflow/cjtzspWorkflow_hyzzTodo.do";
						document.myForm.didUrl.value = "cjtzWorkflow/cjtzspWorkflow_hyzzDidResult.do";
						document.myForm.taskId.value = taskId;
						document.myForm.outCome.value = outCome;
						document.myForm.assignId.value = "11608,15266";
						//alert(document.myForm.action);
<%
					}
%>
						var jcslxrxm = document.getElementById("jcslxrxm").value;
						var yjhzrxm = document.getElementById("yjhzrxm").value;
						if(jcslxrxm == ""){
							alert("请选择监察室列席人");
							return false;
						}if(yjhzrxm ==""){
							alert("请选择意见汇总人");
							return false;
						}else{
							document.myForm.submit();
						}
						return false;
					}
					return false;
				}
				return true;
<%
			}
			if(workflowVO.taskName.equals("上会中")){
					if(workflowVO.pdk.equals("zccz_assetdisposal")){
%>
				document.getElementById("commitNextTodoUrl").value = "zcczWorkflow/zcczWorkflow_hzspyjTodo.do";
<%
					}
					if(workflowVO.pdk.equals("zccz_persondeal")){
%>
				document.getElementById("commitNextTodoUrl").value = "zcczperWorkflow/zcczperWorkflow_shTodo.do";
<%
					}
					if(workflowVO.pdk.equals("zccz_assetdeal")){
%>
				document.getElementById("commitNextTodoUrl").value = "zcczassetWorkflow/zcczassetWorkflow_shTodo.do";
<%
					}
%>
				return true;
<%
			}
%>
			return true;
		}
		
		var _g_privateDialogFeatures = 'height=600, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		var _g_Spwy = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		function chooseSpwy(){
			var url = "<%=request.getContextPath()%>/zccz/dealToDo_getZcrSpwy.do?isZcrOrSpwy=false&pdk=<%=workflowVO.pdk%>";
			window.open(url,'',_g_Spwy);
		}
		function getSelectP(){
			return "";
		}
		//选择汇报人
		function chooseHbr(){
			var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?personType=1";
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		//监察室列席人
		function chooseJcslxr(){
			var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?personType=2";
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		//意见汇总人
		function chooseYjhzr(){
			var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?personType=3";
			window.open(url,'',_g_privateDialogFeatures);
		}

		//查看项目基本信息
		function viewXmInfo(){
			var cldId = $("#cldId").val();
			var fenlei = $("#fenlei").val();
			var url = "";
			//经营性固产处置项目、待处置类固定资产、受托固定资产
			if(fenlei == "0" || fenlei == "7" || fenlei == "8"){
				url = "<%=request.getContextPath()%>/zccz/assetDealHead_modifyHead.do?isQuoted=1&headId=" + cldId;
			}else if(fenlei == "3" || fenlei == "4"){//实体整体处置项目、实体人员安置项目
				
			}else if(fenlei == "6"){//自用资产处置
			
			}else if(fenlei == "9"){//债券处置
			
			}
			var pageProperties = 'height=600, width=800,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=yes,left=400,top=200';
			window.open(url,'',pageProperties);
		}
			
		//弹出树页面的回调方法 departmenthiddenid,departmentvalue
		function getCallBack4Tree(id,value,personType,deptId,deptName){
			if(personType == "1"){
				document.getElementById("hbr").value = id;
				document.getElementById("hbrxm").value = value;
			}
			if(personType == "2"){
				document.getElementById("jcslxr").value = id;
				document.getElementById("jcslxrxm").value = value;
			}
			if(personType == "3"){
				document.getElementById("yjhzr").value = id;
				document.getElementById("yjhzrxm").value = value;
				$("#yjhzrbmid").val(deptId);
				$("#yjhzrbmmc").val(deptName);				
			}
		}
		function callBack4Spwy(spwyIds,spwys){
			document.getElementById("spwyIds").value = spwyIds;
			document.getElementById("spwys").value = spwys;
		}
		
		//保存为草稿
		function saveAsDraft(){
			var url = '<%=basePath%>zccz/xmshAction_saveItemMeetingInfo.do';
			myform.action = url+'?saveFlag=AsDraft';
			myform.submit();	
		}
	</script>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myForm";
	if(workflowVO.pdk.equals("zccz_assetdisposal")){
		actionSpaceName = "zcczWorkflow";
		actionPath = "zcczWorkflow";
	}else
	if(workflowVO.pdk.equals("zccz_persondeal")){
		actionSpaceName = "zcczperWorkflow";
		actionPath = "zcczperWorkflow";
	}else
	if(workflowVO.pdk.equals("zccz_assetdeal")){
		actionSpaceName = "zcczassetWorkflow";
		actionPath = "zcczassetWorkflow";
	}else
	if(workflowVO.pdk.equals("cjtz_shenpi")){
		actionSpaceName = "cjtzWorkflow";
		actionPath = "cjtzspWorkflow";
	}
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
  </head>
  <body>
  <s:form id="myForm">
  	<input type="hidden" id="headId" name="headId" value="${headId}" />
		<br />
		<div align="center">
			<span class="STYLE1">受理阶段</span>
		</div>
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
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/xmshAction_saveItemMeetingInfo.do"/>
<input type="hidden" id="saveFlag" name="saveFlag" value="AsDraft"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_hyzzDidResult.do"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/xmshAction_modifyShInfo.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="xmXXVO.cldId" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="xmXXVO.czxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="xmshAction_modifyShInfo"/>
<!-- =========================================================================== -->
	<!-- 提交按钮menuButton的下拉提交环节名称 start-->
	<div id="addToParent" style="display: none;">
		<div id="flow_first" style="width: 150px;">
			<div onClick="mainWindow.nextStep();" iconCls="icon-redo">会议组织</div>
		</div>
	</div>
		<s:hidden name="xmXXVO.id" id="id"/>
		<s:hidden name="xmXXVO.fenlei" id="fenlei"/>
		<s:hidden name="xmXXVO.cldId" id="cldId"/>
		<table width="100%" class="newtable" border="1" cellspacing="0" cellpadding="0">		
			<tr>
				<td class="td_zxy01">处置项目名称：</td>
				<td class="td_form02" colspan="3"><s:textfield name="xmXXVO.czxmmc" cssClass="input" readonly="true"/></td>
			</tr>
			<tr>
				<td class="td_zxy01">审批委员：</td>
				<td class="td_form02" colspan="3">
					<s:hidden name="xmXXVO.spwyId" id="spwyIds"/>
					<r:textfield name="xmXXVO.spwys" cssClass="input" id="spwys"></r:textfield>
					<e:pc id="chooseSpwyCtl">
					    <input type="button" class="btn3_mouseover" value="选择" onclick="chooseSpwy();"> 
					</e:pc>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">汇报人：</td>
				<td class="td_form02">
					<s:hidden name="xmXXVO.hbr" cssClass="input" id="hbr"/>
					<r:textfield name="xmXXVO.hbrxm" maxlength="10"  cssClass="input" id="hbrxm"></r:textfield>
						<e:pc id="chooseHbrCtl">
							<input type="button" class="btn3_mouseover" value="选择" onclick="chooseHbr();">
						</e:pc>
				</td>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>监察室列席人111：</td>
				<td class="td_form02">
					<s:hidden name="xmXXVO.jcslxr" cssClass="input" id="jcslxr"/>
					<s:textfield name="xmXXVO.jcslxrxm" maxlength="10" cssClass="input"  id="jcslxrxm"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>意见汇总人：</td>
				<td class="td_form02">
					<s:hidden name="xmXXVO.yjhzr" cssClass="input" id="yjhzr"/>
					<s:hidden name="xmXXVO.yjhzrbmid" cssClass="input" id="yjhzrbmid"/>
					<s:hidden name="xmXXVO.yjhzrbmmc" cssClass="input" id="yjhzrbmmc"/>					
					<r:textfield name="xmXXVO.yjhzrxm" cssClass="input" maxlength="10" id="yjhzrxm"></r:textfield>
					<e:pc id="chooseYjhzrCtl">
						<input type="button" class="btn3_mouseover" value="选择" onclick="chooseYjhzr();">
					</e:pc>
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
		</table>
		&nbsp;&nbsp;
		<br/>
		&nbsp;&nbsp;
		<br/>
		<table width="100%" class="newtable" border="1" cellspacing="0" cellpadding="0">
            <tr>
                  <td height="20" colspan="4" class="panel-header" style="text-align:left;" id="jbxx">
                  </td>
            </tr>				
			<tr>
				<td class="td_zxy01" width="200">审批时间：</td>
				<td class="td_form02"><s:textfield name="xmXXVO.spsj" size="36" cssClass="input" readonly="true"/></td>
				<td  class="td_zxy01" width="200">审批方式：</td>
				<td class="td_form02"><s:textfield name="xmXXVO.CSpfs" size="36" cssClass="input" readonly="true"/></td>
			</tr>
			<tr>
				<td  class="td_zxy01">会议次数：</td>
				<td class="td_form02"><s:textfield name="xmXXVO.hycs" size="36" cssClass="input" readonly="true"/></td>
				<td  class="td_zxy01">审批主持人：</td>
				<td class="td_form02"><s:textfield name="xmXXVO.spzcr" size="36" cssClass="input" readonly="true"/></td>
			</tr>
		</table>
	</s:form>
  </body>
</html>

