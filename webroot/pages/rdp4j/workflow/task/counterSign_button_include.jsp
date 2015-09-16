<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.rdp4j.workflow.task.action.*" %>
<%
if(isInCounterSign){
	if(isDid==null||!(isDid.equals("yes"))){
%>
		window.parent.clearPanelTool();
		var parentButtonStr = 
			'[{"buttonIcon":"icon-ok","buttonText":"提交","buttonMenuId":"mm1"}' +
			',{"buttonHandler":"mainWindow.choiceUser","buttonIcon":"icon-edit","buttonText":"添加会签人员"}' +
			',{"buttonHandler":"mainWindow.counterSignUserList","buttonIcon":"icon-edit","buttonText":"会签人员列表"}' +
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
				'<div onClick="mainWindow.commitJBGCContent();">过程意见</div>' +
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
}
%>