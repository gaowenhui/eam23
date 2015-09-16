<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zyzc/goodRenewal/renewal.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String headId = request.getAttribute("head.sheadId").toString();
	String userTid = (String) request.getAttribute("userTid");
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
		<title>自用固定资产续保申请</title>
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "zyzcWorkflow";
			actionPath = "zyzcWorkflow";
		%>
		<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
		<script type="text/javascript">
			function beforeWorkFlowSubmit(){
				$("input").removeAttr("disabled");	
				$("textarea").removeAttr("disabled");	
				$("select").removeAttr("disabled");	
				return true;
			}
		
			$(function(){
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
				jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width()); 
				jQuery("#contInsurance_list").setGridWidth($("#gridTable").width());
				jQuery("#file_list").setGridWidth($("#gridTable").width());
				jQuery("#file_huiqianlist").setGridWidth($("#gridTable").width());
				jQuery("#file_huiqian_endlist").setGridWidth($("#gridTable").width());
		        $(window).bind('resize',function(){
		        	jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
					jQuery("#contInsurance_list").setGridWidth($("#gridTable").width());
					jQuery("#file_list").setGridWidth($("#gridTable").width());
					jQuery("#file_huiqianlist").setGridWidth($("#gridTable").width());
					jQuery("#file_huiqian_endlist").setGridWidth($("#gridTable").width());
		        });
				
				//添加按钮
				<e:pc id="contInsurance_list">
					var buttonJSonString = '[\<%
						    if(!inCounterSign){
						%>
											{"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"deleteBody","buttonIcon":"icon-remove","buttonText":"删除"},\
											<%}%>{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"}\
					]';
					addButtons(jQuery("#gview_contInsurance_list > .ui-jqgrid-titlebar"),buttonJSonString);
				</e:pc>
				
				//----------------------------------------办理依据按钮--------------------------------------------	
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
			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
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
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form action="zyzc/ZCManageHead_saveHead.do" name="myform" id="myform">
		<br/><br/>
		<div align="center">
			<span class="STYLE1">中国建银投资有限责任公司自用资产续保申请<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
		</div>
		<br />
		<hr color="#6600CC" align="center" width="100%" />
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<!-- =========================================================================== -->
		<s:hidden name="head.sheadId" id="sheadId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="head.sheetType" id="sheetType" value="%{#request.head.sheetType}"></s:hidden>
		<s:hidden name="sheettype" id="sheetType" value="%{#request.sheettype}"></s:hidden>
		<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
		<s:set name="biaodanid" value="%{#request.head.sheadId}"/>
		<r:depthidden id="deptid" view="N" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<!-- ==========================定义工作流隐藏域==================================== -->
		<%String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";%>
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
			<table id="gridTable" class="newtable" width="100%" border="0"
				align="center" cellpadding="0" cellspacing="0">
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
						<s:textfield cssClass="input" disabled="true" name="head.sheetId" id="bianhao11" />
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
						<r:select name="head.jhcd" id="jhcd" cssClass="input" list="{'一般','急','特急'}"></r:select>
					</td>
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
					<td class="td_zxy01">用途与需求：</td>
					<td colspan="3" class="td_zxy02">
						<r:textarea id="ytxq" rows="4" cssClass="area" name="head.ytxq" id="ytxq"></r:textarea>
					</td>
				</tr>
			</table>

			<table id="contInsurance_list"></table>
			<!-- ------------------------------- 办理依据 --------------------------------- -->
			<%@ include file="/inc/according.inc"%> 
			<div id="pgtoolbar" style="display: none"></div>
			<script type="text/javascript">
			jQuery("#contInsurance_list").jqGrid({
	            url:"<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do",
	            postData:{"head.sheadId" : $("#sheadId").val()},
				datatype:"json",
				colNames:['id','一级分类','二级分类','三级分类',
							'资产名称','资产编号','品牌/规格型号',
							'序列号','保修机构','出保日期','新续保日期'],
				colModel:[
					{name:'sbodyId',index:'sbodyId',hidden:true},
					{name:'yjflmc',index:'yjflmc',align:"center"},
					{name:'ejflmc',index:'ejflmc',align:"center"},
					{name:'sjflmc',index:'sjflmc',align:"center"},
					{name:'zcmc',index:'zcmc',align:"center"},
					{name:'zcbh',index:'zcbh',align:"center"},
					{name:'gg',index:'gg',align:"center"},
					{name:'xlh',index:'xlh',align:"center"},
					{name:'bxfws',index:'bxfws',align:"center"},
					{name:'cbrq',index:'cbrq',align:"center"},
					{name:'xxbrq',index:'xxbrq',align:"center"}
				],
				multiselect:true,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:1000000,
				rowList:[10,20,30],
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption: "续保物品清单 ",
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
				<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}"  value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
					<!-- ==========================工作流信息项======================================= -->
					<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
					<!-- =========================================================================== -->
				
				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value=""
					text="拟稿部门意见："></e:opinionPart>
			</e:opinion>
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_huiqian_end.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
			<div id="addToParent" style="display: none;">
				<div id="mm1" style="width: 150px;">
					<div onClick="return false();" iconCls="icon-undo">组审核 </div>
					<div onClick="" iconCls="icon-redo"> 部门领导审核 </div>
					<div class="menu-sep"></div>
					<div> 退回 </div>
				</div>
			</div>
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
				var idArray = $("#contInsurance_list").getDataIDs();
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
				window.open('<%=basePath%>zyzc/ZCQuery_xubaoInit.do?sheettype='+sheettype+'&headId='+sheadId,
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			//生成卡片编号
			function generateSheetNum(){
				if($("#bianhao11").val().length != 0){
					alert("已经生成卡片编号！");
					return false;
				}
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
			
			//删除表体信息
			function deleteBody(){
				var gr = jQuery("#contInsurance_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
						$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
							jQuery("#contInsurance_list").trigger("reloadGrid");
						});
					}
				}
			}
			
			function modifyBody(){
				var gr=jQuery("#contInsurance_list").jqGrid('getGridParam','selarrrow');
				var sheettype = $("#sheetType").val();
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr.length == 1 ){
					var bodyId = gr;
					window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype='+sheettype+'&bodyId='+bodyId,
						'','top=200,left=200,width=800,height=400,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#contInsurance_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_searchDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_view",
				'','height=220, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function saveZcListToBody(){
				$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
						{
							"delBodyIds"	:	$("#delBodyIds").val(),
							"head.sheadId"	:	$("#sheadId").val()
						},function(data){
							jQuery("#contInsurance_list").trigger("reloadGrid");
						}
				);
			}
			
			//保存到台账
			function saveToTZ(){
				if(!confirm('确定要办结处理单吗？')){
					return false;
				}
				var taskId = "<%=workflowVO.taskId%>";
				var outCome = document.myform.outCome.value;
				var sheettype = document.getElementById("sheetType").value;
				var sheadId = document.getElementById("sheadId").value;
				$.post("<%=basePath%>zyzc/ZCManageBody_overWork.do",
			   		{'sheettype':sheettype,'headId':sheadId},function(data){
				   		taskDone(data, taskId);
				   	}
				)
			};
			
			/**
			function banjietest(){
				var sheettype = document.getElementById("sheetType").value;
				var sheadId = document.getElementById("sheadId").value;
				$.post("<%=basePath%>zyzc/ZCManageBody_overWork.do",
			   		{'sheettype':sheettype,'headId':sheadId},function(data){
				   	}
				)
			}
			*/
			
			function taskDone(data, taskId){
				if(data == "ok"){
					// if(confirm('确定要办结处理单吗？')){
						document.myform.action = document.getElementById("endUrl").value;
						document.myform.url.value = document.getElementById("endViewUrl").value;
						document.myform.taskId.value = taskId;
						document.myform.sheetId.value = document.getElementById("bianhao11").value;
						document.myform.outCome.value = "生成台账结束";
						document.myform.submit();
						return;
					// }
				}else{
					alert("办结处理未成功！");
				}
			}
			
			//修改的情况下用此函数刷新grid
			function refreshGrid(){
				jQuery("#contInsurance_list").trigger("reloadGrid");
			}
		</script>
	</body>
</html>