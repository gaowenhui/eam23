<%@ page language="java"
	import="java.util.*,com.tansun.rdp4j.common.util.*"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc"%>
<%
	String userTid = (String) request.getAttribute("userTid");
	String headId = (String) request.getAttribute("headId");
	String ids = (String) request.getAttribute("headId");
	String look = (String) request.getAttribute("look");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus
			.getStatus(headId);

	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(
			headId, "bank_Template");
%>

<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stock/shixiangshenpi/inStock.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->

<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if (workflowVO.taskName.equals("拟稿部门综合处理")) {
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<base href="<%=basePath%>" />
		<title>债券相关事项审批</title>
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "approveWorkflow";
			actionPath = "approveWorkflow";
		%>
		<%@ include
			file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
		<script type="text/javascript">
var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
	var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
 var isInit=false;
	  if("0"=="<%=status%>"){
     	var isNew = true;
	  }else{
     	var isNew = false;
      } 
	  if("2"=="<%=status%>"){
      	var isMerge = true;
      }	else{
      	var isMerge = false;
      } 
      
$(document).ready(function(){
   window.parent.clearPanelTool();
	if('1' == '<%=look%>'){
	  var a  = document.getElementsByTagName("input");
	  var b  = document.getElementsByTagName("select");
	  var c  = document.getElementsByTagName("textarea");
		for(var i=0;i<a.length;i++){
			a[i].disabled = "true";
		}
		for(var i=0;i<b.length;i++){
			b[i].disabled = "true";
		}
		for(var i=0;i<c.length;i++){
			c[i].disabled = "true";
		}				
	}
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
	<%if(workflowVO.taskName.equals("拟稿部门综合处理")){
	   counterSignBtnDisplay = true;
	 }
	%>
	<%
	   if(!inCounterSign){
	%>
	//查看正文按钮
	<e:pc id="ckzw">
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	   //生成编号
    <e:pc id="scbh">
				var headBHGen = document.getElementById("sheet").value;
				if(headBHGen == null || headBHGen.length == 0){
					window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
			}else{
				//合成正文按钮
					<e:pc id="hechengzhengwen">
					   <%
					    if(!status.equals("2")){
					   %>
						window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
						<%
						   }
						%>
				</e:pc>
			}
		</e:pc>
		//查看正文按钮
		<e:pc id="InStockButtonControl">
			if( 1 != '<%=look%>'){
					var buttonJSonString = '[{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
			}		
							
			addButtons(jQuery("#gview_all_Attachment> .ui-jqgrid-titlebar"),buttonJSonString);
		
		</e:pc>
	<e:pc id="blyj_reason_list">
    var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
	]';
	addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	</e:pc>
	<e:pc id="file_list">
	var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
								{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                {"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
	]';
	addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
	</e:pc>
	
	//（处理）新建正文按钮
	<e:pc id="sczw">
		var buttonStr_zhengwen3 = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文"%>"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen3,"");
	</e:pc> 
	
     <e:pc id="banjie">
	var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.completeHead","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
	window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
    </e:pc>
	<%
	   }else{
   %>  	

	//查看正文按钮
	<e:pc id="ckzw">
	var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
	window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
<%}%>

	jQuery("#all_Attachment").setGridWidth($("#common_tableWidth").width());
	jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_huiqian_endlist").setGridWidth($("#common_tableWidth").width());
	$(window).bind('resize', function(){
		jQuery("#all_Attachment").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#common_tableWidth").width());
	});
	
});

	function createBianhao(){
		$.post("<%=basePath%>stock/approve_crateStockBh.do",{
			"sheadId":'' + document.getElementById('headId').value,
			"bmbh":'' + document.getElementById('deptid').value,
			"bmmc":'' + document.getElementById('ngbmmc').value
		},function(data){
			$("#sheet").val(data);
			window.parent.removeObj("#shengchenButton");
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		});
}
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
		
		
		//（处理）新建正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "债券管理正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"债券管理正文"); 
		}
		
		//合成正文
		function hechengzhengwen(){
		
		var bianhao = document.getElementById('sheet').value;
		if(bianhao=='' || bianhao==null){
		alert("请先生成编号");
		return false;
		}
		MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "债券管理正文",'hechengHead()','hechengBottom()');
		window.parent.removeObj("#hczwButton");
		window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
		}
		
		function hechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("sheet").value,2,false,false,false,false);
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
			$.post("<%=basePath%>file/file_getFileList.do",{
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
		//办结
		function completeHead(){
		//只是调用邵寻写的需要办结的东西 
		         if(confirm('确定要提交'+'流程办结'+'吗？')){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.sheetId.value = document.getElementById("sheet").value;
					document.myform.outCome.value = "流程办结";
					document.myform.submit();
	 	            }
	 	           }
	 	
	   function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}           
</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<%@ include file="/inc/word.inc"%>
		<s:form method="post" name="myform" id="myform"
			action="approve_saveHead">
			<s:hidden name="head.sheadId"  id="headId" value="%{#request.head.sheadId}" />
			<s:hidden name="head.sheetType" id="sheetType" value="%{#request.head.sheetType}"></s:hidden>
			<s:hidden name="head.lcmc" id="lcmc" value="债券相关事项审批" />
        
			<!-- 意见域、 依据和文件上传需要表单id -->
			<s:set name="biaodanid" value="head.sheadId" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<s:hidden name="headId" value="%{#request.biaodanid}" />
			
			<!-- 意见域、 依据和文件上传需要表单id -->
			<!-- ==========================定义工作流隐藏域==================================== -->
			<%
				String urlHeader = request.getContextPath() + "/" + actionSpaceName
						+ "/" + actionPath + "_";
			%>
			<!-- 工作流表单提交URL设置 -->
			<input type="hidden" id="commitUrl"
				value="<%=request.getContextPath()%>/stock/approve_saveHead.do" />
			<input type="hidden" id="abandonUrl"
				value="<%=urlHeader + abandonMethod + ".do"%>" />
			<input type="hidden" id="abandonViewUrl"
				value="<%=urlHeader + "abandonView.do"%>" />
			<input type="hidden" id="endUrl"
				value="<%=urlHeader + endMethod + ".do"%>" />
			<input type="hidden" id="endViewUrl"
				value="<%=urlHeader + "endView.do"%>" />
			<input type="hidden" id="participationUrl"
				value="<%=urlHeader + participationMethod + ".do"%>" />
			<input type="hidden" id="commitDraftUrl"
				value="<%=request.getContextPath()%>/stock/approve_saveHead.do" />
			<input type="hidden" id="draftParticipationUrl"
				value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
			<input type="hidden" id="saveDraftUrl"
				value="<%=request.getContextPath()%>/stock/approve_saveHead.do" />
			<input type="hidden" id="saveTodoUrl"
				value="<%=request.getContextPath()%>/stock/approve_saveHead.do" />
			<!-- 保存后台的URL -->
			<input type="hidden" id="commitNextTodoUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
			<input type="hidden" id="commitDidUrl"
				value="<%=urlHeader + "did.do"%>" />
			<input type="hidden" id="draftCommitUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do" />
			<input type="hidden" id="draftCommitTodoUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
			<input type="hidden" id="draftCommitNextTodoUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
			<input type="hidden" id="draftCommitDidUrl"
				value="<%=urlHeader + "did.do"%>" />
			<!-- 传阅 -->
			<input type="hidden" name="circulationUrl"
				value="stock/approve_modifyHead.do" />
			<input type="hidden" name="circulationParam"
				value="headId=<%=headId%>" />
			<input type="hidden" name="circulationTitle"
				value="[传阅] <s:property value="head.title" /> 审批申请" />
			<input type="hidden" id="circulationParticipation"
				value="<%=urlHeader + "getCirculationParticipationList.do"%>" />
			<!-- 会签属性 -->

			<input type="hidden" name=counterSignTitle
				value="<s:property value="head.title" /> 会签办理单" />
			<input type="hidden" name="counterSignUrl"
				value="stock/approve_modifyHead" />
			<input type="hidden" name="actionName" value="<%=actionPath%>_todo" />
			<input type="hidden" name="namespace" value="<%=actionSpaceName%>" />

			<!-- 新建正文需要的 -->
			<r:userhidden id="userid" />
			<r:depthidden view="N" name="deptnameshow" />
			<r:depthidden view="N" name="deptid" />

			<!-- =========================================================================== -->
			<br />
			<br />
			<div align="center">
				<span class="STYLE1">中国建银投资有限责任公司债券相关事项审批<%@ include
						file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
			</div>
			<!-- ==========================工作流信息项======================================= -->
			<%@ include
				file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
			<!-- =========================================================================== -->

			<br />
			<table id="common_tableWidth" width="100%" border="0" cellpadding="2"
				cellspacing="0" align="center">
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font> 标 题：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.title" id="title" cssClass="input2" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font> 呈送：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.chengsong" id="chengsong"
							cssClass="input2" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						编号：
					</td>
					<td class="td_zxy02">
						<s:textfield name="head.sheetId" id="sheet" cssClass="input"></s:textfield>
					</td>
					<td class="td_zxy01">
						急缓程度：
					</td>
					<td class="td_zxy02">
						<r:select list="#{1:'一般',2:'急',3:'特急'}" name="head.jhcd" id="jhcd"
							value="%{#request.head.jhcd}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						拟稿人：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.ngrmc" id="ngrmc" label=""
							cssClass="input" readonly="true"></r:textfield>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font> 联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.ldxh" cssClass="input" type="text"
							id="ldxh" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						拟稿日期：
					</td>
					<td class="td_zxy02">
						<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<r:textfield id="ngrq" name="head.ngrq" cssClass="input"
							value="%{#draftDate}" cssClass="input" readonly="true" />
					</td>
					<td class="td_zxy01">
						拟稿部门：
					</td>
					<td class="td_zxy02">
						<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    				<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbmbh" onchange ="changeNgbmmc()" id="ngbm"  />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						会签部门：
					</td>
					<td class="td_zxy03" colspan="3">
						<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"
							cssClass="input2" />
						<s:hidden name="head.hqbmid" id="hqbmids" />
						<e:pc id="xzhq">
							<img
								src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
								onclick="openTreeByType('hqbm');" width="21" height="20"
								align="absmiddle" />
						</e:pc>
						<%
							if (inCounterSign) {
						%><e:countersign biaodanId="%{#request.biaodanid}" />
						<%
							}
						%>
					</td>
				</tr>
			</table>
			<table id="all_Attachment"></table>
			<script type="text/javascript">
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
	
	function addAss(){
		var rdBasicWidth = "1000px";
		var rdBasicHeight = "800px";
		var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
//		var returnValue = window.showModalDialog('stgl/weihu_newEntity.do', window, _g_privateDialogFeatures);
		window.open('<%=basePath%>stock/maintain_listStockMaintain.do?sign='+1+'&headId='+'<%=headId%>');
		return false;
	}
		
		
	function delAss(){
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if( gr.length > 0 ) {
			if(confirm("确认删除！")){
				$.post("<%=basePath%>stock/approve_deleList.do",{
					"BodyIds":"" + gr
				},function(returnStr){
					alert(returnStr);
					$("#all_Attachment").trigger("reloadGrid");
				});
			}
		}
		else{
			alert("请选择要删除的记录!"); 		
			}
	}
		

	function query(){
		var entityvoassertNumber = document.getElementById("assertNumber").value;
		var entityvoentityName = document.getElementById("entityName").value ;
		var CGlbm = document.getElementById("CGlbm").value ;
		var CWtgljg = document.getElementById("CWtgljg").value;
		var province = document.getElementById("province").value;
			jQuery("#entity_list").setGridParam({postData:{
				'entityvo.assertNumber':'' + entityvoassertNumber,
				'entityvo.entityName':'' + entityvoentityName,
				'entityvo.CGlbm':'' + CGlbm,
				'entityvo.CWtgljg':'' + CWtgljg,
				'entityvo.province':''+ province
			}}).trigger("reloadGrid");
	}

	function reloadGrid(gr){
		$.post("<%=basePath%>stock/approve_saveBody.do",{
					"StockIds" : "" + gr,
					"sheadId" : "" + '<%=headId%>'
				},function(returnStr){
					jQuery("#all_Attachment").setGridParam({
						url:"<%=basePath%>stock/approve_viewListStock.do",
							postData:{
								"sheadId" : "" + '<%=headId%>'
							}
						}).trigger("reloadGrid");
					}
				);
	}
	
	
	function lookAsset(gr){
	  var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
	   var zcbhs  = jQuery("#all_Attachment").getCell(gr,'stockId');
			if(gr.length == 0 ){
					alert("请选择要添加的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要添加的记录")
				}else{
				var windowInfo = 'height=250, width=900, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';	
				window.open('<%=basePath%>stock/maintain_getSingle.do?id='+gr+'&zcbh='+zcbhs,'',windowInfo);
				return false;
			  }
	
	}
	jQuery("#all_Attachment").jqGrid({
		url:"<%=basePath%>stock/approve_viewListStock.do",
		postData:{"sheadId" : "" + '<%=headId%>', "Id":""+'<%=ids%>',"look":""+'<%=look%>'},
		datatype: "json",
		mtype:"POST",
		colNames:['id','stockId','债券名称','行名','债券种类','最新债券面值','到期日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'stockId',index:'stockId',hidden:true},
			{name:'zqmc',index:'zqmc'},
			{name:'jhfhmc',index:'jhfhmc'},
			{name:'zqzlmc',index:'zqzlmc'},
			{name:'zqmz',index:'zqmz',formatter:'number'},
			{name:'dqr',index:'DQR'}
		],
			multiselect:true,
			onSelectRow:true, 
			rownumbers:true,
			autowidth:true,
			height:'auto',
			rowList:[10,20,30],
			ondblClickRow:function(gr){
		      lookAsset(gr);
			},
			caption: '债券信息',
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
	});
	
</script>
			<%@ include file="/inc/according.inc"%>
			<e:opinion id="test" width="100%">
				<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER"
					name="LEADER" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart biaodanid="%{#request.biaodanid}"
					id="OPERATION_GROUP" name="OPERATION_GROUP" value=""
					text="业务运营组意见："></e:opinionPart>
				<e:opinionPart biaodanid="%{#request.biaodanid}" id="MEETING_DEPT"
					name="MEETING_DEPT" value="" text="会签部门意见：">
				</e:opinionPart>
				<!-- ==========================工作流信息项======================================= -->
				<%@ include	file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
				<!-- =========================================================================== -->
				<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT"
					name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
				<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"
					name="REMARK" value="" text="备注："></e:opinionPart>
			</e:opinion>
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_huiqian_end.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
		</s:form>
		<SCRIPT>
		function save(){
			if(checkEAMFormJSMethod()){
				$("#myform").attr("action","<%=basePath%>stock/approve_saveHead.do?headId="+'<%=headId%>');
		    	$("#myform").submit();
			}
		}
		function checkEAMFormJSMethod(){
			var title = document.getElementById("title");
			 var phone = document.getElementById("ldxh");
			 var chengsong = document.getElementById("chengsong");
			 
			if(title.value == null || title.value.length == 0){
				alert("标题不能为空!");
				title.focus();
		      return false;
		    }
		  if(chengsong.value == null || chengsong.value.length == 0){
				alert("呈送不能为空!");
				chengsong.focus();
		      return false;
		    }  
			if(trim(phone.value).length > 0){
				if(!(isPhoneWithoutAlert(phone.value) || checkMobilePhoneWithoutAlert(phone.value))){
					alert("电话号码输入不正确，请重新输入！");
					phone.focus();
					return false;
				}
			}else{
				alert("联系电话不能为空！");
				phone.focus();
				return false;
			}
			<e:pc id="scbh">
		    var bianhao = document.getElementById("sheet");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		        return false;
		    }
			</e:pc>
				    <e:pc id="sczw">
		    if(isNew){
	    		alert("请先新建正文");
	   	 		return false;
	    	}
    	  	</e:pc>
		     return true;
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
//			   		window.opener.location.reload();
			   		alert("保存成功!");
			   	}
		   });
		   
		});	
		
	//部门名称和部门id之间的转换
	function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
	}		
		
</SCRIPT>
	</body>
</html>
