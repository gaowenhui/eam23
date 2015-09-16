<%@ page language="java" import="com.tansun.eam2.common.model.orm.bo.CaShead" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zyzc/stock/inStock.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String headId = (String)request.getAttribute("head.sheadId");
	Long caSheadId = (Long)request.getAttribute("caSheadId");
	String userTid = (String) request.getAttribute("userTid");
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="pragma" content="no-cache"/>
		<title>物品入库申请</title>
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
				//设置grid宽度
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
				jQuery("#fixAssetList").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
		        $(window).bind('resize', function(){
		        	jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
					jQuery("#fixAssetList").setGridWidth($("#conditions").width());
					jQuery("#file_list").setGridWidth($("#conditions").width());
		        });
				$("#ysrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				//添加按钮
				<e:pc id="fixAssetList">
					var buttonJSonString_fix = '[\
									{"buttonHandler":"manualAdd","buttonIcon":"icon-add","buttonText":"手工增加"},\
									{"buttonHandler":"addFromPurchase","buttonIcon":"icon-add","buttonText":"采购单增加"},\
									{"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
									{"buttonHandler":"deleteBody","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_fixAssetList > .ui-jqgrid-titlebar"),buttonJSonString_fix);
				</e:pc>
				
				//----------------------------------------办理依据按钮--------------------------------------------	
				<e:pc id="blyj_reason_list">
					var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
				</e:pc>
				
				<e:pc id="cardListButton">
					var buttonJSonString_fix = '[\
									{"buttonHandler":"updateCard","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"buttonHandler":"delCard","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_cardList > .ui-jqgrid-titlebar"),buttonJSonString_fix);
				</e:pc>
				
				<e:pc id="dayin">
					var parentButtonStr = '[{"buttonHandler":"mainWindow.dayin","buttonIcon":"icon-save","buttonText":"打印单据"}]';		
										  window.parent.appendButtonsFromChildren(parentButtonStr,"");
				</e:pc>
				
				<e:pc id="completeButton">
					var parentButtonStr = '[{"buttonHandler":"mainWindow.send2Erp","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';		
										  window.parent.appendButtonsFromChildren(parentButtonStr,"");
				</e:pc>
				 //添加按钮  "#gview_list > .ui-jqgrid-titlebar
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
				
				$.post("kpgl/cardQuery_getcaSheadIdWithHeadId.do",{
						"headId"		:	""+'<%=headId%>'
				},function(data){
					$("#ngbmyj").val(data);
				});
					
			});
			
			//验证标题为空
			function checkEAMFormTitle(){
				var cztzxmmc = document.getElementById("title");
				if(cztzxmmc.value == null || cztzxmmc.value.trim().length == 0){
					alert("标题不能为空！");
					cztzxmmc.focus();
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
			
			function dayin(){
				var url="<%=request.getContextPath()%>/zyzc/ZCManageHead_print.do?headId="+$('#sheadId').val()+"&filename1=putDepotTable";		
				window.open(url,'_self');	
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="zyzc/ZCManageHead_saveHead.do" method="POST" name="myform" id="myform">
			<br/><br/>
			<div align="center">
				<span class="STYLE1">中国建银投资有限责任公司物品入库审批单</span>
			</div>
			<!-- ==========================工作流信息项======================================= -->
			<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
			<!-- =========================================================================== -->
			<br />
			<s:hidden name="head.ngbmyj" id="ngbmyj"/>
			<s:hidden name="head.sheadId" id="sheadId" value="%{#request.head.sheadId}"></s:hidden>
			<s:hidden name="head.sheetType" id="sheetType" value="%{#request.head.sheetType}"></s:hidden>
			<s:hidden name="sheettype" id="sheettype" value="%{#request.sheettype}"></s:hidden>
			<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
			<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
			<s:hidden name="allHeadIds" id="allHeadIds" value="%{#request.allHeadIds}"></s:hidden>
			<!-- 意见域、 依据和文件上传需要表单id -->
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
			<hr color="#6600CC" align="center" width="100%"></hr>
			<table id="conditions" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>标题：
					</td>
					<td colspan="3" class="td_zxy02">
						<r:textfield name="head.title" cssClass="input2" id="title"
							value="%{#request.head.title}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">编号：</td>
					<td class="td_zxy02">
						<s:textfield name="head.sheetId" cssClass="input" id="bianhao11"
						 disabled="true" value="%{#request.head.sheetId}" />
					</td>
					<td class="td_zxy01">拟稿日期：</td>
					<td class="td_zxy02">
						<s:textfield name="head.ngrq" cssClass="input" id="ngrq"
							disabled="true" value="%{#request.head.ngrq}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">拟稿人：</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngrbh" id="ngrbh"/>
						<s:textfield name="head.ngrmc" cssClass="input" id="ngrmc"
							disabled="true" value="%{#request.head.ngrmc}"/>
					</td>
					<td class="td_zxy01">拟稿部门：</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngbmmc" id="ngbmmc"></s:hidden>
						<e:dept userTid="<%=userTid%>" list="#{}" cssClass="input"  name="head.ngbmbh" onchange ="changeNgbmmc()" id="ngbmbh"/>
						
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">急缓程度：</td>
					<td class="td_zxy02">
						<r:select list="{'一般','急','特急'}" name="head.jhcd" id="jhcd"
						  cssClass="input" value="%{#request.head.jhcd}" />
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.ldxh" cssClass="input" id="ldxh"
							value="%{#request.head.ldxh}" />
					</td>
				</tr>
			</table>

			<table id="fixAssetList"></table>
			<!-- ------------------------------- 办理依据 --------------------------------- -->
			<%@ include file="/inc/according.inc"%> 
			<div id="pgtoolbar" style="display:none"></div>
			<script type="text/javascript">
				jQuery("#fixAssetList").jqGrid({
					url:"<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do",
		            postData:{
		            		  "head.sheadId" : $("#sheadId").val(),
		            		  "allHeadIds"	 : $("#allHeadIds").val(),
		            		  "sheettype"	 : "tostock"
		            },
					datatype:"json",
					colNames:['id','cgdbodyid','一级分类','二级分类','三级分类','资产名称',
							'品牌/规格型号','数量','单位','单价','金额'],
					colModel:[
						{name:'sbodyId',index:'sbodyId',hidden:true},
						{name:'cgdbodyid',index:'cgdbodyid',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'zcmc',index:'zcmc'},
						{name:'gg',index:'gg'},
						{name:'totalSl',index:'totalSl'},
						{name:'jldw',index:'jldw'},
						{name:'dj',index:'dj',sorttype:"float"},
						{name:'totalJe',index:'totalJe',sorttype:"float"}
					],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowNum:10000,
					rowList:[10,20,30],
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					caption: '入库物品清单',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					onSelectRow:function(rowid, status){
						$("#jqg_cardList_" + rowid).attr("checked",status);
					},
					onSelectAll:function(rowid, status){
						var ids = jQuery("#cardList").jqGrid('getDataIDs');
						for(var i = 0; i < ids.length; i++){
							jQuery("#cardList").setSelection(ids[i]);
						}
					}
				});
			</script>
			
			<e:pc id="addCardList">
			<table id="cardList"></table>
			<script type="text/javascript">
				jQuery("#cardList").jqGrid({
					url:"<%=basePath %>kpgl/cardQuery_obtainBody4ZyKp.do",
					postData:{
						"headId": ""+ '<%=headId%>'
					},
					datatype:"json",
					colNames: ['zcid','资产名称','资产编号', '品牌/规格型号','卡片名称','卡片类型','管理部门', '使用部门'],
					colModel: [
						{name: 'zcId',index:'zcId',hidden:true},
						{name: 'zcmc',index: 'zcmc',align: "center"},
					 	{name: 'zcbh',index: 'zcbh',align: "center"}, 
						{name: 'gg',index: 'gg',align: "center"},
						{name: 'cardmc',index: 'cardmc',align: "center"}, 
						{name: 'cardtype',index: 'cardtype',align: "center"},
						{name: 'glbm',index: 'glbm',align: "center"},
						{name: 'sybm',index: 'sybm',align: "center",sorttype: "float"}
					],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowNum:10000,
					rowList:[10,20,30],
					viewrecords:true,
					caption: '资产对应卡片列表',
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
			</e:pc>
			<e:opinion id="test" width="100%">
				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
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
			var idArray = $("#fixAssetList").getDataIDs();
		    if(idArray == null||idArray.length == 0){
		       alert("请至少添加一条资产");
		       return false;
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
		
		function manualAdd(){
			var headId = document.getElementById("sheadId").value;
			window.open('<%=basePath%>zyzc/ZCQuery_init.do?headId='+ headId+'&sheettype=manualAddGoods',
					'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		}
		
		function ListAdd(){
			var sheadId = $("#sheadId").val();
			var sheettype = $("#sheetType").val();
			var existBodyIdArr = jQuery("#fixAssetList").getCol("sbodyId");;
			window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype=addStockGoods'+'&headId='+sheadId+'&existBodyIdArr='+existBodyIdArr,
			'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}
		
		function addFromPurchase(){
			var sheadId = $("#sheadId").val();
			var sheettype = $("#sheetType").val();
			window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype=addGoodsFromPurchase'+'&headId='+sheadId,
			'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}
	
		function deleteBody(){
			var gr = jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要删除的记录!");
				return false;
			}
			var cardIds =<%=caSheadId%>;
			$.post("<%=request.getContextPath()%>/zyzc/ZCManageBody_obtainIdWithZcIdAndHeadId.do",
				  {zcId:"" + gr,caSheadId:""+cardIds}, 
				  function(data){
				  	if(confirm("确认删除？")){
						var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
						$.post(ZCManagedeleteBody,
							  {delBodyIds:"" + gr,delCardBodyIds:""+data,sheettype:"tostock"}, 
							   function(data){
								  jQuery("#fixAssetList").trigger("reloadGrid");
								  jQuery("#cardList").trigger("reloadGrid");
							   }
						);
					}
				  }
			);
		}
			
		function modifyBody(){
			var gr=jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
			var sheettype = $("#sheetType").val();
			if(gr.length > 1){
				alert('只能修改一条记录');
			}else if( gr.length == 1 ){
				var bodyId = gr;
				window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype=tostock_edit'+'&bodyId='+bodyId,
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
				window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_view",
			'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		}
		
		//发送到Erp，生成卡片编号
		function send2Erp(){
			var zcIdArr =jQuery("#cardList").getCol("zcId");
			if(!confirm('确定要办结处理单吗？')){
				return false;
			}
			if(zcIdArr.length == 0){
			 	saveToTZ();
			}else{
				var url = "<%=request.getContextPath()%>/jiekou/send2ERP4ADD_requestExecute.do";
				$.post(url,{"headId": "" + '<%=headId%>',"isStock":"Yes"}, function(data){
					jQuery("#fixAssetList").trigger("reloadGrid");
					if(data !=""){
						alert(data);
						if(data=="ERP系统正确接收!"){
							creatCardTZ();
						}
					}else{
						alert("data为空");
					}
				});
			}
		}
		
		//生成卡片台账
		function creatCardTZ(){
			var url = "<%=request.getContextPath()%>/jiekou/createBook4Card_requestExecute.do";
			$.post(url,{"headId": "" + '<%=headId%>',"isStock":"Yes"}, function(data){
					jQuery("#fixAssetList").trigger("reloadGrid");
					if(data !=""){
						alert(data);
						if(data=="办结成功"){
							saveToTZ();
						}
					}
			});
		}
		
		//保存到台账，办结按钮调用
		function saveToTZ(){
			var taskId = "<%=workflowVO.taskId%>";
			var outCome = document.myform.outCome.value;
			var sheettype = document.getElementById("sheetType").value;
			var sheadId = document.getElementById("sheadId").value;
			var cardId = jQuery("#cardList").getCol("zcId");
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
				alert("入库的物品含有"+tempSL+"项固定资产，请您在本表单办结完成后，到卡片管理模块下的新增卡片处理单中，对相应的资产添加卡片！");
			}
			$.post("<%=basePath%>zyzc/ZCManageBody_finishWork.do",
				   {'sheettype':sheettype,'headId':sheadId,'cardId':cardId},function(data){
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
		
		//window.opener调用
		function saveZcListToBody(delBodyIds){
			$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
				{
					"delBodyIds"	:	""+delBodyIds,
					"head.sheadId"	:	$("#sheadId").val(),
					"sheettype"		:	$("#sheettype").val()
				},function(data){
					jQuery("#fixAssetList").trigger("reloadGrid");
				}
			);
		}
		
		//接收从采购单查询过来的表单Id，到body表中查询出这些资产，并存放到body表中,保存物品到body
		function saveWPToBody(allHeadIds){
			var cgBodyIds =jQuery("#fixAssetList").getCol("cgdbodyid");
			$.post("<%=basePath%>zyzc/ZCManageBody_copyBodyListToBody.do",
				   {	"cgBodyIds"	:	"" + cgBodyIds,
					    "headIds"	:	"" + allHeadIds,
					    "stockId"	:	$("#sheadId").val()
				   },
				   function(data){
				   		jQuery("#fixAssetList").trigger("reloadGrid");
				   }
			);
			
		}
		
		function displayByheadIds(){
			jQuery("#fixAssetList").setGridParam({
				postData:{
					"allHeadIds"	:	$("#allHeadIds").val(),
					"head.sheadId"	:	$("#sheadId").val()
				}
			}).trigger("reloadGrid");
		}
		
		//修改的情况下用此函数刷新grid
		function refreshGrid(){
			jQuery("#fixAssetList").trigger("reloadGrid");
		}
		
		// 添加卡片
		function addCard(){
			var headId = <%=caSheadId%>;
			var tempZcId4ZyZcStock = jQuery("#fixAssetList").jqGrid('getGridParam','selarrrow');
			if(tempZcId4ZyZcStock == null || tempZcId4ZyZcStock.length == 0){
				alert("请选择要添加卡片的资产！");
			}else if(tempZcId4ZyZcStock.length == 1){
				$.post("<%=request.getContextPath()%>/zyzc/ZCManageBody_getYjflmcBySbodyId.do",
					  {"sbodyId":"" + tempZcId4ZyZcStock}, 
					  function(data){
					  	if(data == "failure"){
					  		alert("只有固定资产可以生成卡片！");
					  	}else{
					  		var tempId = tempZcId4ZyZcStock;
							var rdBasicWidth = "1500px";
							var rdBasicHeight = "1500px";
							var url = '<%=request.getContextPath()%>/kpgl/cardBody_addBody.do?headId='+headId+'&sheetType=add'+'&sfzy=1'+'&tempZcId4ZyZcStock='+ tempId+'&sfrk=true';
							url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
							var _g_privateDialogFeatures = 'height=1200, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
							window.open(url,'',_g_privateDialogFeatures);
					  	}
					  }
				);
			}else{
				alert("一次只能给一个资产添加卡片!");
			}
		}
		
		// 修改卡片
		function updateCard(){
			var gr = jQuery("#cardList").jqGrid('getGridParam','selarrrow');
			if(gr.length > 1){
				alert('只能修改一条记录');
				return false;
			}else if(gr.length < 1){
				alert("请选择要修改的记录！");
				return false;
			}
			var cardIds =<%=caSheadId%>;
			var idStr;
			$.post("<%=request.getContextPath()%>/zyzc/ZCManageBody_obtainIdWithZcIdAndHeadId.do",
				  {"zcId":"" + gr,"caSheadId":""+cardIds}, 
				  function(data){
				  	idStr = data;
					var headId = <%=caSheadId%>;
					var bodyId = idStr;
					var rdBasicWidth = "1000px";
					var rdBasicHeight = "1500px";
					var url = '<%=request.getContextPath()%>/kpgl/cardBody_modifyBody.do?bodyId='+bodyId+'&headId='+headId+"&sheetType=add"+"&sfzyrk=true";
					url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
					var _g_privateDialogFeatures = 'height=1200, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
					window.open(url,'',_g_privateDialogFeatures);
					jQuery("#cardList").trigger("reloadGrid");
				  }
			);
		}
		
		// 删除卡片
		function delCard(){
			var gr = jQuery("#cardList").jqGrid('getGridParam','selarrrow');
			var cardIds =<%=caSheadId%>;
			if (gr.length == 0){
				alert("请选择要删除的记录!");
			}
			$.post("<%=request.getContextPath()%>/zyzc/ZCManageBody_obtainIdWithZcIdAndHeadId.do",
				  {"zcId":"" + gr,"caSheadId":""+cardIds}, 
				  function(data){
					if(confirm("确认删除？")){
						var delurl ="<%=request.getContextPath()%>/kpgl/cardBody_deleteBody.do";
						$.post(delurl,{delBodyIds:"" + data + "",sheetType:"add"}, function(data){
							jQuery("#cardList").trigger("reloadGrid");
						});
					}
				 }
			);
		}
		
		// 刷新
		function reloadJqGrid(){
			jQuery("#cardList").trigger("reloadGrid");
		}
	</script>
	</body>
</html>