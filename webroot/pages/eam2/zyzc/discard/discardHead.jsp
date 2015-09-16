<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zyzc/discard/discard.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String userTid = (String) request.getAttribute("userTid");
	String headId = request.getAttribute("head.sheadId").toString();
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
	status = "99999";
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(workflowVO.taskName.equals("账管处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="pragma" content="no-cache"/>
		<title>资产报废审批</title>
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
	        window.parent.clearPanelTool();
			<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
			
			jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
			jQuery("#fixAssetList").setGridWidth($("#gridTable").width());
			jQuery("#file_list").setGridWidth($("#gridTable").width());
			jQuery("#file_huiqianlist").setGridWidth($("#gridTable").width());
			jQuery("#file_huiqian_endlist").setGridWidth($("#gridTable").width());
	        $(window).bind('resize',function(){
	        	jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
				jQuery("#fixAssetList").setGridWidth($("#gridTable").width());
				jQuery("#file_list").setGridWidth($("#gridTable").width());
				jQuery("#file_huiqianlist").setGridWidth($("#gridTable").width());
				jQuery("#file_huiqian_endlist").setGridWidth($("#gridTable").width());
	        });
			
			$("#bfrq").datebox({
          		formatter:function(date){
	    			return formatDate(date);
	    		}
    		});
			//添加按钮
			//{"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
			<e:pc id="fixAssetList">
				var buttonJSonString = '[\<%
										 if(!inCounterSign){
										%>
										 {"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"增加"},\
										 {"buttonHandler":"deleteBody","buttonIcon":"icon-remove","buttonText":"删除"},\
										 <%}%>{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"}\
				]';
				addButtons(jQuery("#gview_fixAssetList > .ui-jqgrid-titlebar"),buttonJSonString);
			</e:pc>
			
			<e:pc id="blyj_reason_list">
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			</e:pc>
			<%
				if(!inCounterSign){
			%>
			<e:pc id="shengcheng">
				var headBHGen = document.getElementById("bianhao11").value;
				if(headBHGen == null || headBHGen.length == 0){
					var buttonStr_stztcz5 = '[{"id":"shengchenButton","buttonHandler":"mainWindow.generateSheetNum","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
					window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
				}
			</e:pc>
			
			<e:pc id="completeButton">
				var parentButtonStr = '[{"buttonHandler":"mainWindow.saveToTZ","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';		
									  window.parent.appendButtonsFromChildren(parentButtonStr,"");
			</e:pc>
			<e:pc id="file_list">
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		    </e:pc> 
		 	<%
			  }
			%>
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
	<s:form action="zyzc/ZCManageHead_saveHead.do" method="POST" name="myform" id="myform">
		<!-- <div style="text-align: right">
			<input type="button" style="display:none;margin-right:5px" id="completeButton" value="办结" onclick="saveToTZ();"/>
		</div> -->
		<br/><br/>
		<div align="center">
			<span class="STYLE1">中国建银投资有限责任公司资产报废审批<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
		</div>
		<hr color="#6600CC" align="center" width="100%" />
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<!-- =========================================================================== -->
		<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
		<s:hidden name="head.sheetType" id="sheettype"></s:hidden>
		<s:hidden name="sheettype"></s:hidden>
		<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
		<s:set name="biaodanid" value="%{#request.head.sheadId}"/>
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden id="deptid" view="N" />
		<!-- ==========================定义工作流隐藏域==================================== -->
		<%
			String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
		%>
				
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
		<!-- 会签属性 -->
		<input type="hidden" name=counterSignTitle value="<s:property value="head.title" /> 会签办理单"/>
		<input type="hidden" name="counterSignUrl" value="zyzc/ZCManageHead_modifyHead"/>
		<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
		<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
		<!-- =========================================================================== -->
	
		<table id="gridTable" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>标题：
				</td>
				<td colspan="3" class="td_zxy02">
					<r:textfield name="head.title" cssClass="input2" id="title" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" disabled="true" name="head.sheetId" id="bianhao11" />
				</td>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<r:textfield name="head.ngrq" disabled="true" cssClass="input" id="ngrq" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden name="head.ngrbh" id="ngrbh"></s:hidden>
					<r:textfield name="head.ngrmc" disabled="true" cssClass="input" id="ngrmc" />
				</td>
				<td class="td_zxy01">报废日期：</td>
				<td class="td_zxy02">
					<r:textfield name="head.bfrq" readonly="true" cssClass="input" id="bfrq" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden name="head.ngbmmc" id="ngbmmc"></s:hidden>
				    <e:dept userTid="<%=userTid%>" list="#{}" cssClass="input" name="head.ngbmbh" onchange ="changeNgbmmc()" id="ngbmbh"/>
					
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select name="head.jhcd" cssClass="input" id="jhcd" list="{'一般','急','特急'}"></r:select>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>联系电话：
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.ldxh" cssClass="input" id="ldxh" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_zxy01">会签部门：</td>
			    <td class="td_zxy03" colspan="3" ><r:textfield name="head.hqbm" id="hqbmvalue" cssClass="input2" readonly="true"/>
				    <s:hidden  name="head.hqbmId" id="hqbmids"/>
				    <e:pc id="hubmxz">
			       		<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('hqbm');" width="21" height="20" align="absmiddle"/>
			       	</e:pc>
			       	<%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>	 	
		       	</td>
		        
			</tr>	
			<tr>
				<td class="td_zxy01">报废原因：</td>
				<td colspan="3" class="td_zxy02">
					<r:textarea id="ytxq" rows="4" cssClass="area" name="head.ytxq"/>
				</td>
			</tr>
		</table>

		<table id="fixAssetList"></table>
		<!-- ------------------------------- 办理依据 --------------------------------- -->
		<%@ include file="/inc/according.inc"%> 
		<div id="pgtoolbar" style="display: none"></div>
		<script type="text/javascript">
			jQuery("#fixAssetList").jqGrid({
				url:'<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do',
				postData:{"head.sheadId" : $("#sheadId").val()},
				datatype:"json",
				colNames:['id','zcId','一级分类','二级分类','三级分类',
						  '资产名称','资产编号','品牌/规格型号',
						  '单价','单位','数量','金额'],
				colModel:[	
					{name:'sbodyId',index:'sbodyId',hidden:true},
					{name:'zcId',index:'zcId',hidden:true},
					{name:'yjflmc',index:'yjflmc'},
					{name:'ejflmc',index:'ejflmc'},
					{name:'sjflmc',index:'sjflmc'},
					{name:'zcmc',index:'zcmc'},
					{name:'zcbh',index:'zcbh'},
					{name:'gg',index:'gg'},
					{name:'dj',index:'dj'},
					{name:'jldw',index:'jldw'},
					{name:'sl',index:'sl'},
					{name:'je',index:'je'}
				],
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:1000000,
				rowList:[10,20,30],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption: '报废物品清单',
				jsonReader : {
					root:"rows",
					page: "page",
					total: "total",
					records: "records",
					repeatitems: false,
					id: "0"
				}
			});
		</script>
		<e:opinion id="test" width="100%">
			<e:opinionPart id="LEADER" biaodanid="%{#request.biaodanid}"  name="LEADER" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}"  name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
				<!-- ==========================工作流信息项======================================= -->
				<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
				<!-- =========================================================================== -->
			<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
		<%@ include file="/inc/file.inc"%>
		<%@ include file="/inc/file_huiqian_end.inc"%>
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
				var idArray = $("#fixAssetList").getDataIDs();
			    if(idArray == null||idArray.length == 0){
			       alert("请至少添加一条资产");
			        return false;
			    }	
				return true;
				
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
			
			function changeNgbmmc(){
		  	 	var dept = document.getElementById("ngbmbh");
	       		var i =document.getElementById("ngbmbh").selectedIndex;
	       		document.getElementById("ngbmmc").value =dept.options[i].text;
		}
			
			function generateSheetNum(){
				$.post("zyzc/ZCManageHead_generateSheetNum.do",{
					"headId"		:	$("#sheadId").val(),
					"sheettype"		:	$("#sheettype").val(),
					"head.ngbmbh"	:	$("#ngbmbh").val(),
					"head.ngbmmc" 	:	$("#ngbmmc").val()
				},function(data){
					$("#bianhao11").val(data);
					window.parent.removeObj("#shengchenButton");
				});
			}
		
			function add(){
				var sheadId = document.getElementById("sheadId").value;
				window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype=addDiscard'+'&headId='+sheadId,
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			function deleteBody(){
				var gr = jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
						$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
							jQuery("#fixAssetList").trigger("reloadGrid");
						});
					}
				}
			}
			
			function modifyBody(){
				var gr=jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr.length == 1 ){
					var bodyId = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype=discard&bodyId='+bodyId,
						'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheettype").val()+"_view",
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function batMod(){
				var gr=jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
				if(gr.length <= 1){
					alert('最少要选择两条需要修改的记录！');
				}else if( gr.length > 1 ){
					var bodyIds = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype=discard&bodyIds='+bodyIds,
						'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			function saveZcListToBody(){
				$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
						{
							"delBodyIds"	:	$("#delBodyIds").val(),
							"head.sheadId"	:	$("#sheadId").val()
						},function(data){
							jQuery("#fixAssetList").trigger("reloadGrid");
						}
				);
			}
			
			//修改的情况下用此函数刷新grid
			function refreshGrid(){
				jQuery("#fixAssetList").trigger("reloadGrid");
			}
			
			//保存到台账
			function saveToTZ(){
				if(!confirm('确定要办结处理单吗？')){
					return false;
				}
				
				var gridIds = jQuery("#fixAssetList").getDataIDs();
				var tempSL = 0;
				for(var i = 0; i < gridIds.length; i++){
					var yjflmc = jQuery("#fixAssetList").getCell(gridIds[i],"yjflmc");
					var fixAssetSL = ""; 
					if(yjflmc.indexOf("固定资产") > 0){
						fixAssetSL = jQuery("#fixAssetList").getCell(gridIds[i],"sl");
						tempSL = tempSL + parseInt(fixAssetSL);
					}
				}
				if(tempSL > 0){
					alert("报废的物品含有"+tempSL+"项固定资产，请您在本表单办结完成后，到卡片管理模块下的卡片减少处理单中，对相应的资产做卡片减少！");
				}
				
				var taskId = "<%=workflowVO.taskId%>";
				var outCome = document.myform.outCome.value;
				var sheettype = document.getElementById("sheettype").value;
				var sheadId = document.getElementById("sheadId").value;
				$.post("<%=basePath%>zyzc/ZCManageBody_finishWork4Discard.do",
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
        </script>
	</body>
</html>