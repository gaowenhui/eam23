<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam.verifyright.model.*"%>
<%@ page language="java" import="com.tansun.eam.verifyright.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%
	List unfinishedList = (List)request.getAttribute("unfinishedList");
	List lastCommonOpinionVOList = (List)request.getAttribute("lastCommonOpinionVOList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会签办理单</title>
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.multiselect.css" />
<link rel="stylesheet" type="text/css" href="../JQuery/themes/easyui.css"/>
<link rel="stylesheet" type="text/css" href="../JQuery/themes/icon.css"/>
<script type="text/javascript" src="../js/openWin.js"></script>
<script src="../JQuery/js/jquery.js" type="text/javascript"></script>
<script src="../JQuery/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../JQuery/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="../JQuery/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/oper_table.js"></script>
<script type="text/javascript" src="../js/custom/tools.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/win_center.js"></script>
<script type= "text/javascript" src= "../js/tab.js"> </script>
<script language="JavaScript" type="text/javascript" src="../js/tree-card.js"></script>
<script language="JavaScript" type="text/javascript"  src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
<link href="<%=path %>/resource/css/maincss.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
  	<tr>
  		<td colspan="4" width="20%">最终意见</td>
  		<td>
  		<%
  			for(int i=0;i<lastCommonOpinionVOList.size();i++){
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)lastCommonOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
  				PTDeptBO dept = vo.getPTDeptBO();
  		%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
  				<tr>
  					<td colspan="2"><%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr>
  					<td width="80%">&nbsp;</td>
  					<td>
  						<table class='tabletitle' cellspacing=0 cellpadding=0>
  							<tr>
  								<td><%=dept.getDeptName()%></td>
  								<td><%=user.getUsername()%></td>
  							</tr>
  							<tr><td colspan="2"><br/><%=commonOpinionBO.getTjrq()%></td></tr>
  						</table>
  					</td>
  				</tr>
  			</table><br/><br/>
  		<%
  			}
		%>
  		</td>
  	</tr>
</table>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
  	<tr>
  		<th colspan="4">会签中</th>
  	</tr>
	<tr>
		<th>部门</th>
		<th>加签时间</th>
	</tr>
	<%
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
</table>
</body>
</html>
