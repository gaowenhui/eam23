<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.rdp4j.common.model.orm.bo.*" %>
<%
if(isInWorkflow){
%>
<input type="hidden" name="id" value="<%=id%>"/>
<input type="hidden" name="taskId" value="<%=workflowVO.taskId%>">
<input type="hidden" name="taskName" value="<%=workflowVO.taskName%>" />
<input type="hidden" name="draftId" value="<%=draft.getId()%>"/>
<input type="hidden" name="url"/>
<input type="hidden" name="outCome">
<input type="hidden" name="assignId">
<input type="hidden" name="param"/>
<input type="hidden" name="result"/>
<input type="hidden" name="todoUrl"/>
<input type="hidden" name="sheetId"/>
<input type="hidden" name="nextTodoUrl"/>
<input type="hidden" name="didUrl"/>
<input type="hidden" name="pdk" id="pdk" value="<%=workflowVO.pdk%>"/>
<input type="hidden" name="piId" id="piId" value="<%=workflowVO.piId%>"/>
<input type="hidden" name="bizPiId" value="<%=workflowVO.piId%>"/>
<input type="hidden" name="step" value="<%=workflowVO.step%>"/>
<input type="hidden" name="dept_user"/>
<%
	if(workflowVO.step.equals("draft")){
%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%">
	<tr>
		<td>
			<br>
			<div align="center">
				<br />
				当前环节：<%=workflowVO.taskName%>&nbsp;&nbsp;&nbsp;&nbsp;
				<a target="_blank" href="<%=request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_taskHisGraph.do?pdk="%><%=workflowVO.getPdk()%>">流程跟踪</a>
			</div>
		</td>
	</tr>
</table>
<%
	}else{
%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%">
	<tr>
		<td>
			<br>
			<div align="center">
				<br />
				当前环节：<%=workflowVO.taskName%>&nbsp;&nbsp;&nbsp;&nbsp;
				处理人：<%=workflowVO.getAssign().getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<a target="_blank" href="<%=request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_taskHisGraph.do?piId="%><%=workflowVO.getPiId()%>&pdk=<%=workflowVO.getPdk()%>">流程跟踪</a>
			</div>
		</td>
	</tr>
</table>
<%
	}
}
%>
<%@ include file="/pages/rdp4j/workflow/task/counterSign_header_include.jsp"%>