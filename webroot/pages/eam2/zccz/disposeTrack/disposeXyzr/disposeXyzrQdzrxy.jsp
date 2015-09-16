<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/zccz/checkJS.inc" %>
<%

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>签订转让协议</title>
<script type="text/javascript">
$(function(){
		if("change"=="${sheettype}"){
			$("select,input").attr("disabled","disabled");
		}
})
function save(){
	var url = "<%=request.getContextPath()%>/zccz/disposeTrack_saveTrack.do";
	myform.action = url;
	myform.submit();
}	
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form name="myform">
<table id="table0" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
<s:hidden name="track.id" id="trackId"/>
<s:hidden name="track.czgzfs" id="czgzfs"/>
<s:hidden name="track.czgzhj"/>
<s:hidden name="track.xmid"/>
<s:hidden name="track.zcid"/>
<s:hidden name="czgzhj" value="%{#request.czgzhj}"/>
<s:hidden name="zcIds"/>
<s:hidden name="xmIds"/>
<s:set name="biaodanid" value="track.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<tr>
		<td class="td_zxy01">买受人：</td>
		<td class="td_zxy02"><s:textfield name="track.xyzrmsr" id="xyzrmsr" cssClass="input" maxlength="50"  size="30" /></td>
		<td class="td_zxy01">转让金额（元）：</td>
		<td class="td_zxy02"><s:textfield name="track.xyzrje" id="xyzrje" cssClass="input" maxlength="15" size="30"  onblur="checkFloat(this);"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">协议扫描件：</td>
		<td class="td_zxy02"  cospan="3"><e:filebutton fjlx="xyzrsmj" biaodanId="%{#request.biaodanid}" isview="Y"/></td>
	</tr>
</table>
<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td align="right"><input type="button" value="确定" onclick="save();"/></td>
	</tr>
</table>
</s:form>
</body>
</html>
