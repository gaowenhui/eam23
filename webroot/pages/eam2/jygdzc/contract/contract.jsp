<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String headId = (String)request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/jygdzc/contract/contract.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->

<!-- ==========================工作流属性初始化=========================================== -->
<%@ include	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
<head>
<%
String userName = (String) request.getAttribute("userName");
%>
        <title>合同管理</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<base href="<%=basePath%>" />
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myForm";
	actionSpaceName = "htqsWorkflow";
	actionPath = "htqsWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->

<base href="<%=basePath%>"/>
<SCRIPT language=JavaScript type=text/JavaScript>
 var isInit=false;
      $(document).ready(function(){	
      window.parent.clearPanelTool();
      if(isInit)return;
      isInit = true;	
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
				jQuery("#blyj_reason_list").setGridWidth($("#table").width());
				jQuery("#file_list").setGridWidth($("#table").width());
				jQuery("#purchase_list").setGridWidth($("#table").width());
				jQuery("#purchase_list_change").setGridWidth($("#table").width());
				jQuery("#purchase_list_end").setGridWidth($("#table").width());
			    $(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#table").width());
					jQuery("#file_list").setGridWidth($("#table").width());
					jQuery("#purchase_list").setGridWidth($("#table").width());
					jQuery("#purchase_list_change").setGridWidth($("#table").width());
					jQuery("#purchase_list_end").setGridWidth($("#table").width());
		       });
		       //生成按扭
			  <e:pc id="scbh">
				var headBHGen = document.getElementById("bianhao").value;
				if(headBHGen == null || headBHGen.length == 0){
					var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
					window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
				}
			   </e:pc>
		       //办结按钮
				<e:pc id="banjie">
					var buttonStr_banjie = '[{"buttonHandler":"mainWindow.liuchengbanjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
					window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
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
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="purchase_list">
				$("#gview_purchase_list> .ui-jqgrid-titlebar").append("\
				    <a href='#' id='select_card' target='blank' class='easyui-menubutton' iconCls='icon-add'>合同类型</a>\
					<a href='#' id='delete_card'  class='easyui-linkbutton' iconCls='icon-remove'>删除</a>\
		            <a href='#' id='update_card'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>修改</a>\
				");
				</e:pc>
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="purchase_list_change">
						$("#gview_purchase_list_change> .ui-jqgrid-titlebar").append("\
							<a href='#' id='add_card1' target='blank' class='easyui-linkbutton' iconCls='icon-add'>增加</a>\
							<a href='#' id='delete_card1'  class='easyui-linkbutton' iconCls='icon-remove'>删除</a>\
				            <a href='#' id='update_card1'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' style='margin-right:20px'>修改</a>\
						");
				</e:pc>
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="purchase_list_end">
						$("#gview_purchase_list_end> .ui-jqgrid-titlebar").append("\
							<a href='#' id='add_card2' target='blank' class='easyui-linkbutton' iconCls='icon-add'>增加</a>\
							<a href='#' id='batch2' target='blank' class='easyui-linkbutton' iconCls='icon-no'>终止</a>\
							<a href='#' id='delete_card2'  class='easyui-linkbutton' iconCls='icon-remove' style='margin-right:20px'>删除</a>\
						");
				</e:pc>
				$('#add_card,#delete_card,#update_card').linkbutton({
	                    duration: 9999999999,
						plain:true
			    });
			    $('#select_card').menubutton({
	                    duration: 9999999999,
						plain:true,
						menu:"#mm1"
			    });
				$("#delete_card").click(function(){
					var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要删除的记录!");
					}else {	
						var htlx = jQuery("#purchase_list").getCell(gr,'htlx');
						if(confirm("确认删除？")){
							var delblyjurl ="<%=request.getContextPath()%>/htqs/ContractManageBody_deleteBody.do";
							$.post(delblyjurl,{htId:"" + gr + "",htlx:"" + htlx + ""},function(){
								reloadGrid();
							});
						}
					}
					return false;
				});
				$("#add_card").click(function(){
					var url = '<%=request.getContextPath()%>/htqs/ContractManageBody_newBody.do?sheettype=contractInfo&purchaseParam=purchase_list';
					var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
					 window.open(url,'',g_);
					 //window.open(url);
					return false;
				});
				$("#update_card").click(function(){
					var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
					if (gr.length < 0){
						alert("请选择要修改的数据!");
					}else if(gr.length==1){	
						var htlx = jQuery("#purchase_list").getCell(gr,'htlx');
						var url = '<%=basePath%>htqs/ContractManageBody_modifyBody.do?headId=${headId}&htlx='+htlx+'&htId='+gr;
						var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
						window.open(url,'',g_);
					}else{
						alert("只能修改一条数据！");
					}
					return false;
				});
						$('#add_card1,#delete_card1,#update_card1').linkbutton({
			                    duration: 9999999999,
								plain:true
					    });
					    $('#select_card1').menubutton({
			                    duration: 9999999999,
								plain:true,
								menu:"#mm1"
					    });
						$("#delete_card1").click(function(){
							var gr = jQuery("#purchase_list_change").jqGrid('getGridParam','selarrrow');
							 var htlx = jQuery("#purchase_list_end").getCell(gr,'htlx');
								if (gr.length == 0){
									alert("请选择要删除的记录!");
								}else {	
										if(confirm("确认删除？")){
											var delblyjurl ="<%=request.getContextPath()%>/htqs/ContractManageBody_deleteBody.do";
											$.post(delblyjurl,{htId:"" + gr + "",htlx:"" + htlx + ""},function(){
												reloadGrid();
											});
										}
								}
								return false;
						});
						
						$("#add_card1").click(function(){ 
//变动修改
							var url = '<%=request.getContextPath()%>/htqs/ContractQuery_init.do?sheettype=contract&returnValue=true&purchaseParam=purchase_list_change';
							var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
					 		window.open(url,'',g_);
							return false;
						});
						$("#update_card1").click(function(){
							var gr = jQuery("#purchase_list_change").jqGrid('getGridParam','selarrrow');
							if (gr.length < 0){
								alert("请选择要修改的数据!");
							}else if(gr.length==1){	
								var htlx = jQuery("#purchase_list").getCell(gr,'htlx');
								var url = '<%=request.getContextPath()%>/htqs/ContractManageBody_intoBody.do?headId=${headId}&sheettype=changeInfo&htId='+gr;
								var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
					 			window.open(url,'',g_);
							}else{
								alert("只能修改一条数据！");
							}
							return false;
						});
						$('#add_card2,#batch2,#delete_card2').linkbutton({
			                    duration: 9999999999,
								plain:true
					    });
					    $('#select_card2').menubutton({
			                    duration: 9999999999,
								plain:true,
								menu:"#mm1"
					    });
						$("#delete_card2").click(function(){
							var gr = jQuery("#purchase_list_end").jqGrid('getGridParam','selarrrow');
							 var htlx = jQuery("#purchase_list_end").getCell(gr,'htlx');
								if (gr.length == 0){
									alert("请选择要删除的记录!");
								}else {	
										if(confirm("确认删除？")){
											var delblyjurl ="<%=request.getContextPath()%>/htqs/ContractManageBody_deleteBody.do";
											$.post(delblyjurl,{htId:"" + gr + "",htlx:"" + htlx + ""},function(){
												reloadGrid();
											});
										}
								}
								return false;
						});
						
						$("#add_card2").click(function(){
							var url = '<%=request.getContextPath()%>/htqs/ContractQuery_init.do?sheettype=contract&returnValue=true&purchaseParam=purchase_list_end';
							 var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
					 		window.open(url,'',g_);
							 return false;
						});
						$("#batch2").click(function(){
							var gr = jQuery("#purchase_list_end").jqGrid('getGridParam','selarrrow');
							 if (gr.length == 0){
								alert("请选择要终止的合同!");
							}else{	
								var url = '<%=request.getContextPath()%>/htqs/ContractManageBody_newBody.do?sheettype=zhongzhi&htId='+gr+"&operate=zhongzhi";
							     var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
					 			window.open(url,'',g_);
					        }
					        return false;
						});
			});
	function getIndex(){
		var index=document.getElementById("jwlx").selectedIndex;
		var chooseData = document.getElementById('chooseData').value;
		var dates = 0;
		if(chooseData=="0"){
			dates = jQuery("#purchase_list").getDataIDs();
		}else if(chooseData=='1'){
			dates = jQuery("#purchase_list_change").getDataIDs();
		}else{
			dates = jQuery("#purchase_list_end").getDataIDs();
		}
		if(dates.length>0){
			alert("已添加数据，不能变更业务类型!");
			document.getElementById("jwlx").value = chooseData;
			return false;
		}
		if(index==0){
			document.getElementById("div1").style.display="block";
			document.getElementById("div2").style.display="none";
			document.getElementById("div3").style.display="none";
		}else if(index==1){
			document.getElementById("div1").style.display="none";
			document.getElementById("div2").style.display="block";
			document.getElementById("div3").style.display="none";
		}else if(index==2){
			document.getElementById("div1").style.display="none";
			document.getElementById("div2").style.display="none";
			document.getElementById("div3").style.display="block";
		}
	}
	function changeNgbmmc(){
		var dept = document.getElementById("ngbm");
   	 	var i =document.getElementById("ngbm").selectedIndex;
   	 	document.getElementById("ngbmmc").value =dept.options[i].text;
	}
	function clickIndex(){
		var chooseData = document.getElementById('jwlx').value;
		document.getElementById('chooseData').value = chooseData;
	}
		function setValue(inde){
			var headId=document.getElementById("headId").value;
			var url = "";
			var sheettype ="";
			 if(inde==2){
			 	sheettype ="zulin";
			 }else if(inde==1){
				sheettype ="weiguan";
			 }else if(inde==3){
			 	sheettype ="chexian";	
			 }else{
			 	sheettype ="feichexian";
			 }
			 url = '<%=request.getContextPath()%>/htqs/ContractManageBody_newBody.do?sheettype='+sheettype+'&headId='+headId+'&operate=isNewHt';
			 var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
			 window.open(url,'',g_);
			 //window.open(url);
		}
		//用来做变动 终止的时候用的
		function addValue1(htIds){
		   var headId=document.getElementById("headId").value;
		    var sheettype=document.getElementById("sheettype").value;  
		    var jwlx=document.getElementById("jwlx").value;
		    var delblyjurl ="<%=request.getContextPath()%>/htqs/ContractManageBody_saveBody.do";
			$.post(delblyjurl,{sheettype:""+sheettype+"",htIds:""+htIds+"",headId:"" + headId + "",jwlx:"" + jwlx + ""},function(){
				reloadGrid();
			});
		}
		  function addValue(gr){ 
		 // alert(gr);
		    var delblyjurl ="<%=request.getContextPath()%>/htqs/ContractManageBody_saveBody.do";
		    var headId=document.getElementById("headId").value;  
		    var sheettype=document.getElementById("sheettype").value;
		    var bussiness=document.getElementById("bussiness").value;
		  //  temp.innerHTML=delblyjurl+"///"+headId+"///"+sheettype+"///"+sheettype+"///"+bussiness;
			$.post(delblyjurl,{sheettype:""+sheettype+"",htId:"" + gr + "",headId:"" + headId + "",bussiness:"" + bussiness + ""}, function(data){
			  	reloadGrid();
			});
			//document.getElementById("jwlx").disabled="true";
		}
		function reloadGrid(){
			$("#purchase_list").trigger("reloadGrid");
			$("#purchase_list_change").trigger("reloadGrid");
			$("#purchase_list_end").trigger("reloadGrid");
		}
		function lookContract(gr){
		 var jwlx = document.getElementById('jwlx').value;
			if(jwlx=='0'){
				 var htlx = jQuery("#purchase_list").getCell(''+ gr,'htlx');
				 if("1"==htlx||"2"==htlx){
				 	 window.open('<%=basePath%>htqs/ContractManageBody_viewBody.do?sheettype=changeInfo&headId=${headId}&htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				 }else if("3"==htlx||"4"==htlx){
				 	 window.open('<%=basePath%>htqs/ContractManageBody_modifyBody.do?sheettype=biandong&headId=${headId}&view=disabled&headId=${headId}&operate=change&htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				 }
			}else if(jwlx=='1'){
				 var htlx = jQuery("#purchase_list_change").getCell(''+ gr,'htlx');
				  window.open('<%=basePath%>htqs/ContractManageBody_viewBody.do?sheettype=changeInfo&headId=${headId}&htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}else if(jwlx=='2'){
				 var htlx = jQuery("#purchase_list_end").getCell(''+ gr,'htlx');
				  window.open('<%=basePath%>htqs/ContractManageBody_viewBody.do?sheettype=changeInfo&headId=${headId}&htId='+gr+'&htlx='+htlx,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		 
		}
		$(function (){
			var jwlx = document.getElementById('jwlx').value;
			if(jwlx=='0'){
				document.getElementById("div1").style.display="block";
				document.getElementById("div2").style.display="none";
				document.getElementById("div3").style.display="none";
			}else if(jwlx=='1'){
				document.getElementById("div1").style.display="none";
				document.getElementById("div2").style.display="block";
				document.getElementById("div3").style.display="none";
			}else if(jwlx=='2'){
				document.getElementById("div1").style.display="none";
				document.getElementById("div2").style.display="none";
				document.getElementById("div3").style.display="block";
			}
		});
</SCRIPT>
    <!-- 校验 -->
	<script type="text/javascript">
     function checkEAMFormJSMethod(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		    var lxdh = document.getElementById("lxdh");
			if(lxdh.value == null || lxdh.value.length == 0){
				alert("联系电话不能为空！");
				lxdh.focus();
		      return false;
		    }
		   
		  <e:pc id="scbh">
		  //var bianhao = document.getElementById("bianhao");
			//if(bianhao.value == null || bianhao.value.length == 0){
				//alert("编号不能为空！");
				//bianhao.focus();
		      //return false;
		   // }
		    </e:pc>
		  var idArray = $("#purchase_list").getDataIDs();
	    if(idArray == null||idArray.length == 0){
	       alert("请至少添加一合同");
	        return false;
	    }	
	    
	    var idArray = $("#purchase_list").getDataIDs();
	   if(idArray == null||idArray.length == 0){
	      alert("请至少添加一条合同");
	       return false;
	   }		
		    return true;
		}
		 function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
		}
			//生成编号
		function createBianhao(){
			var headId=$("#headId").val();
			$.post("<%=basePath%>htqs/ContractManageHead_createNum.do",{
				"headId":headId,
				"code":"htwh"
			},function(data){
				document.getElementById("bianhao").value = data;
				 window.parent.removeObj("#shengchenButton");
			});
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
		function liuchengbanjie(){
		    var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
			var headId = document.getElementById('headId').value; 
			var url = "<%=request.getContextPath()%>/htqs/ContractManageHead_banjie.do";
			$.post(url,{headId:"" + headId + ""}, function(data){
				if(data!=""&&data!=null)
				alert(data);
				if(data == "办结成功！"){
					document.myForm.action = document.getElementById("endUrl").value;
					document.myForm.url.value = document.getElementById("endViewUrl").value;
					document.myForm.sheetId.value = document.getElementById("bianhao").value;
					document.myForm.outCome.value = "流程办结";
					document.myForm.submit();
					return;
				}
			});
		}
		// 
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden name="chooseData"/>
<s:form action="htqs/ContractManageBody_saveHead.do" method="post" id ="myForm" name="myForm">
<input type="hidden"  name="headId" id="headId" value="${headId}" />
<input type="hidden"  name="head.id" value="${headId}" />
<input type="hidden" name="sheettype" value="${sheettype}" />
<s:hidden  name="head.sheettype" value="%{#request.sheettype}" />
<s:hidden  name="head.zhuangtai" />
<input type="hidden" name="head.lcId" value="合同维护" />
<input type="hidden" name="bussiness" id="bussiness" value="end"/>
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
			String urlHeader = request.getContextPath() + "/" + actionSpaceName
			+ "/" + actionPath + "_";
%>
<!-- 工作流表单提交URL设置 -->
<!--div id="temp" ></div-->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/htqs/ContractManageHead_saveHead.do" />
<input type="hidden" id="abandonUrl" value="<%=urlHeader + abandonMethod + ".do"%>" />
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader + endMethod + ".do"%>" />
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader + participationMethod + ".do"%>" />
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/htqs/ContractManageHead_saveHead.do" />
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/htqs/ContractManageHead_saveHead.do" />
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/htqs/ContractManageHead_saveHead.do" />
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do" />
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="htqs/ContractManageHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=${headId}"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value='head.biaoti' />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader + "getCirculationParticipationList.do"%>"/>


<!-- =========================================================================== -->
      <br/>
      <div align="center">
        <span class="STYLE7 STYLE1">中国建银投资有限责任公司合同维护处理单</span>
      </div>
      <br/>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
	  <table width="100%" id="table" border="0" cellpadding="2" cellspacing="0" align="center">
	  <hr color="#6600CC" align="center" width="100%" />
				<tr>
					<td class="td_zxy01">
						<font color="red">*
						</font>标 题：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.biaoti" id="biaoti" cssClass="input2"
							value="%{#request.head.biaoti}" size="20" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01" width="120">
						编号：
					</td>
					<td class="td_form02">
						<s:textfield name="head.bianhao" id="bianhao" cssClass="input"
							readonly="true" />
					</td>
					<td class="td_zxy01">
						急缓程度：
					</td>
					<td class="td_zxy02">
						<r:select name="head.jhcd" id="jhcd"
							list="#{'0':'一般','1':'急','2':'特急'}"></r:select>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01" width="120">
						拟稿人：
					</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngr"   value="%{#request.head.ngr}" />
						<s:textfield name="head.ngrmc" id="ngr" cssClass="input"
							readonly="true" />
					</td>
					<td class="td_zxy01" width="120">
						<font color="red">*
						</font>联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.lxdh" id="lxdh" cssClass="input"
							onblur="checkPhone(this);" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						业务类型：
					</td>
					<td class="td_zxy02">
						<r:select list="#{'0':'新增','1':'变动','2':'终止'}" id="jwlx"
							name="head.ywlx" onclick="clickIndex();" onchange="getIndex();" />
					</td>
					<td class="td_zxy01">
						拟稿部门：
					</td>
					<td class="td_zxy02">
						<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    				<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
					</td>
				</tr>
			</table>
			<table>
			  <tr>
			  <td align="right">
             <div id="div1" style="display:block">
			 <table id="purchase_list"></table>
			 </div>
			  <div id="div2"  style="display:none">
			  <table id="purchase_list_change"></table>
			  </div>
			  <div id="div3" style="display:none" >
			  <table id="purchase_list_end"></table>
			  </div>
			  </td>
			  </tr>
			 </table> 
			<%@ include file="/inc/according.inc"%>  
       <e:opinion id="test" width="100%">
			<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"
				name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	   <e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
    </e:opinion>
	<%@ include file="/inc/file.inc"%>
	<%@ include file="/inc/listMessage.inc"%>
</s:form>
 <div id="addToParent" style="display: none;">
        <div id="mm1" style="width:150px;">
            <div onClick="setValue(2);" iconCls="icon-redo">租赁合同</div>
            <div onClick="setValue(1);" iconCls="icon-redo">委管合同</div>
            <div onClick="setValue(3)" iconCls="icon-redo">车险合同</div>
            <div onClick="setValue(4)" iconCls="icon-redo">非车险合同</div>
            <div class="menu-sep"></div>
        </div>
      </div>
</body>
</html>
		<script type="text/javascript">
	                                    jQuery("#purchase_list").jqGrid({       
	                                        url:"<%=basePath%>htqs/ContractManageBody_query4View.do?headId=${headId}",
								datatype: "json",
								mtype: "POST",
	                                        colNames: ['id','合同编号','资产编号', '资产名称','htlx','合同类型','合同起始日期','合同终止日期'],
	                                        colModel: [
	                                        { name: 'id',index: 'id',align: "center",hidden:true},
								{ name: 'htbh',index: 'htbh',align: "center"},
	                                        { name: 'zcbh',index: 'zcbh',align: "center"},
	                                        { name: 'zcmc',index: 'zcmc',align: "center"},
	                                        { name: 'htlx',index: 'htlx',align: "center",hidden:true},
	                                        { name: 'htlxName',index: 'htlxName',align: "center"},
	                                        { name: 'htksrq',index: 'htksrq',align: "center"},   
	                                        { name: 'htzzrq',index: 'htzzrq',align: "center"}    
	                                        ],
							    rownumbers:true,
							   	height: 'auto',
	                                        autowidth: true,
	                                        multiselect: true,
	                                        caption: '增加合同列表',
	                                        ondblClickRow:function(gr){
									lookContract(gr);
								},
								viewrecords:true,
								jsonReader : {
									records: "records",
									repeatitems: false,
									id: "0"
								}
							});
                                     jQuery("#purchase_list_change").jqGrid({       
                                         url:"<%=basePath%>htqs/ContractManageBody_query4View.do?headId=${headId}",
								datatype: "json",
                                         colNames: ['id','合同编号','资产编号', '资产名称','htlx','合同类型', '合同起始日期', '合同到期日期'],
                                         colModel: [
								{ name: 'id',index: 'id',align: "center",hidden:true},
								{ name: 'htbh',index: 'htbh',align: "center"},
                                         { name: 'zcbh',index: 'zcbh',align: "center"},
                                         { name: 'zcmc',index: 'zcmc',align: "center"},
                                         { name: 'htlx',index: 'htlx',align: "center",hidden:true},
                                         { name: 'htlxName',index: 'htlxName',align: "center"},
                                         { name: 'htksrq',index: 'htksrq',align: "center"},   
                                         { name: 'htdqrq',index: 'htzzrq',align: "center"}
                                          ],
                                     	rownumbers:true,
							   	height: 'auto',
                                         autowidth: true,
                                         multiselect: true,
                                         caption: '变动合同列表',
                                         ondblClickRow:function(gr){
									lookContract(gr);
								},
								viewrecords:true,
								jsonReader : {
									records: "records",
									repeatitems: false,
									id: "0"
								}
							});
     
			
			               jQuery("#purchase_list_end").jqGrid({       
			                url:"<%=basePath%>htqs/ContractManageBody_query4View.do?headId=${headId}",
						    datatype: "json",
			               colNames: ['id','合同编号','资产编号', '资产名称','htlx','合同类型','合同起始日期','原合同终止日期', '合同终止日期'],
			               colModel: [
						   { name: 'id',index: 'id',align: "center",hidden:true},
						   { name: 'htbh',index: 'htbh',align: "center"},
			               { name: 'zcbh',index: 'zcbh',align: "center"},
			               { name: 'zcmc',index: 'zcmc',align: "center"},
			               { name: 'htlx',index: 'htlx',align: "center",hidden:true},
			               { name: 'htlxName',index: 'htlxName',align: "center"},
			               { name: 'htksrq',index: 'htksrq',align: "center"},   
			               { name: 'htdqrq',index: 'yhtzzrq',align: "center"},
			               { name: 'htzzrq',index: 'htzzrq',align: "center"}
			               ],
						   rownumbers:true,
						   height: 'auto',
			               autowidth: true,
			               multiselect: true,
			               caption: '终止合同列表',
			               ondblClickRow:function(gr){
						       lookContract(gr);
						   },
						   viewrecords:true,
						   jsonReader : {
							records: "records",
							repeatitems: false,
							id: "0"
						}
			             });
            </script>
							 
