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
String stid = (String)request.getAttribute("stid");
String bili = request.getParameter("bili");
String newAdd = request.getParameter("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>项目企业出资情况</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			
		function checkPageInput(){
			var qgdmc = document.getElementById("qgdmc");
			if(qgdmc.value == null || qgdmc.value.length == 0){
				alert("股东名称不能为空！");
				qgdmc.focus();
		      return false;
		    }
		    return true;
		}	
			
			
		function save(){
			if(checkPageInput()){
				alert("持股比例之和："+(Number('<%=bili%>') + Number($("input[name='sf.qkgbl']").val()))+"%");
				if(Number('<%=bili%>') + Number($("input[name='sf.qkgbl']").val()) > 100){
					alert("持股比例之和不能大于100%!");
					return false;
				}else{
					$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
			    	$("#myform").submit();
				}
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
		});
		
		
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
<s:hidden name="sf.stnzcfl" id="stnzcfl" value="13"></s:hidden>
<table id="contributions_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td class="td_form01">
              <font color="#FF0000"><strong>*</strong></font>
             	 股东名称：</td>
              <td class="td_form02"><s:textfield name="sf.qgdmc" id="qgdmc" /></td>
              <td class="td_form01">持股比例（%）： </td>
              <td class="td_form02"><s:textfield name="sf.qkgbl" id="qkgbl" onblur="checkPresent(this);"/></td>
            </tr>	
            <tr>
              <td class="td_form01">注册资本（元）：</td>
              <td class="td_form02"><s:textfield name="sf.qzczb" id="qzczb"  onblur="checkFloat(this);"/></td>
              <td class="td_form01">出资方式：</td>
              <td class="td_form02"><e:select parRefKey="CONTRIBUTION_METHOD" list="#{}" name="sf.qcCzfs" id="qcCzfs" value="%{#request.sf.qcCzfs}"/></td>
            </tr>
            <tr>
              <td class="td_form01">出资情况：</td>
              <td class="td_form02"><e:select parRefKey="CONTRIBUTION_DESC" list="#{}" name="sf.qcCzqk" id="qcCzqk" value="%{#request.sf.qcCzqk}"/></td>
              <td class="td_form01">出资不实的数额(元)：</td>
              <td class="td_form02"><s:textfield name="sf.qczbsse" id="qczbsse" /></td>
            </tr>	
            <tr>
              <td class="td_form01">抽逃出资：</td>
              <td class="td_form02">
              <s:select list="#{'':'请选择',1:'存在',2:'不存在',3:'无资料'}" name="sf.qcCtcz" id="qcCtcz" value="%{#request.sf.qcCtcz}"></s:select></td>
              <td class="td_form01">抽逃数额(元)：</td>
              <td class="td_form02"><s:textfield name="sf.qctse" id="qctse" /></td>
            </tr>	
            <tr>
              <td class="td_form01">独立法人资格：</td>
              <td class="td_form02"><s:textfield name="sf.qdlfrzg" id="qdlfrzg" /></td>
              <td class="td_form01">&nbsp;</td>
              <td class="td_form02">&nbsp;</td>
            </tr>	
            <tr>
            	    <td class="td_form01">备注：</td>
            	    <td colspan="3"  class="td_form02"><s:textarea name="sf.beizhu" id="beizhu"style="width: 85%;"  rows="3"/>
            		</td>
            </tr>
            <tr>
              <td class="td_form02" colspan="4">
              <div align="right">
              <%if(!"1".equals(look)){ %>
			     <input name="sdfg" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
                 <%} %>
              </div>   
			  </td>
            </tr>
</table> 
</s:form>

	</body>
</html>
