<%@ page language="java"
	import="java.util.*,com.tansun.rdp4j.common.util.*"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc"%>
<%
	String headId = (String) request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
	boolean view =false;
	view = "true".equals((String) request
			.getAttribute("view")) ? true : false;
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus
			.getStatus(headId);
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>

<!-- 会签属性 -->
<%
	if (workflowVO.taskName.equals("拟稿部门综合处理")) {
		counterSignBtnDisplay = true;
	}
%>
<r:controlfile file="/pages/eam2/jygdzc/assurance/assurance.ctl.xml"></r:controlfile>
<html>
	<head>
		<title>固产投保</title>
		<!-- 校验 -->
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "zltbWorkflow";
			actionPath = "zltbWorkflow";
		%>
		<%@ include
			file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
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
      	if("true"=="<%=view%>"){
			$("select,input,img,textarea").attr("disabled","disabled");
		}
		if(window.parent.clearPanelTool!=null)
		 window.parent.clearPanelTool();
      if(isInit)return;
      isInit = true;	
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
		jQuery("#blyj_reason_list").setGridWidth($("#table").width());
		jQuery("#file_list").setGridWidth($("#table").width());
		jQuery("#hkgl_list").setGridWidth($("#table").width());
		jQuery("#file_huiqianlist").setGridWidth($("#table").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
		$(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#table").width());
					jQuery("#file_list").setGridWidth($("#table").width());
					jQuery("#hkgl_list").setGridWidth($("#table").width());
					jQuery("#file_huiqianlist").setGridWidth($("#table").width());
					jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
			       });
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
		
		
			       //合成正文按钮
		<%
		    if(!inCounterSign){
		%>
		//查看正文按钮
		<e:pc id="ckzw">
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
			if(window.parent.prependButtonsFromChildren!=null)
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
			var headBHGen = document.getElementById("bianhao").value;
			if(headBHGen == null || headBHGen.length == 0){
			<e:pc id="scbh">
				var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				if(window.parent.prependButtonsFromChildren!=null)
				window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
			 </e:pc>
			}else{
			 <e:pc id="hczw">
			   <%
			    if(!status.equals("2")){
			   %>
				var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
				if(window.parent.prependButtonsFromChildren!=null)
				window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
				<%
				   }
				%>
			</e:pc>
			}
		<e:pc id="buttonView">  	
		if("true"!="<%=view%>"){  
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			var buttonFileJSonString = '[{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
			{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"},\
			{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
			{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		}
		</e:pc>
			var buttonchexianJSonString = '[{"buttonHandler":"add_chexian","buttonIcon":"icon-add","buttonText":"投保车辆"}\
			]';
			addButtons(jQuery("#chexian"),buttonchexianJSonString);
			var buttonfeichexianJSonString = '[{"buttonHandler":"add_feichexian","buttonIcon":"icon-add","buttonText":"投保资产"}\
			]';
			addButtons(jQuery("#feichexian"),buttonfeichexianJSonString);
		//（处理）新建正文按钮
		<e:pc id="sczw">  
			var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文"%>"}]';
			if(window.parent.prependButtonsFromChildren!=null)
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
	    <e:pc id="banjie">
		var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
			if(window.parent.appendButtonsFromChildren!=null)
		window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
        </e:pc>  	
			
			
			
		<%
		   }else{
		%>
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
			if(window.parent.prependButtonsFromChildren!=null)
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	      <%}%>
		$("#gctbksrq,#gctbjsrq").datebox({
			formatter:function(date){
			return formatDate(date);
			}
		});
	 });
	 
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
		$.post("<%=basePath%>zltb/IntentionManageHead_createNum.do",{
			"headId":headId,
			"code":"gctb"
		},function(data){
			document.getElementById("bianhao").value = data;
			if(window.parent.removeObj("#shengchenButton")!=null)
			window.parent.removeObj("#shengchenButton");
			var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
			if(window.parent.prependButtonsFromChildren!=null)
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
		});
	}	
	
	//（处理）新建正文
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "固产投保正文"); 
			//修改按钮名称为“处理正文”
			if(window.parent.setHtml("#xjzwButton .l-btn-text","处理正文")!=null)
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			if(window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile")!=null)
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
			isNew = false;
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"固产投保正文"); 
		}
		function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
	   	 	var i =document.getElementById("ngbm").selectedIndex;
	   	 	document.getElementById("ngbmmc").value =dept.options[i].text;
		}
		//合成正文
		function hechengzhengwen(){
			if(isNew){
		    	alert("请先新建正文");
	    	 	return false;
		    }
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
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "固产投保正文",'hechengHead()','hechengBottom()');
			if(window.parent.removeObj("#hczwButton")!=null)
			window.parent.removeObj("#hczwButton");
			if(window.parent.prependButtonsFromChildren!=null)
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
		function checkEAMFormTitle(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.trim().length == 0){
				alert("标题不能为空！");
				biaoti.focus();
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
		<%@ include file="/inc/word.inc"%>
		<s:form action="zltb/IntentionManageHead_save.do" id="myform"
			name="myform" method="post">
			<s:hidden name="headId" id="headId" value="%{#request.headId}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<s:hidden name="head.sheettype" value="%{#request.sheettype}" />
			<s:hidden name="head.id" value="%{#request.headId}" />
			<s:hidden name="head.lcId" id="lcId" value="固产投保" />
			<s:hidden name="tbId" id="tbId" value="%{#request.tbId}" />
			<s:set name="biaodanid" value="head.id" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<s:hidden name="deptid" value="11318" />
			<!-- ==========================表体隐藏域==================================== -->
			<s:hidden name="tbId" value="%{#request.tbId}" />
			<s:hidden name="jjzcGctbXxVO.cldId" value="%{#request.headId}" />
			<s:hidden name="jjzcGctbXxVO.id" value="%{#request.jjzcGctbXxVO.id}" />
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
			<!-- =========================================================================== -->
			<br />
			<div align="center">
				<span class="STYLE7 STYLE1">中国建银投资有限责任公司固产投保<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
			</div>
			<br />
			<!-- ==========================工作流信息项======================================= -->
			<%@ include
				file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
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
						<font color="red">*</font>呈 送：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.chengsong" id="chengsong"
							value='%{#request.head.chengsong}' cssClass="input2" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						编号：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.bianhao" id="bianhao" cssClass="input"
							readonly="true" value='%{#request.head.bianhao}' />
					</td>
					<td class="td_zxy01">
						急缓程度：
					</td>
					<td class="td_zxy02">
						<r:select list="#{'0':'一般','1':'急','2':'特急'}" id="jhcd"
							name="head.jhcd" value="%{#request.head.jhcd}" />
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
						<font color="red">*</font>联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.lxdh" id="lxdh" onblur="checkPhone(this)"
							cssClass="input" value="%{#request.head.lxdh}" />
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
						<%
							if (inCounterSign) {
						%><e:countersign
							biaodanId="%{#request.biaodanid}" />
						<%
							}
						%>
					</td>
				</tr>
			</table>
			<br>
			<table class="newtable" width="100%" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						保险公司名称：
					</td>
					<td class="td_zxy02">
						<r:textfield name="jjzcGctbXxVO.bxgsmc" id="bxgsmc" cssClass="input"
							value="%{#request.jjzcGctbXxVO.bxgsmc}" />
					</td>
					<td class="td_zxy01">
						<font color="green">投保总金额（元）：</font>
					</td>
					<td class="td_zxy02">
						<s:textfield name="jjzcGctbXxVO.tbzhj" id="tbzhj" disabled="true"
							cssClass="input" value="%{#request.jjzcGctbXxVO.tbzhj}" />
					</td>
				</tr>
			</table>
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">
					车险信息
				</div>
				<div id="chexian" class="panel-tool"></div>
			</div>
			<table class="newtable" width="100%" border="0" onclick="total();"
				align="center" cellpadding="0" cellspacing="0">
				<e:pc id="cx">
					<tr>
						<td class="td_zxy01">
							<font color="green">商业险保费（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.syxbf" onblur="checkFloat(this);"
								id="syxbf" cssClass="input" value="%{#request.jjzcGctbXxVO.syxbf}" />
						</td>
						<td class="td_zxy01">
							<font color="green">交强险保费（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.jqxbf" id="jqxbf"
								onblur="checkFloat(this);" cssClass="input"
								value="%{#request.jjzcGctbXxVO.jqxbf}" />
						</td>
					</tr>
					<tr>

						<td class="td_zxy01">
							<font color="green">车船税金额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.ccsje" id="ccsje"
								onblur="checkFloat(this);" cssClass="input"
								value="%{#request.jjzcGctbXxVO.ccsje}" />
						</td>
						<td class="td_zxy01">
							<font color="green">车险税费合计（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.sfhj" id="sfhj" cssClass="input"
								value="%{#request.jjzcGctbXxVO.sfhj}" readonly="true" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							<font color="green">车辆去年投保总额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.pjtbze" id="pjtbze"
								cssClass="input" value="%{#request.jjzcGctbXxVO.pjtbze}"
								 disabled="true" />
						</td>
						<td class="td_zxy01">
							<font color="green">车辆去年投保平均额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.clqntpje" id="clqntpje"
								cssClass="input" value="%{#request.jjzcGctbXxVO.clqntpje}"
								 disabled="true" />
						</td>
					</tr>
				</e:pc>
			</table>
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">
					非车险信息
				</div>
				<div id="feichexian" class="panel-tool"></div>
			</div>
			<table class="newtable" width="100%" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<e:pc id="fcx">
					<tr>
						<td class="td_zxy01">
							固产投保开始日期：
						</td>
						<td class="td_zxy02">
							<s:date name="%{#request.jjzcGctbXxVO.gctbksrq}" format="yyyy-MM-dd"
							var="draftDate11" />
							<s:textfield name="jjzcGctbXxVO.gctbksrq" id="gctbksrq"
								readonly="true" cssClass="input"
								value="%{#draftDate11}" />
						</td>
						<td class="td_zxy01">
							固产投保结束日期：
						</td>
						<td class="td_zxy02">
							<s:date name="%{#request.jjzcGctbXxVO.gctbjsrq}" format="yyyy-MM-dd"
							var="draftDate122" />
							<s:textfield name="jjzcGctbXxVO.gctbjsrq" id="gctbjsrq"
								readonly="true" cssClass="input"
								value="%{#draftDate122}" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
						  <font color="green">财产一切险投保资产总额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.ccyqxtbzcze" id="ccyqxtbzcze"
								cssClass="input" onblur="checkFloat(this)"
								value="%{#request.jjzcGctbXxVO.ccyqxtbzcze}" disabled="true" />
						</td>
						<td class="td_zxy01">
							财产一切险费率（‰）：
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.czyqxfl" id="czyqxfl"
								cssClass="input" onblur="checkThousands(this);"
								value="%{#request.jjzcGctbXxVO.czyqxfl}" />
						</td>
					</tr>
					<tr>

						<td class="td_zxy01">
							财产一切险折扣（‰）：
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.czyqxzk" id="czyqxzk"
								cssClass="input" onblur="checkPresent(this);"
								value="%{#request.jjzcGctbXxVO.czyqxzk}" />
						</td>
						<td class="td_zxy01">
							<font color="green">财产一切险保费（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.czyqxbf" id="czyqxbf"
								cssClass="input" onblur="checkFloat(this)"
								value="%{#request.jjzcGctbXxVO.czyqxbf}" disabled="true" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							<font color="green">机器损坏险投保资产总额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.jqshxtbzcze" id="jqshxtbzcze"
								cssClass="input" onblur="checkFloat(this)"
								value="%{#request.jjzcGctbXxVO.jqshxtbzcze}" disabled="true" />
						</td>
						<td class="td_zxy01">
							机器损坏险费率（‰）：
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.jqshxfl" id="jqshxfl"
								cssClass="input" onblur="checkThousands(this);"
								value="%{#request.jjzcGctbXxVO.jqshxfl}" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							机器损坏险折扣（‰）：
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.jqshxzk" id="jqshxzk"
								cssClass="input" onblur="checkPresent(this);"
								value="%{#request.jjzcGctbXxVO.jqshxzk}" />
						</td>
						<td class="td_zxy01">
							<font color="green">机器损坏险保费（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.jiqishxbf" id="jiqishxbf"
								cssClass="input" onblur="checkFloat(this)"
								value="%{#request.jjzcGctbXxVO.jiqishxbf}" disabled="true"/>
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							<font color="green">公共责任险保额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.ggzrxbe" id="ggzrxbe"
								cssClass="input" onblur="checkFloat(this)"
								value="%{#request.jjzcGctbXxVO.ggzrxbe}" />
						</td>
						<td class="td_zxy01">
							公共责任险折扣（‰）：
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.ggzrxbxfl" id="ggzrxbxfl"
								cssClass="input" onblur="checkPresent(this);"
								value="%{#request.jjzcGctbXxVO.ggzrxbxfl}" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							<font color="green">公共责任险保费（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.ggzrxbf" id="ggzrxbf"
								cssClass="input" onblur="checkFloat(this)"
								value="%{#request.jjzcGctbXxVO.ggzrxbf}" />
						</td>
						<td class="td_zxy01">
							<font color="green">非车险投保总额（元）：</font>
						</td>
						<td class="td_zxy02">
							<s:textfield name="jjzcGctbXxVO.tbze" id="tbze" cssClass="input"
								value="%{#request.jjzcGctbXxVO.tbze}" disabled="true" />
						</td>
					</tr>
				</e:pc>
			</table>
			<%@ include file="/inc/according.inc"%>
			<br>
			<e:opinion id="test" width="100%">
				<e:opinionPart id="LEADER" name="LEADER"
					biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP"
					biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value=""
					text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"
					name="MEETING_DEPT" value="" text="会签部门意见：">
				</e:opinionPart>
				<!-- ==========================工作流信息项======================================= -->
				<%@ include
					file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
				<!-- =========================================================================== -->
				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"
					name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
				<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
			</e:opinion>
			<%@ include
				file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_huiqian_end.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
		</s:form>
	</body>
</html>
<script type="text/javascript">
		var view = "false";
		<e:pc id="view">
			view = "true";
		</e:pc>
		function add_chexian(){
			if("true"=="<%=view%>"){
				window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?view=true&sheettype=assuranceInfo&tbId=${tbId}&headId=${headId}&tblb=0','','height=400, width=1100, top=150, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}else{
				if("true"==view){
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?view=true&sheettype=assuranceInfo&tbId=${tbId}&headId=${headId}&tblb=0','','height=400, width=1100, top=150, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}else{
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=assuranceInfo&tbId=${tbId}&headId=${headId}&tblb=0','','height=400, width=1100, top=150, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
				return false;
		}
		function add_feichexian(){
			if("true"=="<%=view%>"){
				window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?view=true&sheettype=assuranceInfo&tbId=${tbId}&headId=${headId}&tblb=1','','height=400, width=1100, top=150, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}else{
				if("true"==view){
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?view=true&sheettype=assuranceInfo&tbId=${tbId}&headId=${headId}&tblb=1','','height=400, width=1100, top=150, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}else{
					window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=assuranceInfo&tbId=${tbId}&headId=${headId}&tblb=1','','height=400, width=1100, top=150, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
				return false;
		}
		function setFecichexianBF(){
			
		}
		function setCheXianView(objString){
			reobj = eval('(' + objString + ')');
			document.getElementById("pjtbze").value = reobj.total == null?"":reobj.total;
			document.getElementById("clqntpje").value = reobj.avg == null?"":reobj.avg;
			var sfhj = new Number(document.getElementById("sfhj").value);
			var tbze = new Number(document.getElementById("tbze").value);
			document.getElementById("tbzhj").value =sfhj + tbze; 
		}
		function setFeiCheXianView(objString){
			reobj = eval('(' + objString + ')');
			document.getElementById("tbze").value = reobj.total == null?"":parseFloat(reobj.total).toFixed(2);
			document.getElementById("tbzhj").value =document.getElementById("sfhj").value + document.getElementById("tbze").value; 
			var sfhj = new Number(document.getElementById("sfhj").value);
			var tbze = new Number(document.getElementById("tbze").value);
			document.getElementById("tbzhj").value =sfhj + tbze; 
		}
		function total(){
			var syxbf = new Number(document.getElementById("syxbf").value==null?0:document.getElementById("syxbf").value);
			var jqxbf = new Number(document.getElementById("jqxbf").value==null?0:document.getElementById("jqxbf").value);
			var ccsje = new Number(document.getElementById("ccsje").value==null?0:document.getElementById("ccsje").value);
			document.getElementById("sfhj").value = syxbf + jqxbf + ccsje;
			var sfhj = new Number(document.getElementById("sfhj").value==null?0:document.getElementById("sfhj").value);
			var tbze = new Number(document.getElementById("tbze").value==null?0:document.getElementById("tbze").value);
			document.getElementById("tbzhj").value =sfhj + tbze; 
		}
		function count(objString){
			reobj = eval('(' + objString + ')');
			var fangchan = new Number(0.9);//0.9为房产原币原值转换保额的一个转换系数 
			var zjgc = new Number(0.75);//0.75为在建工程原币原值转换保额的一个转换系数
			var fcze = new Number(reobj.total == null?0:reobj.total);//房产总额；
			var zjgcze = new Number(reobj.zjgcTotal == null?0:reobj.zjgcTotal);//在建工程总额；
			var fzbe = fcze * fangchan; //房产保额；
			var zjgcbe = zjgcze * zjgc;//在建工程保额；
			var czyqxfl = new Number(document.getElementById("czyqxfl").value==null?0:document.getElementById("czyqxfl").value);//财产一切险费率;
			document.getElementById("ccyqxtbzcze").value =parseFloat(fzbe + zjgcbe).toFixed(2);//财产一切险投保资产总额;
			document.getElementById("czyqxbf").value =parseFloat(document.getElementById("ccyqxtbzcze").value*czyqxfl).toFixed(2);//财产一切险保费;
			var jqshxxs = new Number(0.2);//机器损坏险系数
			var jqshxbe = (fzbe + zjgcbe)*jqshxxs;//财产一切险保额* 机器损坏险系数
			document.getElementById("jqshxtbzcze").value =parseFloat(jqshxbe).toFixed(2);//机器损坏险投保资产总额;
			var czyqxfl = new Number(document.getElementById("jqshxfl").value==null?0:document.getElementById("jqshxfl").value);//机器损坏险费率;
			document.getElementById("jiqishxbf").value =parseFloat(document.getElementById("jqshxtbzcze").value*document.getElementById("jqshxfl").value).toFixed(2);//机器损坏险保费;
			document.getElementById("tbze").value = reobj.total == null?"":parseFloat(fcze+zjgcze).toFixed(2);
			var sfhj = new Number(document.getElementById("sfhj").value);
			var tbze = new Number(document.getElementById("tbze").value);
			document.getElementById("tbzhj").value =sfhj + tbze; 
			//alert(document.getElementById("ccyqxtbzcze").value);
		}
		function checkThousands(thisPresent){
			var thePresent = thisPresent.value;
			var flag = isFloat(thePresent);
			var id = thisPresent.id;
			var state ="true";
			if(flag==false){
				alert('请输入正确的千分比');
				thisPresent.focus();
				var state ="false";
			}
			if(parseFloat(thePresent) > 1000){
				alert('输入的千分比不能大于1000');
				thisPresent.focus();
				var state ="false";
			}
			for(var i = 0; i < thePresent.length;i++){
				var ch=thePresent.charAt(i);
				if(ch=='.'){
					if(thePresent.length - i > 3){
						alert('小数点后面最多只能有两位');
						thisPresent.focus();
						var state ="false";
					}
				}
			}
			if("true"==state){
				if("czyqxfl"==id){
					var czyqxfl = new Number(document.getElementById("czyqxfl").value==null?0:document.getElementById("czyqxfl").value);//财产一切险费率;
					document.getElementById("czyqxbf").value =parseFloat(document.getElementById("ccyqxtbzcze").value*czyqxfl).toFixed(2);//财产一切险保费;
				}else if("jqshxfl"==id) {
					var jqshxfl = new Number(document.getElementById("jqshxfl").value==null?0:document.getElementById("jqshxfl").value);//机器损坏险费率;
					document.getElementById("jiqishxbf").value =parseFloat(document.getElementById("jqshxtbzcze").value*jqshxfl).toFixed(2);//机器损坏险保费;
				}
			}else{
				if("czyqxfl"==id){
					document.getElementById("czyqxbf").value = 0;
				}else if("jqshxfl"==id){
					document.getElementById("jiqishxbf").value = 0;	
				}
			}
		}
</script>
