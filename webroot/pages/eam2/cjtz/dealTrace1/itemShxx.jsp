<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	
%>
<html>
	<head>
	   	<base href="<%=basePath %>" />
		<title>资产处置审批</title>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form id="myform">
			<s:hidden name="xmXXVO.id"/>
			<table width="95%" border="1" cellspacing="0" cellpadding="0">		
				<tr>
					<td class="td_zxy01">处置项目名称：</td>
					<td class="td_form02" colspan="3"><s:textfield name="xmXXVO.czxmmc" size="126" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">审批委员：</td>
					<td class="td_form02" colspan="3">
						<s:hidden name="xmXXVO.spwyId" id="spwyIds"/>
						<s:textfield name="xmXXVO.spwys" cssClass="input" id="spwys">
							<span id="chooseSpwy" style="align:left;" id=""></span>
						</s:textfield>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">汇报人：</td>
					<td class="td_form02">
						<s:hidden name="xmXXVO.hbr" cssClass="input" id="hbr"/>
						<s:textfield name="xmXXVO.hbrxm" maxlength="10"  cssClass="input" id="hbrxm">
							<span id="chooseHbr" style="align:left;"></span>
						</s:textfield>
					</td>
					<td class="td_zxy01">监察室列席人：</td>
					<td class="td_form02">
						<s:hidden name="xmXXVO.jcslxr" cssClass="input" id="jcslxr"/>
						<s:textfield name="xmXXVO.jcslxrxm" maxlength="10" cssClass="input" readonly="true" id="jcslxrxm">
							<span id="chooseJcslxr" style="align:left;"></span>
						</s:textfield>
			        	
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>意见汇总人：</td>
					<td class="td_form02">
						<s:hidden name="xmXXVO.yjhzr" cssClass="input" id="yjhzr"/>
						<s:hidden name="xmXXVO.yjhzrbmid" cssClass="input" id="yjhzrbmid"/>
						<s:hidden name="xmXXVO.yjhzrbmmc" cssClass="input" id="yjhzrbmmc"/>
						<s:textfield name="xmXXVO.yjhzrxm" cssClass="input" maxlength="10" id="yjhzrxm">
							<span id="chooseYjhzr" style="align:center;"></span>
						</s:textfield>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01" width="200">审批时间：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.spsj" size="36" cssClass="input" readonly="true"/></td>
					<td  class="td_zxy01" width="200">审批方式：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.CSpfs" size="36" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td  class="td_zxy01">会议次数：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.hycs" size="36" cssClass="input" readonly="true"/></td>
					<td  class="td_zxy01">审批主持人：</td>
					<td class="td_form02"><s:textfield name="xmXXVO.spzcr" size="36" cssClass="input" readonly="true"/></td>
				</tr>
			</table>	
		</s:form>
	</body>
</html>

