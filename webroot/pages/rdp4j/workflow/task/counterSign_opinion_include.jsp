<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.model.*"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%@ page language="java" import="java.text.*"%>
<%
if(isInCounterSign){
%>
	<tr>
		<td class="td_zxy01" norawp>最终意见：</td>
		<td class="td_zxy03">
<%
boolean isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	if(userType.equals("BMLD")){
		isDisplay = true;
%>
			<textarea name="finalContent"  rows="4" style="background-color:#ffffff;width: 94%;"></textarea>
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
				<tr height="20">
  					<td align="left" norawp>&nbsp;&nbsp;<%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr height="20">
  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
  				<tr height="20">
					<td bgcolor="#ffffff" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
	<tr>
		<td class="td_zxy01" norawp>过程意见：</td>
		<td class="td_zxy03">
<%
isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	isDisplay = true;
%>
			<textarea name="content"  rows="4" style="background-color:#ffffff;width: 94%;"></textarea>
<%
}
  			for(int i=0;i<gcOpinionVOList.size();i++){
  				isDisplay = true;
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)gcOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
				<tr height="20">
  					<td align="left" norawp>&nbsp;&nbsp;<%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr height="20">
  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
  				<tr height="20">
					<td bgcolor="#ffffff" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
	<tr>
		<td class="td_zxy01" norawp>退回意见：</td>
		<td class="td_zxy03">
<%
isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	if(userType.equals("ZH")||userType.equals("BMLD")){
		isDisplay = true;
%>
			<textarea name="sendBackContent"  rows="4" style="background-color:#ffffff;width: 94%;"></textarea>
<script type="text/javascript">
$(document).ready(function(){
	var buttonFileJSonString = '[{"buttonHandler":"addFileAss_huiqian","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss_huiqian","buttonIcon":"icon-remove","buttonText":"删除"}]';
	addButtons(jQuery("#gview_file_huiqianlist > .ui-jqgrid-titlebar"),buttonFileJSonString);
});
/**
	jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
	$(window).bind('resize', function(){
		jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
	});
	**/
</script>
<%
	}else{
		request.setAttribute("isDid","Y");//文件拖拽控制
	}
}else{
		request.setAttribute("isDid","Y");//文件拖拽控制
}
  			for(int i=0;i<snedBackCommonOpinionVOList.size();i++){
  				isDisplay = true;
  				ETCommonOpinionVO vo = (ETCommonOpinionVO)snedBackCommonOpinionVOList.get(i);
  				PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
  				PTUserBO user = vo.getUserBO();
%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
				<tr height="20">
  					<td align="left" norawp>&nbsp;&nbsp;<%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr height="20">
  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
  				<tr height="20">
					<td bgcolor="#ffffff" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
<%
}
%>
