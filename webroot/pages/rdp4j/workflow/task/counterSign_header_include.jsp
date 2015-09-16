<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
if(isInCounterSign){
%>
  	<input type="hidden" name="didUrl"/>
  	<input type="hidden" name="contentSetType"/>
  	<input type="hidden" name="contentType"/>
  	<input type="hidden" name="pdName"/>
  	<input type="hidden" name="nextTaskUrl"/>
  	<input type="hidden" name="newParticipantTaskUrl"/>
  	
  	<input type="hidden" name="users"/>
  	<input type="hidden" name="outCome"/>
  	<input type="hidden" name="taskId" value="<%=taskId%>"/>
  	<input type="hidden" name="counterSignId" value="<%=counterSign.getTid()%>"/>
  	<input type="hidden" name="assignParticipantId" value="<%=assignParticipant.getTid()%>"/>
	<div align="center">
		<br/>
		会签部门：<%=dept.getDeptName()%>&nbsp;&nbsp;&nbsp;&nbsp;
		当前环节：<%=taskName%>&nbsp;&nbsp;&nbsp;&nbsp;
		处理人：<%=assignName%>
	</div>
<%
}
%>