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
<title>采购拍卖机构</title>
<script type="text/javascript">
$(function(){
		if("change"=="${sheettype}"){
			$("select,input").attr("disabled","disabled");
		}
})
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
		<td class="td_zxy01">拍卖机构名称：</td>
		<td class="td_zxy02"><s:textfield name="track.gkpmjgmc" id="gkpmjgmc" cssClass="input" maxlength="15"  size="30" /></td>
		<td class="td_zxy01">是否在中国建投中介库：</td>
		<td class="td_zxy02"><s:checkbox name="track.gkpmsfzjtzjk" id="gkpmsfzjtzjk" onclick="clickCheckBox(this)"/>
		<span id="gkpmsfzjtzjk2"></span>
		</td>
	</tr>
	<tr id="gkpmsfzjtzjk1" style="display:none">
		<td class="td_zxy01">不在中介库原因：</td>
		<td class="td_zxy02" colspan="3"><s:textarea name="track.gkpmbzzjkyy" id="gkpmbzzjkyy" cssClass="input"  rows="3" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">保留价（元）：</td>
		<td class="td_zxy02"><s:textfield name="track.gkpmblj" id="gkpmblj" cssClass="input" maxlength="15" size="30"  onblur="checkFloat(this);"/></td>
		<td class="td_zxy01">保留价是否允许下浮：</td>
		<td class="td_zxy02"><s:checkbox name="track.gkpmbljsfyxxf" id="gkpmbljsfyxxf"  onclick="clickCheckBox(this)"/>
		<span id="gkpmbljsfyxxf2"></span>
		</td>
	</tr>
	<tr id="gkpmbljsfyxxf1" style="display:none">
		<td class="td_zxy01">允许下浮次数：</td>
		<td class="td_zxy02"><s:textfield name="track.gkpmyxxfcs" id="gkpmyxxfcs" cssClass="input" maxlength="12"  size="12"  onblur="checkNumber(this);"/></td>
		<td class="td_zxy01">每次下浮幅度：</td>
		<td class="td_zxy02"><s:textfield name="track.gkpmmcxffd" id="gkpmmcxffd"  cssClass="input" maxlength="15"  size="15"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">拍卖合同：</td>
		<td class="td_zxy02"><e:filebutton fjlx="paimaihetong" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
		
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
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
