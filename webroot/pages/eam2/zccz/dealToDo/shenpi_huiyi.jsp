<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzHyxx"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String headId = (String)request.getAttribute("headId");
	String sffscl = (String)request.getAttribute("sffscl");
	CzHyxx hyxx = (CzHyxx)request.getAttribute("hyxx");
%>
<!-- ==========================  权限控制添加   ======================================== -->
<r:controlfile file="/pages/eam2/zccz/dealToDo/shenpi_huiyi.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<title>安排会议</title>
<style type="text/css"> 
	/* css for timepicker */
	.ui-timepicker-div .ui-widget-header{ margin-bottom: 8px; }
	.ui-timepicker-div dl{ text-align: left; }
	.ui-timepicker-div dl dt{ height: 25px; }
	.ui-timepicker-div dl dd{ margin: -25px 0 10px 65px; }
	.ui-timepicker-div td { font-size: 90%; }
</style>
<script type="text/javascript">
<!-- ========================添加工作流按钮==========================================  -->
	var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
	var isSendSpwy = 
	<%if(StringUtils.equals(sffscl,"1")){%>
		true;
	<%}else{%>
		false;
	<%}%>
	$(function(){
		$.ajaxSetup({
		  async: false
		});
		//window.parent.clearPanelTool();
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
		<%if(!StringUtils.equals("整理会议纪要",workflowVO.getTaskName())){%>
		<%}%>
		init();
		jQuery("#purchase_list").setGridWidth($("#ruler").width());
		jQuery("#blyj_reason_list").setGridWidth($("#ruler").width());
	   	$(window).bind('resize', function(){
			jQuery("#blyj_reason_list").setGridWidth($("#ruler").width());
			jQuery("#purchase_list").setGridWidth($("#ruler").width());
	     });
	     
	     $('#spsj').datetimepicker({
			showSecond: true,
			dateFormat: 'yy-mm-dd',
			timeFormat: 'hh:mm:ss',
			stepHour: 1,
			stepMinute: 1,
			stepSecond: 1
	     });
	     
	     $.datepicker.regional['zh'] = {
			closeText: '关闭',
			prevText: '上个月',
			nextText: '下个月',
			currentText: '现在',
			monthNames: ['一月','二月','三月','四月','五月','六月',
			'七月','八月','九月','十月','十一月','十二月'],
			monthNamesShort: ['一','二','三','四','五',
			'六','七','八','九','十','十一','十二'],
			dayNames: ['周日','周一','周二','周三','周四','周五','周六'],
			dayNamesShort: ['日','一','二','三','四','五','六'],
			dayNamesMin: ['日','一','二','三','四','五','六'],
			weekHeader: '周',
			dateFormat: 'dd－mm－yy',
			firstDay: 1,
			isRTL: false,
			showMonthAfterYear: false,
			yearSuffix: ''
		};
		$.datepicker.setDefaults($.datepicker.regional['zh']);
		
		$.timepicker.regional['zh'] = {
			timeOnlyTitle: 'Выберите время',
			timeText: '时间',
			hourText: '时',
			minuteText: '分',
			secondText: '秒',
			currentText: '现在',
			closeText: '确定',
			ampm: false
		};
		$.timepicker.setDefaults($.timepicker.regional['ru']);
	});
<!-- ============================================================================== -->
var oldTime = $("spsj").val();
function onCloseTimePicker(dateText){
	$.post("<%=basePath %>zccz/dealToDo_saveSpsj.do",{
 			"hyxx.spsj"	: "" + dateText,
 			"hyxx.id"	: "<%=headId %>"
 		},function(returnStr){
 			if(returnStr != "SUCCESS"){
 				$("#spsj").val(oldTime);
 				alert("设定时间失败，请联系管理员!");
 			}else{
 				$("#spsj").val(dateText);
				oldTime = dateText;
 			}
 		});
 	$("#hydd").focus();
}

function forSubmit(){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do";
	myform.action=url;
}
function forCancel(){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_cancelHyxx.do";
	var huiqiancishu = document.getElementById("huiqiancishu").value;
	var huiyicishu = document.getElementById("huiyicishu").value;
	var hyId = document.getElementById("hyxx.id").value;
	$.post(url,{huiyicishu:"" + huiyicishu + "",huiqiancishu:"" + huiqiancishu + "",hyId:"" + hyId + ""}, function(data){
		window.close();
	});
}
function getHycs(){
	var stuate = document.getElementById("stuate").value;
	var stuate_value = document.getElementById("stuate_value").value;
	
	var codeType = document.getElementById("eventType").value;
	var hycs = document.getElementById("hycs").value;
	if(stuate == codeType){
		document.getElementById("ischange").value = "0";//没有发生变化
	}else if(stuate && stuate != codeType){//表示发生变化
		document.getElementById("ischange").value="1";
	}
	if(stuate == codeType){
		document.getElementById("hycs").value = stuate_value;
	}else if(stuate != codeType &&codeType!=""){
		getInitCode(codeType,hycs);
	}else{
		document.getElementById("hycs").value = "";
	}
}
function getRealHycs(codeType,hycs){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_getCode5Hycs.do";
		var stuate = document.getElementById("stuate").value;
		var stuate_value = document.getElementById("stuate_value").value;
		$.post(url,{
			"codeType" : "" + codeType,
			"hycs" : "" + hycs
			}, function(data){
				var str = data.split(",");
				if(document.getElementById("hycs").value != str[1]){
					alert("由于您的会议次数被占用新的账号为"+str[1]);
				}
				if(str[0]=="1"){
					document.getElementById("hyxx.hycs").value = str[1];
					document.getElementById("huiyicishu").value = str[1];
				}else if(str[0]=="2"){
					document.getElementById("hyxx.hycs").value = str[1];
					document.getElementById("huiqiancishu").value = str[1];
				}
		});
}

function disableCode(stuate,stuate_value){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_disableCode6Hycs.do";
		$.post(url,{
			"codeType" : "" + stuate,
			"code" : "" + stuate_value
			}, function(data){
				var str = data.split(",");
		});
}
function getInitCode(codeType,hycs){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_getCode4Hycs.do";
		$.post(url,{
			"codeType" : "" + codeType,
			"hycs" : "" + hycs
			}, function(data){
				var str = data.split(",");
				if(str[0]=="1"){
					document.getElementById("hyxx.hycs").value = str[1];
					document.getElementById("huiyicishu").value = str[1];
				}else if(str[0]=="2"){
					document.getElementById("hyxx.hycs").value = str[1];
					document.getElementById("huiqiancishu").value = str[1];
				}
		});
}
function getSelectP(){
	var selectId = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	if(selectId.length == 1){
		var rowData = jQuery("#purchase_list").jqGrid('getRowData',selectId);
		return rowData.spwy;
	}
	return "";
}
function chooseZcrOrSpwy(isZcrOrSpwy){//选择主持人 或审批委员
	if(isZcrOrSpwy=="true"){
		var url = "<%=request.getContextPath()%>/zccz/dealToDo_getZcrSpwy.do" +
		 "?isZcrOrSpwy="+isZcrOrSpwy +
		 "&hylx=" + $("#hylx").val();
		window.open(url,'','width=400,height=600,scrollbars=yes');
	}else if(isZcrOrSpwy=="false"){
		var url = "<%=request.getContextPath()%>/zccz/dealToDo_getZcrSpwy.do" + 
		"?isZcrOrSpwy="+isZcrOrSpwy +
		"&hylx=" + $("#hylx").val();
		window.open(url,'','width=400,height=600,scrollbars=yes');
	}
}

function callBack4Zcr(id){
	$.post("<%=basePath %>zccz/dealToDo_setZcrInfo.do",{
		"hyxx.id" : "${hyxx.id}",
		"hyxx.spzcr" : "" + id
	},function(returnStr){
		if(returnStr != "ERROR" && returnStr != "" && returnStr != null){
			returnObj = eval('(' + returnStr + ')');
			$("#spzcr").val(returnObj.spzcr);
			$("#zcrxm").val(returnObj.zcrxm);
			$("#zcrbmid").val(returnObj.zcrbmid);
			$("#zcrbmmc").val(returnObj.zcrbmmc);
			//$("#zcrxmImg").remove();
		}else{
			alert("选择主持人失败，请联系管理员!");
		}
	});
}

function callBack4Spwy(spwyIds,spwy){
	var xmIds = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_modigySpwy.do";
	$.post(url,{xmIds:"" + xmIds + "",spwyIds:"" + spwyIds + "",spwy:"" + spwy + ""}, function(data){
		reloadJqGrid();
	});
}
//打开树，根据类型打开类型
function openTreeByType(){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_tree.do";
	var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
	//window.open(url,'',_g_privateDialogFeatures);
	//window.open(url);
	window.open(url,'','width=400,height=600,scrollbars=yes');
	
}
//弹出树页面的回调方法 departmenthiddenid,departmentvalue
function getCallBack4Tree(id,value,personType,deptId,deptName){
	document.getElementById("hyjyzlr").value = id;
	document.getElementById("hyjyzlrxm").value 	= value;
	$("#hyjyzlrbmid").val(deptId);
	$("#hyjyzlrbmmc").val(deptName);
	//$("#hyjyzlrxmImg").remove();
}
function commitWorkflow(taskId,outCome){
		if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2(taskId,outCome);
                if(!result) return;
            }
        }
<%
			if(workflowVO.taskName.equals("业务运营组处理")){
%>
				if(outCome=="主持人确认"){
					if(confirm('确定要提交'+outCome+'吗？')){
							document.myform.result.value = 'commitTozcrqr';
							document.myform.action = "<%=request.getContextPath()%>/zccz/dealToDo_submitHyxx.do";
							document.myform.nextTodoUrl.value = "zcczshWorkflow/zcczshWorkflow_todo.do";
							document.myform.didUrl.value = "<%=request.getContextPath()%>/zcczshWorkflow/zcczshWorkflow_did.do";
							document.myform.taskId.value = taskId;
							document.myform.outCome.value = outCome;
							if('beforeWorkFlowSubmit' in window){
					            if(beforeWorkFlowSubmit instanceof Function){
					                var result = beforeWorkFlowSubmit(taskId,outCome);
					                if(!result) return;
					            }
					        }
							document.myform.submit();
							return false;
						}
						return false;
					}
					return true;				
<%			
			}else if(workflowVO.taskName.equals("安排会议")){
%>
				if(outCome=="主持人审批"){
					if(confirm('确定要提交'+outCome+'吗？')){
						document.myform.result.value = 'commitTozcrsp';
						document.myform.action = "<%=request.getContextPath()%>/zccz/dealToDo_submitHyxx.do";
						document.myform.nextTodoUrl.value = "zcczshWorkflow/zcczshWorkflow_zcrspTodo.do";
						document.myform.didUrl.value = "<%=request.getContextPath()%>/zcczshWorkflow/zcczshWorkflow_did.do";
						document.myform.taskId.value = taskId;
						document.myform.outCome.value = outCome;
						if('beforeWorkFlowSubmit' in window){
					            if(beforeWorkFlowSubmit instanceof Function){
					                var result = beforeWorkFlowSubmit(taskId,outCome);
					                if(!result) return;
					            }
					        }
						document.myform.submit();
						return false;
					}
					return false;
				}
<%
			}
%>
			return true;
}

function init(){
<%
	if(isInWorkflow){
		if(!StringUtils.equals(sffscl,"1")){
%>
	<e:pc id="fspwyButton">
		var buttonJSonString = '[{"id":"sffsclButton","buttonHandler":"mainWindow.sendToDoWysp","buttonIcon":"icon-add","buttonText":"发送委员材料"}]';
		window.parent.prependButtonsFromChildren(buttonJSonString,"");
	</e:pc>
	<%}%>
	//=========================添加办理依据按钮==============================
	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
	<e:pc id="blyjButton">
		var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
		]';
		addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	</e:pc>
	//=========================添加办理依据按钮==============================
<%}%>
	<e:pc id="itemButton">
		var buttonJSonString = '[{"buttonHandler":"xmzhiding","buttonIcon":"icon-setTop","buttonText":"置顶"},\
				 {"buttonHandler":"xmshangyi","buttonIcon":"icon-moveUp","buttonText":"上移"},\
				 {"buttonHandler":"xmxiayi","buttonIcon":"icon-moveDown","buttonText":"下移"},\
				 {"buttonHandler":"xmzhidi","buttonIcon":"icon-setBottom","buttonText":"置底"},\
				 {"buttonHandler":"xmzengjia","buttonIcon":"icon-add","buttonText":"增加"},\
				 {"buttonHandler":"xmjianshao","buttonIcon":"icon-remove","buttonText":"减少"},\
				 {"buttonHandler":"xmweiyuanxiugai","buttonIcon":"icon-edit","buttonText":"修改审批委员"}\
				]';
				 //{"buttonHandler":"message","buttonIcon":"icon-message","buttonText":"消息提醒"}\
				 //{"buttonHandler":"endMeeting","buttonIcon":"icon-add","buttonText":"结束会议"}\
		addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	<%
		if(StringUtils.equals(sffscl,"1")){
		String wyzhuangtai = (String)session.getAttribute("wyzhuangtai");
		if(wyzhuangtai!=null){
			if(workflowVO.getTaskName().equals("安排会议")){
				workflowVO.setTaskName(wyzhuangtai);
			}
		}
		//session.removeAttribute("wyzhuangtai");
%>
		
		<e:pc id="itemAddButton">
					var addButtonJSonString = '[{"id":"cuijiaoyijian","buttonHandler":"mainWindow.message","buttonIcon":"icon-message","buttonText":"催交意见"}]';
					window.parent.appendButtonsFromChildren(addButtonJSonString,"");
		</e:pc>

	<%}%>
	<%
		if(workflowVO.getTaskName().equals("整理会议纪要")){
		String wyzhuangtai = (String)session.getAttribute("wyzhuangtai");
		workflowVO.setTaskName(wyzhuangtai);
		//session.removeAttribute("wyzhuangtai");
		}
	%>
	
	
	<e:pc id="endButton">
	var expensesStr = '[' + 
			'{"buttonHandler":"mainWindow.generateWord","buttonIcon":"icon-ok","buttonText":"备案汇总"},' +
			'{"buttonHandler":"mainWindow.formSubmit","buttonIcon":"icon-ok","buttonText":"启动OA会议纪要整理"}' + 
	']';
	window.parent.prependButtonsFromChildren(expensesStr,"");
	</e:pc>
	
	<e:pc id="viewBahz">
	var expensesStr2 = '[' + 
			'{"buttonHandler":"mainWindow.viewBahz","buttonIcon":"icon-ok","buttonText":"查看备案汇总"}' +
	']';
	window.parent.prependButtonsFromChildren(expensesStr2,"");
	</e:pc>
		
	if(document.getElementById("stuate"))
		document.getElementById("stuate").value = "${hyxx.CSpfs}";
	if(document.getElementById("stuate_value"))
		document.getElementById("stuate_value").value = "${hyxx.hycs}";
}

function formSubmit(){
	var czxmlb = jQuery("#purchase_list").getDataIDs();
		var count  = czxmlb.length;
		for(var i = 0; i<count;i++){
			var rowData = $("#purchase_list").jqGrid("getRowData", czxmlb[i]);
			var spr = rowData.zhuangtai;
			if(spr == "意见汇总中"){
				alert("您有项目正在意见汇总中不能提交！");
				return ;
			}
		}
	if(confirm('确定要提交流程办结吗？')){
		var url = "<%=basePath%>zccz/dealToDo_startOA.do";
		var EAMmsgid = '<%=headId%>';
		$.post(url,{
				"EAMmsgid":EAMmsgid,
				"taskid":"<%=workflowVO.getTaskId()%>",
				"hylx" : $("#hylx").val(),
				"endViewUrl" :  $("#endViewUrl").val(),
				"zwbt":$("#hycs").val()
			}, 
			function(data){
					if(data == '0'||data == null||data == ''){
						document.getElementById("qidongoabiaozhi").value = "1";//启动失败
						alert("启动失败");
						return ;
					}else{
						window.open(data,'','');
					}
				
			}
		);
				
		if(document.getElementById("qidongoabiaozhi").value != "1"){
			$(document.myform).ajaxForm({
				success　: overProcess
			});
			document.myform.taskId.value = '<%=workflowVO.taskId%>';
			if('beforeWorkFlowSubmit' in window){
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>");
	                if(!result) return;
	            }
	        }
			document.myform.action = '<%=basePath %>zccz/dealToDo_endHyxx1.do';
			$(document.myform).submit();
		}
	}	
}		
		
function overProcess(responseText,statusText,xhtmlHttpRequest,$form){
	if(responseText == 'SUCCESS_END'){
		document.myform.action = document.getElementById("endUrl").value;
		document.myform.url.value = document.getElementById("endViewUrl").value;
		document.myform.taskId.value = '<%=workflowVO.taskId%>';
		document.myform.outCome.value = '整理会议纪要结束';
		document.myform.sheetId.value = document.getElementById("hycs").value;
		if('beforeWorkFlowSubmit' in window){
            if(beforeWorkFlowSubmit instanceof Function){
                var result = beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>");
                if(!result) return;
            }
        }
		document.myform.submit();
	}
}

function sendToDoWysp(){
	if($.trim($("#spsj").val()) == ""){
		alert("请输入审批时间");
		return false;		
	}
	
			
			
	$.post("<%=basePath %>zccz/dealToDo_sendToDoWysp.do",{
		"hyId" : "<%=headId %>"
	},function(returnStr){
		if(returnStr == "SUCCESS"){
			window.parent.removeById("sffsclButton");
			alert("发送委员材料成功！");
			jQuery("#purchase_list").trigger("reloadGrid");
			isSendSpwy = true;
			/**
			$("#myform").attr("action","<%=basePath%>zccz/dealToDo_saveHyxx.do");
			beforeWorkFlowSubmit("","");
			$("#myform").submit();
			**/
			$.post("<%=basePath %>zccz/dealToDo_saveHyDiDian.do",{"hyId" : "<%=headId %>","hydd":document.getElementById("hydd").value},function(data){
			
			});
			window.location.reload();
		}else
			alert("发送委员材料失败！");
	});
}

function checkEAMFormJSMethod(){
	return true;
}
/**
checkEAMFormJSMethod2(arg1, arg2)
							arg1								arg2
提交							taskId								outCome			
拟稿提交						processDefinitionKey				outCome
保存待办						"saveTodo"							""	
**/
function checkEAMFormJSMethod2(arg1, arg2){
	if($("#eventType").val() == ""){
		alert("请选择审批方式");
		return false;
	}
	if($("#zcrxm").val() == ""){
		alert("请选择主持人");
		return false;
	}
	if($("#hyjyzlrxm").val() == ""){
		alert("请选择会议纪要整理人");
		return false;
	}	
	var czxmlb = jQuery("#purchase_list").getDataIDs();
	var count  = czxmlb.length;
	for(var i = 0; i<count;i++){
		var rowData = $("#purchase_list").jqGrid("getRowData", czxmlb[i]);
		var spr = rowData.spwy;
		if(spr == ""){
			alert("请选择处置项目审批委员！");
			return false;
		}
	}
	
	if(arg2 == "主持人审批"){
		if(!isSendSpwy){
			alert("委员未审批，请发送委员材料！");
			return false;
		}
		$.ajaxSetup({
			async : false
		});
		var isAllYjSubmit = false;
		$.post("<%=basePath %>zccz/dealToDo_isAllSpwySubmit.do",{
			"hyId" : "<%=headId %>"
		},function(returnStr){
			if(returnStr.length > 2){
				alertStr = "";
				returnObj = eval('(' + returnStr + ')');
				$.each(returnObj,function(i){
					alertStr += "还有'" + returnObj[i] + "'等委员没有对项目'" + i + "'提交意见\n";
				});
				alert(alertStr);
			}else{
				isAllYjSubmit = true;
			}
		});
		return isAllYjSubmit;
	}
	return true;
}

/**
beforeWorkFlowSubmit(arg1,arg2)
							arg1								arg2
拟稿提交						processDefinitionKey 				outCome
拟稿保存						"saveDraft"							""
提交							taskId								outCome
保存							"saveTodo"							""
传阅							"circulation"						""
**/
function beforeWorkFlowSubmit(arg1,arg2){
	var ischange = document.getElementById("ischange").value;
	var stuate = document.getElementById("stuate").value;
	var stuate_value = document.getElementById("stuate_value").value;
	var codeType = document.getElementById("eventType").value;
	var hycs = document.getElementById("hycs").value;
	if(ischange == "0" && stuate ==""){//没有发生变化
		getRealHycs(codeType,hycs);
	}else if(ischange == "1"){//发生变化  释放code和获得code
		if(stuate == ""){
			getRealHycs(codeType,hycs);
		}else if(stuate !="" && hycs !=""){
			disableCode(stuate,stuate_value);
			getRealHycs(codeType,hycs);
		}else if(stuate !="" && hycs ==""){
			disableCode(stuate,stuate_value);
		}
	}
	$("select").removeAttr("disabled");
	$("input").removeAttr("disabled");
	$("textarea").removeAttr("disabled");
	return true;
}
		function generateWord(){
			var czxmlb = jQuery("#purchase_list").getDataIDs();
				var count  = czxmlb.length;
				for(var i = 0; i<count;i++){
					var rowData = $("#purchase_list").jqGrid("getRowData", czxmlb[i]);
					var spr = rowData.zhuangtai;
					if(spr == "意见汇总中"){
						alert("您有项目正在意见汇总中不能进行此操作！");
						return ;
					}
				}
			<%if(StringUtils.equals("investment",hyxx.getHylx())){%>
			    wordTemplate('cjwhyjyTemplate', document.getElementById("myform"),false,true, "承继投资审批委员会备案信息汇总");
		    <%}else{%>
			    wordTemplate('zcczSummary', document.getElementById("myform"),false,true, "资产处置审批委员会备案信息汇总");
		    <%}%>
		}
		
		function viewBahz(){
			wordTemplate('zcczSummary', document.getElementById("myform"),true,false, "资产处置审批委员会备案信息汇总");
		}
		
		function wordExtForbahzReport(){
		    <%if(StringUtils.equals("investment",hyxx.getHylx())){%>
			    $.post("<%=basePath %>zccz/dealToDo_getZhenWen.do",{
			    		"hyxx.Id" : "<%=hyxx.getId()%>", 
			    		"hyxx.hylx" : "<%=hyxx.getHylx()%>"
			    	},function(returnStr){
			    		returnObj = eval('(' + returnStr + ')');
					    //document.all.myword.wordsetfield("hyqs",returnObj.hyqs);
			    		//alert("会议次数:" + returnObj.hyqs);
					    //document.all.myword.wordsetfield("zqs",returnObj.zqs);
			    		//alert("总次数:" + returnObj.zqs);
			    		//alert("会议日期:" + returnObj.hyrq);
					    document.all.myword.wordsetfield("hyrq",returnObj.hyrq);
					    //alert("会议时间:" + returnObj.hysj);
					    document.all.myword.wordsetfield("hysj",returnObj.hysj);
			    		document.all.myword.wordsetfield("hydd",returnObj.hydd);
			    		//alert("会议地点:" + returnObj.hydd);
					    document.all.myword.wordsetfield("hyzc",returnObj.hyzc);
			    		//alert("会议主持人:" + returnObj.hyzc);
					    document.all.myword.wordsetfield("cxry",returnObj.cxry);
			    		//alert("会议出席:" + returnObj.cxry);
					    document.all.myword.wordsetfield("wcxry",returnObj.wcxry);
			    		//alert("会议未出席:" + returnObj.wcxry);
					    document.all.myword.wordsetfield("jcy",returnObj.jcy);
			    		//alert("会议监察人:" + returnObj.jcy);
					    document.all.myword.wordsetfield("hyjyzlr",returnObj.hyjyzlr);
			    		//-------------alert("会议整理人:" + returnObj.hyjyzlr);
					    document.all.myword.wordsetfield("zhengwen",returnObj.zhengwen);
			    		//alert("会议次数正文:" + returnObj.zhengwen);
					    document.all.myword.wordsetfield("fsbm",returnObj.fsbm);
			    		//alert(" 部门:" + returnObj.fsbm);
					    document.all.myword.wordsetfield("dqrq",returnObj.dqrq);
			    		//alert("当前日期:" + returnObj.dqrq);
			    });
		    <%}else{%>
			    $.post("<%=basePath %>zccz/dealToDo_getZhenWen.do",{
			    		"hyxx.Id" : "" + $("#id").val(),
			    		"hyxx.hylx" : "<%=hyxx.getHylx()%>"
			    	},function(returnStr){
				    document.all.myword.wordsetfield("hycs",$("#hycs").val());
				    document.all.myword.wordsetfield("spsj",$("#spsj").val());
				    document.all.myword.wordsetfield("spzcr",$("#zcrxm").val());
				    document.all.myword.wordsetfield("hyjyzlr",$("#hyjyzlrxm").val());
				    document.all.myword.wordsetfield("zhengwen",returnStr);
			    });
		    <%}%>
		}

		function changeHycs(){
			$("#circulationTitle").val("[传阅] " + $("#hycs").val());
		}
</script>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zcczshWorkflow";
	actionPath = "zcczshWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
</head>
<body >
<script type="text/javascript">
$.ajaxSetup({
	async : false
});
</script>
  <%@ include file="/inc/word.inc"%>
<s:form action="" theme="simple" id="myform" name="myform">
	<div align="center">
		<span class="STYLE7 STYLE1">组织安排会议</span>
	</div>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="hyxx.Id"  />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:depthidden view="N" name="deptid"  />
<r:userhidden/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:hidden name="hyxx.id" id="id"/>
<s:hidden name="hyxx.sffscl"/>
<s:hidden name="huiyicishu" id="huiyicishu"/>
<s:hidden name="huiqiancishu" id="huiqiancishu"/>
<s:hidden name="fenlei" id="fenlei"/>
<s:hidden name="hyxx.spzt"/>
<s:hidden name="hyxx.lcId" id="lcId" />
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->

<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/dealToDo_saveHyxx.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader+"did.do"%>"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader+"did.do"%>"/>
<input type="hidden" id="zcrQrOutCome" name="zcrQrOutCome" value="主持人确认"/>
<input type="hidden" id="zcrQrNextTodoUrl" name="zcrQrNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="zcrQrDidUrl" name="zcrQrDidUrl" value="<%=urlHeader+"did.do"%>"/>

<input type="hidden" id="zcrSpOutCome" name="zcrSpOutCome" value="主持人审批"/>
<input type="hidden" id="zcrSpNextTodoUrl" name="zcrSpNextTodoUrl" value="zcczshWorkflow/zcczshWorkflow_zcrspTodo.do"/>
<input type="hidden" id="zcrSpDidUrl" name="zcrSpDidUrl" value="<%=urlHeader+"did.do"%>"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/dealToDo_modifyMeeting.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="hyxx.id" />"/>
<input type="hidden" name="circulationTitle" id="circulationTitle" value="[传阅] <s:property value="hyxx.hycs" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="采购会签办理单"/>
<input type="hidden" name="counterSignUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do?headId=<%=headId%>"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<!-- 
	<s:submit value="保存" onclick="forSubmit();"/>
	<input type="button" value="取消会议" onclick="forCancel();"/>
 -->	
 <!-- ========jf add   关于会议，会签次数的隐藏域 -->
 <input type="hidden" name="stuate" value=""/><!-- biaodanzhuangtai为0时此值为空。有值的话表示已经创建 -->
 <input type="hidden" name="stuate_value" value=""/> <!-- biaodanzhuangtai为0时此值为空.有值的话表示已经创建的会议次数 -->
<input type="hidden" name="ischange" value="0"/><!-- 0表示没有发生变化  1表示发生变化 -->
<input type="hidden" name="qidongoabiaozhi" value=""/>
<s:hidden type="hidden" name="hyxx.hylx" id="hylx" />
 	<hr color="#6600CC" align="center" width="100%" />
	<table width="100%" id="ruler" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
	 	<tr>
			<td class="td_zxy01"><font color="red"><strong>*</strong></font>审批方式：</td>
			<td class="td_zxy02">
				<e:select parRefKey="DISPOSE_APPROVE_METHOD" onchange="getHycs()" headerKey="" headerValue="" list="#{}" name="hyxx.CSpfs" id="eventType"/>
			</td>
			<td class="td_zxy01">会议次数：</td>
			<td class="td_zxy02"><r:textfield name="hyxx.hycs" id="hycs" theme="simple" cssClass="input" onchange="changeHycs()" /></td>
		</tr>
		<tr>
			<td class="td_zxy01"><font color="red"><strong>*</strong></font>审批主持人：</td>
			<td class="td_zxy02">
				<r:textfield id="zcrxm" name="hyxx.zcrxm" theme="simple" cssClass="input" />
				<s:hidden id="spzcr" name="hyxx.spzcr"/>
				<s:hidden id="zcrbmid" name="hyxx.zcrbmid"/>
				<s:hidden id="zcrbmmc" name="hyxx.zcrbmmc"/>
			<e:pc id="zcrxmButton">
				<img id="zcrxmImg" src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" 
				onclick="chooseZcrOrSpwy('true');" width="21" height="20" />
			</e:pc>
			</td>
			<td class="td_zxy01"><font color="red"><strong>*</strong></font>会议纪要整理人：</td>
			<td class="td_zxy02">
				<r:textfield name="hyxx.hyjyzlrxm" id='hyjyzlrxm' maxlength="10" readonly="true" cssClass="input" />
	      		<s:hidden name='hyxx.hyjyzlr' id='hyjyzlr'></s:hidden>
				<s:hidden name="hyxx.hyjyzlrbmid" id="hyjyzlrbmid" />
				<s:hidden name="hyxx.hyjyzlrbmmc" id="hyjyzlrbmmc" />
			<e:pc id="hyjyzlrxmButton">
	        	<img id="hyjyzlrxmImg" src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType();" width="21" height="20" align="absmiddle"/>
	        </e:pc>
			</td>
		</tr>
		<tr>
			<td class="td_zxy01">会议时间：</td>
			<td class="td_zxy02" colspan="3">
				<r:textfield name="hyxx.spsj" id="spsj" cssStyle="width:200;" readonly="true"/>
				(备注:安排会议环节填写）
			</td>
		</tr>
		<tr>
			<td class="td_zxy01">会议地点：</td>
			<td class="td_zxy02" colspan="4">
				<r:textfield name="hyxx.hydd" id="hydd" cssClass="input2" />
			</td>
		</tr>
	</table>
	<%@ include file="/inc/according.inc"%>  
	<e:opinion id="test" width="100%">
		<e:opinionPart id="COMPERE" biaodanid="%{#request.biaodanid}"  name="COMPERE" value="" text="主持人意见："></e:opinionPart>
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
		<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	</e:opinion>
	<table id="purchase_list"> </table>
	<%@ include file="/inc/listMessage.inc"%>
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchase_list").jqGrid({				
	url:"<%=basePath %>zccz/dealToDo_findZCXMsByMeeting.do?hyId=${hyxx.id}&itemType=${itemType}",
	datatype: "json",
   	colNames:['id','汇报人','项目名称','审批委员','项目状态'],
	colModel:[
		{name:'id',index:'id',align:"center",hidden:true},
		{name:'hbrxm',index:'tache',width:'35%'},
		{name:'czxmmc',index:'theme'},
		{name:'spwy',index:'tache'},
		{name:'zhuangtai',index:'zhuangtai',width:'35%'}
		],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	rowNum:0,
	viewrecords:true,
	gridComplete:function(){
		jQuery("#purchase_list").tableDnDUpdate();
		yicangcuishou();
	},
	caption: '处置项目列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	ondblClickRow:function(gr){
		showInfo(gr);
	}
});
function yicangcuishou(){
		var flag = "1";//1:表示所有项目委员提交完毕 0 表示有在委员提交意见中
	    var czxmlb = jQuery("#purchase_list").getDataIDs();
		var count  = czxmlb.length;
		for(var i = 0; i<count;i++){
			var rowData = $("#purchase_list").jqGrid("getRowData", czxmlb[i]);
			var spr = rowData.zhuangtai;
			if(spr == "委员提交意见中"){
				flag = "0";
				return ;
			}
		}
		
		if(flag == "1"){
			window.parent.removeById("cuijiaoyijian");
			//$("#cuijiaoyijian").hide();
		}
		
}
	$("#purchase_list").tableDnD({ 
	    onDrop: function(table, row) { 
			var posturl= '<%=basePath %>zccz/dealToDo_sortOrder.do';
			//alert(posturl)
			var orderstring =$.tableDnD.serialize() ;   
	        $.post( posturl, orderstring, function(message,status) {  
	            if(status !== 'success') {        
	                alert(message);        
	              }          
	            })         
	       }     
	  }); 
function showInfo(gr){
	/*
	var url= jQuery("#todo_list").getCell(gr,'url');
	var taskId=jQuery("#todo_list").getCell(gr,'taskId');
	var procInstId = jQuery("#todo_list").getCell(gr,'procInstId');
	url="<%=basePath%>"+url+"?taskId="+taskId+"&pkId="+procInstId;
	window.open(url,'_self');
	*/
	//alert(gr);
	var url="<%=basePath %>zccz/dealToDo_viewItemInfo.do?id="+gr;
	//window.open(url,'_self');
	window.open(url);
}
function xmzengjia(){//增加
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_init.do?hyId=${hyxx.id}&fenlei=${fenlei}&itemType=${itemType}";//弹出项目列表
	//alert(url);
	//alert("<%=(String)request.getAttribute("itemType")%>");
	//var url = "<%=basePath %>zccz/dealToDo_findZCXMsByMeeting.do?hyId=${hyxx.id}&itemType=${itemType}";
	window.open(url);
}
function xmjianshao(){//减少
	var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	var obj = jQuery("#purchase_list").jqGrid('getDataIDs');
	var records = obj.length;
	//alert(gr);
	//alert(records);
	var selectId = gr.length;
	if((records - selectId) == 0){
		alert("不能删除全部的处置项目!");
		return false;
	}
	if( gr.length == 1&&gr[0].length ==0 ){
		alert("没有可以选择的处置项目！");
	}else if(gr.length>0){
		var url = "<%=request.getContextPath()%>/zccz/dealToDo_delXm.do";
		$.post(url,{ids:"" + gr + "",hyId:'${hyxx.id}'}, function(data){
			reloadJqGrid();
			alert("删除成功!");
		});
	}else if(gr.length==0){
		alert("请选择处置项目!");
	}
}
function xmshangyi(){//上移
	var sortType = "1";
	sortXm(sortType);
}
function sortXm(sortType){
	var xmId = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	if(xmId.length==1&&xmId[0]==""){
		alert("没有项目!");
	}else if(xmId.length==1&&xmId[0]!=""){
		var url = "<%=request.getContextPath()%>/zccz/dealToDo_sortXm.do";
		$.post(url,{sortType:"" + sortType + "",xmId:"" + xmId + "",hyId:'${hyxx.id}'}, function(message){
			reloadJqGrid();
			if(message!=""&&message.length>0){
				alert(message);
			}
		});
	}else{alert("请选择要排序的项目，并且只能选择一个!");}
}
function xmxiayi(){//下移
	var sortType = "2";
	sortXm(sortType);
}
function xmzhiding(){//置顶
	var sortType = "3";
	sortXm(sortType);
}
function xmzhidi(){//置底
	var sortType = "4";
	sortXm(sortType);
}
function xmweiyuanxiugai(){//修改审批委员
	var xmIds = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	if( xmIds.length == 1&&xmIds[0].length ==0 ){
		alert("没有可以选择的处置项目！");
	}else if(xmIds.length==0){
		alert("请选择处置项目！");
	}else{
		chooseZcrOrSpwy("false");//false为修改委员
	}
}
// 刷新
function reloadJqGrid(){
	jQuery("#purchase_list").trigger("reloadGrid");
}	
function callBackXm(ids){
	var url = "<%=request.getContextPath()%>/zccz/dealToDo_addXm.do";
	var taskName = "<%=workflowVO.getTaskName()%>";
	var flag ="N";
	if(taskName != "会议组织"){
		flag ="Y";
	}else{// 会议组织环节
		var czxmlb = jQuery("#purchase_list").getDataIDs();
		var count  = czxmlb.length;
		for(var i = 0; i<count;i++){
			var rowData = $("#purchase_list").jqGrid("getRowData", czxmlb[i]);
			var zhuangtai = rowData.zhuangtai;
			if(zhuangtai == "上会中"){
				flag = "Y";
				break;
			}
		}
	}
	$.post(url,{ids:"" + ids + "",hyId:'${hyxx.id}',flag:""+flag+""}, function(data){
		reloadJqGrid();
	});
}

//发消息提醒
function message(){
		var url = "<%=basePath%>/zccz/dealToDo_sendMessageToWtjSpwy.do";
		 $.post(url,{
		 	hyId : "${hyxx.id}" 
		 },function(returnStr){
		 	if("SUCCESS" == returnStr){
		 		alert("发送消息成功!");
		 	}else{
		 		alert("发送消息失败!");
		 	}
		 });
	}
//结束会议	
function endMeeting(){
	var hyId = document.getElementById("hyxx.id").value;
	var url = "<%=basePath%>/zccz/dealToDo_endMeeting.do";
	$.post(url,{hyId:"" + hyId + ""}, function(message){
		alert(message);
		if(message == "success"){
			alert("");
		}
		if(message == "fail"){
			alert("有审批委员正在提交意见，不能结束会议!");
		}
	});	
}	
//*****************************************************
</script>
