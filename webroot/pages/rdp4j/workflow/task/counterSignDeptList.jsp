<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.model.*"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<!-- <table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=0> 
	<%
	List unfinishedList = (List)request.getAttribute("unfinishedList");
	if(unfinishedList==null){
		unfinishedList = new ArrayList();
	}
	for(int i=0;i<unfinishedList.size();i++){
		UnfinishedCounterSignVO vo
			= (UnfinishedCounterSignVO)unfinishedList.get(i);
		ETCounterSignBO eTCounterSignBO = vo.getETCounterSignBO();
		PTDeptBO pTDeptBO = vo.getPTDeptBO();
	%>
	<tr>
		<td><%=pTDeptBO.getDeptName()%></td>
		<td><%=eTCounterSignBO.getCreatTime()%></td>
	</tr>
	<%}%>

</table>-->

