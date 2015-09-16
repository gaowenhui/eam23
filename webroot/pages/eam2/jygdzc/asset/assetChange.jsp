<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/jygdzc/asset/assetChange.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<%
	String headId = (String) request.getAttribute("headId");
%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include
	file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
	<%
		String userName = (String) request.getAttribute("userName");
		String userTid = (String) request.getAttribute("userTid");
		//boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
		boolean isNgbmzhcl = true;
	%>
	<head>
		<title>资产变动</title>
		<meta http-equiv="pragma" content="no-cache" />
		<base href="<%=basePath%>" />
		<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "jygdzcWorkflow";
			actionPath = "jygdzcWorkflow";
		%>
		<%@ include
			file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
		<script type="text/javascript">
	     var isInit=false;
      $(document).ready(function(){	
      if(isInit)return;
      isInit = true;	
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%> 
				jQuery("#blyj_reason_list").setGridWidth($("#table").width());
				jQuery("#file_list").setGridWidth($("#table").width());
				 jQuery("#purchase_list").setGridWidth($("#table").width());
			    $(window).bind('resize', function(){
					jQuery("#file_list").setGridWidth($("#table").width());
					jQuery("#blyj_reason_list").setGridWidth($("#table").width());
					jQuery("#purchase_list").setGridWidth($("#table").width());
			       });
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				<e:pc id="purchase_list">
				var buttonaddJSonString = '[{"buttonHandler":"add_asset","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delete_asset","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"update_asset","buttonIcon":"icon-edit","buttonText":"修改"}\
				]';
				addButtons(jQuery("#gview_purchase_list> .ui-jqgrid-titlebar"),buttonaddJSonString);
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
				//生成按扭
			  <e:pc id="scbh">
				var headBHGen = document.getElementById("bianhao").value;
				if(headBHGen == null || headBHGen.length == 0){
					var buttonStr_shengchenbianhao = '[{"id":"shengchenButton","buttonHandler":"mainWindow.createBianhao","buttonIcon":"icon-bianhao","buttonText":"生成编号"}]';
					window.parent.prependButtonsFromChildren(buttonStr_shengchenbianhao,"");
				}
			   </e:pc>
				
				<e:pc id="banjie">
					var buttonStr_ztcz1 = '[{"buttonHandler":"mainWindow.createBook4Card","buttonIcon":"icon-finishFlow","buttonText":"办结"}]';	                       
					window.parent.appendButtonsFromChildren(buttonStr_ztcz1,"");
		       </e:pc>
			});
			
				
</script>

		<!-- 必填项控制  -->
		<script type="text/javascript">
     function checkEAMFormJSMethod(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		    
		     var bianhao = document.getElementById("bianhao");
		     
		   <e:pc id="scbh">
		    var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
		      return false;
		    }
		     </e:pc>
		    var lxdh = document.getElementById("lxdh");
			if(lxdh.value == null || lxdh.value.length == 0){
				alert("联系电话不能为空！");
				lxdh.focus();
		      return false;
		    }
	    	var idArray = $("#purchase_list").getDataIDs();
		    if(idArray == null||idArray.length == 0){
		       alert("请至少添加一条变动信息");
		        return false;
		    }
		     return true;
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
		//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		$.post("<%=basePath%>jygdzc/AssetManageHead_createNum.do",{
			"headId":headId,
			"code":"jjgdzc_change"
		},function(data){
			document.getElementById("bianhao").value = data;
			 window.parent.removeObj("#shengchenButton");
		});
	}		
		
		function delete_asset(){
			var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
			 if (gr.length == 0){
				alert("请选择要删除的记录!");
			}else{	
				if(confirm("确认删除？")){
					var sheettype = "${sheettype}";
					var headId="${headId}";
					var delblyjurl ="<%=request.getContextPath()%>/jygdzc/AssetManageBody_deleteBody.do?";
					$.post(delblyjurl,{headId:"" + headId + "",zcId:"" + gr + "",sheettype:"" + sheettype + ""},function(aaa){
						reloadGrid();
					});
				}
			}
			return false;
				};
			function add_asset(){
			    //取到处理单Id 即headId
			    var headId = document.getElementById("headId").value; 
				window.open('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?ywlx=change&returnValue=true&cldId='+headId,'','height=600, width=1000, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				return false;
			};
			function update_asset(){
			 var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要修改的资产!");
				}else if(gr.length > 1){
					alert("只能选择一个资产!");
				}else{	
						var sheettype = "${sheettype}";
						window.open('<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?headId=${headId}&sheettype=assetInfo&zcId='+gr,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				return false;
			};
			function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			if(!thePhone.isMobile() && !thePhone.isPhone()){
				thisPhone.focus();
				alert("电话号码不正确，请重新输入。");
			}
		}
			function createBook4Card(){
				var bianhao = document.getElementById("bianhao");
				if(bianhao.value == null || bianhao.value.length == 0){
					alert("编号不能为空！");
					bianhao.focus();
			      return false;
			    }
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
			function lookAsset(gr){
				window.open('<%=basePath%>jygdzc/AssetManageBody_modifyBody.do?isdisable=true&headId=${headId}&sheettype=assetInfo&zcId='+gr,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			function beforeWorkFlowSubmit(){
				$("input").removeAttr("disabled");	
				$("textarea").removeAttr("disabled");	
				$("select").removeAttr("disabled");	
				return true;
			}
			function changeNgbmmc(){
				var dept = document.getElementById("ngbm");
	    	 	var i =document.getElementById("ngbm").selectedIndex;
	    	 	document.getElementById("ngbmmc").value =dept.options[i].text;
			}
	</script>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="jygdzc/AssetManageHead_saveHead.do" method="post"
			id="myform" name="myform">
			<s:hidden name="head.id"  value="%{#request.headId}" />
			<s:hidden name="headId" id="headId" value="%{#request.headId}" />
			<s:hidden name="head.lcmc" id="lcmc" value="资产变动" />
			<s:hidden name="head.sheettype" value="%{#request.sheettype}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<s:set name="biaodanid" value="head.id" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<!-- ==========================定义工作流隐藏域==================================== -->
			<%
				String urlHeader = request.getContextPath() + "/" + actionSpaceName
						+ "/" + actionPath + "_";
			%>
			<!-- 工作流表单提交URL设置 -->
			<input type="hidden" id="commitUrl"
				value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
			<input type="hidden" id="abandonUrl"
				value="<%=urlHeader + abandonMethod + ".do"%>" />
			<input type="hidden" id="abandonViewUrl"
				value="<%=urlHeader + "abandonView.do"%>" />
			<input type="hidden" id="endUrl"
				value="<%=urlHeader + endMethod + ".do"%>" />
			<input type="hidden" id="endViewUrl"
				value="<%=urlHeader + "endView.do"%>" />
			<input type="hidden" id="participationUrl"
				value="<%=urlHeader + participationMethod + ".do"%>" />
			<input type="hidden" id="commitDraftUrl"
				value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
			<input type="hidden" id="draftParticipationUrl"
				value="<%=urlHeader + draftParticipationMethod + ".do"%>" />
			<input type="hidden" id="saveDraftUrl"
				value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
			<input type="hidden" id="saveTodoUrl"
				value="<%=request.getContextPath()%>/jygdzc/AssetManageHead_saveHead.do" />
			<!-- 保存后台的URL -->
			<input type="hidden" id="commitNextTodoUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
			<input type="hidden" id="commitDidUrl"
				value="<%=urlHeader + "did.do"%>" />
			<input type="hidden" id="draftCommitUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do" />
			<input type="hidden" id="draftCommitTodoUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
			<input type="hidden" id="draftCommitNextTodoUrl"
				value="<%=actionSpaceName%>/<%=actionPath%>_todo.do" />
			<input type="hidden" id="draftCommitDidUrl"
				value="<%=urlHeader + "did.do"%>" />

			<!-- 传阅 -->
			<input type="hidden" name="circulationUrl"
				value="jygdzc/AssetManageHead_modifyHead.do" />
			<input type="hidden" name="circulationParam"
				value="headId=<%=headId%>" />
			<input type="hidden" name="circulationTitle"
				value="[传阅]<s:property value="head.biaoti" />" />
			<input type="hidden" id="circulationParticipation"
				value="<%=urlHeader + "getCirculationParticipationList.do"%>" />
			<!-- =========================================================================== -->
			<br />
			<div align="center">
				<span class="STYLE7 STYLE1">中国建银投资有限责任公司资产变动处理单</span>
			</div>
			<br />
			<!-- ==========================工作流信息项======================================= -->
			<%@ include
				file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
			<!-- =========================================================================== -->
			<hr color="#6600CC" align="center" width="100%" />
			<table id="table" class="newtable" width="100%" border="0"
				cellspacing="0">
				<tr>
					<td class="td_zxy01">
						<font color="red">*
						</font>标 题：
					</td>
					<td class="td_zxy02" colspan="3">
						<r:textfield name="head.biaoti" id="biaoti" cssClass="input2"
							value="%{#request.head.biaoti}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						编号：
					</td>
					<td class="td_form02">
						<s:textfield name="head.bianhao" id="bianhao" cssClass="input"
							readonly="true" />
					</td>
					<td class="td_zxy01">
						急缓程度：
					</td>
					<td class="td_zxy02">
						<r:select list="#{'0':'一般','1':'急','2':'特急'}" name="head.jhcd"
							id="jhcd" value="%{#request.head.jhcd}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						拟稿人：
					</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngr"  value="%{#request.head.ngr}"  />
						<r:textfield name="head.ngrmc" id="ngr" cssClass="input"
							value="%{#request.head.ngrmc}" readonly="true" />
					</td>
					<td class="td_zxy01">
						<font color="red">*
						</font>联系电话：
					</td>
					<td class="td_zxy02">
						<r:textfield name="head.lxdh" id="lxdh" cssClass="input"
							value="%{#request.head.lxdh}" onblur="checkPhone(this);" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						拟稿日期：
					</td>
					<td class="td_zxy02">
						<s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<r:textfield id="ngrq" name="head.ngrq" cssClass="input"
							value="%{#draftDate}" readonly="true" />
					</td>
					<td class="td_zxy01">
						拟稿部门：
					</td>
					<td class="td_zxy02" colspan="3">
							 <s:hidden  name="head.ngbmmc"  id="ngbmmc" />
	    					<e:dept userTid="<%=userTid%>" list="#{}"  name="head.ngbm" onchange ="changeNgbmmc()" id="ngbm"  />
					</td>
				</tr>
			</table>
			<table id="purchase_list"></table>
			<%@ include file="/inc/according.inc"%>
			<e:opinion id="test" width="100%">
				<e:opinionPart id="DRAFT_DEPT" name="DRAFT_DEPT"
					biaodanid="%{#request.biaodanid}" value="" text="拟稿部门意见："></e:opinionPart>
			 	<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart> 
			</e:opinion>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/listMessage.inc"%>
		</s:form>
		<script type="text/javascript">
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
		</script>
	</body>
</html>
<script type="text/javascript">
                                jQuery("#purchase_list").jqGrid({    
                                    url:"<%=basePath%>jygdzc/AssetManageBody_query4View.do?headId=${headId}",
									datatype:"json",
									mtype:"POST",
                                         colNames: ['id','资产编号', '资产名称', '资产类型', '资产状态','地区', '管理部门','使用部门','变动数量'],
                                         colModel: [
                                          {name:'id',index:'id',hidden:true},
										  {name:'zcbh',index:'zcbh',width:100},
										  {name:'zcmc',index:'zcmc',width:100},
										  {name:'CZclx',index:'CZclx',width:100},
										  {name:'CZczc',index:'CZczc',width:100},
										  {name:'CZcdq',index:'CZcdq',width:100},
									      {name:'glbm',index:'glbm',width:100},
							   			  {name:'sybm',index:'sybm',width:100},		
										  {name:'bdsl',index:'bdsl',width:100}
                                          ],
                                         loadComplete:function(data){
										if(data && data.rows.length>0){
											jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
										}else{
											jQuery("#purchase_list").setGridHeight(0);
										  }
									    },
									     shrinkToFit:false, 
	                                     rownumbers:true,
	                                     multiselect:true,
										 autowidth:true,
										 height:'auto',
										 ondblClickRow:function(gr){
											lookAsset(gr);
										},
										 caption:'资产变动列表',
										 jsonReader:{
											root:"rows",
											page:"page",
											total:"total",
											records:"records",
											repeatitems:false,
											id:"0"
										}
									});                 
                             </script>
