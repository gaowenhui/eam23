
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
    	<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>

<SCRIPT language=JavaScript type=text/JavaScript>
	function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
	  if(scrollbars=="no") {
	  	parameter+=",scrollbars=no";
	  }  else {
	  	parameter+=",scrollbars=yes";  	
	  }
	  window.open(theURL,winName,parameter);
	}
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
</SCRIPT>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<br>
	<br>
	<br>
	<table width="80%" border="0" cellpadding="2" cellspacing="0" align="center">
	  <tr>
	    <td class="td_form01" height="35"  align="center">审查项目：</td>
	    <td class="td_form02" >
	    	<input name="appDate" type="text" class="input" id="appDate" size="60" value=" ">
	    </td>
	  </tr>  
	  <tr>
      <td align="right" colspan=2>
      	<br>
      	<input type="button" class="buttonface" value="确定" onClick="window.close()" name="optionButton" /> 
      	&nbsp;&nbsp; 
        <input type="button" class="buttonface" value="关闭" onClick="window.close()" name="optionButton" />
      </td>
    </tr>
    
  </table>
          
</body>
</html>
