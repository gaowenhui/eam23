<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<r:controlfile file="/pages/eam2/zccz/dealTrace1/summary.ctl.xml"></r:controlfile>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>审批委员意见提交情况</title>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
			<br/>
			项目名称：<s:textfield name="xmXXVO.czxmmc" cssClass="input" readonly="true"/>
			<table width="100%" class="ui-jqgrid ui-jqgrid-btable" cellspacing="0" cellpadding="0">	
				<tr class="ui-jqgrid-labels" style="height: 25px;">
 					<td class="ui-state-default  ui-th-ltr" align="center">审批人员</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">姓名</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">同意</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">不同意</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">其他情况</td>
 					<td class="ui-state-default  ui-th-ltr" align="center">审批意见和建议</td>
				</tr>
				<s:iterator value="finalList">
				<tr class="jqgrow ui-widget-content">
					<td  align="center"><s:property value="personType"/>&nbsp;</td>
					<td  align="center"><s:property value="spwyxm"/>&nbsp;</td>
					<td  align="center"><s:property value="agreeStr"/>&nbsp;</td>
					<td  align="center"><s:property value="disagreeStr"/>&nbsp;</td>
					<td  align="center"><s:property value="qtqk"/>&nbsp;</td>
					<td  align="center"><s:property value="spyjjy"/>&nbsp;</td>
				</tr>
				</s:iterator>
				<tr class="jqgrow ui-widget-content">
					<td  align="center">&nbsp;&nbsp;</td>
					<td  align="center">计票统计：</td>
					<td  align="center">
						<s:property value="%{#request.xmXXVO.agreeCount}"/>
						<s:hidden name="xmXXVO.agreeCount" />
					</td>
					<td  align="center">
						<s:property value="%{#request.xmXXVO.disagreeCount}"/>
						<s:hidden name="xmXXVO.disagreeCount"/>
					</td>
					<td  align="center">&nbsp;&nbsp;</td>
					<td class="td_01" align="center">&nbsp;&nbsp;</td>
				</tr>
			</table>
	</body>
</html>


		


