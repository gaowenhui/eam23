<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String authority = request.getParameter("authority"); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>处置项目合规性审核表</title>
		<script type="text/javascript">
			function submitAdvice(){
				$("#myForm").submit();
				window.close();
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td height="25" align="left" valign="bottom" class="td06">
					<table width="100%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td valign="bottom" class="title">
								<div align="center">
									处置项目合规性审核表
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<s:form id="myForm" action="zccz/bldAction_saveAdvice.do">
			<s:hidden id="cldId" name="advice.cldId" />
			<s:hidden id="id" name="advice.id" />
			<s:hidden id="bianhao" name="advice.bianhao" value="%{#request.head.bianhao}"/>
			<strong><font color="red">备注：*为必要项</font></strong>
			<table class="newtable" width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
				<tr>
					<td colspan="2" class="ui-widget-header">项目名称：<s:property value="%{#request.xmmc}"/></td>
				</tr>
				<tr>
					<td class="td_page2"><strong>审核内容</strong></td>
					<td class="td_page2"><strong>审核意见</strong></td>
				</tr>				
				<tr><td colspan="2" class="panel-header"><strong>一、申报程序</strong></td></tr>
				<tr>
					<td class="td_zxy01_left">1、是否经部门领导审批同意<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="bmldspyj" name="advice.bmldspyj" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">2、是否经分管领导审批同意<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="fgldspyj" name="advice.fgldspyj" />
					</td>
				</tr>

				<tr>
					<td class="td_zxy01_left">3、是否有委托单位上报文件</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="wtdwsbwj" name="advice.wtdwsbwj" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">4、是否有评估报告及审查意见</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="pgbgjshyj" name="advice.pgbgjshyj" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">5、是否按要求公告</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="ayqjxgg" name="advice.ayqjxgg" />
					</td>
				</tr>
			</table>
			<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
				<tr><td colspan="2" class="panel-header"><strong>二、申报单</strong></td></tr>
				<tr>
					<td class="td_zxy01_left">1、标题是否规范准确<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="btgfzq" name="advice.btgfzq" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">2、各项填写是否规范准确<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="gxtxgfzq" name="advice.gxtxgfzq" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">3、经办人意见是否清晰无误<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="jbryjqxww" name="advice.jbryjqxww" cssClass="input" />
					</td>
				</tr>
			</table>
			<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
				<tr><td colspan="2" class="panel-header"><strong>三、处置报告</strong></td></tr>
				<tr>
					<td class="td_zxy01_left" width="25%">1、格式是否规范<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="gsgf" name="advice.gsgf" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">2、内容是否清晰完整</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="nrqxwz" name="advice.nrqxwz" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">
						&nbsp;&nbsp;--项目基本情况<span class="STYLE2">*</span>
					</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="xmjbqk" name="advice.xmjbqk" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >
						&nbsp;&nbsp;--评估及其审核<span class="STYLE2">*</span>
					</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="pgjqsh" name="advice.pgjqsh" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">
						&nbsp;&nbsp;--处置方案及方案比较<span class="STYLE2">*</span>
					</td>
					<td class="td_zxy03">
						<s:textfield id="czfajfabj" name="advice.czfajfabj" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">
						&nbsp;&nbsp;--处置收益<span class="STYLE2">*</span>
					</td>
					<td class="td_zxy03">
						<s:textfield cssClass="input" id="czsy" name="advice.czsy" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">&nbsp;&nbsp;--处置费用<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="czfy" name="advice.czfy" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">&nbsp;&nbsp;--部门意见<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="bmyj" name="advice.bmyj" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >3、文字是否规范无误<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="wzgfww" name="advice.wzgfww" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >4、各数据是否真实准确<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="gsjzszq" name="advice.gsjzszq" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >5、有关意见是否有依据<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="ygyjycfyj" name="advice.ygyjycfyj" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >6、处置方式是否合规<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="czfshg" name="advice.czfshg" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >7、处置定价是否合规<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="czdjhg" name="advice.czdjhg" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left" >8、处置费用是否合规<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="czfyhg" name="advice.czfyhg" cssClass="input" />
					</td>
				</tr>
			</table>
			<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0">
				<tr><td colspan="2" class="panel-header"><strong>四、附件</strong></td></tr>
				<tr>
					<td class="td_zxy01_left">1、所需附件是否齐全</td>
					<td class="td_zxy03">
						<s:textfield id="sxfjqq" name="advice.sxfjqq" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">&nbsp;&nbsp;--评估报告及审查意见</td>
					<td class="td_zxy03">
						<s:textfield id="fjpgbgjshyj" name="advice.fjpgbgjshyj" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">&nbsp;&nbsp;--公告页面</td>
					<td class="td_zxy03">
						<s:textfield id="ggym" name="advice.ggym" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">&nbsp;&nbsp;--委托单位上报文件</td>
					<td class="td_zxy03">
						<s:textfield id="fjwtdwsbwj" name="advice.fjwtdwsbwj" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">&nbsp;&nbsp;--项目有关附件</td>
					<td class="td_zxy03">
						<s:textfield id="xmygwj" name="advice.xmygwj" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">2、附件格式是否规范<span class="STYLE2">*</span></td>
					<td class="td_zxy03">
						<s:textfield id="fjgsgf" name="advice.fjgsgf" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">3、评估报告是否在有效期</td>
					<td class="td_zxy03">
						<s:textfield id="pgbgzyxq" name="advice.pgbgzyxq" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01_left">4、公告内容是否规范完整</td>
					<td class="td_zxy03">
						<s:textfield id="ggnrgfwz" name="advice.ggnrgfwz" cssClass="input" />
					</td>
				</tr>
				
				<tr>
					<td class="td_zxy01_left">5、公告是否满足时限要求</td>
					<td class="td_zxy03">
						<s:textfield id="ggmzsxyq" name="advice.ggmzsxyq" cssClass="input" />
					</td>
				</tr>
				<tr><td colspan="2" class="panel-header">&nbsp;</td></tr>
				<tr>
					<td class="td_page2"><strong>审核结论</strong></td>
					<td class="td_zxy03">
						<s:textfield id="ggmzsxyq" name="advice.shjl" cssClass="input" />
					</td>
				</tr>				
			</table>
			<%if(StringUtils.equals("w",authority)){ %>
			<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
				<tr>
					<td colspan="2" align="center">
						<input value="确定" type="button" onclick="submitAdvice();return false;">
					</td>
				</tr>
			</table>
			<%} %>
		</s:form>
	</body>
</html>
