<%@page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.history.HistoryTask"%>
<%@ page language="java" import="org.jbpm.api.task.*"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="java.util.*"%>
<%@ include file="/inc_eam2/header-jquery.inc"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/rdp4j-tags" prefix="r"%>
<%
	String userName = (String) request.getAttribute("userName");
	Task task = (Task) request.getAttribute("task");
	Set outComes = (Set) request.getAttribute("outComes");
	HashMap contents = (HashMap) request.getAttribute("contents");
	if (contents == null) {
		contents = new HashMap();
	}
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>日常管理审批单</title>
		
<!-- 流程相关的按钮显示 -->		
		<script type="text/javascript">
	window.onload=function(){
	var menu2 = [
		{'txt':"<input type='button' class='button1' value='提交'>", "position": "down", "menu": [
		<%
    		String outCome="";
    		Iterator it = outComes.iterator();
    		while(it.hasNext()){
    			outCome = (String)it.next();
    			if(outCome.equals("提交办理单")){
    	%>
  {'txt': '<a href="javascript:choiceUser(&quot;<%=request.getParameter("taskId")%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></a>'}  	
    	<%
    			}else{
    	%>
{'txt': '<a href="javascript:choiceUser(&quot;<%=request.getParameter("taskId")%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></a>'},
    	<%
    			}
    		}
    	%>
    	{'txt': ''}
		]}
	];
	var container2=["idMenu2"];
	var cs2 = new CascadeMenu(container2, menu2, { Delay: 200, onClass: "on" });
	}
		function choiceUser(taskId,outCome){
			var result = window.showModalDialog("<%=request.getContextPath()%>/verifyjoin/verifyjoin_getParticipationList.do?taskId="+taskId+"&outCome="+outCome+"&multiple=false","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
			if(typeof(result)!='undefined'){
				alert(result);
				document.form1.taskId.value = taskId;
				document.form1.outCome.value = outCome;
				document.form1.userId.value = result;
				document.form1.submit();
			}
		}
</script>
<style type="text/css">
.container div {
	width: 100px;
	background: #CCCCCC;
	line-height: 30px;
	border: 1px solid #000000;
}

.container2 a {
	text-decoration: none;
	display: block;
	border: 1px solid #d4d4d3;
	background: #e6e6e6;
	color: #000000;
	width: 150px
}

.container2 .on a {
	background: #ffebac;
	color: #982e00;
	border-color: #ffb200;
	width: 150px
}
</style>






		<title>确权</title>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
		class='body1'>
		<s:form action="/quequan/quequan_completeTask.do" name='form1'
			id='etcld' theme="simple">
			<input type='hidden' name="taskId"
				value="<%=request.getParameter("taskId")%>" />
			<input type='hidden' name="userId" />
			<input type='hidden' name="outCome" />
			<s:hidden name="tid" />
			<s:hidden name="etcld.tid" />
			处理单编号：<s:textfield name="etcld.cldbh" />
			会签结果：通过的情况下显示提交以及后续的流程
			<div id="idMenu2" class="container2" style='float: left; width: 60px'>
				提交后续环节
			</div>
			<div id="idMenu1" class="container1"
				style='float: left; width: 120px'>
				<input type='button' value='返回待办' class='button1' 	onclick='window.location="<%=request.getContextPath()%>/workflow/userTask_findTodoTasks.do"'/>
			</div>
			<table border="1" width="100%">
				<table width="98%" border="0" align="center" cellspacing="0">
					<div align="center">
						<span class="STYLE7 STYLE1">日常管理审批单</span>
					</div>
					<br/>
					<br/>
					<tr>
						<td align='center'>
							编号:<%=task.getId()%>　　
							当前环节:<%=task.getName()%>　　
							<%
								if ("会签".equals(task.getName())) {
							%>
							<input type='button' value='会签意见' class='button1'
								onclick='window.open("quequan_huiqian.do?taskId=<%=task.getId()%>&tid=<%=request.getParameter("tid")%>","_blank","witth=400,left=window.width/2,top=window.height/2")' />
							<%
								}
									String strAgentID = task.getAssignee();
									request.setAttribute("strAgentID", strAgentID);// task.getAssignee()
							%>
							处理人:
							<r:user userId="${strAgentID}" />
							<a href="quequan_toHistory.do?taskId=<%=task.getId()%>">流程跟踪</a>
							<hr color="#6600CC"  width="100%" />
							<table class="newtable" width="100%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="97" class="td_form01">
										标题
									</td>
									<td class="td_form02" colspan="5">
										<s:textfield name="etcld.zt" id="zt" vmode='not null'
											vdisp='标题' />
									</td>
								</tr>
								<tr>
									<td width="97" class="td_form01">
										呈送
									</td>
									<td class="td_form02" colspan="5">
										<s:textfield name="etcld.cs"  size="90"
											vmode='not null' vdisp='呈送' />
									</td>
								</tr>
								<tr>
									<td width="97" class="td_form01">
										申请日期
									</td>
									<td class="td_form02">
										<s:textfield name="etcld.yjtjsj" id="etcld.yjtjsj" size="20" />
									</td>
									<td class="td_form01">
										申请部门
									</td>
									<td class="td_form02">
										<s:textfield name="etcld.sqbm" id="etcld.sqbm" size="20" />
									</td>
									<td class="td_form01">
										事项类型
									</td>
									<td class="td_form02">
										<!-- r:select name="eventType"   id="eventType" parRefKey="040"/ -->
										<s:select
											list="#{'确权审批':'确权审批','业务维修':'业务维修','更新改造':'更新改造','其他事项审批':'其他事项审批'}" />
									</td>
								</tr>
								<tr>
									<td class="td_form01">
										经办人
									</td>
									<td class="td_form02">
										<s:textfield name="etcld.jbr" id="etcld.jbr" size="20" />
									</td>
									<td class="td_form01">
										经办人电话
									</td>
									<td class="td_form02">
										<s:textfield name="etcld.jbrdh" id="etcld.jbrdh" size="20" />
									</td>
									<td class="td_form01">
										会签部门
									</td>
									<td class="td_form02" colspan="5">
										<s:textfield name="etcld.hqbm" id="etcld.hqbm" size="20" />
										<input type="button" value="选择部门" class="text1" />
									</td>
								</tr>
								<tr>
									<td class="td_form01">
										是否涉及费用
									</td>
									<td class="td_form02">
										<s:checkbox name="etcld.sfsjfy" />
									</td>
									<td class="td_form01">
										申请费用总金额
									</td>
									<td class="td_form02">
										<s:textfield name="etcld.sqfyzje" name='etcld.sqfyzje'
											id="etcld.sqfyzje" size="20" />
									</td>
									<td class="td_form01">
										审批费用总金额
									</td>
									<td class="td_form02">
										<s:textfield name="etcld.spfyzje" id="etcld.spfyzje" size="20" />
									</td>
								</tr>
							</table>
							<table class="newtable" width="100%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										<table id="purchase_list"></table>
										<div id="pgtoolbar1"></div>
										<table id="puechase_reason"></table>
										<div id="pgtoolbar2"></div>

									</td>
								</tr>
							</table>

							<table class="newtable" width="100%" height=60x border="1"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td valign="top" width="100px">
										批示意见：
									</td>
									<td style="width: 400px">
										<table width="600px" border="0">


											<s:iterator value="listLcYj_psyj" status="ll" id="lcyj">
												<tr>
													<td align="left" width="600px">
														意见内容：
														<s:property value="#lcyj.yjnr" />
													</td>
												</tr>
												<tr>
													<td align="right" width="600px"></td>
												</tr>
												<tr>
													<td align="right" width="600px">
														<s:property value="#lcyj.yjtjsj" />
													</td>
												</tr>
											</s:iterator>
											<%
												if ("批示意见".equals(task.getName())
															|| "部门领导审核".equals(task.getName())
															|| "公司领导批示".equals(task.getName())) {
											%>
											<tr>
												<td colspan="2">
													<textarea name="content" cols="80" rows="4"
														vmode="not null" vdisp="审批意见"></textarea>
												</td>
											</tr>
											<%
												}
											%>
										</table>
									</td>
								</tr>
							</table>
							<table class="table1" width="100%" height=60x border="1"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td valign='top' width='100px'>
										承办部门意见：
									</td>
									<td style='width: 600px'>
										<table>
											<s:iterator value="listLcYj_cbbmyj" status="ll" id="lcyj">
												<tr>
													<td align="left" width="600px">
														意见内容：
														<s:property value="#lcyj.yjnr" />
													</td>
												</tr>
												<tr>
													<td align='right' width='600px'></td>
												</tr>
												<tr>
													<td align='right' width='600px'>
														<s:property value="#lcyj.yjtjsj" />
													</td>
												</tr>
											</s:iterator>
											<%
												if ("业务运营组意见".equals(task.getName())
															|| "组审核".equals(task.getName())) {
											%>
											<tr>
												<td colspan=2>
													<textarea name="content" cols="80" rows="4"></textarea>
												</td>
											</tr>
											<%
												}
											%>

										</table>
									</td>

								</tr>


							</table>


							<table class="table1" width="100%" height=60x border="1"
								align="center" cellpadding="0" cellspacing="0">

								<tr>
									<td valign='top' width='100px'>
										业务运营组意见：
									</td>
									<td style='width: 600px'>

										<table>


											<s:iterator value="listLcYj_ywyyz" status="ll" id="lcyj">
												<tr>
													<td class="td_form01" align=left width='600px'>
														意见内容：
														<s:property value="#lcyj.yjnr" />
													</td>

												</tr>
												<tr>
													<td align='right' width='600px'>




													</td>
												</tr>
												<tr>
													<td align='right' width='600px'>


														<s:property value="#lcyj.yjtjsj" />
													</td>
												</tr>
											</s:iterator>
											<%
												if ("承办部门组处理".equals(task.getName())
															|| "业务运营组处理".equals(task.getName())) {
											%>
											<tr>
												<td colspan=2>
													<textarea name="content" cols="80" rows="4"></textarea>
												</td>
											</tr>
											<%
												}
											%>
										</table>
									</td>
								</tr>
							</table>
							<table class="table1" width="100%" height='60px' border="1"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td valign='top' width='100px'>
										会签部门意见：
									</td>
									<td style='width: 600px'>
										<table width="600px" height="227">
											<s:iterator value="listLcYj_hqbmyj" status="ll" id="lcyj">
												<tr>
													<td class="td_form01" align=left width='600px'>
														意见内容：
														<s:property value="#lcyj.yjnr" />
													</td>
												</tr>
												<tr>
													<td align='right' width='600px'></td>
												</tr>
												<tr>
													<td align='right' width='400px'>
														<s:property value="#lcyj.yjtjsj" />
													</td>
												</tr>
											</s:iterator>
											<%
												if ("会签部门意见".equals(task.getName())) {
											%>
											<tr>
												<td colspan=2>
													<textarea name="content" cols="80" rows="4"
														vmode='not null' vdisp='审批意见'></textarea>
												</td>
											</tr>
											<%
												}
											%>
										</table>
									</td>
								</tr>
							</table>

							<table class="table1" width="100%" height=60x border="1"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td valign='top' width='100px'>
										拟稿意见：
									</td>
									<td style='width: 600px'>
										<table>
											<s:iterator value="listLcYj_ng" status="ll" id="lcyj">
												<tr>
													<td align=left width='600px'>
														意见内容：
														<s:property value="#lcyj.yjnr" />
													</td>
												</tr>
												<tr>
													<td align='right' width='600px'>
														<s:property value="#lcyj.deptId" />
														<s:property value="#lcyj.yjtjr" />
													</td>
												</tr>
												<tr>
													<td align='right' width='600px'>
														<s:property value="#lcyj.yjtjsj" />
													</td>
												</tr>
											</s:iterator>
											<%
												if ("拟稿".equals(task.getName())
															|| "拟稿部门综合处理".equals(task.getName())) {
											%>
											<tr>
												<td colspan=2>
													<textarea name="content" cols="80" rows="4"
														vmode='not null' vdisp='审批意见'></textarea>
												</td>
											</tr>
											<%
												}
											%>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</table>
		</s:form>
	</body>
</html>
<script type="text/javascript">
                                        jQuery("#purchase_list").jqGrid({       
                                            datatype: "local",    
                                            colNames: ['资产编号', '资产名称', '存放地点', '原值','申请金额','审定金额','操作'],
                                            colModel: [
											{
                                                name: 'id',
                                                index: 'id',
												align: "center"
                                            }, 
											 {
                                                name: 'name',
                                                index: 'name',
												align: "center"
                                            }, {
                                                name: 'didian',
                                                index: 'didian',
												align: "center"
                                            },{
                                                name: 'yuanzhi',
                                                index: 'yuanzhi',
												align: "center",
                                                width: 100
                                            },  {
                                                name: 'shenqingjine',
                                                index: 'shenqingjine',
												align: "center"
                                            }, {
                                                name: 'shendingjine',
                                                index: 'shendingjine',
												align: "center"
                                            },{
                                                name: 'caozuo',
                                                index: 'caozuo',
												align: "center"
                                            }],
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
                                            caption: '资产列表',
                                            toolbar: [true, "top"]
                                        });
                                        var mydata = [{    
                                           id: '<a href="asset-info.html" target="_blank">0000006520909</a>',
										    name: '捷达小轿车',
											didian: '北京分行',
                                            yuanzhi: '0',
                                            shenqingjine: '2312312',
											shendingjine: '2312312',
                                          	caozuo: '<a href="cakanmingxi.html" target="_blank">查看明细</a>'
                                         }];
                                        for (var i = 0; i <= mydata.length; i++) 
                                            jQuery("#purchase_list").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#purchase_list").jqGrid('navGrid', '#pgtoolbar1', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
									
     
                                    
                             </script>


<script type="text/javascript">
                                        jQuery("#puechase_reason").jqGrid({
                                            datatype: "local",
                                            colNames: ['标题', '审批单号', '审批日期', '模块名称', '流程名称'],
                                            colModel: [{
                                                name: 'biaoti',
                                                index: 'biaoti',
                                                width: 100,
                                                align: "center"
												},  {
                                                name: 'approval_num',
                                                index: 'approval_num',
												align: "center",
                                                width: 100
                                            }, {
                                                name: 'approval_date',
                                                index: 'approval_date',
                                                align: "center",
                                                width: 100
                                            }, {
                                                name: 'mkmc',
                                                index: 'mkmc',
                                                width: 150
                                            }, {
                                                name: 'Process',
                                                index: 'Process',
                                                width: 100,
                                                sorttype: "float"
                                            }],
                                            autowidth: true,
                                            height: 'auto',
                                            multiselect: true,
                                            caption: '办理依据',
                                            toolbar: [true, "top"]
                                        });
                                        var mydata = [{
                                            biaoti: '',
											approval_num: '200901010890',
											approval_date: '09/10/2010',
                                            mkmc: '',
                                            Process: ''
                                       
                                        }];
                                        for (var i = 0; i <= mydata.length; i++) 
                                            jQuery("#puechase_reason").jqGrid('addRowData', i + 1, mydata[i]);
                                        
                                        jQuery("#puechase_reason").jqGrid('navGrid', '#pgtoolbar1', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
                                 
									
                                    </script>
