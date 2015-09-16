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
<!-- ==========================  权限控制添加     ========================================  -->
<r:controlfile file="/pages/eam2/cjtz/dealTrace1/shenqinjiean4cjtz.ctl.xml"></r:controlfile>
 <!--================================================================================== -->
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
	actionSpaceName = "cjtzWorkflow";
	actionPath = "cjtz_sqja_Workflow";
%>
<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
<!-- ================================================================================== -->
		<SCRIPT language=JavaScript type=text/JavaScript>
$(document).ready(function(){
		<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>

		jQuery("#file_list").setGridWidth($("#table").width());
		jQuery("#blyj_reason_list").setGridWidth($("#table").width());
		jQuery("#purchaselist").setGridWidth($("#table").width());
		jQuery("#file_huiqianlist").setGridWidth($("#table").width());
	    $(window).bind('resize', function(){
			jQuery("#file_huiqianlist").setGridWidth($("#table").width());
			jQuery("#file_list").setGridWidth($("#table").width());
			jQuery("#blyj_reason_list").setGridWidth($("#table").width());
			jQuery("#purchaselist").setGridWidth($("#table").width());
       });
		//（处理）新建正文按钮
	<e:pc id="xinjianzhengwen">
		var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文" %>"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
       //办结按钮
	<e:pc id="banjie">
		var buttonStr_banjie = '[{"buttonHandler":"mainWindow.liuchengbanjie","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';
		window.parent.appendButtonsFromChildren(buttonStr_banjie,"");
	</e:pc>
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
	addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);purchaselist
	</e:pc>
	<e:pc id="zhixingqingkuang">
	var zhixingqingkuangJSonString = '[{"buttonHandler":"zhixingqingkuang","buttonIcon":"icon-add","buttonText":"执行情况"}]';
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),zhixingqingkuangJSonString);
	</e:pc>
	//查看正文按钮
	<e:pc id="chakanzhengwen">
		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
		window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
	</e:pc>
	 //生成编号
     <e:pc id="bianhao_button">
			var headBHGen = document.getElementById("bh").value;
			if(headBHGen == null || headBHGen.length == 0){
				var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
				window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
			}else{
			 	<e:pc id="hechengzhengwen">
				   <%
				    if(!"2".equals(status)){
				   %>
					var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
					window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
					<%
					   }
					%>
				</e:pc>
			}
	   </e:pc>
   
});
function add1(){
	var url = "<%=request.getContextPath()%>/zccz/dealTrace1Head_addXm.do?xmlx=${xmlx}&isAdd=true&headId=${head.id}";//弹出项目列表
	window.open(url);
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
				$.post("<%=request.getContextPath()%>/cjtz/dealTrace2_getCode.do",{
					"headId":headId
				},function(data){
					document.getElementById("bh").value = data;
					window.parent.removeObj("#shengchenButton");
					var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
				    window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
				});
			}
			// 页面js验证
function checkEAMFormJSMethod(){
	var title = document.getElementById("biaoti");
	if(title.value == null || title.value.length == 0){
		alert("标题不能为空！");
		title.focus();
      	return false;
    }
   	var idArray = $("#purchaselist").getDataIDs();
    if(idArray == null||idArray.length == 0){
       alert("请至少添加一条信息");
       return false;
    }
    return true;
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
	    return true;
	}
function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
	
function liuchengbanjie(){
		var bianhao = document.getElementById('bh').value; 
			if(bianhao ==""){
				alert("请先生成编号");
				return false;
			}
			var headId = document.getElementById('headId').value; 
			var url = "<%=request.getContextPath()%>/cjtz/dealTrace2_banjie.do";
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
</SCRIPT>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden name="datas2" />
 <%@ include file="/inc/word.inc"%>
<s:form id="myform" name="myform" action="">
<s:hidden name="xmlx" />
<s:hidden name="head.id" id="headId"/>
<s:hidden name="head.lcmc" id="lcmc"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!--新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  />
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/cjtz/dealTrace2_saveHead.do"/>
<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/cjtz/dealTrace2_saveHead.do"/>
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/cjtz/dealTrace2_saveHead.do"/>
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/cjtz/dealTrace2_saveHead.do"/>
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->
<input type="hidden" name="circulationUrl" value="cjtz/dealTrace2_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅] <s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
<!-- 会签属性 -->
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  /> 
<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" /> 会签办理单"/>
<input type="hidden" name="counterSignUrl" value="cjtz/dealTrace2_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- =========================================================================== -->
	        <br/>
				<div align="center">
					<span class="STYLE7 STYLE1">中国建银投资有限责任公司投资方案执行情况备案处理单</span>
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
				    <td class="td_zxy01" ><font color="red"><strong>*</strong></font>呈 送：</td>
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
					<e:opinionPart id="CHECK_DEPT" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT" value="" text="审核部门意见："></e:opinionPart>
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
		<%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>				
	   <%@ include file="/inc/file.inc"%>
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
	height:'auto',
	viewrecords:true,
	rowNum:0,
	caption: '结案项目列表（单位：元）',
	editurl: '<%=basePath%>zccz/dealTrace1Head_editCzXm.do?headId=${headId}',
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
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("cztzxmmc").value,2,false,false,false,false);
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
