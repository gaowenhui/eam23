<%@page language="java" pageEncoding="UTF-8"%>
<hr>
<%=request.getParameter("tid")%>
<hr>


<table class="table1" width="100%" border="1" align="center"
	cellpadding="0" cellspacing="0">

	<tr>
		<td valign='top'>
			��ǩ���������
		</td>
		<td width='60%'>

			<table width="338" height="227">


				<s:iterator value="listLcYj" status="ll" id="lcyj">
					<tr>
						<td class="td_form01" align=left width='400px'>
							������ݣ�
							<s:property value="#lcyj.yjnr" />
						</td>

					</tr>
					<tr>
						<td class="td_form01" ��align='right' width='400px'>
							���ű�ţ�
							<s:property value="#lcyj.bmbh" />
							����ύ�ˣ�
							<s:property value="#lcyj.yjtjr" />
						</td>
					</tr>
				</s:iterator>


			</table>
		</td>

	</tr>
</table>