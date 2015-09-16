<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.model.*"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%@ page language="java" import="java.text.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String isDid = (String)request.getAttribute("isDid");
	PTDeptBO dept = (PTDeptBO)request.getAttribute("dept");
	String taskId = (String)request.getAttribute("taskId");
	String taskName = (String)request.getAttribute("taskName");
	String assignName = (String)request.getAttribute("assignName");
	List participantVOList = (List)request.getAttribute("participantVOList");
	ETCounterSignBO counterSign = (ETCounterSignBO)request.getAttribute("counterSign");
	ETCounterSignParticipantBO assignParticipant = (ETCounterSignParticipantBO)request.getAttribute("assignParticipant");
	List gcOpinionVOList = (List)request.getAttribute("gcOpinionVOList");
	if(gcOpinionVOList==null){gcOpinionVOList=new ArrayList();}
	List snedBackCommonOpinionVOList = (List)request.getAttribute("snedBackCommonOpinionVOList");
	if(snedBackCommonOpinionVOList==null){snedBackCommonOpinionVOList=new ArrayList();}
	List finalCommonOpinionVOList = (List)request.getAttribute("finalCommonOpinionVOList");
	if(finalCommonOpinionVOList==null){finalCommonOpinionVOList=new ArrayList();}
	List<PTRoleBO> roleList = assignParticipant.getRoleList();
	String userType = "";
	for(PTRoleBO role:roleList){
		if(role.getTid()==(long)126){
			userType = "ZH";
			break;
		}
		else if(role.getTid()==(long)96){
			userType = "BMLD";
			break;
		}
	}
	if(userType.equals("")){
		userType = "JBR";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会签办理单</title>
<script>
	$(function(){
		window.parent.clearPanelTool();
<%
	if(isDid==null||!(isDid.equals("yes"))){
%>
		var parentButtonStr = 
			'[{"buttonIcon":"icon-ok","buttonText":"提交","buttonMenuId":"mm1"}' +
			',{"buttonHandler":"mainWindow.choiceUser","buttonIcon":"icon-edit","buttonText":"添加办理人员"}' +
			',{"buttonHandler":"mainWindow.counterSignUserList","buttonIcon":"icon-edit","buttonText":"办理人员列表"}' +
		']';
		var menuStr = 
			'<div id="mm1" style="width:150px;">' +
<%
				if(userType.equals("ZH")){
%>
				'<div onClick="mainWindow.commitZHGCContent();">过程意见</div>' +
<%
				}if(userType.equals("BMLD")){
%>
				'<div onClick="mainWindow.commitLDGCContent();">过程意见</div>' +
<%
				}if(userType.equals("JBR")||userType.equals("ZZ")){
%>
				'<div onClick="mainWindow.commitJBGCContent();">过程意见</div>' +
<%
				}if(userType.equals("ZH")||userType.equals("BMLD")){
%>
				'<div onClick="mainWindow.commitSendBackContent();">退回</div>' +
<%
				}if(userType.equals("BMLD")){
%>
				'<div onClick="mainWindow.commitFinalContent();">最终意见</div>' +
<%
				}
%>
			'</div>';
		window.parent.addButtonsFromChildren(parentButtonStr,menuStr);
<%
	}
%>
	});
	function counterSignUserList(){
		window.showModalDialog("<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_findCSPartUserList.do?taskId=<%=taskId%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
	}
	function choiceUser(){
		var result = window.showModalDialog("<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_getParticipants.do?counterSignId=<%=counterSign.getTid()%>&deptId=<%=dept.getTid()%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.myForm.users.value = result;
			document.myForm.pdName.value = "pgscCountersign";
			document.myForm.outCome.value = "加签";
			document.myForm.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.myForm.nextTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.myForm.newParticipantTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.myForm.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_addCounterSignParticipants.do";
			document.myForm.submit();
		}
	}
	function commitZHGCContent(){
		if(confirm("确定要提交过程意见？")){
			document.myForm.outCome.value = "综合过程意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.myForm.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.myForm.nextTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.myForm.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitZHGCContent.do";
			document.myForm.submit();
		}
	}
	function commitLDGCContent(){
		if(confirm("确定要提交过程意见？")){
			document.myForm.outCome.value = "领导过程意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.myForm.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.myForm.nextTaskUrl.value = "pgscCountersign/pgscCountersign_todo.do";
			document.myForm.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitZHGCContent.do";
			document.myForm.submit();
		}
	}
	function commitJBGCContent(){
		if(confirm("确定要提交过程意见？")){
			document.myForm.outCome.value = "经办过程意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.myForm.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.myForm.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitJBGCContent.do";
			document.myForm.submit();
		}
	}
	function commitSendBackContent(){
		if(document.myForm.sendBackContent.value==''){
			alert('请填写退回意见！');
			document.myForm.sendBackContent.focus();
			return;
		}
		if(confirm("确定要提交退回意见？")){
			document.myForm.outCome.value = "退回";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_CHECK%>";
			document.myForm.contentType.value = "<%=CommonGlobal.OPINION_YJLX_BACK%>";
			document.myForm.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.myForm.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitSendBackContent.do";
			document.myForm.submit();
		}
	}
	function commitFinalContent(){
		if(document.myForm.finalContent.value==''){
			alert('请填写最终意见！');
			document.myForm.finalContent.focus();
			return;
		}
		if(confirm("确定要提交最终意见？")){
			document.myForm.outCome.value = "最终意见";
			document.myForm.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_CHECK%>";
			document.myForm.contentType.value = "<%=CommonGlobal.OPINION_YJLX_FINAL%>";
			document.myForm.didUrl.value = "pgscCountersign/pgscCountersign_toDid.do";
			document.myForm.action = "<%=request.getContextPath()%>/pgscCountersign/pgscCountersign_commitFinalContent.do";
			copyFile2Form();			
			document.myForm.submit();
		}
	}
</script>
  </head>
  
  <body>
  	<form name="myForm" method="post">
  	<input type="hidden" name="headId" value="<%=counterSign.getHeadId()%>"/>
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
	<table class="newtable" cellspacing=1 cellpadding=1 width="100%">
	<tr>
		<td colspan="2">
			<br/>
			<br/>
			<div align="center">
				<span class="STYLE7 STYLE1">中国建银投资有限责任公司资产处置评估审查处理单</span>
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
<iframe id="ifr" name="ifr" width="100%" height="500" src="<%=counterSign.getUrl()%>"></iframe>
<table class="newtable" cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th class="td_zxy01" norawp>最终意见：</th>
		<td class="td_zxy03">
<%
boolean isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	if(userType.equals("BMLD")){
		isDisplay = true;
%>
			<textarea name="finalContent" cols="150" rows="4" style="background-color:#ffffff"></textarea>
<%
	}
}
  			for(int i=0;i<finalCommonOpinionVOList.size();i++){
  				isDisplay = true;
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)finalCommonOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
  				<tr>
  					<td colspan="2" norawp><%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr>
  					<td width="70%">&nbsp;</td>
  					<td>
  						<table class='tabletitle' cellspacing=0 cellpadding=0>
  							<tr>
  								<td norawp><%=dept.getDeptName()%></td>
  								<td norawp><%=user.getUsername()%></td>
  							</tr>
  							<tr><td colspan="2" norawp><br/><%=sf.format(commonOpinionBO.getTjrq())%></td></tr>
  						</table>
  					</td>
  				</tr>
  			</table><br/><br/>
<%
  			}
if(!isDisplay){
%>
			<br/><br/><br/><br/><br/><br/>
<%
}
%>
		</td>
	</tr>
</table>
<table class="newtable" cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th class="td_zxy01" norawp>过程意见：</th>
		<td class="td_zxy03">
<%
isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	isDisplay = true;
%>
			<textarea name="content" cols="150" rows="4" style="background-color:#ffffff"></textarea>
<%
}
  			for(int i=0;i<gcOpinionVOList.size();i++){
  				isDisplay = true;
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)gcOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
%>
  			<table cellspacing=0 cellpadding=0 width="100%">
  				<tr>
  					<td colspan="2" norawp><%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr>
  					<td width="70%">&nbsp;</td>
  					<td>
  						<table cellspacing=0 cellpadding=0>
  							<tr>
  								<td norawp><%=dept.getDeptName()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  								<td norawp><%=user.getUsername()%></td>
  							</tr>
  							<tr><td colspan="2" norawp><br/><%=sf.format(commonOpinionBO.getTjrq())%></td></tr>
  						</table>
  					</td>
  				</tr>
  			</table><br/><br/>
<%
			}
if(!isDisplay){
%>
			<br/><br/><br/><br/><br/><br/>
<%
}
%>
		</td>
	</tr>
</table>
<table class="newtable" cellspacing=1 cellpadding=1 width="100%" border=1>
	<tr>
		<th class="td_zxy01" norawp>退回意见：</th>
		<td class="td_zxy03">
<%
isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	if(userType.equals("ZH")||userType.equals("BMLD")){
		isDisplay = true;
%>
			<textarea name="sendBackContent" cols="150" rows="4" style="background-color:#ffffff"></textarea>
<%
	}
}
  			for(int i=0;i<snedBackCommonOpinionVOList.size();i++){
  				isDisplay = true;
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)snedBackCommonOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
  				<tr>
  					<td colspan="2" norawp><%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr>
  					<td width="70%">&nbsp;</td>
  					<td>
  						<table class='tabletitle' cellspacing=0 cellpadding=0>
  							<tr>
  								<td norawp><%=dept.getDeptName()%></td>
  								<td norawp><%=user.getUsername()%></td>
  							</tr>
  							<tr><td colspan="2" norawp><br/><%=sf.format(commonOpinionBO.getTjrq())%></td></tr>
  						</table>
  					</td>
  				</tr>
  			</table><br/><br/>
<%
  			}
if(!isDisplay){
%>
  			<br/><br/><br/><br/><br/><br/>
<%
}
%>
		</td>
	</tr>
</table>
<script type="text/javascript">
$(document).ready(function(){
	var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
				{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
	addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
});
	jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	$(window).bind('resize', function(){
		jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	});
	
function copyFile2Form(){
	var gr = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
	if(gr==""){
		//alert("请选择正式附件!");
	}else if(confirm('确定将过程附件转换为正式表单的附件?')){
		var fileurl="/eam2/file/file_copyFile2Form.do?zzid=<%=counterSign.getHeadId()%>&ids="+gr;
		$.post(fileurl,{}, function(data){
			jQuery("#file_list").trigger("reloadGrid");
			//alert("转换成功！");
		});
	}
}
function zhuanhuan(){
	copyFile2Form();
}
function clearPanelTool(){
	//iframe 页面调用 window.parent.clearPanelTool();
	//无此方法会报js错误
}
</script>
<s:set name="biaodanid"  scope="request"><%=counterSign.getTid()%></s:set>
<s:set name="type"  scope="request">huiqian</s:set>
<%@ include file="/inc/file_huiqian.inc"%>
<!-- input type="button" onclick="zhuanhuan()" value="测试转为最终附件" / -->
</form>
</body>
</html>