<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zyzc/goodChange/change.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%String headId = request.getAttribute("head.sheadId").toString();
  String userTid = (String) request.getAttribute("userTid");
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="pragma" content="no-cache"/>
		<title>自用固定资产物品更换申请</title>
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
				jQuery("#file_list").setGridWidth($("#gridTable").width());
				jQuery("#before_exchange_goods_list").setGridWidth($("#gridTable").width());
				jQuery("#after_exchange_goods_list").setGridWidth($("#gridTable").width());
		        $(window).bind('resize',function(){
		        	jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
		        	jQuery("#before_exchange_goods_list").setGridWidth($("#gridTable").width());
					jQuery("#after_exchange_goods_list").setGridWidth($("#gridTable").width());
					jQuery("#file_list").setGridWidth($("#gridTable").width());
		        });
			
				//更换前--添加按钮
				<e:pc id="before_exchange_goods_list">
					var buttonJSonString_before = '[{"buttonHandler":"add_before","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"detailBefore","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"delete_before","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_before_exchange_goods_list > .ui-jqgrid-titlebar"),buttonJSonString_before);
				</e:pc>
				//更换后--添加按钮
				<e:pc id="after_exchange_goods_list">
					var buttonJSonString_after = '[{"buttonHandler":"add_after","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"detailAfter","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"delete_after","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_after_exchange_goods_list > .ui-jqgrid-titlebar"),buttonJSonString_after);
				</e:pc>
				
				//----------------------------------------办理依据按钮--------------------------------------------	
				<e:pc id="blyj_reason_list">
					var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
					]';
					addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
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
				
				<e:pc id="shengcheng">
					var headBHGen = document.getElementById("bianhao11").value;
					if(headBHGen == null || headBHGen.length == 0){
						var buttonStr_stztcz5 = '[{"id":"shengchenButton","buttonHandler":"mainWindow.generateSheetNum","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
						window.parent.prependButtonsFromChildren(buttonStr_stztcz5,"");
					}
				</e:pc>
				<e:pc id="startPurchase">	
					var aaaa = '[{"buttonHandler":"mainWindow.startPurchase","buttonIcon":"icon-ok","buttonText":"开启采购"}]';
					window.parent.appendButtonsFromChildren(aaaa,"");
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
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form action="zyzc/ZCManageHead_saveHead.do" method="POST" name="myform" id="myform">
	<!-- 	<div style="text-align: right">
			<input type="button" style="display:none;margin-right:5px" id="completeButton" value="办结" onclick="saveToTZ();"/>
		</div> -->
		<br/><br/>
		<div align="center"><span class="STYLE1">中国建银投资有限责任公司物品更换申请单</span></div>
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<!-- =========================================================================== -->
		<br/>
		<hr color="#6600CC" align="center" width="100%" />
		<s:hidden name="head.sheadId" id="sheadId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="head.sheetType" id="sheetType" value="%{#request.head.sheetType}"></s:hidden>
		<s:hidden name="sheettype" id="sheettype" value="%{#request.sheettype}"></s:hidden>
		<s:hidden name="headId" id="headId" value="%{#request.head.sheadId}"></s:hidden>
		<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
		<s:set name="biaodanid" value="%{#request.head.sheadId}" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<s:hidden name="bianhao" id="bianhao" />
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
		<table id="gridTable" class="newtable" width="100%" border="0"
			align="center" cellpadding="0" cellspacing="0">
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
					<s:textfield cssClass="input" disabled="true" id="bianhao11" name="head.sheetId"/>
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
					<r:select name="head.jhcd" cssClass="input" id="jhcd" list="{'一般','急','特急'}"></r:select>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">用途与需求：</td>
				<td colspan="3" class="td_zxy02" id="purchaserReasonTd">
					<r:textarea id="ytxq" rows="4" cssClass="area" name="head.ytxq"></r:textarea>
				</td>
			</tr>
		</table>

		<table id="before_exchange_goods_list"></table>
		<div id="pgtoolbar" style="display: none"></div>
		<script type="text/javascript">
		jQuery("#before_exchange_goods_list").jqGrid({
			url:"<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do",
			postData:{
						"head.sheadId" : $("#sheadId").val(),
						"sheettype" : $("#sheettype").val(),
						"syzt" :  "0"
					},
			datatype:"json",
			colNames:['id','资产状态','一级分类','二级分类','三级分类',
						'资产名称','品牌/规格型号','资产编号',
						'序列号','使用人','使用部门'],
			colModel:[
				{name:'sbodyId',index:'sbodyId',hidden:true},
				{name:'zczt',index:'zczt',hidden:true},
				{name:'yjflmc',index:'yjflmc',align:"center"},
				{name:'ejflmc',index:'ejflmc',align:"center"},
				{name:'sjflmc',index:'sjflmc',align:"center"},
				{name:'zcmc',index:'zcmc',align:"center"},
				{name:'gg',index:'gg',align:"center"},
				{name:'zcbh',index:'zcbh',align:"center"},
				{name:'xlh',index:'xlh',align:"center"},
				{name:'sqrmc',index:'sqrmc',align:"center"},		
				{name:'sqbmmc',index:'sqbmmc',align:"center"}		
			],
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			rowNum:1000000,
			rowList:[10,20,30],
			viewrecords:true,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			caption: "更换前物品清单 ",
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

	<e:pc id="afterExchangeGoods">
	<table id="after_exchange_goods_list"></table>
	<div id="pgtoolbar1" style="display: none"></div>
	<script type="text/javascript">
		jQuery("#after_exchange_goods_list").jqGrid({
			url:"<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do",
			postData:{
						"head.sheadId" : $("#sheadId").val(),
						"sheettype" : $("#sheettype").val(),
						"syzt" :  "1"
					},
			datatype:"json",
			colNames:['id','grsqdbodyid','资产状态','一级分类','二级分类','三级分类',
						'资产名称','品牌/规格型号','资产编号',
						'序列号','使用人','使用部门'],
			colModel:[
				{name:'sbodyId',index:'sbodyId',hidden:true},
				{name:'grsqdbodyid',index:'grsqdbodyid',hidden:true},
				{name:'zczt',index:'zczt',hidden:true},
				{name:'yjflmc',index:'yjflmc',align:"center"},
				{name:'ejflmc',index:'ejflmc',align:"center"},
				{name:'sjflmc',index:'sjflmc',align:"center"},
				{name:'zcmc',index:'zcmc',align:"center"},
				{name:'gg',index:'gg',align:"center"},
				{name:'zcbh',index:'zcbh',align:"center"},
				{name:'xlh',index:'xlh',align:"center"},
				{name:'sqrmc',index:'ngrmc',align:"center"},		
				{name:'sqbmmc',index:'ngbmmc',align:"center"}		
			],
			pager:'pgtoolbar1',
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			rowNum:1000000,
			rowList:[10,20,30],
			viewrecords:true,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			caption: "更换后物品清单",
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
	<!-- ------------------------------- 办理依据 --------------------------------- -->
	<%@ include file="/inc/according.inc"%> 
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
			var idArray = $("#before_exchange_goods_list").getDataIDs();
		    if(idArray == null||idArray.length == 0){
		       alert("请至少添加一条资产");
		       return false;
		    }
		    
		    /**验证更换前后物品是否相等
		    if("<%=workflowVO.taskName%>" == "账管处理"){
		    	alert(1111111111);
				var beglIds = jQuery("#before_exchange_goods_list").getDataIDs();
				var aeglIds = jQuery("#after_exchange_goods_list").getDataIDs();
				if(beglIds.length > aeglIds.length){
					alert("在更换前物品列表中还有物品没有为其指定更换后的物品，请您指定！");
					return false;
				}
			}
			**/
			
			return true;
		}
		
		function changeNgbmmc(){
		   var dept = document.getElementById("ngbmbh");
	       var i =document.getElementById("ngbmbh").selectedIndex;
	       document.getElementById("ngbmmc").value =dept.options[i].text;
		}
		
		
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
		
		function beforeWorkFlowSubmit(){
			$("input").removeAttr("disabled"); 
			$("textarea").removeAttr("disabled"); 
			$("select").removeAttr("disabled"); 
			return true;
		}
		
		//添加资产信息
		function add_before(){
			var sheadId = $("#sheadId").val();
			var sheettype = $("#sheetType").val()+ "_before";
			window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype='+sheettype+'&headId='+sheadId+'&zczt=jly&syzt=0',
			'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}
		
		function delete_before(){
			var gr = jQuery("#before_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要删除的记录!");
			}else{
				if(confirm("确认删除？")){
					var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
					$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
						jQuery("#before_exchange_goods_list").trigger("reloadGrid");
					});
				}
			}
		}
		
		function modifyBodyBefore(){
			var gr=jQuery("#before_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			var sheettype = $("#sheetType").val()+"_before";
			if(gr.length > 1){
				alert('只能修改一条记录');
			}else if( gr.length == 1 ){
				var bodyId = gr;
				window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype='+sheettype+'&bodyId='+bodyId,
					'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			}else alert("请选择要修改的记录");
		}
		
		//查看物品详细信息
		function detailBefore(){
			var gr = jQuery("#before_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要查看的记录!");
			}else if(gr.length > 1){
				alert("一次只能查看一条记录!");
			}else if (gr.length == 1){
				window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_before_view",
			'','height=210, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		}
		
		//查看物品详细信息
		function detailAfter(){
			var gr = jQuery("#after_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要查看的记录!");
			}else if(gr.length > 1){
				alert("一次只能查看一条记录!");
			}else if (gr.length == 1){
				window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_after_view",
			'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		}
		
		//添加资产信息
		function add_after(){
			var sheadId = $("#sheadId").val();
			var sheettype = $("#sheetType").val()+ "_after";
			var gr = jQuery("#before_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择需要更换的物品!");
			}else if(gr.length > 1){
				alert("一次只能选择一个要更换的物品!");
			}else if(!isAdd(gr)){
				alert("已经为该物品选择过要更换的物品！");
			}else if (gr.length == 1){
				window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype='+sheettype+'&headId='+sheadId+'&zczt=zk&syzt=1',
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		}
		
		function isAdd(gr){
			var grsqdbodyid =jQuery("#after_exchange_goods_list").getCol("grsqdbodyid");
			var index;
			for(index in grsqdbodyid){
				if(grsqdbodyid[index] == gr){
					return false;
				}
			}
			return true;
		}
		
		function delete_after(){
			var gr = jQuery("#after_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要删除的记录!");
			}else{
				if(confirm("确认删除？")){
					var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
					$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
						jQuery("#after_exchange_goods_list").trigger("reloadGrid");
					});
				}
			}
		}
		
		function modifyBodyAfter(){
			var gr=jQuery("#after_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			var sheettype = $("#sheetType").val()+ "_after";
			if(gr.length > 1){
				alert('只能修改一条记录');
			}else if( gr.length == 1 ){
				var bodyId = gr;
				window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype='+sheettype+'&bodyId='+bodyId,
					'','top=200,left=200,width=800,height=330,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			}else alert("请选择要修改的记录");
		}
		
		function saveZcListToBodyBefore(delBodyIds){
			$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
					{
						"delBodyIds"	:	"" + delBodyIds,
						"sheettype"		:	$("#sheettype").val(),
						"head.sheadId"	:	$("#sheadId").val(),
						"syzt"			:   '0'
					},function(data){
						jQuery("#before_exchange_goods_list").trigger("reloadGrid");
					}
			);
		}
		
		function saveZcListToBodyAfter(delBodyIds){
			var gr = jQuery("#before_exchange_goods_list").jqGrid('getGridParam','selarrrow');
			$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
				{
					"delBodyIds"	:	"" + delBodyIds,
					"sheettype"		:	$("#sheettype").val(),
					"head.sheadId"	:	$("#sheadId").val(),
					"beforeBodyId"	:	""+gr,
					"syzt"			:   '1'
				},function(data){
					jQuery("#after_exchange_goods_list").trigger("reloadGrid");
				}
			);
		}
		
		//保存到台账
		function saveToTZ(){
			if(checkAllotGoods()){
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
		}
		
		//查看是否给更换前物品清单中所有物品都分配了相应的物品
		function checkAllotGoods(){
			var grsqdbodyid =jQuery("#after_exchange_goods_list").getCol("grsqdbodyid");
			var sbodyId = jQuery("#before_exchange_goods_list").getCol("sbodyId");
			var bol = false;
			for(var i = 1; i < sbodyId.length; i++){
				bol = false;
				for(var j = 1; j <  grsqdbodyid.length; j++){
					if(sbodyId[i] == grsqdbodyid[j]){
						bol = true;
						break;
					}
				}
			}
			if(!bol){
				alert("没有全部给需要更换的物品指定更换的物品！");
				return false;
			}else{
				return true;
			}
		}
		
		function taskDone(data, taskId){
			if(data == "ok"){
				// if(confirm('确定要办结处理单吗？')){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.taskId.value = taskId;
					document.myform.outCome.value = "流程办结";
					document.myform.sheetId.value = $("#bianhao11").val();
					alert(document.myform.sheetId.value);
					document.myform.submit();
					return;
				// }
			}else{
				alert("办结处理未成功！");
			}
		}
		
		//修改的情况下用此函数刷新grid
		function refreshGridBefore(){
			jQuery("#before_exchange_goods_list").trigger("reloadGrid");
		}
		function refreshGridAfter(){
			jQuery("#after_exchange_goods_list").trigger("reloadGrid");
		}
		function startPurchase(){
			var DataArr = jQuery("#before_exchange_goods_list").getDataIDs();
			var bianhao = document.getElementById('bianhao11').value;
			if(bianhao==null||bianhao==''){
				alert('请先生成编号');
				return false;
			}
			var headId = document.getElementById("sheadId").value;
			var enurl = encodeURIComponent("zyzc/ZCManageHead_newPurchaseHead4exchange.do?sheettype=purchase&applyId="+headId+"&pdk=zyzc_purchase&bodyIds="+DataArr);
			//var openCardUrl = basePathJs + "zyzc/index.do?urlPortal=" + enurl;
			document.getElementById("ypl").value=enurl;
			var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0';
			//window.open(openCardUrl,'采购管理',type);
			window.open(basePathJs+"pages/eam2/zyzc/consuming/test.jsp",'采购管理',type);
			return false;
		}
      </script>
      <input type="hidden" name='ypl'/>
	</body>
</html>