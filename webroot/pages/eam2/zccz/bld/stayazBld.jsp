<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="com.tansun.rdp4j.common.util.UserThreadLocal" %>
<%@page import="com.tansun.rdp4j.common.web.vo.RoleVO" %>
<%@page import="java.util.List"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%
	String headId = (String)request.getAttribute("head.id");
	List<CzStcztz> historyHeadList = (List<CzStcztz>)request.getAttribute("historyHeadList");
	String authority = "w";
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/bld/stayazBld.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->

<e:pc id="authority">
	<% authority = "r";%>
</e:pc>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>实体整体处置办理单</title>
		<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zcczperWorkflow";
	actionPath = "zcczperWorkflow";
%>
<script>
	function commitWorkflow(taskId,outCome){
		<%
			if(workflowVO.taskName.equals("合规审查")){
		%>
				if(outCome=="会议组织"){
					document.getElementById("commitNextTodoUrl").value = "zcczperWorkflow/zcczperWorkflow_hgscTodo.do";
					if(confirm('确定要提交吗？')){
						document.myform.result.value = 'hgscCommit';
						document.myform.action = "<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do";
						document.myform.nextTodoUrl.value = $("#commitNextTodoUrl").val();
						document.myform.didUrl.value = $("#commitDidUrl").val();
						document.myform.taskId.value = taskId;
						document.myform.outCome.value = outCome;
						if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
				            if(beforeWorkFlowSubmit instanceof Function){
				                var result = beforeWorkFlowSubmit(taskId,outCome);
				                if(!result) return;
				            }
			        	}						
						document.myform.submit();
						return false;
					}
					return false;
				} 
				if (outCome=="项目受理") {
					document.getElementById("commitNextTodoUrl").value = "zcczperWorkflow/zcczperWorkflow_todo.do";
					if(confirm('确定要退回吗？')){
						document.myform.result.value = 'hgscCommit';
						document.myform.action = "<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do";
						document.myform.nextTodoUrl.value = $("#commitNextTodoUrl").val();
						document.myform.didUrl.value = $("#commitDidUrl").val();
						document.myform.taskId.value = taskId;
						document.myform.outCome.value = outCome;
						if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
				            if(beforeWorkFlowSubmit instanceof Function){
				                var result = beforeWorkFlowSubmit(taskId,outCome);
				                if(!result) return;
				            }
			        	}
						document.myform.submit();
						return false;
					}
					return false;
				}
				if(outCome=="合规审查"){
					document.getElementById("commitNextTodoUrl").value = "zcczperWorkflow/zcczperWorkflow_xmslTodo.do";
					return true;
				}
				return true;
		<%
			}
		%>
	}
	
	function feiyongDetail(authority){
			window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do'
			+ '?authority=r' 
			+ '&headId=' + $("#id").val(),'',winOpenStr);
		}
		
		function renyuanDetail(authority){
			if($("#stid").val() == null || $("#stid").val() == ""){
				alert("请先选择实体");
				return false;
			}
			window.open('<%=basePath %>zccz/personDealHead_renyuanDetail.do?' 
			+ 'authority=r' 
			+ '&stid=' + $("#stid").val() 
			+ '&headId=' + $("#id").val(),'',winOpenStr);
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

.container2 .on a {
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
<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
<%
	if(isInWorkflow){
%>
		var parentButtonStr = '[{"buttonHandler":"mainWindow.qicaoClbg()","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"},'+
<%
		if(workflowVO.step.equals("draft")||workflowVO.step.equals("todo")){
%>
			'{"buttonHandler":"mainWindow.myCommit(&quot;<%=workflowVO.taskId%>&quot;,&quot;项目受理&quot;);","buttonIcon":"icon-edit","buttonText":"提交沟通意见"}' + 
<%
			List<RoleVO> list = (List<RoleVO>) UserThreadLocal.get().getRoleList();
			boolean isRole = false;
			for(int i = 0; i < list.size(); i++){
				RoleVO role = (RoleVO)list.get(i);
				System.out.println(role);
				if(role.getRoleName().equals("部门领导")){
					isRole = true;
				}
			}
			if(isRole){
%>
			',{"buttonHandler":"mainWindow.myCommit(&quot;<%=workflowVO.taskId%>&quot;,&quot;会议组织&quot;);","buttonIcon":"icon-edit","buttonText":"提交最终意见"}' + 
			',{"buttonHandler":"mainWindow.myCommit(&quot;<%=workflowVO.taskId%>&quot;,&quot;合规审查&quot;);","buttonIcon":"icon-edit","buttonText":"选择办理人"}' + 
<% }else{ %>
			',{"buttonHandler":"mainWindow.myCommit(&quot;<%=workflowVO.taskId%>&quot;,&quot;合规审查&quot;);","buttonIcon":"icon-edit","buttonText":"选择办理人"}' + 
<%}
			if(saveBtnDisplay){
				if(workflowVO.step.equals("draft")){%>
			',{"buttonHandler":"mainWindow.saveDraft","buttonIcon":"icon-edit","buttonText":"保存"}' + 
<%
				}else{
%>
			',{"buttonHandler":"mainWindow.saveTodo","buttonIcon":"icon-edit","buttonText":"保存"}' +
<%				}
			}
		}
		if(workflowVO.step.equals("did")){
%>
			'[{"buttonHandler":"mainWindow.backto","buttonIcon":"icon-edit","buttonText":"收回"}' +
<%
		}
%>
			']';
		window.parent.addButtonsFromChildren(parentButtonStr,'');
<%
	}
%>
				
				if($("#gszmnsfyysfzje").val() == '无'){
					$("#gszmnsfyysfzjeDiv").hide();
				}else{
					$("#gszmnsfyysfzjeDiv").show();
				}
				if($("#ryazfysfxjtdf").val() == '0'){
					$("#ryazfysfxjtdfDiv").hide();
				}else{
					$("#ryazfysfxjtdfDiv").show();
				}
				if($("#djtstyzr").val() == '无'){
					$("#fzjeDiv").hide();
				}else{
					$("#fzjeDiv").show();
				<%
				for(CzStcztz head : historyHeadList){
					if(head != null && head.getFzje() != null && !"".equals(head.getFzje())){
				%>
					 $("#fzje").val(${head.fzje}.toFixed(2));
				<%
				    }
				}
				%>					
				}
				
				$("#pgjzr").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
				jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
				$(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
					jQuery("#file_list").setGridWidth($("#conditions").width());
					jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
				});
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss_huiqian","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss_huiqian","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
				<%if(workflowVO.taskName.equals("合规审查")){%>
				
				addButtons(jQuery("#gview_file_huiqianlist > .ui-jqgrid-titlebar"),buttonFileJSonString);
				<%}%>
				setRenyuanInfo();
				init()
			});
			
			function myCommit(taskId,outCome){
				var obj=document.getElementsByName("checkfile");
				var strsel = "";
				for (var i=0;i<=obj.length-1;i++){
					if (obj[i].checked){
						strsel = strsel +","+ obj[i].value;
					}
				}
				$("#strsel").val(strsel);
				commit(taskId,outCome);
			}
			
			function openAdvice(){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
				+ "head.id=${head.id}"
				+ "&authority=<%=authority%>"
				,"",winOpenStr);
			}
			
			function showBld(headId){
				window.open("<%=basePath %>zccz/bldAction_showStayazBLD.do?"
				+ "head.id=" + headId
				+ "&authority=r"
				,"",winOpenStr);				
			}
			function qicaoClbg(){
	       		wordTemplate("bank_Template", document.getElementById("myForm"),true,true, "处置报告"); 
	       		return false;
			}			
			function init(){
				var hsitoryButtonHtml = 
				'<div id="historyMenu" style="width: 150px;">' +
				<%
					for(CzStcztz head : historyHeadList){
				%>
					'<div onClick="showBld(&quot;<%=head.getId() %>&quot;);return false;" >' + '<%=head.getFblsj() %>' + '</div>' + 
				<%}%>
				 '</div>';
				$("body").append(hsitoryButtonHtml);
				
				var hsitoryButtonStr = '[{"buttonIcon":"icon-ok","buttonText":"查看办理历史","buttonMenuId":"historyMenu"},\
						{"buttonHandler":"openAdvice","buttonIcon":"icon-edit","buttonText":"合规性审查"}]';
				addButtons($("#blButtons"),hsitoryButtonStr);
			}
			
			function setRenyuanInfo(){
				$.post("<%=basePath %>zccz/personDealHead_setRyFyInfo.do",{
					"head.id" : '' + $("#id").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#azrs").val(returnObj.azrs);
					$("#azfy").val(returnObj.azfy);
				});
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
			return true;
		}			
		</script>
	</head>
	<body>
        <s:form action="" id="myform">
        <s:hidden id="stlx" name="head.stlx" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden name="deptid" id="deptid"/>
		<r:userhidden id="userid" name="userid"/>		
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" value="%{#request.head.id}"/>
		<s:hidden id="lcId" name="head.lcId" />
		<s:hidden id="headId" name="headId" value="%{#request.head.id}"/>
		<s:hidden id="lcmc" name="head.lcmc" value="实体人员安置"/>
		<s:hidden id="fblsj" name="head.fblsj" value="%{#request.fblsjStr}" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<s:hidden id="strsel" name="strsel"/>
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_toModify.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_toModify.do"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/personDealHead_toModify.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="head.id" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.czxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="bldAction_showStayazBLD"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_did.do"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<input type="hidden" id="saveDraftUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="会签办理单"/>
<input type="hidden" name="counterSignUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_toModify.do?headId=<%=headId%>"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司实体人员安置审批办理单</span>
		</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->		
<br/>
		<!--  
		<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="right">当前环节：拟稿 &nbsp;&nbsp;</td>
				<td width="150" align="right">当前处理人：<s:property value="%{#request.user.username}"/></td>
			</tr>
		</table>
		-->
		<hr />
		<table width="100%" id="conditions" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01">处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield cssClass="input" id="czxmmc" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">呈送：</td>
				<td colspan="3" class="td_zxy02">
					<r:textfield cssClass="input" id="chengsong" name="head.chengsong"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select id="jhcd" name="head.jhcd" cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" width="120">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="head.ngbm" />
					<s:textfield cssClass="input" id="ngbmmc" name="head.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr"/>
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01">联系电话：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="lxdh" name="head.lxdh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<r:select id="sfsh" cssClass="input" name="head.sfsh" list="{'是','否'}" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_zxy01">会签部门：</td>
			    <td class="td_zxy03" colspan="3" >
			    	<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true" cssClass="input2"/>
			    	<s:hidden  name="head.hqbmid" id="hqbmids"/>
		      	</td>
			</tr>			
		</table>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">实体信息</div>
			<div id="personInfo" class="panel-tool"></div>
		</div>
		<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01">资产编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="zcbh" name="head.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">实体名称：</td>
				<td class="td_zxy02">
					<s:hidden id="stid" name="head.stid" />
					<s:textfield cssClass="input" id="stmc" name="head.stmc" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体现状：</td>
				<td class="td_zxy02">
					<s:hidden id="stxz" name="head.stxz" />
					<e:vc codeType="ENTITY_CURRENT_STATUS" style="input" id="stxzName" codeKey="head.stxz" input="true"/>
				</td>
				<td class="td_zxy01">实体所处省份：</td>
				<td class="td_zxy02">
					<s:hidden id="stscsf" name="head.stscsf" />
					<e:vc codeType="PROVIENCE" style="input" id="sfName" codeKey="head.stscsf" input="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
				</td>
				<td class="td_zxy01">对建投是否有负债：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="djtstyzr" onchange="showFzje(this)" name="head.djtstyzr" list="{'无','有'}" />
					<s:div id="fzjeDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="fzje" name="head.fzje" />(元)</s:div>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					人员安置费用是否需建投垫付：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" onchange="showDfje(this)" id="ryazfysfxjtdf" name="head.ryazfysfxjtdf" list="#{'0':'否','1':'是'}" />
					<s:div id="ryazfysfxjtdfDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="dfje" name="head.dfje" />(元)</s:div>
				</td>
				<td class="td_zxy01">公司账面内是否有预计负债金额：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" list="{'无','有'}" onchange="showGszmnsfyysfzjeDiv(this)" id="gszmnsfyysfzje" name="head.gszmnsfyysfzje" />
					<s:div id="gszmnsfyysfzjeDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="yjfzje" name="head.yjfzje"/>(元)</s:div>
					<script type="text/javascript">
						function showGszmnsfyysfzjeDiv(obj){
							if($(obj).val() == '无'){
								$("#gszmnsfyysfzjeDiv").hide();
							}else{
								$("#gszmnsfyysfzjeDiv").show();
							}
						}
					</script>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置人员明细：
				</td>
				<td class="td_zxy02" id="renyuanTd">
					<input type="button" class="btn3_mouseover" value="安置人员明细" onclick="renyuanDetail('r')" />
				</td>
				<td class="td_zxy01">
					安置费用明细：
				</td>
				<td class="td_zxy02" id="feiyongTd">
					<input type="button" class="btn3_mouseover" value="安置费用明细" onclick="feiyongDetail('r')" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置人数：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azrs" name="head.azrs" readonly="true" />
				</td>
				<td class="td_zxy01">
					安置总费用(元)：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azfy" name="head.azfy" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					处置申报方式：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
				<td class="td_zxy01">
					合规审查次数:
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="hgsccs" name="head.hgsccs" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置说明：
				</td>
				<td colspan="3" class="td_zxy02">
					<r:textarea cssClass="input2" cols="4" id="azsm" name="head.azsm" />
				</td>
			</tr>
		</table>
		<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:date name="head.sbrq" var="formatDate" format="yyyy-MM-dd"/>
	    			<s:textfield cssClass="input" id="sbrq" name="head.sbrq" value="%{#formatDate}" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<s:textfield id="slxh" name="head.slxh" readonly="true" cssClass="input"/>
	    		</td>
	    	</tr>
		</table>
		<%@ include file="/inc/according.inc"%>
		<e:opinion id="test" width="100%">
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="MEETING_DEPT" name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
        <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        	<tr>
        		<td colspan="4" class="td_zxy01" id="blButtons"></td>
        	</tr>
		</table>
		<e:opinion id="test2" width="100%">		
        <e:opinionPart id="BLYJ_ZZYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_ZZYJ" value="" text="最终意见："></e:opinionPart>
		<e:opinionPart id="BLYJ_GCYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_GCYJ" value="" text="过程意见："></e:opinionPart>
		<e:opinionPart id="BLYJ_THYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_THYJ" value="" text="沟通意见："></e:opinionPart>
		<e:opinionPart id="CHECK_DEPT_MODIFY" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT_MODIFY" value="" text="审查意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file_heguishencha.inc"%>
        </s:form>        
	</body>
</html>