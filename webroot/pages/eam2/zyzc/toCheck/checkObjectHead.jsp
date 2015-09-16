<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String headId = request.getAttribute("head.sheadId").toString();
  String userTid = (String) request.getAttribute("userTid");
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zyzc/toCheck/checkobject.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="pragma" content="no-cache"/>
		<title>盘点审批申请</title>
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
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width()); 
				jQuery("#assetList").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
				$(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
					jQuery("#assetList").setGridWidth($("#conditions").width());
					jQuery("#file_list").setGridWidth($("#conditions").width());
				});
				
				$("#pdrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				if("<%=workflowVO.taskName%>" != "拟稿"){
					$("#importPdpc").attr("style","display: none");
				}
				
				<e:pc id="assetList">
					var buttonsString = '[\
						{"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
						{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
						{"buttonHandler":"del","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_assetList > .ui-jqgrid-titlebar"),buttonsString);
				</e:pc>
				
				//----------------------------------------办理依据按钮--------------------------------------------	
				<e:pc id="blyj_reason_list">
					var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
				</e:pc>
				
				<e:pc id="completeButton">
					var parentButtonStr = '[{"buttonHandler":"mainWindow.endSheet","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';		
										  window.parent.appendButtonsFromChildren(parentButtonStr,"");
				</e:pc>
				<e:pc id="file_list">
					var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
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
	<s:form action="zyzc/ZCManageHead_saveHead.do" method="POST" name="myform" id="myform">
	<!-- 	<div style="text-align: right">
			<input type="button" style="display:none;margin-right:5px" id="completeButton" value="办结" onclick="saveToTZ();"/>
		</div> -->
		<br/><br/>
		<div align="center">
			<span class="STYLE1">中国建银投资有限责任公司自用资产盘点申请</span>
		</div>
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<!-- =========================================================================== -->
		<br />
		<hr color="#6600CC" width="100%" />
		<s:hidden name="head.sheadId" id="sheadId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="head.sheetType" id="sheetType" value="%{#request.head.sheetType}"></s:hidden>
		<s:hidden name="sheettype" id="sheettype" value="%{#request.sheettype}"></s:hidden>
		<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
		<s:set name="biaodanid" value="%{#request.head.sheadId}" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<s:hidden name="head.pdpc" id="pdpc"/>
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
		<table id="conditions" class="newtable" width="100%" cellpadding="0" cellspacing="0">
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
					<s:textfield name="head.sheetId" disabled="true" cssClass="input" id="bianhao11" />
				</td>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:textfield name="head.ngrq" disabled="true" cssClass="input" id="ngrq" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden name="head.ngrbh" id="ngrbh"></s:hidden>
					<s:textfield name="head.ngrmc" disabled="true" cssClass="input" id="ngrmc" />
				</td>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>联系电话：
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.ldxh" cssClass="input" id="ldxh" />
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
					<r:select name="head.jhcd" cssClass="input" list="{'一般','急','特急'}" id="jhcd"></r:select>
				</td>
			</tr>
			<tr id="importPdpc">
				<td class="td_zxy01">导入盘点批次文件：</td>
				<td class="td_zxy02" colspan="3">
					<input type="file" name="excelFilePath" value="" id="excelFileInput" onchange="ImportExcelToOrcl()" style="width:92%"/>
				</td>
			</tr>
		</table>
		<table id="assetList"></table>
		<div id="assetListPager"></div>
		<!-- ------------------------------- 办理依据 --------------------------------- -->
		<%@ include file="/inc/according.inc"%> 
		<script type="text/javascript">
			jQuery("#assetList").jqGrid({
				url:"<%=basePath %>zyzc/ZCManageBody_displayStockGrid.do",
				postData:{
					"headId"	:	""+"<%=headId%>"
				},
				datatype: "json",
				colNames:['id','zcId','一级分类','二级分类','三级分类','盘点批次','资产名称',
						  '品牌/规格型号','资产编号','使用人','使用部门',
						  '数量','盘点数量','单位','盘点结果'],
				colModel:[	
					{name:'id',index:'id',hidden:true},	
					{name:'zcId',index:'zcId',hidden:true},				
					{name:'yjflmc',index:'yjflmc'},
					{name:'ejflmc',index:'ejflmc'},
					{name:'sjflmc',index:'sjflmc'},
					{name:'pdpc',index:'pdpc'},				
					{name:'zcmc',index:'zcmc'},
					{name:'gg',index:'gg'},
					{name:'zcbh',index:'zcbh'},
					{name:'syrmc',index:'syrmc',align:"center"},
					{name:'sybmbmc',index:'sybmbmc',align:"center"},
					{name:'sl',index:'sl'},
					{name:'pdsl',index:'pdsl'},
					{name:'jldw',index:'jldw',sorttype:"float"},
					{name:'pdjg',index:'pdjg'}
				],
				pager:'assetListPager',
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:10,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  				rowList:[10,20,30],
				viewrecords:true,
				caption: '盘点物品清单',
				jsonReader : {
					root:"rows",
					page: "page",
					total: "total",
					records: "records",
					repeatitems: false,
					id: "0"
				},
				gridComplete:function(){
					var bodyIdArr = jQuery("#assetList").getDataIDs();
					for(var i=0; i<bodyIdArr.length; i++){
						var pc = jQuery("#assetList").getCell(bodyIdArr[i],'pdpc');
						if(pc.length != 0){
							$("#pdpc").val(pc);
							break;
						}
					}
				}
			});
		</script>
		<e:opinion id="test" width="100%">
			<e:opinionPart id="CHECK_DEPT" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT" value=""
				text="批示意见："></e:opinionPart>
			<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value=""
				text="拟稿部门意见："></e:opinionPart>
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
				var idArray = $("#assetList").getDataIDs();
			    if(idArray == null||idArray.length == 0){
			       alert("请至少添加一条资产");
			       return false;
			    }
				return true;
			}
			
			//查看物品详细信息
			function viewDetail(){
				var gr = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ToCheck_viewDetailFromPdxx.do?zcId=' + gr,
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
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
		
			//盘盈的情况
			function panYing(){
				if($("#pdpc").val() == "0"){
					alert("请先选择盘点批次！")
					$("#pdpc").focus;
					return false;
				}
				window.open('<%=request.getContextPath()%>/zyzc/ToCheck_panYing.do?sheettype=tocheckobjectadd',
						'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			function del(){
				var gr = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var delUrl ="<%=request.getContextPath()%>/zyzc/ZCManageHead_delPdxxRecord.do";
						$.post(delUrl,{delBodyIds:"" + gr + ""}, function(data){
							jQuery("#assetList").trigger("reloadGrid");
						});
					}
				}
			}

			function modifyBody(){
				var gr = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
				var sheettype = $("#sheetType").val();
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr.length == 1 ){
					var bodyId = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ToCheck_PYPKModify.do?sheettype=tocheckobject'+'&bodyId='+bodyId,
						'','top=200,left=200,width=800,height=200,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#assetList").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_view",
				'','height=200, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function saveZcListToPdxx(gr){
				$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
					{
						"pdpc"			: 	$("#pdpc").val(),
						"dic3_id"		:	""+gr,
						"head.sheadId"	:	$("#sheadId").val(),
						"sheettype"		:	"tocheckObjectadd"
					},function(data){
						refreshGrid();
					}
				);
			}
			
			//保存到台账
			function endSheet(){
				if(!confirm('确定要办结处理单吗？')){
					return false;
				}
				var taskId = "<%=workflowVO.taskId%>";
				var outCome = document.myform.outCome.value;
				var sheettype = document.getElementById("sheetType").value;
				var sheadId = document.getElementById("sheadId").value;
				var bodyIdArr = jQuery("#assetList").getDataIDs();
				var pc = "";
				for(var i=0; i<bodyIdArr.length; i++){
					var pcTemp = jQuery("#assetList").getCell(bodyIdArr[i],'pdpc');
					if(pcTemp.length != 0){
						pc = pcTemp;
						break;
					}
				}
				$.post("<%=basePath%>zyzc/ZCManageBody_finishWorkNotSaveToKctz.do",
					   {'sheettype':sheettype,'headId':sheadId,'pc':""+pc},function(data){
					   		taskDone(data, taskId);
					   }
				);
			}
			
			function ImportExcelToOrcl(){
				var excelFilePath = $("#excelFileInput").val();
				var fileNameIndex = excelFilePath.lastIndexOf("\\");
				var fileName = excelFilePath.substring(fileNameIndex+1);
				if(fileName.indexOf(".xlsx") > 0 || fileName.indexOf(".xls") < 0){
					alert("你选择的文件'"+ fileName +"'不是Excel97-2003类型(*.xls)的文件,请您重新选择！");
					return false;
				}else{
					if(!confirm("确定要导入么？")){
						return false;
					}
					$.post("<%=basePath%>zyzc/ImportExcelToOrcl_ImportExcel.do",
						   {"headId" : $("#sheadId").val(),"excelFilePath":$("#excelFileInput").val()},
						   function(result){
							  alert(result); 
							  refreshGrid();
						   }
					);
				}
			}
			
			function saveZcListToPdxx1(){
				var taskId = "<%=workflowVO.taskId%>";
				var delBodyIds = jQuery("#assetList").getCol("zcId");
				$.post("<%=basePath%>zyzc/ToCheck_endProcess.do",
					{
						"pdpc"			: 	$("#pdpc").val(),
						"delBodyIds"	:	""+delBodyIds,
						"headId"		:	$("#sheadId").val(),
						"sheettype"		:	"tocheckstockadd"
					},function(data){
						taskDone(data, taskId);
					}
				);
			}
			
			function taskDone(data, taskId){
				if(data == "ok"){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.taskId.value = taskId;
					document.myform.sheetId.value = document.getElementById("bianhao11").value;
					document.myform.outCome.value = "流程办结";
					document.myform.submit();
					return;
				}else{
					alert("办结处理未成功！");
				}
			}
			
			function jqgridTableRefresh(){
				$.post('<%=basePath %>zyzc/ZCManageHead_jqgridTableRefresh.do',
						{
							"pdxxVo.pdpc"	:	$("#pdpc").val(),
							"head.sheadId"	:	$("#sheadId").val(),
							"lastTimePdpc"	: 	$("#lastTimePdpc").val()
						},
						function(data){
							jQuery("#assetList").trigger("reloadGrid");
						}
				);
				$("#lastTimePdpc").val($("#pdpc").val());
			}
			
			//修改的情况下用此函数刷新grid
			function refreshGrid(){
				jQuery("#assetList").trigger("reloadGrid");
			}
		</script>
	</body>
</html>