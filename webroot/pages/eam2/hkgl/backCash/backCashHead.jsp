<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="com.tansun.rdp4j.common.util.DateUtils"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.BizBackCashInfo"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String userTid = (String) request.getAttribute("userTid");
	String headId = (String)request.getAttribute("headId");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
	BizBackCashInfo head = (BizBackCashInfo)request.getAttribute("head");
%>
<r:controlfile file="/pages/eam2/hkgl/backCash/backCash.ctl.xml"></r:controlfile>
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
	actionPath = "hkglcldWorkflow";
%>
<script>
function checkEAMFormTitle(){
	var biaoti = document.getElementById("biaoti");
	if(biaoti.value == null || biaoti.value.trim().length == 0){
	alert("标题不能为空！");
	biaoti.focus();
      return false;
    }
    return true;
} 

function commitWorkflow(taskId,outCome){
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
%>
		if(outCome=="承办部门综合处理"){
			document.getElementById("commitNextTodoUrl").value = "hkglWorkflow/hkglcldWorkflow_ngbmTodo.do";
			document.myform.result.value = 'xmslCommit';
			document.myform.action = "<%=request.getContextPath()%>/hkgl/backConfirm_saveHead.do";
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
	<%if(!inCounterSign){%>
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
		var headBHGen = document.getElementById('bianhao').value;
		if(headBHGen == null || headBHGen.length == 0){
			//----------------------------------------生成编号按钮--------------------------------------------
			<e:pc id="SCBH">
				var buttonStr_stztcz5 = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
			</e:pc>
		}else{
			// ----------------------------------------开启办理单-----------------------------------------------	
			<e:pc id="KQBLD">
				var bldButtonStr = '[{"buttonHandler":"mainWindow.bldCommit","buttonIcon":"icon-ok","buttonText":"开启办理单"}]';		
			  	window.parent.appendButtonsFromChildren(bldButtonStr,"");
			</e:pc>
		}
		// ----------------------------------------办    结-----------------------------------------------
		<e:pc id="BJ">
			var buttonStrDoOver = '[{"buttonHandler":"mainWindow.banjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
			window.parent.appendButtonsFromChildren(buttonStrDoOver,"");
		</e:pc>
		// ----------------------------------------回款信息确认-----------------------------------------------
		<e:pc id="QRZGHK">
			var buttonConirmJSon = '[{"buttonHandler":"confirmThis","buttonIcon":"icon-add","buttonText":"确认最终回款"},\
									 {"buttonHandler":"cancleConfirm","buttonIcon":"icon-remove","buttonText":"取消确认"}\
			]';
			addButtons(jQuery("#gview_confirmInfoListOutDept > .ui-jqgrid-titlebar"),buttonConirmJSon);
		</e:pc>
		//----------------------------------------办理依据按钮--------------------------------------------
		<e:pc id="BLYJ">
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"exportExcelBlyj","buttonIcon":"icon-save","buttonText":"导出"}\
			]';
			addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
		</e:pc>
		//----------------------------------------附件上传按钮--------------------------------------------
		<e:pc id="FJSC">
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                		{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		</e:pc>
	<%}else{%>
		var chuanyue = '[{"buttonHandler":"mainWindow.circulation","buttonIcon":"icon-edit","buttonText":"传阅"}]';
		window.parent.appendButtonsFromChildren(chuanyue,"");
	<%}%>
	//----------------------------------------回款信息查看--------------------------------------------
	<e:pc id="HKQRXX">
		var buttonHkqrJSonString = '[{"buttonHandler":"querySure","buttonIcon":"icon-search","buttonText":"查看详细"}]';
		addButtons(jQuery("#gview_confirmInfoListOutDept > .ui-jqgrid-titlebar"),buttonHkqrJSonString);
	</e:pc>
	//----------------------------------------设定宽度--------------------------------------------
	jQuery("#confirmInfoListOutDept").setGridWidth($("#sss").width());
	jQuery("#blyj_reason_list").setGridWidth($("#sss").width());
	jQuery("#file_list").setGridWidth($("#sss").width());
    $(window).bind('resize', function(){
		jQuery("#confirmInfoListOutDept").setGridWidth($("#sss").width());
		jQuery("#file_list").setGridWidth($("#sss").width());
		jQuery("#blyj_reason_list").setGridWidth($("#sss").width());
    });
});

// 日期转换
$(function(){
	$("#dzrq").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
	
		<%							
				if(head!=null&&head.getDzje()!=null&&!"".equals(head.getDzje())){
		%>	
				$("#dzje").val(${head.dzje}.toFixed(2));
		<%	
				}
		%>	
	
	  
	
});
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
	<span class="STYLE1"><a id="cldtitle" name="cldtitle">中国建银投资有限责任公司回款处理单</a></span>
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
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="hkgl/backCash_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- 提交多个办理单 -->
<input type="hidden" name="bldTitle" value="<s:property value="head.biaoti" /> 办理单"/>
<input type="hidden" name="bldUrl" value="hkgl/backConfirm_modifyHead"/>
<s:hidden name="head.lcmc" value="回款确认" />
<!-- =========================================================================== -->

<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
		<td colspan="3" class="td_zxy02"><r:textfield name="head.biaoti" id="biaoti" cssClass="input2"/></td>
	</tr>
	<tr>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>办理部门：</td>
		<td class="td_zxy02" colspan="3">
			<s:hidden id="blbmbh" name="head.blbmbh"/>
			<r:textfield id="blbm" name="head.blbm" cssClass="input2" readonly="true"/>
			<e:pc id="blbman"><img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('blbm');" width="21" height="20" align="absmiddle"/></e:pc>
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
		<td class="td_zxy02"><e:dept userTid="<%=userTid%>" list="#{}" name="head.ngbmbh" id="ngbmbh"  />
			<s:hidden name="head.ngbmmc" id="ngbmmc"></s:hidden></td>
		<td class="td_zxy01">拟稿日期：</td><s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
		<td class="td_zxy02"><r:textfield id="ngrq" disabled="true" name="head.ngrq" cssClass="input" value="%{#draftDate}"/></td>
	</tr>
	<tr>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
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
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr> 
        <td  class="td_zxy01" >资金来源：</td>
        <td class="td_zxy03" colspan="3">
            <r:textarea name="head.zjly" id="zjly" cssClass="area" style="width:92.5%;" rows="4"/>
        </td>
	</tr>
<!------------------------------------------以下为确认信息-------------------------------------------->
<e:pc id="qrxx">
	<tr>
		<td class="td_zxy01">回款业务确认部门：</td>
		<td class="td_zxy02"><r:textfield name="head.qrbmmc" id="qrbmmc" cssClass="input"/>
			<s:hidden name="head.qrbmbh" id="qrbmbh" cssClass="input"/></td>
		<td class="td_zxy01">回款业务确认时间：</td>
		<td class="td_zxy02"><r:textfield name="head.hqywqrsj" id="hqywqrsj" cssClass="input"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">回款业务类型：</td>
		<td class="td_zxy02"><r:textfield name="head.ywlx" id="ywlx" cssClass="input"/></td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
</e:pc>
</table>
		</td>
	</tr>
</table>

<!-- ------------------------------- 确认部门意见 --------------------------------- -->
<table id="confirmInfoListOutDept"></table>
<script>
jQuery("#confirmInfoListOutDept").jqGrid({
	url:'<%=basePath%>hkgl/backConfirm_findConfirmInfoOutDept.do?headId='+'<%=headId%>',
	datatype: "json",
	colNames:['id','确认部门名称','确认人编号','确认人名称','确认单类型','确认日期','是否最终回款'],
	colModel:[ 
		{name:'id',index:'id',align:'center',hidden:true},
		{name:'qrbmmc', index:'qrbmmc',align:'center'},
		{name: 'qrrbh',index: 'qrrbh',align: "center",hidden:true},
		{name:'qrrmc', index:'qrrmc',align:'center'},
		{name:'qrdlx', index:'qrdlx',align:'center'},
		{name:'qrrq', index:'qrrq',align:'center'},
		{name:'sfzzhk', index:'sfzzhk',align:'center'}
  	],
	rowNum:0,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '办理部门确认信息',
	toolbar: [false,"top"],
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	}
});
</script>


<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>

<!-- ------------------------------- 意 见 域 --------------------------------- -->
<e:opinion id="test" width="100%">
	<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="办理部门意见："></e:opinionPart>
	<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
</e:opinion>

<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/inc/file.inc"%>
</s:form>

<script>
// 提交前把disable去掉
function beforeWorkFlowSubmit(){
	$("input").removeAttr("disabled");	
	$("textarea").removeAttr("disabled");	
	$("select").removeAttr("disabled");	
	return true;
}

// 开启会签前的页面验证
function beforeCounterSign(){
	alert(111);
	return false;
}

// 提交时页面验证
function checkEAMFormJSMethod(){
	var lxdh = document.getElementById('lxdh');
	var biaoti = document.getElementById('biaoti');
	var blbm = document.getElementById('blbm');
	var dzje = document.getElementById('dzje');
	var bianhao = document.getElementById('bianhao');
	if(biaoti.value == null || biaoti.value.length == 0){
		alert("标题不能为空！");
		biaoti.focus();
      	return false;
    }
    if(lxdh.value == null || lxdh.value.length == 0){
    	alert("联系电话不能为空！");
    	lxdh.focus();
    	return false;
    }
    if(blbm.value == null || blbm.value.length == 0){
    	alert("办理部门不能为空！");
    	blbm.focus();
    	return false;
    }
    if(dzje.value == null || dzje.value.length == 0){
    	alert("到账金额不能为空！");
    	dzje.focus();
    	return false;
    }
    if(('<%=workflowVO.taskName%>' == '拟稿部门综合处理') && (bianhao.value == null || bianhao.value.length == 0)){
    	alert('编号不能为空！');
    	bianhao.focus();
    	return false;
    }
    return true;
}

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

// 生成编号
function createBianhao(){
	if(document.getElementById("bianhao").value!=""){
		alert("已生成编号！");
		return false;
	}
	var url = "<%=basePath%>hkgl/backCash_backCashCode.do";
	var ngbmmc = document.getElementById("ngbmmc").value;
	var ngbmbh = document.getElementById("ngbmbh").value;
	var headId = document.getElementById('headId').value;
	$.post(url,{"ngbmmc":ngbmmc,"ngbmbh":ngbmbh,"headId":headId},function(data){
		document.getElementById("bianhao").value = data;
		window.parent.removeObj("#shengchenButton");
		var bldButtonStr1 = '[{"buttonHandler":"mainWindow.bldCommit","buttonIcon":"icon-ok","buttonText":"开启办理单"}]';		
	  	window.parent.appendButtonsFromChildren(bldButtonStr1,"");
	});
}

// 查看确认信息的明细
function querySure(){ 
	var gr = jQuery("#confirmInfoListOutDept").jqGrid('getGridParam','selarrrow');
	var qrdlx = jQuery("#confirmInfoListOutDept").getCell(gr,'qrdlx');
	var qrrbh = jQuery("#confirmInfoListOutDept").getCell(gr,'qrrbh');
	if(gr.length==1){
		var type = 'height=800, width=1100,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no,left=100,top=150';
		var url = '<%=basePath%>hkgl/backConfirm_queryConfirmInfoOutDept.do?id='+gr+'&qrdlx='+qrdlx+'&qrrbh='+qrrbh;
		var eurl = encodeURI(url);
		window.open(eurl,'回款确认信息',type);
	}else{
		alert('请选择一条记录！');
		return false;
	}
}

//办结
function banjie(){
	var num = '';
	var headId = '<%=headId%>';
	var id = jQuery("#confirmInfoListOutDept").getCol("id");
	var qrdlx = jQuery("#confirmInfoListOutDept").getCol("qrdlx");
	var sfzzhk = jQuery("#confirmInfoListOutDept").getCol("sfzzhk");
	var qrdlxZ = '';
	var idZ = '';
	for(var i=0;i<sfzzhk.length;i++){
		if(sfzzhk[i] == '是'){
			num = i;
			qrdlxZ = qrdlx[i];
			idZ = id[i];
		}
	}
	if(num==''){
		alert('请先确认一条信息！');
		return false;
	}else{
		var url = '<%=basePath%>hkgl/backCash_doOver.do';
		$.post(url,{"id":""+idZ+"","qrdlx":""+qrdlxZ+"","headId":""+headId+""},function(data){
			if(data!=null && data!=''){
				if(confirm('确定要提交流程办结吗？')){
					beforeWorkFlowSubmit();
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.taskId.value = '<%=workflowVO.taskId%>';
					//document.myform.sheetId = document.getElementById('bianhao').value;
					document.myform.outCome.value = '流程办结';
					document.myform.submit();
				}
			}
		});
	}
}

function changeNgbmmc(){
	var dept = document.getElementById("ngbmbh");
 	var i =document.getElementById("ngbmbh").selectedIndex;
 	document.getElementById("ngbmmc").value =dept.options[i].text;
}

// 确认这笔回款为最终回款
function confirmThis(){
	var headId = '<%=headId%>';
	var gr = jQuery("#confirmInfoListOutDept").jqGrid('getGridParam','selarrrow');
	if(gr.length==1){	
		if(confirm('确认这笔回款为最终回款吗？')){
			var url = '<%=basePath%>hkgl/backCash_confirmTheEnd.do';
			$.post(url,{"id":""+gr+"","headId":""+headId+""},function(data){
				if(data!=null && data!=''){
					alert(data);
					jQuery("#confirmInfoListOutDept").trigger("reloadGrid");
				}
			});
		}
	}else{
		alert('请选择一条记录！');
		return false;
	}
}

// 取消
function cancleConfirm(){
	var gr = jQuery("#confirmInfoListOutDept").jqGrid('getGridParam','selarrrow');
	if(gr.length==1){	
		var url = '<%=basePath%>hkgl/backCash_cancleConfirm.do';
		$.post(url,{"id":""+gr+""},function(data){
			if(data!=null && data!=''){
				alert(data);
				jQuery("#confirmInfoListOutDept").trigger("reloadGrid");
			}
		});
	}else{
		alert('请选择一条记录！');
		return false;
	}
}
</script>
</body>
</html>