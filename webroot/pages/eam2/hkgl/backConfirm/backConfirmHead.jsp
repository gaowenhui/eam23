<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.rdp4j.common.util.DateUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String headId = (String)request.getAttribute("headId");
%>
<r:controlfile file="/pages/eam2/hkgl/backConfirm/backConfirm.ctl.xml"></r:controlfile>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回款确认</title>	
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "hkglWorkflow";
	actionPath = "hkglbldWorkflow";
%>
<script>
function commitWorkflow(taskId,outCome){
<%
	if(workflowVO.taskName.equals("承办部门综合处理")){
%>
		if(outCome=="拟稿部门综合处理"){
			document.getElementById("commitNextTodoUrl").value = "hkglWorkflow/hkglbldWorkflow_cbbmTodo.do";
			document.myform.result.value = 'xmslCommit';
			document.myform.action = "<%=request.getContextPath()%>/hkgl/backCash_saveHead.do";
			document.myform.nextTodoUrl.value = $("#commitNextTodoUrl").val();
			document.myform.didUrl.value = $("#commitDidUrl").val();
			document.myform.taskId.value = taskId;
			document.myform.outCome.value = outCome;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit(taskId,outCome);
	                if(!result) return;
	            }
        	}
			return true;
		} 
<%
	}
%>
	return true;
}
</script>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->

<script>
$(document).ready(function(){
	window.parent.clearPanelTool();
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
	//----------------------------------------确认信息按钮--------------------------------------------
	<e:pc id="HKQRXX">
		var buttonQueryJSonString = '[{"buttonHandler":"queryConfirm","buttonIcon":"icon-search","buttonText":"查看详细"}]';
		addButtons(jQuery("#gview_confirmInfoListInDept > .ui-jqgrid-titlebar"),buttonQueryJSonString);
	</e:pc>
	<e:pc id="CONHK">
	<%if(userType.equals("BMLD")){%>
		var buttonConfirmJsonString = '[{"buttonHandler":"confirmDept","buttonIcon":"icon-add","buttonText":"确认为部门最终意见"},\
										{"buttonHandler":"cancleConfirmDept","buttonIcon":"icon-remove","buttonText":"取消确认"}\
		]';
		addButtons(jQuery("#gview_confirmInfoListInDept > .ui-jqgrid-titlebar"),buttonConfirmJsonString);
	<%}%>
	</e:pc>
	//----------------------------------------设定宽度--------------------------------------------
	jQuery("#blyj_reason_list").setGridWidth($("#sss").width());
	jQuery("#file_list").setGridWidth($("#sss").width());
	jQuery("#confirmInfoListInDept").setGridWidth($("#sss").width());
    $(window).bind('resize', function(){
		jQuery("#blyj_reason_list").setGridWidth($("#sss").width());
		jQuery("#file_list").setGridWidth($("#sss").width());
		jQuery("#confirmInfoListInDept").setGridWidth($("#sss").width());
    });
});

// 提交前把disable去掉
function beforeWorkFlowSubmit(){
	$("input").removeAttr("disabled");	
	$("textarea").removeAttr("disabled");	
	$("select").removeAttr("disabled");	
	return true;
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form id="myform">
<s:hidden name="headId" id="headId" value="%{#request.head.id}"></s:hidden>
<s:hidden name="head.id" id="head.id" value="%{#request.head.id}"></s:hidden>
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden/>
<r:depthidden/>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="sss">
	<tr>
		<td><br>
			
<div align="center">
	<span class="STYLE1">中国建银投资有限责任公司回款办理单</span>
</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
<hr color="#6600CC" align="center" width="100%" />

<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/hkgl/backCash_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/hkgl/backCash_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/hkgl/backCash_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/hkgl/backCash_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="hkgl/backCash_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.title" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" />办理单"/>
<input type="hidden" name="counterSignUrl" value="hkgl/backConfirm_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<s:hidden name="head.lcmc" value="回款确认" />
<!-- =========================================================================== -->
<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
		<td colspan="3" class="td_zxy02"><r:textfield name="head.biaoti" id="biaoti" cssClass="input2"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">办理部门：</td>
		<td class="td_zxy02" colspan="3">
			<s:hidden id="blbmbh" name="head.blbmbh"/>
			<r:textfield id="blbm" name="head.blbm" id="blbm" cssClass="input2" readonly="true"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">拟 稿 人：</td>
		<td class="td_zxy02"><r:textfield name="head.ngrmc" id="ngrmc" disabled="true" cssClass="input"/>
			<s:hidden name="head.ngrbh"></s:hidden></td>
		<td class="td_zxy01">编&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
		<td class="td_zxy02"><r:textfield name="head.bianhao" id="bianhao" disabled="true" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02"><r:textfield name="head.ngbmmc" id="ngbmmc" disabled="true" cssClass="input"/>
			<s:hidden name="head.ngbmbh"></s:hidden></td>
		<td class="td_zxy01">拟稿日期：</td><s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
		<td class="td_zxy02"><r:textfield id="ngrq" disabled="true" name="head.ngrq" cssClass="input" value="%{#draftDate}"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" id="lxdh" cssClass="input" onblur="checkPhone(this)"/></td>
		<td class="td_zxy01">急缓程度：</td>
		<td class="td_zxy02"><r:select id="jhcd" name="head.jhcd"  list="#{'0':'一般','1':'急','2':'特急'}" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>到账金额：</td>
		<td class="td_zxy02"><r:textfield name="head.dzje" id="dzje" cssClass="input" onblur="checkFloat(this)"/></td>
		<td class="td_zxy01">到账日期：</td><s:date name="%{#request.head.dzrq}" format="yyyy-MM-dd" var="draftDate1"/>
		<td class="td_zxy02"><r:textfield name="head.dzrq" value="%{#draftDate1}" id="dzrq" readonly="true" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">汇 款 人：</td>
		<td class="td_zxy02"><r:textfield name="head.hkr" id="hkr" cssClass="input"/></td>
		<td class="td_zxy01">汇款单业务编号：</td>
		<td class="td_zxy02"><r:textfield name="head.hkdbh" id="hkdbh" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">进账单号：</td>
		<td class="td_zxy02"><r:textfield name="head.jzdh" id="jzdh" cssClass="input"/></td>
		<td class="td_zxy01">回款单状态：</td>
		<td class="td_zxy02"><r:textfield name="head.hkdzt" id="hkdzt" cssClass="input"/></td>
	</tr>
	<tr> 
        <td  class="td_zxy01" >资金来源：</td>
        <td class="td_zxy03" colspan="3">
            <r:textarea name="head.zjly" id="zjly" cssClass="area" style="width:92.5%;" rows="4"/>
        </td>
	</tr>
	<tr>
		<td class="td_zxy01">确认单类型：</td>
		<td colspan="3" class="td_zxy02">
			<label><input type="radio" name="confirmType" id="aaa1" value="1" checked="checked" />固定资产处置确认单</label>&nbsp;&nbsp;
			<label><input type="radio" name="confirmType" id="aaa4" value="2" />固定资产租赁确认单</label>&nbsp;&nbsp;
			<label><input type="radio" name="confirmType" id="aaa2" value="3" />承继债券投资回收款确认单</label>&nbsp;&nbsp;
			<label><input type="radio" name="confirmType" id="aaa3" value="4" />承继股权投资回收款确认单</label>&nbsp;&nbsp;
			<label><input type="radio" name="confirmType" id="aaa5" value="5" />其他业务收款确认单</label>&nbsp;&nbsp;
			<e:pc id="TXQRD"><label><input type="button" value="编辑确认单" class="buttonface" onclick="queren()" /></e:pc>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>

<!-- ------------------------------- 确认信息 --------------------------------- -->
<table id="confirmInfoListInDept"></table>

<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>

<!-- ------------------------------- 意 见 域 --------------------------------- -->
<e:opinion id="test" width="100%">
	<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="办理部门意见："></e:opinionPart>
	<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
	<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
</e:opinion>

<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/inc/file.inc"%>
</s:form>

<script>
var deptId = '<%=dept.getTid()%>';
var headId = '<%=headId%>';
jQuery("#confirmInfoListInDept").jqGrid({
	url:"<%=basePath%>hkgl/backConfirm_findConfirmInfoInDept.do?headId="+headId+"&deptId="+deptId,
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','确认部门编号','确认部门名称','确认人编号','确认人名称', '确认单类型','确认日期','是否部门最终确认'],
	colModel: [
		{name: 'id',index: 'id',align: "center",hidden:true },
		{name: 'qrbmbh',index: 'qrbmbh',align: "center",hidden:true },
		{name: 'qrbmmc',index:'qrbmmc',align:'center'},
		{name: 'qrrbh',index: 'qrrbh',align: "center",hidden:true},
		{name: 'qrrmc',index: 'qrrmc',align: "center"},
		{name: 'qrdlx',index: 'qrdlx',align: "center"},
		{name: 'qrrq',index: 'qrrq',align: "center"},
		{name: 'isbmhk',index: 'isbmhk',align: "center"}
	],
	rowNum:0,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '部门内确认列表',
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

// 打开树
function openTreeByType(type4jygdzc){//打开树，根据类型打开类型  
	if(type4jygdzc =='blbm'){
		isSYBMorGLBM = type4jygdzc;
		type4jygdzc = 'department';
	}
	var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + document.getElementById("blbmbh").value;
	var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
	window.open(url,'',_g_privateDialogFeatures);
}
// 关闭树以后的回调发方法，得到办理部门和办理部门编号
function getCallBack4Tree(ids,value){
	document.getElementById("blbm").value = value;
	document.getElementById("blbmbh").value = ids;
}

function queren(){
	var deptId = '<%=dept.getTid()%>';
	var deptName = '<%=dept.getDeptName()%>';
	var radio = document.getElementsByName('confirmType');
	var radioValue = '';
	var dzje = document.getElementById('dzje').value;
	for(var i = 0 ; i < radio.length;i++){
		if(radio[i].checked){
			radioValue = radio[i].value;
		}
	}
	var url = "<%=basePath%>hkgl/backConfirm_checkBodyByLx.do";
	$.post(url,{"headId":""+headId+"",radioValue:""+radioValue+""},function(returnStr){
		if(returnStr=="yes"){
			var type = 'height=800, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
			if(radioValue == '1'){
				var urlcz = '<%=basePath%>hkgl/backConfirm_openConfirm.do?type=chuzhi&headId='+headId+'&deptId='+deptId+'&deptName='+deptName+'&dzje='+dzje;
				urlcz = encodeURI(urlcz);
				window.open(urlcz,'',type);
				return false;
			}else if(radioValue == '2'){
				var urlqs = '<%=basePath%>hkgl/backConfirm_openConfirm.do?type=qingsuan&headId='+headId+'&deptId='+deptId+'&deptName='+deptName+'&dzje='+dzje;
				urlqs = encodeURI(urlqs);
				window.open(urlqs,'',type);
				return false;
			}else if(radioValue == '3'){
				var urlzq = '<%=basePath%>hkgl/backConfirm_openConfirm.do?type=zhaiquan&headId='+headId+'&deptId='+deptId+'&deptName='+deptName+'&dzje='+dzje;
				urlzq = encodeURI(urlzq);
				window.open(urlzq,'',type);
				return false;
			}else if(radioValue == '4'){
				var urlst = '<%=basePath%>hkgl/backConfirm_openConfirm.do?type=shiti&headId='+headId+'&deptId='+deptId+'&deptName='+deptName+'&dzje='+dzje;
				urlst = encodeURI(urlst);
				window.open(urlst,'',type);
				return false;
			}else if(radioValue == '5'){
				var type = 'height=200, width=700,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
				var urlqt = '<%=basePath%>hkgl/backConfirm_openConfirm.do?type=qita&headId='+headId+'&deptId='+deptId+'&deptName='+deptName+'&dzje='+dzje;
				urlqt = encodeURI(urlqt);
				window.open(urlqt,'',type);
				return false;
			}
		}else{
			alert('该回款已经添加了其他类型的确认单，无法再次编辑确认单！');
		}
	});
}

// 查看确认信息的明细
function queryConfirm(){
	var gr = jQuery("#confirmInfoListInDept").jqGrid('getGridParam','selarrrow');
	var qrdlx = jQuery("#confirmInfoListInDept").getCell(gr,'qrdlx');
	var qrrbh = jQuery("#confirmInfoListInDept").getCell(gr,'qrrbh');
	if(gr.length==1){
		var type = 'height=800, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
		var url = '<%=basePath%>hkgl/backConfirm_queryConfirmInfoOutDept.do?id='+gr+'&qrdlx='+qrdlx+'&qrrbh='+qrrbh;
		var urlEncode = encodeURI(url);
		window.open(urlEncode,'回款确认信息',type);
	}else{
		alert('请选择一条记录！');
		return false;
	}
}

// 把信息设为部门最终确认
function confirmDept(){
	var headId = '<%=headId%>';
	var qrbmbh = '<%=dept.getTid()%>';
	var gr = jQuery("#confirmInfoListInDept").jqGrid('getGridParam','selarrrow');
	if(gr.length==0 || gr.length>1){
		alert('请选择一条数据！');
		return false;
	}
	var url = "<%=basePath%>hkgl/backConfirm_confirmDept.do";
	$.post(url,{"headId":""+headId+"",confirmHeadId:""+gr+"",qrbmbh:""+qrbmbh+""},function(returnStr){
		if(returnStr!=""&&returnStr!=null){
			alert(returnStr);
			jQuery("#confirmInfoListInDept").trigger("reloadGrid");
		}
	});
}

// 把信息设为部门最终确认
function cancleConfirmDept(){
	var gr = jQuery("#confirmInfoListInDept").jqGrid('getGridParam','selarrrow');
	if(gr.length==0 || gr.length>1){
		alert('请选择一条数据！');
		return false;
	}
	var url = "<%=basePath%>hkgl/backConfirm_cancleConfirmDept.do";
	$.post(url,{confirmHeadId:""+gr+""},function(returnStr){
		if(returnStr!=""&&returnStr!=null){
			alert(returnStr);
			jQuery("#confirmInfoListInDept").trigger("reloadGrid");
		}
	});
}

function reloadConfirm(){
	jQuery("#confirmInfoListInDept").trigger("reloadGrid");
}
</script>
</body>
</html>