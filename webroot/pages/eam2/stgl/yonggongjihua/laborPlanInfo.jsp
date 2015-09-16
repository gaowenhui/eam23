<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<% 
	String stId = (String)request.getParameter("stId");
	String headId =  request.getParameter("headId");
	String look = (String)request.getParameter("look");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>用工计划</title>
<SCRIPT language=JavaScript type=text/JavaScript>
		function dddd(){
			var ti = document.getElementById("stGlbt.gzgw");
			if(ti.value == null || ti.value.length == 0){
				alert("工作岗位不能为空！");
		    }else{
				document.getElementById("myform").action ="<%=request.getContextPath()%>/stgl/yonggongjihuaBody_saveRecruitStaff.do?stId=<%=stId%>&headId=<%=headId%>"; 
			}
		}
	$(function(){
		//根据参数look判断页面显示
	   	if('1' == '<%=look%>'){
	   	  document.getElementById("queding").style.display="none";
		  document.getElementById("guanbi").style.display="block";
		  var a  = document.getElementsByTagName("select");
		  var b  = document.getElementsByTagName("textarea");
		  var c  = document.getElementsByTagName("input");
		  var d  = document.getElementsByTagName("radio");
			for(var i=0;i<a.length;i++){
				a[i].disabled = "true";
			}
			for(var i=0;i<b.length;i++){
				b[i].disabled = "true";
			}
			for(var i=0;i<c.length;i++){
			    if(c[i].type!="button"){
					c[i].disabled = "true";
				}
			}
			for(var i=0;i<d.length;i++){
				d[i].disabled = "true";
			}
		  document.getElementById("uploadbt_single").style.display="none";
		  document.getElementById("deletefilebutton").style.display="none";
		  
		}else if('null' == '<%=look%>'){
		  document.getElementById("queding").style.display="block";
		  document.getElementById("guanbi").style.display="none";
		}   
	 });		
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form id="myform"   action=""  name="myform">

	<table width="100%"  border="0" cellspacing="2" cellpadding="0" align="center" >
	  <tr>
	    <td colspan="6" align="center" class="td_top"><strong>填写用工岗位信息</strong></td>
	  </tr>
	</table>	
	  <table width="100%" align="center" class="docTable1">
	  <tr>
	    <td  width="11%" class="td_form01"><font color="#FF0000"><strong>*</strong></font>工作岗位：</td>
	    <td width="38%" class="td_form02"><s:textfield name="stGlbt.gzgw" id="stGlbt.gzgw"  label=""/>   </td>
	    <td  width="11%" class="td_form01">人数：</td>
	    <td class="td_form02"><s:textfield name="stGlbt.renshu"  label=""/></td>
   	  </tr>
	  <tr>
	    <td    class="td_form01">学历：</td>
	    <td class="td_form02"><e:select parRefKey="EDUCATION_BACKGROUND" list="#{}" headerKey="" headerValue="" name="stGlbt.CXueli" id="xl"/></td>
	    <td    class="td_form01">资质要求：</td>
	    <td class="td_form02"><s:textfield name="stGlbt.zzyq"   label=""/></td>
	  </tr>
	  <tr>
	    <td class="td_form01">性别：</td>
	    <td class="td_form02"><e:select  list="{'','男','女','不限'}" name="stGlbt.CXingbie"  value="%{#request.stGlbt.CXingbie}"/></td>
	    <td class="td_form01">工龄：</td>
	    <td class="td_form02"><s:textfield name="stGlbt.gongling"  label=""/></td> 
	  </tr>
	  
      <tr>
    	<td   class="td_form01">其他说明：</td>	
    	<td colspan="3" class="td_form02"><s:textarea name="stGlbt.qtxx" rows="3" style="width:90%"></s:textarea></td>
	 </tr>
	</table>	
	<div id="queding">
		<s:submit name="assure"   type="button"  value="确定" onclick="dddd();"/>
		<input name="reset"     type="reset"   value="重置" /> 
	</div>
	<div  id="guanbi"  >
		<input name="guanbi" type="button" id="buttonguanbi"  value="关闭"   onclick="window.close();"/> 
	</div>
</s:form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if("<%=request.getAttribute("message")%>" != ""&&"<%=request.getAttribute("message")%>"!="null") {
		alert("<%=request.getAttribute("message")%>"); 
		window.opener.reloadJqGrid();
		window.close();
	}
</SCRIPT>
