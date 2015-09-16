<%@page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.*" %>
<%
	String headId = request.getAttribute("head.id").toString();
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
	CzXmjaHead head = (CzXmjaHead)request.getAttribute("head");
	String jaxmlx = head.getJaxmlx();
	String userTid = (String) request.getAttribute("userTid");
	
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/dealTrace1/shenqinjiean.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>结案审批</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "zccz_gzja_Workflow";
	actionPath = "zccz_gzja_Workflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
		<SCRIPT language=JavaScript type=text/JavaScript>
		var isQiChaoCzbg = false;
$(document).ready(function(){
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>

		jQuery("#file_list").setGridWidth($("#table").width());
		jQuery("#blyj_reason_list").setGridWidth($("#table").width());
		jQuery("#purchaselist").setGridWidth($("#table").width());
		jQuery("#file_huiqianlist").setGridWidth($("#table").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
	    $(window).bind('resize', function(){
			jQuery("#file_huiqianlist").setGridWidth($("#table").width());
			jQuery("#file_list").setGridWidth($("#table").width());
			jQuery("#blyj_reason_list").setGridWidth($("#table").width());
			jQuery("#purchaselist").setGridWidth($("#table").width());
			jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
    	});
		//（处理）新建正文按钮
		<%if(!inCounterSign){%>
		<e:pc id="xinjianzhengwen">
		var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		<%}else{%>
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		<%}%>
       //办结按钮
       <%if(!inCounterSign){%>
			<e:pc id="banjie">
				var buttonStr_banjie = '[{"buttonHandler":"mainWindow.liuchengbanjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
				window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
			</e:pc>
	   <%}%>
		<e:pc id="blyj_reason_list">
    var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
	]';
	addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
	</e:pc>
	<e:pc id="file_list">
	var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
	]';
	addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
	</e:pc>
	//查看正文按钮
	<e:pc id="chakanzhengwen">
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	
		<e:pc id="purchaselist">
	var buttonJSonString = '[{"buttonHandler":"bufenjiean","buttonIcon":"icon-edit","buttonText":"部分结案"},\
							 {"buttonHandler":"quanbujiean","buttonIcon":"icon-edit","buttonText":"全部结案"},\
							<%if(!inCounterSign){%>{"buttonHandler":"add1","buttonIcon":"icon-add","buttonText":"增加"},\
							 {"buttonHandler":"delete1","buttonIcon":"icon-remove","buttonText":"减少"},\
							 {"buttonHandler":"update1","buttonIcon":"icon-edit","buttonText":"编辑"},\
							 <%}%>{"buttonHandler":"chakan1","buttonIcon":"icon-search","buttonText":"查看"}\
	]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	<e:pc id="purchaselist2">
	var buttonJSonString = '[<%if("0".equals(jaxmlx)){%>{"buttonHandler":"bufenjiean","buttonIcon":"icon-edit","buttonText":"部分结案"},\
							 {"buttonHandler":"quanbujiean","buttonIcon":"icon-edit","buttonText":"全部结案"},\<%}%><%if(!inCounterSign){%>{"buttonHandler":"add1","buttonIcon":"icon-add","buttonText":"增加"},\
							 	{"buttonHandler":"delete1","buttonIcon":"icon-remove","buttonText":"减少"},\
							 	{"buttonHandler":"update1","buttonIcon":"icon-edit","buttonText":"编辑"},\
							 <%}%>{"buttonHandler":"chakan1","buttonIcon":"icon-search","buttonText":"查看"}\
							]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	<e:pc id="purchaselist1">
	var buttonJSonString = '[{"buttonHandler":"chakan1","buttonIcon":"icon-search","buttonText":"查看"}\]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
	</e:pc>
	
	 //生成编号
     <e:pc id="bianhao_button">
			var headBHGen = document.getElementById("bh").value;
			if(headBHGen == null || headBHGen.length == 0){
				var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
				window.parent.removeById("huiqianid");
			}else{
			 	<e:pc id="hechengzhengwen">
				   <%
				    if(!"2".equals(status)){
				   %>
					var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
					window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
					window.parent.removeById("huiqianid");
					<%
					   }
					%>
				</e:pc>
			}
	   </e:pc>
   
});
function afterWordSubmit(){
		  isQiChaoCzbg = true;
		}
	function quanbujiean(){
		var xmIds = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
		var headId = document.getElementById("headId").value;
		if( xmIds.length == 1&&xmIds[0].length ==0 ){
			alert("没有可以选择的处置项目！");
		}else if(xmIds.length>0){
			$.post("<%=request.getContextPath()%>/zccz/dealTrace1Head_quanbujiean.do",{
				"xmIds":""+xmIds,"headId":headId
			},function(data){
				alert(data);
				reloadJqGrid();
			});
		}else if(gr.length==0){
			alert("请选择处置项目!");
		}
	}
	
	function bufenjiean(){
		var xmIds = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
		var headId = document.getElementById("headId").value;
		if( xmIds.length == 1 ||(xmIds.length==2&&xmIds[0]=="")){
			window.open('<%=basePath %>zccz/dealTrace1Head_viewItemInfo.do?itemId='+xmIds+"&bufenjiean=true&headId="+headId);
		}else if(xmIds.length==0){
			alert("请选择一条处置项目!");
		}
	}
function add1(){
	var isgdzccz = document.getElementById("isgdzccz").value;
	var xmlx = document.getElementById("xmlx").value;
	var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_addXm.do?xmlx="+xmlx+"&isAdd=true&headId=${head.id}&isgdzccz="+isgdzccz;//弹出项目列表
	window.open(url);
}
function delete1(){
	var gr = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1&&gr[0].length ==0 ){
		alert("没有可以选择的处置项目！");
	}else if(gr.length>0){
		if(confirm("确认删除？")){
			var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_delXm.do";
			$.post(url,{ids:"" + gr + "",cldId:'${head.id}'}, function(data){
				reloadJqGrid();
				alert("删除成功!");
			});
		}
	}else if(gr.length==0){
		alert("请选择处置项目!");
	}
}
// 修改
function update1(){
	var gr = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1 ||(gr.length==2&&gr[0]==null)){
		var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_editXm.do?1=1&xmIds="+gr+"&headId=${headId}";
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		window.open(url);
	}else {alert("请选择要修改的记录");}
}
// 查看
function chakan1(){
	var gr = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1 ||(gr.length==2&&gr[0]==null)){
		var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_editXm.do?1=1&xmIds="+gr+"&headId=${headId}&isLook=true";
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		window.open(url);
	}else {alert("请选择要查看的记录");}
}
function callBackXm(ids){
	var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_saveXm.do";
	$.post(url,{ids:"" + ids + "",headId:'${head.id}'}, function(data){
		reloadJqGrid();
	});
}
function reloadJqGrid(){
	jQuery("#purchaselist").trigger("reloadGrid");
}
function createBianhao(){
				if(document.getElementById("bh").value!=""){
					alert("已生成编号！");
					return false;
				}
				var headId = document.getElementById("headId").value;
				$.post("<%=request.getContextPath()%>/zccz/dealTrace1Head_getCode.do",{
					"headId":headId
				},function(data){
					document.getElementById("bh").value = data;
					window.parent.removeObj("#shengchenButton");
					var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
				   window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
				});
			}
  // 检验电话号码
function checkPhone(thisPhone){
	var val = thisPhone.value;
	if(val && val.length>0){
		if(!(val.isPhone() | val.isMobile())){
			alert("电话号码不对！");
			thisPhone.focus(); 
		}
	}
}
//必填项控制
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
		
		var ti = document.getElementById("biaoti");
	    var  bianhao= document.getElementById("bh");
	    var  lxdh= document.getElementById("lxdh");
	    var  chengsong= document.getElementById("chengson");
		if(ti.value == null || ti.value.length == 0){
			alert("标题不能为空！");
			ti.focus();
	      	return false;
	    }
	    if(lxdh.value == null || lxdh.value.length == 0){
			alert("联系电话不能为空！");
			lxdh.focus();
	      	return false;
	    <e:pc id="bianhao_button">
	    }else if(bianhao.value == null || bianhao.value.length == 0){
	    	alert("请生成编号！")
	      	return false;
      	</e:pc>
	    }
	     <%if(StringUtils.equals("draft",workflowVO.step)){%>
				if("<%=status%>"=="0" && !isQiChaoCzbg){
					alert("请先起草正文");
					return false;
				}
			<%}%>
		
		var jaxmlbIDs = jQuery("#purchaselist").getDataIDs();
		var count = jaxmlbIDs.length;
		if(count <= 0){
			alert("请选择要结案的项目！");
			return false;
		}
	    return true;
	}
	
	//验证标题为空
function checkEAMFormTitle(){
	var biaoti = document.getElementById("biaoti");
	if(biaoti.value == null || biaoti.value.trim().length == 0){
			alert("标题不能为空！");
			biaoti.focus();
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
function liuchengbanjie(){
		var bianhao = document.getElementById('bh').value; 
		if(bianhao ==""){
			alert("请先生成编号");
			return false;
		}
		var jaxmlbIDs = jQuery("#purchaselist").getDataIDs();
		var count = jaxmlbIDs.length;
		if(count <= 0){
			alert("请选择要结案的项目！");
			return false;
		}
			var headId = document.getElementById('headId').value; 
			var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_banjie.do";
			$.post(url,{headId:"" + headId + ""}, function(data){
				if(data!=""&&data!=null)
				alert(data);
				if(data == "办结成功！"){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.outCome.value = "流程办结";
					document.myform.sheetId.value = document.getElementById("bh").value;
					document.myform.submit();
					return;
				}
			});
		}
		function lookdblclickAss(rowid){
				window.open('<%=basePath %>zccz/dealTrace1Head_viewItemInfo.do?itemId='+rowid);
		}
		function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
		}
</SCRIPT>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden name="datas2"/>
 <%@ include file="/inc/word.inc"%>
<s:form id="myform" name="myform" action="">
<s:hidden name="xmlx" value="%{#request.head.jaxmlx}"/>
<s:hidden name="isgdzccz" id="isgdzccz"/>
<s:hidden name="head.id"/>
<s:hidden name="head.jaxmlx" id="jaxmlx"/>
<s:hidden name="headId" id="headId"  value="%{#request.head.id}"/>
<s:hidden name="head.lcmc" id="lcmc"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />


<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/dealTrace1Head_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/dealTrace1Head_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/dealTrace1Head_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/dealTrace1Head_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="zccz/dealTrace1Head_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  /> 
<input type="hidden" name="counterSignTitle" value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="zccz/dealTrace1Head_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
	        <br/>
				<div align="center">
					<span class="STYLE7 STYLE1">中国建银投资有限责任公司处置项目结案申请<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
				</div>
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
				<table width="100%" id="table" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_zxy01" >
							<font color="#FF0000"><strong>*</strong></font>标 题：
						</td>
						<td class="td_form02" colspan="3">
							<r:textfield name="head.biaoti" id="biaoti" size="30"  cssClass="input" />
						</td>
					</tr>
					<tr>
				    <td class="td_zxy01" >呈 送：</td>
				    <td class="td_form02" colspan="3"><r:textfield name="head.chengson" id="chengson" cssClass="input" /></td>
				  </tr>
					<tr>
						<td class="td_zxy01">
							编号：
						</td>
						<td class="td_form02">
							<s:textfield name="head.bianhao" id="bh" size="30" cssClass="input"  disabled="true"/>
						</td>
						<td class="td_zxy01" >
							急缓程度：
						</td>
						<td class="td_form02">
							<r:select name="head.jhcd" list="#{0:'一般',1:'急',2:'特急'}" id="jhcd" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							拟稿人：
						</td>
						<td class="td_form02">
							<s:textfield name="head.nigaorenxm" id="nigaorenxm"  disabled="true" cssClass="input"  />
							<s:hidden name="head.nigaoren" />
						</td>
						<td class="td_zxy01">
							<font color="#FF0000"><strong>*</strong></font>联系电话：
						</td>
						<td class="td_form02">
							<r:textfield name="head.lxdh" id="lxdh" size="30"  cssClass="input" onblur="checkPhone(this)"/>
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							拟稿日期：
						</td>
						<td class="td_form02">
							<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
        					<s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" disabled="true" />
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
			<td class="td_zxy01">会签部门：</td>
		    <td class="td_form02" colspan="3" >
		    <r:textfield name="head.hqbm" id="hqbmvalue"  disabled="true"  cssClass="input2"/>
		       <s:hidden  name="head.hqbmid" id="hqbmids"/>
		         <e:pc id="xzhq">
		     	  <img src="<%=basePath%>resource/ProjectImages/search.gif" onclick="openTreeByType();" width="21" height="20" align="absmiddle"/>  
		     	 </e:pc> 
		      <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>	 
		     	  </td>
		 </tr>	
				</table>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right">
							<table id="purchaselist"> </table>
							<div id="pgtoolbar1"> </div>
						</td>
					</tr>
				</table>
				<!-- ------------------------------- 办理依据 --------------------------------- -->
				<%@ include file="/inc/according.inc"%>  
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<e:opinion id="test" width="100%">
						<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}"  value="" text="批示意见："></e:opinionPart>
						<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}"  name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
						<e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}" name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
						<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见：">
        				</e:opinionPart>
						<!-- ==========================工作流信息项======================================= -->
						<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
						<!-- =========================================================================== -->
						<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			   		</e:opinion>
			   	</table>
			   	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="newtable" > 
					<tr>
						<td class="td_zxy01">备注：</td>
						<td class="td_zxy03" colspan="5">
							<r:textarea name="head.beizhu" id="beizhu" style="width:94%" rows="4" />
						</td>
					</tr>
				</table>
				<!-- ------------------------------- 文件上传 --------------------------------- -->
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>	
		<%@ include file="/inc/file.inc"%>
		<%@ include file="/inc/file_huiqian_end.inc"%>	
		<%@ include file="/inc/listMessage.inc"%>		
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:'<%=basePath%>zccz/dealTrace1Head_findCzXmByCldId.do?headId=${head.id}',
	datatype: "json",
	mtype:"POST",
   	colNames: ['xmId','编号', '处置项目名称','拟稿部门', '处置时限', 
   	'建议处置回收金额', '预计处置费用', '实际处置收入', '实际处置费用', '是否全部结案', '是否签署转让协议','卡片是否减少'],
	colModel: [
		{name: 'xmId',index: 'xmId',align: "center",editable: true,hidden:true}, 
		{name: 'bh',index: 'bh',align: "center"}, 
		{name: 'czxmmc',index: 'czxmmc',align: "center"}, 
		{name: 'ngbmmc',index: 'ngbm',align: "center"}, 
		{name: 'czsx',index: 'czsx',align: "center"}, 
		{name: 'yjczhsje',index: 'jyczhsje',align: "center",formatter:'number'}, 
		{name: 'yjczfy',index: 'yjczfy',align: "center",formatter:'number'}, 
		{name: 'sjczsr',index: 'sjczsr',align: "center",formatter:'number'}, 
		{name: 'sjczfy',index: 'sjczfy',align: "center",formatter:'number'}, 
		{name: 'sfqbja',index: 'sfqbja',align: "center",formatter:'string'}, 
		{name: 'sfqszczrxy',index: 'sfqszczrxy',align: "center",editable: true,edittype:"select",editoptions:{value:":;1:是;0:否"}}, 
		{name: 'kpsfjs',index: 'kpsfjs',align: "center",editable: true,edittype:"select",editoptions:{value:":;1:是;0:否"}}],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '结案项目列表（单位：元）',
	editurl: '<%=basePath%>zccz/dealTrace1Head_editCzXm.do?headId=${headId}',
	<e:pc id="selectRow">
	onSelectRow: function(xmId){
		var datas1 = jQuery("#purchaselist").getDataIDs();
		if(document.getElementById('datas2').value==xmId){
			for(var i=0;i<datas1.length;i++){
				jQuery('#purchaselist').jqGrid('restoreRow',datas1[i]);
			}
			document.getElementById('datas2').value="";
			return;
		}else{
			for(var i=0;i<datas1.length;i++){
				if(datas1[i]!=xmId){
					jQuery('#purchaselist').jqGrid('restoreRow',datas1[i]);
				}
			}
		}
		jQuery('#purchaselist').jqGrid('editRow',xmId,true);
		document.getElementById('datas2').value=xmId;
		$("select.editable").change(function(){
			jQuery('#purchaselist').jqGrid('saveRow',xmId);
			document.getElementById('datas2').value="";
		});
	},
	</e:pc>
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	ondblClickRow:function(rowid){
		lookdblclickAss(rowid);
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#purchaselist").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#purchaselist").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
//（处理）新建正文
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "申请结案正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"申请结案正文"); 
		}
		
		//合成正文
		function hechengzhengwen(){
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "申请结案正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
		}
		
		function afterWordSubmit(){
		  isQiChaoCzbg = true;
		}
		function beforeWordSubmit(){
		  //wordStatus = 2;
		}
			
		function hechengHead(){
		    //处置项目名称
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengson").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bh").value,2,false,false,false,false);
	
		}
		
		function hechengBottom(){
		 	var strDate = "<%=strDate%>";
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeBottom.find.execute("￥￥HCRQ",false,false,false,false,false,true,false,false,strDate,2,false,false,false,false);
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
			$.ajaxSetup({async:true});
		}
</script>
