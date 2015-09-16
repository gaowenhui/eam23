<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc" %>
<%
	String saveORupdate = (String)request.getAttribute("saveORupdate"); 
	boolean flush = false;
	flush = "true".equals((String)request.getAttribute("flush"))?true:false;
	String isflush = "";
	if(flush){
		isflush = "1";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贷款担险信息</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="p" class="easyui-panel" title="风险分类详细信息" icon="icon-save" style="width:'auto';height:'auto';padding:0px;background:#fafafa;">
<s:form id="myform">
	<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
		<tr>
			<td class="td_zxy01">分类日期</td>
			<td class="td_zxy02"><s:textfield id="riskDate" name="riskVO.riskDate" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">贷款客户账号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.CAcctNo" cssClass="input" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">资产管理部门</td>
			<td class="td_zxy02"><s:textfield name="riskVO.magDpt" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">贷款方客户名称</td>
			<td class="td_zxy02"><s:textfield name="riskVO.CCustName" cssClass="input" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">贷款系统账号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.lnAcctNo" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">贷款方客户编号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.CCustId" cssClass="input" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">资产类型</td>
			<td class="td_zxy02"><s:select list="{'担险','不但险'}" name="riskVO.assetType"></s:select></td>
			<td class="td_zxy01">委托方客户编号</td>
			<td class="td_zxy02"><s:textfield name="riskVO.DAcctNo" cssClass="input" readonly="true" /></td>
		</tr>
		<tr>
			<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>担险原因</td>
			<td class="td_zxy02"><s:textfield name="riskVO.riskReason" cssClass="input" id="riskReason" /></td>
			<td class="td_zxy01">基金情况</td>
			<td class="td_zxy02"><s:select list="#{1:'无基金',2:'有基金',3:'超基金'}" name="riskVO.fundType" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">预计损失率%</td>
			<td class="td_zxy02"><s:textfield name="riskVO.lostRate" cssClass="input" onblur="checkPresent(this);" /></td>
			<td class="td_zxy01">预计损失金额</td>
			<td class="td_zxy02"><s:textfield name="riskVO.lostJe" cssClass="input" id="lostJe" onblur="checkFloat(this);" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">审核日期</td>
			<td class="td_zxy02"><s:textfield id="verifiedDate" name="riskVO.verifiedDate" cssClass="input" readonly="true" /></td>
			<td class="td_zxy01">审核风险等级</td>
			<td class="td_zxy02">
			<span class="td_page">
				<s:select list="{'一级风险','二级风险','三级风险'}" name="riskVO.verRiskLeve"></s:select>
			</span>
			</td>
		</tr>
		<tr>
			<td class="td_zxy01">审核预计损失率%</td>
			<td class="td_zxy02"><s:textfield name="riskVO.verLostRate" cssClass="input" onblur="checkPresent(this);" /></td>
			<td class="td_zxy01">审核预计损失金额</td>
			<td class="td_zxy02"><s:textfield name="riskVO.verLostJe" cssClass="input" onblur="checkFloat(this);" /></td>
		</tr>
		<tr>
			<td class="td_zxy01">审核人</td>
			<td class="td_zxy02"><s:textfield name="riskVO.verPerson" cssClass="input" onblur="isString(this)" /></td>
			<td class="td_zxy01">审核级别</td>
			<td class="td_zxy02">
				<span class="td_page">
					<s:select list="{'一级','二级','三级'}" name="riskVO.verLevel"></s:select>
				</span>
			</td>
		</tr>
		<tr>
			<td class="td_zxy01">备注</td>
			<td class="td_zxy02" colspan="3">
				<s:textarea name="riskVO.memoInfo" id="memoInfo" cssClass="area" rows="4"></s:textarea>
			</td>
		</tr>
		<tr>
			<td class="td_zxy01" colspan="4">
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
	var riskReason = document.getElementById('riskReason').value;
	if(riskReason == ''){
		alert('请输入完整信息');
		return false;
	}
	var type = '<%=saveORupdate%>';
	var url = "<%=basePath%>wtdk/loansQuery_saveOrUpdateWdDXInfor.do?type="+type
	myform.action = url;
	myform.submit();
	if('<%=isflush%>'=='1'){
		window.opener.reloadBody();
	}
}

// 执行完成后弹出提示框
if('<%=request.getAttribute("message")%>' != "null") {
	alert("<%=request.getAttribute("message")%>！");
	window.close();
}
</script>
</body>
</html>
