<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<% 
  //boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
	   boolean isNgbmzhcl = true;
%>
<%
    String headId = (String)request.getAttribute("headId");
	String userTid = (String) request.getAttribute("userTid");
    Date date = new Date();
    String strDate = DateUtils.formatDate(date, "yyyy-MM-dd");
    status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
    statusjysy = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "blank_Template_jysy"); 
    String userName=(String)request.getAttribute("userName"); 
    boolean inCounterSign = com.tansun.eam2.common.util.CounterSignStatus.getStatus(headId); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- ==========================工作流属性初始 化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<!-- ==========================页面权限控制=========================================== -->
<r:controlfile file="/pages/eam2/jygdzc/asset/agentScrapt.ctl.xml"></r:controlfile>	
<html>
<head>
<title>经营性固定报废</title>
<!-- ==========================工作流javascript========================================= -->
<%
	String formName = "myform";
	actionSpaceName = "jygdzcWorkflow";
	actionPath = "jygdzcWorkflow";
%>
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- 会签属性 -->
	<% 
		if(workflowVO.taskName.equals("业务管理部门综合处理")||workflowVO.taskName.equals("建银实业综合处理")){
			counterSignBtnDisplay = true;
		}
	%>
<!-- ================================================================================== -->
<script type="text/javascript">
		var isInit=false;
		//建投新建正文合成正文=============================
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
	 	//建银实业新建正文合成正文========================
        if("0"=="<%=statusjysy%>"){
	      	var isNewjysy = true;
       	}else{
	      	var isNewjysy = false;
        } 
	 	if("2"=="<%=statusjysy%>"){
	      	var isMergejysy = true;
       	}else{
	      	var isMergejysy = false;
        } 
        //==============================================
      $(document).ready(function(){	
      	window.parent.clearPanelTool();
        if(isInit)return;
        isInit = true;	
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
				jQuery("#purchase_list").setGridWidth($("#table").width());
				jQuery("#blyj_reason_list").setGridWidth($("#table").width());
				jQuery("#file_list").setGridWidth($("#table").width());
				jQuery("#file_huiqianlist").setGridWidth($("#table").width());
				jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
			    $(window).bind('resize', function(){
					jQuery("#purchase_list").setGridWidth($("#table").width());
					jQuery("#blyj_reason_list").setGridWidth($("#table").width());
					jQuery("#file_list").setGridWidth($("#table").width());
					jQuery("#file_huiqianlist").setGridWidth($("#table").width());
					jQuery("#file_huiqian_endlist").setGridWidth($("#table").width());
			       });
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
			 // 生成编号	
     
			   
			    //合成正文按钮
			<%
			    if(!inCounterSign){
			%>
			
			  
				var headBHGen = document.getElementById("bianhao").value;
				if(headBHGen == null || headBHGen.length == 0){
					 <e:pc id="scbh">
					var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
					window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
					  </e:pc>
				}else{
				 
				<e:pc id="hczw">
		   <%
		    if(status.equals("1")){
		   %>
		   
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成中国建投正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			<%
			   }
			%>
		</e:pc>
		<e:pc id="hczwjysy">
		   <%
		    if(statusjysy.equals("1")){
		   %>
			var buttonStr_hechengzhengwen = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwenjysy","buttonIcon":"icon-mergeFile","buttonText":"合成建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen,"");
			<%
			   }
			%>
		</e:pc>
		}
		 //（处理）新建正文按钮
		<e:pc id="sczw">
			<%
			if (workflowVO.taskName.equals("业务管理部门综合处理")) {
			%>
				if("0"!="<%=status%>"){
					var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建中国建投正文" : "处理中国建投正文" %>"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			 	}
			<%
				}else{
			%>
					var buttonStr_zhengwen = '[{"id":"xjzwButton","buttonHandler":"mainWindow.openzhengwen","buttonIcon":"icon-createFile","buttonText":"<%=status.equals("0") ? "新建中国建投正文" : "处理中国建投正文" %>"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			<%
				}
			%>

		</e:pc>
		<e:pc id="sczwjysy">
		<%
			if (workflowVO.taskName.equals("建银实业综合处理")) {%>	
				if("0"!="<%=statusjysy%>"){
					var buttonStr_zhengwen_Jysy = '[{"id":"xjzwjysyButton","buttonHandler":"mainWindow.openzhengwenJysy","buttonIcon":"icon-createFile","buttonText":"<%=statusjysy.equals("0") ? "新建建银实业正文" : "处理建银实业正文" %>"}]';
					window.parent.prependButtonsFromChildren(buttonStr_zhengwen_Jysy,"");
				}
			<%	
				}else{
			%>
				var buttonStr_zhengwen_Jysy = '[{"id":"xjzwjysyButton","buttonHandler":"mainWindow.openzhengwenJysy","buttonIcon":"icon-createFile","buttonText":"<%=statusjysy.equals("0") ? "新建建银实业正文" : "处理建银实业正文" %>"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen_Jysy,"");
			<%
				}
			%>
		</e:pc>
		//查看正文
		<%
 		String DLRmc = (String)request.getAttribute("DLRmc");
		   if ("建银实业".equals(request.getAttribute("DLRbmmc"))&&"0"!=statusjysy) {
		%>
		
		<e:pc id="ckzwjysy">
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		<%
		}else if(!"建银实业".equals(request.getAttribute("DLRbmmc"))&&!userName.equals(DLRmc)){
		%>
		if("0"!="<%=status%>"){
			<e:pc id="ckzw">
				var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看中国建投正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			</e:pc>
		}
		<e:pc id="ckzwjysy">
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		</e:pc>
		<%
			}
		%>
		<e:pc id="purchase_list">
		var buttonScrapJSonString = '[{"buttonHandler":"add_Asset","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delete_Asset","buttonIcon":"icon-remove","buttonText":"删除"}\
		]';
		addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonScrapJSonString);
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
		
				//<e:pc id="jskp">
	    <%
			if(workflowVO.getStep().equals("end")){
		%>
		        var buttonStr_fs = '[{"buttonHandler":"mainWindow.removeCard","buttonIcon":"icon-remove","buttonText":"减少卡片"}]';	                       
		        window.parent.appendButtonsFromChildren(buttonStr_fs,"");
	    <%
			}
		%>
			//    </e:pc>	
	     <e:pc id="banjie">
			var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
			window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
      	 </e:pc>
		<%
		   }else{
		 	String DLRmc = (String)request.getAttribute("DLRmc");
		   if ("建银实业".equals(request.getAttribute("DLRbmmc"))) {
		%>
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		<%
			}else if(!"建银实业".equals(request.getAttribute("DLRbmmc"))&&!userName.equals(DLRmc)){
		%>
			
			//查看正文按钮 建投
			var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看中国建投正文"}]';
			window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
			//查看正文按钮 建银实业
	 		var buttonStr_zhengwen = '[{"buttonHandler":"mainWindow.viewzhengwenjysy","buttonIcon":"icon-viewFile","buttonText":"查看建银实业正文"}]';
				window.parent.prependButtonsFromChildren(buttonStr_zhengwen,"");
		<%
			}
		  }
		%>
	});
			
		function delete_Asset(){
			var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
			 if (gr.length == 0){
				alert("请选择要删除的记录!");
			}else{	
				if(confirm("确认删除？")){
					var sheettype = "${sheettype}";
					var headId="${headId}";
					var delblyjurl ="<%=request.getContextPath()%>/jygdzc/AssetManageBody_deleteBody.do?";
					$.post(delblyjurl,{headId:"" + headId + "",zcId:"" + gr + "",sheettype:"" + sheettype + ""},function(){
						reloadGrid();
					});
				}
			}
			return false;
		};
		function changeNgbmmc(){
			var dept = document.getElementById("ngbm");
    	 	var i =document.getElementById("ngbm").selectedIndex;
    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
		}
		function add_Asset(){
	       //取到处理单Id 即headId
	        var bmbh = document.getElementById('ngbmmc').value;
	        bmbh = encodeURI(bmbh);
			var headId = document.getElementById("headId").value; 
			window.open('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?ywlx=check&returnValue=true&cldId='+headId+'&bmbh='+bmbh,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			return false;
		};
		function createBook4Card(){
	 		var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
	    <%
			if (workflowVO.taskName.equals("业务管理部门综合处理")) {
		%>
		//	var chengsong = document.getElementById("chengsong");
		//	if(chengsong.value == null || chengsong.value.length == 0){
		//		alert("呈送不能为空！");
		//		chengsong.focus();
		//      return false;
		 //   }
		 //   if(!isMerge){
		 //   	alert("请先合成正文");
	    //	 	return false;
	   	//	}
		<%
			}else{
		%>	
	     	if(!isMergejysy){
		    	alert("请先合成正文");
	    	 	return false;
	   		}
		 <%
	   		 }
		 %>
		 	if(confirm("是否办结")){
				var headId = "${headId}"; 
				var url = "<%=basePath%>jygdzc/AssetManageHead_createBookBycldId.do";
				$.post(url,{headId:"" + headId + ""}, function(data){
					if(data !=""){
						alert(data);
						if(data=="办结成功"){
							document.myform.action = document.getElementById("endUrl").value;
							document.myform.url.value = document.getElementById("endViewUrl").value;
							document.myform.sheetId.value = document.getElementById("bianhao").value;
							document.myform.outCome.value = "流程办结";
							document.myform.submit();
							return false;
						}
					}
				});
			}
		}	
		function commitWorkflow(taskId,outCome){
		<%
			if (workflowVO.taskName.equals("建银实业综合处理")) {
		%>
			if("业务管理部门综合处理"==outCome){
				if("0"=="<%=statusjysy%>"){
			      	alert("正文未新建");
		    	 	return false;
	        	}else{
					if(!isMergejysy){
				    	alert("请先合成正文");
			    	 	return false;
			   		}
		        } 
			}
		<%
			}else if(workflowVO.taskName.equals("业务管理部门综合处理")){
		%>	
			if("业务运营组处理"==outCome||"承办部门综合处理"==outCome){
			    if(!isMerge){
			    	alert("请先合成正文");
		    	 	return false;
		   		}
			}
		<%
			}
		%>
			
			return true;
		}
    	 function checkEAMFormJSMethod(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		    
		   // var chengsong = document.getElementById("chengsong");
			//if(chengsong.value == null || chengsong.value.length == 0){
			//	alert("呈送不能为空！");
			//	chengsong.focus();
		    //  return false;
		   // }
		    var lxdh = document.getElementById("lxdh");
			if(lxdh.value == null || lxdh.value.length == 0){
				alert("联系电话不能为空！");
				lxdh.focus();
		      return false;
		    }
		     var bianhao = document.getElementById("bianhao");
		     <e:pc id="scbh">
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
            </e:pc>
            
            var idArray = $("#purchase_list").getDataIDs();
		    if(idArray == null||idArray.length == 0){
		       alert("请至少添加一条资产");
		        return false;
		    }
		     return true;
		}
		//校验联系电话
		function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
		}
		//生成编号
		function createBianhao(){
			var headId=$("#headId").val();
			$.post("<%=basePath %>jygdzc/AssetManageHead_createNum.do",{
				"headId":headId,
				"code":"jjgdzc_agentscrapt"
			},function(data){
				document.getElementById("bianhao").value = data;
				window.parent.removeObj("#shengchenButton");
				//var buttonStr_hechengzhengwen1 = '[{"id":"hczwButton","buttonHandler":"mainWindow.hechengzhengwen","buttonIcon":"icon-mergeFile","buttonText":"合成正文"}]';
			   // window.parent.prependButtonsFromChildren(buttonStr_hechengzhengwen1,"");
			});
			}
		<!-- ============================================================================ -->
	
			//（处理）新建正文
			function openzhengwen(){
				wordTemplate('bank_Template', document.getElementById("myform"),false,true, "正文"); 
				//修改按钮名称为“处理正文”
				window.parent.setHtml("#xjzwButton .l-btn-text","处理中国建投正文");
				window.parent.setClass("#xjzwButton .l-btn-text","l-btn-text icon-dealFile");
				isNew = false;
			}
			function openzhengwenJysy(){
				wordTemplate('blank_Template_jysy', document.getElementById("myform"),false,true, "固产报废（代理机构）正文"); 
				//修改按钮名称为“处理正文”
				window.parent.setHtml("#xjzwjysyButton .l-btn-text","处理建银实业正文");
				window.parent.setClass("#xjzwjysyButton .l-btn-text","l-btn-text icon-dealFile");
				isNewjysy = false;
			}
			//查看正文
			function viewzhengwen(){
				wordTemplate('bank_Template', document.getElementById("myform"),true,false,"固产报废（代理机构）正文"); 
			}
			//查看正文
			function viewzhengwenjysy(){
				wordTemplate('blank_Template_jysy', document.getElementById("myform"),true,false,"固产报废（代理机构）正文"); 
			}
			//合成正文
			function hechengzhengwen(){
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
			    var chengsong = document.getElementById("chengsong");
				if(chengsong.value == null || chengsong.value.length == 0){
					alert("呈送不能为空！");
					chengsong.focus();
			      return false;
			   }
				MergeWordStart('manager_jic_jysy_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("myform"), "固产报废（代理机构）正文",'hechengHead()','hechengBottom()');
				window.parent.removeObj("#hczwButton");
				isMerge = true;
				<%
					if (workflowVO.taskName.equals("业务管理部门综合处理")) {
					
				%>
					window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
				<%
					}
				%>
			}
			//合成正文
			function hechengzhengwenjysy(){
				if(isNewjysy){
					alert("正文未被创建");
					 return false;
				}
				var biaoti = document.getElementById("biaoti");
				if(biaoti.value == null || biaoti.value.length == 0){
					alert("标题不能为空！");
					biaoti.focus();
			      return false;
			    }
			    //var chengsong = document.getElementById("chengsong");
				//if(chengsong.value == null || chengsong.value.length == 0){
				//	alert("呈送不能为空！");
				//	chengsong.focus();
			    //  return false;
			   // }
				MergeWordStart('manager_jysy_gzlxdht','blank_Template_jysy','manager_gzlxdbj' , document.getElementById("myform"), "固产报废（代理机构）正文",'hechengHeadJysy()','hechengBottomJysy()');
				window.parent.removeObj("#hczwButton");
				isMergejysy = true;
				<%
					if (workflowVO.taskName.equals("建银实业综合处理")) {
					
				%>
					window.parent.prependButtonsFromChildren(huiqianButtonStr,huiqianmenuStr);
				<%
					}
				%>
			}
			
			function hechengHead(){
				MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			
			}
			function beforeWorkFlowSubmit(){
				$("input").removeAttr("disabled");	
				$("textarea").removeAttr("disabled");	
				$("select").removeAttr("disabled");	
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
			function checkEAMFormTitle(){
				var biaoti = document.getElementById("biaoti");
				if(biaoti.value == null || biaoti.value.trim().length == 0){
					alert("标题不能为空！");
					biaoti.focus();
			      return false;
			    }
			     return true;
			}	
			function hechengHeadJysy(){
				MyRangeHead.find.execute("￥￥CS",false,false,false,false,false,true,false,false,document.getElementById("chengsong").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥LCMC",false,false,false,false,false,true,false,false,document.getElementById("lcmc").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥LCBH",false,false,false,false,false,true,false,false,document.getElementById("bianhao").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,document.getElementById("biaoti").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥BLBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
				MyRangeHead.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,document.getElementById("ngbmmc").value,2,false,false,false,false);
			
			}
			
			function hechengBottomJysy(){
			    var strDate = "<%=strDate%>";
				MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,"建银实业控股有限责任公司",2,false,false,false,false);
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
		//双击查看资产
			function lookAsset(gr){
				window.open('<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?isdisable=true&headId=${headId}&sheettype=assetInfo&zcId='+gr,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
<s:form action="jygdzc/AssetManageHead_saveHead.do" method="post" id="myform" name="myform">
<s:hidden name="head.id" id="headId" value="%{#request.headId}" />
<s:hidden name="headId" value="%{#request.headId}" />
<s:hidden  name="sheettype" value="%{#request.sheettype}" />
<s:hidden  name="head.sheettype" value="%{#request.sheettype}" />
<s:hidden name="head.lcmc" id="lcmc" value="经营性固定报废(代理机构)" />
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- 新建正文需要的 -->
<r:userhidden id="userid" />
<r:depthidden view="N" name="deptnameshow" />
<r:depthidden view="N" name="deptid"  /> 
<!-- ==========================定义工作流隐藏域==================================== -->
<%
	String urlHeader = request.getContextPath() + "/" + actionSpaceName + "/" + actionPath + "_";
%>
<!-- 工作流表单提交URL设置 -->
<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<input type="hidden" id="abandonUrl" value="<%=urlHeader + abandonMethod + ".do"%>" />
<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
<input type="hidden" id="endUrl" value="<%=urlHeader + endMethod + ".do"%>" />
<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
<input type="hidden" id="participationUrl" value="<%=urlHeader + participationMethod + ".do"%>" />
<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
<!-- 保存后台的URL -->
<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do" />
<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
<!-- 传阅 -->  
<input type="hidden" name="circulationUrl" value="jygdzc/AssetManageHead_modifyHead.do"/>
<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
<input type="hidden" name="circulationTitle" value="[传阅]<s:property value="head.biaoti" />"/>
<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>

<input type="hidden" name=counterSignTitle value="<s:property value="head.biaoti" />会签办理单"/>
<input type="hidden" name="counterSignUrl" value="jygdzc/AssetManageHead_modifyHead"/>
<input type="hidden" name="actionName" value="<%=actionPath%>_todo"/>
<input type="hidden" name="namespace" value="<%=actionSpaceName%>"/>
<!-- ============================================================================ -->
      <br/>
      <div align="center">
        <span class="STYLE7 STYLE1">中国建银投资有限责任公司经营性固产报废(代理机构)<%@ include file="/pages/rdp4j/workflow/task/workflow_title_include.jsp"%></span>
      </div>
      <br/>
<!-- ==========================工作流信息项======================================= -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
      <hr color="#6600CC" align="center" width="100%"/>
     
<table class="newtable"  id="table" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
	    <td class="td_zxy01"><font color="red">*</font>标 题：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.biaoti" id="biaoti" cssClass="input2" value="%{#request.head.biaoti}"/></td>
	  </tr>
	  <tr>
	    <td class="td_zxy01"><font color="red">*</font>呈 送：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.chengsong" id="chengsong" cssClass="input2" value="%{#request.head.chengsong}"/></td>
	  </tr>
	  <tr>
		<td class="td_zxy01" >编号：</td>
		<td class="td_form02">
			<s:textfield name="head.bianhao"  cssClass="input" id="bianhao"   readonly="true"/>
		 </td>
		<td class="td_zxy01">急缓程度：</td>
		<td class="td_zxy02"><r:select list="#{'0':'一般','1':'急','2':'特急'}" name="head.jhcd" id="jhcd" value="%{#request.head.jhcd}"/></td>
	  </tr>	
	  <tr>
		<td class="td_zxy01" >拟稿人：</td>
		<td class="td_zxy02">
		<s:hidden name="head.ngr"   value="%{#request.head.ngr}" />
		<r:textfield name="head.ngrmc" id="ngr" cssClass="input" value="%{#request.head.ngrmc}"  readonly="true" /></td>
		<td class="td_zxy01" > <font color="red">*</font>联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" id="lxdh" cssClass="input" onblur="checkPhone(this)" value="%{#request.head.lxdh}"/></td>
	  </tr>	
	  <tr>
	   <td  class="td_zxy01">拟稿日期：</td>
	    <td class="td_zxy02"><s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
			<r:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#draftDate}" readonly="true" /></td>
	    <td  class="td_zxy01" >拟稿部门：</td>
	    <td class="td_zxy02">
	    	<s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    	<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
	    </td>
	  </tr>	
	  <tr>
			<td class="td_zxy01">
				会签部门：
			</td>
			<td class="td_form02" colspan="3">
				<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"
					cssClass="input2" />
				<s:hidden name="head.hqbmid" id="hqbmids" />
				<e:pc id="xzhq">
					<img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType();" width="21" height="20"
						align="absmiddle" />
				</e:pc>
			 <%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" isJianTou="Y"/><%} %>	
			</td>
		</tr>	
		<tr>
			<td class="td_zxy01">
				委托管理机构会签部门：
			</td>
			<td class="td_form02" colspan="3">
				<r:textfield name="head.syhqbm" id="hqbmvalue1" readonly="true"
					cssClass="input2" />
				<s:hidden name="head.syhqbmid" id="hqbmids1" />
				<e:pc id="syxzhq">
					<img
						src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
						onclick="openTreeByType1();" width="21" height="20"
						align="absmiddle" />
				</e:pc>
			<%if(inCounterSign){%><e:countersign biaodanId="%{#request.biaodanid}" isJianTou="N"/><%} %>
			</td>
		</tr>
 </table>
				<div id="div11" style="display:block">
						<table id="asset_list"></table>
			              <div id="asset1"></div>
				</div>
				<div id="div22" style="display:block">
						<table id="purchase_list"></table>
			              <div id="pgtoolbar1"></div>
				 </div>
       
 <%@ include file="/inc/according.inc"%>  
    <e:opinion id="test" width="100%">
       		<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}"  value="" text="批示意见："></e:opinionPart>
       		<e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}"  name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
	   		<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}"  name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart id="MEETING_DEPT"  biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见：">
			</e:opinionPart>
			<!-- ==========================工作流信息项======================================= -->
			<%@ include file="/pages/rdp4j/workflow/task/counterSign_opinion_include.jsp"%>
			<!-- =========================================================================== -->
			<e:opinionPart id="WORK_MANAGE_DEPT" biaodanid="%{#request.biaodanid}"  name="WORK_MANAGE_DEPT" value="" text="业务管理部门意见："></e:opinionPart>
			<e:opinionPart id="AGENT_MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="AGENT_MEETING_DEPT" value="" text="委托管理机构内部会签意见："/>
			<e:opinionPart id="AGENT_MANAGE_DEPT" biaodanid="%{#request.biaodanid}"  name="AGENT_MANAGE_DEPT" value="" text="委托管理机构意见："></e:opinionPart>
            <e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
       </e:opinion>
    <%@ include file="/pages/rdp4j/workflow/task/counterSign_file_include.jsp"%>   
	<%@ include file="/inc/file.inc"%>
	<%@ include file="/inc/file_huiqian_end.inc"%>
	<%@ include file="/inc/listMessage.inc"%>	
</s:form>

<SCRIPT language=JavaScript type=text/JavaScript>
		function getIndex() {
			  var x=document.getElementById("ywlx")
			  var y = x.selectedIndex ;
			  if( y==1 || y==0){
			  		div11.style.display = "block";
				    div22.style.display = "none";
				 }else{
					 div11.style.display = "none";
				     div22.style.display = "block";
				  }
		 }
 
 		function addValue(gr){
		    var delblyjurl ="<%=request.getContextPath()%>/jygdzc/AssetManageBody_saveBody.do";
		    var headId=document.getElementById("headId").value;
		    var sheettype=document.getElementById("sheettype").value;
			$.post(delblyjurl,{sheettype:""+sheettype+"",zcId:"" + gr + "",headId:"" + headId + ""},function(){
				reloadGrid();
			});
		}
		
		 function reloadGrid(){
					$("#purchase_list").setGridParam({
						postData:{
							headId: "${headId}"
						},
						url:"<%=basePath%>jygdzc/AssetManageBody_query4View.do"
					}).trigger("reloadGrid");
		}
		<e:pc id="jtdeptids">
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
		</e:pc>
		<e:pc id="sydeptids">
		function openTreeByType1(){//打开树，根据类型打开类型  
			var url = basePathJs + "chooseHqbm.do?deptType=1&ids=" + document.getElementById("hqbmids1").value;
			var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
			window.open(url,'',_g_privateDialogFeatures);
		}
		
		function getCallBack4Tree1(ids,value){
			document.getElementById("hqbmvalue1").value = value;
			document.getElementById("hqbmids1").value = ids;
		}
		</e:pc>
		
</SCRIPT>
</body>
</html>
  <script type="text/javascript">
                                      jQuery("#purchase_list").jqGrid({       
											url:"<%=basePath %>jygdzc/AssetManageBody_query4View.do?headId=${headId}",
											datatype: "json",
											mtype:"POST",
                                            colNames: ['id','资产编号', '资产名称','主卡片编号','地区', '管理部门', '使用部门','开始使用日期','已使用年限','原币原值','减值准备'],
                                            colModel: [
                                           		{name:'id',index:'id',align:"center",hidden:true},
		                                        {name:'zcbh',index:'zcbh',align:"center",width:100},
												{name:'zcmc',index:'zcmc',align:"center",width:100},
												{name:'zkpbh',index:'zkpbh',align:"center",width:100},
												{name:'CZcdq',index:'CZcdq',align:"center",width:100},
												{name:'glbm',index:'sybm',align:"center",width:100},
												{name:'sybm',index:'sybm',align:"center",width:100},
												{name:'kssyrq',index:'kssyrq',align:"center",width:100},
												{name:'ysynx',index:'ysynx',align:"center",width:100},
												{name:'ybyz',index:'ybyz',align:"center",width:100 ,formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}},
												{name:'jzzb',index:'jzzb',align:"center",width:100 ,formatter: 'number',formatoptions : {decimalPlaces: 2, defaultValue: "0.00"}}
											],
											loadComplete:function(data){
										    if(data && data.rows.length>0){
											jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
										   }else{
											jQuery("#purchase_list").setGridHeight(0);
										  }
										  },
										   shrinkToFit:false,
                                        multiselect:true,
										rownumbers:true,
										autowidth:true,
										height:'auto',
										ondblClickRow:function(gr){
											lookAsset(gr);
										},
										caption:'资产列表',
										jsonReader:{
											root:"rows",
											page:"page",
											total:"total",
											records:"records",
											repeatitems:false,
											id:"0"
										}
									});                 
                                        
									  jQuery("#purchase_list").jqGrid('navGrid', '#pgtoolbar1', {
								        edit: false,
								        add: false,
								        del: false,
								        search:false
								    });
								    jQuery("#purchase_list").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#purchase_list").setGridWidth($("#table").width());
									   });
                             </script>
