<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.rdp4j.workflow.task.action.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>

	var huiqian = '{"id":"huiqianid","buttonIcon":"icon-ok","buttonText":"会签","buttonMenuId":"mmhq"},' ;
	var banlidan = '{"buttonIcon":"icon-ok","buttonText":"办理单","buttonMenuId":"mmhq"},';
	var tijiao = '{"id":"submitWorkflowButton","buttonIcon":"icon-ok","buttonText":"提交","buttonMenuId":"mm1"},';
	var baocunDraft = '{"buttonHandler":"mainWindow.saveDraft","buttonIcon":"icon-save","buttonText":"保存"},';
	var baocunTodo = '{"buttonHandler":"mainWindow.saveTodo","buttonIcon":"icon-save","buttonText":"保存"},';
	var chuanyue = '{"buttonHandler":"mainWindow.circulation","buttonIcon":"icon-edit","buttonText":"传阅"},';
	var directChuanyue = '{"buttonHandler":"mainWindow.directCirculation","buttonIcon":"icon-edit","buttonText":"传阅"},';
	var shouhui = '{"buttonHandler":"mainWindow.backto","buttonIcon":"icon-edit","buttonText":"收回"},';
  	var openhuiqian = '<div onClick="mainWindow.choiceDept()">开启会签</div>';
<%
	if(counterSignBtnDisplay){
%>
		$.ajaxSetup({async : false }); 
		$.post("<%=basePath %>countersign/countersign_findCounter.do?",{
				"headId": "<%=headId%>"
			},function(data){
				if(data.trim() == "success"){
					huiqian = '{"buttonIcon":"icon-ok","buttonText":"会签","buttonMenuId":"mmhq"},' ;
					openhuiqian = '<div onClick="mainWindow.choiceDept()">新增会签</div>';
					banlidan = '';
					tijiao = '';
					baocunDraft = '';
					baocunTodo = '';
					shouhui = '';
					if('checkIfCounter' in window){
						if(checkIfCounter instanceof Function){
							if(!checkIfCounter()){
								return;
							}
						}
					}
				}
		});	
		$.ajaxSetup({async : true }); 
<%
	}
%>

<%
	if(isInWorkflow){
	boolean isFirst = true;
%>

		var buutonStr = 
<%
		if(workflowVO.step.equals("draft")||workflowVO.step.equals("todo")){
%>
<%
			if(counterSignBtnDisplay && workflowVO.step.equals("todo")){
				if(status.equals("2") || status.equals("99999")||(statusjysy.equals("2")&&workflowVO.taskName.equals("建银实业综合处理"))){
%>

				huiqian +
<% 
				}
			}
			if(pgscCounterSignBtnDisplay && workflowVO.step.equals("todo")){
%>
				banlidan +
<% 
			}
%>
				<%if(!(workflowVO.outComes.size()==1 && 
					StringUtils.indexOfAny(workflowVO.outComes.iterator().next(),
					new String[]{"生成台账","流程办结","整理会议纪要结束","提交意见触发会议纪要整理"})!=-1)){ %>
					tijiao + 
				<% }%>
<%
			if(saveBtnDisplay){
				if(workflowVO.step.equals("draft")){
%>
					baocunDraft + 
<%
				}else{
%>
					baocunTodo +
<%				}
			}
			if(chuanyueBtnDisplay){
 
%>
 
				chuanyue +
<%
			}
		}
		if(workflowVO.step.equals("did")){
 
%>
 
			directChuanyue +
<%		
			if(workflowVO.isCanBackto()){
 
%>
 
			shouhui +
<%
			}
		}
		if(workflowVO.step.equals("end")){
 
%>
 
			directChuanyue +
<%
		}
%>
		'';
		
		if(buutonStr!=null && buutonStr.length > 0){
			buutonStr = buutonStr.substring(0, buutonStr.lastIndexOf(","));
		}
		var parentButtonStr = 	'[' +  buutonStr +	']';
		
		var menuStr = 
<%
		if(workflowVO.step.equals("draft")||workflowVO.step.equals("todo")){
%>
<%
			if(counterSignBtnDisplay && workflowVO.step.equals("todo")){
%>
				'<div id="mmhq" style="width:150px;">' + 
					openhuiqian + 
					'<div onClick="mainWindow.selectMeeting()">会签查询</div>' +
				'</div>' +
<%
			}
%>
<%
			if(pgscCounterSignBtnDisplay && workflowVO.step.equals("todo")){
%>
				'<div id="mmhq" style="width:150px;">' + 
					'<div onClick="mainWindow.choiceCLR()">开启办理单</div>' + 
					'<div onClick="mainWindow.selectMeeting()">办理单查询</div>' +
				'</div>' +
<%
			}
%>
			'<div id="mm1" style="width:150px;">' + 
				<%	
					boolean first = true;
					for(String outCome : workflowVO.outComes){
						if(workflowVO.step.equals("draft")){
							if(outCome.equals("作废")||outCome.equals("流程办结")){continue;}
				%>
							'<div onClick="mainWindow.commitDraft(&quot;<%=workflowVO.pdk%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></div>' +
				<%		}else{
							if(outCome.equals("生成台账")||
									outCome.equals("流程办结")||
									outCome.equals("整理会议纪要结束")||
									outCome.equals("提交意见触发会议纪要整理"))
							{
								continue;
							}
				%>
							'<div onClick="mainWindow.commit(&quot;<%=workflowVO.taskId%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></div>' +
						<%}
					}
				%>
			'</div>';
<%
		}
		else{
%>
			'';
<%
		}
%>
		if(window.parent.addButtonsFromChildren != undefined)
		window.parent.addButtonsFromChildren(parentButtonStr,menuStr);
<%
	}
%>
<%@ include file="/pages/rdp4j/workflow/task/counterSign_button_include.jsp"%>