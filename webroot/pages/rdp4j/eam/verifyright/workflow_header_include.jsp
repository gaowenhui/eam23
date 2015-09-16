<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input type="hidden" name="taskId" value="<%=taskId%>">
<input type="hidden" name="outCome" value="">
<input type="hidden" name="userId" value="">
<table class='tabletitle' cellspacing=1 cellpadding=1>
	<tr>
		<td></td>
		<!--
					<td align="center">
						<input type="submit" class="button1" value="保存">
						<input type="submit" class="button1" value="传阅">
						<input type="submit" class="button1" value="打印">
					</td>
					-->
		<td align="center">
			<div id="idMenu2" class="container2"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<br>
			<br>
			<div align="center">
				<span class="STYLE7 STYLE1">确权办理单</span>
			</div>
			<br>
			<div align="center">
				<br />
				任务编号：<%=taskId%>&nbsp;&nbsp;&nbsp;&nbsp;当前环节：<%=taskName%>&nbsp;&nbsp;&nbsp;&nbsp;处理人：<%=assigneeName%></div>
			<hr color="#6600CC" align="center" width="100%">
		</td>
	</tr>
</table>