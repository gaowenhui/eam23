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
<title>挂牌阶段</title>
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
// 日期转换
	$(function(){
		$("#gpqsrq,#gpjsrq,#cgpmsj").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
	});
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
	<tr>
		<td class="td_zxy01">挂牌起始日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.track.gpqsrq}" format="yyyy-MM-dd" var="draftDate1"/>
			<s:textfield name="track.gpqsrq" id="gpqsrq"  cssClass="input" maxlength="50"  value="%{#draftDate1}"  size="15" readonly="true"/></td>		
		<td class="td_zxy01">挂牌结束日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.track.gpjsrq}" format="yyyy-MM-dd" var="draftDate2"/>
			<s:textfield name="track.gpjsrq" id="gpjsrq"  cssClass="input" maxlength="50"  value="%{#draftDate2}"  size="15" readonly="true"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">挂牌是否成功：</td>
		<td class="td_zxy02" nowrap="nowrap"><s:checkbox name="track.gpsfcg" id="gpsfcg"  onclick="clickCheckBox(this)"/>
		<span id="gpsfcg2"></span></td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr id="gpsfcg1" style="display:none">
		<td class="td_zxy01">意向买受人数：</td>
		<td class="td_zxy02"><s:textfield name="track.gpyxmsrs" id="gpyxmsrs" cssClass="input" maxlength="12"  size="12"  onblur="checkNumber(this);"/></td>
		<td class="td_zxy01">成交金额（元）：</td>
		<td class="td_zxy02"><s:textfield name="track.gpcgcjje" id="gpcgcjje"  cssClass="input" maxlength="15"  size="15"  onblur="checkFloat(this);"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">拍卖是否成功：</td>
		<td class="td_zxy02" nowrap="nowrap"><s:checkbox name="track.pmsfcg" id="pmsfcg"  onclick="clickCheckBox(this)"/>
		<span id="pmsfcg2"></span></td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr >
		<td colspan="4">
			<div>
				<table id="pmsfcg1" style="display:none" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
					<tr>
						<td class="td_zxy01">拍卖师：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpms" id="cgpms" cssClass="input" maxlength="15" size="30" /></td>
						<td class="td_zxy01">拍卖日期：</td>
						<td class="td_zxy02">
							<s:date name="%{#request.track.cgpmsj}" format="yyyy-MM-dd" var="draftDate"/>
							<s:textfield name="track.cgpmsj" id="cgpmsj"  cssClass="input"  value="%{#draftDate}"  maxlength="15" readonly="true"/></td>
					</tr>
					<tr>
						<td class="td_zxy01">拍卖地点：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmdd" id="cgpmdd" cssClass="input" maxlength="50"  size="12" /></td>
						<td class="td_zxy01">竞买人数：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmjmrs" id="cgpmjmrs"  cssClass="input" maxlength="10"  size="15" onblur="checkNumber(this);"/></td>
					</tr>
					<tr>
						<td class="td_zxy01">拍卖成交价（元）：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmcjj" id="cgpmcjj" cssClass="input" maxlength="15"  size="12" onblur="checkFloat(this);"/></td>
						<td class="td_zxy01">买受人：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmmsr" id="cgpmmsr"  cssClass="input" maxlength="16"  size="15"/></td>
					</tr>
					<tr>
						<td class="td_zxy01">佣金金额（元）：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmyjje" id="cgpmyjje" cssClass="input" maxlength="15"  size="12"  onblur="checkFloat(this);"/></td>
						<td class="td_zxy01">价款支付方式：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmjkzffs" id="cgpmjkzffs"  cssClass="input" maxlength="50"  size="15"/></td>
					</tr>
					<tr>
						<td class="td_zxy01">金额（元）：</td>
						<td class="td_zxy02"><s:textfield name="track.cgpmje" id="cgpmje" cssClass="input" maxlength="15"  size="12"  onblur="checkFloat(this);"/></td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<!-- 附件 -->
</table>
<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td align="right"><input type="button" value="确定" onclick="save();"/></td>
	</tr>
</table>
</s:form>
</body>
</html>
