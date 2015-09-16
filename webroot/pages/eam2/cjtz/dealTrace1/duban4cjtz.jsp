<%@page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = request.getAttribute("headId").toString();
	Date date = new Date();
	String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId);
%>
<!-- ==========================  权限控制添加     ======================================== 
<r:controlfile file="/pages/eam2/cjtz/dealTrace1/duban4cjtz.ctl.xml"></r:controlfile>
 ================================================================================== -->
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
		<title>督办</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "cjtzWorkflow";
	actionPath = "cjtz_duban_Workflow";
%>
<script>
	function commitWorkflow(taskId,outCome){
		<%
			if(workflowVO.taskName.equals("秘书处综合处理")){
		%>
				if(outCome=="办理部门综合处理"){
					document.getElementById("commitNextTodoUrl").value = "cjtzWorkflow/cjtz_duban_Workflow_msczhclTodo.do";

					document.myform.result.value = 'msczhclCommit';
					document.myform.action = "<%=request.getContextPath()%>/cjtz/supervision2_saveHead.do";
					document.myform.nextTodoUrl.value = $("#commitNextTodoUrl").val();
					document.myform.didUrl.value = $("#commitDidUrl").val();
					document.myform.taskId.value = taskId;
					document.myform.outCome.value = outCome;
					if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
			            if(beforeWorkFlowSubmit instanceof Function){
			                var result = beforeWorkFlowSubmit(taskId,outCome);
			                if(!result) return;
			            }
		        	}

					return true;
				} 
		<%
			}
		%>
		return true;
	}
</script>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
<SCRIPT language=JavaScript type=text/JavaScript>
$(document).ready(function(){
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>

		jQuery("#file_list").setGridWidth($("#table").width());
		jQuery("#blyj_reason_list").setGridWidth($("#table").width());
		jQuery("#purchaselist").setGridWidth($("#table").width());
		jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
		jQuery("#file_huiqianlist").setGridWidth($("#table").width());
	    $(window).bind('resize', function(){
			jQuery("#file_huiqianlist").setGridWidth($("#table").width());
			jQuery("#file_list").setGridWidth($("#table").width());
			jQuery("#blyj_reason_list").setGridWidth($("#table").width());
			jQuery("#purchaselist").setGridWidth($("#table").width());
			jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
       });
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
	<e:pc id="zhixingqingkuang">
	var zhixingqingkuangJSonString = '[{"buttonHandler":"zhixingqingkuang","buttonIcon":"icon-add","buttonText":"执行情况"}]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),zhixingqingkuangJSonString);
	</e:pc>
	 //生成编号
     <e:pc id="bianhao_button">
			var headBHGen = document.getElementById("bh").value;
			if(headBHGen == null || headBHGen.length == 0){
				var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
			}else{
				<e:pc id="tijiaobanlidan">
					var bldButtonStr = '[{"buttonHandler":"mainWindow.bldCommit","buttonIcon":"icon-finishFlow","buttonText":"提交办理单"}]';		
										  window.parent.appendButtonsFromChildren(bldButtonStr,"");
				</e:pc>
			}
	   </e:pc>
});
function add1(){
	var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_addXm.do?xmlx=${xmlx}&isAdd=true&headId=${head.id}";//弹出项目列表
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
function zhixingqingkuang(){
	var gr = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1&&gr[0].length ==0 ){
		alert("没有可以选择的处置项目！");
	}else if(gr.length==1){
		var url = "<%=request.getContextPath()%>/cjtz/dealTrace2_zhixingqingkuang.do?xmIds="+gr+"&headId="+document.getElementById("headId").value;
		var _g_privateDialogFeatures = 'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
		window.open(url,'',_g_privateDialogFeatures);
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
				$.post("<%=request.getContextPath()%>/cjtz/supervision_getCode.do",{
					"headId":headId
				},function(data){
					document.getElementById("bh").value = data;
					window.parent.removeObj("#shengchenButton");
					<e:pc id="tijiaobanlidan">
						var bldButtonStr = '[{"buttonHandler":"mainWindow.bldCommit","buttonIcon":"icon-finishFlow","buttonText":"提交办理单"}]';		
											  window.parent.appendButtonsFromChildren(bldButtonStr,"");
					</e:pc>
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
	function checkEAMFormJSMethod(){
		
		var ti = document.getElementById("biaoti");
	    var  bianhao= document.getElementById("bh");
	    var  lxdh= document.getElementById("lxdh");
	    var  blbm= document.getElementById("blbm");
		if(ti.value == null || ti.value.length == 0){
			alert("标题不能为空！");
			ti.focus();
	      	return false;
	    }else if(lxdh.value == null || lxdh.value.length == 0){
			alert("联系电话不能为空！");
			lxdh.focus();
	      	return false;
	    <e:pc id="bianhao_button">
	    }else if(bianhao.value == null || bianhao.value.length == 0){
	    	alert("请生成编号！")
	      	return false;
      	</e:pc>
	    }
	    if(blbm.value == null|| blbm.value.length==0){
	   		alert("请选择办理部门！")
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
	
function liuchengbanjie(){
				alert("办结成功！");
					document.myform.action = document.getElementById("endUrl").value;
					document.myform.url.value = document.getElementById("endViewUrl").value;
					document.myform.outCome.value = "流程办结";
					document.myform.sheetId.value = document.getElementById("bh").value;
					document.myform.submit();
					return;
		}
// 打开树
function openTreeByType(type4jygdzc){//打开树，根据类型打开类型  
	if(type4jygdzc =='blbm'){
		isSYBMorGLBM = type4jygdzc;
		type4jygdzc = 'department';
	}
	var url = basePathJs + "chooseHqbm.do?deptType=0&ids=" + document.getElementById("blbmbh").value;
	var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
	window.open(url,'',_g_privateDialogFeatures);
}

// 关闭树以后的回调发方法，得到办理部门和办理部门编号
function getCallBack4Tree(ids,value){
	document.getElementById("blbm").value = value;
	document.getElementById("blbmbh").value = ids;
}

</SCRIPT>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden name="datas2" />
<s:form id="myform" name="myform" action="">
<s:hidden name="xmlx" />
<s:hidden name="head.id" id="headId"/>
<s:hidden name="head.lcmc" id="lcmc"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/cjtz/supervision_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/cjtz/supervision_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/cjtz/supervision_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/cjtz/supervision_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "msczhclDid.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="cjtz/supervision_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  /> 
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 办理单"/>
<input type="hidden" name="counterSignUrl" value="cjtz/supervision_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- 提交多个办理单 -->
<input type="hidden" name="bldTitle" value="<s:property value="head.biaoti" /> 办理单"/>
<input type="hidden" name="bldUrl" value="cjtz/supervision2_modifyHead"/>
<!-- =========================================================================== -->
	        <br/>
				<div align="center">
					<span class="STYLE7 STYLE1">中国建银投资有限责任公司投资方案执行情况督办处理单</span>
				</div>
				<br/>
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
						<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>办理部门：</td>
						<td class="td_zxy02" colspan="3">
							<s:hidden id="blbmbh" name="head.hqbmid"/>
							<r:textfield id="blbm" name="head.hqbm" cssClass="input2" readonly="true"/>
							<e:pc id="blbman"><img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('blbm');" width="21" height="20" align="absmiddle"/></e:pc>
						</td>
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
							<s:textfield name="head.ngbmmc" id="ngbmmc" cssClass="input" disabled="true" />
							<s:hidden name="head.ngbm"/>
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
	    				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="办理部门意见："></e:opinionPart>
							<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
	    				<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
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
		<%@ include file="/inc/file_huiqian_end.inc"%>			
	   <%@ include file="/inc/file.inc"%>
	<%@ include file="/inc/listMessage.inc"%>	
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:'<%=basePath%>zccz/dealTrace1Head_findCzXmByCldId.do?headId=${head.id}',
	datatype: "json",
	mtype:"POST",
   	colNames: ['xmId','编号', '处置项目名称','业务类型','拟稿部门', '拟稿人', 
   	'项目状态','会议纪要签发日期','最新更新日期'],
	colModel: [
		{name: 'xmId',index: 'xmId',align: "center",hidden:true}, 
		{name: 'bh',index: 'bh',align: "center"}, 
		{name: 'czxmmc',index: 'czxmmc',align: "center"}, 
		{name: 'ywlx',index: 'ywlx',align: "center"}, 
		{name: 'ngbmmc',index: 'ngbm',align: "center"}, 
		{name: 'ngrmc',index: 'ngrmc',align: "center"}, 
		{name: 'xmzt',index: 'xmzt',align: "center"}, 
		{name: 'hyjyqfrq',index: 'hyjyqfrq',align: "center"}, 
		{name: 'zxgxrq',index: 'zxgxrq',align: "center"}
		],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '项目列表',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
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
</script>
