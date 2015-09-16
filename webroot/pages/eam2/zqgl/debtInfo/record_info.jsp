<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String newAdd = request.getParameter("newAdd");
String look = (String)request.getAttribute("look");

String diid = (String)request.getAttribute("diid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>催收办理记录</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<script type="text/javascript">
			
		function checkPageInput(){
			var csrmc = document.getElementById("csrmc");
			if(csrmc.value == null || csrmc.value.length == 0){
				alert("催收人不能为空!");
				csrmc.focus();
		      return false;
		    }
		    return true;
		}
		
		
		
	    function save(){
		    if(checkPageInput()){
		    	if(1 == '<%=newAdd%>' ){
					$("#myform").attr("action","<%=basePath%>zqgl/debt_saveDebtWorklog.do?newAdd="+1+'&diid='+'<%=diid%>');
		    	}else{
			    	$("#myform").attr("action","<%=basePath%>zqgl/debt_saveDebtWorklog.do");
			    }
			    $("#myform").submit();
		    }
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
					window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		   $("#cssj").datebox({
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
 	
 		$(document).ready(function(){
	 		if('1' != '<%=look%>'){
	 			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
	 		}
			
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			});
		});
</script>
</head>
<base target="_self"/>
<body >
<s:form action="" method="post" id="myform">
<s:hidden id="zqid" name="dk.zqid" ></s:hidden>
<s:hidden id="dkid" name="dk.id" ></s:hidden>
<s:set name="biaodanid" value="dk.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
              <td class="td_zxy01">
              <font color="#FF0000"><strong>*</strong></font>  
              	催收人：</td>
              <td class="td_zxy02"><s:textfield name="dk.csrmc" id="csrmc" style="width: 60%;"/></td>
              <td class="td_zxy01">催收时间：</td>
              <td class="td_zxy02"><s:textfield name="dk.cssj" id="cssj" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">催收方式：</td>
              <td class="td_zxy02"><s:textfield name="dk.csfs" id="csfs" style="width: 60%;"/></td>
              <td class="td_zxy01">债务负责人：</td>
              <td class="td_zxy02"><s:textfield name="dk.zwfzr" id="zwfzr" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">债务负责人电话：</td>
              <td class="td_zxy02"><s:textfield name="dk.zwfzrdh" id="zwfzrdh" style="width: 60%;"/></td>
              <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
            </tr>
            <tr>
              <td class="td_zxy01">办理结果：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="dk.bljg" id="bljg" rows="3" style="width: 85%;" ></s:textarea></td>
            </tr>
			<tr>
              <td class="td_zxy01">备注：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="dk.bz" id="bz" rows="3" style="width: 85%;" ></s:textarea></td>
            </tr>
     </table>       
       <table id="TableBox" width="100%"  border="0" cellspacing="0" cellpadding="0"  >
             <tr>
                  <td class="td_zxy01" height="25">实体资料 附件 ：</td>
                 	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newTable">
							<%@ include file="/inc/file.inc"%>
		     		</table>
		     </tr>
            <tr>
	             <td class="td_zxy02" colspan="4" align="right">
	             <div align="right">
	             <%if(!"1".equals(look)){ %>
				     <input name="dsgsdf" type="button" value="确定" onClick="save(); return false;"/>
	                 <input name="reset" type="reset" value="重置" />
	             <%} %>
	             </div>   
				 </td>
            </tr>
	</table> 	
</s:form>

	</body>
</html>

