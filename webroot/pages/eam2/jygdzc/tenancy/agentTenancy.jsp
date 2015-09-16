<%@ page language="java"
	import="java.util.*,com.tansun.rdp4j.common.util.*"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = (String) request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	String ywlx = "null".equals((String)request.getAttribute("ywlx"))?"":(String)request.getAttribute("ywlx");
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
    statusjysy = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "blank_Template_jysy"); 
    boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);	
    String userName=(String)request.getAttribute("userName");  
%>
<!-- ==========================页面权限控制=========================================== -->
<r:controlfile file="/pages/eam2/jygdzc/tenancy/agentTenancy.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>经营租赁</title>
		<meta http-equiv="pragma" content="no-cache" />
		<base href="<%=basePath%>" />
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "zltbWorkflow";
			actionPath = "zltbWorkflow";
		%>
		<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- 会签属性 -->
		<%
			if (workflowVO.taskName.equals("建银实业综合处理")
					|| workflowVO.taskName.equals("业务管理部门综合处理")) {
				counterSignBtnDisplay = true;
			}
		%>
		<!-- ================================================================================== -->
<script type="text/javascript">
	     var isInit=false;
	     //建投新建正文合成正文=============================
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
        //建银实业新建正文合成正文========================
		if("0"=="<%=statusjysy%>"){
			var isNewjysy = true;
		}else{
		   	var isNewjysy = false;
		} 
		if("2"=="<%=statusjysy%>"){
			var isMergejysy = true;
		}else{
			var isMergejysy = false;
		} 
        //==============================================
      $(document).ready(function(){	
      window.parent.clearPanelTool();
        if(isInit)return;
        isInit = true;	
		jQuery("#blyj_reason_list").setGridWidth($("#table").width());
		jQuery("#file_list").setGridWidth($("#table").width());
		jQuery("#tenancy_list").setGridWidth($("#table").width());
		jQuery("#change_list").setGridWidth($("#table").width());
		jQuery("#cancel_list").setGridWidth($("#table").width());
		jQuery("#file_huiqianlist").setGridWidth($("#table").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
	    $(window).bind('resize', function(){
			jQuery("#blyj_reason_list").setGridWidth($("#table").width());
			jQuery("#file_list").setGridWidth($("#table").width());
			jQuery("#tenancy_list").setGridWidth($("#table").width());
			jQuery("#change_list").setGridWidth($("#table").width());
			jQuery("#cancel_list").setGridWidth($("#table").width());
			jQuery("#file_huiqianlist").setGridWidth($("#table").width());
			jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
       });
	 <%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
				
				 //合成正文按钮
	<%
	    if(!inCounterSign){
	%>
		//查看正文按钮
		var headBHGen = document.getElementById("bianhao").value;
		if(headBHGen == null || headBHGen.length == 0){
	    	<e:pc id="scbh">
			var buttonStr_shengchenbianhao ='[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
			window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
			</e:pc>
		}else{
		 <e:pc id="hczw">
		   <%
		    if(status.equals("1")){
		   %>
		   
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成中国建投正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			<%
			   }
			%>
		</e:pc>
		<e:pc id="hczwjysy">
		   <%
		    if(statusjysy.equals("1")){
		   %>
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwenjysy","buttonIcon":"icon-mergeFile","buttonText":"合成建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			<%
			   }
			%>
		</e:pc>
		}
		 //（处理）新建正文按钮
		<e:pc id="sczw">
			<%
			if (workflowVO.taskName.equals("业务管理部门综合处理")) {
			%>
				if("0"!="<%=status%>"){
					var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建中国建投正文" : "处理中国建投正文" %>"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			 	}
			<%
				}else{
			%>
					var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建中国建投正文" : "处理中国建投正文" %>"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			<%
				}
			%>

		</e:pc>
		<e:pc id="sczwjysy">
		<%
		if (workflowVO.taskName.equals("建银实业综合处理")) {%>	
			if("0"!="<%=statusjysy%>"){
				var buttonStr_zhengwen_Jysy = '[{"id":"xjzwjysyButton","buttonHandler":"mainWindow.openzhengwenJysy","buttonIcon":"icon-createFile","buttonText":"<%=statusjysy.equals("0") ? "新建建银实业正文" : "处理建银实业正文" %>"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen_Jysy,"");
			}
		<%	
			}else{
		%>
			var buttonStr_zhengwen_Jysy = '[{"id":"xjzwjysyButton","buttonHandler":"mainWindow.openzhengwenJysy","buttonIcon":"icon-createFile","buttonText":"<%=statusjysy.equals("0") ? "新建建银实业正文" : "处理建银实业正文" %>"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen_Jysy,"");
		<%
			}
		%>
		</e:pc>
		//查看正文
		<%
 		String DLRmc = (String)request.getAttribute("DLRmc");
		   if ("建银实业".equals(request.getAttribute("DLRbmmc"))&&"0"!=statusjysy) {
		%>
		
		<e:pc id="ckzwjysy">
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		<%
		}else if(!"建银实业".equals(request.getAttribute("DLRbmmc"))&&!userName.equals(DLRmc)){
		%>
		if("0"!="<%=status%>"){
			<e:pc id="ckzw">
				var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看中国建投正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
		}
		<e:pc id="ckzwjysy">
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		<%
			}
		%>
        <e:pc id="banjie">
			var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
			window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
       </e:pc>
		
						//在列表的标题右端添加按钮，最后一个按钮距右端20px
		<e:pc id="tenancy_list">
			var buttonBlyjJSonString1 = '[{"buttonHandler":"add_tenancy","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delete_tenancy","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"update_tenancy","buttonIcon":"icon-edit","buttonText":"修改"}\
			]';
			addButtons(jQuery("#gview_tenancy_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString1);
		</e:pc>
	    //在列表的标题右端添加按钮，最后一个按钮距右端20px
		<e:pc id="cancel_list">
		var buttonBlyjJSonString2 = '[{"buttonHandler":"add_cancel","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delete_cancel","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"update_cancel","buttonIcon":"icon-edit","buttonText":"修改"}\
			]';
			addButtons(jQuery("#gview_cancel_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString2);
		</e:pc>
	    //在列表的标题右端添加按钮，最后一个按钮距右端20px
		<e:pc id="change_list">
		var buttonBlyjJSonString3 = '[{"buttonHandler":"add_change","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delete_change","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"update_change","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
			addButtons(jQuery("#gview_change_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString3);
		</e:pc>
		<e:pc id="blyj_reason_list">
		var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
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
	<%
	   }else{
		 String DLRmc = (String)request.getAttribute("DLRmc");
		   if ("建银实业".equals(request.getAttribute("DLRbmmc"))) {
		%>
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			<%
			}else if(!"建银实业".equals(request.getAttribute("DLRbmmc"))&&!userName.equals(DLRmc)){
			%>
		
			//查看正文按钮 建投
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看中国建投正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			//查看正文按钮 建银实业
	 		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		<%
			} 
		  }
		   	if(workflowVO.getStep().equals("end")){
		%>
			var buttonStr_hetong = '[{"buttonHandler":"mainWindow.addContract","buttonIcon":"icon-createFile","buttonText":"合同维护"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hetong,"");
		
		<%
			}
		%>
		});  
	
       function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
		}	
		function delete_tenancy(){
				var gr = jQuery("#tenancy_list").jqGrid('getGridParam','selarrrow');
				//alert(gr);
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					if(confirm("确认删除？")){
						var sheettype = "${sheettype}";
						var headId="${headId}";
						var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_deleteBody.do?";
						$.post(delblyjurl,{headId:"" + headId + "",zllsbId:"" + gr + "",ywlx:"rent"}, function(data){
							jQuery("#tenancy_list").trigger("reloadGrid");
						});
					}
				}
				return false;
			};
			function add_tenancy(){
			    var bmbh = document.getElementById('ngbmmc').value;
			    bmbh = encodeURI(bmbh);
			    var ywlx = document.getElementById("ywlx");
				window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyInfo&headId=${headId}&ywlx=rent&bmbh='+bmbh,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				return false;
			};
			function update_tenancy(){
				var gr = jQuery("#tenancy_list").jqGrid('getGridParam','selarrrow');
				//alert(gr);
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else if(gr.length > 1){
				    alert("只能选中一条记录！");
				}else if(gr.length==1){	
					window.open('<%=basePath%>zltb/IntentionManageBody_modify.do?headId=${headId}&sheettype=tenancyInfo&handle=amend&ywlx=rent&zllsbId=' + gr ,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				return false;
			};
			function changeNgbmmc(){
				var dept = document.getElementById("ngbm");
	    	 	var i =document.getElementById("ngbm").selectedIndex;
	    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
			}
		    function add_change(){
			    var bmbh = document.getElementById('ngbmmc').value; 
			    bmbh = encodeURI(bmbh);
				var ywlx = document.getElementById("ywlx");
				window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyInfo&headId=${headId}&ywlx=change&bmbh='+bmbh,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				return false;
			};
			function delete_change(){
				var gr = jQuery("#change_list").jqGrid('getGridParam','selarrrow');
				//alert(gr);
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					if(confirm("确认删除？")){
						var sheettype = "${sheettype}";
						var headId="${headId}";
						var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_deleteBody.do?";
						$.post(delblyjurl,{headId:"" + headId + "",zllsbId:"" + gr + "",ywlx:"change"}, function(data){
							jQuery("#change_list").trigger("reloadGrid");
						});
					}
				}
				return false;
			};
			function update_change(){
				var gr = jQuery("#change_list").jqGrid('getGridParam','selarrrow');
				//alert(gr);
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else if(gr.length>1){
					alert("只能选中一条记录!");
				}else{	
					window.open('<%=basePath%>zltb/IntentionManageBody_modify.do?headId=${headId}&sheettype=tenancyInfo&handle=amend&ywlx=change&zllsbId=' + gr ,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				return false;
			};
			
			function delete_cancel(){
				var gr = jQuery("#cancel_list").jqGrid('getGridParam','selarrrow');
				//alert(gr);
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					if(confirm("确认删除？")){
						var sheettype = "${sheettype}";
						var headId="${headId}";
						var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_deleteBody.do?";
						$.post(delblyjurl,{headId:"" + headId + "",zllsbId:"" + gr + "",ywlx:"rent"}, function(data){
							jQuery("#cancel_list").trigger("reloadGrid");
						});
					}
				}
				return false;
			};
			function add_cancel(){
				var ywlx = document.getElementById("ywlx");
				var bmbh = document.getElementById("ngbmmc").value;
				bmbh = encodeURI(bmbh);
				window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyInfo&headId=${headId}&ywlx=quit&bmbh='+bmbh,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				return false;
			};
			function update_cancel(){
				var gr = jQuery("#cancel_list").jqGrid('getGridParam','selarrrow');
				//alert(gr);
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					window.open('<%=basePath%>zltb/IntentionManageBody_modify.do?headId=${headId}&handle=amend&sheettype=tenancyInfo&ywlx=quit&zllsbId=' + gr,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				return false;
			};		
	      function checkEAMFormJSMethod(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		   // var chengsong = document.getElementById("chengsong");
			//if(chengsong.value == null || chengsong.value.length == 0){
			//	alert("呈送不能为空！");
			//	chengsong.focus();
		    //    return false;
		   // }
		    
		    var lxdh = document.getElementById("lxdh");
			if(lxdh.value == null || lxdh.value.length == 0){
				alert("联系电话不能为空！");
				lxdh.focus();
		        return false;
		    }
		   <e:pc id="scbh">
		    var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
		 </e:pc>
		 	var x = document.getElementById("ywlx");
	 		if(x.selectedIndex == 0){
				var idArray = $("#tenancy_list").getDataIDs();
		   		if(idArray == null||idArray.length == 0){
		      		alert("请至少添加一条数据");
		       	 return false;
		        }
			}else if(x.selectedIndex == 1){
				var idArray = $("#change_list").getDataIDs();
		   		if(idArray == null||idArray.length == 0){
		      		alert("请至少添加一条数据");
		       	 return false;
		        }
			}else if(x.selectedIndex == 2){
				var idArray = $("#cancel_list").getDataIDs();
		   		if(idArray == null||idArray.length == 0){
		      		alert("请至少添加一条数据");
		       	 return false;
		        }
			}
		    return true;
		}
		function commitWorkflow(taskId,outCome){
		<%
			if (workflowVO.taskName.equals("建银实业综合处理")) {
		%>
			if("业务管理部门综合处理"==outCome){
				if("0"=="<%=statusjysy%>"){
			      	alert("正文未新建");
		    	 	return false;
	        	}else{
					if(!isMergejysy){
				    	alert("请先合成正文");
			    	 	return false;
			   		}
		        } 
			}
		<%
			}else if(workflowVO.taskName.equals("业务管理部门综合处理")){
		%>	
			if("业务运营组处理"==outCome){
			    if(!isMerge){
			    	alert("请先合成正文");
		    	 	return false;
		   		}
			}
		<%
			}
		%>
		
			return true;
		}
		//合同维护
		function  addContract(){
				if("0"=="<%=ywlx%>"){
					var url = 'htqs/ContractManageHead_tenancyTOcontract.do?ywlx=0&sheettype=agentContract&pdk=jyzc_contract_agent&zlheadId=${headId}';
				}else if("1"=="<%=ywlx%>"){
					var url = 'htqs/ContractManageHead_tenancyTOcontract.do?ywlx=1&sheettype=agentContract&pdk=jyzc_contract_agent&zlheadId=${headId}';
				}else if("2"=="<%=ywlx%>"){
					var url = 'htqs/ContractManageHead_tenancyTOcontract.do?ywlx=2&sheettype=agentContract&pdk=jyzc_contract_agent&zlheadId=${headId}';
				}
				 url = encodeURIComponent(url);
				 url = basePathJs + 'index.do?urlPortal=' + url;
				 window.open(url,'','height=600, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				return false;
		};
		//流程办结								
		function createBook4Card(){
		    var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
	    <%
			if (workflowVO.taskName.equals("业务管理部门综合处理")) {
		%>
			//var chengsong = document.getElementById("chengsong");
			//	if(chengsong.value == null || chengsong.value.length == 0){
				//	alert("呈送不能为空！");
			//		chengsong.focus();
			 //     return false;
			//  }
			  //  if(!isMerge){
			  //  	alert("请先合成正文");
		    //	 	return false;
		   	//	}
		<%
			}else{
		%>	
		     	if(!isMergejysy){
			    	alert("请先合成正文");
		    	 	return false;
		   		}
		 <%
	   		 }
		 %>
		 	if(confirm("是否办结？")){
				var headId = "${headId}"; 
				var url = "<%=basePath%>zltb/IntentionManageHead_createBookBycldId.do";
				$.post(url,{headId:"" + headId + ""}, function(data){
					if(data !=""){
						alert(data);
						if(data=="办结成功"){
							document.myform.action = document.getElementById("endUrl").value;
							document.myform.url.value = document.getElementById("endViewUrl").value;
							document.myform.sheetId.value = document.getElementById("bianhao").value;
							document.myform.outCome.value = "流程办结";
							document.myform.submit();
							return false;
						}
					}
				});
			}
		}	
		function view(gr){
		    var bmbh = document.getElementById('ngbm').value;  
			var ywlx  =document.getElementById("ywlx").selectedIndex;
			var bmb
			if(ywlx==0){
				ywlx ="rent";
			}else if(1==ywlx){
				ywlx ="change";
			}else if(2==ywlx){
				ywlx ="quit";
			}
			window.open('<%=basePath%>zltb/IntentionManageBody_viewBody.do?ywlx='+ywlx+'&headId=${headId}&sheettype=tenancyInfo&alldesable=true&zllsbId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			return false;
		}	
		function clickIndex(){
			var chooseData = document.getElementById('ywlx').value;
			document.getElementById('chooseData').value = chooseData;
		}						
		//生成编号
		function createBianhao(){
			var headId=$("#headId").val();
			$.post("<%=basePath%>zltb/IntentionManageHead_createNum.do",{
				"headId":headId,
				"code":"jjzlyw_agent"
			},function(data){
				document.getElementById("bianhao").value = data;
				window.parent.removeObj("#shengchenButton");
				//var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
				//window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
			});
		}
		function getCallBack4Tree1(ids,value){
			document.getElementById("hqbmvalue1").value = value;
			document.getElementById("hqbmids1").value = ids;
		}
	
	<!-- ====================正文======================================================== -->
<!-- ============================================================================ -->


	//（处理）新建正文
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理中国建投正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
			isNew = false;
		}
		function openzhengwenJysy(){
			wordTemplate('blank_Template_jysy', document.getElementById("myform"),false,true, "经营租赁业务（代理机构）正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwjysyButton .l-btn-text","处理建银实业正文");
			window.parent.setClass("#xjzwjysyButton .l-btn-text","l-btn-text icon-dealFile");
			isNewjysy = false;
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"经营租赁业务（代理机构）正文"); 
		}
		//查看正文
		function viewzhengwenjysy(){
			wordTemplate('blank_Template_jysy', document.getElementById("myform"),true,false,"经营租赁业务（代理机构）正文"); 
		}
		//合成正文
		function hechengzhengwen(){
			if(isNew){
				alert("正文未被创建");
				 return false;
			}
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		//  var chengsong = document.getElementById("chengsong");
		//	if(chengsong.value == null || chengsong.value.length == 0){
		//		alert("呈送不能为空！");
		//		chengsong.focus();
		//      return false;
		//   }
			MergeWordStart('manager_jic_jysy_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "经营租赁业务（代理机构）正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			isMerge = true;
			<%
				if (workflowVO.taskName.equals("业务管理部门综合处理")) {
				
			%>
				window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
			<%
				}
			%>
		}
		//合成正文
		function hechengzhengwenjysy(){
			if(isNewjysy){
				alert("正文未被创建");
				 return false;
			}
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		    //var chengsong = document.getElementById("chengsong");
			//if(chengsong.value == null || chengsong.value.length == 0){
			//	alert("呈送不能为空！");
			//	chengsong.focus();
		    //  return false;
		   // }
			MergeWordStart('manager_jysy_gzlxdht','blank_Template_jysy','manager_gzlxdbj' , document.getElementById("myform"), "经营租赁业务（代理机构）正文",'hechengHeadJysy()','hechengBottomJysy()');
			window.parent.removeObj("#hczwButton");
			isMergejysy = true;
			<%
				if (workflowVO.taskName.equals("建银实业综合处理")) {
				
			%>
				window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
			<%
				}
			%>
		}
		
		function hechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcId").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
		
		}
		
		function hechengBottom(){
		    var strDate = "<%=strDate%>";
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,"中国建银投资有限责任公司",2,false,false,false,false);
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
		function hechengHeadJysy(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcId").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
		
		}
		function checkEAMFormTitle(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.trim().length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		     return true;
		}	
		function hechengBottomJysy(){
		    var strDate = "<%=strDate%>";
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,"建银实业控股有限责任公司",2,false,false,false,false);
			MyRangeBottom.find.execute("￥￥HCRQ",false,false,false,false,false,true,false,false, strDate,2,false,false,false,false);
			var headId=$("#headId").val();
			$.ajaxSetup({async:false});
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
		// 提交需要放开的属性
		function beforeWorkFlowSubmit(){
			$("input").removeAttr("disabled");	
			$("textarea").removeAttr("disabled");	
			$("select").removeAttr("disabled");	
			return true;
		}	
</script>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
		onload="change();">
		<%@ include file="/inc/word.inc"%>
		<s:form action="zltb/IntentionManageHead_save.do" id="myform"
			method="post">
			<s:hidden name="headId" id="headId" value="%{#request.headId}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<s:hidden name="head.id" value="%{#request.headId}" />
			<s:hidden name="head.sheettype" value="%{#request.sheettype}" />
			<s:hidden name="head.lcId" id="lcId" value="租赁业务(代理机构)" />
			<s:hidden name="chooseData" id="chooseData" />
			<s:set name="biaodanid" value="head.id" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<!-- ==========================定义工作流隐藏域==================================== -->
			<%
				String urlHeader = request.getContextPath() + "/" + actionSpaceName
						+ "/" + actionPath + "_";
			%>
			<!-- 工作流表单提交URL设置 -->
			<input type="hidden" id="commitUrl"
				value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
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
				value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
			<input type="hidden" id="draftParticipationUrl"
				value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
			<input type="hidden" id="saveDraftUrl"
				value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
			<input type="hidden" id="saveTodoUrl"
				value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
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
				value="zltb/IntentionManageHead_modify.do" />
			<input type="hidden" name="circulationParam" value="headId=${headId}" />
			<input type="hidden" name="circulationTitle"
				value="[传阅]<s:property value="head.biaoti" />" />
			<input type="hidden" id="circulationParticipation"
				value="<%=urlHeader + "getCirculationParticipationList.do"%>" />
			<input type="hidden" name=counterSignTitle
				value="<s:property value="head.biaoti" />会签办理单" />
			<input type="hidden" name="counterSignUrl"
				value="zltb/IntentionManageHead_modify" />
			<input type="hidden" name="actionName" value="<%=actionPath%>_todo" />
			<input type="hidden" name="namespace" value="<%=actionSpaceName%>" />
			<!-- =========================================================================== -->

			<!-- 新建正文需要的 -->
			<r:userhidden id="userid" />
			<r:depthidden view="N" name="deptnameshow" />
			<r:depthidden view="N" name="deptid" />
			<!-- ==========================新建正文==================================== -->
			<!-- =========================================================================== -->
			<br />
			<div align="center">
				<span class="STYLE7 STYLE1">中国建银投资有限责任公司经营租赁业务(代理机构)<%@ include
						file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
			</div>
			<br />
			<!-- ==========================工作流信息项======================================= -->
			<%@ include
				file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
			<!-- =========================================================================== -->
			<br />
			<hr color="#6600CC" align="center" width="100%" />
			<table class="newtable" id="table" width="100%" border="0"
				align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						<font color="red">*</font>标题：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.biaoti" id="biaoti" cssClass="input2"
							value='%{#request.head.biaoti}' />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						呈送：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.chengsong" id="chengsong"
							cssClass="input2"  />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						编号：
					</td>
					<td class="td_zxy02">
						<s:textfield name="head.bianhao" id="bianhao" cssClass="input"
							readonly="true" />
					</td>
					<td class="td_zxy01">
						急缓程度：
					</td>
					<td class="td_zxy02">
						<r:select list="#{'0':'一般','1':'急','2':'特急'}" name="head.jhcd"
							id="jhcd" value="%{#request.head.jhcd}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						拟稿人：
					</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngr"   value="%{#request.head.ngr}" />
						<r:textfield name="head.ngrmc" id="ngrmc" cssClass="input"
							value="%{#request.head.ngrmc}" readonly="true" />
					</td>
					<td class="td_zxy01">
						<font color="red">*</font> 联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.lxdh" id="lxdh" cssClass="input"
							onblur="checkPhone(this);" value="%{#request.head.lxdh}" />
					</td>
				</tr>
				<tr>

					<td class="td_zxy01">
						拟稿日期：
					</td>
					<td class="td_zxy02">
						<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<r:textfield name="head.ngrq" id="ngrq" cssClass="input"
							value="%{#draftDate}" readonly="true" />
					</td>
					<td class="td_zxy01">
						拟稿部门：
					</td>
					<td class="td_zxy02">
						<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    				<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
					</td>
				</tr>

				<tr>
					<td class="td_zxy01">
						业务类型：
					</td>
					<td class="td_zxy02">
						<r:select list="#{'0':'出租','1':'变更','2':'退租'}" name="head.ywlx"  value="%{#request.head.ywlx}" id="ywlx" onclick="clickIndex();" onchange="change()"/>
					</td>
					<td class="td_zxy01">
						租赁总金额：
					</td>
					<td class="td_zxy02">
						<r:textfield name="" cssClass="input" id="zjg" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						会签部门：
					</td>
					<td class="td_form02" colspan="3">
						<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"
							cssClass="input2" />
						<s:hidden name="head.hqbmid" id="hqbmids" />
						<e:pc id="xzhq">
							<img
								src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
								onclick="openTreeByType();" width="21" height="20"
								align="absmiddle" />
						</e:pc>
						 <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" isJianTou="Y"/><%} %>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						委托管理机构会签部门：
					</td>
					<td class="td_form02" colspan="3">
						<r:textfield name="head.syhqbm" id="hqbmvalue1" readonly="true"
							cssClass="input2" />
						<s:hidden name="head.syhqbmid" id="hqbmids1" />
						<e:pc id="syxzhq">
							<img
								src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
								onclick="openTreeByType1();" width="21" height="20"
								align="absmiddle" />
						</e:pc>
						 <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" isJianTou="N"/><%} %>
					</td>
				</tr>
			</table>
			<div id="chuzu" style="display: block">
				<table id="tenancy_list"></table>
			</div>
			<div id="biangeng" style="display: block">
				<table id="change_list"></table>
			</div>
			<div id="tuizu" style="display: block">
				<table id="cancel_list"></table>
			</div>
			<%@ include file="/inc/according.inc"%>
			<e:opinion id="test" width="100%">
				<e:opinionPart id="LEADER" name="LEADER"
					biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" name="OPERATION_GROUP"
					biaodanid="%{#request.biaodanid}" value="" text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"
					name="MEETING_DEPT" value="" text="会签部门意见：">
				</e:opinionPart>
				<!-- ==========================工作流信息项======================================= -->
				<%@ include
					file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
				<!-- =========================================================================== -->
				<e:opinionPart id="WORK_MANAGE_DEPT" name="WORK_MANAGE_DEPT"
					biaodanid="%{#request.biaodanid}" value="" text="业务管理部门意见："></e:opinionPart>
				<e:opinionPart id="AGENT_MEETING_DEPT"
					biaodanid="%{#request.biaodanid}" name="AGENT_MEETING_DEPT"
					value="" text="委托管理机构内部会签意见：" />
				<e:opinionPart id="AGENT_MANAGE_DEPT" name="AGENT_MANAGE_DEPT"
					biaodanid="%{#request.biaodanid}" value="" text="委托管理机构意见："></e:opinionPart>
				<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
			</e:opinion>
			<%@ include
				file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_huiqian_end.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
		</s:form>
		<SCRIPT language=JavaScript type=text/JavaScript>
	function change(){
		var x=document.getElementById("ywlx")
		var chooseData = document.getElementById('chooseData').value;
		var dates = 0;
 		if(chooseData=="0"){
			dates = jQuery("#tenancy_list").getDataIDs();
		}else if(chooseData=="1"){
			dates = jQuery("#change_list").getDataIDs();
		}else{
			dates = jQuery("#cancel_list").getDataIDs();
		}
		if(dates.length>0){
			alert("已添加数据，不能变更业务类型!");
			document.getElementById("ywlx").value = chooseData;
			return false;
		}
		if(x.selectedIndex == 0){
			chuzu.style.display="block";
			biangeng.style.display="none";
			tuizu.style.display="none";
		}else{
			if(x.selectedIndex == 1){
				chuzu.style.display="none";
				biangeng.style.display="block";
				tuizu.style.display="none";
			}else{
				if(x.selectedIndex == 2){
				chuzu.style.display="none";
				biangeng.style.display="none";
				tuizu.style.display="block";
				}
			}
		}
	}
	
	function saveHead(){
		  aaa=document.getElementById("myform");
		  aaa.action="<%=basePath%>zltb/IntentionManageHead_save.do?sheettype=tenancy&headId=${headId}";
	}
	function reloadGrid(){
	 		//alert("刷新");
	 		var x = document.getElementById("ywlx");
	 		
	 		
	 		if(x.selectedIndex == 0){
	 			$("#tenancy_list").trigger("reloadGrid");
			}else if(x.selectedIndex == 1){
				$("#change_list").trigger("reloadGrid");
			}else if(x.selectedIndex == 2){
				$("#cancel_list").trigger("reloadGrid");
			}
	}
	function compute(){				
	var values=0;
	$("td[aria-describedby='tenancy_list_yxzjzje']").each(function(i,obj){
             var r=$(obj).text();
             values=values+parseFloat(r);
             });  
             document.getElementById("zjg").value=values;
	}
	<e:pc id="jtdeptids">
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
		</e:pc>
		<e:pc id="sydeptids">
		function openTreeByType1(){//打开树，根据类型打开类型  
			var url = basePathJs + "chooseHqbm.do?deptType=1&ids=" + document.getElementById("hqbmids1").value;
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}

		function getCallBack4Tree1(ids,value){
			document.getElementById("hqbmvalue1").value = value;
			document.getElementById("hqbmids1").value = ids;
		}
		</e:pc>
</SCRIPT>
	</body>
</html>
<script type="text/javascript">
                                        jQuery("#tenancy_list").jqGrid({       
                                            url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?headId=${headId}",
											datatype: "json",
											mtype:"POST",    
                                            colNames: ['id','资产编号', '资产名称','资产类型', '预估租赁起始日期', '预估租赁到期日期','资产承租（承办）人','意向租期','意向租金总额'],
                                            colModel: [
                                            	{name:'id',index:'id',editable:true,hidden:true},
												{name:'zcbh',index:'zcbh',editable:true,width:100},
										   		{name:'zcmc',index:'zcmc',editable:true,width:100},
										   		{name:'CZclx',index:'CZclx',editable:true,width:100},
										   		{name:'zlqsrq',index:'zlqsrq',editable:true,width:150},
												{name:'zldqrq',index:'zldqrq',editable:true,width:150},
										   		{name:'czr',index:'czr',editable:true,width:150},
										   		{name:'yxzq',index:'yxzq',editable:true,width:100},
										   		{name:'yxzjzje',index:'yxzjzje',editable:true,width:100}
										   	],
										   	loadComplete:function(data){
												if(data && data.rows.length>0){
													jQuery("#tenancy_list").setGridHeight(data.rows.length * 22 + 18);
												}else{
													jQuery("#tenancy_list").setGridHeight(0);
												}
											},
											shrinkToFit:false,
										   	rownumbers:true,
										    height: 'auto',
                                            autowidth: true,
                                            rowNum:0,
                                            multiselect: true,
                                            caption: '出租资产列表',
                                            ondblClickRow:function(gr){
												view(gr);
											},
											viewrecords:true,
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											},
											gridComplete:function(){
												compute();
											}
			                              });
							              jQuery("#tenancy_list").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#tenancy_list").setGridWidth($("#table").width());
									       });
                             </script>
<script type="text/javascript">
                                        jQuery("#change_list").jqGrid({       
                                            url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?headId=${headId}",
											datatype: "json",
											mtype:"POST",    
                                            colNames: ['id','资产编号', '资产名称','资产类型', '预估租赁起始日期', '预估租赁到期日期','资产承租（承办）人','变更日期'],
                                            colModel: [
                                            	{name:'id',index:'id',editable:true,hidden:true},
												{name:'zcbh',index:'zcbh',editable:true},
										   		{name:'zcmc',index:'zcmc',editable:true},
										   		{name:'CZclx',index:'CZclx',editable:true},
										   		{name:'zlqsrq',index:'zlqsrq',editable:true},
												{name:'zldqrq',index:'zldqrq',editable:true},
										   		{name:'czr',index:'czr',editable:true},
										   		{name:'bgrq',index:'bgrq', editable:true}
										   	],
										   	rownumbers:true,
										    height: 'auto',
										    rowNum:0,
                                            autowidth: true,
                                            multiselect: true,
                                            caption: '变更资产列表',
                                            ondblClickRow:function(gr){
												view(gr);
											},
											viewrecords:true,
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											},
											gridComplete:function(){
												compute();
											}
			                              });
							              jQuery("#change_list").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#change_list").setGridWidth($("#table").width());
									       });
									     $("#biangeng").css("display","none");  
                             </script>
<script type="text/javascript">
                                        jQuery("#cancel_list").jqGrid({       
                                            url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?headId=${headId}",
											datatype: "json",
											mtype:"POST",    
                                            colNames: ['id','资产编号', '资产名称','资产类型', '合同起始日期', '合同到期日期','承租人','退租日期','退租办理说明'],
                                            colModel: [
                                            	{name:'id',index:'id',editable:true,hidden:true},
												{name:'zcbh',index:'zcbh',editable:true,width:100},
										   		{name:'zcmc',index:'zcmc',editable:true,width:100},
										   		{name:'CZclx',index:'CZclx',editable:true,width:100},
										   		{name:'htqsrq',index:'htqsrq',editable:true,width:100},
												{name:'htdqrq',index:'htdqrq',editable:true,width:100},
										   		{name:'czr',index:'czr',editable:true,width:100},
										   		{name:'tzrq',index:'tzrq',editable:true,width:100},
										   		{name:'tzblsm',index:'tzblsm',editable:true,width:100}
										   	],
										   	loadComplete:function(data){
												if(data && data.rows.length>0){
													jQuery("#cancel_list").setGridHeight(data.rows.length * 22 + 18);
												}else{
													jQuery("#cancel_list").setGridHeight(0);
												}
											},
											shrinkToFit:false,
										   	rownumbers:true,
										    height: 'auto',
										    rowNum:0,
                                            autowidth: true,
                                            multiselect: true,
                                            caption: '退租资产列表',
                                            ondblClickRow:function(gr){
												view(gr);
											},
											viewrecords:true,
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											},
											gridComplete:function(){
												compute();
											}
			                              });
							              jQuery("#cancel_list").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#cancel_list").setGridWidth($("#table").width());
									       });
									        $("#tuizu").css("display","none"); 
                             </script>
