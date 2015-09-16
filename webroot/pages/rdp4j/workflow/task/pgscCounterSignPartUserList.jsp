<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.model.*"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	List participantVOList = (List)request.getAttribute("participantVOList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评估审查办理单</title>
<script>
</script>
  </head>
  
  <body>
<table class="newtable" cellspacing=1 cellpadding=1 width="100%" border=1>
  	<tr>
  		<th class="td_zxy01" colspan="3">办理中</th>
  	</tr>
	<tr>
		<th class="td_zxy01" width="30%">办理人员</th>
		<th class="td_zxy01" width="30%">分派人员</th>
		<th class="td_zxy01" width="40%">加签时间</th>
	</tr>
	<%
	for(int i=0;i<participantVOList.size();i++){
		ETCounterSignParticipantVO participantVO
			= (ETCounterSignParticipantVO)participantVOList.get(i);
		ETCounterSignParticipantBO participantBO = participantVO.getParticipantBO();
		PTUserBO userBO = participantVO.getUserBO();
		PTUserBO assignBO = participantVO.getAssignBO();
	%>
	<tr>
		<td class="td_zxy01" width="30%"><%=userBO.getUsername()%></td>
		<td class="td_zxy01" width="30%"><%=assignBO.getUsername()==null?"":assignBO.getUsername()%>&nbsp;</td>
		<td class="td_zxy01" width="40%"><%=participantBO.getTime()%></td>
	</tr>	
<%
	}
%>
	<tr>
  		<td class="td_zxy01" colspan="3">
			<input type="button" value="确定" onclick="window.close()"/>
  		</td>
  	</tr>
</table>
</body>
</html>
