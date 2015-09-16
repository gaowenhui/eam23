<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/zccz/checkJS.inc" %>
<%
String fsxxlx = (String)request.getAttribute("fsxxlx");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>附属信息</title>
<script type="text/javascript">
//$(function(){
//	var fsxxlx = '${fsxxlx}';
//	var obj = document.getElementById(fsxxlx);
//	obj.style.display="block";
//});	
function save(){
	var xmIds = document.getElementById("xmIds").value;
	var url = "<%=request.getContextPath()%>/zccz/disposeTrack_saveAdjunct.do";
	myform.action = url;
	window.name = "mywindow";
	myform.submit();
}
// 日期转换
	$(function(){
		$("#hksj").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
	});
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
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<base target="_self">
<s:form name="myform" target="mywindow">
<s:hidden name="xmIds"/>
<s:hidden name="zcIds"/>
<s:hidden name="fysrmx.jieduan"/>
<s:hidden name="fysrmx.id"/>
<s:hidden name="fysrmx.xmId"/>
<s:hidden name="fysrmx.azcid"/>
<s:hidden name="trackId" id="trackId"/>
<s:hidden name="fsxxlx" id="fsxxlx"/>
<s:hidden name="adjunct.fsxxlx"/>
<s:hidden name="adjunct.trackid"/>
<s:hidden name="adjunct.id" id="adjunctId"/>
<s:hidden name="czAzryXx.id" id="azryId"/>
<s:set name="biaodanid" value="czAzryXx.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<%if("skjn".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">税类名称：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.ghslmc" id="ghslmc"  cssClass="input" maxlength="50"  size="15"/></td>
		<td class="td_zxy01">金额（元）：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.ghslje" id="ghslje"  cssClass="input" maxlength="15"  size="15"  onblur="checkFloat(this);"/></td>
	</tr>
	<%}else if("lsxx".equals(fsxxlx)){ %><tr>
		<td class="td_zxy01">律师姓名：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.lsxm" id="lsxm"  cssClass="input" maxlength="50"  size="15"/></td>
		<td class="td_zxy01">联系方式：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.lxfs" id="lxfs"  cssClass="input" maxlength="15"  size="15"/></td>
	</tr>
	<%}else if("fyjn".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">费用种类：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.ghfymc" id="ghfymc"  cssClass="input" maxlength="50"  size="15"/></td>
		<td class="td_zxy01">金额（元）：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.ghfyje" id="ghfyje"  cssClass="input" maxlength="15"  size="15" onblur="checkFloat(this);"/></td>
	</tr>
	<%}else if("hkhs".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">回款日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.fysrmx.hksj}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="fysrmx.hksj" id="hksj"  cssClass="input" maxlength="50" value="%{#draftDate}" size="15" readonly="true"/></td>
		<td class="td_zxy01">金额（元）：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.hkje" id="hkje"  cssClass="input" maxlength="15"  size="15"  onblur="checkFloat(this);"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">费用（元）：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.hkzfyje" id="hkzfyje"  cssClass="input" maxlength="50"  size="15"  onblur="checkFloat(this);"/></td>
		<td class="td_zxy01">收入（元）：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.hkzsrje" id="hkzsrje"  cssClass="input" maxlength="15"  size="15"  onblur="checkFloat(this);"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">付款人：</td>
		<td class="td_zxy02"><s:textfield name="fysrmx.fkr" id="fkr"  cssClass="input" maxlength="50"  size="15"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">备注：</td>
		<td class="td_zxy02" colspan="3"><s:textarea name="fysrmx.beizhu" id="beizhu" cssClass="input"  rows="3" /></td>
	</tr>
	<%}else if("zxqk".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">录入日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.adjunct.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="adjunct.lrrq" id="lrrq"  cssClass="input" maxlength="50" value="%{#draftDate}" size="15" readonly="true"/></td>
		<td class="td_zxy01">录入人：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.lrr" id="lrr"  cssClass="input" maxlength="15"  size="15" readonly="true" />
		<s:hidden name="adjunct.lrrbh" id="lrrbh"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">执行情况：</td>
		<td class="td_zxy02" colspan="3"><s:textarea name="adjunct.zxqk" id="zxqk" cssClass="input"  rows="5" /></td>
	</tr>
	<%}else if("qsxz".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">姓名：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.qsxzryxm" id="qsxzryxm"  cssClass="input" maxlength="50"  size="15"/></td>
		<td class="td_zxy01">联系方式：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.qsxzrylxfs" id="qsxzrylxfs"  cssClass="input" maxlength="50"  size="15"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">工作单位：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.qsxzrygzdw" id="qsxzrygzdw"  cssClass="input" maxlength="50"  size="15"/></td>
	</tr>
	<%} else if("fyzf".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">实际安置费用：</td>
		<td class="td_zxy02"><s:textfield name="czAzryXx.fsjazfy" id="fsjazfy" cssClass="input" maxlength="16"  size="15" onblur="checkFloat(this);"/></td>
		<td class="td_zxy01">是否签署收条：</td>
		<td class="td_zxy02"><s:checkbox name="czAzryXx.azrysfqsst" id="azrysfqsst" onclick="clickCheckBox(this)"/>
		<span id="azrysfqsst2"></span></td>
		
	</tr>
	<tr id="azrysfqsst1" style="display:none">
		<td colspan="4">
			<div>
			<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
				<tr>
					<td class="td_zxy01">收条：</td>
					<td class="td_zxy03"><e:filebutton fjlx="shoutiao" biaodanId="%{#request.biaodanid}" isview="Y" isSingle="Y"/></td>
				</tr>
				<tr >
					<td class="td_zxy01">无法上传收条情况：</td>
					<td class="td_zxy03"><s:textarea name="czAzryXx.azrystqsqkms" id="azrystqsqkms" cssClass="input"  rows="3" /></td>
				</tr>
			</table>
			</div>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">是否发生仲裁：</td>
		<td class="td_zxy02"><s:checkbox name="czAzryXx.azrysffszc" id="azrysffszc" onclick="clickCheckBox(this)"/>
		<span id="azrysffszc2"></span></td>
	</tr>
	<tr id="azrysffszc1" style="display:none">
		<td class="td_zxy01">仲裁机构：</td>
		<td class="td_zxy02"><s:textfield name="czAzryXx.azryzcjg" id="azryzcjg" cssClass="input" maxlength="100"  size="12" /></td>
		<td class="td_zxy01">仲裁结果：</td>
		<td class="td_zxy02"><s:textfield name="czAzryXx.azryzcjieguo" id="azryzcjieguo"  cssClass="input" maxlength="100"  size="15"/></td>
	</tr>	
	<%} else if("jcldht".equals(fsxxlx)){ %>
	<tr>
		<td class="td_zxy01">是否签署安置协议：</td>
		<td class="td_zxy02"><s:checkbox name="czAzryXx.azrysfqsazxy" id="azrysfqsazxy" onclick="clickCheckBox(this)"/>
		<span id="azrysfqsazxy2"></span></td>
	</tr>
	<tr id="azrysfqsazxy1" style="display:none">
		<td colspan="4">
			<table  width="100%" border="0" align="center"   cellspacing="0" class="newtable">
				<tr>
					<td class="td_zxy01">安置协议：</td>
					<td class="td_zxy03"><e:filebutton fjlx="anzhixieyi" biaodanId="%{#request.biaodanid}" isview="Y" isSingle="Y"/></td>
				</tr>
				<tr >
					<td class="td_zxy01">无法上传安置协议情况：</td>
					<td class="td_zxy03"><s:textarea name="czAzryXx.azryxyqsqkms" id="azryxyqsqkms" cssClass="input"  rows="3" /></td>
				</tr>
			</table>
		<br><br></td>
	</tr>	
	<%} %>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr align="center">
		<td align="center"><input type="button" value="确定" onclick="save();"/></td>
	</tr>
</table>
</s:form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if("${message}" != "") {
		alert("${message}"); 
		window.parent.dialogArguments.reloadJqGrid();
		window.close();
	}
</SCRIPT>