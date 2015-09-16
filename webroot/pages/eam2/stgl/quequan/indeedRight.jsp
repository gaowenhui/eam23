<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.StHead"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%@ page import="com.tansun.eam2.common.model.orm.bo.StGlbt"%>
<%
	String headId = (String)request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
	String zixunType = (String)request.getParameter("zixunType");
	StHead head=(StHead)request.getAttribute("head");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stgl/quequan/quequan.ctl.xml"></r:controlfile>
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
<title>资产确权</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "stglWorkflow";
	actionPath = "qqWorkflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
<script type="text/javascript">
var addStr;
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
		jQuery("#file_list").setGridWidth($("#newtable").width());
		jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
		jQuery("#file_huiqianlist").setGridWidth($("#newtable").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
    });
    
    
	// ----------------------------------------查看oa流程------------------------------------------
	<e:pc id="queryoa">
		var buttonStr_oastat = '[{"buttonHandler":"mainWindow.queryOA","buttonIcon":"icon-search","buttonText":"查看OA状态"}]';	                       
		window.parent.appendButtonsFromChildren(buttonStr_oastat,"");
		
		var buttonStr_oaurl = '[{"buttonHandler":"mainWindow.queryOAurl","buttonIcon":"icon-search","buttonText":"查看OA表单"}]';	                       
		window.parent.appendButtonsFromChildren(buttonStr_oaurl,"");
  	</e:pc>
		 
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
			var buttonStr_banjie = '[{"buttonHandler":"mainWindow.banjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
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
	var ywlx = document.getElementById("head.ywlx").value;
	if(ywlx == "协议转让"){
		document.getElementById("sp").style.display="block";
		
	}else{
	document.getElementById("sp").style.display="none";	
	}	
	$("#ngrq").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		    });			    
		$('#dialogZzqk').dialog({title:'资质情况'});
		$('#dialogZzqk').dialog('close');
		$('#dialogGqgc').dialog({title:'股权构成'});
		$('#dialogGqgc').dialog('close');
	$("#ngrq").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    
	    addStr = $("#TableBox5").html();
	    
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
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <%@ include file="/inc/word.inc"%>
  <table id="TableBox5" width="100%" border="0" style="display: none"  cellpadding="0">
    <tr>
      <td class="td_zxy02">
      	<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
      	项目名称:&nbsp;
          <s:textfield name="stGlbt.sqxmmc"  style='width: 100' value="" />
       	申请金额（元）:&nbsp;
        <s:textfield name="stGlbt.sqje" onblur='applyMoney()'  maxlength="16" style='width: 100'  value=""  />
       	审定金额（元）:&nbsp;
       	<s:textfield  name="stGlbt.sdje" onblur='checkMoney()'  maxlength="16" style='width: 100'  value=""  />
       </td>
    </tr>
  </table>
<s:form name="myform" id="myform"  action="caiwu_saveHead">
<s:hidden name="head.id" id="headId" value="%{#request.headId}" />
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden  name="head.zixuntype" id="zixuntype"  value="%{#request.head.zixuntype}"/>
<s:hidden name="head.lcmc"  id="lcmc"  value="%{#request.head.lcmc}"/>
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
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/stgl/quequan_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/stgl/quequan_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/stgl/quequan_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/stgl/quequan_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl"  value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="stgl/quequan_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="stgl/quequan_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<br/><br/>
<div align="center"><span class="STYLE1">中国建银投资有限责任公司实体确权审批<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span></div>
		
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
	<hr/>		
	  <br/>
	  <table width="100%"   border="0" class="newtable"  id="newtable" cellpadding="2" cellspacing="0" align="center">
         <tr>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>标 题：</td>
          <td class="td_zxy02"  colspan="3"><r:textfield name="head.biaoti"  id="biaoti"   cssClass="input" /></td>
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
		  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="head.jhcd" id="head.jhcd"  /></td>
	  	</tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_zxy02">
			<s:hidden name="head.ngr"></s:hidden>
			<s:textfield name="head.ngrxm"  id="ngrxm"  readonly="true"  cssClass="input" value="%{#request.head.ngrxm}"/>
		  </td>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
          <td class="td_zxy02"><r:textfield name="head.lxdh"  id="head.lxdh" type="text" cssClass="input" onblur="checkPhone(this);"/></td>
        </tr>
	      <tr>
			<td class="td_zxy01">拟稿日期：</td>
		    <td  class="td_zxy02">
		 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
				<s:textfield  name="head.ngrq"  id="ngrq"  readonly="true" value="%{#draftDate}"  cssClass="input"/></td>
	        <td  width="120"  class="td_zxy01">拟稿部门：</td>
	        <td class="td_zxy02">
				<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    		<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
			</td>
	   </tr> 
	   <tr>
	     <td class="td_zxy01">确权方式：</td>
	     <td class="td_zxy02" cospan="3">
	     <r:select list="{'协议转让','股权变更'}"  name="head.ywlx"  id="head.ywlx" onChange="qq();return false;" />
	     </td>
	   </tr>
	  <tr id="sp" style="display:block">
	    <td class="td_zxy01"> 金额： </td>
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
	              <s:textfield  name="head.sdjehj"  id="totalSdje"  style='width: 100' readonly="true"  />
	            </td>
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
		                  	项目名称:&nbsp;
		                    <s:textfield name="stGlbt.sqxmmc"  style='width: 100' readonly="true"  value="%{#stGlbt.sqxmmc}"/>
		                   	申请金额(元）:&nbsp;
		                    <s:textfield name="stGlbt.sqje" onblur='applyMoney()' style='width: 100'   readonly="true"   value="%{#stGlbt.sqje}"/>
		                   	审定金额（元）:&nbsp;
		                   	<s:textfield name="stGlbt.sdje" onblur='checkMoney()' style='width: 100'  readonly="true"    value="%{#stGlbt.sdje}"/>
		                   </td>
		                </tr>
	                </s:iterator>
	            </table>
            </td>
	      </tr>
	    </table>
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
    <tr> <td>
	<div id="stxxDiv11" class="ui-jqgrid-view ui-jqgrid ui-widget ui-widget-content ui-corner-all"  style="width:100%;">
    <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"><a href="javascript:changeDivStatus('stxxDiv11');" role="link" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title">实体信息</span></div>
	<div id="div11" class="ui-jqgrid-bdiv" style="display:block" >
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" style="display:block">
	  	<tr>
          <td width="120" class="td_zxy01">资产编号：</td>
          <td   class="td_zxy02"><s:textfield name="head.zcbh" id="zcbh"  readonly="true" label=""  cssClass="input"/></td>
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
          <td class="td_zxy02"><s:textfield name="head.zmtz"  id="zmtz"  readonly="true" label="" cssClass="input"/></td>
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
			<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="single" id="sjbg" biaodanId="%{#request.biaodanid}" isview="Y"  isSingle="Y"/></td>
		</tr>
	  <tr>
        <td colspan="6" class="td_zxy01"><div align="left">最近一个月未经审计的报表的主要数据</div></td>
      </tr>	
      <tr>
		  <td class="td_zxy01">总资产(元)：</td>
          <td class="td_zxy02"><r:textfield   name="head.zzc"  maxlength="16"  id="head.zzc" label="" cssClass="input"/></td>
          <td  class="td_zxy01" >负债（元）：</td>
          <td class="td_zxy02"><r:textfield   name="head.fuzhai"   maxlength="16"  id="head.fuzhai" label="" cssClass="input"/></td>
        </tr>
		 <tr>
		  <td class="td_zxy01">股本（元）：</td>
          <td class="td_zxy02"><r:textfield   name="head.guben"   id="head.guben"  label="" cssClass="input"/></td>
          <td  class="td_zxy01" >净资产（元）：</td>
          <td class="td_zxy02"><r:textfield   name="head.jzc"  id="head.jzc"  maxlength="16"  label="" cssClass="input"/></td>
        </tr>
		  <tr>
		   <td class="td_zxy01">收入（元）：</td>
	        <td class="td_zxy02"><r:textfield   name="head.stsr"  maxlength="16"  id="head.stsr" label="" cssClass="input"/></td>
	        <td  class="td_zxy01" >净利润（元）：</td>
	        <td class="td_zxy02"><r:textfield   name="head.jlr"  maxlength="16"  id="head.jlr" label="" cssClass="input"/></td>
	    </tr>
      </table>
     </div>
     </div>
     </td></tr>
     </table>
     
  		<div style="display: none">
			<s:textfield name="eam2oa.status" id="status" cssClass="input"/>
			<s:textfield name="eam2oa.url" id="oaUrl" maxlength="10" cssClass="input"/>
		</div>  
		
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
<SCRIPT language=JavaScript type=text/JavaScript>

	//窗口打开方式
	var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";	
	
	//必填项控制
	function checkEAMFormJSMethod(){
		var ti = document.getElementById("biaoti");
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
	
	function qq(){
	var x= document.getElementById("head.ywlx");
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
		
	//选择实体	
	function selectEntity(){
		var zixunType =document.getElementById("head.zixuntype").value;
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + 'option=stgl&' 
		 + 'entityStid=' + $("#stId").val() 
		 + '&zixunType=' + zixunType,'',winOpenStr);
	}
	
		// 查看oa状态
	function queryOA(){
		var state = document.getElementById("status").value;
		alert(state);
	}
	
	// 查看oa表单
	function queryOAurl(){
		var url = document.getElementById("oaUrl").value;
		window.open(url,"","");
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
			$('#dialogZzqk').html(htmlObj);
			$('#dialogZzqk').dialog('open');
		}else{
			alert("没有股权构成信息！");
		}
	}
	

	//办结
	function completeHead(){
		if(confirm("确认办结！")){
			var headId=$("#headId").val();
			$.post("<%=basePath %>stgl/quequan_completeHead.do",{
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
	
	
	//办结
	function banjie(){
		if(confirm('确定要提交'+'流程办结'+'吗？')){
			document.myform.action = document.getElementById("endUrl").value;
			document.myform.url.value = document.getElementById("endViewUrl").value;
			document.myform.taskId.value = '<%=workflowVO.taskId%>';
			document.myform.sheetId.value = document.getElementById('head.bianhao').value;
			document.myform.outCome.value = '流程办结';
			var url = "<%=basePath%>stgl/quequan_startOAFlow.do";;
			var ngrq = document.getElementById('ngrq').value;
			var ngr = document.getElementById('ngrxm').value;
			var zbbm = document.getElementById('ngbmmc').value;
			var title = document.getElementById('biaoti').value;
			var EAMmsgid = '<%=headId%>';
			var yjwjurl = basePathJs+'wtdk/quequan_modifyHead.do?headId='+'<%=headId%>';
			var nglx = '发文';
			$.post(url,{ngrq:"" + ngrq + "",ngr:"" + ngr + "",zbbm:"" + zbbm + "",
						yjwjurl:"" + yjwjurl + "",nglx:"" + nglx + "",EAMmsgid:""+EAMmsgid+"",
						title:""+title+""}, 
				function(data){
					if(data!=null&&data!=''){
						if(data=='发送不成功,请重新发送'){
							alert(data);
							return false;
						}else{
							window.open(data,'','');
							document.myform.submit();
						}
					}
				}
			);
		}
	}	
		
		//（处理）新建正文
		function openzhengwen(){
			isNew = false;
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "确权正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"确权正文"); 
		}
		
		//合成正文
		function hechengzhengwen(){
		    var bianhao = document.getElementById('head.bianhao').value;
			if(bianhao=='' || bianhao==null){
			alert("请先生成编号");
			return false;
			}
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "确权正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
		}
		
		function hechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("head.chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("head.bianhao").value,2,false,false,false,false);
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
		  	
	//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		$.post("<%=basePath %>stgl/quequan_createNum.do",{
			"headId":headId
		},function(data){
			document.getElementById("head.bianhao").value = data;
			window.parent.removeObj("#shengchenButton");
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		});
	}
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
	
	//点击保存时 标题不能为空
	function checkEAMFormTitle(){ 		
	   var biaoti = document.getElementById("biaoti"); 		
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
</html>

