<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String saveSign = request.getParameter("saveSign");
String look = (String)request.getAttribute("look");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		$(document).ready(function(){
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			});
		});	
		
		
		function save(){
			$("#myform").attr("action","<%=basePath%>stock/maintain_saveWork.do");
	    	$("#myform").submit();
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
//			   		window.opener.reloadGrid("land");
			   		alert("保存成功!");
			   		window.close();
			   	}
		  })		
		   $("#cbrq").datebox({
				formatter:function(date){
					return formatDate(date); 
				}
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
		

		</script>
	</head>
	<base target="_self"/>
	<body>
<s:form action="stock/maintain_saveWork.do" method="post" id="myform">
<s:hidden name="sw.stockid" id="stockId"></s:hidden>
<s:hidden name="sw.logid" id="logid"></s:hidden>
<s:set name="biaodanid" value="sw.logid" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">催办人： </td>
              <td class="td_zxy02"><s:textfield name="sw.cbrmc" id="cbrmc" /></td>
              <td class="td_zxy01">催办日期： </td>
              <td class="td_zxy02"><s:textfield name="sw.cbrq" id="cbrq" readonly="true"/></td>
            </tr>	
            <tr>
             <td class="td_zxy01">催办方式：</td>
              <td class="td_zxy02"><s:textfield name="sw.cbfsmc" id="cbfsmc" />
             </td>
           	  <td class="td_zxy01">债务负责人</td>
              <td class="td_zxy02"><s:textfield name="sw.zwfzr" id="zwfzr"/></td>
            </tr>
            <tr>	
              <td class="td_zxy01">债务负责人电话：</td>
              <td class="td_zxy02"><s:textfield name="sw.zwfzrdh" id="zwfzrdh" /></td>
              <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
            </tr>
            <tr>
              <td class="td_zxy01" >办理结果：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="sw.bljg" id="bljg" rows="3" cols="120"></s:textarea></td>
            </tr>
            
    </table>         
<table id="TableBox" width="100%"  border="0" cellspacing="0" cellpadding="0"  >
			<tr>
			 <td class="td_zxy01" height="25">实体资料 附件：</td>
	        <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<%@ include file="/inc/file.inc"%>
			</table>		
	        </tr>	
			 <tr>
              <td class="td_zxy02" colspan="4">
              <div align="right">
              <%if("1".equals(saveSign)){ %>
			     <input name="sdfg" type="button" value="确定" onClick="save();"/>
             <%} %>
              </div>   
			  </td>
            </tr>
</table>
</s:form>
	</body>
</html>
