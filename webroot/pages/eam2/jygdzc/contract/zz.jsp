<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>合同管理</title>

<base href="<%=basePath%>">
<SCRIPT language=JavaScript type=text/JavaScript>
$(function(){	
	$("#htzzrq").datebox({formatter:function(date){return formatDate(date);}});
});
 function setValue(){
	  myForm.action="<%=basePath%>htqs/ContractManageBody_updateBody.do";
	  myForm.submit();
	  //window.close();
 }
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="" name="myForm" method="post">
<s:hidden name="htId"/>
<s:hidden name="sheettype" id="sheettype"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center" class="newtable" >
	<tr>
      <td colspan="4" class="td_top" align="left"><br />终止信息</td>
    </tr>
	
    <tr>
	 <td class="td_form01"  >终止日期：</td>
	  <td class="td_form02">
	      <s:date name="%{#request.jjzcHtZlwgLsb.htzzrq}" format="yyyy-MM-dd" var="draftDate3"/>
	      <s:textfield name="jjzcHtZlwgLsb.htzzrq" id="htzzrq" value="%{#draftDate3}" readonly="true"/></td>
	  <td class="td_form01"  >终止原因：</td>
      <td class="td_form02" >   
        <e:select parRefKey="CONTRACT_TERMINATE_REASON"  list="#{}" name="jjzcHtZlwgLsb.CZzyy"/>
      </td>
    </tr>
	<tr>
	 <td class="td_form01" >办理说明：</td>
      <td class="td_form02"  colspan="3" >
      <s:textarea name="jjzcHtZlwgLsb.zzblsm" id="zzblsm" cols="60"  rows="3" style="width:80%;"/>
      </td>
    </tr>
    <tr>
     <td class="td_form01" >&nbsp;</td>
      <td class="td_form02"  colspan="3">
      <input type="button" value="提交"  onclick="setValue();"/>
      <input type="button" value="关闭" onclick="close1();"/>
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	function close1(){
	   window.close();
	 }
	if('${message}' != "") {
		alert("${message}"); 
		window.opener.reloadGrid();
		window.close();
	}
</SCRIPT>