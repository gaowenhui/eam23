<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/kpgl/cardAdd/cardAdd.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<%
	String userTid = (String) request.getAttribute("userTid");
	String sheetType = (String)request.getAttribute("sheetType");
	String headId = (String)request.getAttribute("headId");
	CaShead head = (CaShead)request.getAttribute("head");
	String sfzy = head.getZykpxz();
	String zjfs = head.getZjfs();
	String isJbrcl = String.valueOf("经办人处理".equals(workflowVO.taskName));
	String isCwkjbcl = String.valueOf("财务会计部处理".equals(workflowVO.taskName));
	String isZuzhang = (String)request.getAttribute("isZuzhang");
	String erpPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片新增</title>
<meta http-equiv="pragma" content="no-cache"/>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "kpglWorkflow";
	actionPath = "kpglWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
<SCRIPT language=JavaScript type=text/JavaScript>
$(document).ready(function(){
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
	<e:pc id="purchase_list">
	var buttonJSonString = '[{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"},\
								{"buttonHandler":"updateAss","buttonIcon":"icon-edit","buttonText":"修改"}\
	]';
	addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	<e:pc id="private_use">
	var buttonJSonString1 = '[{"buttonHandler":"addAss1","buttonIcon":"icon-add","buttonText":"增加"},\
							{"buttonHandler":"delAss1","buttonIcon":"icon-remove","buttonText":"删除"},\
							{"buttonHandler":"updateAss1","buttonIcon":"icon-edit","buttonText":"修改"}\
							]';
	addButtons(jQuery("#gview_private_use > .ui-jqgrid-titlebar"),buttonJSonString1);
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
	jQuery("#purchase_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#private_use").setGridWidth($("#common_tableWidth").width());
	jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	$(window).bind('resize', function(){
		jQuery("#private_use").setGridWidth($("#common_tableWidth").width());
		jQuery("#purchase_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
	});
	addType1(document.getElementById('zjfs'));
});
	function qqq(selectId){
		var headId = '<%=headId%>';
		var delBodyUrl = "<%=basePath%>kpgl/cardBody_cardAddDeleteBody.do";
		$.post(delBodyUrl,{headId:"" + headId + ""}, function(data){
			jQuery("#purchase_list").trigger("reloadGrid");
			jQuery("#private_use").trigger("reloadGrid");
		});
		if (selectId.value == 1){
			div1.style.display="block";
			div2.style.display="none";
		}else{
			div1.style.display="none";
			div2.style.display="block";
		}
	}
	function tijiao(){
		var headId = document.getElementById("headId").value;
		var sheetType = '<%=sheetType%>';
		var url = "<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do?sheetType="+sheetType+"&headId="+headId;
		myform.action = url;
	}
	$("#ngrq").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
	function send2Erp(){
		window.parent.removeObj("#sendToERP");
		alert("点击确定 发送ERP 请稍后...");
		var headId = document.getElementById('headId').value; 
		var step=document.getElementById('step').value; 
		if(step=="todo"){
			yjwjurl = document.getElementById("draftCommitTodoUrl").value;
		}if(step=="end"){
			yjwjurl = document.getElementById("endViewUrl").value;
		}
		taskId = document.getElementById("taskId").value;
		var erpurl = erpPath + yjwjurl+"?taskId="+taskId;
		
		var url = "<%=request.getContextPath()%>/jiekou/send2ERP4ADD_requestExecute.do?erpurl=" + erpurl;
		$.post(url,{headId:"" + headId + ""}, function(data){
				jQuery("#purchase_list").trigger("reloadGrid");
				if(data !=""){
					alert(data);
					location.reload();
					if(data=="ERP系统正确接收!"){
						window.parent.removeObj("#sendToERP");
						if(document.getElementById('zjfs').value =='0'){
							document.myform.action = document.getElementById("endUrl").value;
							document.myform.url.value = document.getElementById("endViewUrl").value;
							document.myform.outCome.value = "生成台账";
							document.myform.sheetId.value = document.getElementById("bianhao").value;
							document.myform.submit();
							return;
						}
						//document.getElementById("createBookButton").style.display="block";
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
				if(data=="办结成功"){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.outCome.value = "生成台账";
					document.myform.sheetId.value = document.getElementById("bianhao").value;
					document.myform.submit();
					return;
				}
			}
		});
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
	//验证申请说明的长度不超过50个汉字。
	function checkLength(){
		var bz = document.getElementById("bz");
		if(bz.value.trim().length > 100){
			alert("申请理由不能超过100个汉字！");
			bz.focus();
			return false;
		}
		return true;
	}
	
	function displayButton(){
		var isJbrcl = '<%=isJbrcl%>';
		var isCwkjbcl = '<%=isCwkjbcl%>';
		var sendErpState = "";
		if((isJbrcl == 'true'&&'<%=zjfs%>'=='1')||isCwkjbcl =='true'){
			var senderp = document.getElementById('senderp').value;
			var isrejected = document.getElementById('isrejected').value;
			if(isrejected=='04'){//后加的状态，如果生成台账成功，则状态为已生成台账
				sendErpState = '4'
			}else{
				if((senderp!='1'&&senderp!='2')||isrejected=='01'){//如果shenderp不等于1或者2，那么状态为未发送erp或者发送不成功
					sendErpState = '1';
					<e:pc id="fserp">
					var buttonStr_banjie = '[{"id":"sendToERP","buttonHandler":"mainWindow.send2Erp","buttonIcon":"icon-ok","buttonText":"发送ERP"}]';
					window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
					</e:pc>
				}else if(senderp=='1'||senderp=='2'){//如果senderp等于1或者2，那么状态为发送erp成功，或者审核通过，或者不通过
					if(isrejected=='03'){//如果isrejected为03则审核通过，
						<e:pc id="sctz">
						var buttonStr_banjie = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-ok","buttonText":"生成台账"}]';
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
			function createBianhao(){
				var headId = document.getElementById("headId").value;
				$.post("<%=request.getContextPath()%>/kpgl/cardQuery_getCode.do",{
					"headId":headId
				},function(data){
					document.getElementById("bianhao").value = data;
					window.parent.removeObj("#shengchenButton");
				});
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
</SCRIPT>
</head>
<body onload="displayButton();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<SCRIPT language=JavaScript type=text/JavaScript>
$.ajaxSetup({
					async : false
				});
</SCRIPT>
<s:form action="cardHead_saveHead.do" theme="simple" name="myform">
<!-- 表单类型,表头id,待删除bodyid -->
<s:hidden name="head.bdlx" id="bdlx"/>
<s:hidden name="head.id"/>
<s:hidden name="headId" id="headId" value="%{#request.head.id}" />
<s:hidden name="delBodyIds" id="delBodyIds"/>
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
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/kpgl/cardHead_saveHead.do"/>
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
<!--  <input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>-->
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- =========================================================================== -->
<br><div align="center">
	<span class="STYLE7 STYLE1">中国建银投资有限责任公司新增卡片处理单</span>
</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
	<table>
		<tr id="send2ErpButton" style="display:none">
			<td><input type="button"  value="发送至ERP" onclick="send2Erp()" /></td>
		</tr>
		<tr id="createBookButton" style="display:none">
			<td><input type="button" value="生成台账" onclick="createBook4Card()" /></td>
		</tr>
	</table>
<hr color="#6600CC" align="center" width="100%">
<!-- ------------------------------- 表头信息 --------------------------------- -->
<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center"
	cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>标 题：</td>
		<!-- <td colspan="6" class="td_form02"><r:textfield cssClass="input" maxlength="25" cssClass="input2"  id="biaoti" ></r:textfield></td> -->
	</tr>
	<tr>
		<td class="td_zxy01" width="120">编号：</td>
		<td class="td_zxy02"><s:textfield name="head.bianhao" theme="simple" cssClass="input" disabled="true" id="bianhao"/>
		</td>
		<td class="td_zxy01" width="120">急缓程度：</td>
		<td class="td_zxy02"><r:select name="head.jhcd" id="jhcd"  list="#{0:'一般',1:'急',2:'特急'}"></r:select>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿人：</td>
		<td class="td_zxy02"><s:textfield name="head.ngrmc" id="ngrmc" disabled="true" maxlength="10" cssClass="input"></s:textfield></td>
		<td class="td_zxy01"><font color="red" ><strong>*</strong></font>联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" onblur="checkPhone(this);"  id="lxdh"  maxlength="10" cssClass="input"></r:textfield></td>
	</tr>
	<tr>
		<td class="td_zxy01">拟稿日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" disabled="true" />
		</td>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02">
			<e:dept userTid="<%=userTid%>" list="#{}" name="head.ngbm" id="ngbm"  /></td>
			<s:hidden name="head.ngbmmc" id="ngbmmc" ></s:hidden>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">增加方式：</td>
		<td class="td_zxy02">
			<%if("true".equals(isZuzhang)){ %>
			<r:select name="head.zjfs" id="zjfs" list="#{1:'审批增加',0:'直接增加'}" onChange="addType1(this);"/>
			<%}else{ %>
			<r:select name="head.zjfs" id="zjfs" list="#{1:'审批增加',0:'直接增加'}" disabled="true"/>  
			<%} %>
			
		</td>
		<td class="td_zxy01">自用资产卡片新增：</td>
		<td class="td_zxy02"><r:select name="head.zykpxz" id="zykpxz" list="#{0:'否',1:'是'}" onChange="qqq(this);"></r:select></td>
  </tr>
  <tr> 
	        <td  class="td_zxy01" ><font color="red" ><strong>*</strong></font>申请理由(100个字以内)：</td>
	        <td class="td_zxy03" colspan="5">
	            <r:textarea name="head.bz" id="bz" cssClass="area" style="width:94%;" rows="5" onblur="checkLength();"/>
	        </td>
		</tr>
	<!-- <tr>
		<td  class="td_zxy01">备注：</td>
		<td class="td_zxy03" colspan="5"><r:textarea name="head.kpblsm" id="kpblsm" cssClass="area" rows="4"></r:textarea></td>
  	</tr> -->
</table>
	
<!-- ------------------------------- 增加列表 --------------------------------- -->
	<div id="div2" <%=(!"1".equals(sfzy))?"style='display:block'":"style='display:none'" %>>
				<table id="purchase_list"></table>
	</div>
	<div id="div1" <%=("1".equals(sfzy))?"style='display:block'":"style='display:none'" %>>
				<table id="private_use"></table>
    </div>
<!-- ------------------------------- 办理依据 --------------------------------- -->
<%@ include file="/inc/according.inc"%>  

<!-- ------------------------------- 意 见 域 --------------------------------- -->
<!-- 审批增加 -->

<!-- 直接增加 -->
	<e:opinion id="test" width="100%">
	    <e:opinionPart id="ERP_RESULT" width="800" biaodanid="%{#request.biaodanid}" name="ERP_RESULT" value="" text="ERP处理结果："></e:opinionPart>
			<e:opinionPart id="CHECK_DEPT" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT" value="" text="审核部门意见："></e:opinionPart>
	    <e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	</e:opinion>
	
<!-- ------------------------------- 文件上传 --------------------------------- -->
<%@ include file="/inc/file.inc"%>
<%@ include file="/inc/listMessage.inc"%>
</s:form>
<script type="text/javascript">
//****************经营性固定资产卡片新增 ********************************************************
jQuery("#purchase_list").jqGrid({				
	url:"<%=basePath %>kpgl/cardQuery_findAddBodyAction.do?headId=<%=headId%>",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','卡片名称', '卡片类型', '管理部门', '使用部门','增加方式','原币原值','折旧方法'],
         colModel: [
          	{name: 'id',index: 'id',align: "center" ,hidden:true},
		 	{name: 'zcname',index: 'zcname',align: "center",sortable:false},
		 	{name: 'parentid',index: 'parentid',align: "center",sortable:false},
		 	{name: 'glbm',index: 'glbm',align: "center",sortable:false},
		 	{name: 'usepartment',index:'usepartment',align: "center",sortable:false},
			{name: 'addtype',index:'addtype',align: "center",sortable:false},
			{name: 'ybyz',index:'ybyz',align: "center",sortable:false},
			{name: 'zjtype',index:'zjtype',align: "center",sortable:false}
	],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
			lookAsset(gr);
		},
	viewrecords:true,
	caption: '新增卡片列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data&&data.rows.length>0){
		jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#purchase_list").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
// 删除
function delAss(){
	var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var sheetType = '<%=sheetType%>';
			var delblyjurl ="<%=request.getContextPath()%>/kpgl/cardBody_deleteBody.do";
			$.post(delblyjurl,{delBodyIds:"" + gr + "",sheetType:"" + sheetType + ""}, function(data){
				jQuery("#purchase_list").trigger("reloadGrid");
			});
		}
	}
}
// 修改
function updateAss(){
	var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 ){
		var headId = '<%=headId%>';
		var sheetType = '<%=sheetType%>';
		var bodyId = gr;
		var rdBasicWidth = "1000px";
		var rdBasicHeight = "1500px";
		var url = '<%=request.getContextPath()%>/kpgl/cardBody_modifyBody.do?bodyId='+bodyId+'&headId='+headId+"&sheetType="+sheetType;
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
		window.open(url,'',_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}
// 添加
function addAss(){
	var headId = '<%=headId%>';
	var sheetType = '<%=sheetType%>';
	var rdBasicWidth = "1500px";
	var rdBasicHeight = "1500px";
	var url = '<%=request.getContextPath()%>/kpgl/cardBody_addBody.do?headId='+headId+'&sheetType='+sheetType+'&sfzy=0';
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.open(url,'',_g_privateDialogFeatures);
}
// 刷新
function reloadJqGrid(){
	jQuery("#purchase_list").trigger("reloadGrid");
	jQuery("#private_use").trigger("reloadGrid");
}
//****************自用资产卡片新增 jQuery列表********************************************************
jQuery("#private_use").jqGrid({				
	url:"<%=basePath %>kpgl/cardQuery_findAddBody4ZyKp.do?headId=<%=headId%>",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','物品编号', '分类', '物品名称', '品牌/规格型号','卡片名称','卡片类型','管理部门', '使用部门'],
    colModel: [
    	{name: 'id',index: 'id',align: "center",hidden:true},
		{name: 'wpbh',index: 'bianhao',align: "center",sortable:false}, 
		{name: 'fl',index: 'fenlei',align: "center",sortable:false},
		{name: 'wpmc',index: 'wpmc',align: "center",sortable:false},
		{name: 'ppggxh',index: 'ggxh',align: "center",sortable:false},
		{name: 'zcname',index: 'kpmc',align: "center",sortable:false}, 
		{name: 'parentid',index: 'kplx',align: "center",sortable:false},
		{name: 'glbm',index: 'glbm',align: "center",sortable:false},
		{name: 'usepartment',index: 'sybm',align: "center",sorttype: "float",sortable:false}],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	 ondblClickRow:function(gr){
			lookAsset(gr);
		},
	caption: '新增卡片列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data1){
		if(data1&&data1.rows.length>0){
		jQuery("#private_use").setGridHeight(data1.rows.length * 22 + 18);
		}else{
		jQuery("#private_use").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
function lookAsset(gr){
	var url = '<%=request.getContextPath()%>/kpgl/cardQuery_cardType.do?isBody=true&bodyId='+gr;
	var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.open(url,'',_g_privateDialogFeatures);
}
// 删除
function delAss1(){
	var gr = jQuery("#private_use").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var sheetType = '<%=sheetType%>';
			var delblyjurl ="<%=request.getContextPath()%>/kpgl/cardBody_deleteBody.do";
			$.post(delblyjurl,{delBodyIds:"" + gr + "",sheetType:"" + sheetType + ""}, function(data){
				jQuery("#private_use").trigger("reloadGrid");
			});
		}
	}
}
// 修改
function updateAss1(){
	var gr = jQuery("#private_use").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 ){
		var headId = '<%=headId%>';
		var sheetType = '<%=sheetType%>';
		var bodyId = gr;
		var rdBasicWidth = "1000px";
		var rdBasicHeight = "1500px";
		var url = '<%=request.getContextPath()%>/kpgl/cardBody_modifyBody.do?bodyId='+bodyId+'&headId='+headId+"&sheetType="+sheetType;
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
		window.open(url,'',_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}
// 添加
function addAss1(){
	var headId = '<%=headId%>';
	var sheetType = '<%=sheetType%>';
	var rdBasicWidth = "1500px";
	var rdBasicHeight = "1500px";
	var url = '<%=request.getContextPath()%>/kpgl/cardBody_addBody.do?headId='+headId+'&sheetType='+sheetType+'&sfzy=1';
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.open(url,'',_g_privateDialogFeatures);
}

function changeNgbmmc(){
	var dept = document.getElementById("ngbm");
 	var i =document.getElementById("ngbm").selectedIndex;
 	document.getElementById("ngbmmc").value =dept.options[i].text;
}

function addType1(selectId){
		if (selectId.value == '1'){
			//$("#testDiv tr:first-child").next("tr").hide();
			$("#testDiv").find("tr:contains('审核部门意见：')").hide();
		}else{
			//$("#testDiv tr:first-child").next("tr").show(); 
			$("#testDiv").find("tr:contains('审核部门意见：')").show();
		}		
	}
// 提交时页面验证
function checkEAMFormJSMethod(){
	var zykpxz = document.getElementById('zykpxz').value;
	var ids = '';
	if(zykpxz == '1'){
		ids = jQuery("#private_use").jqGrid('getDataIDs');
	}else if(zykpxz == '0'){
		ids = jQuery("#purchase_list").jqGrid('getDataIDs');
	}
	var title = document.getElementById("biaoti");
	var lxdh = document.getElementById("lxdh");
	var sheetId = document.getElementById("bianhao");
	var bz = document.getElementById('bz');
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
    if(bz.value == null || bz.value.length == 0){
    	alert("申请理由不能为空！");
    	lxdh.focus();
    	return false;
    }
    if(ids == null || ids.length == 0 || ids == ''){
    	alert("至少保存一条表体记录！");
    	return false;
    }
    return true;
}
</script>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if("<%=request.getAttribute("ErpMessage")%>" != "null") {
		alert("<%=request.getAttribute("ErpMessage")%>"); 
	}
</SCRIPT>