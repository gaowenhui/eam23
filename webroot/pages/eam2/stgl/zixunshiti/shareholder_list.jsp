<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>实体股权结构</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			function refresh(){

//				document.getElementById("sheadId").value = <%=sheadId%>;
//				document.myform.sheadId.value='<%=sheadId%>';
				document.forms[0].sheadId.value ='<%=sheadId%>';
				$("#myform").attr("action","<%=basePath%>stgl/outStorageBody_addBody.do");
				$("#myform").submit();
			}
			
			function onload(){
//				document.myform.sheadId.value = <%=sheadId%>;
			}
			
		function save(){
			$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do");
	    	$("#myform").submit();
	    	window.returnValue = 123;
	    	window.close();
	 //   	return false;
		}
			
		</script>
	</head>
	<base target="_self"/>
	<body onload="onload()">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="myform">
<s:hidden name="sf.id" id="id"></s:hidden>
<table id="tableWidth" class="newtable" align="center" width="100%" cellspacing="0" cellpadding="0">
             <tr>
              <td class="td_form01">股东名称： </td>
              <td class="td_form02"><s:textfield name="sf.egdmc" id="egdmc" /></td>
              <td class="td_form01">股东性质：</td>
              <td class="td_form02"><s:textfield name="sf.egdxz" id="egdxz" /></td>
            </tr>	
            <tr>
              <td class="td_form01">持股比例（%）： </td>
              <td class="td_form02"><s:textfield name="sf.ecgbl" id="ecgbl" /></td>
              <td class="td_form01">报告日期：</td>
              <td class="td_form02"><s:textfield name="sf.ebgrq" id="ebgrq" /></td>
            </tr>
            <tr>
              <td class="td_form01">持股数量（万股）： </td>
              <td class="td_form02"><s:textfield name="sf.ecgsl" id="ecgsl" /></td>
              <td class="td_form01">本部是否控股：</td>
              <td class="td_form02"><s:textfield name="sf.ebbsfkg" id="ebbsfkg" /></td>
            </tr>	
            <tr>
              <td class="td_form02" colspan="4">
              <div align="right">
			     <input name="sdfg" type="submit" value="确定" onClick="save(); return false;"/>
                 <input name="reset" type="reset" value="重置" />
              </div>   
			  </td>
            </tr>
    </table>
			<input type="button" value="提交" onclick="parentPage()"/>
			<s:reset label="重置"></s:reset>
		</s:form>

	</body>
</html>
<SCRIPT LANGUAGE="JavaScript">

 	if('<%=request.getAttribute("msg")%>' !="null"){
		window.close();
 	}
 
</SCRIPT>
