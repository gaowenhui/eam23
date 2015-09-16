<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/kpgl/cardSplit/cardSplit.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<%
	String sheetType = (String)request.getAttribute("sheetType");
	String headId = (String)request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
	String isJbrcl = String.valueOf("经办人处理".equals(workflowVO.taskName));
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片拆分</title>
<meta http-equiv="pragma" content="no-cache"/>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "kpglWorkflow";
	actionPath = "kpglWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
</head>
<body  onload="displayButton();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form action="cardHead_saveHead.do" theme="simple" name="myform">

<!-- 表单类型,表头id,待删除bodyid -->
<s:hidden name="head.bdlx" id="bdlx"></s:hidden>
<s:hidden name="head.id"/>
<s:hidden name="headId" id="headId" value="%{#request.head.id}" />
<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>

<s:hidden name="head.senderp" id="senderp"/>
<s:hidden name="head.isrejected" id="isrejected"/>
<s:hidden name="sendErpState" id="sendErpState"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.strId" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="kpgl/cardHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- =========================================================================== -->
<script type="text/javascript">
$(document).ready(function(){	
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
	<e:pc id="cardSplitList">
	var buttonJSonString = '[{"id":"zengjia","buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
							 {"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"},\
							 {"buttonHandler":"splitAss","buttonIcon":"icon-cut","buttonText":"拆分"}\
							]';
	addButtons(jQuery("#gview_cardSplitList > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	<e:pc id="splitResult">
	var buttonJSonString = '[{"buttonHandler":"editResult","buttonIcon":"icon-edit","buttonText":"修改"}\]';
	addButtons(jQuery("#gview_splitResult > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	<e:pc id="blyj_reason_list">
	var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
	]';
	addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	</e:pc>
	<e:pc id="file_list">
	var buttonFileJSonString = '[{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"},\
{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
]';

	addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
	</e:pc>
	<e:pc id="bianhao_button">
		var headBHGen = document.getElementById("bianhao").value;
		if(headBHGen == null || headBHGen.length == 0){
			var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
			window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
		}
	   </e:pc>
	jQuery("#cardSplitList").setGridWidth($("#common_tableWidth").width());
	jQuery("#splitResult").setGridWidth($("#common_tableWidth").width());
	jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	$(window).bind('resize', function(){
		jQuery("#cardSplitList").setGridWidth($("#common_tableWidth").width());
		jQuery("#splitResult").setGridWidth($("#common_tableWidth").width());
		jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	});
});
function createBianhao(){
				var headId = document.getElementById("headId").value;
				$.post("<%=request.getContextPath()%>/kpgl/cardQuery_getCode.do",{
					"headId":headId
				},function(data){
					document.getElementById("bianhao").value = data;
					window.parent.removeObj("#shengchenButton");
				});
			}
// 提交时页面验证
function checkEAMFormJSMethod(){
	var ids = jQuery("#splitResult").jqGrid('getDataIDs');
	var title = document.getElementById("biaoti");
	var lxdh = document.getElementById("lxdh");
	var sheetId = document.getElementById("bianhao");
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
    var bz = document.getElementById('bz');
    if(bz.value == null || bz.value.length == 0){
    	alert("申请理由不能为空！");
    	lxdh.focus();
    	return false;
    }
    var a  = document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++){
		a[i].disabled = false;
	}
    return true;
}


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
function lookAsset(gr){
	var url = '<%=request.getContextPath()%>/kpgl/cardQuery_cardType.do?isBody=true&bodyId='+gr;
	var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.open(url,'',_g_privateDialogFeatures);
}
function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
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
			if(arg2 == "经办人处理" ){
				if($.trim($("#bianhao").val()) == ""){
					alert("请先生成编号");
					return false;		
				}
			}
			return true;
		}
</script>     	
<br><div align="center">
	<span class="STYLE7 STYLE1">中国建银投资有限责任公司卡片拆分处理单</span>
</div>

<table>
	<tr id="send2ErpButton" style="display:none">
		<td><input type="button"  value="发送至ERP" onclick="send2Erp()" /></td>
	</tr>
	<tr id="createBookButton" style="display:none">
		<td><input type="button" value="生成台账" onclick="createBook4Card()" /></td>
	</tr>
</table>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->

<hr color="#6600CC" align="center" width="100%">
<!-- ------------------------------- 表头信息 --------------------------------- -->
<table id="common_tableWidth"  width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
 	<tr>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>标 题：</td>
		<td colspan="6" class="td_form02"><r:textfield cssClass="input2" name="head.biaoti" id="biaoti" /></td>
	</tr>
	<tr>
		<td class="td_zxy01" width="120">编号：</td>
		<td class="td_zxy02"><s:textfield name="head.bianhao" theme="simple" cssClass="input" disabled="true" id="bianhao"/>
		</td>
		<td class="td_zxy01" width="120">急缓程度：</td>
		<td class="td_zxy02"><r:select name="head.jhcd" id="jhcd" list="#{0:'一般',1:'急',2:'特急'}" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿人：</td>
		<td class="td_zxy02"><s:textfield name="head.ngrmc" id="ngrmc" maxlength="10" disabled="true" cssClass="input" /></td>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" onblur="checkPhone(this)" id="lxdh" cssClass="input" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" disabled="true" />
		</td>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02"><e:dept userTid="<%=userTid%>" list="#{}" name="head.ngbm" id="ngbm"  /></td>
			<s:hidden name="head.ngbmmc" id="ngbmmc" ></s:hidden>
		</td>
	</tr>
    <!-- <tr>
		<td  class="td_zxy01">办理说明：</td>
		<td class="td_zxy03" colspan="5"><r:textarea name="head.kpblsm" id="kpblsm" cssClass="area" rows="4"></r:textarea></td>
    </tr> -->
    <tr> 
        <td  class="td_zxy01" ><font color="red" ><strong>*</strong></font>申请理由：</td>
        <td class="td_zxy03" colspan="5">
            <r:textarea name="head.bz" id="bz" cssClass="area" style="width:94%;" rows="4"/>
        </td>
	</tr>
</table>
<!-- ------------------------------- 拆分列表 --------------------------------- -->
<table id="cardSplitList"></table>
<table id="splitResult"></table>
<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>  
<!-- ------------------------------- 意 见 域 --------------------------------- -->
<e:opinion id="test" width="100%">
    <e:opinionPart id="ERP_RESULT" width="800" biaodanid="%{#request.biaodanid}" name="ERP_RESULT" value="" text="ERP处理结果："></e:opinionPart>
    <e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
</e:opinion>
<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/inc/file.inc"%>
<%@ include file="/inc/listMessage.inc"%>
</s:form>
<script type="text/javascript">
	function send2Erp(){
		alert("点击确定 发送ERP 请稍后...");
		window.parent.removeObj("#sendToERP");
		var headId = document.getElementById('headId').value; 
		var step=document.getElementById('step').value; 
		if(step=="todo"){
			yjwjurl = document.getElementById("draftCommitTodoUrl").value;
		}if(step=="end"){
			yjwjurl = document.getElementById("endViewUrl").value;
		}
		taskId = document.getElementById("taskId").value;
		var erpurl = basePathJs + yjwjurl+"?taskId="+taskId;
		var url = "<%=request.getContextPath()%>/jiekou/send2ERP4SPLIT_requestExecute.do?erpurl="+erpurl;
		$.post(url,{headId:"" + headId + ""}, function(data){
				jQuery("#purchase_list").trigger("reloadGrid");
				if(data !=""){
					alert(data);
					location.reload();
					if(data=="ERP系统正确接收!"){
						window.parent.removeObj("#sendToERP");						
					}
				}
		});
	}
	function createBook4Card(){
		var headId = document.getElementById('headId').value; 
		var url = "<%=request.getContextPath()%>/jiekou/createBook4Card_requestExecute.do";
		$.post(url,{headId:"" + headId + ""}, function(data){
			if(data !=""){
				alert(data);
			}
			if(data=="办结成功"){
				document.myform.action = document.getElementById("endUrl").value;
				document.myform.url.value = document.getElementById("endViewUrl").value;
				document.myform.outCome.value = "生成台账";
					document.myform.sheetId.value = document.getElementById("bianhao").value;
				document.myform.submit();
				return;
			}
		});
	}
	function displayButton(){
		var isJbrcl = '<%=isJbrcl%>';
		var sendErpState = "";
		if(isJbrcl == 'true'){
			var senderp = document.getElementById('senderp').value;
			
			var isrejected = document.getElementById('isrejected').value;
			if(isrejected=='04'){//后加的状态，如果生成台账成功，则状态为已生成台账
				sendErpState = '4'
			}else{
				if(senderp!='1'&&senderp!='2'){//如果shenderp不等于1或者2，那么状态为未发送erp或者发送不成功
					<e:pc id="fserp">
					var buttonStr_banjie = '[{"id":"sendToERP","buttonHandler":"mainWindow.send2Erp","buttonIcon":"icon-ok","buttonText":"发送ERP"}]';
					window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
					</e:pc>
					sendErpState = '1';
				}else if(senderp=='1'||senderp=='2'){//如果senderp等于1或者2，那么状态为发送erp成功，或者审核通过，或者不通过
					
					if(isrejected=='03'){//如果isrejected为03则审核通过，
						<e:pc id="sctz">
						var buttonStr_banjie = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
						window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
						</e:pc>
						sendErpState = '2';
					}else if(isrejected=='01'){//如果isrejected为01，则审核不通过
						sendErpState = '3';
					}else{
						sendErpState = '0';//其他情况为发送erp成功状态
					}
				}
			}			
			//alert("sendErpState:"+sendErpState);
			document.getElementById('sendErpState').value = sendErpState;
		}
	}
</script>
<script type="text/javascript">
jQuery("#cardSplitList").jqGrid({				
	url:"<%=basePath %>kpgl/cardQuery_findBeforeSplitAction.do?headId=<%=headId%>",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','卡片编号','卡片名称','资产编号','资产名称', '原值','累计折旧'],
	colModel: [
		{name: 'id',index: 'id',hidden:true},
		{name: 'cardcode',index:'cardcode',align:'center',sortable:false,width:180},
		{name: 'zcname',index: 'zcname',align: "center",sortable:false,width:180},
		{name: 'zcbh',index: 'zcbh',align: "center",sortable:false,width:180},
		{name: 'zcmc',index: 'zcmc',align: "center",sortable:false,width:180},
		{name: 'ybyz',index: 'ybyz',align: "center",sortable:false,width:180},
		{name: 'ljzj',index: 'ljzj',align: "center",sortable:false,width:180}
	],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
			lookAsset(gr);
		},
	caption: '卡片拆分前',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	gridComplete:function(){
		aftercomplete();
	},
	loadComplete:function(data){
		if(data&&data.rows.length>0){
		jQuery("#cardSplitList").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#cardSplitList").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
// 添加
function addAss(){
	window.open('<%=basePath%>kpgl/cardQuery_init.do', '减少卡片选择','height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0');
}
// 从查询页面查出id后回调方法
function getBodyInfo(id){
	var sheetType = '<%=sheetType%>';
	var headId = document.getElementById('headId').value;
	var url ="<%=request.getContextPath()%>/kpgl/cardBody_saveBody.do";
	$.post(url,{id:"" + id + "",sheetType:"" + sheetType + "",headId:"" + headId}, function(data){
		jQuery("#cardSplitList").trigger("reloadGrid");
		$("#zengjia").hide();
	});
}
// 删除
function delAss(){
	var gr = jQuery("#cardSplitList").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		var chaifenhou = $("#splitResult").getDataIDs();
		if(chaifenhou.length>0){
			if(confirm("已拆分卡片，确认删除吗？")){
				delAss1(gr);
			}
		}else {
			if(confirm("确认删除？")){
				delAss1(gr);
			}
		}
	}
}
function delAss1(gr){
	var sheetType = '<%=sheetType%>';
	var delblyjurl ="<%=request.getContextPath()%>/kpgl/cardBody_deleteBody.do";
	$.post(delblyjurl,{delBodyIds:"" + gr + "",sheetType:"" + sheetType + ""}, function(data){
		jQuery("#cardSplitList").trigger("reloadGrid");
		jQuery("#splitResult").trigger("reloadGrid");
		$("#zengjia").show();
	});
}
// 拆分
function splitAss(){
	var gr = jQuery("#cardSplitList").jqGrid('getGridParam','selarrrow');
	var sheetType = '<%=sheetType%>';
	var headId = document.getElementById('headId').value;
	if( gr.length >0&&gr[0]!="" ){
		var chaifenhou = $("#splitResult").getDataIDs();
		if(chaifenhou.length>0){
			if(confirm("已拆分卡片，确认重新拆分吗？")){
				window.open('<%=basePath%>kpgl/cardBody_openSplitPage.do?sheetType='+sheetType+'&headId='+headId+'&bodyId='+gr, '卡片拆分','height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0');
				//window.open('<%=basePath%>kpgl/cardBody_openSplitPage.do?sheetType='+sheetType+'&headId='+headId+'&bodyId='+gr);
			}
		}else{
			window.open('<%=basePath%>kpgl/cardBody_openSplitPage.do?sheetType='+sheetType+'&headId='+headId+'&bodyId='+gr, '卡片拆分','height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0');
			//window.open('<%=basePath%>kpgl/cardBody_openSplitPage.do?sheetType='+sheetType+'&headId='+headId+'&bodyId='+gr);
		}
	}else alert("请选择要拆分的记录");
}
// 从body页面回调时刷新
function reloadJqGrid(){
	jQuery("#reason_list").trigger("reloadGrid");
}
// 保存head信息
function saveHead(){
	var sheetType = '<%=sheetType%>';
	var url = "<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do?sheetType="+sheetType;
	myform.action = url;
}
</script>

<!-- -------------------------splitResult----------------------------- -->

<script type="text/javascript">
jQuery("#splitResult").jqGrid({				
	url:"<%=basePath %>kpgl/cardQuery_findAfterSplitAction.do?headId=<%=headId%>",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','卡片名称','资产编号', '资产名称', '原值', '所占比例(%)','旧卡片编号'],
	colModel: [
		{name: 'id',index: 'id',hidden:true},
		{name:'zcname',index:'cardcode',align:'center',sortable:false,width:180},
		{name: 'zcbh',index: 'zcname',align: "center",sortable:false,width:180},
		{name: 'zcmc',index: 'kplx',align: "center",sortable:false,width:180},
		{name: 'ybyz',index: 'glbm',align: "center",sortable:false,width:180},
		{name: 'szbl',index: 'usepartment',align: "center",sortable:false,width:180},
		{name: 'oldcardid',index: 'dealmethod',align: "center",sortable:false,width:180}
	],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
			lookAsset(gr);
		},
	caption: '卡片拆分后',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data&&data.rows.length>0){
		jQuery("#splitResult").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#splitResult").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
// 从body页面回调时刷新
function reloadSplitGrid(){
	jQuery("#splitResult").trigger("reloadGrid");
}
// 修改
function editResult(){
	var gr = jQuery("#splitResult").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 ){
		var headId = '<%=headId%>';
		var sheetType = '<%=sheetType%>';
		var bodyId = gr;
		var url = '<%=request.getContextPath()%>/kpgl/cardBody_modifyBody.do?bodyId='+bodyId+'&headId='+headId+"&sheetType="+sheetType;
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		window.open(url,'','height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0');
		jQuery("#splitResult").trigger("reloadGrid");
	}else alert("请选择要修改的记录");
}
function aftercomplete(){
	var idArray = $("#cardSplitList").getDataIDs();
	if(idArray.length>0){
		$("#zengjia").hide();
	}else{
		$("#zengjia").show();
	}
}

function changeNgbmmc(){
	var dept = document.getElementById("ngbm");
 	var i =document.getElementById("ngbm").selectedIndex;
 	document.getElementById("ngbmmc").value =dept.options[i].text;
}
</script>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if("<%=request.getAttribute("ErpMessage")%>" != "null") {
		alert("<%=request.getAttribute("ErpMessage")%>"); 
	}
</SCRIPT>