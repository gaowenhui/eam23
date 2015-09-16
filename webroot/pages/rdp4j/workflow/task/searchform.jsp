<%@ page language="java" pageEncoding="UTF-8"%>
<form action='javascript:querystring()' name='form1' style='margin: 0'>
	<table width="100%" border="0" class="newtable" id='table1'
		align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td class="td_zxy05" width='800px' nowrap>
				&nbsp; 关键字：
				<input type='text' id='title' style='width: 60%'>
				<input name="" type="button" class="buttonface" value="  查询  "id="queryButton"
					onclick='querystring()'title="根据 拟稿人 拟稿日期 标题  编号 发送人 等关键字查询">
				<input name="" type="button" class="buttonface" value="  重置  "
					onclick='form1.reset();querystring()'>
			</td>
			<td class="td_form01" width='10%'>&nbsp;
			</td>
		</tr>
	</table>
</form>