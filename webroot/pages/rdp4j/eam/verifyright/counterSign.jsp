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
	String isDid = (String)request.getAttribute("isDid");
	PTDeptBO dept = (PTDeptBO)request.getAttribute("dept");
	//String zhName = (String)request.getAttribute("zhName");
	String taskId = (String)request.getAttribute("taskId");
	String taskName = (String)request.getAttribute("taskName");
	String assignName = (String)request.getAttribute("assignName");
	List participantVOList = (List)request.getAttribute("participantVOList");
	ETCounterSignBO counterSign = (ETCounterSignBO)request.getAttribute("counterSign");
	ETCounterSignParticipantBO assignParticipant = (ETCounterSignParticipantBO)request.getAttribute("assignParticipant");
	List gcOpinionVOList = (List)request.getAttribute("gcOpinionVOList");
	List snedBackCommonOpinionVOList = (List)request.getAttribute("snedBackCommonOpinionVOList");
	List finalCommonOpinionVOList = (List)request.getAttribute("finalCommonOpinionVOList");
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
<script>
	function choiceUser(){
		var result = window.showModalDialog("<%=request.getContextPath()%>/countersign/countersign_getParticipants.do?counterSignId=<%=counterSign.getTid()%>&deptId=<%=dept.getTid()%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.myForm.users.value = result;
			document.myForm.pdName.value = "会签流程";
			document.myForm.outCome.value = "加签";
			document.myForm.nextTaskUrl.value = "countersign/countersign_todo.do";
			document.myForm.newParticipantTaskUrl.value = "countersign/countersign_todo.do";
			document.myForm.action = "<%=request.getContextPath()%>/countersign/countersign_addCounterSignParticipants.do";
			document.myForm.submit();
		}
	}
	function commitZHGCContent(){
		if(confirm("确定要提交过程意见？")){
			document.myForm.outCome.value = "综合过程意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.myForm.didUrl.value = "countersign/countersign_toDid.do";
			document.myForm.nextTaskUrl.value = "countersign/countersign_todo.do";
			document.myForm.action = "<%=request.getContextPath()%>/countersign/countersign_commitZHGCContent.do";
			document.myForm.submit();
		}
	}
	function commitLDGCContent(){
		if(confirm("确定要提交过程意见？")){
			document.myForm.outCome.value = "领导过程意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.myForm.didUrl.value = "countersign/countersign_toDid.do";
			document.myForm.nextTaskUrl.value = "countersign/countersign_todo.do";
			document.myForm.action = "<%=request.getContextPath()%>/countersign/countersign_commitZHGCContent.do";
			document.myForm.submit();
		}
	}
	function commitJBGCContent(){
		if(confirm("确定要提交过程意见？")){
			document.myForm.outCome.value = "经办过程意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.myForm.didUrl.value = "countersign/countersign_toDid.do";
			document.myForm.action = "<%=request.getContextPath()%>/countersign/countersign_commitJBGCContent.do";
			document.myForm.submit();
		}
	}
	function commitSendBackContent(){
		if(confirm("确定要提交退回意见？")){
			document.myForm.outCome.value = "退回";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQTH%>";
			document.myForm.contentType.value = "<%=CommonGlobal.OPINION_YJLX_BACK%>";
			document.myForm.didUrl.value = "countersign/countersign_toDid.do";
			document.myForm.action = "<%=request.getContextPath()%>/countersign/countersign_commitSendBackContent.do";
			document.myForm.submit();
		}
	}
	function commitFinalContent(){
		if(confirm("确定要提交最终意见？")){
			document.myForm.outCome.value = "最终意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQZZ%>";
			document.myForm.contentType.value = "<%=CommonGlobal.OPINION_YJLX_NOIDEAR%>";
			document.myForm.didUrl.value = "countersign/countersign_toDid.do";
			document.myForm.action = "<%=request.getContextPath()%>/countersign/countersign_commitFinalContent.do";
			document.myForm.submit();
		}
	}
</script>
  </head>
  
  <body>
  	<form name="myForm" method="post">
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
	<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%">
	<tr>
		<td colspan="2">
			<br/>
			<br/>
			<div align="center">
				<span class="STYLE7 STYLE1">会签办理单</span>
			</div>
			<br/>
			<div align="center">
				<br />
				会签部门：<%=dept.getDeptName()%>&nbsp;&nbsp;&nbsp;&nbsp;
				任务编号：<%=taskId%>&nbsp;&nbsp;&nbsp;&nbsp;
				当前环节：<%=taskName%>&nbsp;&nbsp;&nbsp;&nbsp;
				处理人：<%=assignName%>
			</div>
			<hr color="#6600CC" align="center" width="100%"/>
		</td>
	</tr>
</table>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
  	<tr>
  		<td colspan="4" width="20%">过程意见</td>
  		<td>
  		<%
  			for(int i=0;i<gcOpinionVOList.size();i++){
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)gcOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
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
<%
if(isDid.equals("yes")){
%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
  	<tr>
  		<td colspan="4" width="20%">退回意见</td>
  		<td>
  		<%
  			for(int i=0;i<snedBackCommonOpinionVOList.size();i++){
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)snedBackCommonOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
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
  		<td colspan="4" width="20%">最终意见</td>
  		<td>
  		<%
  			for(int i=0;i<finalCommonOpinionVOList.size();i++){
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)finalCommonOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
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
<%}%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
  	<tr>
  		<th colspan="4">会签中</th>
  	</tr>
	<tr>
		<th>会签人员</th>
		<th>加签人</th>
		<th>加签时间</th>
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
		<td><%=userBO.getUsername()%></td>
		<td><%=assignBO.getUsername()%></td>
		<td><%=participantBO.getTime()%></td>
	</tr>	
	<%
	}
	if(isDid==null||!(isDid.equals("yes"))){
	%>
	<tr>
		<td align="center" colspan="4">
			<input type="button" value="加签" onclick="choiceUser()"/>
		</td>
	</tr>
	<%}%>
</table>
<%
if(isDid==null||!(isDid.equals("yes"))){
%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th colspan="2">退回意见</th>
	</tr>
	<tr>
		<td>意见</td>
		<td><textarea name="sendBackContent" cols="150" rows="4" style="background-color:#ffffff"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="退回" onclick="commitSendBackContent()"/></td>
	</tr>
</table>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th colspan="2">过程意见</th>
	</tr>
	<tr>
		<td>意见</td>
		<td><textarea name="content" cols="150" rows="4" style="background-color:#ffffff"></textarea></td>
	</tr>
</table>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th colspan="2">过程附件</th>
	</tr>
	<tr>
		<th>名称</th>
		<th>路径</th>
	</tr>
	<tr>
		<td><input/></td>
		<td><input name="" type="file"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="综合提交" onclick="commitZHGCContent()"/>
			<input type="button" value="经办提交" onclick="commitJBGCContent()"/>
			<input type="button" value="领导提交" onclick="commitLDGCContent()"/>
		</td>
	</tr>
</table>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th colspan="2">最终意见</th>
	</tr>
	<tr>
		<td>意见</td>
		<td><textarea name="finalContent" cols="150" rows="4" style="background-color:#ffffff"></textarea></td>
	</tr>
</table>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th colspan="2">最终附件</th>
	</tr>
	<tr>
		<th>名称</th>
		<th>路径</th>
	</tr>
	<tr>
		<td><input/></td>
		<td><input name="" type="file"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="提交" onclick="commitFinalContent()"/></td>
	</tr>
</table>
<%}%>
</form>
</body>
</html>
