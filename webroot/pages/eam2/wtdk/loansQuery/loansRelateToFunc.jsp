<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String saveORupdate = (String)request.getAttribute("saveORupdate");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贷款关联基金信息查询</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:hidden name="riskVO.xulie" id="xulie"></s:hidden>
<div id="p" class="easyui-panel" title="关联基金信息" icon="icon-save" style="width:'auto';height:'auto';padding:0px;background:#fafafa;">
<s:form id="myform">
	<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
		<tr>
			<td class="td_zxy01">贷款客户账号</td>
			<td class="td_zxy02"><s:textfield id="cAcctNo" name="riskVO.CAcctNo" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">录入人</td>
			<td class="td_zxy02"><s:textfield name="riskVO.fundAccountsTaster" cssClass="input" id="fundAccountsTaster" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">资产管理部门</td>
			<td class="td_zxy02"><s:textfield name="riskVO.magDpt" id="magDpt" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">贷款方客户名称</td>
			<td class="td_zxy02"><s:textfield name="riskVO.CCustName" id="CCustName" cssClass="input" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">贷款系统账号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.lnAcctNo" id="lnAcctNo" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">贷款方客户编号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.CCustId" id="CCustId" cssClass="input" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">基金系统账号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.saSysAcctNo" cssClass="input" id="saSysAcctNo" readonly="true" /></td>
			<td class="td_zxy01">基金客户账号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.savCustAcctNo" cssClass="input" id="savCustAcctNo" readonly="true" /></td>
		</tr>
		
		<tr>
			<td class="td_form01" colspan="4">
				<input type="button" value="选择基金" class="buttonface" onclick="xuanze();" >
				<input type="button" value="确定" onclick="queding();" class="buttonface" >
				<s:reset value="重置" cssClass="buttonface" ></s:reset>
			</td>
		</tr>
	</table>
</s:form>
</div>

<script type="text/javascript">
// 日期转换
$(function(){
	$("#verifiedDate").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
});

//提交
function queding(){
	var cAcctNo = document.getElementById('cAcctNo').value;
	var fundAccountsTaster = document.getElementById('fundAccountsTaster').value;
	var magDpt = document.getElementById('magDpt').value;
	var CCustName = document.getElementById('CCustName').value;
	var lnAcctNo = document.getElementById('lnAcctNo').value;
	var CCustId = document.getElementById('CCustId').value;
	var saSysAcctNo = document.getElementById('saSysAcctNo').value;
	var savCustAcctNo = document.getElementById('savCustAcctNo').value;
	var xulie = document.getElementById('xulie').value;
	var type = '<%=saveORupdate%>';
	var url = "<%=basePath%>wtdk/loansQuery_saveOrUpdateRenateInfor.do"
	//myform.action = url;
	//myform.submit();
	$.post(url,{type:"" + type + "",
				cAcctNo:"" + cAcctNo + "",
				fundAccountsTaster:"" + fundAccountsTaster + "",
				magDpt:"" + magDpt + "",
				CCustName:"" + CCustName + "",
				lnAcctNo:"" + lnAcctNo + "",
				CCustId:"" + CCustId + "",
				saSysAcctNo:"" + saSysAcctNo + "",
				xulie:"" + xulie + "",
				savCustAcctNo:"" + savCustAcctNo + ""}, function(data){
		if(data!=null && data!=''){
			alert(data);
			window.opener.reloadGridaaa();
			window.close();
		}
	});
}

// 选择
function xuanze(){
	var model = 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=no,left=100,top=0';
	window.open('<%=basePath%>wtdk/funcQuery_init.do?isFuLn=true','',model);
}

// 选择基金后的回调方法
function callBackRelate(funcNo){
	var type = '<%=saveORupdate%>';
	//myform.action = '<%=basePath%>wtdk/loansQuery_relate.do?funcNo='+funcNo+'&saveORupdate='+type;
	//myform.submit();
	var url = '<%=basePath%>wtdk/loansQuery_relate.do';
	$.post(url,{saveORupdate:"" + type + "",funcNo:"" + funcNo + ""}, function(data){
		if(data!=null && data!=''){
			var a = data.split("=");
			document.getElementById('saSysAcctNo').value = a[0];
			document.getElementById('savCustAcctNo').value = a[1];
		}
	});
}
</script>
</body>
</html>
