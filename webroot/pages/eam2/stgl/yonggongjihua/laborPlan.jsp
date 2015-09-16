<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
	String oaurl = (String)request.getAttribute("oaurl");
    String userTid = (String)request.getAttribute("userTid");
	String headId = (String)request.getAttribute("headId");
	String zixunType = (String)request.getParameter("zixunType");
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/stgl/yonggongjihua/yonggongjihua.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
	<%
	if(workflowVO.taskName.equals("EAM承办部门综合处理")){
		counterSignBtnDisplay = true;
	}
%>
<!-- ================================================================================== -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>用工计划</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "stglWorkflow";
	actionPath = "ygjhWorkflow";
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
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
	
	var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
    var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
	var isInit = false;
		if("0"=="<%=status%>"){
		    	var isNew = true;
		  }else{
		    	var isNew = false;
		} 
		$(document).ready(function(){
			if(isInit)return;
			//添加按钮
			var buttonCkxyryJSonString = '[{"buttonHandler":"lookNowPer","buttonIcon":"icon-search","buttonText":"查看"}]';
			addButtons(jQuery("#gview_nowPersonlist> .ui-jqgrid-titlebar"),buttonCkxyryJSonString);
			isInit = true;
		});		
		
		function lookNowPer(){
				var gr = jQuery("#nowPersonlist").jqGrid('getGridParam','selrow');
				var stId = $("#stId").val();
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
//				if(gr.length == 0){
//					alert("请选择要查看的记录")
//				}else if (gr.length > 1){
//					alert("只能选择一条要查看的记录")
//				}else{
//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				if(gr == null){
					alert("请选择要查看的记录!");
				}else{
				window.open('<%=basePath%>stgl/weihu_newPopList.do?id='+gr+'&fslx='+1+'&stid='+stId+'&pop='+1+'&look='+1,'',winVar);
				}
			}
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
<s:form  method="post" id="myform" name="myform" action="">
<s:hidden  type="text"  name="head.id" id="headId" value="%{#request.headId}"/>
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden name="head.zixuntype"  id="zixuntype"  value="%{#request.head.zixuntype}"/>
<s:hidden name="head.lcmc"  id="lcmc"  value="%{#request.head.lcmc}"/>
<s:hidden name="head.stId"  id="stId"/>
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
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/stgl/yonggongjihua_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader+"abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader+"endView.do"%>"/>

<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/stgl/yonggongjihua_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/stgl/yonggongjihua_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/stgl/yonggongjihua_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl"  value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />

<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="stgl/yonggongjihua_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->

<!-- 会签属性 -->
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="stgl/yonggongjihua_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
<br/><br/>
<div align="center"><span class="STYLE1">中国建银投资有限责任公司实体用工计划<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span></div>
     
<!-- ==========================工作流信息项======================================= -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->

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
		  <s:textfield name="head.bianhao" size="35" id="head.bianhao" cssClass="input" disabled="true"/>
		  </td>
		  <td class="td_zxy01"> 急缓程度：</td>
		  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="head.jhcd" id="head.jhcd"/></td>
	  	</tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_zxy02">
			<s:hidden name="head.ngr"></s:hidden>
			<s:textfield name="head.ngrxm"  id="ngrxm"  readonly="true" cssClass="input" />
		  </td>
          <td  width="120" class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
          <td class="td_zxy02"><s:textfield name="head.lxdh"    cssClass="input" onblur="checkPhone(this);"/></td>
        </tr>
      <tr>
		<td class="td_zxy01">拟稿日期：</td>
	    <td  class="td_zxy02">
	 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield id="ngrq" name="head.ngrq"  value="%{#draftDate}" readonly="true"  cssClass="input" /></td>
        <td  width="120"  class="td_zxy01">拟稿部门：</td>
        <td class="td_zxy02">
				<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    		<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
		</td>
      </tr> 
	 <tr>
		<td class="td_zxy01">会签部门：</td>
	    <td class="td_zxy02" colspan="3" >
	       <r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"  cssClass="input" />
	       <s:hidden  name="head.hqbmid" id="hqbmids"/>
	       <e:pc id="xzhq">
	     	  <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('hqbm');" width="21" height="20" align="absmiddle"/> 
	       </e:pc>
	        <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" /><%} %>
	     </td>
	  </tr>
    </table>
    
	<div style="display: none">
		<s:textfield name="eam2oa.status" id="status" cssClass="input"/>
		<s:textfield name="eam2oa.url" id="oaurl" maxlength="10" cssClass="input"/>
	</div>
    
    
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
        <td>
	<div id="stxxDiv11" class="ui-jqgrid-view ui-jqgrid ui-widget ui-widget-content ui-corner-all"  style="width:100%;">
 	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"><a href="javascript:changeDivStatus('stxxDiv11');" role="link" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title">实体信息</span></div>
	<div id="div11" class="ui-jqgrid-bdiv" style="display:block" >
	 <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" >
	  	<tr>
          <td width="120" class="td_zxy01">资产编号：</td>
          <td   class="td_zxy02"><s:textfield name="head.zcbh" id="zcbh"  readonly="true" label="" cssClass="input" /></td>
          <td  width="120"  class="td_zxy01">实体名称：</td>
          <td class="td_zxy02"><s:textfield  name="head.stzwmc" id="stzwmc" readonly="true" label="" cssClass="input" /></td>
        </tr>
		<tr>
          <td   class="td_zxy01">地区：</td>
          <td   class="td_zxy02"><s:textfield  name="head.diqu" id="diqu"  readonly="true" label="" cssClass="input" /></td>
          <td    class="td_zxy01">办公地址：</td>
          <td class="td_zxy02"><s:textfield name="head.bgdz" id="bgdz" readonly="true"   label=""  cssClass="input"/></td>
        </tr>
        <tr>
           <td  class="td_zxy01">现有人数：</td>
           <td class="td_zxy02"><s:textfield  name="head.strs"  id="strs"  readonly="true"  cssClass="input" /></td>
           <td    class="td_zxy01">计划新增人数：</td>
           <td class="td_zxy02"><s:textfield  name="head.jhxzrs"  id="head.jhxzrs"  readonly="true"  cssClass="input" /></td>
        </tr>
     </table>
	</div>	  
	</div>
	</td></tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="nowPersonlist"> </table>
       </td>
     </tr>
      </table>	
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="planPersonlist"> </table>
       </td>
     </tr>
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
<SCRIPT language=JavaScript type=text/JavaScript>	

	//窗口打开方式
	var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";	
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}		
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
	var zzqkViewObj;
	function setLinkEntitiesRel(objString){
		var reobj = eval('(' + objString + ')');
		document.getElementById("stId").value = reobj.LinkEntitiesRel[0].id;
		document.getElementById("zcbh").value = reobj.LinkEntitiesRel[0].zcbh;
		document.getElementById("strs").value = reobj.LinkEntitiesRel[0].renshu == null?"":reobj.LinkEntitiesRel[0].renshu;
		document.getElementById("stzwmc").value = reobj.LinkEntitiesRel[0].stzwmc;
		document.getElementById("diqu").value = reobj.LinkEntitiesRel[0].CShengfen == null?"":reobj.LinkEntitiesRel[0].CShengfen;
		document.getElementById("bgdz").value = reobj.LinkEntitiesRel[0].bgdz;
		var stId =reobj.LinkEntitiesRel[0].id;
		jQuery("#nowPersonlist").setGridParam({
			url:"<%=basePath %>stgl/yonggongjihuaBody_listCurrStaff.do",
			postData:{'stId':document.getElementById("stId").value
			}}).trigger("reloadGrid") ;
	}
	
</SCRIPT>
</s:form>
</body>
</html>
<script type="text/javascript">
		jQuery("#nowPersonlist").jqGrid({
			url:"<%=basePath %>stgl/yonggongjihuaBody_listCurrStaff.do",				
			datatype: "json",
			postData:{'stId':document.getElementById("stId").value
			},
			mtype:"POST",
		   	colNames:['id','实体Id','姓名','性别','年龄','人员类型','职务','收入','毕业学校','专业'],
		   	colModel:[
		   		{name:'id',index:'id',editable:false,hidden:true},
				{name:'stid',index:'stid',editable:false,hidden:true},
				{name:'fxingming'},
				{name:'fxingbie'},
				{name:'fnianling'},
				{name:'fcRylx'},
				{name:'fcZhiwu'},
				{name:'fshouru'},
				{name:'fbyxx'},
				{name:'fzhuanye'}
		   	],
		   	rowNum:0,
			multiselect:false,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption: '现有人员信息',
			ondblClickRow:function(rowid){
				lookNowPer(rowid);
			},
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}
		});
		    
</script>
<div id="tableWidth"  width="100%"/>
<script type="text/javascript">
		var stId = $("#stId").val();
     	var headId=$("#headId").val();
		jQuery("#planPersonlist").jqGrid({	
	   		url:"<%=basePath %>stgl/yonggongjihuaBody_viewRecruitStaff.do?headId="+headId,	
			datatype: "json",
			mtype:"POST",
		   	colNames:['表体Id','表单Id','工作岗位','人数','学历', '资质要求','性别','工龄','其他信息'],
		   	colModel:[
		   	{name:'id',index:'id',editable:false,hidden:true},
	   		{name:'cldId',index:'cldId',editable:false,hidden:true},
	   		{name:'gzgw',index:'gzgw'},
	   		{name:'renshu',index:'renshu'},
	   		{name:'CXueli',index:'CXueli'},
			{name:'zzyq',index:'zzyq'},
			{name:'CXingbie',index:'CXingbie'},
			{name:'gongling',index:'gongling'},
			{name:'qtxx',index:'qtxx'}
		   	],
		   	rowNum:0,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption: '用工计划',
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			ondblClickRow:function(rowid){
				checkPerson(rowid);
			},
			gridComplete:function(){
				compute();
			}
			
		});
		
      
	//删除用工岗位
	function delAss(){
		var gr = jQuery("#planPersonlist").jqGrid('getGridParam','selarrrow');
		if(gr == ''){
			alert("请选择要删除的记录!"); 		
		}else if(confirm("确认删除！")){
			var delplanjurl ="<%=basePath %>stgl/yonggongjihuaBody_deleteRecruitStaff.do";
			$.post(delplanjurl,{delBtIds:"" + gr + ""}, function(data){
				if(data == 'success')
					//jQuery("#planPersonlist").trigger("reloadGrid");
				    reloadJqGrid();
			});
		}
	}
	
	//（处理）新建正文
	function openzhengwen(){
		isNew = false;
		wordTemplate('bank_Template', document.getElementById("myform"),false,true, "用工计划正文"); 
		//修改按钮名称为“处理正文”
		window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
		window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
	}
	//查看正文
	function viewzhengwen(){
		wordTemplate('bank_Template', document.getElementById("myform"),true,false,"用工计划正文"); 
	}
	
	//合成正文
	function hechengzhengwen(){
			var bianhao = document.getElementById('head.bianhao').value;
			if(bianhao=='' || bianhao==null){
			alert("请先生成编号");
			return false;
			}
		MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "用工计划正文",'hechengHead()','hechengBottom()');
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
	//添加用工岗位
	function addAss(){
		var stId=$("#stId").val();
		var headId=$("#headId").val();
		var rdBasicWidth = "700px";
		var rdBasicHeight = "400px";
		var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
		var x=(screen.width-800)/2; 
        var y=(screen.height-400)/2;
        if(stId==null||stId == ""){
        	alert("请选择实体");	
        } else {
        	window.open('<%=basePath%>stgl/yonggongjihuaBody_newRecruitStaff.do?headId='+headId+'&stId='+stId,'用工岗位信息','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}
	}
	//查看用工岗位
	function checkPerson(){
		var gr = jQuery("#planPersonlist").jqGrid('getGridParam','selarrrow');
		if(gr == ''){
			alert("请选择要查看的记录!"); 		
		}else if(gr.length>1){
			alert("只能查看一条记录信息!"); 
		}else {
			window.open('<%=basePath %>stgl/yonggongjihuaBody_checkChangeRep.do?' + 'checkIds='+gr+'&look=1','',winOpenStr);
		}
	}	
	//重新加载页面
	function reloadJqGrid(){
              reloadGrid();
	}
	
	//办结
	function completeHead(){
		if(confirm("确认办结！")){
			var headId=$("#headId").val();
			$.post("<%=basePath %>stgl/yonggongjihua_completeHead.do",{
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
		document.myform.submit();
	}
}
	
	function reloadGrid(){
		jQuery("#planPersonlist").trigger("reloadGrid");//getGridParam("records")
		//alert("操作成功！");
	}
	
	function compute(){				
	var values=0;
	$("td[aria-describedby='planPersonlist_renshu']").each(function(i,obj){
             var r=$(obj).text();
             values=values+parseFloat(r);
             });  
             document.getElementById("head.jhxzrs").value=values;
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
		$.post("<%=basePath %>stgl/yonggongjihua_createNum.do",{
			"headId":headId
		},function(data){
			document.getElementById("head.bianhao").value = data;
			window.parent.removeObj("#shengchenButton");
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		});
	}
	
$(function(){
window.parent.clearPanelTool();
<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 

$(function(){	
	// ----------------------------------------查看oa流程------------------------------------------
	<e:pc id="queryoa">
		var buttonStr_startoa = '[{"id":"startoa","buttonHandler":"mainWindow.startOAflow","buttonIcon":"icon-save","buttonText":"开启oa流程"}]';	
		var buttonStr_oastat = '[{"buttonHandler":"mainWindow.queryOA","buttonIcon":"icon-search","buttonText":"查看OA状态"}]';	                       
		var buttonStr_oaurl = '[{"buttonHandler":"mainWindow.queryOAurl","buttonIcon":"icon-search","buttonText":"查看OA表单"}]';	                       
		<%if(oaurl!=null){%>
			window.parent.appendButtonsFromChildren(buttonStr_oastat,"");
			window.parent.appendButtonsFromChildren(buttonStr_oaurl,"");
		<%}else{%>
			window.parent.appendButtonsFromChildren(buttonStr_startoa,"");
		<%}%>
  	</e:pc>
  	
 	jQuery("#planPersonlist").setGridWidth($("#tableWidth").width());
    jQuery("#nowPersonlist").setGridWidth($("#newtable").width());
    jQuery("#file_list").setGridWidth($("#newtable").width());
    jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
    jQuery("#file_huiqianlist").setGridWidth($("#newtable").width());
    jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
    $(window).bind('resize', function(){
		jQuery("#nowPersonlist").setGridWidth($("#tableWidth").width());
		jQuery("#blyj_reason_list").setGridWidth($("#newtable").width());
		jQuery("#file_list").setGridWidth($("#newtable").width());
		jQuery("#planPersonlist").setGridWidth($("#tableWidth").width());
		jQuery("#file_huiqianlist").setGridWidth($("#tableWidth").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#newtable").width());
    });
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

		<e:pc id="jhxzry">		
		//添加按钮  "#gview_list > .ui-jqgrid-titlebar
		var buttonJSonString = '[\<%if(!inCounterSign){%>{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"},\
								<%}%>{"buttonHandler":"checkPerson","buttonIcon":"icon-search","buttonText":"查看"}\
		]';
		addButtons(jQuery("#gview_planPersonlist > .ui-jqgrid-titlebar"),buttonJSonString);
		</e:pc>
		//办结按钮
		<e:pc id="banjie">
			var buttonStr_banjie = '[{"buttonHandler":"mainWindow.banjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
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
		//查看用工计划	
		<e:pc id="ckjhxzry">
			//添加按钮  "#gview_list > .ui-jqgrid-titlebar
			var buttonCkbgfrString = '[{"buttonHandler":"checkPerson","buttonIcon":"icon-search","buttonText":"查看"}\
			]';
			addButtons(jQuery("#gview_planPersonlist > .ui-jqgrid-titlebar"),buttonCkbgfrString);
		</e:pc>
	<%
	   }
	%>		
		
});
});

	// oa发文
	function startOAflow(){
		var url = "<%=basePath%>stgl/yonggongjihua_startOAFlow.do";
		var ngrq = document.getElementById('ngrq').value;
		var ngr = document.getElementById('ngrxm').value;
		var zbbm = document.getElementById('ngbmmc').value;
		var title = document.getElementById('head.biaoti').value;
		var EAMmsgid = '<%=headId%>';
		var yjwjurl = basePathJs+'wtdk/yonggongjihua_modifyHead.do?headId='+'<%=headId%>';
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
						window.parent.removeObj("#startoa");
						window.parent.appendButtonsFromChildren(buttonStr_oastat,"");
						window.parent.appendButtonsFromChildren(buttonStr_oaurl,"");
						window.open(data,'','');
					}
				}
			}
		);
	}

	// 查看oa状态
	function queryOA(){
		var state = document.getElementById("status").value;
		alert(state);
	}
	
	// 查看oa表单
	function queryOAurl(){
		var url = document.getElementById("oaurl").value;
		window.open(url,"","");
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
