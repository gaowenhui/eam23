<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="com.tansun.rdp4j.common.util.UserThreadLocal" %>
<%@page import="com.tansun.rdp4j.common.web.vo.RoleVO" %>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%
	List<CzStcztz> historyHeadList = (List<CzStcztz>)request.getAttribute("historyHeadList");
%>
<%
	String headId = (String)request.getAttribute("headId");
	String authority = "w";
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/bld/stztczBld.ctl.xml"></r:controlfile>
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
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
<%
	if(isInWorkflow){
%>
		var parentButtonStr = '[{"buttonHandler":"mainWindow.qicaoClbg(true)","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"},'+
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
<% }else {%>
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
			'{"buttonHandler":"mainWindow.backto","buttonIcon":"icon-edit","buttonText":"收回"}' +
<%
		}
%>
			']';
		window.parent.addButtonsFromChildren(parentButtonStr,'');
<%
	}
%>
				if($("#CCzfs").val() == '2'){
					$("#jydx,#jydxLable").show();
				}else{
					$("#jydx,#jydxLable").hide();
				}
				if($("#stywyxzc").val() == '有'){
					$("#aaa,#bbb").show();
				}else{
					$("#aaa,#bbb").hide();
				}
				jQuery("#claims_list").setGridWidth($("#widthRule").width());
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				jQuery("#file_huiqianlist").setGridWidth($("#widthRule").width());
				$(window).bind('resize', function(){
					jQuery("#claims_list").setGridWidth($("#widthRule").width());
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
					jQuery("#file_huiqianlist").setGridWidth($("#widthRule").width());
				});
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss_huiqian","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss_huiqian","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
				addButtons(jQuery("#gview_file_huiqianlist > .ui-jqgrid-titlebar"),buttonFileJSonString);
				init();
			});
			
			function myCommit(taskId,outCome){
				var obj = document.getElementsByName("checkfile");
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
				window.open("<%=basePath %>zccz/bldAction_showStztczBLD.do?"
				+ "head.id=" + headId 
				+ "&authority=r"
				,"",winOpenStr);				
			}
			function qicaoClbg(readonly){
       		wordTemplate("bank_Template", document.getElementById("myForm"),readonly,true, "处置报告"); 
       		window.parent.setHtml("#shitibjczbg .l-btn-text","编辑处置报告");
			window.parent.setClass("#shitibjczbg .l-btn-text","l-btn-text icon-dealFile");
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
				var hsitoryButtonStr = '[' + 
				<e:pc id="shitiList">
					'{"buttonIcon":"icon-ok","buttonText":"查看办理历史","buttonMenuId":"historyMenu"},' +
				</e:pc>
							'{"buttonHandler":"openAdvice","buttonIcon":"icon-edit","buttonText":"合规性审查"}]';
					addButtons($("#blButtons"),hsitoryButtonStr);
			}
			function commitWorkflow(taskId,outCome){
<%
				if(workflowVO.taskName.equals("合规审查")){
%>
					if(outCome=="会议组织"){
						document.getElementById("commitNextTodoUrl").value = "zcczWorkflow/zcczWorkflow_hyzzTodo.do";
						if(confirm('确定要提交吗？')){
							document.myForm.result.value = 'hgscCommit';
							document.myForm.action = "<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do";
							document.myForm.nextTodoUrl.value = $("#commitNextTodoUrl").val();
							document.myForm.didUrl.value = $("#commitDidUrl").val();
							document.myForm.taskId.value = taskId;
							document.myForm.outCome.value = outCome;
							if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
					            if(beforeWorkFlowSubmit instanceof Function){
					                var result = beforeWorkFlowSubmit(taskId,outCome);
					                if(!result) return;
					            }
				        	}							
							document.myForm.submit();
							return false;
						}
						return false;
					}
					if(outCome=="项目受理"){
						document.getElementById("commitNextTodoUrl").value = "zcczWorkflow/zcczWorkflow_todo.do";
						if(confirm('确定要退回吗？')){
							document.myForm.result.value = 'hgscCommit';
							document.myForm.action = "<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do";
							document.myForm.nextTodoUrl.value = $("#commitNextTodoUrl").val();
							document.myForm.didUrl.value = $("#commitDidUrl").val();
							document.myForm.taskId.value = taskId;
							document.myForm.outCome.value = outCome;
							if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
					            if(beforeWorkFlowSubmit instanceof Function){
					                var result = beforeWorkFlowSubmit(taskId,outCome);
					                if(!result) return;
					            }
				        	}							
							document.myForm.submit();
							return false;
						}
						return false;
					}
					if(outCome=="合规审查"){
						document.getElementById("commitNextTodoUrl").value = "zcczWorkflow/zcczWorkflow_hgscTodo.do";
						return true;
					}
					return false;
<%
				}
%>
			}
		/**
		checkEAMFormJSMethod2(arg1, arg2)
									arg1								arg2
		提交							taskId								outCome			
		拟稿提交						processDefinitionKey				outCome
		保存待办						"saveTodo"							""	
		**/
		function checkEAMFormJSMethod2(arg1, arg2){
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
		</script>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myForm";
	actionSpaceName = "zcczWorkflow";
	actionPath = "zcczWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
	</head>
	<body>
	<s:form action="zccz/entityDealHead_submitHead.do" id="myForm">
		<s:hidden id="stlx" name="head.stlx" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden name="deptid" id="deptid"/>
		<r:userhidden id="userid" name="userid"/>
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" />
		<s:hidden id="lcId" name="head.lcId" />
		<s:hidden id="lcmc" name="head.lcmc" value="实体整体处置"/>
		<s:hidden id="fblsj" name="head.fblsj" value="%{#request.fblsjStr}" />
		<br/>
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司实体整体处置方案审批办理单</span>
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
<s:hidden id="strsel" name="strsel"/>
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/entityDealHead_viewDraft.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="head.id" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.czxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="showStztczBLD"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader+"hgscDid.do"%>"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<input type="hidden" id="saveDraftUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="采购会签办理单"/>
<input type="hidden" name="counterSignUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do?headId=<%=headId%>"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
		<table class="newtable" id="widthRule" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield cssClass="input2" id="czxmmc" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center">编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="jhcd" name="head.jhcd" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center"><font color="#FF0000"><strong>*</strong></font>拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" align="center"><font color="#FF0000"><strong>*</strong></font>拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="head.ngbm" />
					<s:textfield cssClass="input" id="ngbmmc" name="head.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr"/>
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="lxdh" name="head.lxdh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">处置方式：</td>
				<td class="td_zxy02">
					<e:select onchange="changeJydx()" cssClass="input" list="#{}" parRefKey="ENTITY_DISPOSE_METHOD" id="CCzfs" name="head.CCzfs" />
				</td>
				<td class="td_zxy01">
						处置申报方式：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>有无人员：
				</td>
				<td class="td_zxy02">
					<r:select list="{'有','无'}" name="head.stywry" id="stywry" cssClass="input" />
				</td>
				<td class="td_zxy01">
					<label id="jydxLable"><font color="#FF0000"><strong>*</strong></font>交易对象：</label>
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.jydx" id="jydx" cssClass="input"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<r:select onchange="stywyxzcChange()" cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
				</td>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<r:select id="sfsh" cssClass="input" name="head.sfsh" list="{'是','否'}" />
				</td>
			</tr>
			<tr id="bbb">
				<td class="td_zxy01">资产评估值(万元)：</td>
				<td class="td_zxy02" colspan="3">
					<s:set var="zcpgz" value="head.zcpgz"/>
					<s:hidden name="head.zcpgz" id="zcpgz" />
					<r:textfield id="zcpgzWY" cssClass="input2" value="%{#zcpgz/10000}"/>
				</td>
			</tr>
			<tr id="aaa">
				<td class="td_zxy01">实体评估值(万元)：</td>
				<td class="td_zxy02">
					<s:set var="stpgz" value="head.stpgz"/>
					<s:hidden name="head.stpgz" id="stpgz" />
					<r:textfield id="stpgzWY" cssClass="input" value="%{#stpgz/10000}"/>
				</td>
				<td class="td_zxy01">评估机构：</td>
				<td class="td_zxy02">
					<r:textfield name="head.pgjg" id="pgjg" cssClass="input" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">重报次数：</td>
				<td class="td_zxy02">
					<s:textfield name="head.cbcs" id="cbcs" cssClass="input" readonly="true" />
				</td>
				<td class="td_zxy01">合规审查次数：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="hgsccs" name="head.hgsccs" readonly="true" />
				</td>
			</tr>
		</table>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">实体信息</div>
			<div id="stInfo" class="panel-tool"></div>
		</div>
		<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>资产编号：</td>
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
				<td class="td_zxy01">账面资产总额：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcze" id="zmzcze" cssClass="input" readonly="true" />
				</td>
				<td class="td_zxy01">账面资产负债：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcfz" id="zmzcfz" cssClass="input" readonly="true" />
				</td>
			</tr>
		</table>
		<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:date name="head.sbrq" var="sbrpFormat" format="yyyy-MM-dd"/>
	    			<s:textfield name="head.sbrq" cssClass="input" id="sbrq" value="%{#sbrpFormat}" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<s:textfield cssClass="input" id="slxh" name="head.slxh" readonly="true"/>
	    		</td>
	    	</tr>
		</table>
		<table id="claims_list"></table>
		<div id="pgtoolbarclaims"></div>
		<script type="text/javascript">
			jQuery("#claims_list").jqGrid({
				url:"<%=basePath %>zccz/entityDealHead_showDeptBodys.do",
				postData:{
					"head.id" : "" + $("#id").val()
				},
				datatype: "json",
				colNames:['id','债务人名称','起始日期','终止日期','合同金额','购入债权余额','本金','利息','担保类型','担保合同金额','担保物类别'],
				colModel:[
					{name:'id',index:'id',hidden:true},	
					{name:'name',index:'name'},
					{name:'htqsrq',index:'htqsrq'},
					{name:'htzzrq',index:'htzzrq'},
					{name:'htje',index:'htje'},
					{name:'grzye',index:'grzye'},
					{name:'bj',index:'bj'},	
					{name:'lx',index:'lx'},
					{name:'dblxmc',index:'dblxmc'},	
					{name:'dbhtje',index:'dbhtje'},							
				    {name:'dbwzlbmc',index:'dbwzlbmc'}
				],
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:0,
				//pager: '#pgtoolbarclaims',
				multiselect: true,
				caption: '债权信息',
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
		<%@ include file="/inc/according.inc"%>  
		<e:opinion id="test" width="100%">
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
	    <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	    	<tr>
	    		<td colspan="4" class="td_zxy01" id="blButtons"></td>
	    	</tr>
	    </table>
	    <e:opinion id="test2" width="100%">
			<e:opinionPart id="BLYJ_ZZYJ" biaodanid="%{#request.biaodanid}" name="BLYJ_ZZYJ" value="" text="最终意见："></e:opinionPart>
			<e:opinionPart id="BLYJ_GCYJ" biaodanid="%{#request.biaodanid}" name="BLYJ_GCYJ" value="" text="过程意见："></e:opinionPart>
			<e:opinionPart id="BLYJ_THYJ" biaodanid="%{#request.biaodanid}" name="BLYJ_THYJ" value="" text="沟通意见："></e:opinionPart>
			<e:opinionPart id="CHECK_DEPT_MODIFY" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT_MODIFY" value="" text="审查意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file_heguishencha.inc"%>
	    </s:form>
	</body>
</html>