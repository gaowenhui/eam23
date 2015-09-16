<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<r:controlfile file="/pages/eam2/zccz/dealTrace1/summary.ctl.xml"></r:controlfile>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>汇总审批意见</title>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form id="myform">
			<s:hidden name="xmXXVO.id"/>
			<br/>
			项目名称：<s:textfield name="xmXXVO.czxmmc" cssClass="input" readonly="true"/>
			<table width="95%" border="1" cellspacing="0" cellpadding="0">	
				<tr>
 					<td class="td_top" align="center">审批人员</td>
 					<td class="td_top" align="center">姓名</td>
 					<td class="td_top" align="center">同意</td>
 					<td class="td_top" align="center">不同意</td>
 					<td class="td_top" align="center">其他情况</td>
 					<td class="td_top" align="center">审批意见和建议</td>
				</tr>
				<s:iterator value="finalList">
				<tr>
					<td style="height:50px" align="center"><s:property value="personType"/></td>
					<td style="height:50px" align="center"><s:property value="spwyxm"/></td>
					<td style="height:50px" align="center"><s:property value="agreeStr"/></td>
					<td style="height:50px" align="center"><s:property value="disagreeStr"/></td>
					<td style="height:50px" align="center"><s:property value="qtqk"/></td>
					<td style="height:50px" align="center"><s:property value="spyjjy"/></td>
				</tr>
				</s:iterator>
				<tr>
					<td style="height:50px" align="center">&nbsp;&nbsp;</td>
					<td style="height:50px" align="center">计票统计：</td>
					<td style="height:50px" align="center"><s:textfield name="xmXXVO.agreeCount" cssClass="input" readonly="true"/></td>
					<td style="height:50px" align="center"><s:textfield name="xmXXVO.disagreeCount" cssClass="input" readonly="true"/></td>
					<td style="height:50px" align="center">&nbsp;&nbsp;</td>
					<td style="height:50px" align="center">&nbsp;&nbsp;</td>
				</tr>
			</table>
		    <p>
				汇总结论：<s:select list="#{1:'同意',0:'不同意'}" name="xmXXVO.spjl" disabled="true"></s:select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				是否备案：<s:checkbox name="xmXXVO.sfba" disabled="true"/>
			</p>
			<e:opinion id="test" width="100%">
		        <e:opinionPart id="LEADER" name="LEADER" text="批示意见：" biaodanid="%{#request.xmXXVO.id}"></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" name="OPERATION_GROUP" text="业务运营组意见：" biaodanid="%{#request.xmXXVO.id}"></e:opinionPart>
				<e:opinionPart id="APPROVEMENT" biaodanid="%{#request.xmXXVO.id}"  name="APPROVEMENT" text="汇总意见审核意见："></e:opinionPart>
		   		<e:opinionPart id="SUMMARY_SUGGEST" biaodanid="%{#request.xmXXVO.id}"  name="SUMMARY_SUGGEST" text="汇总意见和建议："></e:opinionPart>
		    </e:opinion>
		</s:form>
	</body>
</html>


		


