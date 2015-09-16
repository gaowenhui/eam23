<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table class='tabletitle' cellspacing=1 cellpadding=1 width="100%">
	<tr>
		<td width="80%"></td>
		<td align="left" width="20%">
			<br>
			<div id="idMenu2" class="container2"></div>
			<%
			if(workflowVO.step.equals("draft")){%>
				<input type="button" value="保存" onclick="saveDraft()"/>
			<%}else{%>
				<input type="button" value="保存" onclick="saveTodo()"/>
			<%}%>
		</td>
	</tr>
</table>