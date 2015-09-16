<%@page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/jygdzc/liquidate/liquidatehead.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<% 
	JjzcHtqsHead head = (JjzcHtqsHead)request.getAttribute("head");
	String userTid = (String) request.getAttribute("userTid");
	String headId = (String)request.getAttribute("headId");
	if (head == null){
		head = new JjzcHtqsHead();
	}
%>

<%
	Date date = new Date();
    String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
    boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId); 
%>
<title>清算</title>
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "liquidateWorkflow";
			actionPath = "liquidateWorkflow";
		%>
		<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
<SCRIPT language=JavaScript type=text/JavaScript>
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
				jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
				jQuery("#file_list").setGridWidth($("#gridTable").width());
				jQuery("#liquidatelist").setGridWidth($("#gridTable").width());
			<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
		        $(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#gridTable").width());
					jQuery("#file_list").setGridWidth($("#gridTable").width());
					jQuery("#liquidatelist").setGridWidth($("#gridTable").width());
		        });
		        
		           //生成按扭
			  <e:pc id="scbh">
				var headBHGen = document.getElementById("bianhao").value;
				if(headBHGen == null || headBHGen.length == 0){
					var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
					window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
				}
			   </e:pc>
			   //新建正文--新加
			   //查看正文按钮 
			   //取道清算类型的值
			   var qslx = document.getElementById("qslx").value;
				<e:pc id="ckzw">
					var buttonStr_zhengwen2 = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看正文"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen2,"");
				</e:pc>
				//合成正文
			 	 <e:pc id="hczw">
			 	 if("2"!="<%=status%>"){
			 	  	var bianhao = document.getElementById("bianhao");
			 	  	
					if(bianhao.value != null && bianhao.value.length > 0){
						var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
					 	window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
		    		}
					
		     	 }
		     	 </e:pc>
				<e:pc id="sczw">  
					var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建正文" : "处理正文"%>"}]';
					if(window.parent.prependButtonsFromChildren!=null)
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
				</e:pc>
		        <e:pc id="purchase_list">
		        var buttonJSonString = '[{"buttonHandler":"choiceHT","buttonIcon":"icon-add","buttonText":"清算"},\
		       	 				{"buttonHandler":"look1","buttonIcon":"icon-add","buttonText":"查看"},\
								{"buttonHandler":"delete1","buttonIcon":"icon-remove","buttonText":"删除"},\
								{"buttonHandler":"update1","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_liquidatelist > .ui-jqgrid-titlebar"),buttonJSonString);
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
				
				<e:pc id="saveb_button">
					var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.updateContractAfterApproval","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
					window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
		       </e:pc>
        });

    function checkEAMFormJSMethod(){
    		if(isNew){
				alert("正文未被创建");
				 return false;
			}
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		   <e:pc id="scbh">
		    var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
		 </e:pc>
		 
		  var chengsong = document.getElementById("chengsong");
			if(chengsong.value == null || chengsong.value.length == 0){
				alert("呈送不能为空！");
				chengsong.focus();
		      return false;
		 }
		 var lxdh = document.getElementById("lxdh");
			if(lxdh.value == null || lxdh.value.length == 0){
				alert("联系电话不能为空！");
				lxdh.focus();
		      return false;
		    }
		 	var idArray = $("#liquidatelist").getDataIDs();
		    if(idArray == null||idArray.length == 0){
		       alert("请至少添加一条信息");
		       return false;
		    }
		    return true;
		}			
	//弹出选择合同的页面出来
	function choiceHT(){
		var contractType = $("#qslx").val();
		if(contractType == 0){
			alert("清算类型不能为空！");
			return false;
		}
		var url = '<%=basePath%>htqs/ContractQuery_init.do?returnValue=true&sheettype=liquidate&contractType='+ contractType +'&headId=<%=headId%>';//1为委管合同
		window.open(url,'','height=600, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		//window.open(url);
		//return false;
		return true;
	}
	function delete1(){
		var gr = jQuery("#liquidatelist").jqGrid('getGridParam','selarrrow');
		if (gr.length == 0){
			alert("请选择要删除的记录!");
		}else{	
			if(confirm("确认删除？")){
				var url ="<%=request.getContextPath()%>/htqs/ContractQuery_delete.do";
				$.post(url,{ids:"" + gr + ""}, function(data){
					jQuery("#liquidatelist").trigger("reloadGrid");
				});
			}
		}
	}
	function update1(){
		var gr = jQuery("#liquidatelist").jqGrid('getGridParam','selarrrow');
		if(gr.length==1&&gr==""){
			alert("请选择合同！");
			return false;
		}
		if(gr.length == 1&&gr!=""){
			window.open('<%=basePath%>htqs/ContractQuery_update.do?id='+gr);
		}else{ 
			alert("请选择一条记录");
		}
	}	
	function look1(){
		var gr = jQuery("#liquidatelist").jqGrid('getGridParam','selarrrow');
		if(gr.length==1&&gr==""){
			alert("请选择合同！");
			return false;
		}
		if(gr.length == 1&&gr!=""){
			window.open('<%=basePath%>htqs/ContractQuery_look.do?id='+gr);
		}else{ 
			alert("请选择一条记录");
		}
	}	
	//选择合同窗口的回调函数
	function addValue(inht){
		var head_id = "<%=headId%>";
		var contractid = ""+inht;
		jQuery("#liquidatelist").setGridParam(
			{
				url:"<%=basePath%>qs/LiquidateHead_addContract.do",
				postData:{"headId":head_id,"contractId":contractid }
			}).trigger("reloadGrid");		
	}
	//刷新界面上的合同列表
	function refreshlist(){
		var head_id = "<%=headId%>";
		jQuery("#liquidatelist").setGridParam(
			{
				url:"<%=basePath%>qs/LiquidateHead_refreshList.do",
				postData:{"headId":head_id}
			}).trigger("reloadGrid");
	}
	function saveHead(){
		var url = "<%=basePath%>qs/LiquidateHead_saveHead.do?sheettype=liquidate";
		myform.action = url;
		myform.submit();
	}
	function updateContractAfterApproval(){
		var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
	    }
		var headId = document.getElementById("headId").value;
		var url = "<%=basePath%>qs/LiquidateHead_updateContractAfterApproval.do";
		$.post(url,{headId:"" + headId + ""}, function(data){
			if(data!=""&&data!=null)
				alert(data);
			if(data == "办结成功！"){
				document.myform.action = document.getElementById("endUrl").value;
				document.myform.url.value = document.getElementById("endViewUrl").value;
				document.myform.outCome.value = "流程办结";
				document.myform.submit();
				return;
			}
		});
	}
		//生成编号
		function createBianhao(){
			var headId=$("#headId").val();
			$.post("<%=basePath %>htqs/ContractManageHead_createNum.do",{
				"headId":headId,
				"code":"jjgdzc_zlqs"
			},function(data){
				document.getElementById("bianhao").value = data;
				window.parent.removeObj("#shengchenButton");
				var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
			 	window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			});
		}	
     function changeHtlx(obj){
     	var htIds = jQuery("#liquidatelist").getDataIDs();
     	if(htIds.length>0){
     		alert("已添加清算合同，如果想修改清算类型，请删除已添加的数据!");
     		document.getElementById('qslx').value = document.getElementById("clickHtlx").value;
     	}
     }
   	function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
	}
     function clickHtlx(value){
     	document.getElementById("clickHtlx").value = value;
     }
     
	// 提交需要放开的属性
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}		
	
	function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
		}
   
   //（处理）新建正文
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "租赁清算正文"); 
			//修改按钮名称为“处理正文”
			window.parent.setHtml("#xjzwButton .l-btn-text","处理正文");
			window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
			isNew = false;
		}
		//查看正文
		function viewzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),true,false,"租赁清算正文"); 
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
			MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "租赁清算正文",'hechengHead()','hechengBottom()');
			window.parent.removeObj("#hczwButton");
			isMerge = true;
			//window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
		}
		
		function hechengHead(){
			MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
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
</Script>
</head>
<s:hidden name="clickHtlx" id="clickHtlx"/> 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="refreshlist();">
 <%@ include file="/inc/word.inc"%>
<s:form action="" theme="simple" method="post" name="myform" id="myform">
<s:hidden name="headId" id="headId" value="%{#request.headId}" />
<s:hidden name="sheettype" value="%{#request.sheettype}" />
<s:hidden  name="head.sheettype" value="%{#request.sheettype}" />
<s:hidden name="head.lcmc"  id="lcmc" value="租赁清算" />
<s:hidden name="head.lcId" />
<s:hidden name="head.ysyfzje" id="ysyfzje" />
<s:hidden name="head.tzzje" id="tzzje" />
<s:hidden name="head.thysyfzje" id="thysyfzje" />
<s:hidden name="head.zhuangtai" />
<s:hidden name="head.sszje" />
<s:hidden name="head.sstzzje" />
<s:hidden name="head.thsszje" />
<!-- 意见域、 依据和文件上传需要表单id -->
<s:hidden name="head.id" value="%{#request.headId}"/>
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid" />
      <br/>
      <div align="center">
        <span class="STYLE1">中国建银投资有限责任公司租赁清算处理单</span>
      </div>
      	<br/>
		<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
		<hr color="#6600CC" width="100%" />
		<!-- =========================================================================== -->
		<!-- ==========================定义工作流隐藏域==================================== -->
		<%
			String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
		%>
		<!-- 工作流表单提交URL设置 -->
		<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/qs/LiquidateHead_saveHead.do"/>
		<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
		<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
		<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
		<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
		<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
		<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/qs/LiquidateHead_saveHead.do"/>
		<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
		<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/qs/LiquidateHead_saveHead.do"/>
		<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/qs/LiquidateHead_saveHead.do"/>
		<!-- 保存后台的URL -->
		<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
		<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<!-- 传阅 -->
		<input type="hidden" name="circulationUrl" value="qs/LiquidateHead_modifyHead.do"/>
		<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
		<input type="hidden" name="circulationTitle" value="[传阅]<s:property value="head.biaoti" />"/>
		<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
		<!-- =========================================================================== -->
  <table id="gridTable" class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td width="120"  class="td_zxy01"><font color="red">*</font>标 题：</td>
	<td class="td_zxy02"  colspan="3"><r:textfield name="head.biaoti" id="biaoti" cssClass="input2"  /></td>
	</tr>
	 <tr>
	    <td class="td_zxy01"><font color="red">*</font>呈 送：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.chengsong" id="chengsong" cssClass="input2"/></td>
	  </tr>
	   <tr>
	    <td class="td_zxy01" width="120">编号：</td>
		<td class="td_zxy02"><s:textfield name="head.bianhao"  id="bianhao"  cssClass="input" readonly="true"/>
		 </td>
		<td class="td_zxy01" >急缓程度：</td>
		<td class="td_zxy02"><r:select list="#{'0':'一般','1':'急','2':'特急'}" name="head.jhcd" id="jhcd" /></td>
	  </tr>	
	  <tr>
	    <td class="td_zxy01">
						拟稿日期：
					</td>
					<td class="td_zxy02">
						<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<r:textfield id="ngrq" name="head.ngrq" cssClass="input" id="ngrq"
							value="%{#draftDate}" readonly="true" />
					</td>
		 <td  width="120"  class="td_zxy01">拟稿部门：</td>
	    <td  class="td_zxy02">
	    	 <s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    	<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
	    </td>
		</tr>
		<tr>
		<td width="120"  class="td_zxy01">拟稿人：</td>
		<td  class="td_zxy02">
		<s:hidden name="head.ngr"  value="%{#request.head.ngr}"  />
		<s:textfield name="head.ngrmc" id="ngrmc" readonly="true" maxlength="10" cssClass="input"/></td>
		<td width="120"  class="td_zxy01"><font color="red">*</font>联系电话：</td>
		<td  class="td_zxy02"><r:textfield name="head.lxdh" id="lxdh"     onblur="checkPhone(this);" cssClass="input"  /></td>
	  </tr>	
	  <tr>
	    <td class="td_zxy01">交易对象：</td>
	    <td class="td_zxy02">
	      <r:select list="#{'':'','1':'建行','2':'非建行'}"  id="ywlx" name="head.ywlx" />
	      </td>
	    <td class="td_zxy01"><font color="red">*</font>清算类型：</td>
	    <td class="td_zxy02">
	    	<r:select list="#{'':'','1':'委管清算','2':'租赁清算'}" onclick="clickHtlx(this.value)" onchange="changeHtlx(this);" id="qslx" name="head.qslx" />
		</td>
      </tr>
	 </table>
<table id="liquidatelist" width="100%"></table>
<div id="pgtoolbar1"></div>
<%@ include file="/inc/according.inc"%>  
<div id="div3">
	<e:opinion id="test" width="100%">
	    <e:opinionPart id="ACCOUNT_DEPT" biaodanid="%{#request.biaodanid}"  name="ACCOUNT_DEPT" value="" text="财务会计部意见："></e:opinionPart>
		<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
	</e:opinion>
</div>
<!-- ------------------------------- 备    注 --------------------------------- -->

<!-- ------------------------------- 文件上传 --------------------------------- -->

<%@ include file="/inc/file.inc"%>
<%@ include file="/inc/listMessage.inc"%>
</s:form>
</body>
</html>

<!-- 下面是一个jQuery 的grid-->
<script type="text/javascript">
 jQuery("#liquidatelist").jqGrid({
 	url:"<%=basePath%>qs/LiquidateHead_refreshList.do?headId=<%=headId%>",
    datatype:"json",
	colNames: ['id','合同编号','合同类型','资产编号', '资产名称',
				'清算开始日期','清算截止日期','租金(元)','调整金额(元)','调整后租金(元)','调整原因'],
    colModel: [{ name: 'id', index: 'id',align: "center",hidden:true},
    			{ name: 'htbh', index: 'htbh',align: "center",width:100},
    			{name: 'CHtlx',index: 'CHtlx',align: "center",width:100},
    			{name: 'zcbh',index: 'zcbh',align: "center",width:100},
    			{name: 'zcmc',index: 'zcmc',align: "center",width:100},
    			{name: 'qsksrq',index: 'qsksrq',align: "center",width:100},
    			{name: 'qsjzrq',index: 'qsjzrq',align: "center",width:100},
    			{name: 'yszj',index: 'yszj',align: "center",width:100},
    			{name: 'qstzje',index: 'qstzje',align: "center",width:100},
    			{name: 'xghyszj',index: 'xghyszj',align: "center",width:100},
    			{name: 'ysxgyy',index: 'tzyy',align: "center",width:100}
            	],
            	loadComplete:function(data){
					if(data && data.rows.length>0){
						jQuery("#liquidatelist").setGridHeight(data.rows.length * 22 + 18);
					}else{
						jQuery("#liquidatelist").setGridHeight(0);
					}
				},
				shrinkToFit:false,
			   	rownumbers:true,
			   	autowidth:true,
			 	rowNum:10,
				height:'auto',
				footerrow : true, 
				userDataOnFooter : true, 
			   	multiselect:true,
				caption: '清算合同列表',
	            autowidth: false,
            	multiselect: true,
            	jsonReader : {
					root:"rows",
					repeatitems: false,
					id: "0"
				},
				gridComplete:function(){
					var allIds = jQuery("#liquidatelist").jqGrid('getDataIDs');
					var yszjs = 0.0;
					var qstzjes = 0.0;
					var xghyszjs = 0.0;
					for(var i = 0; i < allIds.length; i++){
						var yszj = jQuery("#liquidatelist").getCell(allIds[i],"yszj");
						var qstzje = jQuery("#liquidatelist").getCell(allIds[i],"qstzje");
						var xghyszj = jQuery("#liquidatelist").getCell(allIds[i],"xghyszj");
						yszjs += parseFloat(yszj);
						qstzjes += parseFloat(qstzje);
						xghyszjs += parseFloat(xghyszj);
					}
					document.getElementById("ysyfzje").value = yszjs;
					document.getElementById("tzzje").value = qstzjes;
					document.getElementById("thysyfzje").value = xghyszjs;
				}
            });
</script>

