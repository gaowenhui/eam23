<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*,com.tansun.eam2.common.model.orm.bo.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
	String userTid = (String) request.getAttribute("userTid");
	String headId = (String)request.getAttribute("headId");
	String zixunType = (String)request.getParameter("zixunType");
	StGlbt stGlbt =(StGlbt)request.getAttribute("stGlbt");
	StHead head = (StHead)request.getAttribute("head");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stgl/zengjianzi/zengjianzi.ctl.xml"></r:controlfile>

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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<meta http-equiv="pragma" content="no-cache"/>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "stglWorkflow";
	actionPath = "zjzWorkflow";
	
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

	//选择实体操作
    <e:pc id="xzst">
		var buttonStglxxJSonString = '[\<%if(!inCounterSign){%>{"buttonHandler":"selectEntity","buttonIcon":"icon-add","buttonText":"选择实体"},\
	                                <%}%>{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体"}\
	    ]';
	   addButtons(jQuery("#stxxDiv11 > .ui-jqgrid-titlebar"), buttonStglxxJSonString);
	</e:pc>

	//办结按钮
	<e:pc id="banjie">
		var buttonStr_banjie = '[{"buttonHandler":"mainWindow.completeHead","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
		window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
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
<%}%>
		
	//查看实体操作
    <e:pc id="ckst">
		var buttonStglxxJSonString = '[ {"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体"}\
	    ]';
	   addButtons(jQuery("#stxxDiv11 > .ui-jqgrid-titlebar"), buttonStglxxJSonString);
	</e:pc>
		
	//控制联动
	var ywlx = document.getElementById("head.ywlx").value;
	if(ywlx == "0"){
		document.getElementById("touzi").style.display="block";
		document.getElementById("chezi").style.display="none";
		
	}else{
		document.getElementById("touzi").style.display="none";	
		document.getElementById("chezi").style.display="block";	
	}
	
	<%
	  if(stGlbt!=null&&stGlbt.getTzje()!=null&&!"".equals(stGlbt.getTzje())){
	%>
		$("#tzje").val(${stGlbt.tzje}.toFixed(2));
	<%
	}
	%>
	
	<%
	  if(stGlbt!=null&&stGlbt.getCzje()!=null&&!"".equals(stGlbt.getCzje())){
	%>
		$("#czje").val(${stGlbt.czje}.toFixed(2));
	<%
	}
	%>
	
	<%
	  if(head!=null&&head.getZmtz()!=null&&!"".equals(head.getZmtz())){
	%>
		$("#zmtz").val(${head.zmtz}.toFixed(2));
	<%
	}
	%>
	
	<%
	  if(head!=null&&head.getZzc()!=null&&!"".equals(head.getZzc())){
	%>
		$("#zzc").val(${head.zzc}.toFixed(2));
	<%
	}
	%>
	
	<%
	  if(head!=null&&head.getFuzhai()!=null&&!"".equals(head.getFuzhai())){
	%>
		$("#fuzhai").val(${head.fuzhai}.toFixed(2));
	<%
	}
	%>
	
	
	<%
	  if(head!=null&&head.getJzc()!=null&&!"".equals(head.getJzc())){
	%>
		$("#jzc").val(${head.jzc}.toFixed(2));
	<%
	}
	%>
	
	<%
	  if(head!=null&&head.getStsr()!=null&&!"".equals(head.getStsr())){
	%>
		$("#stsr").val(${head.stsr}.toFixed(2));
	<%
	}
	%>
	
	<%
	  if(head!=null&&head.getJlr()!=null&&!"".equals(head.getJlr())){
	%>
		$("#jlr").val(${head.jlr}.toFixed(2));
	<%
	}
	%>
});
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
<s:form name="myform" id="myform" action="">
<s:hidden name="head.zixuntype"  id="zixuntype"  value="%{#request.head.zixuntype}"/>
<s:hidden name="head.lcmc"  id="lcmc"  value="%{#request.head.lcmc}"/>
<s:hidden name="head.id" id="headId" value="%{#request.headId}" />
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden name="head.stId"  id="stId"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.Id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/stgl/zengjianzi_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader+"endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/stgl/zengjianzi_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/stgl/zengjianzi_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/stgl/zengjianzi_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl"  value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader+"did.do"%>"/>

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="stgl/zengjianzi_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="stgl/zengjianzi_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<br/><br/>
<div align="center"><span class="STYLE1">中国建银投资有限责任公司实体增资（减资）申请<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span></div>
      
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
	  <hr/>
	 <table width="100%" id="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
         <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标 题：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.biaoti"   id="head.biaoti"   cssClass="input" /></td>
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
		  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="head.jhcd" id="head.jhcd"/></td>
	  	</tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_zxy02">
			<s:hidden name="head.ngr"></s:hidden>
			<r:textfield name="head.ngrxm"  id="head.ngrxm"  readonly="true"  cssClass="input"  value="%{#request.head.ngrxm}" />
		  </td>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
          <td class="td_zxy02"><r:textfield name="head.lxdh"  id="head.lxdh" type="text" cssClass="input" onblur="checkPhone(this);"/></td>
        </tr>
	      <tr>
			<td class="td_zxy01">拟稿日期：</td>
		    <td  class="td_zxy02">
		 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate" />
				<s:textfield  name="head.ngrq"  id="head.ngrq" readonly="true"   value="%{#draftDate}"   cssClass="input"/></td>
	        <td  width="120"  class="td_zxy01">拟稿部门：</td>
	        <td class="td_zxy02">
				<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    		<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
			</td>
	   </tr> 
     <tr>
          <td  width="120" class="td_zxy01">业务类型：</td>
          <td  class="td_zxy02" colspan="3">
          	<r:select name="head.ywlx"  id="head.ywlx"  theme="simple" list="#{'0':'增资','1':'减资' }"  label="" onChange="ywlxFun()"/>
          </td>
        </tr>
       <tr id="touzi" style="display:block">
	    <td  width="120" class="td_zxy01" >投资方式：</td>
	    <td  class="td_zxy02"><r:textfield name="stGlbt.tzfs" id="stGlbt.tzfs"  label="" cssClass="input"/></td>
		<td  width="120" class="td_zxy01">投资金额（元）：</td>
	    <td  class="td_zxy02"><r:textfield name="stGlbt.tzje" id="tzje"  label=""  onblur="checkFloat(this);" cssClass="input"/></td>
	   </tr>	
	   
		<tr id="chezi" style="display:none">
	    <td  width="120" class="td_zxy01">撤资方式：</td>
	    <td  class="td_zxy02"><r:textfield name="stGlbt.czfs"  id="stGlbt.czfs"  label=""  cssClass="input"/></td>
		<td  width="120" class="td_zxy01">撤资金额（元）：</td>
	    <td  class="td_zxy02"><r:textfield name="stGlbt.czje"  id="czje" label=""  onblur="checkFloat(this);"  cssClass="input"/></td>
	   </tr>
		<tr>
			<td class="td_zxy01">会签部门：</td>
		    <td class="td_zxy02" colspan="3" >
		    <r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"  cssClass="input"/>
		    <s:hidden name="head.hqbmid" id="hqbmids" />
      		   <e:pc id="xzhq">
		     	  <img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType();" width="21" height="20"
						align="absmiddle" />
			  </e:pc>
			   <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>
			</td>
		 </tr>	
		<!--  <%if("3".equals(zixunType)) {%>
		 <tr>
			<td class="td_zxy01">建银实业内部会签部门：</td>
		    <td class="td_zxy02" colspan="3" >
		    <r:textfield name="head.syhqbm" id="hqbmvalue1" readonly="true"  cssClass="input2"/>
		       <s:hidden  name="head.syhqbmid" id="hqbmids1"/>
				 <e:pc id="syxzhq">	
		     	  <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType1();" width="21" height="20" align="absmiddle"/>
				</e:pc>
			</td>
		 </tr>	
		 <%} %>-->
      </table>
     <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
        <td>
    <div id="stxxDiv11" class="ui-jqgrid-view ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width:100%;">
    <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"><a href="javascript:changeDivStatus('stxxDiv11');" role="link" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title">实体信息</span></div>
	<div id="div11" class="ui-jqgrid-bdiv" style="display:block" >
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc">
	  	<tr>
          <td width="120" class="td_zxy01">资产编号：</td>
          <td   class="td_zxy02"><s:textfield name="head.zcbh" id="zcbh"  readonly="true" label="" cssClass="input"></s:textfield></td>
          <td  width="120"  class="td_zxy01">实体名称：</td>
          <td class="td_zxy02"><s:textfield name="head.stzwmc" id="stzwmc" readonly="true" label="" cssClass="input"></s:textfield></td>
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
          <td   class="td_zxy02"><s:textfield name="head.diqu" id="diqu"  readonly="true" label=""  cssClass="input"/></td>
          <td    class="td_zxy01">办公地址：</td>
          <td class="td_zxy02"><s:textfield name="head.bgdz" id="bgdz" readonly="true"   label="" cssClass="input"></s:textfield></td>
        </tr>
		 <tr>
          <td   class="td_zxy01">人数：</td>
          <td  class="td_zxy02"><s:textfield name="head.strs"  id="strs"  readonly="true"   label="" cssClass="input"></s:textfield></td>
          <td     class="td_zxy01">账面投资（万元）：</td>
          <td class="td_zxy02"><s:textfield name="head.zmtz"  id="zmtz"  readonly="true" label="" cssClass="input"></s:textfield></td>
        </tr>
		<tr>
          <td  class="td_zxy01">委托管理机构：</td>
          <td  class="td_zxy02"><s:textfield name="head.CWtgljg"  id="CWtgljg"    readonly="true" label="" cssClass="input"></s:textfield></td>
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
			<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="single"  id="sjbg"  biaodanId="%{#request.biaodanid}" isview="Y"  isSingle="Y"/></td>
		</tr>
	  <tr>
        <td colspan="6" class="td_zxy01"><div align="left">最近一个月未经审计的报表的主要数据</div></td>
      </tr>	
      <tr>
		  <td class="td_zxy01">总资产(元)：</td>
          <td class="td_zxy02"><r:textfield   name="head.zzc"  id="zzc"  maxlength="16" label=""  onblur="checkFloat(this);"  cssClass="input"/></td>
          <td  class="td_zxy01" >负债（元）：</td>
          <td class="td_zxy02"><r:textfield   name="head.fuzhai"  id="fuzhai"  maxlength="16"  label="" onblur="checkFloat(this);"  cssClass="input"/></td>
        </tr>
		 <tr>
		  <td class="td_zxy01">股本（元）：</td>
          <td class="td_zxy02"><r:textfield   name="head.guben"   id="guben"  label=""  onblur="checkFloat(this);" cssClass="input"/></td>
          <td  class="td_zxy01" >净资产（元）：</td>
          <td class="td_zxy02"><r:textfield   name="head.jzc" id="jzc"  maxlength="16"  label=""  onblur="checkFloat(this);" cssClass="input"/></td>
        </tr>
		  <tr>
		   <td class="td_zxy01">收入（元）：</td>
	        <td class="td_zxy02"><r:textfield   name="head.stsr"  maxlength="16"  id="stsr" label=""  onblur="checkFloat(this);" cssClass="input"/></td>
	        <td  class="td_zxy01" >净利润（元）：</td>
	        <td class="td_zxy02"><r:textfield   name="head.jlr"  maxlength="16"  id="jlr" label=""  onblur="checkFloat(this);" cssClass="input"/></td>
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
        <e:opinionPart id="DRAFT_DEPT"  biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
        <e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
    </e:opinion>	 
<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>	
<%@ include file="/inc/file.inc"%>
<%@ include file="/inc/file_huiqian_end.inc"%>
<%@ include file="/inc/listMessage.inc"%>
<SCRIPT language="JavaScript" type="text/JavaScript">
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
	
	//窗口打开方式
	var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";	
	function ywlxFun(){
		var index=document.getElementById("head.ywlx").selectedIndex
		if(index==0){
		   document.getElementById("touzi").style.display="block"
         	   document.getElementById("chezi").style.display="none"
		}else if(index==1){
		   document.getElementById("touzi").style.display="none"
           document.getElementById("chezi").style.display="block"
		}
	}
		
 		//日期转换和资质情况
		$(function(){
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
	//部门名称和部门id之间的转换
	function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
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
		
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
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
				$('#dialogGqgc').html(htmlObj);
				$('#dialogGqgc').dialog('open');
			}else{
				alert("没有股权构成信息！");
			}
		}
	
	//办结
	function completeHead(){
		if(confirm("确认办结！")){
			var headId=$("#headId").val();
			$.post("<%=basePath %>stgl/zengjianzi_completeHead.do",{
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
		//（处理）新建正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "增资减资正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"增资减资正文"); 
		}
		
		//合成正文
		function hechengzhengwen(){
		    var bianhao = document.getElementById('head.bianhao').value;
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "增资减资正文",'hechengHead()','hechengBottom()');
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
		function openTreeByType(){//打开树，根据类型打开类型  
			var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + document.getElementById("hqbmids").value;
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		function getCallBack4Tree(ids,value){
			document.getElementById("hqbmvalue").value = value;
			document.getElementById("hqbmids").value = ids;
		}
		
		function openTreeByType1(){//打开树，根据类型打开类型  
			var url = basePathJs + "chooseHqbm.do?deptType=1&ids=" + document.getElementById("hqbmids1").value;
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		function getCallBack4Tree1(ids,value){
			document.getElementById("hqbmvalue1").value = value;
			document.getElementById("hqbmids1").value = ids;
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
		
		
		//生成编号
		function createBianhao(){
			var headId=$("#headId").val();
			$.post("<%=basePath %>stgl/zengjianzi_createNum.do",{
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

			
</script>
</s:form>
</body>
<div id="dialogZzqk" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
<div id="dialogGqgc" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
</html>

