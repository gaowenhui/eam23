<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>

<%
String ispgsc = (String)request.getAttribute("ispgsc");
String sheadId = request.getParameter("sheadId");
String look = (String)request.getAttribute("look");
String id = (String) request.getAttribute("id");
String sfid = (String)request.getAttribute("sfid");
String stid = request.getParameter("stid");
// chenyuxiao start
String cdkzh = (String)request.getAttribute("cdkzh");
ZcPgXx zc =(ZcPgXx)request.getAttribute("zc");
String loansNo = "";
if(cdkzh!=null&&!"".equals("loansId")){
	loansNo = cdkzh;
}
// chenyuxiao end
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>实体内资产评估信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		
		function checkPageInput(){
			var pgjzr = document.getElementById("pgjzr");
			var pingguzhi = document.getElementById("pingguzhi");
			if(pgjzr.value == null || pgjzr.value.length == 0){
				alert("评估基准日不能为空!");
				pgjzr.focus();
		      return false;
		    }else if(pingguzhi.value == null || pingguzhi.value.length == 0){
				alert("评估值不能为空!");
				pingguzhi.focus();
		      return false;
		    }
		    return true;
		}	
		
		function save(){
 			if(checkPageInput()){
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveZcPgXx.do?sfid="+'<%=sfid%>'+"&cdkzh="+'<%=loansNo%>'+"&ispgsc="+'<%=ispgsc%>');
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
		   	$("#pgjzr").datebox({
				formatter:function(date){
					return formatDate(date);				
				}
			});
			
			<%if(zc!=null&&zc.getPingguzhi()!=null&&!"".equals(zc.getPingguzhi())){%>
			   $("#pingguzhi").val(${zc.pingguzhi}.toFixed(2));
			<%}%>
			
			<%if(zc!=null&&zc.getJzrzmjz()!=null&&!"".equals(zc.getJzrzmjz())){%>
			   $("#jzrzmjz").val(${zc.jzrzmjz}.toFixed(2));
			<%}%>
			<%if(zc!=null&&zc.getJingzhi()!=null&&!"".equals(zc.getJingzhi())){%>
			   $("#jingzhi").val(${zc.jingzhi}.toFixed(2));
			<%}%>
			<%if(zc!=null&&zc.getBxe()!=null&&!"".equals(zc.getBxe())){%>
			   $("#bxe").val(${zc.bxe}.toFixed(2));
			<%}%>
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
		<s:form action="" method="post" id="myform">
		<s:hidden name="sf.id" id="id"></s:hidden>
		<s:hidden name="sff.id" id="sfid"></s:hidden>
		<s:hidden name="sf.cdkzh" id="cdkzh"></s:hidden>
		<s:hidden name="zc.id" id="zcid" value="%{#request.zc.id}"></s:hidden>
		<table id="traffic_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
             <td class="td_zxy01">评估方法：</td>
              <td class="td_zxy02">
              <e:select name="zc.pgff" id="pgff" value="%{#request.zc.pgff}" list="#{}" parRefKey="ESTIMATE_METHOD" headerKey="" headerValue="请选择" />
             </td>
           	  <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>评估基准日</td>
              <td class="td_zxy02">
           	  	<s:date name="%{#request.zc.pgjzr}" format="yyyy-MM-dd" var="pgjzr"/>
			 	<s:textfield name="zc.pgjzr" id="pgjzr"  value="%{#pgjzr}" readonly="true"  />
			 </td>
            </tr>
            <tr>
              <td class="td_zxy01" ><font color="#FF0000"><strong>*</strong></font>评估值(元)：</td>
              <td class="td_zxy02"><s:textfield name="zc.pingguzhi" id="pingguzhi" onblur="checkFloat(this);"/></td>
           	  <td class="td_zxy01">评估基准日账面价值(元)：</td>
              <td class="td_zxy02"><s:textfield name="zc.jzrzmjz" id="jzrzmjz"  onblur="checkFloat(this);"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">净值(元)：</td>
              <td class="td_zxy02"><s:textfield name="zc.jingzhi" id="jingzhi" onblur="checkFloat(this);"/></td>
              <td class="td_zxy01">价值类型：</td>
              <td class="td_zxy02">
              <e:select  list="#{}" parRefKey="ESTIMATE_VALUE_TYPE" headerKey="" headerValue="请选择" name="zc.CJzlx" id="CJzlx" value="%{#request.zc.CJzlx}"/>
              </td>
            </tr>
            <tr>
              <td class="td_zxy01" >变现额(元)：</td>
              <td class="td_zxy02"><s:textfield name="zc.bxe" id="bxe" onblur="checkFloat(this);"/></td>
           	  <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
            </tr>
            <tr>
              <td class="td_zxy01">备注：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="zc.beizhu" id="beizhu" rows="3" cols="100"></s:textarea></td>
            </tr>
            <tr>
              <td class="td_zxy02" colspan="4">
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
