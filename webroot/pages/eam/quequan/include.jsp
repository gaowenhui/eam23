<%@page language="java" pageEncoding="UTF-8"%>
<hr>
<%=request.getParameter("tid")%>
<hr>


<table class="table1" width="100%" border="1" align="center"
	cellpadding="0" cellspacing="0">

	<tr>
		<td valign='top'>
			会签部门意见：
		</td>
		<td width='60%'>

			<table width="338" height="227">


				<s:iterator value="listLcYj" status="ll" id="lcyj">
					<tr>
						<td class="td_form01" align=left width='400px'>
							意见内容：
							<s:property value="#lcyj.yjnr" />
						</td>

					</tr>
					<tr>
						<td class="td_form01" 　align='right' width='400px'>
							部门编号：
							<s:property value="#lcyj.bmbh" />
							意见提交人：
							<s:property value="#lcyj.yjtjr" />
						</td>
					</tr>
				</s:iterator>


			</table>
		</td>

	</tr>
</table>