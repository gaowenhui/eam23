<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.tansun.rdp4j.common.util.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/zccz/checkJS.inc" %>
<%
	String headId = (String)request.getAttribute("head.id");
    List<CzStcztz> historyHeadList = (List<CzStcztz>)request.getAttribute("historyHeadList");
    CzStcztz myHead = (CzStcztz)request.getAttribute("head");
    String userTid = (String) request.getAttribute("userTid");
    Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");    
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
    boolean myInCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
    String pdk = request.getParameter("pdk");
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(StringUtils.equals("zccz_persondeal",workflowVO.pdk) && 
			workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<!-- ==========================  权限控制添加     ======================================== -->
<%if(StringUtils.equals("zccz_persondeal",workflowVO.pdk)) {%>
		<r:controlfile file="/pages/eam2/zccz/personDeal/personnel.ctl.xml"></r:controlfile>
<%}else if(StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){ %>
		<r:controlfile file="/pages/eam2/zccz/personDeal/personnel2.ctl.xml"></r:controlfile>
<%}else {
	if(StringUtils.equals("zccz_persondeal2",pdk)){%>
		<r:controlfile file="/pages/eam2/zccz/personDeal/personnel2.ctl.xml"></r:controlfile>
	<%}else{ %>
		<r:controlfile file="/pages/eam2/zccz/personDeal/personnel.ctl.xml"></r:controlfile>
<%	}
} %>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>人员安置</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myForm";
	actionSpaceName = "zcczperWorkflow";
	actionPath = "zcczperWorkflow";
%>
<script>
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
			}else{
				return true;
			}
	<%
		}else if(workflowVO.taskName.equals("项目受理")){
	%>
				if(outCome=="合规审查"){
					document.getElementById("commitNextTodoUrl").value = "zcczperWorkflow/zcczperWorkflow_xmslTodo.do";
					return true;
				} else {
					return true;
				}
		<%
			} else {
		%>
				if(outCome!=""){
					return true;
				}
		<%
			}
		%>
	}
</script>
<!-- ================================================================================== -->
<style type="text/css">
.container {
	width: 100px;
}

.container div {
	width: 100px;
	background: #CCCCCC;
	line-height: 30px;
	border: 1px solid #000000;
}

.on {
	font-weight: bold;
}

.container2 {
	width: 100px;
	text-align: center;
}

.container2 div {
	width: 100px;
	line-height: 30px;
}

.container2 a {
	text-decoration: none;
	display: block;
	border: 1px solid #d4d4d3;
	background: #e6e6e6;
	color: #000000;
}

.container2 .on a {
	background: #ffebac;
	color: #982e00;
	border-color: #ffb200;
}

#idMenu2 {
	clear: both;
	width: auto;
}

#idMenu2 div {
	float: left;
}

#idMenu2_6 a {
	background-color: red;
	border-color: red;
	color: #ffb200;
}
</style>
<script type="text/javascript">
		var isQiChaoCzbg = false;
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
		$(function(){
			if(window.parent.clearPanelTool != undefined)
			window.parent.clearPanelTool();
			<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>			 
			init();
<%}%>
			if($("#gszmnsfyysfzje").val() == '无'){
				$("#gszmnsfyysfzjeDiv").hide();
			}else{
				$("#gszmnsfyysfzjeDiv").show();
			}
			if($("#ryazfysfxjtdf").val() == '0'){
				$("#ryazfysfxjtdfDiv").hide();
			}else{
				$("#ryazfysfxjtdfDiv").show();
			}
			if($("#djtstyzr").val() == '无'){
				$("#fzjeDiv").hide();
			}else{
				$("#fzjeDiv").show();
				<%	
					if(myHead!=null&&myHead.getFzje()!=null&&!"".equals(myHead.getFzje())){
				%>	
					$("#fzje").val(${head.fzje}.toFixed(2));
				<%	
					}
				%>	
			}
			
			$("#pgjzr").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
			});
			
			jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
			jQuery("#file_list").setGridWidth($("#conditions").width());
			<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
			jQuery("#file_huiqian_endlist").setGridWidth($("#conditions").width());
			jQuery("#file_hgsc_endlist").setGridWidth($("#conditions").width());
			jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
			<%}%>
			$(window).bind('resize', function(){
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
			<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
				jQuery("#file_huiqian_endlist").setGridWidth($("#conditions").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#conditions").width());
				jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
			<%}%>
			
			
			});
			setRenyuanInfo();
			
		<e:pc id="blyjAndfjButtons">
			//======================办理依据和附件按钮=========================
		    	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);

			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^办理依据和附件按钮^^^^^^^^^^^^^^^^^^^^^^^^^^^
		</e:pc>
		<e:pc id="stButtons">
			//实体信息按钮
			var buttonsString0 = '[\
				{"buttonIcon":"icon-search","buttonText":"实体人员安置上会历史","buttonMenuId":"historyMenu"},\
				{"buttonIcon":"icon-add","buttonText":"选择实体","buttonMenuId":"mm2"},\
				{"buttonHandler":"resetCom","buttonIcon":"icon-reload","buttonText":"清除"},\
				{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体信息"}\
			]';
			addButtons(jQuery("#personInfo"),buttonsString0);
		</e:pc>
	<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
		<e:pc id="hgxscButton">
			//合规性审查
			<%
				if(myHead != null && StringUtils.isNotEmpty(myHead.getScfaxxid())){
			%>
				var expensesStr = '[{"buttonHandler":"mainWindow.viewHistoryYj(&quot;<%=myHead.getScfaxxid() %>&quot;)","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
				if(window.parent.prependButtonsFromChildren != undefined)
				window.parent.prependButtonsFromChildren(expensesStr,"");
			<%}%>
		</e:pc>
	<%}%>
		<e:pc id="viewWordButtons">
			//查看处置报告
			var buttonStr_stztcz = '[{"id":"viewCabgButton","buttonHandler":"mainWindow.qicaoClbg(true,&quot;&quot;)","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
			if(window.parent.prependButtonsFromChildren != undefined)
			window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
		</e:pc>
		<e:pc id="createWordButtons">
			//创建处置报告
			var buttonStr_stztcz = '[{"id":"editCabgButton","buttonHandler":"mainWindow.qicaoClbg(false,&quot;<%=status%>&quot;)","buttonIcon":"icon-<%=status.equals("0") ? "createFile" : "dealFile" %>","buttonText":"<%=status.equals("0") ? "起草处置报告" : "编辑处置报告" %>"}]';
			if(window.parent.prependButtonsFromChildren != undefined)
			window.parent.prependButtonsFromChildren(buttonStr_stztcz,"");
		</e:pc>
		var overProcessButton = '[{"buttonHandler":"mainWindow.formSubmit","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
		<%if(StringUtils.equals("zccz_persondeal2",workflowVO.pdk==null?"":workflowVO.pdk)
				&& StringUtils.equals("经办人处理",workflowVO.taskName==null?"":workflowVO.taskName)
				&& StringUtils.equals("2",status)){%>
			if(window.parent.prependButtonsFromChildren)window.parent.prependButtonsFromChildren(overProcessButton,"");
		<%}%>
		/**
		<e:pc id="gbianhao">
			<s:if test="%{head.bianhao == null}">
				var generatorBianhaoButtonStr = 
					'[{"id":"generatorBianhaoButton","buttonHandler":"mainWindow.generateBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				if(window.parent.prependButtonsFromChildren != undefined)
				window.parent.prependButtonsFromChildren(generatorBianhaoButtonStr,"");
			</s:if>
		</e:pc>
		**/	
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>		
		<e:pc id="gslxh">
			<s:if test="%{head.slxh == null}">
				var generatorSlxhButtonStr = 
					'[{"id":"generatorSlxh","buttonHandler":"mainWindow.generatorNum","buttonIcon":"icon-bianhao","buttonText":"生成受理序号"}]';
				if(window.parent.prependButtonsFromChildren != undefined)
				window.parent.prependButtonsFromChildren(generatorSlxhButtonStr,"");
			</s:if>
		</e:pc>
<%}%>
		//生成编号 合成处置报告
		var headBHGen = document.getElementById("bianhao").value;	  
		if(headBHGen == null || headBHGen.length == 0){
		 <e:pc id="gbianhao">
		 	var generatorBianhaoButtonStr = 
						'[{"id":"generatorBianhaoButton","buttonHandler":"mainWindow.generateBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
			window.parent.prependButtonsFromChildren(generatorBianhaoButtonStr,"");
		 </e:pc>
		}else{
		  <e:pc id="hczw">
		   <%
		    if(!status.equals("2")){
		   %>
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成处置报告"}]';
			if(window.parent.prependButtonsFromChildren){
				window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			}
		<%
		   }
		%>
		</e:pc>
		}
					
		});

		function generateBianhao(){
			if($("#bianhao").val() != "")return false;
			$.post("<%=basePath %>zccz/personDealHead_generateBianhao.do",{
				"head.id" : "<%=headId %>"
			},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				$("#bianhao").val(returnObj.bianhao);
				window.parent.removeObj("#generatorBianhaoButton");
				//显示合成处置报告按钮
				var buttonStr_hechengchuzhibaogao = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成处置报告"}]';
				window.parent.prependButtonsFromChildren(buttonStr_hechengchuzhibaogao,"");
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
			
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
			window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
<%}else if(StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
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
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
		function viewHistoryYj(id){
			window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
				+ "head.id=" + id
				+ "&authority=r"
				,"",winOpenStr);
		}
<%}%>		
		<!-- ==========================gengxiaoli======================================= -->
		//添加实体安置人员上会历史
		function qicaoClbg(readonly,statu){
       		wordTemplate("bank_Template", document.getElementById("myForm"),readonly,true, "处置报告");
       		
       		<%if(StringUtils.equals("draft",workflowVO.step)){%>
				if(window.parent.setHtml != undefined)
	       		window.parent.setHtml("#editCabgButton .l-btn-text","编辑处置报告");
				if(window.parent.setClass != undefined)
				window.parent.setClass("#editCabgButton .l-btn-text","l-btn-text icon-dealFile");
       		<%}%>
		}
		function afterWordSubmit(){
		  isQiChaoCzbg = true;
		}
		function beforeWordSubmit(){
		}
		function showBld(headId){
			window.open("<%=basePath %>zccz/bldAction_showStayazBLD.do?"
			+ "head.id=" + headId
			,"",winOpenStr);
		}
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>	
		function init(){
			var hsitoryButtonHtml = 
			'<div id="historyMenu" style="width: 150px; display:none;">' +
			<%
				for(CzStcztz head : historyHeadList){
			%>
				'<div onClick="showBld(&quot;<%=head.getId() %>&quot;);return false;" >' + '<%=head.getCzxmmc() %>' + '</div>' + 
			<%}%>
			 '</div>';
			$("body").append(hsitoryButtonHtml);
		}
<%}%>
		<!-- ==========================gengxiaoli======================================= -->
		
		function selectCom(zixunType){
			window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
			 + 'option=zccz' 
			 + '&ctlButton=show' 
			 + '&zixunType=' + zixunType ,'',winOpenStr);
		}
		function setComMessage(stId){
			$.post("<%=basePath%>zccz/personDealHead_setStJbxxToHead.do",{
					"head.stid" : "" + stId,
					"oldStid" : "" + $("#stid").val(),
					"head.id" : "" + $("#id").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#zcbh").val(returnObj.zcbh);
					$("#stmc").val(returnObj.stmc);
					$("#stid").val(returnObj.stid);
					$("#stlx").val(returnObj.stlx);
					$("#stxz").val(returnObj.stxz);
					$("#stxzName").val(returnObj.stxzName);
					$("#sfName").val(returnObj.sfName);
					$("#stscsf").val(returnObj.stscsf);
					setRenyuanInfo();
				});
		}
		
		function resetCom(){
			$.post("<%=basePath %>zccz/personDealHead_reSetRenyuanFeiyong.do",{
				"head.id" : "${head.id}"
			},function(returnStr){
				if(returnStr != "SUCCESS"){
					alert("重置安置人员/安置费用失败!请与管理员联系");
				}else{
					$("#personInfoTable input").val("");
					$("#personInfoTable select").val("");
					$("#personInfoTable textarea").val("");
					$("#fzjeDiv").hide();
					$("#ryazfysfxjtdfDiv").hide();
					$("#gszmnsfyysfzjeDiv").hide();
				}
			});
		}

		function saveAsDraftjjjj(){
			$("#myForm").submit();
		}
		
		function feiyongDetail(authority){
			window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do'
			+ '?authority=' + authority 
			+ '&headId=' + $("#id").val(),'',winOpenStr);
		}
		
		function renyuanDetail(authority){
			if($("#stid").val() == null || $("#stid").val() == ""){
				alert("请先选择实体");
				return false;
			}
			window.open('<%=basePath %>zccz/personDealHead_renyuanDetail.do?' 
			+ 'authority=' + authority 
			+ '&stid=' + $("#stid").val() 
			+ '&headId=' + $("#id").val(),'',winOpenStr);
		}
		
		function setRenyuanInfo(){
			$.post("<%=basePath %>zccz/personDealHead_setRyFyInfo.do",{
				"head.id" : '' + $("#id").val()
			},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				//alert(returnObj.azrs + ":" + returnObj.azfy);
				$("#azrs").val(returnObj.azrs);
				$("#azfy").val(returnObj.azfy);
			});
		}
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>		
		function generatorNum(){
			if($("#slxh").val() != "")return false;
			$.post("<%=basePath %>zccz/personDealHead_generatorSlxh.do",{
				"head.id" : "<%=headId %>"
			},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				$("#slxh").val(returnObj.slxh);
				$("#sbrq").val(returnObj.sbrq);
				window.parent.removeObj("#generatorSlxh");
			});
		}
<%}%>		

<%if(StringUtils.equals("zccz_persondeal2",workflowVO.pdk==null?"":workflowVO.pdk)
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
							document.myForm.outCome.value = '流程办结';
							if('beforeWorkFlowSubmit' in window){
					            if(beforeWorkFlowSubmit instanceof Function){
					                var result = beforeWorkFlowSubmit("<%=workflowVO.taskId%>","<%=workflowVO.outCome%>");
					                if(!result) return;
					            }
					        }
							document.myForm.submit();
						}
					}
				);
				document.myForm.taskId.value = '<%=workflowVO.taskId%>';
				document.myForm.action = "<%=basePath%>zccz/personDealHead_endProcess.do";
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
				$("#pdk").val("zccz_persondeal2");
			}else if($("#sfsh").val() == '是'){
				$("#pdk").val("zccz_persondeal");
			}
			document.myForm.action = "<%=basePath %>zccz/personDealHead_newHead.do";
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveDraft","");
	                if(!result) return;
	            }
	       	}
			document.myForm.submit();
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
			
			
		function checkEAMFormJSMethod(){
			if($.trim($("#czxmmc").val()) == ""){
				alert("请输入处置项目名称！");
				return false;
			}else if($.trim($("#stid").val()) == ""){
				alert("请选择实体！");
				return false;				
			}else if($.trim($("#lxdh").val()) == ""){
				alert("请输入联系电话！");
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
			if(arg2 == "项目受理" || arg2 =="业务运营组处理"){
				if($("#bianhao").val() == ""){
					alert("请生成编号!");
					return false;
				}
			}
			if(arg2 == "合规审查"){
				if($("#slxh").val() == ""){
					alert("请生成受理序号");
					return false;
				}
			}
			<%if(StringUtils.equals("draft",workflowVO.step)){%>
			if("<%=status%>"=="0" && !isQiChaoCzbg){
				alert("请起草处置报告!");
				return false;
			}
			<%}%>			
			return true;
		}
		
		
		/**
		beforeWorkFlowSubmit(arg1,arg2)
									arg1								arg2
		拟稿提交						processDefinitionKey 				outCome
		拟稿保存						"saveDraft"							""
		提交							taskId								outCome
		保存							"saveTodo"							""
		传阅							"circulation"						""
		**/
		function beforeWorkFlowSubmit(arg1,arg2){
			$("select").removeAttr("disabled");
			$("input").removeAttr("disabled");
			$("textarea").removeAttr("disabled");
			return true;
		}
		
		/** 开启会签前调用 **/
		function beforeCounterSign(){
			if($("#bianhao").val() == ""){
				alert("请生成编号!");
				return false;
			}
			return true;
		}
		
		//查看实体信息
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
		
		function openTreeByType(type4jygdzc){//打开树，根据类型打开类型  
			if(type4jygdzc =='hqbm'){
				isSYBMorGLBM = type4jygdzc;
				type4jygdzc = 'department';
			}
			var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + $("#hqbmids").val();
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}
		function getCallBack4Tree(ids,value){
			document.getElementById("hqbmvalue").value = value;
			document.getElementById("hqbmids").value = ids;
		}
		function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
		}
		function changeCzxmmc(){
			$("#circulationTitle").val("[传阅] " + $("#czxmmc").val());
		}
	</script>
	<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
	</head>

	<body>
	<%@ include file="/inc/word.inc"%>
		<div id="initButton"></div>
		<s:form action="zccz/personDealHead_submitHead.do" id="myForm" name="myForm">
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<!-- =================================正文需要============================= -->
		<r:depthidden view="N" name="deptnameshow" />
		<r:userhidden id="userid" name="userid"/>
		<r:depthidden view="N" name="deptid" id="deptid"/>
	<!-- =========================================================================== -->		
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" value="%{#request.head.id}"/>
		<s:hidden id="lcId" name="head.lcId" />
		<s:hidden id="headId" name="headId" value="%{#request.head.id}"/>
		<s:hidden id="lcmc" name="head.lcmc" value="实体人员安置"/>
		<s:hidden id="fblsj" name="head.fblsj" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/personDealHead_submitHead.do"/>
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/personDealHead_toModify.do"/>
<input type="hidden" name="circulationParam" value="headId=<s:property value="head.id" />"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.czxmmc" />"/>
<input type="hidden" id="circulationParticipation" name="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 传阅页面标识Url -->
<input type="hidden" id="circulationPageTag" name="circulationPageTag" value="personDealHead_toModify"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=actionSpaceName%>/<%=actionPath%>_did.do"/>
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="didUrl"/>
<!--<input type="hidden" id="saveDraftUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>-->
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>
<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.czxmmc" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="zccz/personDealHead_toModify"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<%}%>
<!-- =========================================================================== -->
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司实体人员安置审批<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
		</div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
		<hr/>
		<table width="100%" id="conditions" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield cssClass="input2" id="czxmmc" onchange="changeCzxmmc()" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select id="jhcd" name="head.jhcd" cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" width="120">拟稿部门：</td>
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
					<r:textfield cssClass="input" id="lxdh" name="head.lxdh"  />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<%if(!myInCounterSign) {%>
					<r:select id="sfsh" cssClass="input" onchange="changeProcess()" name="head.sfsh" list="{'是','否'}" />
		      		<%}else{ %>
					<r:select id="sfsh" cssClass="input" onchange="changeProcess()" name="head.sfsh" list="{'是','否'}" disabled="true"/>
		      		<%} %>
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>			
			<tr>
				<td class="td_zxy01">会签部门：</td>
			    <td class="td_zxy03" colspan="3" >
			    	<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true" cssClass="input2"/>
			    	<s:hidden  name="head.hqbmid" id="hqbmids"/>
			    	<e:pc id="buttonTd_huiqian">
			    		<%if(!myInCounterSign) {%>
		      			<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('hqbm');" width="21" height="20" align="absmiddle"/>
		      			<%} %>
		      		</e:pc>
		      		<e:countersign biaodanId="%{#request.biaodanid}" isJianTou="Y" />
		      	</td>
			</tr>
<%} %>			
		</table>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">实体信息</div>
			<div id="personInfo" class="panel-tool"></div>
		</div>
		<table width="100%" id="personInfoTable" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01">资产编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="zcbh" name="head.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">实体名称：</td>
				<td class="td_zxy02">
					<s:hidden id="stid" name="head.stid" />
					<s:hidden id="stlx" name="head.stlx" />
					<s:textfield cssClass="input" id="stmc" name="head.stmc" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体现状：</td>
				<td class="td_zxy02">
					<s:hidden id="stxz" name="head.stxz" />
					<e:vc codeType="ENTITY_CURRENT_STATUS" style="input" id="stxzName" codeKey="head.stxz" input="true" readonly="true" />
				</td>
				<td class="td_zxy01">实体所处省份：</td>
				<td class="td_zxy02">
					<s:hidden id="stscsf" name="head.stscsf" />
					<e:vc codeType="PROVIENCE" style="input" id="sfName" codeKey="head.stscsf" input="true" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<%if(!myInCounterSign) {%>
					<r:select cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
		      		<%}else{ %>
					<r:select cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" disabled="true"/>
		      		<%} %>
				</td>
				<td class="td_zxy01">对建投是否有负债：</td>
				<td class="td_zxy02">
					<%if(!myInCounterSign) {%>
					<r:select cssClass="input" id="djtstyzr" onchange="showFzje(this)" name="head.djtstyzr" list="{'无','有'}" />
		      		<%}else{ %>
					<r:select cssClass="input" id="djtstyzr" onchange="showFzje(this)" name="head.djtstyzr" list="{'无','有'}" disabled="true"/>
		      		<%} %>
					<s:div id="fzjeDiv" cssStyle="display:none;">
						<s:textfield cssClass="input" id="fzje" name="head.fzje" />(元)
					</s:div>
					<script type="text/javascript">
						function showFzje(obj){
							if($(obj).val() == '无'){
								$("#fzjeDiv").hide();
							}else{
								$("#fzjeDiv").show();								
							}
						}
					</script>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					人员安置费用是否需建投垫付：
				</td>
				<td class="td_zxy02">
					<%if(!myInCounterSign) {%>
					<r:select cssClass="input" onchange="showDfje(this)" id="ryazfysfxjtdf" name="head.ryazfysfxjtdf" list="#{'0':'否','1':'是'}" />
		      		<%}else{ %>
					<r:select cssClass="input" onchange="showDfje(this)" id="ryazfysfxjtdf" name="head.ryazfysfxjtdf" list="#{'0':'否','1':'是'}" disabled="true"/>
		      		<%} %>
					<s:div id="ryazfysfxjtdfDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="dfje" name="head.dfje" />(元)</s:div>
					<script type="text/javascript">
						function showDfje(obj){
							if($(obj).val() == '0'){
								$("#ryazfysfxjtdfDiv").hide();
							}else{
								$("#ryazfysfxjtdfDiv").show();
							}
						}
					</script>
				</td>
				<td class="td_zxy01">公司账面内是否有预计负债金额：</td>
				<td class="td_zxy02">
					<%if(!myInCounterSign) {%>
					<r:select cssClass="input" list="{'无','有'}" onchange="showGszmnsfyysfzjeDiv(this)" id="gszmnsfyysfzje" name="head.gszmnsfyysfzje" />
		      		<%}else{ %>
					<r:select cssClass="input" list="{'无','有'}" onchange="showGszmnsfyysfzjeDiv(this)" id="gszmnsfyysfzje" name="head.gszmnsfyysfzje" disabled="true"/>
		      		<%} %>
					<s:div id="gszmnsfyysfzjeDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="yjfzje" name="head.yjfzje"/>(元)</s:div>
					<script type="text/javascript">
						function showGszmnsfyysfzjeDiv(obj){
							if($(obj).val() == '无'){
								$("#gszmnsfyysfzjeDiv").hide();
							}else{
								$("#gszmnsfyysfzjeDiv").show();
							}
						}
					</script>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置人员明细：
				</td>
				<td class="td_zxy02" id="renyuanTd">
					<e:pc id="renyuanButton_w">
						<%if(!myInCounterSign) {%>
						<input type="button" class="btn3_mouseover" value="安置人员明细" onclick="renyuanDetail('w')" />
			      		<%}else{ %>
						<input type="button" class="btn3_mouseover" value="安置人员明细" onclick="renyuanDetail('r')" />
			      		<%} %>
					</e:pc>
					<e:pc id="renyuanButton_r">
						<input type="button" class="btn3_mouseover" value="安置人员明细" onclick="renyuanDetail('r')" />
					</e:pc>
				</td>
				<td class="td_zxy01">
					安置费用明细：
				</td>
				<td class="td_zxy02" id="feiyongTd">
					<e:pc id="feiyongButton_w">
						<%if(!myInCounterSign) {%>
						<input type="button" class="btn3_mouseover" value="安置费用明细" onclick="feiyongDetail('w')" />
			      		<%}else{ %>
						<input type="button" class="btn3_mouseover" value="安置费用明细" onclick="feiyongDetail('r')" />
			      		<%} %>
					</e:pc>
					<e:pc id="feiyongButton_r">
						<input type="button" class="btn3_mouseover" value="安置费用明细" onclick="feiyongDetail('r')" />
					</e:pc>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置人数：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azrs" name="head.azrs" readonly="true" />
				</td>
				<td class="td_zxy01">
					安置总费用(元)：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azfy" name="head.azfy" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					处置申报方式：
				</td>
				<td class="td_zxy02">
					<%if(!myInCounterSign) {%>
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
		      		<%}else{ %>
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" disabled="true"/>
		      		<%} %>
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置说明：
				</td>
				<td colspan="3" class="td_zxy02">
					<r:textarea cssClass="input2" rows="4" id="azsm" name="head.azsm" />
				</td>
			</tr>
		</table>
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>		
		<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:date name="head.sbrq" format="yyyy-MM-dd" var="formatSbrq"/>
	    			<s:textfield cssClass="input" id="sbrq" name="head.sbrq" readonly="true" value="%{#formatSbrq}"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<s:textfield id="slxh" cssClass="input" name="head.slxh" readonly="true"/>
	    		</td>
	    	</tr>
		</table>
<%} %>
		<%@ include file="/inc/according.inc"%>  
		<e:opinion id="test" width="100%">
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>			
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
			<!-- ==========================工作流信息项======================================= -->
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
			<!-- =========================================================================== -->
<%} %>
			<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			<e:opinionPart id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>		
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
		<%if(isInWorkflow){%>
		<%@ include file="/inc/file_huiqian_end.inc"%>
		<%}%>
		<%@ include file="/inc/file_heguishencha_end.inc"%>
<%} %>
		
<%if(!StringUtils.equals("zccz_persondeal2",workflowVO.pdk)){%>		
		
<%} %>
		<%@ include file="/inc/listMessage.inc"%>
		</s:form>
		<!-- 提交按钮muneButton的下拉数据源 -->
		<div style="display: none;">
			<div id="mm2" style="width: 150px;">
				<div onClick="selectCom('0');return false;" >咨询类实体</div>
				<div onClick="selectCom('1');return false;" >非咨询处置类实体</div>
				<div onClick="selectCom('3');return false;" >非咨询持续经营类实体</div>
			</div>
		</div>
	</body>
</html>
