<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tansun.rdp4j.common.model.orm.bo.PTUserBO"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	PTUserBO user = (PTUserBO)request.getAttribute("user");
	boolean isInCounterSign = Boolean.parseBoolean(request.getParameter("isInCounterSign"));
	String adviceType = request.getParameter("adviceType");
	String myAdviceType = request.getParameter("myAdviceType");
	String myAdvice = request.getParameter("myAdvice");
	String mySpjl = request.getParameter("mySpjl");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>审查意见</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			var adviceToOpenner = "";
			var isInit = false;
			$(function(){
				if(isInit)return;
				$.ajaxSetup({
					async : false
				});
				jQuery("#scyjList,#scyjHistoryList").setGridWidth($("#ruler").width());
				$(window).bind('resize', function() {  
					jQuery("#scyjList,#scyjHistoryList").setGridWidth($("#ruler").width()); 
				}); 
				<%if(isInCounterSign){%>
				initButtons();
				<%}%>
				var scjlStr = '[{"buttonHandler":"cancleScjl","buttonIcon":"icon-ok","buttonText":"取消选择"}]';
				addButtons($("#scjl"),scjlStr);
				isInit = true;
			});
				
			function openMessage(){
				window.open("<%=basePath %>zccz/knowQuery_queryNew.do"
					+ "?option=czpgsc","",winOpenStr);
			}
			
			function selectItem(){
				var historyIds = $("#scyjHistoryList").jqGrid('getGridParam','selarrrow');
				//alert(historyIds);
				$.post("<%=basePath %>zccz/dealEvalHead_selectScjl.do",{
					"pgscYj.cldId"		: "" + $("#cldId").val(),
					"historyIds"	: "" + historyIds
				},function(returnStr){
					if("SUCCESS"){
						$("#scyjList").trigger("reloadGrid");
						generatAdvice();
					}else{
						alert("添加意见失败!");
					}
				});
			}
			
			function getYJValue(XMId,XMText,YDId,YDText,YJId,YJText){
				$.post("<%=request.getContextPath() %>/zccz/dealEvalHead_insertScjl.do",{
					"pgscYj.cldId"		: "" + $("#cldId").val(),
					"pgscYj.scxmId"		: "" + XMId,
					"pgscYj.scxmText"	: "" + XMText,
					"pgscYj.scydId"		: "" + YDId,
					"pgscYj.scydText"	: "" + YDText,
					"pgscYj.jtyjId"		: "" + YJId,
					"pgscYj.jtyjText"	: "" + YJText
				},function(returnStr){
					if("SUCCESS" == returnStr){
						$("#scyjList").trigger("reloadGrid");
						generatAdvice();
					}else{
						alert("添加意见失败!");
					}
				});
			}
			
			function setAdviceType(){
				//$("input[name='CScjl']:checked").attr("checked",false);
				//if($("input[name='adviceType']:checked").val() == "0"){
				//	$("input[name='CScjl']").attr("disabled",true);
				//}else{
				//	$("input[name='CScjl']").attr("disabled",false);
				//}
			}
			
			function submitForm(){
				if($("input[name='adviceType']:checked").val() == undefined){
					alert("请选择意见类型！");
					return false;
				}
				//1：最终意见   2：退回意见
				if($("input[name='adviceType']:checked").val() == "1" ){
					//如果是最终意见、退回意见必须选择审批结论。
					if($("input[name='CScjl']:checked").val() == "undefined" ||$("input[name='CScjl']:checked").val()==undefined ){
						alert("请选择审查结论");
						return false;
					}
				}
				if(!isAllItemIsNotNull()){
					alert("项目、要点、意见不能为空!");
					return false;
				}
				$.post("<%=basePath %>zccz/dealEvalHead_submitScyj.do",{
					"adviceType"	: "" + $("#adviceType").val(),
					"pgscYj.cldId"	: "" + $("#cldId").val(),
					"pgscYj.CScjl"	: "" + $("input[name='CScjl']:checked").val()
				},function(returnStr){
					if("SUCCESS" == returnStr){
							var CScjl1Value = document.getElementById('CScjl1').checked;
							var CScjl2Value = document.getElementById('CScjl2').checked;
							var CScjl3Value = document.getElementById('CScjl3').checked;
							var CScjl4Value = document.getElementById('CScjl4').checked;
							var tongguobutongguo = "";
							if(CScjl1Value == true){
								tongguobutongguo = "通过";    
							}else if(CScjl2Value == true){
								tongguobutongguo = "通过（附参考意见）";
							}else if(CScjl3Value == true){
								tongguobutongguo = "不通过";
							}else if(CScjl4Value == true){
								tongguobutongguo = "不具备评估审查条件";
							}
						//办理意见	
						var content = $("#content").val() + "\n\r";
						if($("#content").val() == "" || $("#content").val() == null){
							content = "";
						}
						if(adviceToOpenner=="" && tongguobutongguo!="" ){
							window.opener.setAdvice($("input[name='adviceType']:checked").val(),
								content +"审查结论："+tongguobutongguo,
								$("#content").val(),
								$("input[name='CScjl']:checked").val());
							window.close();
						}else if(tongguobutongguo=="" && adviceToOpenner!="" ){
							window.opener.setAdvice($("input[name='adviceType']:checked").val(),
								content +"审查意见："+"\n\r"+adviceToOpenner,
								$("#content").val(),
								$("input[name='CScjl']:checked").val());
							window.close();
						}else if(tongguobutongguo!="" && adviceToOpenner!=""){
							window.opener.setAdvice($("input[name='adviceType']:checked").val(),
								content + "审查结论："+tongguobutongguo +"\n\r"+"审查意见："+"\n\r"+adviceToOpenner,
								$("#content").val(),
								$("input[name='CScjl']:checked").val());
							window.close();
						}else if(tongguobutongguo=="" && adviceToOpenner==""){
							window.opener.setAdvice($("input[name='adviceType']:checked").val(),
								content,
								$("#content").val(),
								$("input[name='CScjl']:checked").val());
							window.close();
						}
					}else{
						alert("保存失败!");
					}
				});
			}
			
			function isAllItemIsNotNull(){
				ids = jQuery("#scyjList").getDataIDs();
				var result = true;
				$.each(ids,function(i,date){
					if(!isNotNull($("#scyjList").getCell(date,"scxmText"))){
						result = false;
					}
					if(!isNotNull($("#scyjList").getCell(date,"scydText"))){ 
						result = false;
					}
					if(!isNotNull($("#scyjList").getCell(date,"jtyjText"))){
						result = false;
					}
				});
				return result;
			}
			
			function isNotNull(str){
				if(str == null || str =="" || str == undefined){
					return false;
				}
				return true;
			}
			
			function initButtons(){
				var submitButton = '[{"buttonHandler":"submitForm","buttonIcon":"icon-ok","buttonText":"保存"}]';
				if(<%=adviceType%> == "0" || <%=adviceType%> =="1" || <%=adviceType%> =="2"){
					addButtons($("#headButton"),submitButton);
				}
				var selectButton = '[{"buttonHandler":"selectItem","buttonIcon":"icon-add","buttonText":"选择为意见"}]';
				addButtons($("#gview_scyjHistoryList > .ui-jqgrid-titlebar"),selectButton);
				var scyjListButton = '[{"id":"edit","buttonHandler":"editMessage1","buttonIcon":"icon-edit","buttonText":"修改"},\
					{"id":"del","buttonHandler":"delMessage","buttonIcon":"icon-remove","buttonText":"删除"},\
					{"buttonHandler":"openMessage","buttonIcon":"icon-edit","buttonText":"打开审查知识库"}]';
				addButtons($("#gview_scyjList > .ui-jqgrid-titlebar"),scyjListButton);
				$('#save').attr("disabled",true);
				$('#cancel').attr("disabled",true);
			}
			
			function cancleScjl(){
				$("input[name='CScjl']:checked").attr("checked",false);
				tongguobutongguo();
			}	
			
			function editMessage(){
				ids = jQuery("#scyjList").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0)
					return false;
				$(ids).each(function(i,id){
					jQuery("#scyjList").jqGrid('editRow',id);
				});
				$('#edit').attr("disabled",true);
				$('#save').attr("disabled",false);
				$('#cancel').attr("disabled",false);
			}
			
			function editMessage1(){
				ids = jQuery("#scyjList").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0 || ids.length>1){
					alert('请选择一条记录');
					return false;
				}else{
					//alert(ids);
					window.open("<%=basePath %>zccz/dealEvalHead_editMessage1.do?bodyId="+ids,"","");
					return false;
				}
			}
			
			function saveMessage(){
				ids = jQuery("#scyjList").jqGrid('getGridParam','selarrrow');
				if(ids.length == 0)
					return false;
				$('#edit').attr("disabled",false);
				$('#save').attr("disabled",true);
				$('#cancel').attr("disabled",true);
				$(ids).each(function(i,id){
						jQuery("#scyjList").jqGrid('saveRow',id,function(returnObj){
							if(returnObj.status == 200){
								return true;
							}else{
								alert("保存失败,请联系管理员!");
								return false;
							}
						},'<%=basePath %>zccz/dealEvalHead_updateScyj.do',null,function(){
							generatAdvice();
						});
				});	
			}
			
			function cancelMessage(){
				if(ids.length == 0)
					return false;
				$(ids).each(function(i,id){
					jQuery("#scyjList").jqGrid('restoreRow',id);
				});	
				$('#edit').attr("disabled",false);
				$('#save').attr("disabled",true);
				$('#cancel').attr("disabled",true);			
			}
					
			function delMessage(){
				var ids = jQuery("#scyjList").jqGrid('getGridParam','selarrrow');
				$.post("<%=basePath %>zccz/dealEvalHead_delScyj.do",{
					"ids" : '' + ids
				},function(returnStr){
					if("SUCCESS" == returnStr){
						jQuery("#scyjList").trigger("reloadGrid");
						generatAdvice();
					}else{
						alert(returnStr);
					}
				});
			}
			
			function isSingle(ids){
				if(ids.length < 1){
					alert("请选择一条记录");
					return false;
				}else if(ids.length > 1){
					alert("只能选择一条记录");
					return false;
				}else{
					return true;
				}
			}
			
			function generatAdvice(){
				var advicePreview = "";
				adviceToOpenner = "";
				/*
				advicePreview = $("#content").val();
				if(advicePreview!=""){
					advicePreview ="\n\r办理意见："+advicePreview;
				}
				adviceToOpenner = advicePreview;
				advicePreview += "<br>";
				adviceToOpenner += "\n\r";
				*/
				var ids = $("#scyjList").getDataIDs();
				if(ids.length > 0){
					advicePreview += "<ol>";
					var CScjl1Value = document.getElementById('CScjl1').checked;
					var CScjl2Value = document.getElementById('CScjl2').checked;
					var CScjl3Value = document.getElementById('CScjl3').checked;
					var CScjl4Value = document.getElementById('CScjl4').checked;
					if(CScjl1Value == true){
						advicePreview += "通过";    
					}else if(CScjl2Value == true){
						advicePreview += "通过（附参考意见）";
					}else if(CScjl3Value == true){
						advicePreview += "不通过";
					}else if(CScjl4Value == true){
						advicePreview += "不具备评估审查条件";
					}
					$.each(ids,function(i,date){
					if($("#scyjList").getCell(date,"jtyjText")!=""){
					
						adviceToOpenner += i + 1 + "." + 
							//$("#scyjList").getCell(date,"scxmText") + " " + 
							//$("#scyjList").getCell(date,"scydText") + " " + 
							$("#scyjList").getCell(date,"jtyjText") + "\n\r";
						advicePreview += "<li>" + 
							//$("#scyjList").getCell(date,"scxmText") + "&nbsp;" + 
							//$("#scyjList").getCell(date,"scydText") + "&nbsp;" + 
							$("#scyjList").getCell(date,"jtyjText") + 
							"</li>";
					}
					});
					advicePreview += "</ol>";
				}
				$("#advicePreviewTd").html(advicePreview);
			}
			function tongguobutongguo(){
				generatAdvice()
			}
		</script>
	</head>
	<body>
		<s:form>
		<s:hidden id="cldId" name="pgscYj.cldId" />
		
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">意见信息</div>
			<div id="headButton" class="panel-tool"></div>
		</div>
		<table width="100%" id="ruler" border="0" cellpadding="0" cellspacing="0" align="center" class="newtable">
			<tr>
				<td class="td_zxy01">意见类型</td>
				<td class="td_zxy03">
					<%if(StringUtils.equals("1",adviceType)){ %>
						<s:radio id="adviceType" name="adviceType" list="#{'1':'最终意见','0':'过程意见','2':'退回意见'}" onclick="setAdviceType()" value="%{#parameters.myAdviceType}"></s:radio>
					<%} else if(StringUtils.equals("2",adviceType)){%>
						<s:radio id="adviceType" name="adviceType" list="#{'0':'过程意见','2':'退回意见'}" onclick="setAdviceType()" value="%{#parameters.myAdviceType}"></s:radio>
					<%} else if(StringUtils.equals("0",adviceType)){%>
						<s:radio id="adviceType" name="adviceType" list="#{'0':'过程意见'}" onclick="setAdviceType()" value="%{#parameters.myAdviceType}"></s:radio>
					<%} %>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">意见预览</td>
				<td class="td_zxy03" height="22">
					<span id="advicePreviewTd" style="width: 94%;"></span>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">办理意见</td>
				<td class="td_zxy03">
					<textarea onblur="generatAdvice()" id="content" name="content" rows="4" style="background-color:#ffffff;width: 94%;"><%=myAdvice %></textarea>
				</td>
			</tr>
		</table>
		<br>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">审查信息</div>
			<div class="panel-tool" id="scjl"></div>
		</div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="newtable">
			<tr>
				<td class="td_zxy01">
					审查结论:
				</td>
				<td class="td_zxy03">
					<s:radio value="%{radioValue}" id="CScjl" name="CScjl" onclick="tongguobutongguo();" list="#{'1':'通过','2':'通过（附参考意见）','3':'不通过','4':'不具备评估审查条件'}"/>
				</td>
			</tr>
		</table>
		<input type="hidden" id="deleteBZ" >
	<table id="scyjList"></table>
	<script type="text/javascript">
		jQuery("#scyjList").jqGrid({
			url:"<%=basePath %>zccz/dealEvalHead_getMyScyjJson.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				"pgscYj.cldId" : "" + $("#cldId").val()
			},
			colNames:['id','审查项目','审查要点','具体意见'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'scxmText',index:'scxmText',editable:true,width:60},
				{name:'scydText',index:'scydText',editable:true,width:60},
				{name:'jtyjText',index:'jtyjText',editable:true}
			],
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			rowNum:0,
			rowNum:999999999,
			gridComplete:function(){generatAdvice();},
			caption: '审查意见',
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
	<table id="scyjHistoryList"></table>
	<script type="text/javascript">
		jQuery("#scyjHistoryList").jqGrid({
			url:"<%=basePath %>zccz/dealEvalHead_getScyjSubmitJson.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				"pgscYj.cldId" : "" + $("#cldId").val()
			},
			colNames:['id','意见提交人Id','提交人','提交日期','审查项目','审查要点','具体意见'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'tjyjr',index:'tjyjr',hidden:true},
				{name:'tjyjrxm',index:'tjyjrxm',width:50},
				{name:'tjrq',index:'tjrq',width:60},
				{name:'scxmText',index:'scxmText',editable:true},
				{name:'scydText',index:'scydText',editable:true},
				{name:'jtyjText',index:'jtyjText',editable:true}
			],
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			rowNum:0,
			height:'auto',
			caption: '历史审查意见',
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}
		});
		
		function reloadPGSC(){
			jQuery("#scyjList").trigger("reloadGrid");
		}
	</script>
	</s:form>
	</body>
</html>

