<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.rdp4j.common.util.DateUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String oaurl = (String)request.getAttribute("oaurl");
	String headId = (String)request.getAttribute("head.sheadId");
	String userTid = (String) request.getAttribute("userTid");
	boolean isNgbmzhcl = false;
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<r:controlfile file="/pages/eam2/wtdk/funcBack/funcBack.ctl.xml"></r:controlfile>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
		isNgbmzhcl = true;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "wtdkWorkflow";
	actionPath = "funcbackWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<script type="text/javascript">
$(document).ready(function(){	
	window.parent.clearPanelTool();
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
	
	<%if(!inCounterSign){%>
		//------------------------------------------查看正文----------------------------------------------
		<e:pc id="ckzw">
			var buttonStr_stztcz1 = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';	                       
			window.parent.prependButtonsFromChildren(buttonStr_stztcz1,"");
		</e:pc>	
		//------------------------------------------生成编号----------------------------------------------
		<e:pc id="shengcheng">
			var headBHGen = document.getElementById("bianhao").value;
			if(headBHGen == null || headBHGen.length == 0){
				var buttonStr_stztcz5 = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
			}else{
				//------------------------------------------合成正文----------------------------------------------
				<e:pc id="hczw">
			    	<%if(!status.equals("2")){%>
					var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
					window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
					<%}%>
				</e:pc>
			}
		</e:pc>
		// ----------------------------------------查看oa流程------------------------------------------
		<e:pc id="queryoa">
			var buttonStr_oastat = '[{"buttonHandler":"mainWindow.queryOA","buttonIcon":"icon-search","buttonText":"查看OA状态"}]';	                       
			var buttonStr_oaurl = '[{"buttonHandler":"mainWindow.queryOAurl","buttonIcon":"icon-search","buttonText":"查看OA表单"}]';	                       
			var buttonStr_startoa = '[{"id":"startoa","buttonHandler":"mainWindow.startOAflow","buttonIcon":"icon-save","buttonText":"开启oa流程"}]';	                       
			<%if(oaurl!=null){%>
				window.parent.appendButtonsFromChildren(buttonStr_oastat,"");
				window.parent.appendButtonsFromChildren(buttonStr_oaurl,"");
			<%}else{%>
				window.parent.appendButtonsFromChildren(buttonStr_startoa,"");
			<%}%>
	  	</e:pc>
		// ----------------------------------------办结-----------------------------------------------
	  	<e:pc id="banjie">
			var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.banjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
			window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
	  	</e:pc>
	  	//----------------------------------------表体按钮--------------------------------------------
		<e:pc id="funcBackList">
			var buttonJSonString = '[{"buttonHandler":"batchChoose","buttonIcon":"icon-add","buttonText":"增加"},\
									 {"buttonHandler":"batchOperate","buttonIcon":"icon-edit","buttonText":"修改"},\
									 {"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"}\
									]';
			addButtons(jQuery("#gview_funcBackList > .ui-jqgrid-titlebar"),buttonJSonString);
		</e:pc>
		//----------------------------------------办理依据按钮-----------------------------------------
		<e:pc id="blyj_reason_list">
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);   
		</e:pc>
		//----------------------------------------附件按钮--------------------------------------------
		<e:pc id="file_list">
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                		{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		</e:pc>
		//------------------------------------------生成正文----------------------------------------------
		<e:pc id="sczw">
			var buttonStr_zhengwen = '[{"id":"clzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
	<%}else{%>
		var buttonStr_stztcz1 = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';	                       
		window.parent.prependButtonsFromChildren(buttonStr_stztcz1,"");
	<%}%>
	
	//----------------------------------------设定宽度--------------------------------------------
	jQuery("#blyj_reason_list").setGridWidth($("#funcWhith").width());
   	jQuery("#funcBackList").setGridWidth($("#funcWhith").width());
   	jQuery("#file_list").setGridWidth($("#funcWhith").width());
   	jQuery("#file_huiqianlist").setGridWidth($("#funcWhith").width());
   	jQuery("#file_huiqian_endlist").setGridWidth($("#funcWhith").width());
    $(window).bind('resize', function(){
		jQuery("#blyj_reason_list").setGridWidth($("#funcWhith").width());
		jQuery("#funcBackList").setGridWidth($("#funcWhith").width());
		jQuery("#file_list").setGridWidth($("#funcWhith").width());
		jQuery("#file_huiqianlist").setGridWidth($("#funcWhith").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#funcWhith").width());
   	});
});

function checkEAMFormTitle(){
	var biaoti = document.getElementById("title");
	if(biaoti.value == null || biaoti.value.trim().length == 0){
	alert("标题不能为空！");
	biaoti.focus();
      return false;
    }
    return true;
}  
</script>
</head>
<body>
<%@ include file="/inc/word.inc"%>
<s:form id="myform" name="myform">
<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
<s:hidden  name="head.hqbmid" id="hqbmids"/>
<s:hidden  name="head.sheetType" id="sheetType"/>
<s:hidden name="head.sheadId" id="head.sheadId" value="%{#request.head.sheadId}"></s:hidden>
<s:set name="biaodanid" value="head.sheadId" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden/>
<r:depthidden/>
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/wtdk/funcBack_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/wtdk/funcBack_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/wtdk/funcBack_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/wtdk/funcBack_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="wtdk/funcBack_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.title" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.title" />会签办理单"/>
<input type="hidden" name="counterSignUrl" value="wtdk/funcBack_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>

<br><div align="center">
	<span class="STYLE7 STYLE1">中国建银投资有限责任公司正常基金划付台账<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
	
<hr color="#6600CC" align="center" width="100%">

<!-- ------------------------------- 表头信息 --------------------------------- -->
<table class="newtable" width="100%" border="0" align="center"
	cellpadding="0" cellspacing="0" id="funcWhith" >
	<tr>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>标 题：</td>
		<td class="td_zxy02" colspan="3"><r:textfield id="title" cssClass="input2" name="head.title"></r:textfield></td>
	</tr>
	<tr>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>呈 送：</td>
		<td class="td_zxy02" colspan="3"><r:textfield name="head.cs" id="cs" cssClass="input2" /></td>
	</tr>
	<tr>
		<td class="td_zxy01" width="120">编号：</td>
		<td class="td_zxy02"><s:textfield name="head.sheetId" id="bianhao" disabled="true" theme="simple" cssClass="input" ></s:textfield></td>
		<td class="td_zxy01" width="120">急缓程度：</td>
		<td class="td_zxy02"><r:select name="head.jhcd" id="jhcd" list="#{0:'一般',1:'急',2:'特急'}"></r:select>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿人：</td>
		<td class="td_zxy02"><s:textfield name="head.ngrmc" id="ngrmc" maxlength="10" disabled="true" cssClass="input"></s:textfield></td>
		<s:hidden name="head.ngrbh"></s:hidden>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" id="lxdh" onblur="checkPhone(this)" maxlength="15" cssClass="input"></r:textfield></td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿日期：</td><s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
		<td class="td_zxy02"><r:textfield id="ngrq" name="head.ngrq" disabled="true" cssClass="input" value="%{#draftDate}"/></td>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02"><e:dept userTid="<%=userTid%>" list="#{}" name="head.ngbmbh" id="ngbmbh"  /></td>
		<s:hidden name="head.ngbmmc" id="ngbmmc" ></s:hidden>
	</tr>
	<tr>
		<td class="td_zxy01">会签部门：</td>
    	<td class="td_zxy03" colspan="3" >
	    	<r:textfield name="head.hqbm" id="hqbmvalue" size="25" cssClass="input2" readonly="true"/>
	       	<e:pc id="huiqian">
	       	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('hqbm');" width="21" height="20" align="absmiddle"/>  
       		</e:pc>
       		<%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>
       	</td>
	</tr>
</table>

<div style="display: none">
<s:textfield name="eam2oa.status" id="status" cssClass="input"/>
<s:textfield name="eam2oa.url" id="oaurl" maxlength="10" cssClass="input"/>
</div>

<!-- ------------------------------- 表体信息 --------------------------------- -->
<table id="funcBackList"></table>

<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>  

<!-- ------------------------------- 意 见 域 --------------------------------- -->
<e:opinion id="test" width="100%">
	<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}"  value="" text="批示意见："></e:opinionPart>	
	<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}"  name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
	<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
	<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
	<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
</e:opinion>

<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
<%@ include file="/inc/file.inc"%>
<%@ include file="/inc/file_huiqian_end.inc"%>
<%@ include file="/inc/listMessage.inc"%>
</s:form>
<u><script type="text/javascript">
var headId = document.getElementById('headId').value;
jQuery("#funcBackList").jqGrid({
	url:"<%=basePath%>wtdk/funcBack_findBody.do?headId="+headId,
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','系统基金账号','基金客户名称','基金账户余额','贷款账号','还款单位','核算科目', '年初余额', '本次还款日期', '本次还款金额','本年累计还款金额','还款后本金余额','本次拟划付金额'],
	colModel: [
		{name: 'id',index: 'id',align: "center",hidden:true },
		{name: 'xtjjzh',index: 'xtjjzh',align: "center" },
		{name: 'jjkhmc',index:'jjkhmc',align:'center'},
		{name: 'jjzhye',index:'jjzhye',align:'center'},
		{name: 'dkzh',index: 'dkzh',align: "center" },
		{name: 'hkdw',index:'hkdw',align:'center'},
		{name: 'hskm',index: 'hskm',align: "center"},
		{name: 'ncye',index: 'ncye',align: "center"},
		{name: 'bjhkrq',index: 'bjhkrq',align: "center"},
		{name: 'bchkje',index: 'bchkje',align: "center"},
		{name: 'bnljhkje',index: 'bnljhkje',align: "center"},
		{name: 'hkhbjye',index: 'hkhbjye',align: "center"},
		{name: 'nhfje',index: 'nhfje',align: "center"}
	],
	rowNum:0,
	multiselect:true,
	ondblClickRow:function(gr){
		dbClickQuery(gr);
	},
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '基金退回列表',
	toolbar: [false,"top"],
	loadComplete:function(data){
		if(data && data.rows.length>0){
			jQuery("#funcBackList").setGridHeight(data.rows.length * 22 + 18);
		}else{
			jQuery("#funcBackList").setGridHeight(0);
		}
	},
	shrinkToFit:false,
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});

//表体添加
function addAss(){
	var headId = document.getElementById('headId').value;
	var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=80';
	window.open('<%=basePath%>wtdk/funcBack_addBody.do?headId='+headId,'基金退回信息',type);
}

// 修改表体
function modify(){
	var gr = jQuery("#funcBackList").jqGrid('getGridParam','selarrrow');
	if(gr.length == 2){
		if(gr[0] == 'undefined'||gr[0] == '' || gr[0] == null){
			gr = gr[1];
			var bodyId = gr;
			var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=80';
			window.open('<%=basePath%>wtdk/funcBack_addBody.do?headId='+headId+'&bodyId='+bodyId,'基金退回信息',type);
		}else{
			alert("请选择一条记录");
			return false;
		}
	}else{
		if(gr.length==1 && gr!=""){
			var bodyId = gr;
			var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=80';
			window.open('<%=basePath%>wtdk/funcBack_addBody.do?headId='+headId+'&bodyId='+bodyId,'基金退回信息',type);
		}else{
			alert('请选择一条记录！');
			return false;
		}
	}
}

//表体删除
function delAss(){
	var gr = jQuery("#funcBackList").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0 || gr==""){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var delurl = '<%=basePath%>wtdk/funcBack_deleteBody.do';
			$.post(delurl,{bodyIds:"" + gr + ""}, function(data){
				jQuery("#funcBackList").trigger("reloadGrid");
			});
		}
	}
}

function dbClickQuery(gr){
	var headId = document.getElementById('headId').value;
	var bodyId = gr;
	var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=80';
	window.open('<%=basePath%>wtdk/funcBack_funcQueryDetail.do?headId='+headId+'&bodyId='+bodyId,'基金退回信息',type);
}

// 提交表单
function tijiao(){
	myform.action = '<%=basePath%>wtdk/funcBack_saveHead.do';
}

// 刷新表格
function reloadBody(){
	jQuery("#funcBackList").trigger("reloadGrid");
}

// 生成编号
function createBianhao(){
	if(document.getElementById("bianhao").value!=""){
		alert("已生成编号！");
		return false;
	}
	var headId = document.getElementById('headId').value;
	var url = "<%=basePath%>wtdk/funcBack_funcBackCode.do";
	var ngbmmc = document.getElementById("ngbmmc").value;
	var ngbmbh = document.getElementById("ngbmbh").value;
	var headId = document.getElementById('headId').value;
	$.post(url,{"ngbmmc":ngbmmc,"ngbmbh":ngbmbh,"headId":headId},function(data){
		$('#bianhao').val(data);
		window.parent.removeObj("#shengchenButton");
		var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
	});
}

// 批量选择打开页面
function batchChoose(){
	//var headId = document.getElementById('headId').value;
	var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=80';
	window.open('<%=basePath%>wtdk/funcBack_openBatchChoose.do?batch=true','基金退回信息',type);
}

// 批量选择后回调方法
function callBackBatch(hkrq,lnNo){
	var url = "<%=basePath%>wtdk/funcBack_batchChoose.do";
	var headId = document.getElementById('headId').value;
	$.post(url,{hkrqs:"" + hkrq + "",lnNos:"" + lnNo + "",headId:"" + headId + ""}, function(data){
		if(data!=null&&data!=''){
			alert(data);
			jQuery("#funcBackList").trigger("reloadGrid");
		}
	});
}

// 批量操作打开页面
function batchOperate(){
	var gr = jQuery("#funcBackList").jqGrid('getGridParam','selarrrow');
	if(gr.length==0){
		alert('请至少选择一条记录');
	}else{
		var type = 'height=600, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=80';
		window.open('<%=basePath%>wtdk/funcBack_openBatchOperate.do?bodyIds='+gr,'基金退回信息',type);
	}
}

// 批量操作后的回调方法
function callBackOperate(bodyIds,nhfje,spje,spjg,bz){
	var url = "<%=basePath%>wtdk/funcBack_batchOperate.do";
	var headId = document.getElementById('headId').value;
	$.post(url,{
		bodyIds:"" + bodyIds + "",
		nhfje:"" + nhfje + "",
		spje:"" + spje + "",
		spjg:"" + spjg + "",
		bz:"" + bz + ""},
 		function(data){
			if(data!=null&&data!=''){
				alert(data);
				jQuery("#funcBackList").trigger("reloadGrid");
			}
		}
	);
}

// 打开树
function openTreeByType(type4jygdzc){//打开树，根据类型打开类型 
	if(type4jygdzc =='hqbm'){
		isSYBMorGLBM = type4jygdzc;
		type4jygdzc = 'department';
	}
	var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + document.getElementById("hqbmids").value;
	var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
	window.open(url,'',_g_privateDialogFeatures);
}

function getCallBack4Tree(ids,value){
	document.getElementById("hqbmvalue").value = value;
	document.getElementById("hqbmids").value = ids;
}

// 提交时页面验证
function checkEAMFormJSMethod(){
	var ids = jQuery("#funcBackList").jqGrid('getDataIDs');
	var title = document.getElementById("title");
	var lxdh = document.getElementById("lxdh");
	var cs = document.getElementById("cs");
	var bianhao = document.getElementById("bianhao");
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
    if(cs.value == null || cs.value.length == 0){
    	alert("呈送不能为空！");
    	cs.focus();
    	return false;
    }
    if(('<%=workflowVO.taskName%>' == '拟稿部门综合处理') && (bianhao.value == null || bianhao.value.length == 0)){
    	alert('编号不能为空！');
    	bianhao.focus();
    	return false;
    }
    if(ids == null || ids.length == 0 || ids == ''){
    	alert("至少保存一条表体记录！");
    	return false;
    }
    return true;
}

// 提交时候select 变为不是disable
 function beforeWorkFlowSubmit(){
	$("input").removeAttr("disabled");	
	$("textarea").removeAttr("disabled");	
	$("select").removeAttr("disabled");	
	return true;
}

//办结
function banjie(){
	if(confirm('确定要提交流程办结吗？')){
		document.myform.action = document.getElementById("endUrl").value;
		document.myform.url.value = document.getElementById("endViewUrl").value;
		document.myform.taskId.value = '<%=workflowVO.taskId%>';
		document.myform.sheetId.value = document.getElementById('bianhao').value;
		document.myform.outCome.value = '流程办结';
		document.myform.submit();
	}
}

// 开启oa发文
function startOAflow(){
	var url = "<%=basePath%>wtdk/funcBack_startOAFlow.do";
	var ngrq = document.getElementById('ngrq').value;
	var ngr = document.getElementById('ngrmc').value;
	var zbbm = document.getElementById('ngbmmc').value;
	var title = document.getElementById('title').value;
	var EAMmsgid = '<%=headId%>';
	var yjwjurl = basePathJs+'wtdk/funcBack_modifyHead.do?headId='+'<%=headId%>';
	var nglx = '发文';
	$.post(url,{ngrq:"" + ngrq + "",ngr:"" + ngr + "",zbbm:"" + zbbm + "",
				yjwjurl:"" + yjwjurl + "",nglx:"" + nglx + "",EAMmsgid:""+EAMmsgid+"",
				title:""+title+""}, 
		function(data){
			if(data!=null&&data!=''){
				if(data=='发送不成功,请重新发送'){
					alert(data);
					return false;
				}else{
					window.parent.removeObj("#startoa");
					window.parent.appendButtonsFromChildren(buttonStr_oastat,"");
					window.parent.appendButtonsFromChildren(buttonStr_oaurl,"");
					window.open(data,'','');
				}
			}
		}
	);
}

// 查看oa状态
function queryOA(){
	var state = document.getElementById("status").value;
	alert(state);
}

// 查看oa表单
function queryOAurl(){
	var url = document.getElementById("oaurl").value;
	window.open(url,"","");
}

function changeNgbmmc(){
	var dept = document.getElementById("ngbmbh");
 	var i =document.getElementById("ngbmbh").selectedIndex;
 	document.getElementById("ngbmmc").value =dept.options[i].text;
}
//------------------------------------合成正文-------------------------------
//（处理）新建正文
function openzhengwen(){
	wordTemplate('bank_Template', document.getElementById("myform"),false,true, "正常基金划付台账正文"); 
	//修改按钮名称为“处理正文”
	window.parent.setHtml("#clzwButton .l-btn-text","处理正文");
	window.parent.setClass("#clzwButton .l-btn-text","l-btn-text icon-dealFile");
}
//查看正文
function viewzhengwen(){
	wordTemplate('bank_Template', document.getElementById("myform"),true,false,"正常基金划付台账正文"); 
}
//合成正文
function hechengzhengwen(){
	MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "正常基金划付台账正文",'hechengHead()','hechengBottom()');
	window.parent.removeObj("#hczwButton");
	window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
}
function hechengHead(){
	MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("cs").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("sheetType").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("title").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);

}
function hechengBottom(){
    var strDate = "<%=strDate%>";
	MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
	MyRangeBottom.find.execute("￥￥HCRQ",false,false,false,false,false,true,false,false, strDate,2,false,false,false,false);
	var headId=$("#headId").val();
	$.ajaxSetup({async:false});
	$.post("<%=basePath %>file/file_getFileList.do",{
		"bdid":headId
	},function(data){
		if(data != null && data.length != 0){
	        MyRangeBottom.find.execute("￥￥F_J",false,false,false,false,false,true,false,false, "附件：",2,false,false,false,false);
		}else{
		    MyRangeBottom.find.execute("￥￥F_J",false,false,false,false,false,true,false,false, "",2,false,false,false,false);
		}
		MyRangeBottom.find.execute("￥￥FJBTLIST",false,false,false,false,false,true,false,false, data,2,false,false,false,false);
	});
}
</script></u>
</body>
</html>