<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.rdp4j.common.util.DateUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String sfscgg = (String)request.getAttribute("sfscgg"); // 是否生成公告
	String headId = (String)request.getAttribute("headId");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
	String userTid = (String) request.getAttribute("userTid");
%>
<r:controlfile file="/pages/eam2/zccz/notice/notice.ctl.xml"></r:controlfile>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片新增</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zcczCzggWorkflow";
	actionPath = "zcczCzggWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
<meta http-equiv="pragma" content="no-cache"/>
<SCRIPT language=JavaScript type=text/JavaScript>
function checkEAMFormTitle(){
	var biaoti = document.getElementById("biaoti");
	if(biaoti.value == null || biaoti.value.trim().length == 0){
		alert("标题不能为空！");
		biaoti.focus();
		return false;
    }
    return true;
}  


$(document).ready(function(){
	window.parent.clearPanelTool();
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
	<%if(!inCounterSign){%>
		//------------------------------------------查看公告----------------------------------------------
		<e:pc id="ckgg">
			var buttonStr_stztcz5 = '[{"id":"ckggButton","buttonHandler":"mainWindow.viewNotice","buttonIcon":"icon-search","buttonText":"查看公告"}]';
			window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
		</e:pc>
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
		//----------------------------------------资产按钮--------------------------------------------
		<e:pc id="zclist">
			var buttonJSonString = '[{"buttonHandler":"addZC","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delZC","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"editZC","buttonIcon":"icon-edit","buttonText":"修改"},\
										{"buttonHandler":"cancelZC","buttonIcon":"icon-no","buttonText":"取消"},\
										{"buttonHandler":"saveZC","buttonIcon":"icon-ok","buttonText":"保存"}\
			]';
			addButtons(jQuery("#gview_zc_list > .ui-jqgrid-titlebar"),buttonJSonString);
		</e:pc>
		//----------------------------------------实体按钮--------------------------------------------
		<e:pc id="stlist">
			var buttonJSonString1 = '[{"buttonHandler":"addST","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delST","buttonIcon":"icon-remove","buttonText":"删除"},\
									{"buttonHandler":"editST","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"cancelST","buttonIcon":"icon-no","buttonText":"取消"},\
									{"buttonHandler":"saveST","buttonIcon":"icon-ok","buttonText":"保存"}\
			]';
			addButtons(jQuery("#gview_st_list > .ui-jqgrid-titlebar"),buttonJSonString1);
		</e:pc>
		//----------------------------------------债券按钮--------------------------------------------
		<e:pc id="zqlist">
			var buttonJSonString1 = '[{"buttonHandler":"addZQ","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delZQ","buttonIcon":"icon-remove","buttonText":"删除"},\
									{"buttonHandler":"editZQ","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"cancelZQ","buttonIcon":"icon-no","buttonText":"取消"},\
									{"buttonHandler":"saveZQ","buttonIcon":"icon-ok","buttonText":"保存"}\
			]';
			addButtons(jQuery("#gview_zq_list > .ui-jqgrid-titlebar"),buttonJSonString1);
		</e:pc>
		//----------------------------------------办理依据--------------------------------------------
		<e:pc id="bllist">
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
		</e:pc>
		//----------------------------------------附件按钮--------------------------------------------
		<e:pc id="fjlist">
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                		{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		</e:pc>
		//------------------------------------------处理正文----------------------------------------------
		<e:pc id="clzw">
			var buttonStr_zhengwen = '[{"id":"clzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		//------------------------------------------生成公告----------------------------------------------
		<e:pc id="scgg">
			var buttonStr_stztcz3 = '[{"id":"scggButton","buttonHandler":"mainWindow.generateNotice","buttonIcon":"icon-createFile","buttonText":"生成公告"}]';
			window.parent.prependButtonsFromChildren(buttonStr_stztcz3,"");
		</e:pc>
		//------------------------------------------编辑公告----------------------------------------------
		<e:pc id="bjgg">
			var buttonStr_stztcz4 = '[{"id":"bjggButton","buttonHandler":"mainWindow.editNotice","buttonIcon":"icon-edit","buttonText":"编辑公告"}]';
			window.parent.prependButtonsFromChildren(buttonStr_stztcz4,"");
		</e:pc>
		// -----------------------------------------办    结----------------------------------------------
	  	<e:pc id="banjie">
			var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.banjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
			window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
	  	</e:pc>
	<%}else{%>
		var buttonStr_stztcz1 = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';	                       
		window.parent.prependButtonsFromChildren(buttonStr_stztcz1,"");
		var buttonStr_stztcz5 = '[{"id":"ckggButton","buttonHandler":"mainWindow.viewNotice","buttonIcon":"icon-search","buttonText":"查看公告"}]';
		window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
	<%}%>
	//------------------------------------------判断是否已生成公告--------------------------------------
		if("<%=sfscgg%>" == "1"){
			window.parent.removeObj("#scggButton");
		}else if("<%=sfscgg%>" == "0"){
			window.parent.removeObj("#bjggButton");
		}
	//----------------------------------------设置宽度--------------------------------------------
	jQuery("#zc_list").setGridWidth($("#commonWidth").width());
	jQuery("#st_list").setGridWidth($("#commonWidth").width());
	jQuery("#zq_list").setGridWidth($("#commonWidth").width());
	jQuery("#blyj_reason_list").setGridWidth($("#commonWidth").width());
	jQuery("#file_list").setGridWidth($("#commonWidth").width());
	jQuery("#file_huiqianlist").setGridWidth($("#commonWidth").width());
	jQuery("#file_huiqian_endlist").setGridWidth($("#commonWidth").width());
    $(window).bind('resize', function(){
		jQuery("#zc_list").setGridWidth($("#commonWidth").width());
		jQuery("#st_list").setGridWidth($("#commonWidth").width());
		jQuery("#zq_list").setGridWidth($("#commonWidth").width());
		jQuery("#blyj_reason_list").setGridWidth($("#commonWidth").width());
		jQuery("#file_list").setGridWidth($("#commonWidth").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#commonWidth").width());
		jQuery("#file_huiqianlist").setGridWidth($("#commonWidth").width());
	});
	//----------------------------------------设置表格显示------------------------------------------
	var zclybm = document.getElementById('zclybm').value;
	if(zclybm=='0'){
		document.getElementById("div0").style.display="block";
		document.getElementById("div1").style.display="none";
		document.getElementById("div2").style.display="none";
	}else if(zclybm=='1'){
		document.getElementById("div0").style.display="none";
		document.getElementById("div1").style.display="block";
		document.getElementById("div2").style.display="none";
	}else if(zclybm=='2'){
		document.getElementById("div0").style.display="none";
		document.getElementById("div1").style.display="none";
		document.getElementById("div2").style.display="block";
	}
	//----------------------------------------设置日期显示------------------------------------------
	$("#fbrq").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
});


//验证标题为空
function checkEAMFormTitle(){
	var biaoti = document.getElementById("biaoti");
	if(biaoti.value == null || biaoti.value.trim().length == 0){
			alert("标题不能为空！");
			biaoti.focus();
      		return false;
    	}
   	return true;
}  
			
function changeNgbmmc(){
	var dept = document.getElementById("ngbm");
  	 	var i =document.getElementById("ngbm").selectedIndex;
  	 	document.getElementById("ngbmmc").value =dept.options[i].text;
}
function beforeWorkFlowSubmit(){
	$("input").removeAttr("disabled");	
	$("textarea").removeAttr("disabled");	
	$("select").removeAttr("disabled");	
	return true;
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="/inc/word.inc"%>
<s:form id="myform">
<s:hidden  name="head.hqbmid" id="hqbmids"/>
<s:hidden name="head.sfhcgg" id="sfhcgg"></s:hidden>
<s:hidden name="chooseData"/>
<s:set name="biaodanid" value="head.id" />
<s:hidden name="headId" id="headId" value="%{#request.head.id}"></s:hidden>
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="head.id"></s:hidden>
<s:hidden name="head.lcmc" id="lcmc"></s:hidden>
<r:depthidden/>
<r:userhidden/>
<br><div align="center">
	<span class="STYLE7 STYLE1">中国建银投资有限责任公司处置公告<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
<hr color="#6600CC" align="center" width="100%">	
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/noticeHead_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/noticeHead_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/noticeHead_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/noticeHead_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/noticeHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="zccz/noticeHead_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<!-- ------------------------------- 表头信息 --------------------------------- -->
<table id="commonWidth" class="newtable" width="100%" border="0" align="center"
	cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>标 题：</td>
		<td colspan="6" class="td_form02"><r:textfield cssClass="input2" maxlength="25" name="head.biaoti" id="biaoti" ></r:textfield></td>
	</tr>
	<tr>
		<td class="td_zxy01"><font color="red"><strong>*</strong></font>呈 送：</td>
		<td colspan="6" class="td_form02"><r:textfield cssClass="input2" maxlength="25" name="head.chengson" id="chengson" ></r:textfield></td>
	</tr>
	<tr>
		<td class="td_zxy01" width="120">编号：</td>
		<td class="td_zxy02"><s:textfield name="head.bianhao" cssClass="input" disabled="true" id="bianhao"/></td>
		<td class="td_zxy01" width="120">急缓程度：</td>
		<td class="td_zxy02"><r:select name="head.jhcd" id="jhcd" list="#{0:'一般',1:'急',2:'特急'}"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿人：</td>
		<td class="td_zxy02"><s:textfield name="head.nigaorenxm" id="nigaorenxm" disabled="true" maxlength="10" cssClass="input"></s:textfield></td>
		<s:hidden name="head.nigaoren" id="nigaoren"></s:hidden>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02">
		<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
		<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" disabled="true" />
		</td>
		<td class="td_zxy01"><font color="red"><strong>*</strong></font>联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" onblur="checkPhone(this);" id="lxdh" maxlength="10" cssClass="input"></r:textfield></td>
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
	<tr>
		<td class="td_zxy01">公告发布日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.head.fbrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="fbrq" name="head.fbrq" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
		<td class="td_zxy01"><font color="red"><strong>*</strong></font>公告有效期：</td>
		<td class="td_zxy02"><r:textfield name="head.ggyxq" id="ggyxq"  maxlength="10" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">受理征询或异议有效期：</td>
		<td class="td_zxy02"><s:textfield name="head.yyyxq" id="yyyxq" cssClass="input" /></td>
		<td class="td_zxy01">公告联系人：</td>
		<td class="td_zxy02"><r:textfield name="head.gglxr" id="gglxr" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">公告联系电话：</td>
		<td class="td_zxy02"><s:textfield name="head.gglxdh" onblur="checkPhone(this);" id="gglxdh" cssClass="input" /></td>
		<td class="td_zxy01">公告联系电子邮件：</td>
		<td class="td_zxy02"><r:textfield name="head.gglxyj" id="gglxyj" onblur="checkMail(this)" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">对排斥、阻挠征询或异议的举报电话：</td>
		<td class="td_zxy02"><s:textfield name="head.jbdh" onblur="checkPhone(this);" id="jbdh" cssClass="input" /></td>
		<td class="td_zxy01">对排斥、阻挠征询或异议的举报电子邮件：</td>
		<td class="td_zxy02"><r:textfield name="head.jbyj" id="jbyj" onblur="checkMail(this)" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">公告资产：</td>
		<td class="td_zxy02">
			<r:select name="head.zclybm" id="zclybm" list="#{0:'固定资产',1:'实体',2:'债券'}" onclick="clickIndex();" onchange="getIndex();"/>
		</td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
  	</tr>
	<tr> 
        <td  class="td_zxy01" >交易对象资格：</td>
        <td class="td_zxy03" colspan="5">
            <r:textarea name="head.jydxzg" id="JYDXZG" cssClass="area" style="width:94%;" rows="4"/>
        </td>
	</tr>
	<tr>
		<td  class="td_zxy01">交易条件：</td>
		<td class="td_zxy03" colspan="5"><r:textarea name="head.jytj" id="JYTJ" style="width:94%;" cssClass="area" rows="4"></r:textarea></td>
  	</tr>
</table>
<!-- ------------------------------- 资产实体列表 ------------------------------- -->
<div id="div0" style="display:block"><table id="zc_list"></table></div>
<div id="div1" style="display:none"><table id="st_list"></table></div>
<div id="div2" style="display:none"><table id="zq_list"></table></div>
<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>  
<!-- ------------------------------- 意 见 域 --------------------------------- -->
<e:opinion id="test" width="100%">
	<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
	<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
	<e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}" name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
	<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
	<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
	<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
</e:opinion>
<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
<%@ include file="/inc/file.inc"%>
<%@ include file="/inc/file_huiqian_end.inc"%>
<%@ include file="/inc/listMessage.inc"%>
</s:form>
</body>
<script type="text/javascript">
var headId = document.getElementById('headId').value;
var isQiChaoCzbg = false;
//------------------------------------资产列表-------------------------------------
jQuery("#zc_list").jqGrid({				
	url:"<%=basePath%>zccz/noticeBody_findZCBody.do?headId="+headId,
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','资产编号', '资产名称', '处置资产类别', '所在地','评估值','处置方式','资产描述','资产处置意思表示'],
    colModel: [
      	{name: 'id',index: 'id',align: "center" ,hidden:true},
	 	{name: 'zcbh',index: 'zcbh',align: "center"},
	 	{name: 'zcmc',index: 'zcmc',align: "center"},
	 	{name: 'zcfl',index: 'zcfl',align: "center"},
	 	{name: 'szd',index:'szd',align: "center"},
		{name: 'pgz',index:'pgz',align: "center"},
		{name: 'czfs',index:'czfs',align: "center"},
		{name: 'zcms',index: 'zcms',align: "center",editable:true},
		{name: 'czysbs',index: 'czysbs',align: "center",editable:true}
	],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '资产公告列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
//------------------------------------实体列表-------------------------------------
jQuery("#st_list").jqGrid({				
	url:"<%=basePath%>zccz/noticeBody_findSTBody.do?headId="+headId,
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','资产编号', '实体名称', '实体类型', '实体现状','实体所处省份','资产描述','资产处置意思表示'],
    colModel: [
    	{name: 'id',index: 'id',align: "center",hidden:true},
		{name: 'stbh',index: 'stbh',align: "center"}, 
		{name: 'stmc',index: 'stmc',align: "center"},
		{name: 'stlx',index: 'stlx',align: "center"},
		{name: 'stxz',index: 'stxz',align: "center"},
		{name: 'stscsf',index: 'stscsf',align: "center"},
		{name: 'zcms',index: 'zcms',align: "center",editable:true},
		{name: 'czysbs',index: 'czysbs',align: "center",editable:true}
	],
	rowNum:0,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '实体公告列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
//------------------------------------债券列表-------------------------------------
jQuery("#zq_list").jqGrid({				
	url:"<%=basePath%>zccz/noticeBody_findZQBody.do?headId="+headId,
	datatype: "json",
	mtype:"POST",
   	colNames:['id','项目名称', '债券种类', '债券名称', '行名','到期日','处置方式','资产描述','资产处置意思表示'],
	colModel:[ 
		{name:'id',index:'id',align:'center',hidden:true},
		{name:'xmmc', index:'xmmc',align:'center'},
		{name:'zqzlmc', index:'zqzlmc',align:'center'},
		{name:'zqmc', index:'zqmc',align:'center'},
		{name:'hm', index:'hm',align:'center'},
		{name:'dqr', index:'dqr',align:'center'},
		{name:'czfs', index:'czfs',align:'center'},
		{name: 'zcms',index: 'zcms',align: "center",editable:true},
		{name: 'czysbs',index: 'czysbs',align: "center",editable:true}
  	],
	rowNum:0,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '债券公告列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
//------------------------------------合成正文-------------------------------
//（处理）新建正文
function openzhengwen(){
	wordTemplate('bank_Template', document.getElementById("myform"),false,true, "处置公告正文"); 
	//修改按钮名称为“处理正文”
	window.parent.setHtml("#clzwButton .l-btn-text","处理正文");
	window.parent.setClass("#clzwButton .l-btn-text","l-btn-text icon-dealFile");
}

function afterWordSubmit(){
		  isQiChaoCzbg = true;
		}
//查看正文
function viewzhengwen(){
	wordTemplate('bank_Template', document.getElementById("myform"),true,false,"处置公告正文"); 
}
//合成正文
function hechengzhengwen(){
	MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "处置公告正文",'hechengHead()','hechengBottom()');
	window.parent.removeObj("#hczwButton");
	window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
}
function hechengHead(){
	MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengson").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
	MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
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
//------------------------------------处置公告-------------------------------
function generateNotice(){
	var url = '<%=basePath%>zccz/noticeHead_updateHCGG.do?headId='+headId;
	$.ajaxSetup({sync:false});
	$.post(url,{headId:""+headId+""}, function(data){
		if(data!=null && data!=''){
			document.getElementById("sfhcgg").value = "1";
		    var buttonStr_stztcz4 = '[{"id":"bjggButton","buttonHandler":"mainWindow.editNotice","buttonIcon":"icon-edit","buttonText":"编辑公告"}]';
			window.parent.prependButtonsFromChildren(buttonStr_stztcz4,"");
			var buttonStr_stztcz3 = '[{"id":"scggButton","buttonHandler":"mainWindow.generateNotice","buttonIcon":"icon-createFile","buttonText":"生成公告"}]';
			window.parent.removeObj("#scggButton");
		}
	});
    wordTemplate('zcczReport', document.getElementById("myform"),false,true, "处置公告");
}
function editNotice(){
	wordTemplate('zcczReport', document.getElementById("myform"),false,false, "处置公告");
}
function viewNotice(){
 	wordTemplate('zcczReport', document.getElementById("myform"),true,false, "处置公告");
}
function wordExtForDisposalReport(){
	var index=document.getElementById("zclybm").value;
	var zczk = "";
	var mc = "";
	var bs = "";
	if(index == '0'){
		mc =jQuery("#zc_list").getCol("zcmc");
		bs =jQuery("#zc_list").getCol("zcms");
	}else if(index == '1'){
		mc =jQuery("#st_list").getCol("stmc");
		bs =jQuery("#st_list").getCol("zcms");
	}else if(index == '2'){
		mc =jQuery("#zq_list").getCol("xmmc");
		bs =jQuery("#zq_list").getCol("zcms");
	}
	var url = '<%=basePath%>zccz/noticeHead_creatMS.do';
	$.post(url,{mc:""+mc+"",bs:""+bs+""}, function(data){
		if(data!=null && data!=""){
			var str = data.split("=");
			mc = str[0];
			bs = str[1];
			var mcList = mc.split(",");
			var bsList = bs.split(",");
			for(var i=0;i<mcList.length;i++){
				zczk =zczk + mcList[i]+":"+bsList[i] + ";";
			}
    		document.all.myword.wordsetfield("zczk",zczk);
		}
	});
}
// 保存表头信息
function saveHead(){
	myform.action = "<%=basePath%>zccz/noticeHead_saveHead.do";
	myform.submit();
}
//------------------------------------流程办结-------------------------------
function banjie(){
	if(confirm('确定要提交'+'流程办结'+'吗？')){
	    var bianhao = document.getElementById("bianhao");
	    if(bianhao.value ==""){
	    	alert("请先生成编号后再办结流程！");
	    	return false;
	    }
		document.myform.action = document.getElementById("endUrl").value;
		document.myform.url.value = document.getElementById("endViewUrl").value;
		document.myform.taskId.value = '<%=workflowVO.taskId%>';
		document.myform.outCome.value = '流程办结';
		document.myform.sheetId.value = document.getElementById("bianhao").value;
		document.myform.submit();
	}
}

// 提交时候select 变为不是disable
function beforeWorkFlowSubmit(){
	$("input").removeAttr("disabled");	
	$("textarea").removeAttr("disabled");	
	$("select").removeAttr("disabled");	
	return true;
}
//------------------------------------生成编号-------------------------------
function createBianhao(){
	var url = "<%=basePath%>zccz/noticeHead_creatBH.do";
	var ngbmmc = document.getElementById("ngbmmc").value;
	var ngbmbh = document.getElementById("ngbm").value;
	var headId = document.getElementById('headId').value;
	$.post(url,{"ngbmmc":ngbmmc,"headId":headId,"ngbmbh":ngbmbh},function(data){
		document.getElementById("bianhao").value = data;
		window.parent.removeObj("#shengchenButton");
		var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
	});
}
//------------------------------------会签-----------------------------------
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
//------------------------------------页面验证-----------------------------------
function checkEAMFormJSMethod(){
	var ids = "";
	var index=document.getElementById("zclybm").value;
	if(index=='0'){
		ids = jQuery("#zc_list").jqGrid('getDataIDs');
	}else if(index=='1'){
		ids = jQuery("#st_list").jqGrid('getDataIDs');
	}else if(index=='2'){
		ids = jQuery("#zq_list").jqGrid('getDataIDs');
	}
	var title = document.getElementById("biaoti");
	var lxdh = document.getElementById("lxdh");
	var cs = document.getElementById("chengson");
	var bianhao = document.getElementById("bianhao");
	var ggyxq = document.getElementById("ggyxq");
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
    	//bianhao.focus();
    	return false;
    }
    if(ids == null || ids.length == 0 || ids == ''){
    	alert("至少保存一条表体记录！");
    	return false;
    }
    if(ggyxq.value == null || ggyxq.value.length == 0){
    	alert("公告有效期不能为空！");
    	return false;
    }
    <%if(StringUtils.equals("draft",workflowVO.step)){%>
				if("<%=status%>"=="0" && !isQiChaoCzbg){
					alert("请先起草处置公告！");
					return false;
				}
	<%}%>
	
    return true;
}
</script>

<!------------------------------------JS方法------------------------------------->
<script type="text/javascript">

var headId = document.getElementById('headId').value;

function getIndex(){
	var index=document.getElementById("zclybm").selectedIndex;
	var chooseData = document.getElementById('chooseData').value;
	var dates = 0;
	if(chooseData=="0"){
		dates = jQuery("#zc_list").getDataIDs();
	}else if(chooseData=='1'){
		dates = jQuery("#st_list").getDataIDs();
	}else if(chooseData=='2'){
		dates = jQuery("#zq_list").getDataIDs();
	}
	if(dates.length>0){
		alert("已添加数据，不能变更业务类型!");
		document.getElementById("zclybm").value = chooseData;
		return false;
	}
	if(index==0){
		document.getElementById("div0").style.display="block";
		document.getElementById("div1").style.display="none";
		document.getElementById("div2").style.display="none";
	}else if(index==1){
		document.getElementById("div0").style.display="none";
		document.getElementById("div1").style.display="block";
		document.getElementById("div2").style.display="none";
	}else if(index==2){
		document.getElementById("div0").style.display="none";
		document.getElementById("div1").style.display="none";
		document.getElementById("div2").style.display="block";
	}
}

function clickIndex(){
	var chooseData = document.getElementById('zclybm').value;
	document.getElementById('chooseData').value = chooseData;
}

// 刷新表体
function reloadGrid(type){
	if(type=='0'){
		jQuery("#zc_list").trigger("reloadGrid");
	}else if(type=='1'){
		jQuery("#st_list").trigger("reloadGrid");
	}else if(type=='2'){
		jQuery("#zq_list").trigger("reloadGrid");
	}
}

// 添加资产表体
function addZC(){
	var url = '<%=basePath%>zccz/noticeQuery_initZC.do';
	var type = 'height=600,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=80';
	window.open(url,'处置资产列表',type);
}
// 选择处置资产后的回调方法
function addZCBody(zcIds){
	var stUrl = '<%=basePath%>zccz/noticeBody_saveZCBody.do';
	$.post(stUrl,{zcIds:""+zcIds+"",headId:""+headId+""}, function(data){
		if(data!=null && data!=''){
			alert(data);
			jQuery("#zc_list").trigger("reloadGrid");
		}
	});
}

// 删除资产表体
function delZC(){
	var gr = jQuery("#zc_list").jqGrid('getGridParam','selarrrow');
	if(gr.length == 0 || gr==""){
		alert("请选择要删除的记录!");
	}else{
		if(confirm("确认删除？")){
			var stUrl = '<%=basePath%>zccz/noticeBody_delBody.do';
			$.post(stUrl,{bodyIds:""+gr+"",headId:""+headId+""}, function(data){
				if(data!=null && data!=''){
					alert(data);
					jQuery("#zc_list").trigger("reloadGrid");
				}
			});
		}
	}
}

// 修改资产表体
function updZC(){
	var gr = jQuery("#zc_list").jqGrid('getGridParam','selarrrow');
	var index=document.getElementById("zclybm").value;
	if(gr.length == 0 || gr==""){
		alert("请选择要修改的记录!");
	}else{
		var url = '<%=basePath%>zccz/noticeBody_openBody.do?bodyIds='+gr+'&type='+index;
		var type = 'height=600,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=80';
		window.open(url,'处置实体表体修改',type);
	}
}

// 修改资产
function editZC(){
	ids = jQuery("#zc_list").jqGrid('getGridParam','selarrrow');
	if(ids.length == 0)
		return false;
	if(ids.length > 1)
		return false;
	$(ids).each(function(i,id){
		jQuery("#zc_list").jqGrid('editRow',id);
	});
}

// 保存资产
function saveZC(){
	ids = jQuery("#zc_list").jqGrid('getGridParam','selarrrow');
	$(ids).each(function(i,id){
		jQuery("#zc_list").jqGrid('saveRow',id,function(returnObj){
			return true;
		},'<%=basePath %>zccz/noticeBody_updateBody.do',{'1':'1'},function(){
			return true;
		});
	});	
}

// 取消资产
function cancelZC(){
	if(ids && ids.length == 0)
		return false;
	$(ids).each(function(i,id){
		jQuery("#zc_list").jqGrid('restoreRow',id);
	});	
}

// 修改实体
function editST(){
	ids = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
	if(ids.length == 0)
		return false;
	if(ids.length > 1)
		return false;
	$(ids).each(function(i,id){
		jQuery("#st_list").jqGrid('editRow',id);
	});
}

// 保存实体
function saveST(){
	ids = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
	$(ids).each(function(i,id){
		jQuery("#st_list").jqGrid('saveRow',id,function(returnObj){
			return true;
		},'<%=basePath %>zccz/noticeBody_updateBody.do',{'1':'1'},function(){
			return true;
		});
	});	
}

// 取消实体
function cancelST(){
	if(ids && ids.length == 0)
		return false;
	$(ids).each(function(i,id){
		jQuery("#st_list").jqGrid('restoreRow',id);
	});	
}

// 修改债券
function editZQ(){
	ids = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
	if(ids.length == 0)
		return false;
	if(ids.length > 1)
		return false;
	$(ids).each(function(i,id){
		jQuery("#zq_list").jqGrid('editRow',id);
	});
}

// 保存债券
function saveZQ(){
	ids = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
	$(ids).each(function(i,id){
		jQuery("#zq_list").jqGrid('saveRow',id,function(returnObj){
			return true;
		},'<%=basePath %>zccz/noticeBody_updateBody.do',{'1':'1'},function(){
			return true;
		});
	});	
}

// 取消债券
function cancelZQ(){
	if(ids && ids.length == 0)
		return false;
	$(ids).each(function(i,id){
		jQuery("#zq_list").jqGrid('restoreRow',id);
	});	
}


// 添加实体表体
function addST(){
	var url = '<%=basePath%>zccz/noticeQuery_initST.do';
	var type = 'height=600,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=80';
	window.open(url,'处置实体列表',type);
}

// 选择处置实体后的回调方法
function addSTBody(stIds){
	var stUrl = '<%=basePath%>zccz/noticeBody_saveSTBody.do';
	$.post(stUrl,{stIds:""+stIds+"",headId:""+headId+""}, function(data){
		if(data!=null && data!=''){
			alert(data);
			jQuery("#st_list").trigger("reloadGrid");
		}
	});
}

// 删除实体表体
function delST(){
	var gr = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
	if(gr.length == 0 || gr==""){
		alert("请选择要删除的记录!");
	}else{
		if(confirm("确认删除？")){
			var stUrl = '<%=basePath%>zccz/noticeBody_delBody.do';
			$.post(stUrl,{bodyIds:""+gr+"",headId:""+headId+""}, function(data){
				if(data!=null && data!=''){
					alert(data);
					jQuery("#st_list").trigger("reloadGrid");
				}
			});
		}
	}
}

// 修改实体表体
function updST(){
	var gr = jQuery("#st_list").jqGrid('getGridParam','selarrrow');
	var index=document.getElementById("zclybm").value;
	if(gr.length == 0 || gr==""){
		alert("请选择要修改的记录!");
	}else{
		var url = '<%=basePath%>zccz/noticeBody_openBody.do?bodyIds='+gr+'&type='+index;
		var type = 'height=600,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=80';
		window.open(url,'处置实体表体修改',type);
	}
}

// 添加债券表体
function addZQ(){
	var url = '<%=basePath%>zccz/noticeQuery_initZQ.do';
	var type = 'height=600,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=80';
	window.open(url,'处置债券列表',type);
}

// 选择处置债券后的回调方法
function addZQBody(zqIds){
	var stUrl = '<%=basePath%>zccz/noticeBody_saveZQBody.do';
	$.post(stUrl,{zqIds:""+zqIds+"",headId:""+headId+""}, function(data){
		if(data!=null && data!=''){
			alert(data);
			jQuery("#zq_list").trigger("reloadGrid");
		}
	});
}

// 删除债券表体
function delZQ(){
	var gr = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
	if(gr.length == 0 || gr==""){
		alert("请选择要删除的记录!");
	}else{
		if(confirm("确认删除？")){
			var stUrl = '<%=basePath%>zccz/noticeBody_delBody.do';
			$.post(stUrl,{bodyIds:""+gr+"",headId:""+headId+""}, function(data){
				if(data!=null && data!=''){
					alert(data);
					jQuery("#zq_list").trigger("reloadGrid");
				}
			});
		}
	}
}

// 修改债券表体
function updZQ(){
	var gr = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
	var index=document.getElementById("zclybm").value;
	if(gr.length == 0 || gr==""){
		alert("请选择要修改的记录!");
	}else{
		var url = '<%=basePath%>zccz/noticeBody_openBody.do?bodyIds='+gr+'&type='+index;
		var type = 'height=600,width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,left=100,top=80';
		window.open(url,'处置实体表体修改',type);
	}
}

function dbClickQueryZQ(gr){
	var headId = document.getElementById('headId').value;
	var bodyId = gr;
	var type = 'height=300, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
	window.open('<%=basePath%>zccz/noticeBody_bodyDetailZQ.do?headId='+headId+'&bodyId='+bodyId,'处置公告债券信息',type);
}

function dbClickQueryZC(gr){
	var headId = document.getElementById('headId').value;
	var bodyId = gr;
	var type = 'height=300, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
	window.open('<%=basePath%>zccz/noticeBody_bodyDetailZC.do?headId='+headId+'&bodyId='+bodyId,'处置公告资产信息',type);
}

function dbClickQueryST(gr){
	var headId = document.getElementById('headId').value;
	var bodyId = gr;
	var type = 'height=300, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
	window.open('<%=basePath%>zccz/noticeBody_bodyDetailST.do?headId='+headId+'&bodyId='+bodyId,'处置公告实体信息',type);
}
</script>
</html>