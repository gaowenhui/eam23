<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html>
<head></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="25" align="center" valign="bottom" class="td06">
				<table width="95%" border="0" cellspacing="3" cellpadding="0">
					<tr>
						<td width="14">
							<img src="../../images/index_32.gif" width="9" height="9">
						</td>
						<td width="698" valign="middle" class="title">
							实体维护日志
						</td>
						<td width="585" align="right" valign="bottom" class="title">
							<a href="main.html"> 返回主页</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td class="td_page">
				修改时间：从
				<input type="text" name="textfield">
				到
				<input type="text" name="textfield3">
				修改人：
				<input type="text" name="textfield2">
				<input name="Submit2" type="submit" class="buttonface"
					value="  查询  ">
				<input name="Submit" type="submit" class="buttonface" value="  重置  ">
			</td>
		</tr>

	</table>

	
	</s:form>
</body>
</html>
