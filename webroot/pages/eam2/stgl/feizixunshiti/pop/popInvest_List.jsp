<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
String sheadId = request.getParameter("sheadId");
String look = (String)request.getAttribute("look");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String newAdd = request.getParameter("newAdd");
StFsxx sf = (StFsxx)request.getAttribute("sf");
String ispgsc = (String)request.getAttribute("ispgsc");
String zcczpg = (String)request.getAttribute("zcczpg");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>对外投资</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		
		var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid("invest");
			   		alert("保存成功!");
			   		window.close();
			   	}
			});
				<%
				if(sf!=null&&sf.getNtze()!=null&&!"".equals(sf.getNtze())){
				%>	
						$("#ntze").val(${sf.ntze}.toFixed(2));
				<%	
					}
				%>	
			  
			  if("1" == '<%=zcczpg%>'){
			  var buttonJSonString = '[{"buttonHandler":"confirmAss","buttonIcon":"icon-ok","buttonText":"确定"},\
			 						   {"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
									   {"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
									   {"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
									   {"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			  						  ]';
			  
			  }else{
					if('1' == '<%=look%>' ){ 
			
					  //添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
					}else{
					//添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"modifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"delAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					}					
				}
			addButtons($("#gview_evaluating_list > .ui-jqgrid-titlebar"),buttonJSonString);
			
			
			jQuery("#evaluating_list").setGridWidth($("#widthRule_evaluating").width());
			$(window).bind('resize', function() {  
				jQuery("#evaluating_list").setGridWidth($("#widthRule_evaluating").width()); 
			}); 
			
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			  var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}
			}	
		});	
		
		function confirmAss(){
			var gr = jQuery("#evaluating_list").jqGrid('getGridParam','selarrrow');
			if(gr.length < 1){
				alert("请选择评估信息");
			}else if(gr.length > 1){
				alert("只能选择一条评估信息");
			}else{
				window.opener.parent.opener.opener.reloadGridwww(gr);
				window.close();
			}
		}
		
		function lookAss(){
			var gr = jQuery("#evaluating_list").jqGrid('getGridParam','selarrrow');
			var id = '<%=id%>';
			document.getElementById('id').value = gr ;
			var rdBasicWidth = "500px";
			var rdBasicHeight = "400px";
			var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			if(gr.length == 0){
				alert("请选择要查看的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要查看的记录")
			}else{
//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
			window.open('weihu_newZcPgXx.do?zcid='+gr+'&look='+1,'',winVar);
			}
		}	
		
		
		function addAss(){
			var ispgsc = '<%=ispgsc%>';
			var id = document.getElementById("id").value;
			var cdkzh = document.getElementById('cdkzh').value;
			if(document.getElementById("ndwtzbh").value == "" || document.getElementById("ndwtzbh").value == null){
				alert("请先添加资产信息！");
			}else{
				window.open('weihu_newZcPgXx.do?sfid=${sf.id}&cdkzh='+cdkzh+'&ispgsc='+ispgsc,'',winVar);
			}
		}
		
		function modifyAss(){
			var ispgsc = '<%=ispgsc%>';
			var gr = jQuery("#evaluating_list").jqGrid('getGridParam','selarrrow');
			document.getElementById('id').value = gr ;
			if(gr.length == 0){
				alert("请选择要修改的记录")
			}else if (gr.length > 1){
				alert("只能选择一条要修改的记录")
			}else{
//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newZcPgXx.do?zcid='+gr+'&sfid=${sf.id}'+'&rework='+1+'&ispgsc='+ispgsc,'',winVar);
			}
		}	
		
		function delAss(){
			var gr = jQuery("#evaluating_list").jqGrid('getGridParam','selarrrow');
			if( gr.length > 0 ) {
				if(confirm("确认删除！")){
					$.post("<%=request.getContextPath()%>/stgl/weihu_deleteZcPgXx.do",{
						"ZcPgXxIds":"" + gr
					},function(returnStr){
						alert(returnStr);
						$("#evaluating_list").trigger("reloadGrid");
					});
				}
			}
			else{
				alert("请选择要删除的记录!"); 		
				}
		}
		
		
		function reloadGrid(){
			jQuery("#evaluating_list").setGridParam({}).trigger("reloadGrid");
	    }
	    
	    
		
		function checkPageInput(){
			var nbtqymc = document.getElementById("nbtqymc");
			if(nbtqymc.value == null || nbtqymc.value.length == 0){
				alert("被投资企业名称不能为空！");
				nbtqymc.focus();
		      return false;
		    }
		    return true;
		}	
		
		//控制页签未关闭再次修改的日志
		var isNew = true;
		function save(){
			if(checkPageInput()){
			    $("input").removeAttr("disabled"); 
				$("textarea").removeAttr("disabled"); 
				$("select").removeAttr("disabled");
				if(isNew){ 
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
		    	}else{
		    	$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do");
		    	}
		    	$("#myform").submit();
		    	isNew = false;
			}
		}
		
		function vewDisabled(){
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			  var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}
			}	
		}
		
		
		
		
		</script>
	</head>
	<base target="_self"/>
<body onload="vewDisabled();">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="myform">
<s:hidden name="sf.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<s:hidden name="sf.leixing" id="leixing"></s:hidden>
<s:hidden name="sf.stnzcfl" id="stnzcfl" value="11"></s:hidden>
<s:hidden name="sf.cdkzh" id="cdkzh" ></s:hidden>
<s:hidden name="zc.id" id="zcid" value="%{#request.zc.id}"></s:hidden>
<table id="invest_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td class="td_zxy01">对外投资编号(自动生成)：</td>
              <td class="td_zxy02"><s:textfield name="sf.ndwtzbh" id="ndwtzbh" disabled="true"/></td>
              <td class="td_zxy01">
              <font color="#FF0000"><strong>*</strong></font>
              	被投资企业名称：</td>
              <td class="td_zxy02"><s:textfield name="sf.nbtqymc" id="nbtqymc" style="width: 60%;"/></td>
             
            </tr>	
            <tr>
              <td class="td_zxy01">投资额(元)： </td>
              <td class="td_zxy02"><s:textfield name="sf.ntze" id="ntze" onblur="checkFloat(this);"/></td>
              <td class="td_zxy01">投资方式：</td>
              <td class="td_zxy02"><s:textfield name="sf.ntzfs" id="ntzfs" /></td>
            </tr>
             <tr>
             <tr>
              <td class="td_zxy01">投资情况描述：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="sf.ntzqkms" id="ntzqkms" rows="3" cols="140"></s:textarea></td>
            </tr>
            <tr>
              <td class="td_zxy02" colspan="4">
              <div align="right">
              <%if(!"1".equals(look)) {%>
			     <input name="sdfg" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
                 <%} %>
              </div>   
			  </td>
            </tr>
</table> 	

<div style="width: 100%;" id="widthRule_evaluating">&nbsp;</div>
 	<table id="evaluating_list"></table>
<script type="text/javascript">
		var ispgsc = '<%=ispgsc%>';
		jQuery("#evaluating_list").jqGrid({
			url:"<%=basePath%>stgl/weihu_getZcPgXxList.do",
			postData:{'sfid':'${sf.id}','ispgsc':ispgsc},
			datatype:"json",
			colNames:['id','评估基准日期','评估值(元)','评估基准日账面价值(元)','净值(元)'],
			colModel:[	
				{name:'id',index:'id',width:200,hidden:true},
				{name:'pgjzr',index:'personNo',width:200},
				{name:'pingguzhi',index:'Name',width:200},
				{name:'jzrzmjz',index:'tel',align:"center",width:320},
				{name:'jingzhi',index:'duties',width:320}						
			],	
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			caption:'评估信息列表',
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

</s:form>

	</body>
</html>
