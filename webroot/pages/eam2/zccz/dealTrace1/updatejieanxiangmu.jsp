<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String isLook = (String)request.getAttribute("isLook");
	boolean isLooked = "true".equals(isLook);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>项目结案信息</title>
<script language=JavaScript type=text/JavaScript>
<% if (!isLooked){%>
$(function(){	
	$("#xyqssj").datebox({formatter:function(date){return formatDate(date);}});
});
<%}else {%>
$(function(){	
	window.removebt_huiyijiyao();
	window.removebt_zhuanrangxieyi();

	var tr_huiyijiyao = document.getElementById("urlsFile_huiyijiyao").childNodes[0];
	var td_huiyijiyao = tr_huiyijiyao.childNodes;
	for(var i = 0 ; i < td_huiyijiyao.length ; i++){
		$("#deletefilebutton").remove();
	}	
	
	var tr_zhuanrangxieyi = document.getElementById("urlsFile_zhuanrangxieyi").childNodes[0];
	var td_zhuanrangxieyi = tr_zhuanrangxieyi.childNodes;
	for(var i = 0 ; i < td_huiyijiyao.length ; i++){
		$("#deletefilebutton").remove();
	}
});
<%}%>
function setValue(){
	 myForm.action="<%=request.getContextPath()%>/zccz/dealTrace1Head_updateBody.do";
	 myForm.submit();
}
$(function(){	
	var isLook = '<%=isLook%>';
	if(isLook == 'true'){
		document.getElementById("fysfjq").disabled = true;
		document.getElementById("sfyylwt").disabled = true;
		document.getElementById("beizhu").disabled = true;
	}
});
</script>
</head>
<body>
<s:form action="" name="myForm">
<s:hidden name="xmIds"/>
<s:hidden name="headId"/>
<s:hidden name="body.id"/>
<s:hidden name="body.xmId"/>
<s:hidden name="body.cldId"/>
<s:set name="biaodanid" value="xmIds" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center" class="newtable" >
    <tr>
	 <td class="td_form01"  >会议纪要：</td>
	  <td class="td_form02">
	      <e:filebutton fjlx="huiyijiyao" biaodanId="%{#request.biaodanid}" isview="Y" />
	  <td class="td_form01"  >转让协议：</td>
      <td class="td_form02" >   
        <e:filebutton fjlx="zhuanrangxieyi" biaodanId="%{#request.biaodanid}" isview="Y" />
      </td>
    </tr>
	<tr>
	 <td class="td_form01" >协议签署或项目完成时间：</td>
      <td class="td_form02" >
      	<s:date name="%{#request.body.xyqssj}" format="yyyy-MM-dd" var="draftDate3"/>
	      <s:textfield name="body.xyqssj" id="xyqssj" value="%{#draftDate3}" readonly="true"/>
      </td>
      <td class="td_form01"  >&nbsp;</td>
      <td class="td_form02" > &nbsp;</td>
    </tr>
    <tr>
	 <td class="td_form01" >费用是否结清：</td>
      <td class="td_form02"><s:checkbox name="body.fysfjq" id="fysfjq"/> </td>
      <td class="td_form01"  >是否有遗留问题：</td>
      <td class="td_form02" > <s:checkbox name="body.sfyylwt" id="sfyylwt"/></td>
    </tr>
    <tr>
	 <td class="td_form01" >备注：</td>
      <td class="td_form02"  colspan="3" >
      <s:textarea name="body.beizhu" id="beizhu" cols="60"  rows="3" style="width:80%;"/>
      </td>
    </tr>
    <% if (!isLooked){%>
    <tr>
     <td class="td_form01" >&nbsp;</td>
      <td class="td_form02"  colspan="3">
      <input type="button" value="提交"  onclick="setValue();"/>
      <input type="button" value="关闭" onclick="close1();"/>
      </td>
    </tr>
  	 <%}%>
</table>
</s:form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	function close1(){
	   window.close();
	 }
	if('${message}' != "") {
		alert("${message}"); 
		window.close();
	}
</SCRIPT>