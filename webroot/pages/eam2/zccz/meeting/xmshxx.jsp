<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<html>
	<head>
	   	<base href="<%=basePath %>" />
		<title>资产处置审批</title>
		<script type="text/javascript">
			var _g_privateDialogFeatures = 'height=600, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			$(function(){
				//添加父页面按钮
				var parentButtonStr = '[{"buttonIcon":"icon-ok","buttonText":"提交","buttonMenuId":"flow_first"},\
										{"buttonHandler":"mainWindow.tabbar.tabWindow(&quot;a2&quot;).viewFlows()","buttonIcon":"icon-search","buttonText":"查看流程信息"},\
										{"buttonHandler":"mainWindow.tabbar.tabWindow(&quot;a2&quot;).saveAsDraft()","buttonIcon":"icon-save","buttonText":"保存为草稿"},\
										{"buttonHandler":"mainWindow.tabbar.tabWindow(&quot;a2&quot;).printForm()","buttonIcon":"icon-print","buttonText":"打印处理单"},\
										{"buttonHandler":"mainWindow.tabbar.tabWindow(&quot;a2&quot;).passRound()","buttonIcon":"icon-redo","buttonText":"打印合规审查意见"}\
				]';		
				//window.parent.parent.addButtonsFromChildren2(parentButtonStr,$("#addToParent").html());
				
				//选择按钮 审批委员
				var chooseSpwyStr = '[\
					{"buttonHandler":"chooseSpwy","buttonIcon":"icon-search","buttonText":"选择"}\
				]';
				addButtons(jQuery("#chooseSpwy"),chooseSpwyStr);
				
				//汇报人
				var chooseHbrStr = '[\
					{"buttonHandler":"chooseHbr","buttonIcon":"icon-search","buttonText":"选择"}\
				]';
				addButtons(jQuery("#chooseHbr"),chooseHbrStr);
				
				//监察室列席人
				var chooseJcslxrStr = '[\
					{"buttonHandler":"chooseJcslxr","buttonIcon":"icon-search","buttonText":"选择"}\
				]';
				addButtons(jQuery("#chooseJcslxr"),chooseJcslxrStr);
				
				//意见汇总人
				var chooseYjhzrStr = '[\
					{"buttonHandler":"chooseYjhzr","buttonIcon":"icon-search","buttonText":"选择"}\
				]';
				addButtons(jQuery("#chooseYjhzr"),chooseYjhzrStr);		
			});
			
			function chooseSpwy(){
				var url = "<%=request.getContextPath()%>/zccz/dealToDo_getZcrSpwy.do?isZcrOrSpwy=false";
				window.open(url);
			}
			//选择汇报人
			function chooseHbr(){
				var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?personType=1";
				window.open(url,'',_g_privateDialogFeatures);
			}
			
			//监察室列席人
			function chooseJcslxr(){
				var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?personType=2";
				window.open(url,'',_g_privateDialogFeatures);
			}
			
			//意见汇总人
			function chooseYjhzr(){
				var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do?personType=3";
				window.open(url,'',_g_privateDialogFeatures);
			}

			//弹出树页面的回调方法 departmenthiddenid,departmentvalue
			function getCallBack4Tree(id,value,personType,deptId,deptName){
				if(personType == "1"){
					document.getElementById("hbr").value = id;
					document.getElementById("hbrxm").value = value;
				}
				if(personType == "2"){
					document.getElementById("jcslxr").value = id;
					document.getElementById("jcslxrxm").value = value;
				}
				if(personType == "3"){
					document.getElementById("yjhzr").value = id;
					document.getElementById("yjhzrxm").value = value;
					$("#yjhzrbmid").val(deptId);
					$("#yjhzrbmmc").val(deptName);
				}				
			}
			function callBack4Spwy(spwyIds,spwys){
				document.getElementById("spwyIds").value = spwyIds;
				document.getElementById("spwys").value = spwys;
			}
			
			//保存为草稿
			function saveAsDraft(){
				var url = '<%=basePath%>zccz/xmshAction_saveItemMeetingInfo.do';
				myform.action = url+'?saveFlag=AsDraft';
				myform.submit();	
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<!-- 提交按钮menuButton的下拉提交环节名称 start-->
		<div id="addToParent" style="display: none;">
			<div id="flow_first" style="width: 150px;">
				<div onClick="mainWindow.nextStep();" iconCls="icon-redo">会议组织</div>
			</div>
		</div>
		<s:form id="myform">
			<s:hidden name="xmXXVO.id"/>
			<table width="95%" border="1" cellspacing="0" cellpadding="0">		
				<tr>
					<td class="td_zxy01">处置项目名称：</td>
					<td class="td_form02" colspan="3"><s:textfield name="xmXXVO.czxmmc" size="126" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">审批委员：</td>
					<td class="td_form02" colspan="3">
						<s:hidden name="xmXXVO.spwyId" id="spwyIds"/>
						<s:textfield name="xmXXVO.spwys" cssClass="input" id="spwys">
							<span id="chooseSpwy" style="align:left;" id=""></span>
						</s:textfield>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">汇报人：</td>
					<td class="td_form02">
						<s:hidden name="xmXXVO.hbr" cssClass="input" id="hbr"/>
						<s:textfield name="xmXXVO.hbrxm" maxlength="10"  cssClass="input" id="hbrxm">
							<span id="chooseHbr" style="align:left;"></span>
						</s:textfield>
					</td>
					<td class="td_zxy01">监察室列席人：</td>
					<td class="td_form02">
						<s:hidden name="xmXXVO.jcslxr" cssClass="input" id="jcslxr"/>
						<s:textfield name="xmXXVO.jcslxrxm" maxlength="10" cssClass="input" readonly="true" id="jcslxrxm">
							<span id="chooseJcslxr" style="align:left;"></span>
						</s:textfield>
			        	
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>意见汇总人：</td>
					<td class="td_form02">
						<s:hidden name="xmXXVO.yjhzr" cssClass="input" id="yjhzr"/>
						<s:hidden name="xmXXVO.yjhzrbmid" cssClass="input" id="yjhzrbmid"/>
						<s:hidden name="xmXXVO.yjhzrbmmc" cssClass="input" id="yjhzrbmmc"/>
						<s:textfield name="xmXXVO.yjhzrxm" cssClass="input" maxlength="10" id="yjhzrxm">
							<span id="chooseYjhzr" style="align:center;"></span>
						</s:textfield>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01" width="200">审批时间：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.spsj" size="36" cssClass="input" readonly="true"/></td>
					<td  class="td_zxy01" width="200">审批方式：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.CSpfs" size="36" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td  class="td_zxy01">会议次数：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.hycs" size="36" cssClass="input" readonly="true"/></td>
					<td  class="td_zxy01">审批主持人：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.spzcr" size="36" cssClass="input" readonly="true"/></td>
				</tr>
			</table>	
		</s:form>
	</body>
</html>

