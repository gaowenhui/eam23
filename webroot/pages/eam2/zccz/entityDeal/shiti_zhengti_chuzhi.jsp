2<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%@page import="com.tansun.rdp4j.common.util.*"%>
<%
	String headId = (String)request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
	if(StringUtils.isEmpty(headId))
		headId = request.getParameter("headId");
	CzStcztz head = (CzStcztz)request.getAttribute("head");
	String myStatus = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	String pdk = request.getParameter("pdk");
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
     Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");    
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!-- ==========================  权限控制添加     ======================================== -->
<%if(StringUtils.equals("zccz_assetdisposal",workflowVO.pdk)) {%>
	<r:controlfile file="/pages/eam2/zccz/entityDeal/shiti_zhengti_chuzhi.ctl.xml"></r:controlfile>
<%}else if(StringUtils.equals("zccz_nbgb",workflowVO.pdk)){ %>
	<r:controlfile file="/pages/eam2/zccz/entityDeal/shiti_zhengti_chuzhi_nbgb.ctl.xml"></r:controlfile>
<%}else {
	if(StringUtils.equals("zccz_nbgb",pdk)){%>
	<r:controlfile file="/pages/eam2/zccz/entityDeal/shiti_zhengti_chuzhi_nbgb.ctl.xml"></r:controlfile>
	<%}else{ %>
	<r:controlfile file="/pages/eam2/zccz/entityDeal/shiti_zhengti_chuzhi.ctl.xml"></r:controlfile>
<%	}
} %>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>实体整体处置</title>
		<script type="text/javascript">
			var isQiChaoCzbg = false;
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				if($("#CCzfs").val() == '2'){
					$("#jydx,#jydxLable").show();
				}else{
					$("#jydx,#jydxLable").hide();
				}
				if($("#stywyxzc").val() == '有'){
					$("#aaa,#bbb").show();
				}else{
					$("#aaa,#bbb").hide();
				}
				jQuery("#claims_list").setGridWidth($("#widthRule").width());
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#widthRule").width());
				$(window).bind('resize', function(){
					jQuery("#file_hgsc_endlist").setGridWidth($("#widthRule").width());
					jQuery("#claims_list").setGridWidth($("#widthRule").width());
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
				});
<!--========================添加工作流按钮==========================================-->
			<%
				if(isInWorkflow){
			%>
			<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
				//======================办理依据和附件按钮=========================
			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
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
				//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^办理依据和附件按钮^^^^^^^^^^^^^^^^^^^^^^^^^^^
			<%}%>
				<e:pc id="shitiList">
					var buttonsString0 = '[' + 
						'{"buttonIcon":"icon-add","buttonText":"选择实体","buttonMenuId":"mm2"},' +
						'{"buttonHandler":"resetCom","buttonIcon":"icon-reload","buttonText":"清除"}' +
					']';
					addButtons(jQuery("#stInfoButton"),buttonsString0);
				</e:pc>
				<e:pc id="viewWordButtons">
					//查看处置报告
					var buttonStr_stztcz = '[{"buttonHandler":"mainWindow.qicaoClbg(true)","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
					if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
				</e:pc>
				<e:pc id="createWordButtons">
					//创建处置报告
					var buttonStr_stztcz = '[{"id":"shitibjczbg","buttonHandler":"mainWindow.qicaoClbg(false)","buttonIcon":"icon-<%=myStatus.equals("0") ? "createFile" : "dealFile" %>","buttonText":"<%=myStatus.equals("0") ? "起草处置报告" : "编辑处置报告" %>"}]';
					if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
				</e:pc>
				<e:pc id="hgxscButtons">
					<%
						if(head != null && StringUtils.isNotEmpty(head.getScfaxxid())){
					%>
						var expensesStr = '[{"buttonHandler":"mainWindow.viewHistoryYj(&quot;<%=head.getScfaxxid() %>&quot;)","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
						if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(expensesStr,"");
					<%}%>
				</e:pc>
				<e:pc id="viewStxxButtons">
					var buttonsStringmm = '[\
						{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体信息"},\
						{"buttonHandler":"stMoneyXx","buttonIcon":"icon-search","buttonText":"实体资产处置信息"}\
					]';
					appendButtons(jQuery("#stInfoButton"),buttonsStringmm);
				</e:pc>
			    //添加债权按钮
				<e:pc id="claims_list_button">
					var buttonBlyjJSonString = '[{"buttonHandler":"addDept","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delDept","buttonIcon":"icon-remove","buttonText":"删除"},\
												{"id":"edit","buttonHandler":"editDept","buttonIcon":"icon-edit","buttonText":"编辑"},\
												{"id":"save","buttonHandler":"saveDept","buttonIcon":"icon-ok","buttonText":"保存"},\
												{"id":"cancel","buttonHandler":"cancelDept","buttonIcon":"icon-no","buttonText":"取消"}\
					]';
					addButtons(jQuery("#gview_claims_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
					$('#save').attr("disabled",true);
					$('#cancel').attr("disabled",true);
				</e:pc>
				<%if(StringUtils.equals("zccz_nbgb",workflowVO.pdk==null?"":workflowVO.pdk)
						&& StringUtils.equals("经办人处理",workflowVO.taskName==null?"":workflowVO.taskName)
						&& StringUtils.equals("2",status)){%>
					var overProcessButton = '[{"buttonHandler":"mainWindow.formSubmit","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
					if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(overProcessButton,"");
				<%}%>
				<e:pc id="gbianhao">
					<s:if test="%{head.bianhao==null}">
							var generatorBianhaoButtonStr = '[{"id":"generatorBianhaoButton","buttonHandler":"mainWindow.generateBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
							if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(generatorBianhaoButtonStr,"");
					</s:if>
				</e:pc>
				var headBHGen = document.getElementById("bianhao").value;	 
				if(headBHGen.length != 0){
					<%
				    if(!status.equals("2")){
				   %>
				   <e:pc id="hczw">
					var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成处置报告"}]';
					window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
				   </e:pc>
					<%
					   }
					%>
			
				}
				<e:pc id="gslxh">
    				<s:if test="%{head.slxh == null}">
						var generatorSlxhButtonStr = '[{"id":"generatorSlxh","buttonHandler":"mainWindow.generatorNum","buttonIcon":"icon-bianhao","buttonText":"生成受理序号"}]';
						if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(generatorSlxhButtonStr,"");
    				</s:if>
    			</e:pc>
			});
			
			function stMoneyXx(){
				if($.trim($("#zcbh").val()) == ""){
					alert("请选择实体");
					return false;
				}
				$.post("<%=basePath %>zccz/entityDealHead_selectEDM.do",{
					"stid" :  "" + $("#stid").val()
				},function(returnStr){
					var returnArr = returnStr.split(",");
					alert("处置资产预计回收金额:" + returnArr[0] + "元\n"
					 + "实际回收金额:" + returnArr[1] + "元");
				});
			}
			
			//显示选债权页面
			function addDept(){
				if($.trim($("#zcbh").val()) == ""){
					alert("请选择实体");
					return false;
				}
				window.open("<%=basePath %>zccz/entityDealHead_showDebtListWin.do?stId=" + $("#stid").val(),"",winOpenStr);
			}
			
			//新增债权
			function selectDept(ids){
				$.post("<%=basePath %>zccz/entityDealHead_selectDebtList.do",{
					"head.id" : "" + $("#id").val(),
					"head.stid" : "" + $("#stid").val(),
					"ids" : "" + ids
				},function(returnStr){
					if("SUCCESS" == returnStr){
						jQuery("#claims_list").trigger("reloadGrid");
					}else{
						alert("保存失败!");
					}
				});
			}
			
			//删除债权
			function delDept(){
				var ids = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0){
					alert("请选择要删除的记录!");
					return false;
				}
				$.post("<%=basePath %>zccz/entityDealHead_delDebtList.do",{
					"ids" : "" + ids
				},function(returnStr){
					if("SUCCESS" != returnStr){
						alert("删除失败!");
					}else{
						jQuery("#claims_list").trigger("reloadGrid");
					}
				});
			}
			
			function editDept(){
				var ids = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0){
					alert("请选择要编辑的记录!");
					return false;
				}
				$(ids).each(function(i,id){
					jQuery("#claims_list").jqGrid('editRow',id);
				});
				$('#edit').attr("disabled",true);
				$('#save').attr("disabled",false);
				$('#cancel').attr("disabled",false);
			}
			
			function saveDept(){
				ids = jQuery("#claims_list").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0)
					return false;
				$('#edit').attr("disabled",false);
				$('#save').attr("disabled",true);
				$('#cancel').attr("disabled",true);
				$(ids).each(function(i,id){
					jQuery("#claims_list").jqGrid('saveRow',id,function(returnObj){
						if(returnObj.status == 200){
							return true;
						}else{
							alert("保存失败,请联系管理员!");
							return false;
						}
					},'<%=basePath %>zccz/entityDealHead_updateDept.do');
				});	
			}
			
			function cancelDept(){
				if(ids.length == 0)
					return false;
				$(ids).each(function(i,id){
					jQuery("#claims_list").jqGrid('restoreRow',id);
				});	
				$('#edit').attr("disabled",false);
				$('#save').attr("disabled",true);
				$('#cancel').attr("disabled",true);			
			}
			
			//验证标题为空
			function checkEAMFormTitle(){
				var czxmmc = document.getElementById("czxmmc");
				if(czxmmc.value == null || czxmmc.value.trim().length == 0){
					alert("标题不能为空！");
					czxmmc.focus();
      				return false;
    				}
    		 	return true;
			}  
			
			
			function viewHistoryYj(id){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
					+ "head.id=" + id
					+ "&authority=r"
					,"",winOpenStr);
			}
						
			function stView(){
				var stlx = $("#stlx").val();
				var stid = $("#stid").val();
				if(stlx == "1"){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
			}
			function changeNgbmmc(){
				var dept = document.getElementById("ngbm");
	    	 	var i =document.getElementById("ngbm").selectedIndex;
	    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
			}
			function changeJydx(){
				if($("#CCzfs").val() == '2'){
					$("#jydx,#jydxLable").show();
				}else{
					$("#jydx,#jydxLable").val("");
					$("#jydx,#jydxLable").hide();
				}
			}
			
			function stywyxzcChange(){
				if($("#stywyxzc").val() == '有'){
					$("#aaa,#bbb").show();
				}else{
					$("#aaa,#bbb").hide();
					$("#aaa input").val("");
					$("#bbb input").val("");
				}
			}
			
		function selectCom(zixunType){
			var ids = jQuery("#claims_list").getDataIDs();
			if($.trim($("#stid").val()) != "" && ids.length > 0){
				if(confirm("更换实体将删除下面所有债权,确定更换实体吗?")){
					window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
					 + 'option=zccz'
					 + '&ctlButton=show' 
					 + '&zixunType=' + zixunType ,'',winOpenStr);
				}
			}else{
				window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
				 + 'option=zccz'
				 + '&ctlButton=show' 
				 + '&zixunType=' + zixunType ,'',winOpenStr);
			}
		}
		function setComMessage(stId){
			$.post("<%=basePath%>zccz/personDealHead_setStJbxxToHead.do",{
					"head.stid" : "" + stId,
					"oldStid" : "" + $("#stid").val(),
					"head.id" : "" + $("#id").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.CStzt=="4"){
						alert("此实体已被处置");
					}else {
						$("#stlx").val(returnObj.stlx);
						$("#zcbh").val(returnObj.zcbh);
						$("#stmc").val(returnObj.stmc);
						$("#stid").val(returnObj.stid);
						$("#stxz").val(returnObj.stxz);
						$("#stxzName").val(returnObj.stxzName);
						$("#sfName").val(returnObj.sfName);
						$("#stscsf").val(returnObj.stscsf);
						$("#zmzczeWY").val(returnObj.zmzcze/10000);
						$("#zmzcfzWY").val(returnObj.zmzcfz/10000);
						//删除债权
						var ids = jQuery("#claims_list").getDataIDs();
						if($.trim($("#stid").val()) == "" || ids.length == 0)
							return false;
						if($("#stid").val()==stId)return false;
						$.post("<%=basePath %>zccz/entityDealHead_delDebtList.do",{
							"ids" : "" + ids
						},function(returnStr){
							if("SUCCESS" != returnStr){
								alert("删除失败!");
							}else{
								jQuery("#claims_list").trigger("reloadGrid");
							}
						});
					}
				});
		}
		//合成处置报告
		function hechengzhengwen(){
			var czxmmc = document.getElementById("czxmmc");
			if(czxmmc.value == null || czxmmc.value.length == 0){
				alert("处置项目名称不能为空！");
				czxmmc.focus();
		      	return false;
		    }
			MergeWordStart('manager_czbght','bank_Template','manager_gzlxdbj' , document.getElementById("myForm"), "资产处置报告正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			isMerge = true;
<% if(StringUtils.equals("zccz_nbgb",workflowVO.pdk)){%>
			var overProcessButton = '[{"buttonHandler":"mainWindow.formSubmit","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
			window.parent.prependButtonsFromChildren(overProcessButton,"");
<%}%>
		}
		
		function hechengHead(){
		    //处置项目名称
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("czxmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥BIANHAO",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
		}
		
		function hechengBottom(){
		 		var strDate = "<%=strDate%>";
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeBottom.find.execute("￥￥HCRQ",false,false,false,false,false,true,false,false,strDate,2,false,false,false,false);
			var headId= "<%=headId %>";
			$.ajaxSetup({
				async:false
			});
			$.post("<%=basePath %>file/file_getFileList.do",{
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
		function generateBianhao(){
			if($("#bianhao").val() != "")return false;
			$.post("<%=basePath %>zccz/entityDealHead_generateBianhao.do",{
				"head.id" : "<%=headId %>"
			},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				$("#bianhao").val(returnObj.bianhao);
				if(window.parent.removeObj)
					window.parent.removeObj("#generatorBianhaoButton");
				var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成处置报告"}]';
					window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			});
		}
		
		function generatorNum(){
			if($("#slxh").val() != "")return false;
			$.post("<%=basePath %>zccz/entityDealHead_generatorSlxh.do",{
				"head.id" : "<%=headId %>"
			},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				$("#slxh").val(returnObj.slxh);
				$("#sbrq").val(returnObj.sbrq);
				if(window.parent.removeObj)
				window.parent.removeObj("#generatorSlxh");
			});
		}

		function qicaoClbg(readonly){
       		wordTemplate("bank_Template", document.getElementById("myForm"),readonly,true, "处置报告"); 
       		window.parent.setHtml("#shitibjczbg .l-btn-text","编辑处置报告");
			window.parent.setClass("#shitibjczbg .l-btn-text","l-btn-text icon-dealFile");
       		return false;
		}
		
		function afterWordSubmit(){
		  isQiChaoCzbg = true;
		}
		function beforeWordSubmit(){
		 // wordStatus = 2;
		}
		/**
		/（处理）新建正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "增资减资正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}		
		**/

		function resetCom(){
			if($("#stid").val() == ""){
				alert("没有选择实体!");
				return false;
			}
			if(confirm("确定清除实体信息,包括债权信息?")){
				$.post("<%=basePath %>zccz/entityDealHead_cleanStMessage.do",{
					"head.id" : "" + $("#id").val(),
					"head.stid" : "" + $("#stid").val()
				},function(returnStr){
					if("SUCCESS" == returnStr){
						$("#stInfo input").val("");
						jQuery("#claims_list").clearGridData();
					}
				});
			}
		}
		
		function saveAsDraft(){
			if('beforeWorkFlowSubmit' in window){
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveDraft","");
	                if(!result) return;
	            }
	        }
			$("#myForm").submit();
		}
		function commitWorkflow(taskId,outCome){
<%
			if(workflowVO.taskName.equals("拟稿部门综合处理")){
%>
				if(outCome=="项目受理"){
					var urlpush = encodeURI(document.getElementById("participationUrl").value+"?taskId="+taskId+"&outCome="+outCome+"&multiple=false");
					var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
					if(typeof(result)!='undefined'){
						document.myForm.result.value = 'commitToXmsl';
						document.myForm.action = document.getElementById("commitUrl").value;
						document.myForm.nextTodoUrl.value = document.getElementById("commitNextTodoUrl").value;
						document.myForm.didUrl.value = document.getElementById("commitDidUrl").value;
						document.myForm.taskId.value = taskId;
						document.myForm.outCome.value = outCome;
						document.myForm.assignId.value = result;
						if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
				            if(beforeWorkFlowSubmit instanceof Function){
				                var result = beforeWorkFlowSubmit(taskId,outCome);
				                if(!result) return;
				            }
			        	}
						document.myForm.submit();
					}
					return false;
				}
<%
			}else if(workflowVO.taskName.equals("项目受理")){
%>
				if(outCome=="合规审查"){
					document.getElementById("commitNextTodoUrl").value = "zcczWorkflow/zcczWorkflow_hgscTodo.do";
				}
<%
			}
%>
			return true;
		}
		
<%if(StringUtils.equals("zccz_nbgb",workflowVO.pdk==null?"":workflowVO.pdk)
		&& StringUtils.equals("经办人处理",workflowVO.taskName==null?"":workflowVO.taskName)){%>		
		function formSubmit(){
			if($.trim($("#bianhao").val()) == ""){
				alert("请先生成编号");
				return false;		
			}
			if(confirm('确定要提交流程办结吗？')){
				$("#myForm").ajaxForm(function(responseText,statusText,xhtmlHttpRequest,$form){
						if(responseText == 'SUCCESS_END'){
							document.myForm.action = document.getElementById("endUrl").value;
							document.myForm.url.value = document.getElementById("endViewUrl").value;
							document.myForm.taskId.value = '<%=workflowVO.taskId%>';
							document.myForm.sheetId.value = document.getElementById("bianhao").value;
							document.myForm.outCome.value = '流程办结';
							document.myForm.submit();
						}
					}
				);
				document.myForm.taskId.value = '<%=workflowVO.taskId%>';
				document.myForm.action = "<%=basePath%>zccz/entityDealHead_endProcess.do";
				if('beforeWorkFlowSubmit' in window){
		            if(beforeWorkFlowSubmit instanceof Function){
		                var result = beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>");
		                if(!result) return;
		            }
		        }
				$("#myForm").submit();
			}
		}
<%}%>
		
		function changeProcess(){
			if($("#sfsh").val() == '否'){
				$("#pdk").val("zccz_nbgb");
			}else if($("#sfsh").val() == '是'){
				$("#pdk").val("zccz_assetdisposal");
			}
			document.myForm.action = "<%=basePath %>zccz/entityDealHead_newHead.do";
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveDraft","");
	                if(!result) return;
	            }
	       	}
			document.myForm.submit();
		}
		//输入校验拦截器
		function checkEAMFormJSMethod(){
			if($.trim($("#czxmmc").val()) == ""){
				alert("请输入标题");
				return false;
			}
			if($.trim($("#stid").val()) == ""){
				alert("请选择实体");
				return false;
			}
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
			if(arg2 == "项目受理" || arg2 == "业务运营组确认方案"){
				if($.trim($("#bianhao").val()) == ""){
					alert("请先生成编号");
					return false;		
				}
			}
			if(arg2 == "合规审查"){
				if($.trim($("#slxh").val()) == ""){
					alert("请先生成受理序号");
					return false;		
				}
			}
			if($.trim($("#lxdh").val()) == ""){
				alert("请输入联系电话");
				return false;		
			}
			<%if(StringUtils.equals("经办人处理",workflowVO.taskName) || 
					StringUtils.equals("拟稿部门综合处理",workflowVO.taskName)){%>
					if(arg2 == "项目受理" || arg2 == "业务运营组处理" || arg2 == "流程办结"){
						if("<%=status%>"!="2" && !isQiChaoCzbg){
							alert("请先合成处置报告");
							return false;
						}
					}
			<%}%>	
			<%if(StringUtils.equals("draft",workflowVO.step)){%>
				if("<%=myStatus%>"=="0" && !isQiChaoCzbg){
					alert("请先起草处置报告");
					return false;
				}
			<%}%>	
					
			return true;
		}
		
		/**
		 	submit拦截器
			beforeWorkFlowSubmit(arg1,arg2)
										arg1								arg2
			拟稿提交						processDefinitionKey 				outCome
			拟稿保存						"saveDraft"							""
			提交							taskId								outCome
			保存							"saveTodo"							""
			传阅							"circulation"						""
		**/
		function beforeWorkFlowSubmit(arg1, arg2){
			$("input").removeAttr("disabled");
			$("textarea").removeAttr("disabled");
			$("select").removeAttr("disabled");
			var zcpgzNum = new Number($("#zcpgzWY").val());
			$("#zcpgz").val(zcpgzNum * 10000);
			var stpgzNum = new Number($("#stpgzWY").val());
			$("#stpgz").val(stpgzNum * 10000);
			return true;
		}
		
		function changeCzxmmc(){
			$("#circulationTitle").val("[传阅] " + $("#czxmmc").val());
		}
		</script>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myForm";
	actionSpaceName = "zcczWorkflow";
	actionPath = "zcczWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<div id="initButton"></div>
	<s:form action="zccz/entityDealHead_submitHead.do" id="myForm">
		<s:hidden id="stlx" name="head.stlx" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden view="N" name="deptid" id="deptid"/>
		<r:userhidden id="userid" name="userid"/>
<!-- =================================正文需要============================= -->
		<r:depthidden view="N" name="deptnameshow" />
	<!-- =========================================================================== -->		
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" />
		<s:hidden id="lcId" name="head.lcId" />
		<s:hidden id="lcmc" name="head.lcmc" value="实体整体处置"/>
		<s:hidden id="fblsj" name="head.fblsj" />
		<br/>
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司实体整体处置方案审批处理单</span>
		</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
		<br/>
		<hr color="#6600CC" align="center" width="100%" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_submitHead.do"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/entityDealHead_viewDraft.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="head.id" />"/>
<input type="hidden" name="circulationTitle" id="circulationTitle" value="[传阅] <s:property value="head.czxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="entityDealHead_viewDraft"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader+"did.do"%>"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<input type="hidden" id="saveDraftUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="采购会签办理单"/>
<input type="hidden" name="counterSignUrl" value="<%=request.getContextPath()%>/zccz/entityDealHead_viewDraft.do?headId=<%=headId%>"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
		<table class="newtable" id="widthRule" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield cssClass="input2" id="czxmmc" name="head.czxmmc" onchange="changeCzxmmc()" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center">编号：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="jhcd" name="head.jhcd" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" align="center">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
    				<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr"/>
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="lxdh" name="head.lxdh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">处置方式：</td>
				<td class="td_zxy02">
					<e:select onchange="changeJydx()" cssClass="input" list="#{}" parRefKey="ENTITY_DISPOSE_METHOD" id="CCzfs" name="head.CCzfs" />
				</td>
				<td class="td_zxy01">
						处置申报方式：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>有无人员：
				</td>
				<td class="td_zxy02">
					<r:select list="{'有','无'}" name="head.stywry" id="stywry" cssClass="input" />
				</td>
				<td class="td_zxy01">
					<label id="jydxLable"><font color="#FF0000"><strong>*</strong></font>交易对象：</label>
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.jydx" id="jydx" cssClass="input"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<r:select onchange="stywyxzcChange()" cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
				</td>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<%if(StringUtils.isEmpty(workflowVO.taskId)){ %>
						<r:select id="sfsh" onchange="changeProcess()" cssClass="input" name="head.sfsh" list="{'是','否'}"/>
					<%} else{%>
						<r:select id="sfsh" onchange="changeProcess()" cssClass="input" name="head.sfsh" list="{'是','否'}" disabled="true"/>
					<%} %>
				</td>
			</tr>
			<tr id="bbb">
				<td class="td_zxy01">资产评估值(万元)：</td>
				<td class="td_zxy02" colspan="3">
					<s:set var="zcpgz" value="head.zcpgz"/>
					<s:hidden name="head.zcpgz" id="zcpgz" />
					<r:textfield id="zcpgzWY" cssClass="input2" value="%{#zcpgz/10000}"/>
				</td>
			</tr>
			<tr id="aaa">
				<td class="td_zxy01">实体评估值(万元)：</td>
				<td class="td_zxy02">
					<s:set var="stpgz" value="head.stpgz"/>
					<s:hidden name="head.stpgz" id="stpgz" />
					<r:textfield id="stpgzWY" cssClass="input" value="%{#stpgz/10000}"/>
				</td>
				<td class="td_zxy01">评估机构：</td>
				<td class="td_zxy02">
					<r:textfield name="head.pgjg" id="pgjg" cssClass="input" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">重报次数：</td>
				<td class="td_zxy02">
					<r:textfield name="head.cbcs" id="cbcs" cssClass="input" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">
					<s:hidden cssClass="input" id="hgsccs" name="head.hgsccs" readonly="true" />
				</td>
			</tr>
		</table>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">实体信息</div>
			<div class="panel-tool" id="stInfoButton"></div>
		</div>
		<table class="newtable" id="stInfo" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>资产编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="zcbh" name="head.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">实体名称：</td>
				<td class="td_zxy02">
					<s:hidden id="stid" name="head.stid" />
					<s:textfield cssClass="input" id="stmc" name="head.stmc" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体现状：</td>
				<td class="td_zxy02">
					<s:hidden id="stxz" name="head.stxz" />
					<e:vc codeType="ENTITY_CURRENT_STATUS" style="input" id="stxzName" codeKey="head.stxz" readonly="true" input="true"/>
				</td>
				<td class="td_zxy01">实体所处省份：</td>
				<td class="td_zxy02">
					<s:hidden id="stscsf" name="head.stscsf" />
					<e:vc codeType="PROVIENCE" style="input" id="sfName" codeKey="head.stscsf" readonly="true" input="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">账面资产总额(万元)：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcze" id="zmzcze" cssClass="input" readonly="true" />
				</td>
				<td class="td_zxy01">账面资产负债(万元)：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcfz" id="zmzcfz" cssClass="input" readonly="true" />
				</td>
			</tr>
		</table>
<%if(!StringUtils.equals("zccz_nbgb",workflowVO.pdk)){%>
		<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:date name="head.sbrq" var="sbrpFormat" format="yyyy-MM-dd"/>
	    			<s:textfield name="head.sbrq" cssClass="input" id="sbrq" value="%{#sbrpFormat}" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<s:textfield id="slxh" name="head.slxh" cssClass="input" readonly="true"/>
	    		</td>
	    	</tr>
		</table>
<%} %>
		<table id="claims_list"></table>
		<div id="pgtoolbarclaims"></div>
		<script type="text/javascript">
			jQuery("#claims_list").jqGrid({
				url:"<%=basePath %>zccz/entityDealHead_showDeptBodys.do",
				postData:{
					"head.id" : "" + $("#id").val()
				},
				datatype: "json",
				colNames:['id','债务人名称','起始日期','终止日期','合同金额(元)','购入债权余额','本金(元)','利息(元)','担保类型','担保合同金额(元)','担保物类别','转让金额(元)'],
				colModel:[
					{name:'id',index:'id',hidden:true},	
					{name:'zwrmc',index:'zwrmc',width:100},
					{name:'htqsrq',index:'htqsrq',width:100},
					{name:'htzzrq',index:'htzzrq',width:100},
					{name:'htje',index:'htje',width:100},
					{name:'grzye',index:'grzye',width:100},
					{name:'bj',index:'bj',width:100},
					{name:'lx',index:'lx',width:100},
					{name:'dblxmc',index:'dblxmc',width:100},
					{name:'dbhtje',index:'dbhtje'},
				    {name:'dbwzlbmc',index:'dbwzlbmc',width:100},
				    {name:'zrje',index:'zrje',editable:true,width:100}
				],
				loadComplete:function(data){
					if(data && data.rows.length>0){
						jQuery("#claims_list").setGridHeight(data.rows.length * 22 + 18);
					}else{
						jQuery("#claims_list").setGridHeight(0);
					}
				},
				shrinkToFit:false,
				rownumbers:true,
				height:'auto',
				autowidth:false,
				rowNum:0,
				width:'100%',
				multiselect: true,
				caption: '中国建投对实体债权信息',
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
	<%@ include file="/inc/according.inc"%>
<%if(StringUtils.equals("zccz_nbgb",workflowVO.pdk)){%>
	<e:opinion id="test" width="100%">
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	</e:opinion>
<%}else{ %>
	<e:opinion id="test" width="100%">
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		<e:opinionPart id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
	</e:opinion>
<%} %>
	<%@ include file="/inc/file.inc"%>
<!--  <%//if(!StringUtils.equals("zccz_nbgb",workflowVO.pdk)){%>	-->
	<%@ include file="/inc/file_heguishencha_end.inc"%>
	<%@ include file="/inc/listMessage.inc"%>
<!-- <%//} %> -->
	</s:form>
	<div style="display: none;">
		<div id="mm2" style="width: 150px;">
			<div onClick="selectCom('0');return false;" >咨询类实体</div>
			<div onClick="selectCom('1');return false;" >非咨询处置类实体</div>
			<div onClick="selectCom('3');return false;" >非咨询持续经营类实体</div>
		</div>
	</div>
	</body>
</html>