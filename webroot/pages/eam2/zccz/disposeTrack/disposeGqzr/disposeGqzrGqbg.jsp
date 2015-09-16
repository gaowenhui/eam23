<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>权属变更</title>
<script type="text/javascript">
function clickCheckBox(obj){
	var id = obj.id;
	var isChecked = obj.checked;
	if(isChecked){
		document.getElementById(id+'1').style.display = "block";
		document.getElementById(id+'2').innerText="是";
	}else{
		document.getElementById(id+'1').style.display = "none";
		document.getElementById(id+'2').innerText="否";
		var inputs = document.getElementById(id+'1').getElementsByTagName('input');
		for(var i=0;i<inputs.length;i++){
			if(inputs[i].type=="text"){
				document.getElementById(inputs[i].id).value="";
			}
		}
		var textareas = document.getElementById(id+'1').getElementsByTagName('textarea');
		for(var j=0;j<textareas.length;j++){
			document.getElementById(textareas[j].id).value="";
		}
	}
}		
$(function(){
//document.getElementById("gkpmsfzjtzjk").checked = true;
	var s = document.getElementsByTagName("input");
	for(var i=0;i<s.length;i++){
		var type = s[i].type;
		if(type =="checkbox"){
			var isChecked = s[i].checked;
			var id = s[i].id;
			if(isChecked){
				document.getElementById(id+'1').style.display = "block";
				document.getElementById(id+'2').innerText="是";
			}else{
				document.getElementById(id+'2').innerText="否";
			}
		}
	}
});	
function save(){
	var url = "<%=request.getContextPath()%>/zccz/disposeTrack_saveTrack.do";
	myform.action = url;
	myform.submit();
}		
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form name="myform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
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
		<td class="td_zxy01">是否完成股权变更：</td>
		<td class="td_zxy02" nowrap="nowrap"><s:checkbox name="track.gqsfwcbg" id="gqsfwcbg" onclick="clickCheckBox(this)"/>
		<span id="gqsfwcbg2"></span></td>
		
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
</table>
<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr  id="gqsfwcbg1" style="display:none">
		<td class="td_zxy01">工商证明材料：</td>
		<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="gongshangzhengming" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
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
