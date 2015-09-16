<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzCztzfaXx"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.StGlbt"%>
<%
	String userTid = (String) request.getAttribute("userTid");
	String headId = (String) request.getAttribute("headId");
	String zixunType = (String) request.getParameter("zixunType");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(
			headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus
			.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stgl/caiwu/caiwu.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
	<%
		if (workflowVO.taskName.equals("拟稿部门综合处理")) {
			counterSignBtnDisplay = true;
		}
	%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath%>"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>重大财务事项</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "stglWorkflow";
	actionPath = "zdcwWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>

<script type="text/javascript">

</script >
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
<table  border="0" cellpadding="0" cellspacing="0" id="TableBox5" style="display: none;">
<tr><td  colspan="16"><a href="#" onclick="DeleteTr_base();return false;">&nbsp;x&nbsp;</a>申请事项类型：<e:select parRefKey="EVENT_TYPE" list="#{}" name="stGlbt.CSqsxlx" value=""/>申请金额（元）：<s:textfield  name="stGlbt.sqje"  style="width:90" maxlength="16" value=""  onblur="checkFloat(this);"/>申请说明：<s:textfield  name="stGlbt.sqsm"  style="width:400" value=""/>
</td></tr>
</table>
<s:form name="myform" id="myform"  action="caiwu_saveHead">
<s:hidden name="head.zixuntype"  id="zixuntype"  value="%{#request.head.zixuntype}"/>
<s:hidden name="head.id" id="headId" value="%{#request.headId}" />
<s:hidden name="head.lcmc"  id="lcmc"  value="%{#request.head.lcmc}"/>
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden name="head.stId" id="stId" />
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.Id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- 意见域、 依据和文件上传需要表单id -->

<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath() + "/" + actionSpaceName
			+ "/" + actionPath + "_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/stgl/caiwu_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader + abandonMethod + ".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader + endMethod + ".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader + participationMethod + ".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/stgl/caiwu_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader + draftParticipationMethod + ".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/stgl/caiwu_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/stgl/caiwu_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl"  value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="stgl/caiwu_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader + "getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="stgl/caiwu_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
	<br/>
	<div align="center"><span class="STYLE1">中国建银投资有限责任公司实体重大财务事项<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span></div>
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->

	<hr/>
	<table width="100%" border="0" class="newtable" id="newtable" cellpadding="2" cellspacing="0" align="center">
        <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标 题：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.biaoti" id="head.biaoti"   cssClass="input" /></td>
        </tr>
        <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>呈送：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.chengsong" id="head.chengsong"   cssClass="input" /></td>
        </tr>
		<tr>
		  <td height="24"  class="td_zxy01" align="center">编号：</td>
		  <td class="td_zxy02">
		  <s:textfield name="head.bianhao" size="35" id="head.bianhao"   cssClass="input" disabled="true"/>
		  </td>
		  <td class="td_zxy01"> 急缓程度：</td>
		  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="head.jhcd" id="head.jhcd" /></td>
	  	</tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_zxy02">
			<s:hidden name="head.ngr"></s:hidden>
			<s:textfield name="head.ngrxm"  id="ngrxm"  readonly="true" cssClass="input"/>
		  </td>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
          <td class="td_zxy02"><s:textfield name="head.lxdh" id="head.lxdh"    cssClass="input" onblur="checkPhone(this);"/></td>
        </tr>
      <tr>
		<td class="td_zxy01">拟稿日期：</td>
	    <td  class="td_zxy02">
	 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield id="ngrq" name="head.ngrq"  value="%{#draftDate}" readonly="true"  cssClass="input"/></td>
        <td  width="120"  class="td_zxy01">拟稿部门：</td>
        <td class="td_zxy02">
       	 		<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    		<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
		</td>
      </tr> 
      <tr>
		<td class="td_zxy01">会签部门：</td>
	    <td class="td_zxy02" colspan="3" >
	       <r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"  cssClass="input"/>
	       <s:hidden  name="head.hqbmid" id="hqbmids"/>
	       <e:pc id="xzhq">
	     	  <img src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif" onclick="openTreeByType('hqbm');" width="21" height="20" align="absmiddle"/> 
	       </e:pc>
	        <%
	        	if (inCounterSign) {
	        %><e:countersign biaodanId="%{#request.biaodanid}" /><%
	        	}
	        %>
	     </td>
	  </tr>
      <!--  
		<%if("3".equals(zixunType)) {%>
		 <tr>
			<td class="td_zxy01">建银实业内部会签部门：</td>
		    <td class="td_form02" colspan="3" >
		    <r:textfield name="head.syhqbm" id="hqbmvalue1" readonly="true"  cssClass="input2"/>
		       <s:hidden  name="head.syhqbmid" id="hqbmids1"/>
				 <e:pc id="syxzhq">	
		     	  <img src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif" onclick="openTreeByType1();" width="21" height="20" align="absmiddle"/>
				</e:pc>
			</td>
		 </tr>	
		 <%} %>-->
    </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
        <td>    
	  <div id="stxxDiv11" class="ui-jqgrid-view ui-jqgrid ui-widget ui-widget-content ui-corner-all"  style="width:100%;">
    	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"><a href="javascript:changeDivStatus('stxxDiv11');" role="link" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title">实体信息</span></div>
	  	<div id="div11" class="ui-jqgrid-bdiv" style="display:block" > 
	 <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" >
	  	<tr>
          <td width="120" class="td_zxy01">资产编号：</td>
          <td   class="td_zxy02"><s:textfield name="head.zcbh" id="zcbh"  readonly="true" label=""  cssClass="input"/></td>
          <td  width="120"  class="td_zxy01">实体名称：</td>
          <td class="td_zxy02"><s:textfield name="head.stzwmc" id="stzwmc" readonly="true" label="" cssClass="input"/></td>
        </tr>
		<tr>
          <td   class="td_zxy01">地区：</td>
          <td   class="td_zxy02"><s:textfield name="head.diqu" id="diqu"  readonly="true" label="" cssClass="input"/></td>
          <td    class="td_zxy01">办公地址：</td>
          <td class="td_zxy02"><s:textfield name="head.bgdz" id="bgdz" readonly="true"   label="" cssClass="input"/></td>
        </tr>
     </table>
    </div>
    </div>
   </td></tr>
   </table>  
	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" >
     	<tr>
        <td width="11%" class="td_zxy01">重大财务事项：</td>
        <td colspan="3" class="td_form02"><table   border="0" cellspacing="0" cellpadding="0"   >
          <tr>
            <td >
            <e:pc id="cwsxmx">
            			<%
            				if (!inCounterSign) {
            			%>  
							<a href="#" onclick="AddTable_base();return false;">&nbsp;+ &nbsp;</a>
						<%
							}
						%>		
            </e:pc>
            	重大财务事项明细
            </td> 
          </tr>
        </table>
	<table  border="0" cellpadding="0" cellspacing="0" id="TableBox2">
	        	<s:iterator var="stGlbt"  value="%{#request.stGlbtList}" >
		            <tr>
		              <td  colspan="16">
		              <e:pc id="cwsxmx">
						<%
							if (!inCounterSign) {
						%>   
		             	 	<a href="#" onclick="DeleteTr_base();return false;">&nbsp;x&nbsp;</a>
						<%
							}
						%>		             	 	
		              </e:pc>
		              	申请事项类型：
		              <e:select parRefKey="EVENT_TYPE" list="#{}" name="stGlbt.CSqsxlx"  disabled="true" value="%{#stGlbt.CSqsxlx}"/>                 
		                申请金额（元）：
		                <s:textfield  name="stGlbt.sqje" value="%{#stGlbt.sqje}" readonly="true"  style='width:90' />
		                申请说明：
		                <s:textfield  name="stGlbt.sqsm" value="%{#stGlbt.sqsm}" readonly="true"  style='width:400' />
		              </td>
		            </tr> 
	       		</s:iterator>
		 </table>
        </td>
      </tr> 
    </table>
    <%@ include file="/inc/according.inc"%> 
	<e:opinion id="test" width="100%">
        <e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
        <e:opinionPart id="OPERATION_GROUP"  biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
        <e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}"  name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
        <e:opinionPart id="MEETING_DEPT"  biaodanid="%{#request.biaodanid}" name="MEETING_DEPT" value="" text="会签部门意见：">
        </e:opinionPart>
 			<!-- ==========================工作流信息项======================================= -->
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
			<!-- =========================================================================== -->
        <e:opinionPart id="DRAFT_DEPT"  biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
	    <e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
    </e:opinion>
    <%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>
	<%@ include file="/inc/file.inc"%>
	<%@ include file="/inc/file_huiqian_end.inc"%>
	<%@ include file="/inc/listMessage.inc"%>
</s:form>
<SCRIPT language="JavaScript" type="text/JavaScript"> 
		
	//窗口打开方式
	var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
	//添加动态表格		
	var xxx;
	var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
	var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
	if("0"=="<%=status%>"){
	    	var isNew = true;
	  }else{
	    	var isNew = false;
	} 
	//必填项控制
	function checkEAMFormJSMethod(){
		var ti = document.getElementById("head.biaoti");
	    var stId = document.getElementById("stId").value;
	    var  bianhao= document.getElementById("head.bianhao");
	    var  lxdh= document.getElementById("head.lxdh");
	    var  chengsong= document.getElementById("head.chengsong");
		if(ti.value == null || ti.value.length == 0){
			alert("标题不能为空！");
			ti.focus();
	      	return false;
	    }else if(chengsong.value == null || chengsong.value.length == 0){
			alert("呈送不能为空！");
			chengsong.focus();
	      	return false;
	    }else if(lxdh.value == null || lxdh.value.length == 0){
			alert("联系电话不能为空！");
			lxdh.focus();
	      	return false;
	    } else if(stId==null||stId==""){
	    	alert("请选择实体！")
	      	return false;
	    <e:pc id="scbh">
	    }else if(bianhao.value == null || bianhao.value.length == 0){
	    	alert("请生成编号！")
	      	return false;
      	</e:pc>
		<e:pc id="xinjianzhengwen"> 
		}else if(isNew){
		    	alert("请先新建正文");
	    	 	return false;
		</e:pc>
		}
	    return true;
	}	
	$(function(){
		window.parent.clearPanelTool();
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
		xxx =  $("#TableBox5").html();
		
	    jQuery("#file_list").setGridWidth($("#newtable").width());
	    jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
	    jQuery("#file_huiqianlist").setGridWidth($("#newtable").width());
	    jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
	    $(window).bind('resize', function(){
			jQuery("#file_list").setGridWidth($("#newtable").width());
			jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
			jQuery("#file_huiqianlist").setGridWidth($("#newtable").width());
			jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
	    });
		<%
		    if(!inCounterSign){
		%>
		
			//生成编号按钮
		  	<e:pc id="scbh">
				var headBHGen = document.getElementById("head.bianhao").value;
				if(headBHGen == null || headBHGen.length == 0){
					window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
				}else{
					//合成正文按钮
						<e:pc id="hechengzhengwen">
						   <%
						    if(!status.equals("2")){
						   %>
							window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
							<%
							   }
							%>
					</e:pc>
				}
			</e:pc>
			
			<e:pc id="scfj">
		    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
										{"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			</e:pc>
			<e:pc id="blyj">
			//添加按钮  "#gview_list > .ui-jqgrid-titlebar
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			</e:pc>
			
			//办结按钮
			<e:pc id="banjie">
				var buttonStr_banjie = '[{"buttonHandler":"mainWindow.completeHead","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
				window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
			</e:pc>
			//（处理）新建正文按钮
			<e:pc id="xinjianzhengwen">
				var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文"%>"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
			
			//查看正文按钮
			<e:pc id="chakanzhengwen">
				var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
		<%
		  	}else{
		%>  	
			//查看正文按钮
			<e:pc id="chakanzhengwen">
				var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
		<%}%>
		
		//选择实体操作
	    <e:pc id="xzst">
			var buttonStglxxJSonString = '[\<%if(!inCounterSign){%>{"buttonHandler":"selectEntity","buttonIcon":"icon-add","buttonText":"选择实体"},\
		                                <%}%>{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体"}\
		    ]';
		   addButtons(jQuery("#stxxDiv11 > .ui-jqgrid-titlebar"), buttonStglxxJSonString);
		</e:pc>
		//查看实体操作
	    <e:pc id="ckst">
			var buttonStglxxJSonString = '[ {"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体"}\
		    ]';
		   addButtons(jQuery("#stxxDiv11 > .ui-jqgrid-titlebar"), buttonStglxxJSonString);
		</e:pc>
	});
	
	function AddTable_base(){
		$("#TableBox2").append(xxx);
	}
	function DeleteTr_base(){
			TableBox2.deleteRow();
	}
	 function getWidthAndHeigh(resize) {
                var iframeHeight = document.body.clientHeight;
                var iframeWidth = document.body.clientWidth;
                var browser=navigator.appName;
             // chrome
                if (browser == "chrome") {
                        iframeWidth -= 16;
                        iframeHeight -= 85;
                  }
                // firefox
                else if (browser == "firefox") {
                        iframeWidth -= 15;
                        iframeHeight -= 85;
                        if (resize) {
                                iframeWidth += 18;
                                iframeHeight += 13;
                        }
                } 
                // IE
                else {
 
                        iframeWidth -= 12;
                        iframeHeight -= 83;
                        if (resize) {
                                iframeHeight += 15;
                                iframeWidth += 10;
                        }
                }
                return {width: iframeWidth, height: iframeHeight};
        }
        
	//选择实体	
	function selectEntity(){
		var zixunType =document.getElementById("head.zixuntype").value;
		window.open('<%=basePath%>stgl/weihu_listEntities.do?' 
		 + 'option=stgl&' 
		 + 'entityStid=' + $("#stId").val() 
		 + '&zixunType=' + zixunType,'',winOpenStr);
	}
	//查看实体信息
	function stView(){
			var stlx = $("#zixuntype").val();
			var stid = $("#stId").val();
			if(stid==null||stid==""){
				alert("未选择实体！");
			}else {
				if(stlx == "1"){
					window.open('<%=basePath%>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1'+ '&rework=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath%>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1'+ '&rework=1','',winOpenStr);
				}
			}
	}
	
	//回调函数
	var zzqkViewObj;
	function setLinkEntitiesRel(objString){
		var reobj = eval('(' + objString + ')');
		document.getElementById("stId").value = reobj.LinkEntitiesRel[0].id == null?"":reobj.LinkEntitiesRel[0].id;
		document.getElementById("zcbh").value = reobj.LinkEntitiesRel[0].zcbh;
		document.getElementById("stzwmc").value = reobj.LinkEntitiesRel[0].stzwmc;
		document.getElementById("diqu").value = reobj.LinkEntitiesRel[0].CShengfen == null?"":reobj.LinkEntitiesRel[0].CShengfen;
		document.getElementById("bgdz").value = reobj.LinkEntitiesRel[0].bgdz;
		zzqkViewObj = reobj.LinkEntitiesRel[0].zzqk;
	}
	
		function openTreeByType(){//打开树，根据类型打开类型  
			var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + document.getElementById("hqbmids").value;
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		function getCallBack4Tree(ids,value){
			document.getElementById("hqbmvalue").value = value;
			document.getElementById("hqbmids").value = ids;
		}
		
		//办结
		function completeHead(){
			if(confirm("确认办结！")){
				var headId=$("#headId").val();
				$.post("<%=basePath%>stgl/caiwu_completeHead.do",{
					"headId":headId
				},function(data){
					if(data == "success"){
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.sheetId.value = document.getElementById("head.bianhao").value;
					document.myform.outCome.value = "流程办结";
					document.myform.submit();
						alert("办结成功！");
					}else{
						alert("未办结！");
					}
				});
			}
		}
		
	  function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
	//（处理）新建正文
	function openzhengwen(){
		isNew = false;
		wordTemplate('bank_Template', document.getElementById("myform"),false,true, "重大财务正文"); 
		//修改按钮名称为“处理正文”
		window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
		window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
	}
	//查看正文
	function viewzhengwen(){
		wordTemplate('bank_Template', document.getElementById("myform"),true,false,"重大财务正文"); 
	}
	
	//合成正文
	function hechengzhengwen(){
	    var bianhao = document.getElementById('head.bianhao').value;
		if(bianhao=='' || bianhao==null){
		alert("请先生成编号");
		return false;
		}
		MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "重大财务正文",'hechengHead()','hechengBottom()');
		window.parent.removeObj("#hczwButton");
		window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
	}
	function hechengHead(){
		MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("head.chengsong").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
		MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("head.bianhao").value,2,false,false,false,false);
		
		MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("head.biaoti").value,2,false,false,false,false);
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
			
	//部门名称和部门id之间的转换
	function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
	}	
	//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		$.post("<%=basePath%>stgl/caiwu_createNum.do",{
			"headId":headId
		},function(data){
			document.getElementById("head.bianhao").value = data;
			window.parent.removeObj("#shengchenButton");
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		});
	}
	
	//点击保存时 标题不能为空
	function checkEAMFormTitle(){ 		
	   var biaoti = document.getElementById("head.biaoti"); 		
		   if(biaoti.value == null || biaoti.value.trim().length == 0){ 			
		   alert("标题不能为空！"); 			
		   biaoti.focus(); 	      
		   return false; 	    
		   } 	     
	   return true; 	
	}	 

</SCRIPT>
</body>
</html>
