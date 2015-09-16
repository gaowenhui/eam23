<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/jygdzc/asset/assetManage.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<% 
  //boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
	   boolean isNgbmzhcl = true;
%>
<%
   String headId = (String)request.getAttribute("headId");
   String userTid = (String) request.getAttribute("userTid");
   Date date = new Date();
   String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
   status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template"); 
   boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
   
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
<head>
		<title>日常管理</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<base href="<%=basePath%>" />
<%
String ywlxChoose = "true"; //判断是什么业务类型，然后加载jgrad表格。即临时表表格
String ywlx = (String)request.getAttribute("ywlx");
if("0".equals(ywlx)||"1".equals(ywlx)){
	ywlxChoose = "true";
}else if("2".equals(ywlx)||"3".equals(ywlx)){
	ywlxChoose = "false";
}
%>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "jygdzcWorkflow";
	actionPath = "jygdzcWorkflow";
%>
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
	<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
	String isJbrcl = String.valueOf("经办人处理".equals(workflowVO.taskName));
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
   	}else{
      	var isMerge = false;
    } 
 $(document).ready(function(){	
    window.parent.clearPanelTool();
    if(isInit)return;
    isInit = true;	
	<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
	jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
	jQuery("#assetlist1").setGridWidth($("#common_tableWidth").width());
	jQuery("#assetlist2").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
	jQuery("#file_huiqian_endlist").setGridWidth($("#common_tableWidth").width());
    $(window).bind('resize', function(){
		jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#blyj_reason_list").setGridWidth($("#common_tableWidth").width());
		jQuery("#assetlist1").setGridWidth($("#common_tableWidth").width());
		jQuery("#assetlist2").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_huiqianlist").setGridWidth($("#common_tableWidth").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#common_tableWidth").width());
       });
	   //合成正文按钮
	<%
	    if(!inCounterSign){
	%>
	//查看正文按钮
	<e:pc id="ckzw">
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	   //生成编号
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
	<e:pc id="assetlist1">
	var buttonJSonString1 = '[{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"},\
								{"buttonHandler":"updateAss","buttonIcon":"icon-edit","buttonText":"修改"}\
	]';
	addButtons(jQuery("#gview_assetlist1 > .ui-jqgrid-titlebar"),buttonJSonString1);
	</e:pc>
	<e:pc id="assetlist3">
	var buttonJSonString3 = '[{"buttonHandler":"seeAss","buttonIcon":"icon-search","buttonText":"查看"},\]';
	addButtons(jQuery("#gview_assetlist1 > .ui-jqgrid-titlebar"),buttonJSonString3);
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
	<e:pc id="assetlist2">
	var buttonJSonString2 = '[{"buttonHandler":"addAss1","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delAss1","buttonIcon":"icon-remove","buttonText":"删除"},\
								{"buttonHandler":"updateAss1","buttonIcon":"icon-edit","buttonText":"修改"}\
	]';
	addButtons(jQuery("#gview_assetlist2 > .ui-jqgrid-titlebar"),buttonJSonString2);
	</e:pc>
	
	//（处理）新建正文按钮
	<e:pc id="sczw">
		var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>	    
	<%
	   }else{
	%>
	//查看正文按钮
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	   <%}%>
	
	});  
	
	<!-- ============================================================================ -->
 	 function createBook4Card(){
 	    var bianhao = document.getElementById("bianhao");
		if(bianhao.value == null || bianhao.value.length == 0){
			alert("编号不能为空！");
			bianhao.focus();
	      return false;
	    }
		var headId = "${headId}"; 
		var url = "<%=basePath%>jygdzc/AssetManageHead_createBookBycldId.do";
		if(confirm("是否办结")){
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
	//（处理）新建正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "日常管理正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"日常管理正文"); 
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
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "日常管理正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
			isMerge = true;
		}
		
		function hechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
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
		function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
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
        function checkEAMFormJSMethod(){
          $("select").removeAttr("disabled");
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
		    
		     var bianhao = document.getElementById("bianhao");
		     <e:pc id="scbh">
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
		    </e:pc>
		    var lxdh = document.getElementById("lxdh");
			if(lxdh.value == null || lxdh.value.length == 0){
				alert("联系电话不能为空！");
				lxdh.focus();
		      return false;
		    }
		    var jbh = document.getElementById("jbh");
			if(jbh.value == null || jbh.value.length == 0||jbh.value == ""){
				alert("经办行不能为空！");
				jbh.focus();
		      return false;
		    }
		    var mm = document.getElementById("ywlx").value;
		    var idArray1 = $("#assetlist1").getDataIDs();
		    if((mm==0||mm==1)&&(idArray1== null||idArray1.length == 0)){
		        alert("请添加一条信息");
		        return false;
		    }	
		     var idArray2 = $("#assetlist2").getDataIDs();
		    if((mm==2||mm==3)&&(idArray2== null||idArray2.length == 0)){
		        alert("请添加一条信息");
		        return false;
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
		//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		$.post("<%=basePath %>jygdzc/AssetManageHead_createNum.do",{
			"headId":headId,
			"code":"jjgdzc_manger"
		},function(data){
			document.getElementById("bianhao").value = data;
			window.parent.removeObj("#shengchenButton");
			var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
		   window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
		});
	}	
	
	function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
		}
	//双击查看资产
	function lookAsset(gr){
			window.open('<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?isdisable=true&headId=${headId}&sheettype=assetInfo&zcId='+gr,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
	</script>
	</head>
<body onload="displayButton();"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="/inc/word.inc"%>
<s:form  action="AssetManageHead_saveHead"  theme="simple" id="myform" name="myform">
<s:hidden name="head.id"  id="headId" value="%{#request.headId}" />
<s:hidden name="headId"  value="%{#request.headId}" />
<s:hidden name="sheettype" id="sheettype" value="%{#request.sheettype}" />
<s:hidden  name="head.sheettype" value="%{#request.sheettype}" />
<s:hidden name="head.lcmc" id="lcmc" value="日常管理" />

<s:hidden name="head.senderp" id="senderp"/>
<s:hidden name="head.isrejected" id="isrejected"/>
<s:hidden name="sendErpState" id="sendErpState"/>

<s:set name="biaodanid" value="head.id" />
<s:hidden name="head.xlid"  />
<s:hidden name="chooseData" id="chooseData" />
<s:hidden name="chooseywlx" id="chooseywlx" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath() + "/" + actionSpaceName + "/" + actionPath + "_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<input type="hidden" id="abandonUrl" value="<%=urlHeader + abandonMethod + ".do"%>" />
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader + endMethod + ".do"%>" />
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader + participationMethod + ".do"%>" />
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do" />
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="jygdzc/AssetManageHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅]<s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" />会签办理单"/>
<input type="hidden" name="counterSignUrl" value="jygdzc/AssetManageHead_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  /> 
<!-- =========================================================================== -->
      <br/>
      <div align="center">
        <span class="STYLE7 STYLE1">中国建银投资有限责任公司日常管理<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
      </div>
      <br/>
<!-- ==========================工作流信息项======================================= -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
     <hr color="#6600CC" align="center" width="100%">
	<table id="common_tableWidth"  class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
	    <td class="td_zxy01"><font color="red">*</font>标 题：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.biaoti" id="biaoti" cssClass="input2"/></td>
	  </tr>
	  <tr>
	    <td class="td_zxy01"><font color="red">*</font>呈 送：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.chengsong" id="chengsong" cssClass="input2"/></td>
	  </tr>
	  <tr>
		<td class="td_zxy01" width="120">编号：</td>
		<td class="td_form02"><s:textfield name="head.bianhao"  id="bianhao"  readonly="true" cssClass="input"/>
		 </td>
		<td class="td_zxy01">急缓程度：</td>
		<td class="td_zxy02"><r:select name="head.jhcd"  id="jhcd"  list="#{'0':'一般','1':'急','2':'特急'}"/></td>
	  </tr>	
	  <tr>
		<td class="td_zxy01" width="120">拟稿人：</td>
		<td class="td_zxy02">
		<s:hidden name="head.ngr"  value="%{#request.head.ngr}"  />
		<s:textfield name="head.ngrmc" id="ngr" cssClass="input"  readonly="true"/></td>
		<td class="td_zxy01" width="120"><font color="red">*</font>联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" id="lxdh" cssClass="input" onblur="checkPhone(this);"/></td>
	  </tr>	
	  <tr>
	   <td  class="td_zxy01">拟稿日期：</td>
	    <td class="td_zxy02">
			<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <r:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
	    <td  class="td_zxy01" >拟稿部门：</td>
	    <td class="td_zxy02">
	    	 <s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    	<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
	    </td>
	  </tr>	
  		<tr>
	  <td class="td_zxy01" width="120">业务类型：</td>
	  <td class="td_zxy02">
	    <r:select list="#{'0':'确权审批','1':'更新改造','2':'业务维修','3':'其他事项审批'}" name="head.ywlx" onclick="clickywlxIndex();" id="ywlx"  onchange="getIndex()" />
	  </td>
		<td class="td_zxy01">是否涉及费用：</td>
	    <td class="td_zxy02" ><r:select name="head.sfsjfy" id="sfsjfy" list="#{0:'否',1:'是'}" /></td>
	  </tr>
	  <tr>
	    <td class="td_zxy01" width="120">申请费用总金额(元)：</td>
	    <td class="td_zxy02" ><r:textfield name="head.applyMoney" readonly="true" cssClass="input"  id="sqfyzje" /></td>
		<td class="td_zxy01" width="120">审批费用总金额(元)：</td>
	    <td class="td_zxy02"><r:textfield name="head.approveMoney" readonly="true" cssClass="input"  id="sdfyzje" /></td>
	  </tr>	
	  <tr>
	    <td class="td_zxy01"><font color="red">*</font>经办行：</td>
		<td class="td_zxy02" valign="middle">
			<e:select parRefKey="department" onclick="clickIndex();"  id="jbh" headerKey="" headerValue="" parentId="438" list="#{}" onchange="change()" name="head.region"/>	
		</td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	  </tr>
	  
		<tr>
			<td class="td_zxy01">会签部门：</td>
		    <td class="td_form02" colspan="3" >
		    <r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"  cssClass="input2"/>
		       <s:hidden  name="head.hqbmid" id="hqbmids"/>
		         <e:pc id="xzhq">
		     	  <img src="<%=basePath%>resource/ProjectImages/search.gif" onclick="openTreeByType();" width="21" height="20" align="absmiddle"/>  
		     	 </e:pc> 
		      <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>	 
		     	  </td>
		 </tr>	
		
  </table>	
	            <div id="add_tableWidth"  ></div>
				<table id="add_tableWidth"></table>
	            <div id="controlWidth">
					<div id="div11"  >
							<table id="assetlist1"></table>
				              <div id="asset1"></div>
					</div>
					<div id="div22" >
							<table id="assetlist2"></table>
							<div id="asset2"></div>
					 </div>
				 </div>	 
 	<%@ include file="/inc/according.inc"%>  
    <e:opinion id="test" width="100%">
        <e:opinionPart id="LEADER" biaodanid="%{#request.biaodanid}"  name="LEADER" value="" text="批示意见："></e:opinionPart>
        <e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}"  name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
        <e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}"  name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
        <e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见：">
        </e:opinionPart>
        <!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
		<!-- =========================================================================== -->
        <e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
        <e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
    </e:opinion>
    <%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
	<%@ include file="/inc/file.inc"%>
	<%@ include file="/inc/file_huiqian_end.inc"%>
	<%@ include file="/inc/listMessage.inc"%>	
</s:form>
<SCRIPT language=JavaScript type=text/JavaScript>
function clickIndex(){
		var chooseData = document.getElementById('jbh').value;
		document.getElementById('chooseData').value = chooseData;
}
function clickywlxIndex(){
		var chooseywlx = document.getElementById('ywlx').value;
		document.getElementById('chooseywlx').value = chooseywlx;
}
function change(){
	var x=document.getElementById("ywlx")
	var y = x.selectedIndex ;
	var chooseData = document.getElementById('chooseData').value;
	var dates = 0;
	if(y==0 || y==1){
		dates = jQuery("#assetlist1").getDataIDs();
	}else {
		dates = jQuery("#assetlist2").getDataIDs();
	}
	if(dates.length>0){
		alert("已添加数据，不能变更经办行!");
		document.getElementById("jbh").value = chooseData;
		return false;
	}
}
function getIndex() {
	var x=document.getElementById("ywlx")
	var y = x.selectedIndex ;
	var chooseywlx = document.getElementById('chooseywlx').value;
	var sheettype = document.getElementById("sheettype").value;
	var delblyjurl ="<%=basePath%>jygdzc/AssetManageBody_deleteBody.do";
	var headId = document.getElementById("headId").value;
	var dates = 0;
	if(y==0 || y==1){
		dates = jQuery("#assetlist1").getDataIDs();
	}else {
		dates = jQuery("#assetlist2").getDataIDs();
	}
	if(dates.length>0){
		if(confirm("切换业务类型会删除列表中的资产,请确认是否切换")){
			$.post(delblyjurl,{zcId:"" + "" + "",headId:"" + headId + "",sheettype:"" + sheettype + ""}, function(data){
				jQuery("#assetlist1").trigger("reloadGrid");
				jQuery("#assetlist2").trigger("reloadGrid"); 
			});
			if( y==1 || y==0){
				div11.style.display = "block";
				div22.style.display = "none";
			}else{
				div11.style.display = "none";
			    div22.style.display = "block";
			}
		}else{
			document.getElementById("ywlx").value = chooseywlx;
			return false;
		}
	}
}
 
  function addValue(gr){
		    var delblyjurl ="<%=basePath%>jygdzc/AssetManageBody_saveBody.do";
		    var headId=document.getElementById("headId").value;
		    var sheettype=document.getElementById("sheettype").value;
			$.post(delblyjurl,{sheettype:""+sheettype+"",zcId:"" + gr + "",headId:"" + headId + ""}, function(data){
			  jQuery("#purchase_list").trigger("reloadGrid");
			});
		}
		
		 function reloadGrid(){
					$("#purchase_list").setGridParam({
						postData:{
							headId: "{#request.headId}"
						},
						url:"<%=basePath%>jygdzc/AssetManageBody_query4View.do"
					}).trigger("reloadGrid");
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
		function send2Erp(){  
			var headId = document.getElementById('headId').value; 
			var url = "<%=basePath%>jiekou/send2ERP4RCGL_requestExecute.do";
			if(confirm("是否发送ERP？")){
				$.post(url,{headId:"" + headId + ""}, function(data){
					if(data !=""){
						alert(data);
						if(data == "ERP系统正确接收!"){
							window.location.reload();
						}
					}
				});
			}
		}
		
		function send2Erp2(){
		   return false;
		}
		
       function displayButton(){
		var isJbrcl = '<%=isJbrcl%>';
		var sendErpState = "";
		var sfsjfy = document.getElementById("sfsjfy").value;
		if(isJbrcl == 'true'){
			if(sfsjfy == 0){
				<e:pc id="sctz">
						var buttonStr_banjie = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
						window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
				</e:pc>
		   }else{			
				var senderp = document.getElementById('senderp').value;
				var isrejected = document.getElementById('isrejected').value;
				if(isrejected=='04'){//后加的状态，如果生成台账成功，则状态为已生成台账
					sendErpState = '4'
				}else{
					if((senderp!='1'&&senderp!='2')||isrejected=='01'){//如果shenderp不等于1或者2，那么状态为未发送erp或者发送不成功
						<e:pc id="fserp">
						var buttonStr_banjie = '[{"id":"sendToERP","buttonHandler":"mainWindow.send2Erp","buttonIcon":"icon-redo","buttonText":"发送ERP"}]';
						window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
						</e:pc>
						sendErpState = '1';
					}else if(senderp=='1'||senderp=='2'){//如果senderp等于1或者2，那么状态为发送erp成功，或者审核通过，或者不通过
						
						if(isrejected=='02'){ //如果isrejected为02则审核通过，
							<e:pc id="fserp">
							var buttonStr_banjie = '[{"id":"sendToERP","buttonHandler":"mainWindow.send2Erp2","buttonIcon":"icon-redoblack","buttonText":"发送ERP"}]';
							window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
							</e:pc>
							<e:pc id="sctz">
							var buttonStr_banjie = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
							window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
							</e:pc>
							sendErpState = '2';
						}else if(isrejected=='01'){//如果isrejected为01，则审核不通过
						}else{
							sendErpState = '0';//其他情况为发送erp成功状态
						}
					}
				}			
				//alert("sendErpState:"+sendErpState);
				document.getElementById('sendErpState').value = sendErpState;
			}
		}
	}
</SCRIPT>
</body>
</html>
<script type="text/javascript">
//********************************确权审批，更新改造********************************************************
jQuery("#assetlist1").jqGrid({				
	url:"<%=basePath %>jygdzc/AssetManageBody_query4View.do?headId=${headId}&json4RCGL=manage",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','资产编号', '资产名称', '主卡片编号', '主卡片名称','原值','已使用年限','尚可使用年限','申请金额','审定金额'],
    colModel: [
    {name: 'id',index: 'id',align: "center",hidden:true}, 
	{name: 'zcbh',index: 'id',align: "center",width: 100}, 
	{name: 'zcmc',index: 'name',align: "center",width: 100}, 
	{name: 'zkpbh',index: 'didian',align: "center",width: 100},
    {name: 'kpmc',index: 'yuanzhi',align: "center",width: 100},
    {name: 'ybyz',index: 'shenqingjine',align: "center",width: 100 ,formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}}, 
    {name: 'ysynx',index: 'shendingjine',align: "center",width: 100}, 
    {name: 'sksynx',index: 'she',align: "center",width: 100}, 
    {name: 'sqje',index: 'shen',align: "center",width: 100}, 
    {name: 'sdje',index: 'shend',width: 100}],
    loadComplete:function(data){
		if(data && data.rows.length>0){
			jQuery("#assetlist1").setGridHeight(data.rows.length * 22 + 18);
		}else{
			jQuery("#assetlist1").setGridHeight(0);
		}
	},
	shrinkToFit:false,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
		lookAsset(gr);
	},
	viewrecords:true,
	caption: '资产列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	gridComplete:function(){
		compute1();
	}
});

// 删除
function delAss(){
	var gr = jQuery("#assetlist1").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var sheettype = document.getElementById("sheettype").value;
			var delblyjurl ="<%=basePath%>jygdzc/AssetManageBody_deleteBody.do";
			$.post(delblyjurl,{zcId:"" + gr + "",sheettype:"" + sheettype + ""}, function(data){
				jQuery("#assetlist1").trigger("reloadGrid");
			});
		}
	}
}
// 修改
//添加chakan 字段， 1是查看 0为修改
function updateAss(){
	var gr = jQuery("#assetlist1").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1 ||(gr.length==2&&gr[0]==null)){
		var headId = document.getElementById("headId").value;
		var sheettype = document.getElementById("sheettype").value;
		var yjfh = document.getElementById("jbh").value;
		if(yjfh==null||""==yjfh){
			alert("请选择经办行");
			return false;
		}
		var sfsjfy = document.getElementById("sfsjfy").selectedIndex;
<%
	if(workflowVO.taskName.equals("拟稿")){
%>	
		var url = '<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?sfsjfy='+sfsjfy+'&headId='+headId+'&jbh='+yjfh+'&chakan=0'+'&sheettype2=bmldsh&sheettype=manageInfo&zcId='+gr;
<%
	}else{
%>	
		var url = '<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?sfsjfy='+sfsjfy+'&headId='+headId+'&jbh='+yjfh+'&chakan=0'+'&sheettype=manageInfo&zcId='+gr;
<%	
	}
%>
		
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		window.open(url,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
	}else alert("请选择要修改的记录");
}

// 查看
//添加chakan 字段， 1是查看 0为修改
function seeAss(){    
     var gr = jQuery("#assetlist1").jqGrid('getGridParam','selarrrow');
     if(gr.length == 1 ||(gr.length==2&&gr[0]==null)){
		     var headId = document.getElementById("headId").value;
			 var sheettype = document.getElementById("sheettype").value;
			 var yjfh = document.getElementById("jbh").value;
			 if(yjfh==null||""==yjfh){
					alert("请选择经办行");
					return false;
			 }
			 var sfsjfy = document.getElementById("sfsjfy").selectedIndex;
			
			 <%
			if(workflowVO.taskName.equals("拟稿")){
		%>	
				var url = '<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?sfsjfy='+sfsjfy+'&headId='+headId+'&jbh='+yjfh+'&chakan=1'+'&sheettype2=bmldsh&sheettype=manageInfo&zcId='+gr;
		<%
			}else{
		%>	
				var url = '<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?sfsjfy='+sfsjfy+'&headId='+headId+'&jbh='+yjfh+'&chakan=1'+'&sheettype=manageInfo&zcId='+gr;
		<%	
			}
		%>
				
			url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
			window.open(url,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');    
	}else alert("请选择一个资产");
}
// 添加
function addAss(){
	var headId = document.getElementById("headId").value;
	var sheettype = document.getElementById("sheettype").value;
	var sfsjfy = document.getElementById("sfsjfy").selectedIndex;
	var yjfh = document.getElementById("jbh").value;
	if(yjfh==null||""==yjfh){
		alert("请选择经办行");
		return false;
	}
<%
	if(workflowVO.taskName.equals("拟稿")){
%>	
	var url = '<%=basePath%>jygdzc/AssetManageBody_newBody.do?sfsjfy='+sfsjfy+'&ywlx=manage&sheettype2=bmldsh&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&isAdd=true';
<%
	}else{
%>	
	var url = '<%=basePath%>jygdzc/AssetManageBody_newBody.do?sfsjfy='+sfsjfy+'&ywlx=manage&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&isAdd=true';
<%	
	}
%>
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	window.open(url,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
}
// 刷新
function reloadJqGrid1(){
	jQuery("#assetlist1").trigger("reloadGrid");
}   
$("#div11").css("display","block");

function compute1(){
	var sqvalues=0;
	$("td[aria-describedby='assetlist1_sqje']").each(function(i,obj){
        var r=$(obj).text();
        sqvalues=sqvalues+parseFloat(r);
    });
    var sqf_x = parseFloat(sqvalues);
	if (isNaN(sqf_x))
	{
	alert('function:changeTwoDecimal->parameter error');
	return false;
	}
	var sqf_x = Math.round(sqvalues*100)/100;  
    document.getElementById("sqfyzje").value=sqf_x;
    
    var sdvalues=0;
	$("td[aria-describedby='assetlist1_sdje']").each(function(i,obj){
        var r=$(obj).text();
        sdvalues=sdvalues+parseFloat(r);
    });  
    var f_x = parseFloat(sdvalues);
	if (isNaN(f_x))
	{
	alert('function:changeTwoDecimal->parameter error');
	return false;
	}
	var f_x = Math.round(sdvalues*100)/100;
    document.getElementById("sdfyzje").value=f_x;
    if(sqvalues!=0){
    	 document.getElementById("sfsjfy").selectedIndex=1;	
    	  document.getElementById("sfsjfy").disabled="disabled";
    
    }
}
function compute2(){
	var sqvalues=0;
	$("td[aria-describedby='assetlist2_sqje']").each(function(i,obj){
        var r=$(obj).text();
        sqvalues=sqvalues+parseFloat(r);
    });
    var sqf_x = parseFloat(sqvalues);
	if (isNaN(sqf_x))
	{
	alert('function:changeTwoDecimal->parameter error');
	return false;
	}
	var sqf_x = Math.round(sqvalues*100)/100;  
    document.getElementById("sqfyzje").value=sqf_x;
    
    var sdvalues=0;
	$("td[aria-describedby='assetlist2_sdje']").each(function(i,obj){
        var r=$(obj).text();
        sdvalues=sdvalues+parseFloat(r);
    });
    
    var f_x = parseFloat(sdvalues);
	if (isNaN(f_x))
	{
	alert('function:changeTwoDecimal->parameter error');
	return false;
	}
	var f_x = Math.round(sdvalues*100)/100;  
    document.getElementById("sdfyzje").value=f_x;
    
}
//********************************业务维修，其他事项审批********************************************************
jQuery("#assetlist2").jqGrid({				
	url:"<%=basePath %>jygdzc/AssetManageBody_query4View.do?headId=${headId}&json4RCGL=manage",
	datatype: "json",
	mtype:"POST",
   	colNames: ['id','资产编号', '资产名称', '存放地点', '原值','申请金额','审定金额'],
	colModel: [
	{name: 'id',index: 'id',align: "center",hidden:true}, 
	{name: 'zcbh',index: 'zcbh',align: "center",width: 100}, 
	{name: 'zcmc',index: 'zcmc',align: "center",width: 100}, 
	{name: 'saveadsress',index: 'saveadsress',align: "center"},
    {name: 'ybyz',index: 'yuanzhi',align: "center",width: 100,formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}},  
    {name: 'sqje',index: 'shenqingjine',align: "center",width: 100}, 
    {name: 'sdje',index: 'shendingjine',align: "center",width: 100
    }],
    loadComplete:function(data){
		if(data && data.rows.length>0){
			jQuery("#assetlist2").setGridHeight(data.rows.length * 22 + 18);
		}else{
			jQuery("#assetlist2").setGridHeight(0);
		}
	},
	shrinkToFit:false,
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
		lookAsset(gr);
	},
	viewrecords:true,
	caption: '列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	gridComplete:function(){
		compute2();
	}
});
// 删除
function delAss1(){
	var gr = jQuery("#assetlist2").jqGrid('getGridParam','selarrrow');
	if (gr.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var sheettype = document.getElementById("sheettype").value;
			var delblyjurl ="<%=basePath%>jygdzc/AssetManageBody_deleteBody.do";
			$.post(delblyjurl,{zcId:"" + gr + "",sheettype:"" + sheettype + ""}, function(data){
				jQuery("#assetlist2").trigger("reloadGrid");
			});
		}
	}
}
// 修改
function updateAss1(){
	var gr = jQuery("#assetlist2").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1 ||(gr.length==2&&gr[0]==null)){
		var headId = document.getElementById("headId").value;
		var sheettype = document.getElementById("sheettype").value;
		var yjfh = document.getElementById("jbh").value;
		if(yjfh==null||""==yjfh){
			alert("请选择经办行");
			return false;
		}
		var sfsjfy = document.getElementById("sfsjfy").selectedIndex;
<%
	if(workflowVO.taskName.equals("拟稿")){
%>			
		var url = '<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?sfsjfy='+sfsjfy+'&headId='+headId+'&jbh='+yjfh+'&sheettype2=bmldsh&sheettype=manageInfo&zcId='+gr;
<%
	}else{
%>
		var url = '<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?sfsjfy='+sfsjfy+'&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&zcId='+gr;
<%	
	}
%>
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		window.open(url,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}else alert("请选择要修改的记录");
}
// 添加
function addAss1(){
	var headId = document.getElementById("headId").value;
	var sheettype = document.getElementById("sheettype").value;
	var ywlx = document.getElementById("ywlx").selectedIndex;
	var yjfh = document.getElementById("jbh").value;
	if(yjfh==null||""==yjfh){
		alert("请选择经办行");
		return false;
	}
	var sfsjfy = document.getElementById("sfsjfy").selectedIndex;
	
<%
	if(workflowVO.taskName.equals("拟稿")){
%>
	if("3"==ywlx){
		var url = '<%=basePath%>jygdzc/AssetManageBody_newBody.do?sfsjfy='+sfsjfy+'&ywlx=else&sheettype2=bmldsh&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&isAdd=true';
	}else{
		var url = '<%=basePath%>jygdzc/AssetManageBody_newBody.do?sfsjfy='+sfsjfy+'&ywlx=manage&sheettype2=bmldsh&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&isAdd=true';
	}
<%
	}else{
%>
	if("3"==ywlx){
		var url = '<%=basePath%>jygdzc/AssetManageBody_newBody.do?sfsjfy='+sfsjfy+'&ywlx=else&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&isAdd=true';
	}else{
		var url = '<%=basePath%>jygdzc/AssetManageBody_newBody.do?sfsjfy='+sfsjfy+'&ywlx=manage&headId='+headId+'&jbh='+yjfh+'&sheettype=manageInfo&isAdd=true';
	}
<%	
	}
%>
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	window.open(url,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
}
// 刷新
function reloadJqGrid2(){
	jQuery("#assetlist2").trigger("reloadGrid");
} 
//设置业务类型为disabled
function setdisabled(){
	document.getElementById("ywlx").disabled="true";
}
$("#div22").css("display","none");
$(function(){
	var ywlxChoose = '<%=ywlxChoose%>';
	if('true'==ywlxChoose){
		$("#div11").css("display","block");
		$("#div22").css("display","none");
	}else{
		$("#div11").css("display","none");
		$("#div22").css("display","block");
	}
} )               
</script>              
<SCRIPT LANGUAGE="JavaScript">
	if("<%=request.getAttribute("ErpMessage")%>" != "null") {
		alert("<%=request.getAttribute("ErpMessage")%>"); 
	}
</SCRIPT>
