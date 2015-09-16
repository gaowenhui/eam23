<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String Ids = (String)request.getAttribute("bodyIds");
	String bodyIds = "";
	if(!"".equals(Ids)&&Ids!=null){
		bodyIds = Ids;
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片减少批量操作</title>
</head>
<body>
<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
		<td class="td_top">减少方式</td>
		<td class="td_top">
			<e:select parRefKey="ENTITY_TRADE" parentId="1533" list="#{}" name="body.dealmethod" id="dealmethod"/>
      	</td>
		<td class="td_top">减少原因</td>
		<td class="td_top">
			<e:select parRefKey="CARD_REDUCE_REASON" list="#{}" name="body.changereason" id="changereason" />
		</td>
	</tr>
	<tr>
		<td align="right" colspan="4">
			<input type="button" class="buttonface" value=" 确定 "  onclick="queding();">&nbsp;
			<input type="button" class="buttonface" value=" 取消 "onclick="window.close()">
		</td>
	</tr>
</table>
</body>
<script type="text/javascript">
	// 批量操作回调方法
	function queding(){
		var bodyIds = '<%=bodyIds%>';
		var dealmethod = document.getElementById('dealmethod').value;
		var changereason = document.getElementById('changereason').value;
		window.opener.callBackBatchOperate(dealmethod,changereason,bodyIds);
	}
</script>
</html>