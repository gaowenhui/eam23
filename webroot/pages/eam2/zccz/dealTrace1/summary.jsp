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
			<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
				<tr>
					<td class="td_zxy01">汇总结论：</td>
					<td class="td_zxy02">
						<e:select id="spjl" list="#{1:'同意',0:'不同意'}" name="xmXXVO.spjl" disabled="true"/>
					</td>
					<td class="td_zxy01">是否备案：</td>
					<td class="td_zxy02">
						<r:radio name="xmXXVO.sfba" id="sfba" list="#{'true':'是','false':'否'}" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">处置时限：</td>
					<td class="td_zxy02">
						<r:textfield id="czsx" name="xmXXVO.czsx" cssClass="input" disabled="true"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
			</table>
			<e:opinion id="test" width="100%">
		        <e:opinionPart id="LEADER" name="LEADER" text="批示意见：" biaodanid="%{#request.xmXXVO.id}"></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" name="OPERATION_GROUP" text="业务运营组意见：" biaodanid="%{#request.xmXXVO.id}"></e:opinionPart>
				<e:opinionPart id="APPROVEMENT" biaodanid="%{#request.xmXXVO.id}"  name="APPROVEMENT" text="审批意见审核意见："></e:opinionPart>
		   		<e:opinionPart id="SUMMARY_SUGGEST" biaodanid="%{#request.xmXXVO.id}"  name="SUMMARY_SUGGEST" text="审批意见："></e:opinionPart>
		    </e:opinion>
		</s:form>
	</body>
</html>


		


