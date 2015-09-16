<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
   String headId = (String)request.getAttribute("headId");
   String userTid = (String) request.getAttribute("userTid");
   Date date = new Date();
   String ywlx = "null".equals((String)request.getAttribute("ywlx"))?"":(String)request.getAttribute("ywlx");
   String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
   status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
   boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<%
  //boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
 %>
<!-- ==========================页面权限控制=========================================== -->
<r:controlfile file="/pages/eam2/jygdzc/tenancy/tenancy.ctl.xml"></r:controlfile>	
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>经营租赁</title>
		<meta http-equiv="pragma" content="no-cache"/>
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
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<script type="text/javascript">
	  var isInit=false;
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
      $(document).ready(function(){	
      window.parent.clearPanelTool();
      if(isInit)return;
      isInit = true;	
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
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
				
				
 //合成正文按钮
	<%
	    if(!inCounterSign){
	%>
	   //生成按扭
	 <e:pc id="scbh">
		var headBHGen = document.getElementById("bianhao").value;
		if(headBHGen == null || headBHGen.length == 0){
			var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
			window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
		}else{
		 <e:pc id="hczw">
		   <%
		    if(!status.equals("2")){
		   %>
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			<%
			   }
			%>
		</e:pc>
		}
	   </e:pc>
		
		//查看正文按钮
		<e:pc id="ckzw">
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		
		
		//在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="tenancy_list">
				 var buttonBlyjJSonString1 = '[{"buttonHandler":"add_tenancy","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete_tenancy","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"update_tenancy","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_tenancy_list> .ui-jqgrid-titlebar"),buttonBlyjJSonString1);
			    </e:pc>
			    //在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="change_list">
				 var buttonBlyjJSonString2 = '[{"buttonHandler":"add_change","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete_change","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"update_change","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_change_list> .ui-jqgrid-titlebar"),buttonBlyjJSonString2);
			    </e:pc>
			    //在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="cancel_list">
				 var buttonBlyjJSonString3 = '[{"buttonHandler":"add_cancel","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete_cancel","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"update_cancel","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_cancel_list> .ui-jqgrid-titlebar"),buttonBlyjJSonString3);
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
		
			//（处理）新建正文按钮
			<e:pc id="sczw">
				var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
			
			 <e:pc id="banjie">
				var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
				window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
			  </e:pc>
		
	<%
	   }else{
	%>
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	   <%}%>
		<%
			if(workflowVO.getStep().equals("end")){
			%>
				var buttonStr_hetong = '[{"buttonHandler":"mainWindow.addContract","buttonIcon":"icon-createFile","buttonText":"合同维护"}]';
				window.parent.prependButtonsFromChildren(buttonStr_hetong,"");
		<%
			}
		%>
	});
				function addContract(){
					if("0"=="<%=ywlx%>"){
						var url = 'htqs/ContractManageHead_tenancyTOcontract.do?ywlx=0&sheettype=contract&pdk=jyzc_contract&zlheadId=${headId}';
					}else if("1"=="<%=ywlx%>"){
						var url = 'htqs/ContractManageHead_tenancyTOcontract.do?ywlx=1&sheettype=contract&pdk=jyzc_contract&zlheadId=${headId}';
					}else if("2"=="<%=ywlx%>"){
						var url = 'htqs/ContractManageHead_tenancyTOcontract.do?ywlx=2&sheettype=contract&pdk=jyzc_contract&zlheadId=${headId}';
					}
					 url = encodeURIComponent(url);
					 url = basePathJs + 'index.do?urlPortal=' + url;
					 window.open(url,'','height=600, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					return false;
				};
				function delete_tenancy(){
					var gr = jQuery("#tenancy_list").jqGrid('getGridParam','selarrrow');
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
				var ywlx = document.getElementById("ywlx");
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyInfo&headId=${headId}&ywlx=rent','','height=500, width=1100, top=150, left=150, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					return false;
				};
				function update_tenancy(){
					var gr = jQuery("#tenancy_list").jqGrid('getGridParam','selarrrow');
					//alert(gr);
					 if (gr.length == 0){
						alert("请选择要修改的记录!");
					}else if(gr.length>1){
						alert("只能选中一条记录!");
					}else if(gr.length==1){	
						window.open('<%=basePath%>zltb/IntentionManageBody_modify.do?headId=${headId}&sheettype=tenancyInfo&handle=amend&ywlx=rent&zllsbId=' + gr ,'','height=500, width=1100, top=150, left=150, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					}
					return false;
				};
			    function add_change(){
				var ywlx = document.getElementById("ywlx");
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyInfo&headId=${headId}&ywlx=change','','height=500, width=1100, top=150, left=150, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
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
						alert("请选择要修改的记录!");
					}else if(gr.length>1){
						alert("只能选中一条记录!");
					}else if(gr.length==1&&gr!=""){	
						window.open('<%=basePath%>zltb/IntentionManageBody_modify.do?headId=${headId}&sheettype=tenancyInfo&handle=amend&ywlx=change&zllsbId=' + gr ,'','height=500, width=1100, top=150, left=150, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
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
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyInfo&headId=${headId}&ywlx=quit','','height=500, width=1100, top=150, left=150, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					return false;
				};
				function changeNgbmmc(){
					var dept = document.getElementById("ngbm");
		    	 	var i =document.getElementById("ngbm").selectedIndex;
		    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
				}
				function update_cancel(){
					var gr = jQuery("#cancel_list").jqGrid('getGridParam','selarrrow');
					//alert(gr);
					 if (gr.length == 0){
						alert("请选择要删除的记录!");
					}else if(gr.length>1){
						alert("只能选中一条记录!");
					}else if(gr.length==1){	
						window.open('<%=basePath%>zltb/IntentionManageBody_modify.do?headId=${headId}&handle=amend&sheettype=tenancyInfo&ywlx=quit&zllsbId=' + gr,'','height=500, width=1100, top=150, left=150, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					}
					return false;
				};
				function view(gr){
					var ywlx  =document.getElementById("ywlx").selectedIndex;
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
			$(function(){
				var ywlx  ="${ywlx}";
				if(ywlx == 0){
					chuzu.style.display="block";
					biangeng.style.display="none";
					tuizu.style.display="none";
				}else if(ywlx == 1){
					chuzu.style.display="none";
					biangeng.style.display="block";
					tuizu.style.display="none";
				}else if(ywlx == 2){
					chuzu.style.display="none";
					biangeng.style.display="none";
					tuizu.style.display="block";
				}
			})						
		function checkEAMFormJSMethod(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		    var chengsong = document.getElementById("chengsong");
			if(chengsong.value == null || chengsong.value.length == 0){
				alert("呈送不能为空！");
				chengsong.focus();
		        return false;
		    }
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
			<e:pc id="sczw">  
		 	if(isNew){
		    	alert("请先新建正文");
	    	 	return false;
		    }
			</e:pc>
			<e:pc id="hczw">
		  	if(!isMerge){
		    	alert("请先合成正文");
	    	 	return false;
		    }
		    </e:pc>
		    return true;
		}
		//流程办结
		function createBook4Card(){
		    var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
	     	<e:pc id="hczw">
		    if(!isMerge){
		    	alert("请先合成正文");
	    	 	return false;
		    }
		    </e:pc>
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
	//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		$.post("<%=basePath %>zltb/IntentionManageHead_createNum.do",{
			"headId":headId,
			"code":"jjzlyw"
		},function(data){
			document.getElementById("bianhao").value = data;
			window.parent.removeObj("#shengchenButton");
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		});
	}	
	 function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
	}	
	function clickIndex(){
		var chooseData = document.getElementById('ywlx').value;
		document.getElementById('chooseData').value = chooseData;
	}
	<!-- ====================正文======================================================== -->

	//（处理）新建正文
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "经营租赁业务正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
			isNew = false;
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"经营租赁业务正文"); 
		}
		
		//合成正文
		function hechengzhengwen(){
			if(isNew){
				alert("请先新建正文");
				 return false;
			}
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "经营租赁业务正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
			isMerge = true;
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
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
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
		function checkEAMFormTitle(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.trim().length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		     return true;
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="change();"> 
<%@ include file="/inc/word.inc"%>
<s:form action="zltb/IntentionManageHead_save.do" id="myform" name="myform"
	method="post">
	<s:hidden name="headId" id="headId" value="%{#request.headId}" />
	<s:hidden name="sheettype" value="%{#request.sheettype}" />
	<s:hidden name="head.id" value="%{#request.headId}" />
	<s:hidden  name="head.sheettype" value="%{#request.sheettype}" />
	<s:hidden name="head.lcId" id="lcId"  value="租赁业务" />
	<s:hidden name="chooseData" id="chooseData" />
	<s:set name="biaodanid" value="head.id" />
	<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath() + "/" + actionSpaceName
			+ "/" + actionPath + "_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
<input type="hidden" id="abandonUrl" value="<%=urlHeader + abandonMethod + ".do"%>" />
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader + endMethod + ".do"%>" />
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader + participationMethod + ".do"%>" />
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zltb/IntentionManageHead_save.do" />
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do" />
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zltb/IntentionManageHead_modify.do"/>
<input type="hidden" name="circulationParam" value="headId=${headId}"/>
<input type="hidden" name="circulationTitle" value="[传阅]<s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>

<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" />会签办理单"/>
<input type="hidden" name="counterSignUrl" value="zltb/IntentionManageHead_modify"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- =========================================================================== -->
			<br />
			<div align="center">
				<span class="STYLE7 STYLE1">中国建银投资有限责任公司经营租赁业务<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
			</div>
			<br/>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
			<hr color="#6600CC" align="center" width="100%" />
			<table class="newtable" id="table" width="100%" border="0"
				align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
				<font color="red">*</font>标 题：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.biaoti" id="biaoti" cssClass="input2"
							value='%{#request.head.biaoti}' />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="red">*</font>呈送：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.chengsong" id="chengsong"
							cssClass="input2" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
				   	 	编号：
					</td>
					<td class="td_zxy02"><s:textfield name="head.bianhao"  id="bianhao" cssClass="input" readonly="true"/>
			  </td>
					<td class="td_zxy01">
						急缓程度：
					</td>
					<td class="td_zxy02">
						<r:select list="#{'0':'一般','1':'急','2':'特急'}" name="head.jhcd" id="jhcd"
							value="%{#request.head.jhcd}" />
					</td>
				</tr>
					<tr>
					<td class="td_zxy01">
						拟稿人：
					</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngr"   value="%{#request.head.ngr}" />
						<r:textfield name="head.ngrmc" id="ngrmc" cssClass="input"
							value="%{#request.head.ngrmc}" readonly="true"/>
					</td>
					<td class="td_zxy01">
					<font color="red">*</font>联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.lxdh" id="lxdh" cssClass="input" onblur="checkPhone(this);"
							value="%{#request.head.lxdh}" />
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
						<r:select list="#{'0':'出租','1':'变更','2':'退租'}" name="head.ywlx" id="ywlx" value="%{#request.head.ywlx}" onclick="clickIndex();"  onchange="change()"  />
					</td>
					<td class="td_zxy01">
						租赁总金额（元）：
					</td>
					<td class="td_zxy02">
						<r:textfield name="" cssClass="input" id="zjg" />
					</td>
				</tr>
				
		    <tr>
			<td class="td_zxy01">会签部门：</td>
		    <td class="td_form02" colspan="3" >
		    <r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"  cssClass="input2"/>
		       <s:hidden  name="head.hqbmid" id="hqbmids"/>
		          <e:pc id="xzhq">
		     	  <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType();" width="21" height="20" align="absmiddle"/>
		     	  </e:pc>
		     	   <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>
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
				<e:opinionPart id="OPERATION_GROUP"
					biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value=""
					text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见：">
					</e:opinionPart>
			<!-- ==========================工作流信息项======================================= -->
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
			<!-- =========================================================================== -->
				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"
					name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
			</e:opinion>
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>   
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_huiqian_end.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
		</s:form>
<SCRIPT language=JavaScript type=text/JavaScript>
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
	function change(){
	//alert();
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
	 		var x = document.getElementById("ywlx");
	 		if(x.selectedIndex == 0){
				$("#tenancy_list").setGridParam({
					postData:{headId: "${headId}"},
				    url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?headId=${headId}"
				}).trigger("reloadGrid");
			}else if(x.selectedIndex == 1){
				$("#change_list").setGridParam({
					postData:{headId: "${headId}"},
					url:"<%=basePath%>zltb/IntentionManageBody_query4View.do"
				}).trigger("reloadGrid");
			}else if(x.selectedIndex == 2){
				$("#cancel_list").setGridParam({
					postData:{headId: "${headId}"},
					url:"<%=basePath%>zltb/IntentionManageBody_query4View.do"
				}).trigger("reloadGrid");
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
										   		{name:'zlqsrq',index:'zlqsrq',editable:true,width:100},
												{name:'zldqrq',index:'zldqrq',editable:true,width:100},
										   		{name:'czr',index:'czr',editable:true,width:100},
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
										    rowNum:0,
										   	rownumbers:true,
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
                                            gridComplete:function(){
												$("#allNum").val($('#tenancy_list').jqGrid('getGridParam','records'));
											},
                                        	ondblClickRow:function(gr){
												view(gr);
											},
                                            caption: '出租资产列表',
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
                             </script>
<script type="text/javascript">
                                        jQuery("#change_list").jqGrid({       
                                            url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?headId=${headId}",
											datatype: "json",
											mtype:"POST",    
                                            colNames: ['id','资产编号', '资产名称','资产类型', '租赁起始日期', '租赁到期日期','承租人'],
                                            colModel: [
                                            	{name:'id',index:'id',editable:true,hidden:true},
												{name:'zcbh',index:'zcbh',editable:true},
										   		{name:'zcmc',index:'zcmc',editable:true},
										   		{name:'CZclx',index:'CZclx',editable:true},
										   		{name:'zlqsrq',index:'zlqsrq',editable:true},
												{name:'zldqrq',index:'zldqrq',editable:true},
										   		{name:'czr',index:'czr',editable:true}
										   	],
								   		    rowNum:0,
										   	rownumbers:true,
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
                                            gridComplete:function(){
												$("#allNum").val($('#change_list').jqGrid('getGridParam','records'));
											},
                                       		ondblClickRow:function(gr){
												view(gr);
											},
                                            caption: '变更资产列表',
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
									     $("#biangeng").css("display","none");  
                             </script>
<script type="text/javascript">
                                        jQuery("#cancel_list").jqGrid({       
                                            url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?headId=${headId}",
											datatype: "json",
											mtype:"POST",    
                                            colNames: ['id','资产编号', '资产名称','资产类型','合同起始日期', '合同到期日期','承租人','退租日期','退租办理说明'],
                                            colModel: [
                                            	{name:'id',index:'id',editable:true,hidden:true},
												{name:'zcbh',index:'zcbh',editable:true,width:100},
										   		{name:'zcmc',index:'zcmc',editable:true,width:100},
										   		{name:'CZclx',index:'CZclx',editable:true,width:100},
										   		{name:'htqsrq',index:'htqsrq',editable:true,width:100},
												{name:'htdqrq',index:'htdqrq',editable:true,width:100},
										   		{name:'htczr',index:'htczr',editable:true,width:100},
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
                                            autowidth: true,
                                            multiselect: true,
                                            gridComplete:function(){
												$("#allNum").val($('#cancel_list').jqGrid('getGridParam','records'));
											},
                                            rowNum:0,
											ondblClickRow:function(gr){
												view(gr);
											},
                                            caption: '退租资产列表',
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
									        $("#tuizu").css("display","none"); 
                             </script>
