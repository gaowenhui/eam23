<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String headId = request.getAttribute("head.id").toString();%>
<!-- ==========================工作流属性初始化=========================================== -->
<%@ include file="/pages/rdp4j/workflow/task/workflow_attribute_include.jsp"%>
<!-- ================================================================================== -->
<html>
<head>
<!-- ==========================  权限控制添加     ======================================== -->
<r:controlfile file="/pages/eam2/zccz/evalKnow/evalKnow.ctl.xml"></r:controlfile>
<!-- ================================================================================== -->
<base href="<%=basePath%>" />
<!-- ==========================工作流javascript========================================= -->
		<%
			String formName = "myform";
			actionSpaceName = "evalKnowWorkflow";
			actionPath = "evalKnowWorkflow";
		%>
		<%@ include	file="/pages/rdp4j/workflow/task/workflow_javascript_include.jsp"%>
		<!-- ================================================================================== -->
<script type="text/javascript">
	$(function(){
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delblyjAss","buttonIcon":"icon-cut","buttonText":"删除"},\
											{"buttonHandler":"exportExcelBlyj","buttonIcon":"icon-save","buttonText":"导出"}\
				]';
			addButtons(jQuery("#gview_blyj_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-cut","buttonText":"删除"}\
				]';
		    addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
	       $("#sprq").datebox({
				formatter:function(date){
				return formatDate(date);
				}
			});
	
	})


	 function reloadGrid(){
					$("#all_Attachment").setGridParam({
						postData:{
							headId: "${headId}"
						},
						url:"<%=basePath%>zccz/evalKnowBody_query4View.do"
					}).trigger("reloadGrid");
		}
	function query(sheettype){	
		var headId = "${headId}";
		window.open('<%=basePath%>zccz/sczskLsbAction_query.do?cldId='+headId+'&sheettype=' +sheettype + '','','height=500, width=1000, top=100, left=150, resizable=yes');
	}
	function create(creatType){
		var headId = "${headId}";
		var url="<%=basePath%>zccz/evalKnowBody_create.do"; 
		$.post(url,{headId:"" + headId + "",creatType:"" + creatType + ""});
		alert("生成成功");
	}
	
	<!-- 校验 -->
     function checkEAMFormJSMethod(){
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
		    return true;
		}
		
		
		
	//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		if(document.getElementById("bianhao").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath %>zccz/evalKnowHead_createNum.do",{
			"headId":headId,
			"code":"sczsk"
		},function(data){
			document.getElementById("bianhao").value = data;
		});
	}		
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form action="zccz/evalKnowHead_saveHead.do" method="post" id="myform" name="myform">
<s:hidden  name="headId" id="headId" value="%{#request.headId}" />
<s:hidden  name="head.id" value="%{#request.headId}" />
<s:hidden  name="sheettype" value="%{#request.sheettype}" />
<s:hidden  name="head.lcmc" value="%{#request.sheettype}" />
<s:hidden  name="head.sheettype" value="%{#request.sheettype}" />
<s:hidden name="head.liuchengid" value="shen" />
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<!-- ==========================定义工作流隐藏域==================================== -->
		<%
			String urlHeader = request.getContextPath()+"/"+actionSpaceName+"/"+actionPath+"_";
		%>
		<!-- 工作流表单提交URL设置 -->
		<input type="hidden" id="commitUrl" value="<%=request.getContextPath()%>/zccz/evalKnowHead_saveHead.do"/>
		<input type="hidden" id="abandonUrl" value="<%=urlHeader+abandonMethod+".do"%>"/>
		<input type="hidden" id="abandonViewUrl" value="<%=urlHeader + "abandonView.do"%>"/>
		<input type="hidden" id="endUrl" value="<%=urlHeader+endMethod+".do"%>"/>
		<input type="hidden" id="endViewUrl" value="<%=urlHeader + "endView.do"%>"/>
		<input type="hidden" id="participationUrl" value="<%=urlHeader+participationMethod+".do"%>"/>
		<input type="hidden" id="commitDraftUrl" value="<%=request.getContextPath()%>/zccz/evalKnowHead_saveHead.do"/>
		<input type="hidden" id="draftParticipationUrl" value="<%=urlHeader+draftParticipationMethod+".do"%>"/>
		<input type="hidden" id="saveDraftUrl" value="<%=request.getContextPath()%>/zccz/evalKnowHead_saveHead.do"/>
		<input type="hidden" id="saveTodoUrl" value="<%=request.getContextPath()%>/zccz/evalKnowHead_saveHead.do"/>
		<!-- 保存后台的URL -->
		<input type="hidden" id="commitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="commitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<input type="hidden" id="draftCommitUrl" value="<%=actionSpaceName%>/<%=actionPath%>_toDraft.do"/>
		<input type="hidden" id="draftCommitTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitNextTodoUrl" value="<%=actionSpaceName%>/<%=actionPath%>_todo.do"/>
		<input type="hidden" id="draftCommitDidUrl" value="<%=urlHeader + "did.do"%>" />
		<!-- 传阅 -->
		<input type="hidden" name="circulationUrl" value="<%=request.getContextPath()%>/zccz/evalKnowHead_modifyHead.do?headId=<%=headId%>"/>
		<input type="hidden" name="circulationParam" value="headId=<%=headId%>"/>
		<input type="hidden" name="circulationTitle" value="[传阅]审查知识库维护处理单"/>
		<input type="hidden" id="circulationParticipation" value="<%=urlHeader+"getCirculationParticipationList.do"%>"/>
		<!-- =========================================================================== -->
	<br/>
	 <div align="center">
        <span class="STYLE7 STYLE1">中国建银投资有限责任公司审查知识库维护处理单</span>
        <br/>
<!-- ==========================工作流信息项======================================= -->
		<%@ include file="/pages/rdp4j/workflow/task/workflow_header_include.jsp"%>
<!-- =========================================================================== -->
		
	</div>
	<hr>
	<table id="table" class="newtable"  width="100%" border="0" cellspacing="0">
	
	 <tr>
	    <td class="td_zxy01"><font color="red">*</font>标题：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.biaoti" id="biaoti" cssClass="input2" value="%{#request.head.biaoti}"/></td>
	  </tr>	
	  <tr>
		<td class="td_zxy01" width="120"><font color="red">*</font>编号：
					</td>
					 <td class="td_form02"><s:textfield name="head.bianhao"  id="bianhao"  readonly="true"/>
					    <e:pc id="scbh">
					  	<input type="button" value="生成编号"  id="generateBHButton"  onclick="createBianhao();"/>
					  	</e:pc>
					  	</td>
		<td class="td_zxy01">急缓程度：</td>
		<td class="td_zxy02"> <r:select name="head.jhcd" id="jhcd" list="#{'0':'一般','1':'急','2':'特急'}"></r:select>
</td>
	  </tr>	
	  <tr>
		<td class="td_zxy01" width="120">拟稿人：</td>
		<td class="td_zxy02"><r:textfield name="head.nigaorenxm" id="ngr" cssClass="input" value="%{#request.head.nigaorenxm}" readonly="true"/></td>
		<td class="td_zxy01" width="120">联系电话：</td>
		<td class="td_zxy02"><r:textfield name="head.lxdh" id="lxdh" cssClass="input" value="%{#request.head.lxdh}"/></td>
	  </tr>	
	  <tr>
	   <td  class="td_zxy01" width="120">拟稿日期：</td>
	    <td class="td_zxy02">
	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
		<s:textfield id="ngrq" name="head.ngrq" cssClass="input" value="%{#request.head.ngrq}" readonly="true" />
	    </td>
	    <td  class="td_zxy01" width="120">拟稿部门：</td>
	    <td class="td_zxy02" colspan="3"><r:textfield name="head.ngbmmc"  cssClass="input" id="ngbmmc"  readonly="true" value="%{#request.head.ngbmmc}"/></td>
	  </tr>
	  <tr>
	   <td  class="td_zxy01" width="120">审批人：</td>
	    <td class="td_zxy02">
	  		 <s:textfield name="head.sprmc" id="sprmc" cssClass="input" value="%{#request.head.sprmc}" />
	    </td>
	    <td  class="td_zxy01" width="120">审批日期：</td>
	    <td class="td_zxy02" colspan="3">
	    <s:date name="%{#request.head.sprq}" format="yyyy-MM-dd" var="draftDate2"/>
		<s:textfield id="sprq" name="head.sprq" cssClass="input" value="%{#draftDate2}" readonly="true" /></td>
	  </tr>	
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
       <td  align="right">
		   <table id="all_Attachment" ></table>
			<div id="pgtoolbar1"></div>
		</td>
	    </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
		<tr>
			<td align="right"><input type="button" onclick="query('before')" value=" 变更前查询 "/><input type="button" onclick="create('change')" value=" 生成变更后 "/><input type="button" onclick="query('after')" value=" 变更后查询 "/><input type="button" onclick="create('examine')" value=" 生成审批后 "/><input type="button" onclick="query('verify')" value=" 审批后查询 " /></td>
		</tr>
	</table>
	<%@ include file="/inc/according.inc"%>
	<e:opinion id="test" width="100%">
				<e:opinionPart id="DRAFT_DEPT" name="DRAFT_DEPT"
					biaodanid="%{#request.biaodanid}" value="" text="拟稿部门意见："></e:opinionPart>
			</e:opinion>
	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
		<tr>
			<td class="td_zxy01">
				备注：
			</td>
			<td class="td_zxy03" colspan="5">
				<r:textarea name="head.beizhu" id="beizhu" cssClass="area"  value="%{#request.head.beizhu}" />
			</td>
	   </tr>
	</table>
	<%@ include file="/inc/file.inc"%>
</s:form>	
</body>
</html>
<script type="text/javascript">
           
			$(function(){	
				<%@ include file="/pages/rdp4j/workflow/task/workflow_button_include.jsp"%>
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				$("#gview_all_Attachment> .ui-jqgrid-titlebar").append("\
					<a href='#' id='delete_asset'  class='easyui-linkbutton' iconCls='icon-remove'>删除</a>\
		            <a href='#' id='update_asset'  target='blank' class='easyui-linkbutton' iconCls='icon-edit' >修改</a>\
		            <a href='#' id='examine_asset'  class='easyui-linkbutton' iconCls='icon-remove' style='margin-right:20px'>审批</a>\
				");
				$('#examine_asset,#delete_asset,#update_asset').linkbutton({
	                    duration: 9999999999,
						plain:true
			    });
				$("#delete_asset").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要删除的记录!");
					}else{	
						if(confirm("确认删除？")){
							var delblyjurl ="<%=basePath%>zccz/evalKnowBody_deleteBody.do?";
							$.post(delblyjurl,{bdId:"" + gr + ""}, function(data){
								jQuery("#all_Attachment").trigger("reloadGrid");
							});
						}
					}
					return false;
				});
				$("#update_asset").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要修改的记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{	
							window.open('<%=basePath%>zccz/evalKnowBody_modifyBody.do?bdId='+gr,'','height=200, width=400, top=200, left=400, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					}
					return false;
				});
				$("#examine_asset").click(function(){
					var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
					if (gr.length == 0){
						alert("请选择要审批的记录!");
					}else if(gr.length > 1){
						alert("只能选择一条记录!");
					}else{	
							window.open('<%=basePath%>zccz/evalKnowBody_examineBody.do?bdId='+gr,'','height=200, width=400, top=200, left=400, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					}
					return false;
				});
			});
			
						jQuery("#all_Attachment").jqGrid({
							datatype: "json",
						   	colNames:['id','变动方式','变动前项目名称', '变动后项目名称', '变动前要点名称','变动后要点名称','审查意见','审批状态'],
						   	colModel:[
						   		{name:'id',index:'id',editable:true,hidden:true},
						   		{name:'bdfs',index:'bdfs'},
						   		{name:'beforexm',index:'beforexm'},
						   		{name:'afterxm',index:'afterxm'},
						   		{name:'beforeyd',index:'beforeyd'},
						   		{name:'afteryd',index:'afteryd'},		
						   		{name:'scyj',index:'scyj'},
						   		{name:'spzt',index:'spzt'}			
						   	],
						   	rownumbers:true,
						   	height: 'auto',
                                        autowidth: true,
                                        multiselect: true,
                                        caption: '变更列表',
							viewrecords:true,
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
						 jQuery("#all_Attachment").setGridWidth($("#table").width());
						 jQuery("#file_list").setGridWidth($("#table").width());
					 	  $(window).bind('resize', function(){
								jQuery("#all_Attachment").setGridWidth($("#table").width());
								jQuery("#file_list").setGridWidth($("#table").width());
					       });
</script>

