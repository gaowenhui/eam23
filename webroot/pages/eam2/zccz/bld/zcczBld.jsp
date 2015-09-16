<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="java.util.List"%>
<%@page import="com.tansun.eam2.zccz.vo.CztzfaXxVO"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzCztzfaXx"%>
<%@page import="com.tansun.rdp4j.common.util.UserThreadLocal" %>
<%@page import="com.tansun.rdp4j.common.web.vo.RoleVO" %>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/bld/zcczBld.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<%
	String headId = request.getAttribute("disposeHead.id").toString();
	CztzfaXxVO disposeHead = (CztzfaXxVO)request.getAttribute("disposeHead");
	List<CzCztzfaXx> historyHeadList = (List<CzCztzfaXx>)request.getAttribute("historyHeadList");
	String authority = "w";
%>
<e:pc id="authority">
	<% authority = "r";%>
</e:pc>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<title>资产处置办理单</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zcczassetWorkflow";
	actionPath = "zcczassetWorkflow";
%>
<script>
	function commitWorkflow(taskId,outCome){
		<%
			if(workflowVO.taskName.equals("合规审查")){
		%>
				if(outCome=="会议组织"){
					var zzyj = document.getElementById("BLYJ_ZZYJ").value;
					if(zzyj == null || zzyj == ""){
						alert("请填写最终意见后再提交!");
						return false;
					}
					document.getElementById("commitNextTodoUrl").value = "zcczassetWorkflow/zcczassetWorkflow_hgscTodo.do";
					if(confirm('确定要提交吗？')){
						document.myform.result.value = 'hgscCommit';
						document.myform.action = "<%=request.getContextPath()%>/zccz/assetDealHead_saveHead.do";
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
					var thyj = document.getElementById("BLYJ_THYJ").value;
					if(thyj == null || thyj == ""){
						alert("请填写沟通意见后再提交！");
						return false;
					}
					document.getElementById("commitNextTodoUrl").value = "zcczassetWorkflow/zcczassetWorkflow_hgscToXmslTodo.do";
					if(confirm('确定要退回吗？')){
						document.myform.result.value = 'hgscCommit';
						document.myform.action = "<%=request.getContextPath()%>/zccz/assetDealHead_saveHead.do";
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
				if (outCome=="合规审查") {
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
		var parentButtonStr = '[' +
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
		 <% }  else {%>
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
				//设置资产grid宽度
				jQuery("#jygdzcList").setGridWidth($("#form").width());
				jQuery("#dczzcList").setGridWidth($("#form").width());
				jQuery("#stzcList").setGridWidth($("#form").width());
				jQuery("#entity_asset_list").setGridWidth($("#form").width());
				jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
				jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
				jQuery("#zqList").setGridWidth($("#form").width());
				jQuery("#file_list").setGridWidth($("#form").width());
				jQuery("#file_huiqianlist").setGridWidth($("#form").width());
				jQuery("#blyj_reason_list").setGridWidth($("#form").width());
				$(window).bind('resize', function(){
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#dczzcList").setGridWidth($("#form").width());
					jQuery("#stzcList").setGridWidth($("#form").width());
					jQuery("#entity_asset_list").setGridWidth($("#form").width());
					jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zqList").setGridWidth($("#form").width());					
					jQuery("#file_list").setGridWidth($("#form").width());
					jQuery("#file_huiqianlist").setGridWidth($("#form").width());
					jQuery("#blyj_reason_list").setGridWidth($("#form").width());
				});
				<e:pc id="hgscFileButton">
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss_huiqian","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss_huiqian","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
				addButtons(jQuery("#gview_file_huiqianlist > .ui-jqgrid-titlebar"),buttonFileJSonString);
				</e:pc>
				init();
				//查看正文按钮
				<e:pc id="chakanzhengwen">
					var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen()","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
					if(window.parent.prependButtonsFromChildren != undefined){
						window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
					}
				</e:pc>
				<e:pc id="disableCheck">
					$(":checkbox").attr("disabled","disabled");
				</e:pc>
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
			
			function openAdvice(headId){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
				+ "head.id=<%=headId %>&zcczlb=zccz"
				+ "&authority=<%=authority%>"
				,"",winOpenStr);
			}
			
			function showBld(headId){
				window.open("<%=basePath %>zccz/zccz/bldAction_showZcczBLD.do?"
				+ "headId=" + headId
				+ "&authority=r"
				,"",winOpenStr);				
			}
			
			function init(){
				var hsitoryButtonHtml = 
				'<div id="historyMenu" style="width: 150px;">' +
				<%
					if(historyHeadList != null){
						for(CzCztzfaXx head : historyHeadList){
							String temp = head.getId();
				%>
							'<div onClick="showBld(&quot;' + '<%=temp %>' + '&quot;);return false;" >' + '<%=disposeHead.getFblsj() %>' + '</div>' + 
				<%		}
					}
				%>
				 '</div>';
				$("body").append(hsitoryButtonHtml);
				var hsitoryButtonStr = '[' + 
				<e:pc id="blButtons_quanxian">
					'{"buttonIcon":"icon-ok","buttonText":"查看办理历史","buttonMenuId":"historyMenu"},' + 
				</e:pc>
					'{"buttonHandler":"openAdvice","buttonIcon":"icon-edit","buttonText":"合规性审查"}]';
					addButtons($("#blButtons"),hsitoryButtonStr);
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
		
		//查看处置报告
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"资产处置报告"); 
		}
		
		function fillExpensesDetail(){
			window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do?headId=<%=disposeHead.getId()%>&authority=r','','');
		}
		</script>
	</head>
	<body>
<s:form id="myform" name="myform">
	<s:hidden id="fblsj" name="disposeHead.fblsj" value="%{#request.fblsjStr}" />
	<s:hidden name="disposeHead.id" id="headId" value="%{#request.disposeHead.id}"></s:hidden>
	<s:hidden name="disposeHead.lcmc"></s:hidden>
	<s:hidden name="disposeHead.lcid" ></s:hidden>
	<s:hidden name="disposeHead.scczfaxxid" ></s:hidden>
	<s:hidden name="disposeHead.cldzt" ></s:hidden>
	<s:hidden name="disposeHead.fafl" ></s:hidden>
	<s:hidden name="disposeHead.cscldid"></s:hidden>
	<!--查看报告需要的 -->
	<r:userhidden id="userid" />
	<r:depthidden view="N" name="deptnameshow" />
	<r:depthidden view="N" name="deptid"  /> 
	<s:hidden name="head.ngbm" id="ngbm"  value="%{#request.disposeHead.ngbm}" />
	<s:hidden name="bdid" id="bdid" value="%{#request.disposeHead.id}"></s:hidden>
	<s:hidden id="stlx" name="head.stlx" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<s:hidden id="strsel" name="strsel"/>
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
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "hgscDid.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "hgscDid.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/assetDealHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="disposeHead.id" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="disposeHead.cztzxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="showZcczBLD"/>
<!-- =========================================================================== -->
			<br />
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司资产处置方案审批办理单</span>
		</div>
<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
			<hr/>

			<s:set name="biaodanid" value="%{#request.disposeHead.id}" />	 
			<s:hidden name="biaodanid" value="%{#request.disposeHead.id}" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="form">
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
					<td class="td_form02" colspan="3">
						<r:textfield name="disposeHead.cztzxmmc" id="cztzxmmc" cssClass="input2" readonly="true"/></td>						
				</tr>
				<tr>
				  <td height="24"  class="td_zxy01" align="center">编号：</td>
				  <td class="td_form02"><r:textfield name="disposeHead.bianhao" id="bianhao"  size="35" cssClass="input" readonly="true"/></td>
				  <td class="td_zxy01"> 急缓程度：</td>
				  <td class="td_form02"><r:select list="{'一般','急','特急'}" name="disposeHead.jhcd" id="jhcd" disabled="true"/></td>
			  	</tr>
				<tr>
					<td height="24" class="td_zxy01" align="center">
						<font color="#FF0000"><strong>*</strong></font>拟稿日期：</td>
					<td class="td_form02">
						<s:date name="disposeHead.ngrq" format="yyyy-MM-dd" var="ngrq"/>
						<r:textfield name="disposeHead.ngrq" value="%{#ngrq}" size="35" id="ngrq" cssClass="input" readonly="true"/></td>
					<td  align="center" class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>拟稿部门：</td>
					<td  class="td_form02">
						<s:hidden name="disposeHead.ngbm" />
						<r:textfield name="disposeHead.ngbmmc" size="35" id="ngbmmc" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td height="24" class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>拟稿人：</td>
					<td class="td_form02">
						<s:hidden name="disposeHead.ngr"/>
						<r:textfield name="disposeHead.ngrxm" size="35" id="ngrxm"  readonly="true" cssClass="input" readonly="true"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>联系电话：</td>
					<td class="td_form02">
						<r:textfield name="disposeHead.lxdh" id="lxdh"  size="35" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>资产所在位置：</td>
					<td colspan="3"  class="td_form02">
						<r:textfield name="disposeHead.zcszwz" id="zcszwz" cssClass="input2" readonly="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01" >
						<font color="#FF0000"><strong>*</strong></font>处置资产类别：
					</td>
				    <td class="td_zxy02" colspan="3">
				    	<s:checkboxlist name="disposeHead.zclb" id="zclb" value="%{#request.zclbList}" list="#{0:'经营性固产','5':'待处置资产',1:'实体内资产',2:'委贷抵债物',4:'自用资产','6':'债券'}"/>
				    </td>				
				</tr>
				<tr>
					<td class="td_zxy01" height="24">评估机构名称：</td>
				    <td class="td_form02" colspan="3"><r:textfield name="disposeHead.pgjgmc"  id="pgjgmc" cssClass="input2" readonly="true"/></td>  
				</tr>	
				<tr>
					<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>建议处置回收金额（元）：</td>
				    <td class="td_form02"><r:textfield name="disposeHead.yjczhsjewy" id="yjczhsje" readonly="true"/></td>
					<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计处置费用（元）：</td>
				    <td class="td_form02"><r:textfield name="disposeHead.yjczfy" id="yjczfy"  readonly="true" id="yjczfy" style="width:55%"></r:textfield>
					<e:pc id="expensesDetail_button">
				    	<input type="button" id="expensesDetail" style="width:25%" value="费用明细" onclick="fillExpensesDetail()" />
					</e:pc>				    
				    </td>  
				</tr>	
				<tr>
					<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计损失金额（元）：</td>
				    <td class="td_form02">
				    	<r:textfield name="disposeHead.yjssjewy" size="35" cssClass="input" id="yjssje" readonly="true"/>
				    </td>  	
					<td class="td_zxy01">预计损失率：</td>
				    <td class="td_form02">
				    	<s:hidden id="zmyz" value="%{#request.zmyz}"/>
				    	<r:textfield name="disposeHead.yjssl" size="35"  readonly="true" cssClass="input" id="yjssl"/>
				    </td>
				</tr>	
				<tr>
					<td class="td_zxy01" height="24">重报次数：</td>
				    <td class="td_form02"><s:textfield name="disposeHead.cbcs" size="35" cssClass="input" id="cbcs" readonly="true"></s:textfield>
				    </td>  
				    <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置申报方式：</td>
		            <td class="td_form02"><r:select list="#{'':'--请选择--',0:'首次',1:'变更',2:'重报'}" name="disposeHead.czsbfs" id="czsbfs"  value="%{#request.disposeHead.czsbfs}" disabled="true"></r:select></td>
				</tr>	
				<tr>
					<td class="td_zxy01" height="24">是否经过评估审查：</td>
				    <td class="td_form02">
				    <s:radio name="disposeHead.sfjpgsc"  list="#{0:'否',1:'是'}" id="sfjpgsc"  value="%{#request.disposeHead.sfjpgsc}" disabled="true"></s:radio>
				    </td>
					<td class="td_zxy01">评估报告失效期截止日期：</td>
			        <td class="td_form02">
			        	<s:date name="disposeHead.pgbgsxqjzrq" format="yyyy-MM-dd" var="reportDeadline"/>
						<r:textfield name="disposeHead.pgbgsxqjzrq" value="%{#reportDeadline}" id="reportDeadline" cssClass="input" readonly="true"/>
			        </td>
				</tr>
				<tr>
				 <td class="td_zxy01" height="24">
				  <font color="#FF0000"><strong>*</strong></font>申报材料清单：</td>
				    <td colspan="3" class="td_form02">
				     <table>
		               <tbody>
		                  <tr>
		                     <td><s:checkbox name="disposeHead.sfysbd" id="sfysbd"  disabled="true"/>资产处置申报单</td>
		                     <td><s:checkbox name="disposeHead.sfyczfa" id="sfyczfa"  disabled="true"/>资产处置方案</td>
		                     <td><s:checkbox name="disposeHead.sfysjqk" id="sfysjqk"  disabled="true"/>财务审计情况</td>
		                     <td><s:checkbox name="disposeHead.sfypgbg" id="sfypgbg"  disabled="true"/>资产评估报告</td>
		                  </tr>
		            	</tbody>
				     </table>
				    </td>
			    </tr>
			    <tr>
				   <td class="td_zxy01">其他申报材料：</td>
				   <td class="td_form02" colspan="3">
				   	<r:textfield name="disposeHead.qtsbcl" id="qtsbcl"  cssClass="input2" readonly="true"/>
				   </td>
				</tr>
	        	<tr>
	        		<td class="td_zxy01">申报日期：</td>
	        		<td class="td_zxy02">
	        			<s:date name="disposeHead.sbrq" var="mySbrq" format="yyyy-MM-dd"/>					
						<r:textfield name="disposeHead.sbrq" readonly="true" cssClass="input" id="sbrq" value="%{#mySbrq}"/>
	        		</td>
	        		<td class="td_zxy01">受理序号：</td>
	        		<td class="td_zxy02">
	        			<r:textfield cssClass="input" id="slxh" name="disposeHead.slxh" readonly="true"/>
	        		</td>
	        	</tr>
			</table>
			<%
				if(disposeHead.getZclb() != null){
			%>
			<!--	经验性固定资产		-->
			<div style="display:<%=disposeHead.getZclb().contains("0")?"block":"none" %>" id="jygdzcListDiv"><table id="jygdzcList"></table></div>
			<!--	待处置资产		-->
			<div style="display:<%=disposeHead.getZclb().contains("5")?"block":"none" %>" id="dczzcListDiv"><table id="dczzcList"></table></div>
			<!--	受托资产		-->
			<div style="display:<%=disposeHead.getZclb().contains("6")?"block":"none" %>" id="stzcListDiv"><table id="stzcList"></table></div>
			<!--	实体内资产		-->
			<div style="display:<%=disposeHead.getZclb().contains("1")?"block":"none" %>" id="entity_asset"><table id="entity_asset_list"></table></div>
			<!--	委贷抵债物		-->
			<div style="display:<%=disposeHead.getZclb().contains("2")?"block":"none" %>" id="loan_pledge_asset"><table id="loan_pledge_asset_list"></table></div>
			<!--	自用资产			-->
			<div style="display:<%=disposeHead.getZclb().contains("3")?"block":"none" %>" id="zyzc_asset"><table id="zyzc_asset_list"></table></div>
			<!--	债券		-->
			<div style="display:<%=disposeHead.getZclb().contains("7")?"block":"none" %>" id="zqListDiv"><table id="zqList"></table></div>
			<%
				}
			%>
			<%@ include file="/inc/according.inc"%>
		    <e:opinion id="test" width="100%">
		        <e:opinionPart id="LEADER" name="LEADER" value="" text="批示意见：" biaodanid="%{#request.disposeHead.id}"></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见：" biaodanid="%{#request.disposeHead.id}"></e:opinionPart>
		        <e:opinionPart cols="100" leftTdStyle="td_zxy01" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见：" biaodanid="%{#request.disposeHead.id}"></e:opinionPart>
		    </e:opinion>
		    <%@ include file="/inc/file.inc"%>
		    <table class="newtable" width="100%" border="0" cellpadding="0" cellspacing="0">
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
			colNames:['id','资产名称','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}
			],
			height:'auto',
			rowNum:0,
			autowidth:true,
			multiselect: true,
			caption: '经营性固定资产（单位：元）',
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}
		});
//--------------------------------------------------待处置资产------------------------------------------------------
		jQuery("#dczzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"5"
			},
			colNames:['id','资产名称','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}								
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '待处置资产（单位：元）',
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
			}
		});
//--------------------------------------------------受托资产------------------------------------------------------
		jQuery("#stzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"6"
			},
			colNames:['id','资产名称','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}								
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '受托资产（单位：元）',
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
			}
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
				{name:'bstmc',index:'bstmc',sortable:false},
				{name:'bzcbh',index:'bzcbh',sortable:false},
				{name:'bzcmc',index:'bzcmc',sortable:false},
				{name:'entityAssetType',index:'entityAssetType',sortable:false},
				{name:'bsjzyr',index:'bsjzyr',sortable:false},
				{name:'bpgz',index:'bpgz',sortable:false},
				{name:'bcfwz',index:'bcfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
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
			}
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
				{name:'czcbh',index:'czcbh',sortable:false},
				{name:'czcmc',index:'czcmc',sortable:false},
				{name:'czclx',index:'czclx',sortable:false},
				{name:'csjzyr',index:'csjzyr',sortable:false},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',sortable:false},
				{name:'ccfwz',index:'ccfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}							
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
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
			}
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
				{name:'zyzcbh',index:'zyzcbh',sortable:false},
				{name:'zyzcmc',index:'zyzcmc',sortable:false},
				{name:'zykpbh',index:'zykpbh',sortable:false},
				{name:'zykpmc',index:'zykpmc',sortable:false},
				{name:'zyccyzWy',index:'zyccyzWy',sortable:false},
				{name:'zybgdd',index:'zybgdd',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}							
			],
			height:'auto',
			autowidth:true,
			multiselect: true,
			caption: '自用资产（单位：元）',
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
			}
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
			{name:'fzqxmmc',index:'fzqxmmc',sortable:false},
			{name:'zqzlmc',index:'zqzlmc',sortable:false},
			{name:'zqmc',index:'zqmc',sortable:false},
			{name:'jhfhmc',index:'jhfhmc',sortable:false},
			{name:'dqr',index:'DQR',sortable:false},
			{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
					value:"${czfsJson}"
				},sortable:false
			}
		],
		rownumbers:true,
		autowidth:true,
		rowNum:0,
		height:'auto',
		caption:'债券',
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

