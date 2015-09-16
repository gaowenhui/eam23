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
<title>采购中介机构</title>
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
		<td class="td_zxy01">产权交易所名称：</td>
		<td class="td_zxy02"><s:textfield name="track.gpcqjysmc" id="gpcqjysmc" cssClass="input" maxlength="50"  size="30" /></td>
		<td class="td_zxy01">评估价（元）：</td>
		<td class="td_zxy02"><s:textfield name="track.gppgj" id="gppgj" cssClass="input" maxlength="15" size="30" onblur="checkFloat(this);" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">合同：</td>
		<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="jysgphetong" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
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
