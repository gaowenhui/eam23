<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");
String newAdd = request.getParameter("newAdd");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String look = (String)request.getAttribute("look");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>实体财务报表信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
			
		function save(){
			$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
	    	$("#myform").submit();
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		   
	   	$("#dbbrq").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
		   
		});
		
		
		function vewDisabled(){
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
			document.getElementById("uploadbt_single").style.display="none";
			document.getElementById("deletefilebutton").style.display="none";
			}	
		}
		
		
</script>
</head>
<base target="_self"/>
<body onload="vewDisabled();">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="myform">
<s:hidden name="sf.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<s:set name="biaodanid" value="sf.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="sf.leixing" id="leixing"></s:hidden>
<s:hidden name="sf.stnzcfl" id="leixing" value="5"></s:hidden>
<table id="report_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_form01">报表分类： </td>
              <td class="td_form02"><e:select parRefKey="REPORT_FORM_CLASSIFY" list="#{}" name="sf.dcBbfl" id="dcBbfl" value="%{#request.sf.dcBbfl }"/></td>
              <td class="td_form01">报表类型：</td>
              <td class="td_form02"><e:select parRefKey="REPORT_FORM_TYPE" list="#{}" name="sf.dcBblx" id="dcBblx" value="%{#request.sf.dcBblx }"/></td>
            </tr>	
            <tr>
              <td class="td_form01">行业类型：</td>
              <td class="td_form02"><s:textfield name="sf.dhylx" id="dhylx" /></td>
              <td class="td_form01">报表日期：</td>
              <td class="td_form02"><s:textfield name="sf.dbbrq" id="dbbrq" readonly="true"/></td>
            </tr>
           <tr>
              <td class="td_form01">报表上传日期：</td>
              <td class="td_form02">
              	<s:date name="%{#request.sf.dbbscrq}" format="yyyy-MM-dd"  />
				<s:textfield  name="sf.dbbscrq"  id="dbbscrq"  readonly="true" value="%{#request.sf.dbbscrq}" />
              <td class="td_form01">&nbsp;</td>
              <td class="td_form02">&nbsp;</td>
            </tr>
            <tr>
				<td class="td_form01">报表(文件)：</td>
				<td class="td_form02"  colspan="3"><e:filebutton fjlx="single" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
			</tr>
            <tr>
              <td class="td_form02" colspan="4" align="right">
              <div align="right">
              <%if(!"1".equals(look)) {%>
			     <input name="dfd" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
             	<%} %>
              </div>   
			  </td>
            </tr>
       </table> 
</s:form>

	</body>
</html>
