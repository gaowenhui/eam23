<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String headId = request.getAttribute("head.sheadId").toString();
  String userTid = (String) request.getAttribute("userTid");
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zyzc/borrow/reborrow.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="pragma" content="no-cache"/>
		<title>自用资产续借申请</title>
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "zyzcWorkflow";
			actionPath = "zyzcWorkflow";
		%>
		<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
		<script type="text/javascript">
			$(function(){
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
				jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width()); 
				jQuery("#reborrow_list").setGridWidth($("#gridTable").width());
				jQuery("#file_list").setGridWidth($("#gridTable").width());
			        $(window).bind('resize', function(){
			        	jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
						jQuery("#reborrow_list").setGridWidth($("#gridTable").width());
						jQuery("#file_list").setGridWidth($("#gridTable").width());
			    });
			
			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
			    <e:pc id="reborrow_list">
					var buttonJSonString = '[{"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
											 {"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"deleteBody","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_reborrow_list > .ui-jqgrid-titlebar"),buttonJSonString);
				</e:pc>
				
				//----------------------------------------办理依据按钮--------------------------------------------	
				<e:pc id="blyj_reason_list">
					var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
				</e:pc>
				
			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
			    <e:pc id="file_list">
					var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		       	</e:pc>
		       	
			    <e:pc id="completeButton">
					var parentButtonStr = '[{"buttonHandler":"mainWindow.saveToTZ","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';		
										  	  window.parent.appendButtonsFromChildren(parentButtonStr,"");
				</e:pc>
		       	
				<e:pc id="shengcheng">
					var headBHGen = document.getElementById("bianhao11").value;
					if(headBHGen == null || headBHGen.length == 0){
						var buttonStr_stztcz5 = '[{"id":"shengchenButton","buttonHandler":"mainWindow.generateSheetNum","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
						window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
					}
				</e:pc>
			});
			
				//验证标题为空
			function checkEAMFormTitle(){
				var title = document.getElementById("title");
				if(title.value == null || title.value.trim().length == 0){
					alert("标题不能为空！");
					title.focus();
      				return false;
    				}
    		 	return true;
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
		<s:form action="zyzc/ZCManageHead_saveHead.do" name="myform" id="myform">
		<br/><br/>
		<div align="center"><span class="STYLE1">中国建银投资有限责任公司自用资产续借申请</span></div>
		<br/>
		<hr color="#6600CC" align="center" width="100%" />
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<!-- =========================================================================== -->
		<s:hidden name="head.sheadId" id="sheadId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="head.sheetType" id="sheetType" value="%{#request.head.sheetType}"></s:hidden>
		<s:hidden name="sheettype" id="sheettype"></s:hidden>
		<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
		<s:set name="biaodanid" value="%{#request.head.sheadId}"/>
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden id="deptid" view="N" />
		<!-- ==========================定义工作流隐藏域==================================== -->
		<% String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";%>
		<!-- 工作流表单提交URL设置 -->
		<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zyzc/ZCManageHead_saveHead.do"/>
		<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
		<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
		<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
		<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
		<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
		<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zyzc/ZCManageHead_saveHead.do"/>
		<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
		<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zyzc/ZCManageHead_saveHead.do"/>
		<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zyzc/ZCManageHead_saveHead.do"/>
		<!-- 保存后台的URL -->
		<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
		<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<!-- 传阅 -->
		<input type="hidden" name="circulationUrl" value="zyzc/ZCManageHead_modifyHead.do"/>
		<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
		<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.title" />"/>
		<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
		<!-- =========================================================================== -->

		<table id="gridTable" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>标题：
				</td>
				<td colspan="3" class="td_zxy02">
					<r:textfield name="head.title" cssClass="input2" id="title"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<s:textfield name="head.sheetId" disabled="true" cssClass="input" id="bianhao11" />
				</td>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>联系电话：
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.ldxh" cssClass="input" id="ldxh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden name="head.ngrbh" id="ngrbh"></s:hidden>
					<s:textfield cssClass="input" disabled="true" name="head.ngrmc" id='ngrmc' />
				</td>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<r:textfield name="head.ngrq" disabled="true" cssClass="input" id="ngrq" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden name="head.ngbmmc" id="ngbmmc"></s:hidden>
					<e:dept userTid="<%=userTid%>" list="#{}" cssClass="input" name="head.ngbmbh" onchange ="changeNgbmmc()" id="ngbmbh"/>
					
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02" id="purchaseDateTd">
					<r:select list="{'一般','急','特急'}" cssClass="input" name="head.jhcd" />
				</td>
			</tr>
		</table>

		<table id="reborrow_list"></table>
		<!-- ------------------------------- 办理依据 --------------------------------- -->
		<%@ include file="/inc/according.inc"%> 
		<div id="pgtoolbar" style="display: none"></div>
		<script type="text/javascript">
			jQuery("#reborrow_list").jqGrid({
			    url:"<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do",
			    postData:{"head.sheadId" : $("#sheadId").val()},
				datatype: "json",
			    colNames:['id','一级分类','二级分类','三级分类',
			   			  '资产编号','数量','单位',
			   			  '借用人','借用部门','借用开始日期','借用结束日期','借用天数','续借后是否转领用'],
			   	colModel:[
			     	{name:'sbodyId',index:'sbodyId',hidden:true},
			   		{name:'yjflmc',index:'yjflmc'},
			   		{name:'ejflmc',index:'ejflmc'},
			   		{name:'sjflmc',index:'sjflmc'},
			   		{name:'zcbh',index:'zcbh'},
			   		{name:'sl',index:'sl'},	
			   		{name:'jldw',index:'jldw'},	
			   		{name:'sqrmc',index:'sqrmc',align:"center"},
					{name:'sqbmmc',index:'sqbmmc'},
					{name:'jylyrq',index:'jylyrq'},
					{name:'jydqrq',index:'jydqrq'},
					{name:'jyts',index:'jyts'},
					{name:'sfxj',index:'sfxj'}
			   	],		  
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:1000000,
				rowList:[10,20,30],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption: "续借物品清单 ",
				jsonReader : {
					root:"rows",
					page: "page",
					total: "total",
					records: "records",
					repeatitems: false,
					id: "0"
				},
				gridComplete:function(){
					var dataIds = jQuery("#reborrow_list").getDataIDs();
					if(dataIds.length > 0){
						$.post(
							"<%=basePath%>zyzc/ZCManageBody_getAlreadyXJDataIdStr.do",
							{"dataIds":""+dataIds},
							function(data){
								if(data.length > 0){
									var alreadyXJDataIdArr = data.split(">#,#<");
									var notEmptyalreadyXJDataIdArr = new Array();
									var j = 0;
									for(var i = 0; i < alreadyXJDataIdArr.length; i++){
										if(alreadyXJDataIdArr[i] != ""){
											notEmptyalreadyXJDataIdArr[j] = alreadyXJDataIdArr[i];
											j++;
										}
									}
									var dataIds = jQuery("#reborrow_list").getDataIDs();
									for(var i = 0; i < dataIds.length; i++){
										var sfxj1 = false;
										for(var j = 0; j < notEmptyalreadyXJDataIdArr.length; j++){
											if(dataIds[i] == notEmptyalreadyXJDataIdArr[j]){
												jQuery("#reborrow_list").setCell(dataIds[i],"sfxj","是");
												sfxj1 = true;
												break;
											}
										}
										if(!sfxj1){
											jQuery("#reborrow_list").setCell(dataIds[i],"sfxj","否");
										}
									}
								}else{
									var dataIds = jQuery("#reborrow_list").getDataIDs();
									for(var i = 0; i < dataIds.length; i++){
										jQuery("#reborrow_list").setCell(dataIds[i],"sfxj","否");
									}
								}
							}
						);
					}
				}
			});
		</script>

		<e:opinion id="test" width="100%">
			<e:opinionPart id="CHECK_DEPT" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT" value="" text="承办部门意见："></e:opinionPart>
			<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
		<%@ include file="/inc/listMessage.inc"%>
	</s:form>
		<script type="text/javascript">
			function checkEAMFormJSMethod(){
				var ti = document.getElementById("title");
				if(ti.value == null || ti.value.length == 0){
					alert("标题不能为空！");
					ti.focus();
			      return false;
			    }
			    var tel = document.getElementById("ldxh").value;
			    var telElement = document.getElementById("ldxh");
				if(trim(tel).length > 0){
					if(!(isPhoneWithoutAlert(tel) || checkMobilePhoneWithoutAlert(tel))){
						alert("电话号码输入不正确，请重新输入！");
						telElement.focus();
						return false;
					}
				}else{
					alert("联系电话不能为空！");
					telElement.focus();
					return false;
				}
				var idArray = $("#reborrow_list").getDataIDs();
			    if(idArray == null||idArray.length == 0){
			       alert("请至少添加一条资产");
			        return false;
			    }
			    
			    var sqbmmc = jQuery("#reborrow_list").getCol("sqbmmc");
			    var jylyrq = jQuery("#reborrow_list").getCol("jylyrq");
			    var jydqrq = jQuery("#reborrow_list").getCol("jydqrq");
			    var jyts = jQuery("#reborrow_list").getCol("jyts");
			    var dataIds = jQuery("#reborrow_list").getDataIDs();
			    for(var i = 0; i < dataIds.length; i++){
			    	var sfxj = jQuery("#reborrow_list").getCell(dataIds[i],"sfxj");
			    	if(sqbmmc[i] == 0){
			    		alert("申请部门不能为空！");
			    		return false;
			    	}else if(jylyrq[i] == ""){
			    		alert("借用开始日期不能为空！");
			    		return false;
			    	}else if(jydqrq[i] == "" && sfxj == "否"){
			    		var sjflmc = jQuery("#reborrow_list").getCell(dataIds[i],"sjflmc");
			    		var zcbh = jQuery("#reborrow_list").getCell(dataIds[i],"zcbh");
			    		alert("资产编号为"+zcbh+"的"+sjflmc+"，其借用结束日期不能为空！");
			    		return false;
			    	}else if((jyts[i] == "" || jyts[i] == 0) && sfxj == "否"){
			    		alert("借用天数不能为空！");
			    		return false;
			    	}
			    }
			    
				return true;
			}
			
			function changeNgbmmc(){
		   var dept = document.getElementById("ngbmbh");
	       var i =document.getElementById("ngbmbh").selectedIndex;
	       document.getElementById("ngbmmc").value =dept.options[i].text;
		}
			
			function generateSheetNum(){
				$.post("zyzc/ZCManageHead_generateSheetNum.do",{
					"headId"		:	$("#sheadId").val(),
					"sheettype"		:	$("#sheetType").val(),
					"head.ngbmbh"	:	$("#ngbmbh").val(),
					"head.ngbmmc" 	:	$("#ngbmmc").val()
				},function(data){
					$("#bianhao11").val(data);
					window.parent.removeObj("#shengchenButton");
				});
			}
			
			//添加资产信息
			function add(){
				var sheadId = $("#sheadId").val();
				var sheettype = $("#sheetType").val();
				window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype='+sheettype+'&headId='+sheadId,
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		
			function deleteBody(){
				var gr = jQuery("#reborrow_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
						$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
							jQuery("#reborrow_list").trigger("reloadGrid");
						});
					}
				}
			}
			
			function modifyBody(){
				var gr=jQuery("#reborrow_list").jqGrid('getGridParam','selarrrow');
				var sheettype = $("#sheetType").val();
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if(gr.length == 1){
					var bodyId = gr;
					var sfxj = jQuery("#reborrow_list").getCell(gr,"sfxj");
					if(sfxj == "是"){
						sfxj = '1';
					}else if(sfxj == "否"){
						sfxj = '0';
					}
					window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype='+sheettype+'&bodyId='+bodyId+'&sfxj='+sfxj,
						'','top=200,left=200,width=800,height=380,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#reborrow_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					var sfxj = jQuery("#reborrow_list").getCell(gr,"sfxj");
					if(sfxj == "是"){
						sfxj = '1';
					}else if(sfxj == "否"){
						sfxj = '0';
					}
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sfxj="+sfxj+"&sheettype="+$("#sheetType").val()+"_view",
				'','height=210, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function saveZcListToBody(delBodyIds){
				$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
						{
							"delBodyIds"	:	""+delBodyIds,
							"head.sheadId"	:	$("#sheadId").val(),
							"sheettype"		: 	$("#sheettype").val()
						},function(data){
							jQuery("#reborrow_list").trigger("reloadGrid");
						}
				);
			}
			
			//保存到台账
			//function saveToTZ(){
			//	var sheettype = document.getElementById("sheetType").value;
			//	var sheadId = document.getElementById("sheadId").value;
			//	$.post("<%=basePath%>zyzc/ZCManageBody_saveInfoToKCtz.do",
			//		   {'sheettype':sheettype,'headId':sheadId},function(data){}
			//	);
			//}
			
			//保存到台账
			function saveToTZ(){
				if(!confirm('确定要办结处理单吗？')){
					return false;
				}
				var taskId = "<%=workflowVO.taskId%>";
				var outCome = document.myform.outCome.value;
				var sheettype = document.getElementById("sheetType").value;
				var sheadId = document.getElementById("sheadId").value;
				$.post("<%=basePath%>zyzc/ZCManageBody_finishWork.do",
					   {'sheettype':sheettype,'headId':sheadId},function(data){
					   		taskDone(data, taskId);
					   }
				);
			}
			
			function taskDone(data, taskId){
				if(data == "ok"){
					// if(confirm('确定要办结处理单吗？')){
						document.myform.action = document.getElementById("endUrl").value;
						document.myform.url.value = document.getElementById("endViewUrl").value;
						document.myform.taskId.value = taskId;
						document.myform.sheetId.value = document.getElementById("bianhao11").value;
						document.myform.outCome.value = "流程办结";
						document.myform.submit();
						return;
					// }
				}else{
					alert("办结处理未成功！");
				}
			}
			
			//修改的情况下用此函数刷新grid
			function refreshGrid(){
				jQuery("#reborrow_list").trigger("reloadGrid");
			}
		</script>
	</body>
</html>