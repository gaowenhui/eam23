<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String headId = (String)request.getAttribute("headId");
	String userName = String.valueOf(request.getAttribute("userName"));
	String userTid = (String) request.getAttribute("userTid");
%>
<r:controlfile file="/pages/eam2/zccz/know/know.ctl.xml"></r:controlfile>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<html>
<head>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "evalKnowWorkflow";
	actionPath = "evalKnowWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp" %>
<script type="text/javascript">

$(document).ready(function(){	
	window.parent.clearPanelTool();

	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
	//----------------------------------------表体按钮--------------------------------------------	
	<e:pc id="knowList">
	var buttonJSonString = '[{"buttonHandler":"seeOperate","buttonIcon":"icon-edit","buttonText":"知识库维护"},\
							 {"buttonHandler":"seeBefore","buttonIcon":"icon-search","buttonText":"查看变动前"}\
							]';
	addButtons(jQuery("#gview_knowList > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	//----------------------------------------办理依据按钮-----------------------------------------
	<e:pc id="blyj_reason_list">
	var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
	]';
	addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	</e:pc>
	//----------------------------------------附件上传按钮-----------------------------------------
	<e:pc id="file_list">
	var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
								{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                       			{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
	]';
	addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
	</e:pc>
	// ----------------------------------------办结-----------------------------------------------
  	<e:pc id="banjie">
	var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.queding","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
	window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
  	</e:pc>
	//------------------------------------------生成编号----------------------------------------------
	<e:pc id="scbh">
	var headBHGen = document.getElementById("bianhao").value;
	if(headBHGen == null || headBHGen.length == 0){
		var buttonStr_stztcz5 = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
		window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
	}
	</e:pc>
	//----------------------------------------设定宽度--------------------------------------------
	jQuery("#file_list").setGridWidth($("#knowWhith").width());
	jQuery("#blyj_reason_list").setGridWidth($("#knowWhith").width());
	jQuery("#knowList").setGridWidth($("#knowWhith").width());
		$(window).bind('resize', function(){
			jQuery("#file_list").setGridWidth($("#knowWhith").width());
			jQuery("#blyj_reason_list").setGridWidth($("#knowWhith").width());
			jQuery("#knowList").setGridWidth($("#knowWhith").width());
		});
	});
	
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form id="myform" >
<s:hidden name="headId" id="headId" value="%{#request.head.id}"></s:hidden>
<s:hidden name="head.id" id="head.id" value="%{#request.head.id}"></s:hidden>
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden/>
<r:depthidden/>
		
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/knowHead_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/knowHead_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/knowHead_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/knowHead_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/knowHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>

<br><div align="center">
<span class="STYLE7 STYLE1">中国建银投资有限责任公司审查知识库维护处理单</span>
</div><br>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>

<hr color="#6600CC" align="center" width="100%">
	
<!-- ------------------------------- 表头信息 --------------------------------- -->
<table class="newtable"  width="100%" border="0" cellspacing="0" id="knowWhith">
	<tr>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>标 题：</td>
		<td class="td_zxy02" colspan="3">
			<r:textfield name="head.biaoti" id="biaoti" cssClass="input2" value="%{#request.head.biaoti}"/>
		</td>
	</tr>	
	<tr>
		<td class="td_zxy01" width="120">编号：</td>
		<td class="td_form02"><s:textfield name="head.bianhao" cssClass="input" id="bianhao" disabled="true"/></td>
		<td class="td_zxy01">急缓程度：</td>
		<td class="td_zxy02"><r:select name="head.jhcd" id="jhcd" list="#{'0':'一般','1':'急','2':'特急'}"></r:select></td>
	</tr>	
	<tr>
		<td class="td_zxy01" width="120">拟稿人：</td>
		<td class="td_zxy02">
			<s:textfield name="head.nigaorenxm" id="nigaorenxm" cssClass="input" value="%{#request.head.nigaorenxm}" disabled="true"/>
			<s:hidden name="head.nigaoren" id="nigaoren"></s:hidden>	
		</td>
		<td class="td_zxy01" width="120"><font color="red" ><strong>*</strong></font>联系电话：</td>
		<td class="td_zxy02">
			<r:textfield name="head.lxdh" id="lxdh" onblur="checkPhone(this)" cssClass="input" value="%{#request.head.lxdh}"/>
		</td>
	</tr>	
	<tr>
	   	<td  class="td_zxy01" width="120">拟稿日期：</td>
	    <td class="td_zxy02">
		    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#request.head.ngrq}" disabled="true" />
	    </td>
	    <td  class="td_zxy01" width="120">拟稿部门：</td>
	    <td class="td_zxy02" colspan="3">
	    	<e:dept userTid="<%=userTid%>" list="#{}" name="head.ngbm" id="ngbm"  /></td>
			<s:hidden name="head.ngbmmc" id="ngbmmc" ></s:hidden>
	    </td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<e:pc id="anniu"><input type="button" value="同  意" onclick="tongyi();" class="buttonface" >&nbsp;
			<input type="button" value="不同意" onclick="butongyi();" class="buttonface" >&nbsp;</e:pc>
		</td>
	</tr>
</table>

<!-- ------------------------------- 表体信息 --------------------------------- -->
<table id="knowList" ></table>
	
<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>

<!-- ------------------------------- 意 见 域 --------------------------------- -->
<e:opinion id="test" width="100%">
	<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
</e:opinion>

<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/inc/file.inc"%>

</s:form>	
</body>
</html>

<script type="text/javascript">
var headId = document.getElementById('headId').value;
jQuery("#knowList").jqGrid({
	url:"<%=basePath%>zccz/knowBody_queryBody.do?headId="+headId,
	datatype: "json",
	mtype:"POST",
   	colNames:['id','变动方式','变动前值', '变动后值' ,'审批结果'],
   	colModel:[
   		{name:'id',index:'id',editable:true,hidden:true},
   		{name:'bdfs',index:'bdfs',align:'center',width:100},
   		{name:'bdqz',index:'bdqz',align:'center',width:220},
   		{name:'bdhz',index:'bdhz',align:'center',width:220},
   		{name:'spjg',index:'spjg',align:'center',width:100}
   	],
   	rowNum:0,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '知识库维护列表',
	toolbar: [false,"top"],
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});

// 提交时候select 变为不是disable
function beforeWorkFlowSubmit(){
	$("input").removeAttr("disabled");	
	$("textarea").removeAttr("disabled");	
	$("select").removeAttr("disabled");	
	return true;
}

// 保存表头
function saveHead(){
	myform.action="<%=basePath%>zccz/knowHead_saveHead.do";
}

// 查看维护之前
function seeBefore(){
	var headId = document.getElementById('headId').value;
	var type = 'height=600, width=800,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0';
	var url = '<%=basePath%>zccz/knowQuery_query.do';
	window.open(url,'知识库',type);
}

// 对知识库进行维护
function seeOperate(){
	var userName = '<%=userName%>';
	if(userName != null && userName!='' && userName != 'null'){
		alert('目前已有一份知识库维护单在由'+userName+'处理，处理完成前无法再次发送维护单');
		return false;
	}
	var headId = document.getElementById('headId').value;
	var type = 'height=600, width=800,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0';
	var url = '<%=basePath%>zccz/knowBody_openBody.do?headId='+headId;
	window.open(url,'知识库维护',type);
}

// 刷新表格
function reload(){
	jQuery("#knowList").trigger("reloadGrid");
}

// 同意
function tongyi(){
	var gr = jQuery("#knowList").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0 || gr==""){
		alert("请先选择!");
	}else{
		var tongyiURL = '<%=basePath%>zccz/knowBody_agree.do';
		$.post(tongyiURL,{bodyIds:"" + gr + "",isAgree:"" + 'yes' + ""}, function(data){
			jQuery("#knowList").trigger("reloadGrid");
		});
	}
}

// 不同意
function butongyi(){
	var gr = jQuery("#knowList").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0 || gr==""){
		alert("请先选择!");
	}else{
		var tongyiURL = '<%=basePath%>zccz/knowBody_agree.do';
		$.post(tongyiURL,{bodyIds:"" + gr + "",isAgree:"" + 'no' + ""}, function(data){
			jQuery("#knowList").trigger("reloadGrid");
		});
	}
}

// 确定
function queding(){
	var headId = document.getElementById('headId').value;
	var biaoti = document.getElementById('biaoti').value;
	var bianhao = document.getElementById('bianhao').value;
	var jhcd = document.getElementById('jhcd').value;
	var nigaorenxm = document.getElementById('nigaorenxm').value;
	var nigaoren = document.getElementById('nigaoren').value
	var lxdh = document.getElementById('lxdh').value;
	var ngrq = document.getElementById('ngrq').value;
	var ngbmmc = document.getElementById('ngbmmc').value;
	var ngbm = document.getElementById('ngbm').value;
	if(bianhao==''||bianhao==null){
		alert('请先生成编号');
		return false;
	}
	if(confirm('确定要提交'+'流程办结'+'吗？')){
		var headId = document.getElementById('headId').value;
		var quedingURL = '<%=basePath%>zccz/knowBody_writeToZSB.do';
		$.post(quedingURL,
			{headId:"" + headId + "",
			biaoti:"" + biaoti + "",
			bianhao:"" + bianhao + "",
			jhcd:"" + jhcd + "",
			nigaorenxm:"" + nigaorenxm + "",
			nigaoren:"" + nigaoren + "",
			lxdh:"" + lxdh + "",
			ngrq:"" + ngrq + "",
			ngbmmc:"" + ngbmmc + "",   
			ngbm:"" + ngbm + ""
		},function(data){
			if(data == '回写成功'){
				document.myform.action = document.getElementById("endUrl").value;
				document.myform.url.value = document.getElementById("endViewUrl").value;
				document.myform.sheetId.value = document.getElementById('bianhao').value;
				document.myform.taskId.value = '<%=workflowVO.taskId%>';
				document.myform.outCome.value = '流程办结';
				document.myform.submit();
			}
		});
	}
}

// 页面js验证
function checkEAMFormJSMethod(){
	var ids = jQuery("#knowList").jqGrid('getDataIDs');
	var title = document.getElementById("biaoti");
	var lxdh = document.getElementById("lxdh");
	if(title.value == null || title.value.length == 0){
		alert("标题不能为空！");
		title.focus();
      	return false;
    }
    if(lxdh.value == null || lxdh.value.length == 0){
    	alert("联系电话不能为空！");
    	lxdh.focus();
    	return false;
    }
    if(ids == null || ids.length == 0 || ids == ''){
    	alert("至少保存一条表体记录！");
    	return false;
    }
    return true;
}

function changeNgbmmc(){
	var dept = document.getElementById("ngbmbh");
 	var i =document.getElementById("ngbmbh").selectedIndex;
 	document.getElementById("ngbmmc").value =dept.options[i].text;
}

//生成编号
function createBianhao(){
	var headId = document.getElementById('headId').value;
	var url = "<%=basePath %>zccz/knowHead_createNum.do";
	$.post(url,{"headId":headId,"code":"sczsk"},function(data){
		document.getElementById("bianhao").value = data;
		window.parent.removeObj("#shengchenButton");
	});
}	
</script>