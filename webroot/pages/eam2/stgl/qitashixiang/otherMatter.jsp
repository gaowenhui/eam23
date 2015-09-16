<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%@ page import="com.tansun.eam2.common.model.orm.bo.StGlbt"%>
<%
	String userTid = (String) request.getAttribute("userTid");
	String headId = (String)request.getAttribute("headId");
	String zixunType = (String)request.getParameter("zixunType");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stgl/qitashixiang/qita.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
	<%
	if(workflowVO.taskName.equals("拟稿部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>其他事项审批</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "stglWorkflow";
	actionPath = "qtWorkflow";
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
var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
if("0"=="<%=status%>"){
    	var isNew = true;
  }else{
    	var isNew = false;
} 

$(function(){	
   	
<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
    jQuery("#file_list").setGridWidth($("#newtable").width());
    jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
    jQuery("#file_huiqianlist").setGridWidth($("#newtable").width());
    jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
    $(window).bind('resize', function(){
		jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
		jQuery("#file_list").setGridWidth($("#newtable").width());
		jQuery("#file_huiqianlist").setGridWidth($("#newtable").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
    });
<%
    if(!inCounterSign){
%>      
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

	//（处理）新建正文按钮
	<e:pc id="xinjianzhengwen">
		var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
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
<%
   }
%>		

		
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
	
	//控制联动
	var ywlx = document.getElementById("head.sfsjfy").value;
	if(ywlx == "是"){
		document.getElementById("fymx").style.display="block";
		
	}else{
	document.getElementById("fymx").style.display="none";	
	}
});
</script >
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
	 <table id="TableBox1" width="100%" border="0" cellspacing="0" style="display: none;" cellpadding="0">
	   <tr>
	     <td class="td_form02">
	     	<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
	     	费用种类:&nbsp;
	     	<e:select parRefKey="ENTITY_EXPENSES_TYPE" list="#{}" name="stGlbt.fyzl" value=""/>
	      	申请金额（元）:&nbsp;
	      	<s:textfield  name="stGlbt.sqje" maxlength="16" onblur='applyMoney()' style='width:100'  value="" />
	      	审定金额（元）:&nbsp;
	      	<s:textfield name="stGlbt.sdje"  maxlength="16"  onblur='checkMoney()'  style='width: 100'  value="" />
	      	申请说明:&nbsp;
	      	<s:textfield name="stGlbt.sqsm"  style='width: 150' value="" />
	      </td>
	   </tr>
	  </table>
<s:form  method="post" name="myform" action="">
<s:hidden name="head.id" id="headId" value="%{#request.headId}" />
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden name="head.stId" id="stId" />
<s:hidden name="head.zixuntype"  id="zixuntype"  value="%{#request.head.zixuntype}"/>
<s:hidden name="head.lcmc"  id="lcmc"  value="%{#request.head.lcmc}"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<r:userhidden id="userid" />
<s:set name="biaodanid" value="head.Id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- 意见域、 依据和文件上传需要表单id -->
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/stgl/qita_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/stgl/qita_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/stgl/qita_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/stgl/qita_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl"  value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="stgl/qita_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="stgl/qita_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
    <br/><br/>
	<div align="center"><span class="STYLE1">中国建银投资有限责任公司其他事项审批<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span></div>
	
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->

	<hr/>
	  <table width="100%"   border="0" class="newtable"  id="newtable"  name="newtable" cellpadding="2" cellspacing="0" align="center">
         <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标 题：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.biaoti"  id="head.biaoti"   cssClass="input" /></td>
        </tr>
        <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>呈送：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.chengsong"  id="head.chengsong"   cssClass="input" /></td>
        </tr>
		<tr>
		  <td height="24"  class="td_zxy01" align="center">编号：</td>
		  <td class="td_zxy02">
		  <s:textfield name="head.bianhao" size="35" id="head.bianhao" cssClass="input" disabled="true"/>
		  </td>
		  <td class="td_zxy01"> 急缓程度：</td>
		  <td class="td_zxy02"><s:select list="{'一般','急','特急'}" name="head.jhcd" id="head.jhcd"/></td>
	  	</tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_zxy02">
			<s:hidden name="head.ngr"></s:hidden>
			<r:textfield name="head.ngrxm"  id="head.ngrxm"  cssClass="input"  readonly="true"  value="%{#request.head.ngrxm}"/>
		  </td>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
          <td class="td_zxy02"><r:textfield name="head.lxdh"  id="head.lxdh" type="text" cssClass="input" onblur="checkPhone(this);"/></td>
        </tr>
	      <tr>
			<td class="td_zxy01">拟稿日期：</td>
		    <td  class="td_zxy02">
		 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
				<s:textfield  name="head.ngrq"  id="head.ngrq" readonly="true" cssClass="input"  value="%{#draftDate}"  /></td>
	        <td  width="120"  class="td_zxy01">拟稿部门：</td>
	        <td class="td_zxy02">
	       		<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    		<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
			</td>
	   </tr> 
		<tr>
          <td  width="120" class="td_zxy01">业务类型：</td>
          <td  class="td_zxy02"><r:textfield name="head.ywlx" id="head.ywlx" cssClass="input"   label=""/></td>
          <td  width="120"  class="td_zxy01">是否涉及费用：</td>
          <td  class="td_zxy02">
         	<r:select name="head.sfsjfy"  id="head.sfsjfy"   list="{'是','否'}"  value="%{#request.head.sfsjfy}"   label="" onChange="sfsjfy();return false;" />
          </td>
        </tr>
	  <tr id="fymx" style="display:block">
	    <td class="td_zxy01"> 费用明细： </td>
	    <td colspan="3" class="td_zxy02"><table>
	      <tr>
	        <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="td_f orm02">
		            <e:pc id="je">
						<%
						    if(!inCounterSign){
						%>  
		           			 <a href="javascript:AddTable()">&nbsp;+&nbsp;</a>
	           			 <%
						   }
						%>
					</e:pc>
	              &nbsp;申请金额合计（元）:&nbsp;
	              <s:textfield  name="head.sqjehj"  id="totalSqje"  style="width: 100" readonly="true" />
	              &nbsp;审定金额合计（元）:&nbsp;
	              <s:textfield  name="head.sdjehj"  id="totalSdje"  style='width: 100' readonly="true"  />            </td>
	          </tr>
	        </table>
	              <table id="TableBox" width="100%" border="0" cellspacing="0" cellpadding="0">
		              <s:iterator var="stGlbt"  value="%{#request.stGlbtList}" >
		                <tr>
		                  <td class="td_zxy02">
				            <e:pc id="je">
								<%
								    if(!inCounterSign){
								%>  
			                  		<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
					            <%
								   }
								%>
							</e:pc>
		                  	费用种类:&nbsp;
		                  	<e:select parRefKey="ENTITY_EXPENSES_TYPE" list="#{}" name="stGlbt.fyzl"  disabled="true" value="%{#stGlbt.fyzl}"/>
		                   	申请金额（元）:&nbsp;
		                   	<s:textfield  name="stGlbt.sqje"  onblur='applyMoney()'  style='width:100' readonly="true" value="%{#stGlbt.sqje}"/>
		                   	审定金额（元）:&nbsp;
		                   	<s:textfield name="stGlbt.sdje" onblur='checkMoney()'   style='width: 100'  readonly="true" value="%{#stGlbt.sdje}"/>
		                   	申请说明:&nbsp;
		                   	<s:textfield name="stGlbt.sqsm"   style='width: 150'  readonly="true" value="%{#stGlbt.sqsm}" />
		                   </td>
		                </tr>
		             </s:iterator>
                 </table>
          </td>
	      </tr>
	    </table></td>
	  </tr>
	 <tr>
		<td class="td_zxy01">会签部门：</td>
	    <td class="td_zxy02" colspan="3" >
	    <r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"  cssClass="input"/>
	       <s:hidden  name="head.hqbmid" id="hqbmids"/>
	       <e:pc id="xzhq">
	     	  <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('hqbm');" width="21" height="20" align="absmiddle"/>
	       </e:pc>
	        <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>
	    </td>
	  </tr>	
      </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
        <td>
	<div id="stxxDiv11" class="ui-jqgrid-view ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width:100%;">
     <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"><a href="javascript:changeDivStatus('stxxDiv11');" role="link" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title">实体信息</span></div>
	<div  class="ui-jqgrid-bdiv" style="display:block" >
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" class="newtable" >
	  	<tr>
          <td class="td_zxy01">资产编号：</td>
          <td   class="td_zxy02"><s:textfield name="head.zcbh" id="zcbh"  cssClass="input"  readonly="true" label=""/></td>
          <td   class="td_zxy01">实体名称：</td>
          <td class="td_zxy02"><s:textfield name="head.stzwmc" id="stzwmc" cssClass="input"  readonly="true" label=""/></td>
        </tr>
       <!--  <tr>
          <td  class="td_zxy01">股权构成：</td>
          <td class="td_zxy02">
          <s:hidden name="head.gqgc" id="gqgc"  />
          <input name="gqqk" type="button" onclick="viewGqgc();"   value="查看" /></td>
          <td class="td_zxy01">资质情况：</td>
          <s:hidden name="head.zzqk" id="zzqk"  />
          <td class="td_zxy02"><input name="zzqk" type="button" onclick="viewZzqk();"   value="查看" /></td>
        </tr> -->
		<tr>
          <td   class="td_zxy01">地区：</td>
          <td   class="td_zxy02"><s:textfield name="head.diqu" id="diqu" cssClass="input"   readonly="true" label=""/></td>
          <td    class="td_zxy01">&nbsp;</td>
          <td class="td_zxy02">&nbsp;</td>
        </tr>
		<!--  <tr>
          <td   class="td_zxy01">人数：</td>
          <td  class="td_zxy02"><s:textfield name="head.strs"  id="strs" cssClass="input" readonly="true"   label=""/></td>
          <td     class="td_zxy01">账面投资（万元）：</td>
          <td class="td_zxy02"><s:textfield name="head.zmtz"  id="zmtz" cssClass="input"  readonly="true" label=""/></td>
        </tr>
		<tr>
          <td  class="td_zxy01">委托管理机构：</td>
          <td  class="td_zxy02"><s:textfield name="head.CWtgljg"  id="CWtgljg"  cssClass="input"  readonly="true" label=""/></td>
          <td    class="td_zxy01">&nbsp;</td>
          <td class="td_zxy02">&nbsp;</td>
        </tr>
		 <tr>
		   <td  class="td_zxy01">出资与工商年审情况：</td>
		   <td colspan="3" class="td_zxy02"><s:textfield name="head.czygsnsqk"  id="czygsnsqk"  readonly="true" cssClass="input" /></td>
	    </tr> -->
      </table>
     </div>
     </div>
        </td>
        </tr>
      </table>
      <div width="100%" id="tableWidth"/>	       
	    <e:opinion id="test" width="100%">
	        <e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
	        <e:opinionPart id="OPERATION_GROUP"  biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
	        <e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}"  name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
	        <e:opinionPart id="MEETING_DEPT"  biaodanid="%{#request.biaodanid}" name="MEETING_DEPT" value="" text="会签部门意见：">
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
	
	  function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
	
	//股权情况
	function viewGqgc(){
		var gqgcViewObj = $("#gqgc").val();
		if(gqgcViewObj != null && gqgcViewObj.length > 1 ){				
			var gqgcarray = gqgcViewObj.split('<#>');
			var i = 0;
			var htmlObj = "<table >";
			htmlObj += '<tr><td width=80>股东名称</td><td width=100>股东性质</td><td width=100>持股比例（%）</td><td>报告日期</td><td>持股数量</td><td>本部是否控股</td></tr>';
			for(i = 0; i< gqgcarray.length-1; i++){
				var row = gqgcarray[i].split("#%#");
				htmlObj += '<tr>';
				htmlObj += "<td>" + row[0] + "</td>";
				htmlObj += "<td>" + row[1] + "</td>";
				htmlObj += "<td>" + row[2] + "</td>";
				htmlObj += "<td>" + row[3] + "</td>";
				htmlObj += "<td>" + row[4] + "</td>";
				htmlObj += "<td>" + row[5] + "</td>";
				htmlObj += '</tr>';
			}
			htmlObj += '</table>'
			$('#dialogZzqk').html(htmlObj);
			$('#dialogZzqk').dialog('open');
		}else{
			alert("没有股权构成信息！");
		}
	}	
	//窗口打开方式
	var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";		
	
	var addStr;
	$(function(){
		$("#ngrq").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    
	    addStr = $("#TableBox1").html();
	});

	function qq(){
	var x= document.getElementById("ywlx");
		var y = x.selectedIndex;
		if (y =='1' ){
 
			sp.style.display="none";
		}else{
 
			sp.style.display="block";
		}		
	}
	var i = 1;

	function AddTable(tableId){
		$("#TableBox").append(addStr);
	}
	
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		$(rowObj).remove();
		applyMoney();
		checkMoney();
	}
	
	function applyMoney(){
		var values=0.0;
		var inputs = document.getElementsByName('stGlbt.sqje');
		for(i=0;i<inputs.length;i++){
			var v = inputs[i].value;
			var flag = checkFloatApplyMoney(inputs[i]);
			if(flag == false){
				return false;
			}
			if(v!=""){
				values = values+parseFloat(v);
			}
		}
		document.getElementById("totalSqje").value=values;
	}
	
	function checkMoney(){
		var checkValues=0.0;
		var inputs = document.getElementsByName('stGlbt.sdje');
		for(i=0;i<inputs.length;i++){
			var v = inputs[i].value;
			var flag = checkFloatApplyMoney(inputs[i]);
			if(flag == false){
				return false;
			}
			if(v!=""){
				checkValues = checkValues+parseFloat(v);
			}
		}
		document.getElementById("totalSdje").value=checkValues;
	}
 
	// 检验float （金额）
	function checkFloatApplyMoney(thisFloat){
		var theFloat =thisFloat.value;
		var flag = isFloat(theFloat);
		if(flag==false){
			alert('请输入正确的金额');
			thisFloat.focus();
			return false;
		}
		for(var i = 0; i < theFloat.length;i++){
			var ch=theFloat.charAt(i);
			if(ch=='.'){
				if(theFloat.length - i > 3){
					alert('小数点后面最多只能有两位');
					thisFloat.focus();
					return false;
				}
			}
		}
	}
	
 		//日期转换和资质情况
		$(function(){
			$("#ngrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
			    });			    
			$('#dialogZzqk').dialog({title:'资质情况'});
			$('#dialogZzqk').dialog('close');
			$('#dialogGqgc').dialog({title:'股权构成'});
			$('#dialogGqgc').dialog('close');
		});
		
		//选择实体	
		function selectEntity(){
			var zixunType =document.getElementById("head.zixuntype").value;
			window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
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
						window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1'+ '&rework=1','',winOpenStr);
					}
					if(stlx == "0" || stlx == "3"){
						window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1'+ '&rework=1','',winOpenStr);
					}
				}
		}
		
		//回调函数
		
		function setLinkEntitiesRel(objString){
			reobj = eval('(' + objString + ')');
			document.getElementById("stId").value = reobj.LinkEntitiesRel[0].id == null?"":reobj.LinkEntitiesRel[0].id;
			document.getElementById("zcbh").value = reobj.LinkEntitiesRel[0].zcbh == null?"":reobj.LinkEntitiesRel[0].zcbh;
			document.getElementById("stzwmc").value = reobj.LinkEntitiesRel[0].stzwmc == null?"":reobj.LinkEntitiesRel[0].stzwmc;
			document.getElementById("diqu").value = reobj.LinkEntitiesRel[0].CShengfen == null?"":reobj.LinkEntitiesRel[0].CShengfen;
		}
		
		//资质情况
		function viewZzqk(){
			var zzqkViewObj = $("#zzqk").val();
			if(zzqkViewObj != null && zzqkViewObj.length > 1 ){				
				var zzqkarray = zzqkViewObj.split('<#>');
				var i = 0;
				var htmlObj = "<table >";
				htmlObj += '<tr><td width=80>资质名称</td><td width=100>实体资质等级</td><td width=100>发证单位</td><td>资质到期日期</td></tr>';
				for(i = 0; i< zzqkarray.length; i++){
					var row = zzqkarray[i].split("#%#");
					htmlObj += '<tr>';
					if(""==row[0]||row[0]==null||"null"==row[0]){
						row[0]="&nbsp;";
					}
					if(""==(row[1])||row[1]==null||"null"==row[1]){
						row[1]="&nbsp;";
					}
					if(""==row[2]||row[2]==null||"null"==row[2]){
						row[2]="&nbsp;";
					}
					if(""==row[3]||row[3]==null||"null"==row[3]){
						row[3]="&nbsp;";
					}
					htmlObj += "<td>" + row[0] + "</td>";
					htmlObj += "<td>" + row[1] + "</td>";
					htmlObj += "<td>" + row[2] + "</td>";
					htmlObj += "<td>" + row[3] + "</td>";
					htmlObj += '</tr>';
				}
				htmlObj += '</table>'
				$('#dialogZzqk').html(htmlObj);
				$('#dialogZzqk').dialog('open');
			}else{
				alert("没有资质情况信息！");
			}
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
	
		//办结
		function completeHead(){
			if(confirm("确认办结！")){
				var headId=$("#headId").val();
				$.post("<%=basePath %>stgl/qita_completeHead.do",{
					"headId":headId
				},function(data){
					if(data == "success"){
						document.myform.action = document.getElementById("endUrl").value;
						document.myform.url.value = document.getElementById("endViewUrl").value;
						document.myform.sheetId.value = document.getElementById("head.bianhao").value;
						document.myform.outCome.value = "流程办结";
						document.myform.submit();
					}else{
						alert("未办结！");
					}
				});
			}
		}
		//（处理）新建正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "其他事项审批正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"其他事项审批正文"); 
		}
		
		//合成正文
		function hechengzhengwen(){
		    var bianhao = document.getElementById('head.bianhao').value;
			if(bianhao=='' || bianhao==null){
			alert("请先生成编号");
			return false;
			}
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "其他事项审批正文",'hechengHead()','hechengBottom()');
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
		//部门名称和部门id之间的转换
	function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
	}
		//生成编号
		function createBianhao(){
			var headId=$("#headId").val();
			$.post("<%=basePath %>stgl/qita_createNum.do",{
				"headId":headId
			},function(data){
				document.getElementById("head.bianhao").value = data;
				window.parent.removeObj("#shengchenButton");
				window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			});
		}	
		
		function sfsjfy(){
			var index=document.getElementById("head.sfsjfy").selectedIndex;
			if(index==0){
			   document.getElementById("fymx").style.display="block";
			}else if(index==1){
	           document.getElementById("fymx").style.display="none";
			}
		}		
		
		//保存时判断标题是否为空
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
<div id="dialogZzqk" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
<div id="dialogGqgc" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
</html>

