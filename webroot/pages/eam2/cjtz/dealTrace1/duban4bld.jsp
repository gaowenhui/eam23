<%@page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = (String)request.getAttribute("headId");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== 
<r:controlfile file="/pages/eam2/cjtz/dealTrace1/duban4bld.ctl.xml"></r:controlfile>
 ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>督办</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "cjtzWorkflow";
	actionPath = "cjtz_duban_Workflow";
%>
<script>
	function commitWorkflow(taskId,outCome){
		<%
			if(workflowVO.taskName.equals("办理部门综合处理")){
		%>
				if(outCome=="秘书处综合处理"){
					document.getElementById("commitNextTodoUrl").value = "cjtzWorkflow/cjtz_duban_Workflow_blbmzhclTodo.do";
					document.myform.result.value = 'msczhclCommit';
					document.myform.action = "<%=request.getContextPath()%>/cjtz/supervision_saveHead.do";
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
		<SCRIPT language=JavaScript type=text/JavaScript>
$(document).ready(function(){
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>

		jQuery("#file_list").setGridWidth($("#table").width());
		jQuery("#blyj_reason_list").setGridWidth($("#table").width());
		jQuery("#purchaselist").setGridWidth($("#table").width());
		jQuery("#file_huiqianlist").setGridWidth($("#table").width());
	    $(window).bind('resize', function(){
			jQuery("#file_huiqianlist").setGridWidth($("#table").width());
			jQuery("#file_list").setGridWidth($("#table").width());
			jQuery("#blyj_reason_list").setGridWidth($("#table").width());
			jQuery("#purchaselist").setGridWidth($("#table").width());
       });
       });
</SCRIPT>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden name="datas2" />
<s:form id="myform" name="myform" action="">
<s:hidden name="xmlx" />
<s:hidden name="head.id"/>
<s:hidden name="headId" id="headId" value="%{#request.head.id}"></s:hidden>
<s:hidden name="head.lcmc" id="lcmc"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/cjtz/supervision2_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/cjtz/supervision2_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/cjtz/supervision2_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/cjtz/supervision2_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "blbmzhclDid.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="cjtz/supervision2_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  /> 
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="cjtz/supervision2_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
	        <br/>
				<div align="center">
					<span class="STYLE7 STYLE1">中国建银投资有限责任公司投资方案执行情况督办办理单</span>
				</div>
				<br/>
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
				<table width="100%" id="table" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_zxy01" >
							<font color="#FF0000"><strong>*</strong></font>标 题：
						</td>
						<td class="td_form02" colspan="3">
							<r:textfield name="head.biaoti" id="biaoti" size="30"  cssClass="input" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">办理部门：</td>
						<td class="td_zxy02" colspan="3">
							<s:hidden id="blbmbh" name="head.hqbmid"/>
							<r:textfield id="blbm" name="head.hqbm" cssClass="input2" readonly="true"/>
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							编号：
						</td>
						<td class="td_form02">
							<s:textfield name="head.bianhao" id="bh" size="30" cssClass="input"  disabled="true"/>
						</td>
						<td class="td_zxy01" >
							急缓程度：
						</td>
						<td class="td_form02">
							<r:select name="head.jhcd" list="#{0:'一般',1:'急',2:'特急'}" id="jhcd" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							拟稿人：
						</td>
						<td class="td_form02">
							<s:textfield name="head.nigaorenxm" id="nigaorenxm"  disabled="true" cssClass="input"  />
							<s:hidden name="head.nigaoren" />
						</td>
						<td class="td_zxy01">
							<font color="#FF0000"><strong>*</strong></font>联系电话：
						</td>
						<td class="td_form02">
							<r:textfield name="head.lxdh" id="lxdh" size="30"  cssClass="input" onblur="checkPhone(this)"/>
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							拟稿日期：
						</td>
						<td class="td_form02">
							<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
        					<s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" disabled="true" />
						</td>
						<td class="td_zxy01">
							拟稿部门：
						</td>
						<td class="td_zxy02">
							<s:textfield name="head.ngbmmc" id="ngbmmc" cssClass="input" disabled="true" />
							<s:hidden name="head.ngbm"/>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right">
							<table id="purchaselist"> </table>
							<div id="pgtoolbar1"> </div>
						</td>
					</tr>
				</table>
				<!-- ------------------------------- 办理依据 --------------------------------- -->
				<%@ include file="/inc/according.inc"%>  
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<e:opinion id="test2" width="100%">		
			       <!--  <e:opinionPart id="BLYJ_ZZYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_ZZYJ" value="" text="最终意见："></e:opinionPart>
					<e:opinionPart id="BLYJ_GCYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_GCYJ" value="" text="过程意见："></e:opinionPart>
					<e:opinionPart id="BLYJ_THYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_THYJ" value="" text="沟通意见："></e:opinionPart>
					 -->
					 <e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="办理部门意见："></e:opinionPart>
	<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
					</e:opinion>
			   	</table>
			   	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="newtable" > 
					<tr>
						<td class="td_zxy01">备注：</td>
						<td class="td_zxy03" colspan="5">
							<r:textarea name="head.beizhu" id="beizhu" style="width:94%" rows="4" />
						</td>
					</tr>
				</table>
				<!-- ------------------------------- 文件上传 --------------------------------- -->
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>	
	<%@ include file="/inc/listMessage.inc"%>				
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:'<%=basePath%>zccz/dealTrace1Head_findCzXmByCldId.do?headId=${head.id}',
	datatype: "json",
	mtype:"POST",
   	colNames: ['xmId','编号', '处置项目名称','业务类型','拟稿部门', '拟稿人', 
   	'项目状态','会议纪要签发日期','最新更新日期'],
	colModel: [
		{name: 'xmId',index: 'xmId',align: "center",hidden:true}, 
		{name: 'bh',index: 'bh',align: "center"}, 
		{name: 'czxmmc',index: 'czxmmc',align: "center"}, 
		{name: 'ywlx',index: 'ywlx',align: "center"}, 
		{name: 'ngbmmc',index: 'ngbm',align: "center"}, 
		{name: 'ngrmc',index: 'ngrmc',align: "center"}, 
		{name: 'xmzt',index: 'xmzt',align: "center"}, 
		{name: 'hyjyqfrq',index: 'hyjyqfrq',align: "center"}, 
		{name: 'zxgxrq',index: 'zxgxrq',align: "center"}
		],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '结案项目列表（单位：元）',
	editurl: '<%=basePath%>zccz/dealTrace1Head_editCzXm.do?headId=${headId}',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#purchaselist").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#purchaselist").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
</script>
