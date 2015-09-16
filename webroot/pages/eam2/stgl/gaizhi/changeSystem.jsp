<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
	String headId = (String)request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
	String zixunType = (String)request.getParameter("zixunType");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	statusjysy  = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "blank_Template_jysy"); 
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stgl/gaizhi/gaizhi.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->

<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
	<%
	if(workflowVO.taskName.equals("业务管理部门综合处理")){
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
<title>实体改制</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "stglWorkflow";
	actionPath = "stgzWorkflow";
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
window.parent.clearPanelTool();		
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
	
	//生成编号按钮
  	<e:pc id="scbh">
		var headBHGen = document.getElementById("head.bianhao").value;
		if(headBHGen == null || headBHGen.length == 0){
			window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
		}else{
			//合成建银实业正文按钮
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
	
	
	//.......................................合成中国建投正文..................................................
	<e:pc id="jthechengzhengwen">
	<%if(statusjysy.equals("1")){%>
	     var buttonStr_jthechengzhengwen = '[{"id":"hczwjtButton","buttonHandler":"mainWindow.jthechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成中国建投正文"}]';
	     window.parent.prependButtonsFromChildren(buttonStr_jthechengzhengwen,"");
	<%}%>
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
	
	//（处理）新建建银实业正文按钮
	<e:pc id="xinjianzhengwen">
		var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建建银实业正文" : "处理建银实业正文" %>"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	
	//....................................................新建中国建投正文按钮..........................................
	<e:pc id="jtxinjianzhengwen">
	    <%if(statusjysy.equals("0")){%>
		var buttonStr_jtzhengwen = '[{"id":"xjzwjtButton","buttonHandler":"mainWindow.jtopenzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=statusjysy.equals("0") ? "新建中国建投正文" : "处理中国建投正文" %>"}]';
		window.parent.prependButtonsFromChildren(buttonStr_jtzhengwen,"");
		<%}%>
	</e:pc>
	
	//查看建银实业正文按钮
	<e:pc id="chakanzhengwen">
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	
	//...................................................查看中国建投正文按钮..................................................
	<e:pc id="jtchakanzhengwen">
	    <%if(!statusjysy.equals("0")){%>
		var buttonStr_jtzhengwen = '[{"buttonHandler":"mainWindow.jtviewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看中国建投正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_jtzhengwen,"");
		<%}%>
	</e:pc>
<%
  	}else{
%>  	
	//查看建银实业正文按钮
	<e:pc id="chakanzhengwen">
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	
	//...................................................查看中国建投正文按钮..................................................
	<e:pc id="jtchakanzhengwen">
	    <%if(!statusjysy.equals("0")){%>
		var buttonStr_jtzhengwen = '[{"buttonHandler":"mainWindow.jtviewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看中国建投正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_jtzhengwen,"");
		<%}%>
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
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
<s:form  method="post" name="myform" action="gaizhi_saveHead">
<s:hidden name="head.id" id="headId" value="%{#request.headId}" />
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden name="head.stId" id="stId" />
<s:hidden name="head.zixuntype"  id="zixuntype"  value="%{#request.head.zixuntype}"/>
<s:hidden name="head.lcmc"  id="lcmc"  value="%{#request.head.lcmc}"/>
<!-- 意见域、 依据和文件上传需要表单id -->
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
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/stgl/gaizhi_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/stgl/gaizhi_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/stgl/gaizhi_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/stgl/gaizhi_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl"  value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="stgl/gaizhi_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="stgl/gaizhi_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
		<br/><br/>
		<div align="center"><span class="STYLE1">中国建银投资有限责任公司实体改制审批<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span></div>
		
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
	<hr/>
	  <br/>
	  <table width="100%"   border="0" class="newtable"  id="newtable" cellpadding="2" cellspacing="0" align="center">
         <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标 题：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.biaoti"  id="head.biaoti"   cssClass="input" /></td>
        </tr>
        <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"></font>呈送：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.chengsong"  id="head.chengsong"   cssClass="input" /></td>
        </tr>
		<tr>
		  <td height="24"  class="td_zxy01" align="center">编号：</td>
		  <td class="td_zxy02">
		  <s:textfield name="head.bianhao" size="35" id="head.bianhao" cssClass="input" disabled="true"/>
		  </td>
		  <td class="td_zxy01"> 急缓程度：</td>
		  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="head.jhcd" id="head.jhcd"  /></td>
	  	</tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_zxy02">
			<s:hidden name="head.ngr"></s:hidden>
			<r:textfield name="head.ngrxm"  id="head.ngrxm"  readonly="true"  value="%{#request.head.ngrxm}" cssClass="input"/>
		  </td>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
          <td class="td_zxy02"><r:textfield name="head.lxdh"  id="head.lxdh" type="text" onblur="checkPhone(this);"cssClass="input"/></td>
        </tr>
	      <tr>
			<td class="td_zxy01">拟稿日期：</td>
		    <td  class="td_zxy02">
		 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
				<s:textfield  name="head.ngrq"  id="head.ngrq"  value="%{#draftDate}"  readonly="true" cssClass="input"/></td>
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
		     	  <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType();" width="21" height="20" align="absmiddle"/>
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
	<div id="div11" class="ui-jqgrid-bdiv" style="display:block" >
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" style="display:block">
	  	<tr>
          <td width="120" class="td_zxy01">资产编号：</td>
          <td   class="td_zxy02"><s:textfield name="head.zcbh" id="zcbh"  readonly="true" label="" cssClass="input"/></td>
          <td  width="120"  class="td_zxy01">实体名称：</td>
          <td class="td_zxy02"><s:textfield name="head.stzwmc" id="stzwmc" readonly="true" label="" cssClass="input"/></td>
        </tr>
        <tr>
          <td  class="td_zxy01">股权构成：</td>
          <td class="td_zxy02">
          <s:hidden name="head.gqgc" id="gqgc"  />
          <input name="gqqk" type="button" onclick="viewGqgc();"   value="查看" /></td>
          <td class="td_zxy01">资质情况：</td>
          <s:hidden name="head.zzqk" id="zzqk"  />
          <td class="td_zxy02"><input name="zzqk" type="button" onclick="viewZzqk();"   value="查看" /></td>
        </tr>
		<tr>
          <td   class="td_zxy01">地区：</td>
          <td   class="td_zxy02"><s:textfield name="head.diqu" id="diqu"  readonly="true" label="" cssClass="input"/></td>
          <td    class="td_zxy01">办公地址：</td>
          <td class="td_zxy02"><s:textfield name="head.bgdz" id="bgdz" readonly="true"   label="" cssClass="input"/></td>
        </tr>
		 <tr>
          <td   class="td_zxy01">人数：</td>
          <td  class="td_zxy02"><s:textfield name="head.strs"  id="strs"  readonly="true"   label="" cssClass="input"/></td>
          <td     class="td_zxy01">账面投资（万元）：</td>
          <td class="td_zxy02"><s:textfield name="head.zmtz"  id="zmtz"  readonly="true" label=""  cssClass="input"/></td>
        </tr>
		<tr>
          <td  class="td_zxy01">委托管理机构：</td>
          <td  class="td_zxy02"><s:textfield name="head.CWtgljg"  id="CWtgljg"    readonly="true" label="" cssClass="input"/></td>
          <td    class="td_zxy01">&nbsp;</td>
          <td class="td_zxy02">&nbsp;</td>
        </tr>
		 <tr>
		   <td  class="td_zxy01">出资与工商年审情况：</td>
		   <td colspan="3" class="td_zxy02"><s:textfield name="head.czygsnsqk"  id="czygsnsqk"  readonly="true" cssClass="input" /></td>
	    </tr>
		<tr>
		   <td  class="td_zxy01">主营业务：</td>
		   <td colspan="3" class="td_zxy02"><s:textfield name="head.zyyw" id="zyyw"   readonly="true"  cssClass="input" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">最近一期经审计报告：</td>
			<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="single"  id="sjbg"  biaodanId="%{#request.biaodanid}"  isview="Y"  isSingle="Y"/></td>
		</tr>
      </table>
     </div>
     </div>
 	</td></tr>
 	</table>
 	<%@ include file="/inc/according.inc"%> 
    <e:opinion id="test" width="100%">
        <e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
        <e:opinionPart id="OPERATION_GROUP"  biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
        <e:opinionPart id="MEETING_DEPT"  biaodanid="%{#request.biaodanid}" name="MEETING_DEPT" value="" text="会签部门意见：">
        </e:opinionPart>
            <!-- ==========================工作流信息项======================================= -->
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
			<!-- =========================================================================== -->
        <e:opinionPart id="WORK_MANAGE_DEPT" biaodanid="%{#request.biaodanid}"  name="WORK_MANAGE_DEPT" value="" text="业务管理部门意见："></e:opinionPart>
		<e:opinionPart id="AGENT_MANAGE_DEPT" biaodanid="%{#request.biaodanid}"  name="AGENT_MANAGE_DEPT" value="" text="委托管理机构意见："></e:opinionPart>
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
	
		//窗口打开方式
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";	
		function beforeWorkFlowSubmit(){
			$("input").removeAttr("disabled");	
			$("textarea").removeAttr("disabled");	
			$("select").removeAttr("disabled");	
			return true;
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
			document.getElementById("strs").value = reobj.LinkEntitiesRel[0].renshu == null?"":reobj.LinkEntitiesRel[0].renshu;
			document.getElementById("diqu").value = reobj.LinkEntitiesRel[0].CShengfen == null?"":reobj.LinkEntitiesRel[0].CShengfen;
			document.getElementById("bgdz").value = reobj.LinkEntitiesRel[0].bgdz == null?"":reobj.LinkEntitiesRel[0].bgdz;
			document.getElementById("zmtz").value = reobj.LinkEntitiesRel[0].zmtz == null?"":reobj.LinkEntitiesRel[0].zmtz;
			document.getElementById("CWtgljg").value = reobj.LinkEntitiesRel[0].CWtgljg == null?"":reobj.LinkEntitiesRel[0].CWtgljg;
			document.getElementById("czygsnsqk").value = reobj.LinkEntitiesRel[0].czygsnsqk == null?"":reobj.LinkEntitiesRel[0].czygsnsqk;
			document.getElementById("zyyw").value = reobj.LinkEntitiesRel[0].zyyw == null?"":reobj.LinkEntitiesRel[0].zyyw;
			document.getElementById("zzqk").value = reobj.LinkEntitiesRel[0].zzqk == null?"":reobj.LinkEntitiesRel[0].zzqk;
			document.getElementById("gqgc").value = reobj.LinkEntitiesRel[0].gqgc == null?"":reobj.LinkEntitiesRel[0].gqgc;
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
		
		//股权情况
		function viewGqgc(){
			//gqqkViewObj = '21321321#%#21312#%#21312#%#2010-11-09<#>435436543#%#43643643#%#434346#%#2010-11-29';
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

		function openTreeByType(type4jygdzc){//打开树，根据类型打开类型  
		var isHUIQIAN = "";
		if(type4jygdzc =='hqbm'){
			isSYBMorGLBM = type4jygdzc;
			type4jygdzc = 'department';
			isHUIQIAN = "true";
		}
		var url = "<%=request.getContextPath()%>/stgl/xuanshiti_toTree.do?type4Jygdzc="+type4jygdzc+"&isHUIQIAN="+isHUIQIAN;
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	   }
		var isSYBMorGLBM = null;//弹出树是否为管理部门或使用部门
		function getCallBack4Tree(type4Jygdzc,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
			if(type4Jygdzc=='department'){
				type4Jygdzc = isSYBMorGLBM;
			}
			document.getElementById(type4Jygdzc+"hiddenid").value = id;
			document.getElementById(type4Jygdzc+"value").value 	= value;
		}
		

		//办结
		function completeHead(){
			if(confirm("确认办结！")){
				var headId=$("#headId").val();
				$.post("<%=basePath %>stgl/gaizhi_completeHead.do",{
					"headId":headId
				},function(data){
					if(data == "success"){
						alert("办结！");
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
		//（处理）新建建银实业正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('blank_Template_jysy', document.getElementById("myform"),false,true, "建银实业企业改制正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看建银实业正文
		function viewzhengwen(){
			wordTemplate('blank_Template_jysy', document.getElementById("myform"),true,false,"建银实业企业改制正文"); 
		}
		
		//合成建银实业正文
		function hechengzhengwen(){
		    var bianhao = document.getElementById('head.bianhao').value;
			if(bianhao=='' || bianhao==null){
			alert("请先生成编号");
			return false;
			}
			MergeWordStart('manager_gzlxdht','blank_Template_jysy','manager_gzlxdbj' , document.getElementById("myform"), "建银实业企业改制正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
		}
		
		function hechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,null,2,false,false,false,false);
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
		
		//........................................中国建投...............................................................................
		//（处理）新建中国建投正文
		function jtopenzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "中国建投企业改制正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwjtButton .l-btn-text","处理中国建投正文");
			window.parent.setClass("#xjzwjtButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看中国建投正文
		function jtviewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"中国建投企业改制正文"); 
		}
		
		//合成中国建投正文
		function jthechengzhengwen(){
		    var bianhao = document.getElementById('head.bianhao').value;
			if(bianhao=='' || bianhao==null){
			alert("请先生成编号");
			return false;
			}
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "企业改制正文",'jthechengHead()','jthechengBottom()');
			window.parent.removeObj("#hczwButton");
		}
		
		function jthechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("head.chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("head.bianhao").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("head.biaoti").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
		
		}
		
		function jthechengBottom(){
		    var strDate = "<%=strDate%>";
			MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,"中国建投",2,false,false,false,false);
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
			$.post("<%=basePath %>stgl/gaizhi_createNum.do",{
				"headId":headId
			},function(data){
				document.getElementById("head.bianhao").value = data;
				window.parent.removeObj("#shengchenButton");
				window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			});
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
</script>
</body>
<div id="dialogZzqk" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
<div id="dialogGqgc" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
</html>
