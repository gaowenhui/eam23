<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/zccz/checkJS.inc" %>
<%
	String wcgpmcishu = (String)request.getAttribute("wcgpmcishu");
	int cishu = Integer.parseInt(wcgpmcishu);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>现场拍卖</title>
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
		document.getElementById("weichenggongpai").style.display = "none";
		document.getElementById("chenggongpai").style.display = "block";
		document.getElementById(id+'1').style.display = "block";
		document.getElementById(id+'2').style.display = "none";
		document.getElementById(id+'6').innerText="是";
	}else{
		if(confirm("确认变更为不成功吗？")){
			var inputs = document.getElementById("pmsfcg1").getElementsByTagName('input');
			for(var i=0;i<inputs.length;i++){
				if(inputs[i].type=="text"){
					document.getElementById(inputs[i].id).value="";
				}
			}
			document.getElementById("weichenggongpai").style.display = "block";
			document.getElementById("chenggongpai").style.display = "none";
			document.getElementById(id+'1').style.display = "none";
			document.getElementById(id+'6').innerText="否";
		}else{
			obj.checked = true;
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
				document.getElementById(id+'6').innerText="是";
			}else{
				document.getElementById(id+'6').innerText="否";
			}
		}
	}
});	
// 日期转换
	$(function(){
		$("#pmwcgpmsj,#cgpmsj").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
	});	
function paimai(cishu){
	for(var i=1;i<4;i++){
		if(i==cishu){
			document.getElementById("fujian"+cishu).style.display = "block";
		}else{
			document.getElementById("fujian"+i).style.display = "none";
		}
	}
	document.getElementById("pmsfcg2").style.display = "block";
	document.getElementById("pmsfcg1").style.display = "none";
	var url = "<%=request.getContextPath()%>/zccz/disposeTrack_getPmxx.do";
	$.post(url,{cishu :"" + cishu + "",
				trackId :"" + document.getElementById("trackId").value + "",
				zcIds:"" + document.getElementById("zcIds").value + ""
				}, function(data){
				var adjunct = eval('(' + data + ')');
				document.getElementById("pmwcgpmsj").value = adjunct.pmwcgpmsj;
				document.getElementById("pmwcgpmdd").value = adjunct.pmwcgpmdd;
				document.getElementById("pmwcgjmrs").value = adjunct.pmwcgjmrs;
				document.getElementById("pmwcgjmzgj").value = adjunct.pmwcgjmzgj;
				document.getElementById("pmwcgblj").value = adjunct.pmwcgblj;
				document.getElementById("fsxxlx").value = adjunct.fsxxlx;
				document.getElementById("adjunctTrackId").value = adjunct.trackid;
				document.getElementById("adjunctPmwcgcs").value = adjunct.pmwcgcs;
				document.getElementById("adjunctId").value = adjunct.id;
	});
}
function save(){
	var url = "<%=request.getContextPath()%>/zccz/disposeTrack_saveTrack.do";
	myform.action = url;
	myform.submit();
}
function weichenggongpai(obj){
	for(var i=1;i<4;i++){
		if(i==obj){
			document.getElementById("fujian"+obj).style.display = "block";
		}else{
			document.getElementById("fujian"+i).style.display = "none";
		}
	}
	var inputs = document.getElementById("pmsfcg2").getElementsByTagName('input');
	for(var i=0;i<inputs.length;i++){
		if(inputs[i].type=="text"){
			document.getElementById(inputs[i].id).value="";
		}
	}
	document.getElementById("fsxxlx").value = "";
	document.getElementById("adjunctTrackId").value = "";
	document.getElementById("adjunctPmwcgcs").value = "";
	document.getElementById("adjunctId").value = "";
	if(document.getElementById("pmsfcg").checked==true){
		chenggongpai();
		return true;
	}
	document.getElementById("pmsfcg2").style.display = "block";
	document.getElementById("pmsfcg1").style.display = "none";
}
function chenggongpai(){
	document.getElementById("pmsfcg1").style.display = "block";
	document.getElementById("pmsfcg2").style.display = "none";
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form name="myform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
<s:hidden name="track.id" id="trackId"/>
<s:hidden name="track.czgzfs" id="czgzfs"/>
<s:hidden name="track.czgzhj" />
<s:hidden name="track.xmid"/>
<s:hidden name="track.zcid"/>
<s:hidden name="czgzhj" value="%{#request.czgzhj}"/>
<s:hidden name="zcIds"/>
<s:hidden name="xmIds"/>
<s:hidden name="adjunct.id" id="adjunctId"/>
<s:hidden name="adjunct.trackid" id="adjunctTrackId"/>
<s:hidden name="adjunct.fsxxlx" id="fsxxlx"/>
<s:hidden name="adjunct.pmwcgcs" id="adjunctPmwcgcs"/>
<s:hidden name="pmwcgcs" id="pmwcgcs"/>
<s:set name="biaodanid" value="track.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<tr>
		<td class="td_zxy01">拍卖是否成功：</td>
		<td class="td_zxy02" nowrap="nowrap">
			<%if(cishu==3){ %>	
				<s:checkbox name="track.pmsfcg" id="pmsfcg" disabled="true"/>&nbsp;是
			<%}else{ %>
				<s:checkbox name="track.pmsfcg" id="pmsfcg" onclick="clickCheckBox(this)"/>
				<span id="pmsfcg6"></span>
			<%} %>
		</td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td align="left" nowrap="nowrap">
			<%for(int i=0;i<cishu;i++){ %>
				<input type="button" value="第<%=(i+1)==1?"一":(i+1)==2?"二":"三" %>次拍卖情况" onclick="paimai(<%=i+1 %>)"/>
			<%} %>
			<%if(cishu<3){%>
				<tt style="display:block" id="weichenggongpai">
				<input type="button" value="第<%=(cishu+1)==1?"一":(cishu+1)==2?"二":"三" %>次拍卖情况" name="weichenggongpai1" id="weichenggongpai1" onclick="weichenggongpai('<%=cishu+1 %>')"/>
				</tt>
				<tt style="display:none" id="chenggongpai">
				<input type="button" value="第<%=(cishu+1)==1?"一":(cishu+1)==2?"二":"三" %>次拍卖情况" name="chenggongpai1" id="chenggongpai1" onclick="chenggongpai()"/></tt>
			<%}%>
		</td>
	</tr>
</table>
<table id="pmsfcg1" style="display:none" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">拍卖师：</td>
		<td class="td_zxy02"><s:textfield name="track.cgpms" id="cgpms" cssClass="input" maxlength="15" size="30" /></td>
		<td class="td_zxy01">拍卖日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.track.cgpmsj}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="track.cgpmsj" id="cgpmsj"  cssClass="input" maxlength="15" readonly="true"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">拍卖地点：</td>
		<td class="td_zxy02"><s:textfield name="track.cgpmdd" id="cgpmdd" cssClass="input" maxlength="50"  size="12" /></td>
		<td class="td_zxy01">竞买人数：</td>
		<td class="td_zxy02"><s:textfield name="track.cgpmjmrs" id="cgpmjmrs"  cssClass="input" maxlength="10"  size="15"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">拍卖成交价（元）：</td>
		<td class="td_zxy02"><s:textfield name="track.cgpmcjj" id="cgpmcjj" cssClass="input" maxlength="15"  size="12"  onblur="checkFloat(this);"/></td>
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
		<td class="td_zxy01">拍卖是否成功：</td>
		<td class="td_zxy02">&nbsp;是</td>
	</tr>
	<tr>
		<td colspan="4">
			<div>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
					<tr>
						<td class="td_zxy01">拍卖报告：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="cgpmbg" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
					<tr>
						<td class="td_zxy01">拍卖录像：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="cgpmlx" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
					<tr>
						<td class="td_zxy01">成交确认书：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="cgcjqrs" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
					<tr>
						<td class="td_zxy01">其他附件：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="cgqtfj" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
				</table>			
			</div>
		</td>
	</tr>
</table>
<br>
<table id="pmsfcg2" style="display:none" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">拍卖日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.track.cgpmsj}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="adjunct.pmwcgpmsj" id="pmwcgpmsj"  cssClass="input" maxlength="15" readonly="true"/></td>
		<td class="td_zxy01">拍卖是否成功：</td>
		<td class="td_zxy02">&nbsp;否</td>
	</tr>
	<tr>
		<td class="td_zxy01">拍卖地点：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.pmwcgpmdd" id="pmwcgpmdd" cssClass="input" maxlength="50"  size="12" /></td>
		<td class="td_zxy01">竞买人数：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.pmwcgjmrs" id="pmwcgjmrs"  cssClass="input" maxlength="10"  size="15"/></td>
	</tr>
	<tr>
		<td class="td_zxy01">竞买最高价（元）：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.pmwcgjmzgj" id="pmwcgjmzgj" cssClass="input" maxlength="15"  size="12"  onblur="checkFloat(this);" /></td>
		<td class="td_zxy01">保留价（元）：</td>
		<td class="td_zxy02"><s:textfield name="adjunct.pmwcgblj" id="pmwcgblj"  cssClass="input" maxlength="16"  size="15"  onblur="checkFloat(this);"/></td>
	</tr>
	<tr id="fujian1">
		<td colspan="4">
			<div>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
					<tr>
						<td class="td_zxy01">拍卖报告：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="bcgpmbg1" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
					<tr>
						<td class="td_zxy01">拍卖录像：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="bcgpmlx1" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
				</table>			
			</div>
		</td>
	</tr>
	<tr id="fujian2">
		<td colspan="4">
			<div>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
					<tr>
						<td class="td_zxy01">拍卖报告：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="bcgpmbg2" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
					<tr>
						<td class="td_zxy01">拍卖录像：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="bcgpmlx2" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
				</table>			
			</div>
		</td>
	</tr>
	<tr id="fujian3">
		<td colspan="4">
			<div>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
					<tr>
						<td class="td_zxy01">拍卖报告：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="bcgpmbg3" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
					<tr>
						<td class="td_zxy01">拍卖录像：</td>
						<td class="td_zxy03"  colspan="3"><e:filebutton fjlx="bcgpmlx3" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
					</tr>
				</table>			
			</div>
		</td>
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
