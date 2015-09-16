<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String saveORupdate = (String)request.getAttribute("saveORupdate");
	String saveupdate = (String)request.getAttribute("saveupdate");
	boolean isDisable = false;
	isDisable = "true".equals((String)request.getAttribute("isDisable"))?true:false;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//日期
$(function(){
	$("#lrrq").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
});
</script>
</head>
<body>
<s:form id="myform">
<s:hidden name="perVO.id"></s:hidden>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">机构编号</td>
		<td class="td_zxy02"><s:textfield name="perVO.dkjgbm" cssClass="input" readonly="true" id="dkjgbm" /></td>
		<td class="td_zxy01">机构名称</td>
		<td class="td_zxy02"><s:textfield name="perVO.dkjgmc" cssClass="input" readonly="true" id="dkjgmc" /></td>
	</tr>
	<tr>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>人员名称</td>
		<td class="td_zxy02"><s:textfield name="perVO.rymc" id="rymc" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话</td>
		<td class="td_zxy02"><s:textfield name="perVO.lxfs" cssClass="input" maxlength="20" id="lxfs" onblur="checkPhone(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">录入人</td>
		<td class="td_zxy02"><s:textfield name="perVO.lrr" cssClass="input" onblur="isString(this);" /></td>
		<td class="td_zxy01">录入日期</td>
		<td class="td_zxy02">
			<s:date name="%{#request.perVO.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="lrrq" name="perVO.lrrq" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">具体联系内容</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea name="perVO.lxnr" onblur="isString(this);" cssClass="area" rows="4"></s:textarea>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">备注</td>
		<td class="td_zxy02" colspan="3">
			<s:textarea name="perVO.bz" onblur="isString(this);" cssClass="area" rows="4"></s:textarea>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01" colspan="4" >
			<%if(isDisable){ %>
			<input type="button" onclick="chooseDept();" class="buttonface" value="选择机构" >
			<%}else if("update".equals(saveupdate)){%>
			<input type="button" value="提交" onclick="tijiao();" class="buttonface" >
			<s:reset value="重置" cssClass="buttonface" ></s:reset>
			<%} else{%>
			<input type="button" onclick="chooseDept();" class="buttonface" value="选择机构" >
			<input type="button" value="提交" onclick="tijiao();" class="buttonface" >
			<s:reset value="重置" cssClass="buttonface" ></s:reset>
			<%} %>
		</td>
	</tr>
</table>
</s:form>

<script type="text/javascript">

// 点击提交
function tijiao(){
	var rymc = document.getElementById('rymc').value;
	var lxfs = document.getElementById('lxfs').value;
	if(rymc == '' || lxfs == ''){
		alert('请输入完整信息');
		return false;
	}
	var type =  '<%=saveORupdate%>';
	if(type=='save'){
		myform.action = '<%=basePath%>wtdk/personQuery_savePer.do'
		myform.submit();
	}else{
		myform.action = '<%=basePath%>wtdk/personQuery_updatePer.do'
		myform.submit();
	}
}

// 选择机构
function chooseDept(){
	var type = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
	window.open('<%=basePath%>wtdk/personQuery_orgInit.do','机构信息',type);
}

// 选择机构以后的回调方法
function callBack(id){
	myform.action = '<%=basePath%>/wtdk/personQuery_findDeptByNo.do?cmCod='+id;
	myform.submit();
}

if('<%=request.getAttribute("message")%>' != "null") {
	alert("<%=request.getAttribute("message")%>！");
	window.opener.reloadJqGrid(); 
	window.close();
}
</script>
</body>
</html>